Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1R8grB-0000me-8h
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 01:14:34 +0200
Received: from mail-wy0-f180.google.com ([74.125.82.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 27 Sep 2011 16:07:59 -0700
Received: by wyh11 with SMTP id 11so5931624wyh.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2011 16:07:58 -0700 (PDT)
Received: by 10.227.55.20 with SMTP id s20mr8766012wbg.15.1317164868610;
	Tue, 27 Sep 2011 16:07:48 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id fr18sm37934330wbb.9.2011.09.27.16.07.46
	(version=SSLv3 cipher=OTHER); Tue, 27 Sep 2011 16:07:47 -0700 (PDT)
Message-ID: <4E825740.4080609@intel.com>
Date: Tue, 27 Sep 2011 16:07:44 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <fd038ffaa07466c14dc983049a9a99989d33be9b.1317094542.git.raj.khem@gmail.com>
	<2d1632c2b19963e3dc625522d1284ce6262c2492.1317094542.git.raj.khem@gmail.com>
In-Reply-To: <2d1632c2b19963e3dc625522d1284ce6262c2492.1317094542.git.raj.khem@gmail.com>
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
X-List-Received-Date: Tue, 27 Sep 2011 23:14:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/26/2011 08:39 PM, Khem Raj wrote:
> Backport Fedora patch to enable sunrpc as it was in 2.13
> Fix cross-localedef-native to be able to build from eglibc 2.14 branch
>
> Tested builds/boot of angstrom/console-image on qemu for arm,mips,ppc,i386,x86_64
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   .../eglibc/cross-localedef-native_2.14.bb          |   44 ++
>   .../eglibc/eglibc-2.14/IO-acquire-lock-fix.patch   |   17 +
>   .../eglibc-2.14/armv4-eabi-compile-fix.patch       |   25 +
>   .../eglibc-2.14/eglibc-rpc-export-again.patch      |   69 +++
>   .../eglibc-svn-arm-lowlevellock-include-tls.patch  |   21 +
>   .../eglibc/eglibc-2.14/generate-supported.mk       |   11 +
>   .../eglibc/eglibc-2.14/ld-search-order.patch       |   56 ++
>   .../eglibc/eglibc-2.14/mips-rld-map-check.patch    |   26 +
>   .../eglibc/eglibc-2.14/multilib_readlib.patch      |   17 +
>   .../recipes-core/eglibc/eglibc-2.14/ppc-sqrt.patch |  538 ++++++++++++++++++++
>   .../eglibc-2.14/shorten-build-commands.patch       |   82 +++
>   .../eglibc/eglibc-2.14/stack-protector-test.patch  |   35 ++
>   meta/recipes-core/eglibc/eglibc-initial_2.14.bb    |    6 +
>   meta/recipes-core/eglibc/eglibc-locale_2.14.bb     |    1 +
>   meta/recipes-core/eglibc/eglibc_2.14.bb            |  219 ++++++++
>   15 files changed, 1167 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-core/eglibc/cross-localedef-native_2.14.bb
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/IO-acquire-lock-fix.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/armv4-eabi-compile-fix.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/eglibc-rpc-export-again.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/eglibc-svn-arm-lowlevellock-include-tls.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/etc/ld.so.conf
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/generate-supported.mk
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/ld-search-order.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/mips-rld-map-check.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/multilib_readlib.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/ppc-sqrt.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/shorten-build-commands.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/stack-protector-test.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-initial_2.14.bb
>   create mode 100644 meta/recipes-core/eglibc/eglibc-locale_2.14.bb
>   create mode 100644 meta/recipes-core/eglibc/eglibc_2.14.bb
>

Khem,

This one seems to have had a problem on mips, when I built it on the 
Autobuilder, I get the following failure:
checking for ld --version-script... no
| *** WARNING: You should not compile GNU libc without versioning. Not using
| *** versioning will introduce incompatibilities so that old binaries
| *** will not run anymore.
| *** For versioning you need recent binutils (binutils-2.8.1.0.23 or 
newer).
| checking for .previous assembler directive... yes
| checking for .protected and .hidden assembler directive... yes
| checking whether __attribute__((visibility())) is supported... yes
| checking for broken __attribute__((visibility()))... no
| checking for broken __attribute__((alias()))... no
| checking whethERROR: Function 'do_configure' failed (see 
/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips-poky-linux/eglibc-2.13-r17+svnr14157/temp/log.do_configure.1476 
for further information)
| er to put _rtld_local into .sdata section... yes
| checking for .preinit_array/.init_array/.fini_array support... no
| configure: error: Need linker with .init_array/.fini_array support.
| ERROR: oe_runconf failed

You can see this at:
http://autobuilder.yoctoproject.org:8010/builders/nightly-mips/builds/88/steps/shell_42/logs/stdio

Sau!







