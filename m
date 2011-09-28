Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R8io1-0002vW-L3
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 03:19:26 +0200
Received: by gyg8 with SMTP id 8so6941465gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2011 18:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=ZQDsQp2p/zsK5i+tnMUR14kYeYqLi7wiwPmTsiVLM6U=;
	b=cDxVjK0FJpY+E0uCQ/at/GIfdRnn83RC/y2xCAO2kHIT83b6FG1xNoe2dDWh+s1p3k
	gJj7CG2arautPmCV3GRZftWWKluI3uePh7zsPdvNgy5AZVM87wUjTngY25pB109ttmLl
	mElWeAoHiS/CUkEjV8NX5wumb4u/IPPv5B57U=
Received: by 10.68.31.199 with SMTP id c7mr2140281pbi.73.1317172438087; Tue,
	27 Sep 2011 18:13:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.42.98 with HTTP; Tue, 27 Sep 2011 18:13:28 -0700 (PDT)
In-Reply-To: <4E827242.2030703@intel.com>
References: <fd038ffaa07466c14dc983049a9a99989d33be9b.1317094542.git.raj.khem@gmail.com>
	<2d1632c2b19963e3dc625522d1284ce6262c2492.1317094542.git.raj.khem@gmail.com>
	<4E825740.4080609@intel.com>
	<CAMKF1sonKcofEmxWGdY7cS5gPyYMCTKG9q9CE9siCEY=ae9S+g@mail.gmail.com>
	<4E827242.2030703@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Sep 2011 18:13:28 -0700
Message-ID: <CAMKF1soGHw1bVLuSr5ObW1JdBLsdpr+jcHCn8ziyJUYS-bHZkw@mail.gmail.com>
To: Saul Wold <saul.wold@intel.com>
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
X-List-Received-Date: Wed, 28 Sep 2011 01:19:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 27, 2011 at 6:02 PM, Saul Wold <saul.wold@intel.com> wrote:
> On 09/27/2011 05:17 PM, Khem Raj wrote:
>>
>> On Tue, Sep 27, 2011 at 4:07 PM, Saul Wold<saul.wold@intel.com> =C2=A0wr=
ote:
>>>
>>> On 09/26/2011 08:39 PM, Khem Raj wrote:
>>>>
>>>> Backport Fedora patch to enable sunrpc as it was in 2.13
>>>> Fix cross-localedef-native to be able to build from eglibc 2.14 branch
>>>>
>>>> Tested builds/boot of angstrom/console-image on qemu for
>>>> arm,mips,ppc,i386,x86_64
>>>>
>>>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>>> ---
>>>> =C2=A0.../eglibc/cross-localedef-native_2.14.bb =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| =C2=A0 44 ++
>>>> =C2=A0.../eglibc/eglibc-2.14/IO-acquire-lock-fix.patch =C2=A0 | =C2=A0=
 17 +
>>>> =C2=A0.../eglibc-2.14/armv4-eabi-compile-fix.patch =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 25 +
>>>> =C2=A0.../eglibc-2.14/eglibc-rpc-export-again.patch =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 69 +++
>>>> =C2=A0.../eglibc-svn-arm-lowlevellock-include-tls.patch =C2=A0| =C2=A0=
 21 +
>>>> =C2=A0.../eglibc/eglibc-2.14/generate-supported.mk =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 11 +
>>>> =C2=A0.../eglibc/eglibc-2.14/ld-search-order.patch =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 56 ++
>>>> =C2=A0.../eglibc/eglibc-2.14/mips-rld-map-check.patch =C2=A0 =C2=A0| =
=C2=A0 26 +
>>>> =C2=A0.../eglibc/eglibc-2.14/multilib_readlib.patch =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 17 +
>>>> =C2=A0.../recipes-core/eglibc/eglibc-2.14/ppc-sqrt.patch | =C2=A0538
>>>> ++++++++++++++++++++
>>>> =C2=A0.../eglibc-2.14/shorten-build-commands.patch =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 82 +++
>>>> =C2=A0.../eglibc/eglibc-2.14/stack-protector-test.patch =C2=A0| =C2=A0=
 35 ++
