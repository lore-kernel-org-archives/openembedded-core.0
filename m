Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1R8idT-0002na-Ls
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 03:08:32 +0200
Received: from mail-fx0-f52.google.com ([209.85.161.52])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 27 Sep 2011 18:03:03 -0700
Received: by fxe23 with SMTP id 23so75916fxe.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2011 18:03:02 -0700 (PDT)
Received: by 10.223.28.72 with SMTP id l8mr2840108fac.137.1317171782276;
	Tue, 27 Sep 2011 18:03:02 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id o22sm25399007fab.11.2011.09.27.18.02.59
	(version=SSLv3 cipher=OTHER); Tue, 27 Sep 2011 18:03:01 -0700 (PDT)
Message-ID: <4E827242.2030703@intel.com>
Date: Tue, 27 Sep 2011 18:02:58 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <fd038ffaa07466c14dc983049a9a99989d33be9b.1317094542.git.raj.khem@gmail.com>
	<2d1632c2b19963e3dc625522d1284ce6262c2492.1317094542.git.raj.khem@gmail.com>
	<4E825740.4080609@intel.com>
	<CAMKF1sonKcofEmxWGdY7cS5gPyYMCTKG9q9CE9siCEY=ae9S+g@mail.gmail.com>
In-Reply-To: <CAMKF1sonKcofEmxWGdY7cS5gPyYMCTKG9q9CE9siCEY=ae9S+g@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] eglibc: Add recipes for 2.14
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Sep 2011 01:08:32 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/27/2011 05:17 PM, Khem Raj wrote:
> On Tue, Sep 27, 2011 at 4:07 PM, Saul Wold<saul.wold@intel.com>  wrote:
>> On 09/26/2011 08:39 PM, Khem Raj wrote:
>>>
>>> Backport Fedora patch to enable sunrpc as it was in 2.13
>>> Fix cross-localedef-native to be able to build from eglibc 2.14 branch
>>>
>>> Tested builds/boot of angstrom/console-image on qemu for
>>> arm,mips,ppc,i386,x86_64
>>>
>>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>> ---
>>>   .../eglibc/cross-localedef-native_2.14.bb          |   44 ++
>>>   .../eglibc/eglibc-2.14/IO-acquire-lock-fix.patch   |   17 +
>>>   .../eglibc-2.14/armv4-eabi-compile-fix.patch       |   25 +
>>>   .../eglibc-2.14/eglibc-rpc-export-again.patch      |   69 +++
>>>   .../eglibc-svn-arm-lowlevellock-include-tls.patch  |   21 +
>>>   .../eglibc/eglibc-2.14/generate-supported.mk       |   11 +
>>>   .../eglibc/eglibc-2.14/ld-search-order.patch       |   56 ++
>>>   .../eglibc/eglibc-2.14/mips-rld-map-check.patch    |   26 +
>>>   .../eglibc/eglibc-2.14/multilib_readlib.patch      |   17 +
>>>   .../recipes-core/eglibc/eglibc-2.14/ppc-sqrt.patch |  538
>>> ++++++++++++++++++++
>>>   .../eglibc-2.14/shorten-build-commands.patch       |   82 +++
>>>   .../eglibc/eglibc-2.14/stack-protector-test.patch  |   35 ++
>>>   meta/recipes-core/eglibc/eglibc-initial_2.14.bb    |    6 +
>>>   meta/recipes-core/eglibc/eglibc-locale_2.14.bb     |    1 +
>>>   meta/recipes-core/eglibc/eglibc_2.14.bb            |  219 ++++++++
>>>   15 files changed, 1167 insertions(+), 0 deletions(-)
>>>   create mode 100644
>>> meta/recipes-core/eglibc/cross-localedef-native_2.14.bb
>>>   create mode 100644
>>> meta/recipes-core/eglibc/eglibc-2.14/IO-acquire-lock-fix.patch
>>>   create mode 100644
>>> meta/recipes-core/eglibc/eglibc-2.14/armv4-eabi-compile-fix.patch
>>>   create mode 100644
>>> meta/recipes-core/eglibc/eglibc-2.14/eglibc-rpc-export-again.patch
>>>   create mode 100644
>>> meta/recipes-core/eglibc/eglibc-2.14/eglibc-svn-arm-lowlevellock-include-tls.patch
>>>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/etc/ld.so.conf
>>>   create mode 100644
>>> meta/recipes-core/eglibc/eglibc-2.14/generate-supported.mk
>>>   create mode 100644
>>> meta/recipes-core/eglibc/eglibc-2.14/ld-search-order.patch
>>>   create mode 100644
>>> meta/recipes-core/eglibc/eglibc-2.14/mips-rld-map-check.patch
>>>   create mode 100644
>>> meta/recipes-core/eglibc/eglibc-2.14/multilib_readlib.patch
>>>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/ppc-sqrt.patch
>>>   create mode 100644
>>> meta/recipes-core/eglibc/eglibc-2.14/shorten-build-commands.patch
>>>   create mode 100644
>>> meta/recipes-core/eglibc/eglibc-2.14/stack-protector-test.patch
>>>   create mode 100644 meta/recipes-core/eglibc/eglibc-initial_2.14.bb
>>>   create mode 100644 meta/recipes-core/eglibc/eglibc-locale_2.14.bb
>>>   create mode 100644 meta/recipes-core/eglibc/eglibc_2.14.bb
>>>
>>
>> Khem,
>>
>> This one seems to have had a problem on mips, when I built it on the
>> Autobuilder, I get the following failure:
>> checking for ld --version-script... no
>> | *** WARNING: You should not compile GNU libc without versioning. Not using
>> | *** versioning will introduce incompatibilities so that old binaries
>> | *** will not run anymore.
>> | *** For versioning you need recent binutils (binutils-2.8.1.0.23 or
>> newer).
>> | checking for .previous assembler directive... yes
>> | checking for .protected and .hidden assembler directive... yes
>> | checking whether __attribute__((visibility())) is supported... yes
>> | checking for broken __attribute__((visibility()))... no
>> | checking for broken __attribute__((alias()))... no
>> | checking whethERROR: Function 'do_configure' failed (see
>> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips-poky-linux/eglibc-2.13-r17+svnr14157/temp/log.do_configure.1476
>
> this here tells me that its compiling eglibc 2.13 not 2.14
> did you change EGLIBCVERSION to 2.14 in
> meta/conf/distro/include/tcmode-default.inc ?
>
Nope, that might be my problem, so something is getting hosed around for 
mips because everything else is building OK.  Maybe it's one of the 
compiler changes or does that need tcmode changes also?

Sau!


> I have been building angstrom/systemd-gnome-image with all the patches
> I posted on that branch
> for all architectures without any failures.
>
>> for further information)
>> | er to put _rtld_local into .sdata section... yes
>> | checking for .preinit_array/.init_array/.fini_array support... no
>> | configure: error: Need linker with .init_array/.fini_array support.
>> | ERROR: oe_runconf failed
>>
>> You can see this at:
>> http://autobuilder.yoctoproject.org:8010/builders/nightly-mips/builds/88/steps/shell_42/logs/stdio
>>
>> Sau!
>>
>>
>>
>>
>>
>>