>>>> =C2=A0meta/recipes-core/eglibc/eglibc-initial_2.14.bb =C2=A0 =C2=A0| =
=C2=A0 =C2=A06 +
>>>> =C2=A0meta/recipes-core/eglibc/eglibc-locale_2.14.bb =C2=A0 =C2=A0 | =
=C2=A0 =C2=A01 +
>>>> =C2=A0meta/recipes-core/eglibc/eglibc_2.14.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0219 ++++++++
>>>> =C2=A015 files changed, 1167 insertions(+), 0 deletions(-)
>>>> =C2=A0create mode 100644
>>>> meta/recipes-core/eglibc/cross-localedef-native_2.14.bb
>>>> =C2=A0create mode 100644
>>>> meta/recipes-core/eglibc/eglibc-2.14/IO-acquire-lock-fix.patch
>>>> =C2=A0create mode 100644
>>>> meta/recipes-core/eglibc/eglibc-2.14/armv4-eabi-compile-fix.patch
>>>> =C2=A0create mode 100644
>>>> meta/recipes-core/eglibc/eglibc-2.14/eglibc-rpc-export-again.patch
>>>> =C2=A0create mode 100644
>>>>
>>>> meta/recipes-core/eglibc/eglibc-2.14/eglibc-svn-arm-lowlevellock-inclu=
de-tls.patch
>>>> =C2=A0create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/etc/ld.s=
o.conf
>>>> =C2=A0create mode 100644
>>>> meta/recipes-core/eglibc/eglibc-2.14/generate-supported.mk
>>>> =C2=A0create mode 100644
>>>> meta/recipes-core/eglibc/eglibc-2.14/ld-search-order.patch
>>>> =C2=A0create mode 100644
>>>> meta/recipes-core/eglibc/eglibc-2.14/mips-rld-map-check.patch
>>>> =C2=A0create mode 100644
>>>> meta/recipes-core/eglibc/eglibc-2.14/multilib_readlib.patch
>>>> =C2=A0create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/ppc-sqrt=
.patch
>>>> =C2=A0create mode 100644
>>>> meta/recipes-core/eglibc/eglibc-2.14/shorten-build-commands.patch
>>>> =C2=A0create mode 100644
>>>> meta/recipes-core/eglibc/eglibc-2.14/stack-protector-test.patch
>>>> =C2=A0create mode 100644 meta/recipes-core/eglibc/eglibc-initial_2.14.=
bb
>>>> =C2=A0create mode 100644 meta/recipes-core/eglibc/eglibc-locale_2.14.b=
b
>>>> =C2=A0create mode 100644 meta/recipes-core/eglibc/eglibc_2.14.bb
>>>>
>>>
>>> Khem,
>>>
>>> This one seems to have had a problem on mips, when I built it on the
>>> Autobuilder, I get the following failure:
>>> checking for ld --version-script... no
>>> | *** WARNING: You should not compile GNU libc without versioning. Not
>>> using
>>> | *** versioning will introduce incompatibilities so that old binaries
>>> | *** will not run anymore.
>>> | *** For versioning you need recent binutils (binutils-2.8.1.0.23 or
>>> newer).
>>> | checking for .previous assembler directive... yes
>>> | checking for .protected and .hidden assembler directive... yes
>>> | checking whether __attribute__((visibility())) is supported... yes
>>> | checking for broken __attribute__((visibility()))... no
>>> | checking for broken __attribute__((alias()))... no
>>> | checking whethERROR: Function 'do_configure' failed (see
>>>
>>> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/bu=
ild/tmp/work/mips-poky-linux/eglibc-2.13-r17+svnr14157/temp/log.do_configur=
e.1476
>>
>> this here tells me that its compiling eglibc 2.13 not 2.14
>> did you change EGLIBCVERSION to 2.14 in
>> meta/conf/distro/include/tcmode-default.inc ?
>>
> Nope, that might be my problem, so something is getting hosed around for
> mips because everything else is building OK. =C2=A0Maybe it's one of the =
compiler
> changes or does that need tcmode changes also?

compiler does not need version change. I am not sure whats going on there
its cross binutils thats not installed properly and thats why the test
is failing

Did u try a build from scratch ?

>
> Sau!
>
>
>> I have been building angstrom/systemd-gnome-image with all the patches
>> I posted on that branch
>> for all architectures without any failures.
>>
>>> for further information)
>>> | er to put _rtld_local into .sdata section... yes
>>> | checking for .preinit_array/.init_array/.fini_array support... no
>>> | configure: error: Need linker with .init_array/.fini_array support.
>>> | ERROR: oe_runconf failed
>>>
>>> You can see this at:
>>>
>>> http://autobuilder.yoctoproject.org:8010/builders/nightly-mips/builds/8=
8/steps/shell_42/logs/stdio
>>>
>>> Sau!
>>>
>>>
>>>
>>>
>>>
>>>
>
>


