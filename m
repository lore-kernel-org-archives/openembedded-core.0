Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 33CE778840
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 10:38:44 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id a75so5612761itd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 02:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/VNMnuv2XRdNnpbUDfguHoPJi4mDJFgWjjVV1pCyblw=;
	b=wvxTAgpzIQ2weA7bPJ3GJyoWpsaH9yvfTNifKWV+opxvDNjckK6TnYmxDH6ISHN7gt
	L95dICsbZLWcT9j/KAEeRLqaQYgnhjdCyuVtaH4ui5L2ZgmSxiqh0r6WJom5Z8Mrr5ca
	AIgA6bOJ0gWlg2RlZssg2J2fveNyYiJud5bV0+KYoyQPfC6jx7r2FcmZPccdB2R1jFsj
	1utebllmE/0KBI9TTl/uX40KfYhQB6BzT5ltm9Sq1BZdodNzSknX+bjiQE71jB2Li+D7
	aCBOF0IsribGtVrkORTT4AKeXnvF66rHIAaPPN4YLYu/IzIesFODcQspU2FavjhwMdpZ
	7TKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/VNMnuv2XRdNnpbUDfguHoPJi4mDJFgWjjVV1pCyblw=;
	b=nClmv4zre7yZ7FeTwG/8H5UJeTV0In8s4a0/f65qid77f6794OCkfcwps9hE5JI4Fs
	oqrnE9CZdA7+21XPkoRvrILHhY/uQ6hpNFaSXfGvmog/k+s6gp9Jejg2M0bQV0xGOb7d
	Xm8iK5nBkZpcCxO9JoQCnP2EIiAyYzfhmZXg5YTLGN+v0wWGZcLnGt9ONbK3S5hTzuQv
	QzSm0HO0dVD1kHG1jrVYSDqpPapFPWZMUKwDi0Z+II1bsYFgfMqMTnYVPM2+8rRTjzTR
	sPJ85ASx5Rifo9txu4CM394qAFvGt4EgYI3Sd9YxaMu5E/0zUOzotOlLwT/+2AW9CIyp
	gxgg==
X-Gm-Message-State: APf1xPAi0saxcpDavX8pD0CULt1c0AaKT/jhhys2a+Z9xnQ/dmZqaZeq
	9CVzNTqZFKnohGoqUKXPyc4UCl5jmNJZpRDCghHXz6RD
X-Google-Smtp-Source: AH8x22766g16pDWfw4MLkx8PqVZlZKyhnJiHeX1AOcL6RCzW661GR/4St6jEjDbxLMHfMDjYRNP73wi/mO2i9uu4WLA=
X-Received: by 10.36.144.68 with SMTP id x65mr23555198itd.60.1519123125508;
	Tue, 20 Feb 2018 02:38:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Tue, 20 Feb 2018 02:38:24 -0800 (PST)
In-Reply-To: <CAJTo0Lb5cJuird8Wck8N4WM4MD252r+3HcO-surbEFSvk+XJrw@mail.gmail.com>
References: <20180208173509.24194-1-raj.khem@gmail.com>
	<CAMKF1sqAaVJfKx0vjEwaHNWJuHnyv36H=Vm2BKQms9iMb5itGw@mail.gmail.com>
	<CAJTo0Lb5cJuird8Wck8N4WM4MD252r+3HcO-surbEFSvk+XJrw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Feb 2018 10:38:24 +0000
Message-ID: <CAJTo0LY76cssGU8gopFaFz_nN-Q5xT=5Y7Jk0wD80Mo+7-YiOQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] binutils: Upgrade to 2.30 release
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Feb 2018 10:38:45 -0000
Content-Type: multipart/alternative; boundary="94eb2c07e806445f800565a26a74"

--94eb2c07e806445f800565a26a74
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ah yes, aarch64.

Lots of errors like this when building glibc 2.26:

| /usr/src/debug/glibc/2.26-r0/git/elf/dl-lookup.c:287:(.text+0x82fc):
relocation truncated to fit: R_AARCH64_LD64_GOT_LO12_NC against symbol
`free' defined in .text section in
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm64/build/build/tm=
p/work/aarch64-poky-linux/glibc/2.26-r0/build-aarch64-poky-linux/elf/librtl=
d.os

|
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm64/build/build/tm=
p/work/aarch64-poky-linux/glibc/2.26-r0/recipe-sysroot-native/usr/bin/aarch=
64-poky-linux.gcc-cross-initial-aarch64/../../libexec/aarch64-poky-linux.gc=
c-cross-initial-aarch64/gcc/aarch64-poky-linux/7.3.0/ld:
BFD (GNU Binutils) 2.30.0.20180208 assertion fail
../../bfd/elfnn-aarch64.c:4386

|
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm64/build/build/tm=
p/work/aarch64-poky-linux/glibc/2.26-r0/build-aarch64-poky-linux/elf/librtl=
d.os:(.
data.rel.ro+0x310): dangerous relocation: unsupported relocation

https://autobuilder.yocto.io/builders/nightly-arm64/builds/758/steps/BuildI=
mages/logs/stdio

Apart from that the AB was entirely green.

Ross

On 20 February 2018 at 01:06, Burton, Ross <ross.burton@intel.com> wrote:

> Can't remember if this failed anywhere that wasn't related to the glibc
> upgrade, so I just fired this patch standalone on the autobuilder.
>
> Ross
>
> On 16 February 2018 at 03:03, Khem Raj <raj.khem@gmail.com> wrote:
>
>> ping
>>
>> On Thu, Feb 8, 2018 at 9:35 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> > Additionally cherry-pick
>> >
>> > 5ffeba4a09 Revert "PowerPC PLT speculative execution barriers"
>> > b01452b1d4 [PR22764][LD][AARCH64]Allow R_AARCH64_ABS16 and
>> R_AARCH64_ABS32 against absolution symbol or undefine symbol in shared
>> object.
>> > a985e9b9de Import patch from mainline to remove PROVODE qualifiers
>> around definitions of __CTOR_LIST__ and __DTOR_LIST__ in PE linker scrip=
ts.
>> > eec4607fc5 Add support for DWARF-4 line number tables.
>> >
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > ---
>> > Changes since v1:
>> >
>> > - Backport fixes for aarch64 relocs
>> > - ppc plt fix, dwarf-4 line number support and linker script fix for
>> removing PROVODE
>> >
>> >  meta/conf/distro/include/tcmode-default.inc        |  2 +-
>> >  .../{binutils-2.29.1.inc =3D> binutils-2.30.inc}     |  2 +-
>> >  ...n_2.29.1.bb =3D> binutils-cross-canadian_2.30.bb} |  0
>> >  ...tils-cross_2.29.1.bb =3D> binutils-cross_2.30.bb} |  0
>> >  ...rosssdk_2.29.1.bb =3D> binutils-crosssdk_2.30.bb} |  0
>> >  ...nutils-crosssdk-Generate-relocatable-SDKs.patch | 14 ++---
>> >  ...oss-Do-not-generate-linker-script-directo.patch |  6 +-
>> >  ...ure-widen-the-regexp-for-SH-architectures.patch | 14 ++---
>> >  .../0004-Point-scripts-location-to-libdir.patch    |  8 +--
>> >  ...te-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch | 10 ++--
>> >  .../binutils/binutils/0006-Use-libtool-2.4.patch   | 66
>> ++++++++------------
>> >  ...7-Add-the-armv5e-architecture-to-binutils.patch |  8 +--
>> >  ...he-distro-compiler-point-to-the-wrong-ins.patch |  6 +-
>> >  ...es-of-system-directories-when-cross-linki.patch | 24 ++++----
>> >  ...-rpath-in-libtool-when-sysroot-is-enabled.patch |  4 +-
>> >  ...Change-default-emulation-for-mips64-linux.patch | 14 ++---
>> >  .../0012-Add-support-for-Netlogic-XLP.patch        | 70
>> +++++++++++-----------
>> >  ...ncorrect-assembling-for-ppc-wait-mnemonic.patch | 10 ++--
>> >  .../binutils/0014-Detect-64-bit-MIPS-targets.patch |  6 +-
>> >  .../0015-sync-with-OE-libtool-changes.patch        |  4 +-
>> >  .../{binutils_2.29.1.bb =3D> binutils_2.30.bb}       |  0
>> >  21 files changed, 127 insertions(+), 141 deletions(-)
>> >  rename meta/recipes-devtools/binutils/{binutils-2.29.1.inc =3D>
>> binutils-2.30.inc} (97%)
>> >  rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.
>> 29.1.bb =3D> binutils-cross-canadian_2.30.bb} (100%)
>> >  rename meta/recipes-devtools/binutils/{binutils-cross_2.29.1.bb =3D>
>> binutils-cross_2.30.bb} (100%)
>> >  rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.29.1.bb =
=3D>
>> binutils-crosssdk_2.30.bb} (100%)
>> >  rename meta/recipes-devtools/binutils/{binutils_2.29.1.bb =3D>
>> binutils_2.30.bb} (100%)
>> >
>> > diff --git a/meta/conf/distro/include/tcmode-default.inc
>> b/meta/conf/distro/include/tcmode-default.inc
>> > index da45642440..037d331605 100644
>> > --- a/meta/conf/distro/include/tcmode-default.inc
>> > +++ b/meta/conf/distro/include/tcmode-default.inc
>> > @@ -24,7 +24,7 @@ PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
>> >
>> >  GCCVERSION ?=3D "7.%"
>> >  SDKGCCVERSION ?=3D "${GCCVERSION}"
>> > -BINUVERSION ?=3D "2.29%"
>> > +BINUVERSION ?=3D "2.30%"
>> >  GDBVERSION ?=3D "8.0%"
>> >  LINUXLIBCVERSION ?=3D "4.14%"
>> >  GLIBCVERSION ?=3D "2.27%"
>> > diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
>> b/meta/recipes-devtools/binutils/binutils-2.30.inc
>> > similarity index 97%
>> > rename from meta/recipes-devtools/binutils/binutils-2.29.1.inc
>> > rename to meta/recipes-devtools/binutils/binutils-2.30.inc
>> > index 07a72e2b5a..9c883acc52 100644
>> > --- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
>> > +++ b/meta/recipes-devtools/binutils/binutils-2.30.inc
>> > @@ -18,7 +18,7 @@ BINUPV =3D "${@binutils_branch_version(d)}"
>> >
>> >  UPSTREAM_CHECK_GITTAGREGEX =3D "binutils-(?P<pver>\d+_(\d_?)*)"
>> >
>> > -SRCREV ?=3D "90276f15379d380761fc499da2ba24cfb3c12a94"
>> > +SRCREV ?=3D "caa839fba66600a6c36d3639906ed9110b79c307"
>> >  BINUTILS_GIT_URI ?=3D "git://sourceware.org/git/binu
>> tils-gdb.git;branch=3Dbinutils-${BINUPV}-branch;protocol=3Dgit
>> <http://sourceware.org/git/binutils-gdb.git;branch=3Dbinutils-$%7BBINUPV=
%7D-branch;protocol=3Dgit>
>> "
>> >  SRC_URI =3D "\
>> >       ${BINUTILS_GIT_URI} \
>> > diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.
>> 29.1.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.30.bb
>> > similarity index 100%
>> > rename from meta/recipes-devtools/binutils/
>> binutils-cross-canadian_2.29.1.bb
>> > rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.30.
>> bb
>> > diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.29.1.bb
>> b/meta/recipes-devtools/binutils/binutils-cross_2.30.bb
>> > similarity index 100%
>> > rename from meta/recipes-devtools/binutils/binutils-cross_2.29.1.bb
>> > rename to meta/recipes-devtools/binutils/binutils-cross_2.30.bb
>> > diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.29.1.b=
b
>> b/meta/recipes-devtools/binutils/binutils-crosssdk_2.30.bb
>> > similarity index 100%
>> > rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.29.1.bb
>> > rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.30.bb
>> > diff --git a/meta/recipes-devtools/binutils/binutils/0001-binutils-
>> crosssdk-Generate-relocatable-SDKs.patch b/meta/recipes-devtools/binuti
>> ls/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
>> > index 0b515d83c7..2df836057d 100644
>> > --- a/meta/recipes-devtools/binutils/binutils/0001-binutils-
>> crosssdk-Generate-relocatable-SDKs.patch
>> > +++ b/meta/recipes-devtools/binutils/binutils/0001-binutils-
>> crosssdk-Generate-relocatable-SDKs.patch
>> > @@ -1,4 +1,4 @@
>> > -From 58ac9f95a3d83c29efaf7a8906fb6aefea8c8e79 Mon Sep 17 00:00:00 200=
1
>> > +From 2e1b5e24a6759de7f73aa6060a574848d9131b5a Mon Sep 17 00:00:00 200=
1
>> >  From: Khem Raj <raj.khem@gmail.com>
>> >  Date: Mon, 2 Mar 2015 01:58:54 +0000
>> >  Subject: [PATCH 01/15] binutils-crosssdk: Generate relocatable SDKs
>> > @@ -18,7 +18,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >   2 files changed, 5 insertions(+), 2 deletions(-)
>> >
>> >  diff --git a/ld/genscripts.sh b/ld/genscripts.sh
>> > -index b6940d376d..a42c4d7a4b 100755
>> > +index 8732422b3a..1f257e99ca 100755
>> >  --- a/ld/genscripts.sh
>> >  +++ b/ld/genscripts.sh
>> >  @@ -277,6 +277,7 @@ DATA_ALIGNMENT_u=3D"${DATA_ALIGN
>> MENT_u-${DATA_ALIGNMENT_r}}"
>> > @@ -37,16 +37,16 @@ index b6940d376d..a42c4d7a4b 100755
>> >   ( echo "/* Script for ld -Ur: link w/out relocation, do create
>> constructors */"
>> >     . ${CUSTOMIZER_SCRIPT}
>> >     . ${srcdir}/scripttempl/${SCRIPT_NAME}.sc
>> > - ) | sed -e '/^ *$/d;s/[       ]*$//' > ldscripts/${EMULATION_NAME}.x=
u
>> > + ) | sed -e '/^ *$/d;s/[        ]*$//' > ldscripts/${EMULATION_NAME}.=
xu
>> >  +unset PARTIAL_LINKING
>> >
>> > - LD_FLAG=3D
>> >   DATA_ALIGNMENT=3D${DATA_ALIGNMENT_}
>> > + RELOCATING=3D" "
>> >  diff --git a/ld/scripttempl/elf.sc b/ld/scripttempl/elf.sc
>> > -index d9138bc059..e48faeca43 100644
>> > +index 9787ab5dac..0c8a93c2c8 100644
>> >  --- a/ld/scripttempl/elf.sc
>> >  +++ b/ld/scripttempl/elf.sc
>> > -@@ -138,8 +138,8 @@ if test -z "$DATA_SEGMENT_ALIGN"; then
>> > +@@ -139,8 +139,8 @@ if test -z "$DATA_SEGMENT_ALIGN"; then
>> >       DATA_SEGMENT_RELRO_END=3D". =3D DATA_SEGMENT_RELRO_END
>> (${SEPARATE_GOTPLT-0}, .);"
>> >     fi
>> >   fi
>> > @@ -58,5 +58,5 @@ index d9138bc059..e48faeca43 100644
>> >   if test -z "$PLT"; then
>> >     IPLT=3D".iplt         ${RELOCATING-0} : { *(.iplt) }"
>> >  --
>> > -2.14.0
>> > +2.16.1
>> >
>> > diff --git a/meta/recipes-devtools/binutils/binutils/0002-binutils-
>> cross-Do-not-generate-linker-script-directo.patch
>> b/meta/recipes-devtools/binutils/binutils/0002-binutils-
>> cross-Do-not-generate-linker-script-directo.patch
>> > index 370333d5d0..bac7fb2d1a 100644
>> > --- a/meta/recipes-devtools/binutils/binutils/0002-binutils-
>> cross-Do-not-generate-linker-script-directo.patch
>> > +++ b/meta/recipes-devtools/binutils/binutils/0002-binutils-
>> cross-Do-not-generate-linker-script-directo.patch
>> > @@ -1,4 +1,4 @@
>> > -From 8f929c616208351d0971d7dfd7574d48d3144603 Mon Sep 17 00:00:00 200=
1
>> > +From 58ddf38fa53abb48b69dd76e398c73451ad1a5eb Mon Sep 17 00:00:00 200=
1
>> >  From: Khem Raj <raj.khem@gmail.com>
>> >  Date: Mon, 6 Mar 2017 23:37:05 -0800
>> >  Subject: [PATCH 02/15] binutils-cross: Do not generate linker script
>> > @@ -23,7 +23,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >   1 file changed, 23 deletions(-)
>> >
>> >  diff --git a/ld/genscripts.sh b/ld/genscripts.sh
>> > -index a42c4d7a4b..d727b4d07e 100755
>> > +index 1f257e99ca..1583b73a2b 100755
>> >  --- a/ld/genscripts.sh
>> >  +++ b/ld/genscripts.sh
>> >  @@ -189,29 +189,6 @@ append_to_lib_path()
>> > @@ -57,5 +57,5 @@ index a42c4d7a4b..d727b4d07e 100755
>> >     libs=3D${NATIVE_LIB_DIRS}
>> >     if [ "x${NATIVE}" =3D "xyes" ] ; then
>> >  --
>> > -2.14.0
>> > +2.16.1
>> >
>> > diff --git a/meta/recipes-devtools/binutils/binutils/0003-configure-
>> widen-the-regexp-for-SH-architectures.patch
>> b/meta/recipes-devtools/binutils/binutils/0003-configure-
>> widen-the-regexp-for-SH-architectures.patch
>> > index b6c09ccf19..306afe7018 100644
>> > --- a/meta/recipes-devtools/binutils/binutils/0003-configure-
>> widen-the-regexp-for-SH-architectures.patch
>> > +++ b/meta/recipes-devtools/binutils/binutils/0003-configure-
>> widen-the-regexp-for-SH-architectures.patch
>> > @@ -1,4 +1,4 @@
>> > -From e5a806aae02a10290c71deb72f6294c98068368d Mon Sep 17 00:00:00 200=
1
>> > +From 5089be88f670bcadf7db0e778894f900b2c05d7b Mon Sep 17 00:00:00 200=
1
>> >  From: Khem Raj <raj.khem@gmail.com>
>> >  Date: Mon, 2 Mar 2015 01:07:33 +0000
>> >  Subject: [PATCH 03/15] configure: widen the regexp for SH architectur=
es
>> > @@ -14,12 +14,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >   2 files changed, 6 insertions(+), 1 deletion(-)
>> >
>> >  diff --git a/configure b/configure
>> > -index be9dd89d9b..d8af155ab5 100755
>> > +index 2d615a9996..c4ad45c06c 100755
>> >  --- a/configure
>> >  +++ b/configure
>> > -@@ -3844,7 +3844,7 @@ case "${target}" in
>> > -   or1k*-*-*)
>> > -     noconfigdirs=3D"$noconfigdirs gdb"
>> > +@@ -3835,7 +3835,7 @@ case "${target}" in
>> > +   nvptx*-*-*)
>> > +     noconfigdirs=3D"$noconfigdirs target-libssp target-libstdc++-v3
>> target-libobjc"
>> >       ;;
>> >  -  sh-*-*)
>> >  +  sh*-*-* | sh64-*-*)
>> > @@ -27,7 +27,7 @@ index be9dd89d9b..d8af155ab5 100755
>> >         sh*-*-elf)
>> >            ;;
>> >  diff --git a/gprof/configure b/gprof/configure
>> > -index e71fe8b9e4..679e0dce77 100755
>> > +index 1e25102976..6b43bf2b18 100755
>> >  --- a/gprof/configure
>> >  +++ b/gprof/configure
>> >  @@ -5874,6 +5874,11 @@ linux* | k*bsd*-gnu | kopensolaris*-gnu)
>> > @@ -43,5 +43,5 @@ index e71fe8b9e4..679e0dce77 100755
>> >     if echo __ELF__ | $CC -E - | $GREP __ELF__ > /dev/null; then
>> >       lt_cv_deplibs_check_method=3D'match_pattern
>> /lib[^/]+(\.so\.[0-9]+\.[0-9]+|_pic\.a)$'
>> >  --
>> > -2.14.0
>> > +2.16.1
>> >
>> > diff --git a/meta/recipes-devtools/binutils/binutils/0004-Point-script=
s-location-to-libdir.patch
>> b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts
>> -location-to-libdir.patch
>> > index 38eee30855..3e29c5815a 100644
>> > --- a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts
>> -location-to-libdir.patch
>> > +++ b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts
>> -location-to-libdir.patch
>> > @@ -1,4 +1,4 @@
>> > -From 3634ec3547bc0f8a5d1b8ad15365e2f836cda642 Mon Sep 17 00:00:00 200=
1
>> > +From a0e893ea094c48fa803046ffa89e31907aee0597 Mon Sep 17 00:00:00 200=
1
>> >  From: Khem Raj <raj.khem@gmail.com>
>> >  Date: Mon, 2 Mar 2015 01:09:58 +0000
>> >  Subject: [PATCH 04/15] Point scripts location to libdir
>> > @@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >   2 files changed, 2 insertions(+), 2 deletions(-)
>> >
>> >  diff --git a/ld/Makefile.am b/ld/Makefile.am
>> > -index 625347ff62..d5334d2681 100644
>> > +index 6243c12528..3c5d6c8202 100644
>> >  --- a/ld/Makefile.am
>> >  +++ b/ld/Makefile.am
>> >  @@ -57,7 +57,7 @@ endif
>> > @@ -25,7 +25,7 @@ index 625347ff62..d5334d2681 100644
>> >   EMUL =3D @EMUL@
>> >   EMULATION_OFILES =3D @EMULATION_OFILES@
>> >  diff --git a/ld/Makefile.in b/ld/Makefile.in
>> > -index ba251777b0..a2cf2282b5 100644
>> > +index 760c037f9d..6dea692869 100644
>> >  --- a/ld/Makefile.in
>> >  +++ b/ld/Makefile.in
>> >  @@ -446,7 +446,7 @@ AM_CFLAGS =3D $(WARN_CFLAGS) $(ELF_CLFAGS)
>> > @@ -38,5 +38,5 @@ index ba251777b0..a2cf2282b5 100644
>> >   BFDDIR =3D $(BASEDIR)/bfd
>> >   INCDIR =3D $(BASEDIR)/include
>> >  --
>> > -2.14.0
>> > +2.16.1
>> >
>> > diff --git a/meta/recipes-devtools/binutils/binutils/0005-Only-generat=
e
>> -an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
>> b/meta/recipes-devtools/binutils/binutils/0005-Only-generate
>> -an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
>> > index 59150a2e4d..2f49969371 100644
>> > --- a/meta/recipes-devtools/binutils/binutils/0005-Only-generate
>> -an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
>> > +++ b/meta/recipes-devtools/binutils/binutils/0005-Only-generate
>> -an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
>> > @@ -1,4 +1,4 @@
>> > -From 9d37c8f68c07da63186cb993f1221f6c11eca422 Mon Sep 17 00:00:00 200=
1
>> > +From 518abb195d0eb47d8eef581d7fd0a5fd9fa73f7d Mon Sep 17 00:00:00 200=
1
>> >  From: Khem Raj <raj.khem@gmail.com>
>> >  Date: Mon, 2 Mar 2015 01:27:17 +0000
>> >  Subject: [PATCH 05/15] Only generate an RPATH entry if LD_RUN_PATH is
>> not
>> > @@ -15,10 +15,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >   1 file changed, 4 insertions(+)
>> >
>> >  diff --git a/ld/emultempl/elf32.em b/ld/emultempl/elf32.em
>> > -index 9ac1840316..9dc4c149bc 100644
>> > +index c0925fc9b9..7d7670a89f 100644
>> >  --- a/ld/emultempl/elf32.em
>> >  +++ b/ld/emultempl/elf32.em
>> > -@@ -1463,6 +1463,8 @@ fragment <<EOF
>> > +@@ -1470,6 +1470,8 @@ fragment <<EOF
>> >               && command_line.rpath =3D=3D NULL)
>> >             {
>> >               path =3D (const char *) getenv ("LD_RUN_PATH");
>> > @@ -27,7 +27,7 @@ index 9ac1840316..9dc4c149bc 100644
>> >               if (path
>> >                   && gld${EMULATION_NAME}_search_needed (path, &n,
>> force))
>> >                 break;
>> > -@@ -1740,6 +1742,8 @@ gld${EMULATION_NAME}_before_allocation (void)
>> > +@@ -1750,6 +1752,8 @@ gld${EMULATION_NAME}_before_allocation (void)
>> >     rpath =3D command_line.rpath;
>> >     if (rpath =3D=3D NULL)
>> >       rpath =3D (const char *) getenv ("LD_RUN_PATH");
>> > @@ -37,5 +37,5 @@ index 9ac1840316..9dc4c149bc 100644
>> >     for (abfd =3D link_info.input_bfds; abfd; abfd =3D abfd->link.next=
)
>> >       if (bfd_get_flavour (abfd) =3D=3D bfd_target_elf_flavour)
>> >  --
>> > -2.14.0
>> > +2.16.1
>> >
>> > diff --git a/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-=
2.4.patch
>> b/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-2.4.patch
>> > index e87efe653b..333e2ee176 100644
>> > --- a/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-
>> 2.4.patch
>> > +++ b/meta/recipes-devtools/binutils/binutils/0006-Use-libtool-
>> 2.4.patch
>> > @@ -1,4 +1,4 @@
>> > -From 71c734bb3754319029dcfc898cedbade42274dcb Mon Sep 17 00:00:00 200=
1
>> > +From fad053cc59baa6277182b0fc90415a214060ba99 Mon Sep 17 00:00:00 200=
1
>> >  From: Khem Raj <raj.khem@gmail.com>
>> >  Date: Sun, 14 Feb 2016 17:04:07 +0000
>> >  Subject: [PATCH 06/15] Use libtool 2.4
>> > @@ -12,7 +12,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >   bfd/configure        | 1318 +++++++++++++++++------
>> >   bfd/configure.ac     |    2 +-
>> >   binutils/configure   | 1316 +++++++++++++++++------
>> > - configure            |    2 +-
>> >   gas/configure        | 1314 +++++++++++++++++------
>> >   gprof/configure      | 1321 +++++++++++++++++------
>> >   ld/configure         | 1691 +++++++++++++++++++++--------
>> > @@ -24,10 +23,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >   opcodes/configure    | 1318 +++++++++++++++++------
>> >   opcodes/configure.ac |    2 +-
>> >   zlib/configure       | 1316 +++++++++++++++++------
>> > - 15 files changed, 9927 insertions(+), 3694 deletions(-)
>> > + 14 files changed, 9926 insertions(+), 3693 deletions(-)
>> >
>> >  diff --git a/bfd/configure b/bfd/configure
>> > -index 48276594ed..3ece8943f3 100755
>> > +index 6c2b24ebe3..5fdd723b7f 100755
>> >  --- a/bfd/configure
>> >  +++ b/bfd/configure
>> >  @@ -672,6 +672,9 @@ OTOOL
>> > @@ -1931,7 +1930,7 @@ index 48276594ed..3ece8943f3 100755
>> >     chmod +x "$ofile"
>> >
>> >  diff --git a/bfd/configure.ac b/bfd/configure.ac
>> > -index 8fd03a7ea8..8816c3286c 100644
>> > +index 2342f3faea..a6451fccda 100644
>> >  --- a/bfd/configure.ac
>> >  +++ b/bfd/configure.ac
>> >  @@ -254,7 +254,7 @@ changequote(,)dnl
>> > @@ -1944,7 +1943,7 @@ index 8fd03a7ea8..8816c3286c 100644
>> >
>> >   # More hacks to build DLLs on Windows.
>> >  diff --git a/binutils/configure b/binutils/configure
>> > -index 22e1b1736e..321b63535b 100755
>> > +index 5d9c9105a7..a65b2b4518 100755
>> >  --- a/binutils/configure
>> >  +++ b/binutils/configure
>> >  @@ -659,8 +659,11 @@ OTOOL
>> > @@ -3841,21 +3840,8 @@ index 22e1b1736e..321b63535b 100755
>> >       (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
>> >     chmod +x "$ofile"
>> >
>> > -diff --git a/configure b/configure
>> > -index d8af155ab5..005ed827ab 100755
>> > ---- a/configure
>> > -+++ b/configure
>> > -@@ -3844,7 +3844,7 @@ case "${target}" in
>> > -   or1k*-*-*)
>> > -     noconfigdirs=3D"$noconfigdirs gdb"
>> > -     ;;
>> > --  sh*-*-* | sh64-*-*)
>> > -+  sh-*-* | sh64-*-*)
>> > -     case "${target}" in
>> > -       sh*-*-elf)
>> > -          ;;
>> >  diff --git a/gas/configure b/gas/configure
>> > -index 93afb20c8f..81dd4cbd97 100755
>> > +index fbac8f44d5..a40ac2144f 100755
>> >  --- a/gas/configure
>> >  +++ b/gas/configure
>> >  @@ -650,8 +650,11 @@ OTOOL
>> > @@ -5156,7 +5142,7 @@ index 93afb20c8f..81dd4cbd97 100755
>> >   int main ()
>> >   {
>> >     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
>> > -@@ -15436,13 +16089,20 @@ exeext=3D'`$ECHO "$exeext" | $SED
>> "$delay_single_quote_subst"`'
>> > +@@ -15437,13 +16090,20 @@ exeext=3D'`$ECHO "$exeext" | $SED
>> "$delay_single_quote_subst"`'
>> >   lt_unset=3D'`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>> >   lt_SP2NL=3D'`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>> >   lt_NL2SP=3D'`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
>> > @@ -5177,7 +5163,7 @@ index 93afb20c8f..81dd4cbd97 100755
>> >   STRIP=3D'`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>> >   RANLIB=3D'`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>> >   old_postinstall_cmds=3D'`$ECHO "$old_postinstall_cmds" | $SED
>> "$delay_single_quote_subst"`'
>> > -@@ -15457,14 +16117,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO
>> "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>> > +@@ -15458,14 +16118,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO
>> "$lt_cv_sys_global_symbol_pipe" | $SED "$de
>> >   lt_cv_sys_global_symbol_to_cdecl=3D'`$ECHO
>> "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
>> >   lt_cv_sys_global_symbol_to_c_name_address=3D'`$ECHO
>> "$lt_cv_sys_global_symbol_to_c_name_address" | $SED
>> "$delay_single_quote_subst"`'
>> >   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'`$ECHO
>> "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED
>> "$delay_single_quote_subst"`'
>> > @@ -5196,7 +5182,7 @@ index 93afb20c8f..81dd4cbd97 100755
>> >   DSYMUTIL=3D'`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>> >   NMEDIT=3D'`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>> >   LIPO=3D'`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
>> > -@@ -15497,12 +16160,12 @@ hardcode_shlibpath_var=3D'`$ECHO
>> "$hardcode_shlibpath_var" | $SED "$delay_single_q
>> > +@@ -15498,12 +16161,12 @@ hardcode_shlibpath_var=3D'`$ECHO
>> "$hardcode_shlibpath_var" | $SED "$delay_single_q
>> >   hardcode_automatic=3D'`$ECHO "$hardcode_automatic" | $SED
>> "$delay_single_quote_subst"`'
>> >   inherit_rpath=3D'`$ECHO "$inherit_rpath" | $SED
>> "$delay_single_quote_subst"`'
>> >   link_all_deplibs=3D'`$ECHO "$link_all_deplibs" | $SED
>> "$delay_single_quote_subst"`'
>> > @@ -5210,7 +5196,7 @@ index 93afb20c8f..81dd4cbd97 100755
>> >   file_list_spec=3D'`$ECHO "$file_list_spec" | $SED
>> "$delay_single_quote_subst"`'
>> >   variables_saved_for_relink=3D'`$ECHO "$variables_saved_for_relink" |
>> $SED "$delay_single_quote_subst"`'
>> >   need_lib_prefix=3D'`$ECHO "$need_lib_prefix" | $SED
>> "$delay_single_quote_subst"`'
>> > -@@ -15557,8 +16220,13 @@ reload_flag \
>> > +@@ -15558,8 +16221,13 @@ reload_flag \
>> >   OBJDUMP \
>> >   deplibs_check_method \
>> >   file_magic_cmd \
>> > @@ -5224,7 +5210,7 @@ index 93afb20c8f..81dd4cbd97 100755
>> >   STRIP \
>> >   RANLIB \
>> >   CC \
>> > -@@ -15568,12 +16236,14 @@ lt_cv_sys_global_symbol_pipe \
>> > +@@ -15569,12 +16237,14 @@ lt_cv_sys_global_symbol_pipe \
>> >   lt_cv_sys_global_symbol_to_cdecl \
>> >   lt_cv_sys_global_symbol_to_c_name_address \
>> >   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
>> > @@ -5240,7 +5226,7 @@ index 93afb20c8f..81dd4cbd97 100755
>> >   DSYMUTIL \
>> >   NMEDIT \
>> >   LIPO \
>> > -@@ -15589,7 +16259,6 @@ no_undefined_flag \
>> > +@@ -15590,7 +16260,6 @@ no_undefined_flag \
>> >   hardcode_libdir_flag_spec \
>> >   hardcode_libdir_flag_spec_ld \
>> >   hardcode_libdir_separator \
>> > @@ -5248,7 +5234,7 @@ index 93afb20c8f..81dd4cbd97 100755
>> >   exclude_expsyms \
>> >   include_expsyms \
>> >   file_list_spec \
>> > -@@ -15625,6 +16294,7 @@ module_cmds \
>> > +@@ -15626,6 +16295,7 @@ module_cmds \
>> >   module_expsym_cmds \
>> >   export_symbols_cmds \
>> >   prelink_cmds \
>> > @@ -5256,7 +5242,7 @@ index 93afb20c8f..81dd4cbd97 100755
>> >   postinstall_cmds \
>> >   postuninstall_cmds \
>> >   finish_cmds \
>> > -@@ -16389,7 +17059,8 @@ $as_echo X"$file" |
>> > +@@ -16390,7 +17060,8 @@ $as_echo X"$file" |
>> >   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>> >   #
>> >   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004,
>> 2005,
>> > @@ -5266,7 +5252,7 @@ index 93afb20c8f..81dd4cbd97 100755
>> >   #   Written by Gordon Matzigkeit, 1996
>> >   #
>> >   #   This file is part of GNU Libtool.
>> > -@@ -16492,19 +17163,42 @@ SP2NL=3D$lt_lt_SP2NL
>> > +@@ -16493,19 +17164,42 @@ SP2NL=3D$lt_lt_SP2NL
>> >   # turn newlines into spaces.
>> >   NL2SP=3D$lt_lt_NL2SP
>> >
>> > @@ -5310,7 +5296,7 @@ index 93afb20c8f..81dd4cbd97 100755
>> >   # A symbol stripping program.
>> >   STRIP=3D$lt_STRIP
>> >
>> > -@@ -16534,6 +17228,12 @@ global_symbol_to_c_name_addres
>> s=3D$lt_lt_cv_sys_global_symbol_to_c_name_address
>> > +@@ -16535,6 +17229,12 @@ global_symbol_to_c_name_addres
>> s=3D$lt_lt_cv_sys_global_symbol_to_c_name_address
>> >   # Transform the output of nm in a C name address pair when lib prefi=
x
>> is needed.
>> >   global_symbol_to_c_name_address_lib_prefix=3D$lt_lt_cv_sys_
>> global_symbol_to_c_name_address_lib_prefix
>> >
>> > @@ -5323,7 +5309,7 @@ index 93afb20c8f..81dd4cbd97 100755
>> >   # The name of the directory that contains temporary libtool files.
>> >   objdir=3D$objdir
>> >
>> > -@@ -16543,6 +17243,9 @@ MAGIC_CMD=3D$MAGIC_CMD
>> > +@@ -16544,6 +17244,9 @@ MAGIC_CMD=3D$MAGIC_CMD
>> >   # Must we lock files when doing compilation?
>> >   need_locks=3D$lt_need_locks
>> >
>> > @@ -5333,7 +5319,7 @@ index 93afb20c8f..81dd4cbd97 100755
>> >   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>> >   DSYMUTIL=3D$lt_DSYMUTIL
>> >
>> > -@@ -16657,12 +17360,12 @@ with_gcc=3D$GCC
>> > +@@ -16658,12 +17361,12 @@ with_gcc=3D$GCC
>> >   # Compiler flag to turn off builtin functions.
>> >   no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag
>> >
>> > @@ -5349,7 +5335,7 @@ index 93afb20c8f..81dd4cbd97 100755
>> >   # Compiler flag to prevent dynamic linking.
>> >   link_static_flag=3D$lt_lt_prog_compiler_static
>> >
>> > -@@ -16749,9 +17452,6 @@ inherit_rpath=3D$inherit_rpath
>> > +@@ -16750,9 +17453,6 @@ inherit_rpath=3D$inherit_rpath
>> >   # Whether libtool must link a program against all its dependency
>> libraries.
>> >   link_all_deplibs=3D$link_all_deplibs
>> >
>> > @@ -5359,7 +5345,7 @@ index 93afb20c8f..81dd4cbd97 100755
>> >   # Set to "yes" if exported symbols are required.
>> >   always_export_symbols=3D$always_export_symbols
>> >
>> > -@@ -16767,6 +17467,9 @@ include_expsyms=3D$lt_include_expsyms
>> > +@@ -16768,6 +17468,9 @@ include_expsyms=3D$lt_include_expsyms
>> >   # Commands necessary for linking programs (against libraries) with
>> templates.
>> >   prelink_cmds=3D$lt_prelink_cmds
>> >
>> > @@ -5369,7 +5355,7 @@ index 93afb20c8f..81dd4cbd97 100755
>> >   # Specify filename containing input files.
>> >   file_list_spec=3D$lt_file_list_spec
>> >
>> > -@@ -16799,210 +17502,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
>> > +@@ -16800,210 +17503,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
>> >     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>> >     # text mode, it properly converts lines to CR/LF.  This bash probl=
em
>> >     # is reportedly fixed, but why not run on old versions too?
>> > @@ -5744,7 +5730,7 @@ index 93afb20c8f..81dd4cbd97 100755
>> >     chmod +x "$ofile"
>> >
>> >  diff --git a/gprof/configure b/gprof/configure
>> > -index 679e0dce77..ac4c016a63 100755
>> > +index 6b43bf2b18..245ee48bc3 100755
>> >  --- a/gprof/configure
>> >  +++ b/gprof/configure
>> >  @@ -631,8 +631,11 @@ OTOOL
>> > @@ -7654,7 +7640,7 @@ index 679e0dce77..ac4c016a63 100755
>> >     chmod +x "$ofile"
>> >
>> >  diff --git a/ld/configure b/ld/configure
>> > -index d7f66f8cdc..4e71511bd1 100755
>> > +index 0cc6e8a50f..db8b998722 100755
>> >  --- a/ld/configure
>> >  +++ b/ld/configure
>> >  @@ -655,8 +655,11 @@ OTOOL
>> > @@ -17336,7 +17322,7 @@ index bf92b5e079..c573da90c5 100644
>> >   # These exist entirely to fool aclocal when bootstrapping libtool.
>> >   #
>> >  diff --git a/opcodes/configure b/opcodes/configure
>> > -index 17530f54b9..79b39611c2 100755
>> > +index 4f29887098..2127d39288 100755
>> >  --- a/opcodes/configure
>> >  +++ b/opcodes/configure
>> >  @@ -650,6 +650,9 @@ OTOOL
>> > @@ -19240,7 +19226,7 @@ index 17530f54b9..79b39611c2 100755
>> >     chmod +x "$ofile"
>> >
>> >  diff --git a/opcodes/configure.ac b/opcodes/configure.ac
>> > -index a9fbfd61f1..c43780f64d 100644
>> > +index b07f3f3629..5a32d9b1fc 100644
>> >  --- a/opcodes/configure.ac
>> >  +++ b/opcodes/configure.ac
>> >  @@ -167,7 +167,7 @@ changequote(,)dnl
>> > @@ -21153,5 +21139,5 @@ index dc2d9ed383..ed9a492f5c 100755
>> >     chmod +x "$ofile"
>> >
>> >  --
>> > -2.14.0
>> > +2.16.1
>> >
>> > diff --git a/meta/recipes-devtools/binutils/binutils/0007-Add-the-
>> armv5e-architecture-to-binutils.patch b/meta/recipes-devtools/binuti
>> ls/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch
>> > index 88019606f7..4a5127380f 100644
>> > --- a/meta/recipes-devtools/binutils/binutils/0007-Add-the-
>> armv5e-architecture-to-binutils.patch
>> > +++ b/meta/recipes-devtools/binutils/binutils/0007-Add-the-
>> armv5e-architecture-to-binutils.patch
>> > @@ -1,4 +1,4 @@
>> > -From 2b87aad1741bc481dd0982f100ad5ea7f937bb61 Mon Sep 17 00:00:00 200=
1
>> > +From 697903256e09533778baa8af66402c44d70219d9 Mon Sep 17 00:00:00 200=
1
>> >  From: Khem Raj <raj.khem@gmail.com>
>> >  Date: Mon, 2 Mar 2015 01:37:10 +0000
>> >  Subject: [PATCH 07/15] Add the armv5e architecture to binutils
>> > @@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >   1 file changed, 1 insertion(+)
>> >
>> >  diff --git a/gas/config/tc-arm.c b/gas/config/tc-arm.c
>> > -index a885efe4fc..735eaa7447 100644
>> > +index ec50420518..a25d1721af 100644
>> >  --- a/gas/config/tc-arm.c
>> >  +++ b/gas/config/tc-arm.c
>> > -@@ -25990,6 +25990,7 @@ static const struct arm_arch_option_table
>> arm_archs[] =3D
>> > +@@ -26195,6 +26195,7 @@ static const struct arm_arch_option_table
>> arm_archs[] =3D
>> >     ARM_ARCH_OPT ("armv4t",     ARM_ARCH_V4T,    FPU_ARCH_FPA),
>> >     ARM_ARCH_OPT ("armv4txm",   ARM_ARCH_V4TxM,  FPU_ARCH_FPA),
>> >     ARM_ARCH_OPT ("armv5",      ARM_ARCH_V5,     FPU_ARCH_VFP),
>> > @@ -31,5 +31,5 @@ index a885efe4fc..735eaa7447 100644
>> >     ARM_ARCH_OPT ("armv5txm",   ARM_ARCH_V5TxM,  FPU_ARCH_VFP),
>> >     ARM_ARCH_OPT ("armv5te",    ARM_ARCH_V5TE,   FPU_ARCH_VFP),
>> >  --
>> > -2.14.0
>> > +2.16.1
>> >
>> > diff --git a/meta/recipes-devtools/binutils/binutils/0008-don-t-let-
>> the-distro-compiler-point-to-the-wrong-ins.patch
>> b/meta/recipes-devtools/binutils/binutils/0008-don-t-let-
>> the-distro-compiler-point-to-the-wrong-ins.patch
>> > index 30a22b504f..939be67b58 100644
>> > --- a/meta/recipes-devtools/binutils/binutils/0008-don-t-let-
>> the-distro-compiler-point-to-the-wrong-ins.patch
>> > +++ b/meta/recipes-devtools/binutils/binutils/0008-don-t-let-
>> the-distro-compiler-point-to-the-wrong-ins.patch
>> > @@ -1,4 +1,4 @@
>> > -From 331443a87a31ec504e5652fc099d9129a9a4deb8 Mon Sep 17 00:00:00 200=
1
>> > +From 622d66634eb2e509d4126f5bdcab26de367241a1 Mon Sep 17 00:00:00 200=
1
>> >  From: Khem Raj <raj.khem@gmail.com>
>> >  Date: Mon, 2 Mar 2015 01:39:01 +0000
>> >  Subject: [PATCH 08/15] don't let the distro compiler point to the wro=
ng
>> > @@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >   1 file changed, 2 insertions(+), 1 deletion(-)
>> >
>> >  diff --git a/libiberty/Makefile.in b/libiberty/Makefile.in
>> > -index 25cfa29ad5..ce67a710e3 100644
>> > +index ed1b334c36..d4ffd8b57b 100644
>> >  --- a/libiberty/Makefile.in
>> >  +++ b/libiberty/Makefile.in
>> >  @@ -364,7 +364,8 @@ install-strip: install
>> > @@ -31,5 +31,5 @@ index 25cfa29ad5..ce67a710e3 100644
>> >         if test -n "${target_header_dir}"; then \
>> >                 ${mkinstalldirs} $(DESTDIR)$(libdir)/$(MULTIOSDIR); \
>> >  --
>> > -2.14.0
>> > +2.16.1
>> >
>> > diff --git a/meta/recipes-devtools/binutils/binutils/0009-warn-for-
>> uses-of-system-directories-when-cross-linki.patch
>> b/meta/recipes-devtools/binutils/binutils/0009-warn-for-
>> uses-of-system-directories-when-cross-linki.patch
>> > index e0e257880d..e75104722b 100644
>> > --- a/meta/recipes-devtools/binutils/binutils/0009-warn-for-
>> uses-of-system-directories-when-cross-linki.patch
>> > +++ b/meta/recipes-devtools/binutils/binutils/0009-warn-for-
>> uses-of-system-directories-when-cross-linki.patch
>> > @@ -1,4 +1,4 @@
>> > -From 0a4afdcf0700efd45963568e2d0049127cdf4434 Mon Sep 17 00:00:00 200=
1
>> > +From 27e38ee92c24fca86b1c3f6ef156a1892dd06bfd Mon Sep 17 00:00:00 200=
1
>> >  From: Khem Raj <raj.khem@gmail.com>
>> >  Date: Fri, 15 Jan 2016 06:31:09 +0000
>> >  Subject: [PATCH 09/15] warn for uses of system directories when cross
>> linking
>> > @@ -77,7 +77,7 @@ index a846743da6..df3cd5fb60 100644
>> >   #undef EXTRA_SHLIB_EXTENSION
>> >
>> >  diff --git a/ld/configure b/ld/configure
>> > -index 4e71511bd1..71c6ad1fd1 100755
>> > +index db8b998722..489ead5c13 100755
>> >  --- a/ld/configure
>> >  +++ b/ld/configure
>> >  @@ -789,6 +789,7 @@ with_lib_path
>> > @@ -118,7 +118,7 @@ index 4e71511bd1..71c6ad1fd1 100755
>> >   if test "${enable_gold+set}" =3D set; then :
>> >     enableval=3D$enable_gold; case "${enableval}" in
>> >  diff --git a/ld/configure.ac b/ld/configure.ac
>> > -index 00080f85fd..3aa98e37fb 100644
>> > +index bada1b50b0..d074a3820b 100644
>> >  --- a/ld/configure.ac
>> >  +++ b/ld/configure.ac
>> >  @@ -95,6 +95,16 @@ AC_SUBST(use_sysroot)
>> > @@ -139,10 +139,10 @@ index 00080f85fd..3aa98e37fb 100644
>> >   dnl "install_as_default" is set to false if gold is the default
>> linker.
>> >   dnl "installed_linker" is the installed BFD linker name.
>> >  diff --git a/ld/ld.h b/ld/ld.h
>> > -index c6fa1247f0..01c373498f 100644
>> > +index ba914b921e..9df17dab6c 100644
>> >  --- a/ld/ld.h
>> >  +++ b/ld/ld.h
>> > -@@ -174,6 +174,14 @@ typedef struct
>> > +@@ -180,6 +180,14 @@ typedef struct
>> >        in the linker script.  */
>> >     bfd_boolean force_group_allocation;
>> >
>> > @@ -158,10 +158,10 @@ index c6fa1247f0..01c373498f 100644
>> >     enum endian_enum endian;
>> >
>> >  diff --git a/ld/ld.texinfo b/ld/ld.texinfo
>> > -index ebe7e7b7bd..33aa2c62fa 100644
>> > +index c89915f1aa..df430837e2 100644
>> >  --- a/ld/ld.texinfo
>> >  +++ b/ld/ld.texinfo
>> > -@@ -2480,6 +2480,18 @@ string identifying the original linked file
>> does not change.
>> > +@@ -2498,6 +2498,18 @@ string identifying the original linked file
>> does not change.
>> >
>> >   Passing @code{none} for @var{style} disables the setting from any
>> >   @code{--build-id} options earlier on the command line.
>> > @@ -181,7 +181,7 @@ index ebe7e7b7bd..33aa2c62fa 100644
>> >
>> >   @c man end
>> >  diff --git a/ld/ldfile.c b/ld/ldfile.c
>> > -index 3b37a0a3e2..5c85b01849 100644
>> > +index 6532a57d96..f943f0b2e5 100644
>> >  --- a/ld/ldfile.c
>> >  +++ b/ld/ldfile.c
>> >  @@ -116,6 +116,23 @@ ldfile_add_library_path (const char *name,
>> bfd_boolean cmdline)
>> > @@ -209,7 +209,7 @@ index 3b37a0a3e2..5c85b01849 100644
>> >
>> >   /* Try to open a BFD for a lang_input_statement.  */
>> >  diff --git a/ld/ldlex.h b/ld/ldlex.h
>> > -index 5aa7f6bc3e..cb655e0399 100644
>> > +index 140ed1d9da..9965cbc04f 100644
>> >  --- a/ld/ldlex.h
>> >  +++ b/ld/ldlex.h
>> >  @@ -147,6 +147,8 @@ enum option_values
>> > @@ -222,7 +222,7 @@ index 5aa7f6bc3e..cb655e0399 100644
>> >
>> >   /* The initial parser states.  */
>> >  diff --git a/ld/ldmain.c b/ld/ldmain.c
>> > -index 2b09f20413..89e2a3a805 100644
>> > +index c473ed24c3..adae0b4610 100644
>> >  --- a/ld/ldmain.c
>> >  +++ b/ld/ldmain.c
>> >  @@ -261,6 +261,8 @@ main (int argc, char **argv)
>> > @@ -235,7 +235,7 @@ index 2b09f20413..89e2a3a805 100644
>> >     /* We initialize DEMANGLING based on the environment variable
>> >        COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle th=
e
>> >  diff --git a/ld/lexsup.c b/ld/lexsup.c
>> > -index effa277b16..e4929607e9 100644
>> > +index f2191602d4..bccb3bdeef 100644
>> >  --- a/ld/lexsup.c
>> >  +++ b/ld/lexsup.c
>> >  @@ -538,6 +538,14 @@ static const struct ld_option ld_options[] =3D
>> > @@ -269,5 +269,5 @@ index effa277b16..e4929607e9 100644
>> >       }
>> >
>> >  --
>> > -2.14.0
>> > +2.16.1
>> >
>> > diff --git a/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in=
-
>> libtool-when-sysroot-is-enabled.patch b/meta/recipes-devtools/binuti
>> ls/binutils/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
>> > index 496242efa4..33dfff9bd7 100644
>> > --- a/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-
>> libtool-when-sysroot-is-enabled.patch
>> > +++ b/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-
>> libtool-when-sysroot-is-enabled.patch
>> > @@ -1,4 +1,4 @@
>> > -From 88fac08f1c472c612f381cbb9408756f2f58b4ff Mon Sep 17 00:00:00 200=
1
>> > +From e205ae05c41a8cc8d47708f0a3b6f740e2bf2526 Mon Sep 17 00:00:00 200=
1
>> >  From: Khem Raj <raj.khem@gmail.com>
>> >  Date: Mon, 2 Mar 2015 01:42:38 +0000
>> >  Subject: [PATCH 10/15] Fix rpath in libtool when sysroot is enabled
>> > @@ -48,5 +48,5 @@ index 70e856e065..11ee684ccc 100644
>> >             if test -z "$hardcode_libdirs"; then
>> >               hardcode_libdirs=3D"$libdir"
>> >  --
>> > -2.14.0
>> > +2.16.1
>> >
>> > diff --git a/meta/recipes-devtools/binutils/binutils/0011-Change-defau=
l
>> t-emulation-for-mips64-linux.patch b/meta/recipes-devtools/binuti
>> ls/binutils/0011-Change-default-emulation-for-mips64-linux.patch
>> > index ac87a2d1de..80fcbc1194 100644
>> > --- a/meta/recipes-devtools/binutils/binutils/0011-Change-defaul
>> t-emulation-for-mips64-linux.patch
>> > +++ b/meta/recipes-devtools/binutils/binutils/0011-Change-defaul
>> t-emulation-for-mips64-linux.patch
>> > @@ -1,4 +1,4 @@
>> > -From 497660bdbeb6788786553a5d733105f7f898dc62 Mon Sep 17 00:00:00 200=
1
>> > +From 7978c1299021033c35c29c94e0997235f7ede248 Mon Sep 17 00:00:00 200=
1
>> >  From: Khem Raj <raj.khem@gmail.com>
>> >  Date: Mon, 2 Mar 2015 01:44:14 +0000
>> >  Subject: [PATCH 11/15] Change default emulation for mips64*-*-linux
>> > @@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >   2 files changed, 8 insertions(+), 8 deletions(-)
>> >
>> >  diff --git a/bfd/config.bfd b/bfd/config.bfd
>> > -index dc24aabad5..4511024f22 100644
>> > +index f04a993f06..8777f96bd2 100644
>> >  --- a/bfd/config.bfd
>> >  +++ b/bfd/config.bfd
>> > -@@ -1186,12 +1186,12 @@ case "${targ}" in
>> > +@@ -1189,12 +1189,12 @@ case "${targ}" in
>> >       targ_selvecs=3D"mips_elf32_le_vec mips_elf64_be_vec
>> mips_elf64_le_vec mips_ecoff_be_vec mips_ecoff_le_vec"
>> >       ;;
>> >     mips64*el-*-linux*)
>> > @@ -35,12 +35,12 @@ index dc24aabad5..4511024f22 100644
>> >     mips*el-*-linux*)
>> >       targ_defvec=3Dmips_elf32_trad_le_vec
>> >  diff --git a/ld/configure.tgt b/ld/configure.tgt
>> > -index 47c719cd05..fe7b9238b2 100644
>> > +index 6183a85b3d..1d78465590 100644
>> >  --- a/ld/configure.tgt
>> >  +++ b/ld/configure.tgt
>> > -@@ -530,11 +530,11 @@ mips*el-*-vxworks*)
>> targ_emul=3Delf32elmipvxworks
>> > +@@ -535,11 +535,11 @@ mips*el-*-vxworks*)
>> targ_emul=3Delf32elmipvxworks
>> >   mips*-*-vxworks*)     targ_emul=3Delf32ebmipvxworks
>> > -                       targ_extra_emuls=3D"elf32elmipvxworks" ;;
>> > +                       targ_extra_emuls=3D"elf32elmipvxworks" ;;
>> >   mips*-*-windiss)      targ_emul=3Delf32mipswindiss ;;
>> >  -mips64*el-*-linux-*)  targ_emul=3Delf32ltsmipn32
>> >  -                      targ_extra_emuls=3D"elf32btsmipn32 elf32ltsmip
>> elf32btsmip elf64ltsmip elf64btsmip"
>> > @@ -55,5 +55,5 @@ index 47c719cd05..fe7b9238b2 100644
>> >   mips*el-*-linux-*)    targ_emul=3Delf32ltsmip
>> >                         targ_extra_emuls=3D"elf32btsmip elf32ltsmipn32
>> elf64ltsmip elf32btsmipn32 elf64btsmip"
>> >  --
>> > -2.14.0
>> > +2.16.1
>> >
>> > diff --git a/meta/recipes-devtools/binutils/binutils/0012-Add-support-=
for-Netlogic-XLP.patch
>> b/meta/recipes-devtools/binutils/binutils/0012-Add-support-
>> for-Netlogic-XLP.patch
>> > index dc5e580739..1fefb680f8 100644
>> > --- a/meta/recipes-devtools/binutils/binutils/0012-Add-support-
>> for-Netlogic-XLP.patch
>> > +++ b/meta/recipes-devtools/binutils/binutils/0012-Add-support-
>> for-Netlogic-XLP.patch
>> > @@ -1,4 +1,4 @@
>> > -From 8c60a55d3678589d93739bd27fec216911d80968 Mon Sep 17 00:00:00 200=
1
>> > +From 3b40bf584615f794b85fd50d4d0a5c0a1d2ee7bf Mon Sep 17 00:00:00 200=
1
>> >  From: Khem Raj <raj.khem@gmail.com>
>> >  Date: Sun, 14 Feb 2016 17:06:19 +0000
>> >  Subject: [PATCH 12/15] Add support for Netlogic XLP
>> > @@ -34,7 +34,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> >   14 files changed, 61 insertions(+), 21 deletions(-)
>> >
>> >  diff --git a/bfd/aoutx.h b/bfd/aoutx.h
>> > -index 3d38fda14b..0aec49bbb3 100644
>> > +index eec9c4ad2a..3bf0a71e63 100644
>> >  --- a/bfd/aoutx.h
>> >  +++ b/bfd/aoutx.h
>> >  @@ -814,6 +814,7 @@ NAME (aout, machine_type) (enum bfd_architecture
>> arch,
>> > @@ -46,34 +46,34 @@ index 3d38fda14b..0aec49bbb3 100644
>> >           arch_flags =3D M_MIPS2;
>> >           break;
>> >  diff --git a/bfd/archures.c b/bfd/archures.c
>> > -index 433b95fa08..063b7943a1 100644
>> > +index e83c57a2f3..3016ea1bae 100644
>> >  --- a/bfd/archures.c
>> >  +++ b/bfd/archures.c
>> >  @@ -201,6 +201,7 @@ DESCRIPTION
>> > - .#define bfd_mach_mips_octeon3          6503
>> > - .#define bfd_mach_mips_xlr              887682   {* decimal 'XLR'  *=
}
>> > - .#define bfd_mach_mips_interaptiv_mr2   736550   {* decimal 'IA2'  *=
}
>> > -+.#define bfd_mach_mips_xlp              887680   {* decimal 'XLP'  *=
}
>> > - .#define bfd_mach_mipsisa32             32
>> > - .#define bfd_mach_mipsisa32r2           33
>> > - .#define bfd_mach_mipsisa32r3           34
>> > + .#define bfd_mach_mips_octeon3                6503
>> > + .#define bfd_mach_mips_xlr            887682   {* decimal 'XLR'.  *}
>> > + .#define bfd_mach_mips_interaptiv_mr2 736550   {* decimal 'IA2'.  *}
>> > ++.#define bfd_mach_mips_xlp              887680   {* decimal 'XLP'.  =
*}
>> > + .#define bfd_mach_mipsisa32           32
>> > + .#define bfd_mach_mipsisa32r2         33
>> > + .#define bfd_mach_mipsisa32r3         34
>> >  diff --git a/bfd/bfd-in2.h b/bfd/bfd-in2.h
>> > -index d126aed086..2b753b3a93 100644
>> > +index 42991e7848..27abc5d5a8 100644
>> >  --- a/bfd/bfd-in2.h
>> >  +++ b/bfd/bfd-in2.h
>> > -@@ -2060,6 +2060,7 @@ enum bfd_architecture
>> > +@@ -2062,6 +2062,7 @@ enum bfd_architecture
>> >   #define bfd_mach_mips_octeon3          6503
>> > - #define bfd_mach_mips_xlr              887682   /* decimal 'XLR'  */
>> > - #define bfd_mach_mips_interaptiv_mr2   736550   /* decimal 'IA2'  */
>> > -+#define bfd_mach_mips_xlp              887680   /* decimal 'XLP'  */
>> > + #define bfd_mach_mips_xlr              887682   /* decimal 'XLR'.  *=
/
>> > + #define bfd_mach_mips_interaptiv_mr2   736550   /* decimal 'IA2'.  *=
/
>> > ++#define bfd_mach_mips_xlp              887680   /* decimal 'XLP'.  *=
/
>> >   #define bfd_mach_mipsisa32             32
>> >   #define bfd_mach_mipsisa32r2           33
>> >   #define bfd_mach_mipsisa32r3           34
>> >  diff --git a/bfd/config.bfd b/bfd/config.bfd
>> > -index 4511024f22..f0f9072f10 100644
>> > +index 8777f96bd2..7b80bda8c9 100644
>> >  --- a/bfd/config.bfd
>> >  +++ b/bfd/config.bfd
>> > -@@ -1169,6 +1169,11 @@ case "${targ}" in
>> > +@@ -1172,6 +1172,11 @@ case "${targ}" in
>> >       targ_defvec=3Dmips_elf32_le_vec
>> >       targ_selvecs=3D"mips_elf32_be_vec mips_elf64_be_vec
>> mips_elf64_le_vec"
>> >       ;;
>> > @@ -86,7 +86,7 @@ index 4511024f22..f0f9072f10 100644
>> >       targ_defvec=3Dmips_elf32_be_vec
>> >       targ_selvecs=3D"mips_elf32_le_vec mips_elf64_be_vec
>> mips_elf64_le_vec"
>> >  diff --git a/bfd/cpu-mips.c b/bfd/cpu-mips.c
>> > -index 2493094bef..8375d1ae96 100644
>> > +index cb50c64371..2b9d1d6ecf 100644
>> >  --- a/bfd/cpu-mips.c
>> >  +++ b/bfd/cpu-mips.c
>> >  @@ -105,7 +105,8 @@ enum
>> > @@ -100,7 +100,7 @@ index 2493094bef..8375d1ae96 100644
>> >
>> >   #define NN(index) (&arch_info_struct[(index) + 1])
>> >  @@ -158,7 +159,8 @@ static const bfd_arch_info_type arch_info_struct[=
]
>> =3D
>> > -   N (64, 64, bfd_mach_mips_xlr, "mips:xlr",       FALSE, NN(I_xlr)),
>> > +   N (64, 64, bfd_mach_mips_xlr, "mips:xlr",     FALSE, NN(I_xlr)),
>> >     N (32, 32, bfd_mach_mips_interaptiv_mr2, "mips:interaptiv-mr2",
>> FALSE,
>> >        NN(I_interaptiv_mr2)),
>> >  -  N (64, 64, bfd_mach_mips_micromips,"mips:micromips",FALSE,0)
>> > @@ -110,10 +110,10 @@ index 2493094bef..8375d1ae96 100644
>> >
>> >   /* The default architecture is mips:3000, but with a machine number =
of
>> >  diff --git a/bfd/elfxx-mips.c b/bfd/elfxx-mips.c
>> > -index fddf68c816..354c85d00b 100644
>> > +index 285401367d..14ebb5f175 100644
>> >  --- a/bfd/elfxx-mips.c
>> >  +++ b/bfd/elfxx-mips.c
>> > -@@ -6796,6 +6796,9 @@ _bfd_elf_mips_mach (flagword flags)
>> > +@@ -6806,6 +6806,9 @@ _bfd_elf_mips_mach (flagword flags)
>> >       case E_MIPS_MACH_IAMR2:
>> >         return bfd_mach_mips_interaptiv_mr2;
>> >
>> > @@ -123,7 +123,7 @@ index fddf68c816..354c85d00b 100644
>> >       default:
>> >         switch (flags & EF_MIPS_ARCH)
>> >         {
>> > -@@ -11956,6 +11959,10 @@ mips_set_isa_flags (bfd *abfd)
>> > +@@ -11963,6 +11966,10 @@ mips_set_isa_flags (bfd *abfd)
>> >         val =3D E_MIPS_ARCH_64R2 | E_MIPS_MACH_OCTEON2;
>> >         break;
>> >
>> > @@ -134,7 +134,7 @@ index fddf68c816..354c85d00b 100644
>> >       case bfd_mach_mipsisa32:
>> >         val =3D E_MIPS_ARCH_32;
>> >         break;
>> > -@@ -13989,6 +13996,7 @@ static const struct mips_mach_extension
>> mips_mach_extensions[] =3D
>> > +@@ -13936,6 +13943,7 @@ static const struct mips_mach_extension
>> mips_mach_extensions[] =3D
>> >     { bfd_mach_mips_octeonp, bfd_mach_mips_octeon },
>> >     { bfd_mach_mips_octeon, bfd_mach_mipsisa64r2 },
>> >     { bfd_mach_mips_loongson_3a, bfd_mach_mipsisa64r2 },
>> > @@ -143,10 +143,10 @@ index fddf68c816..354c85d00b 100644
>> >     /* MIPS64 extensions.  */
>> >     { bfd_mach_mipsisa64r2, bfd_mach_mipsisa64 },
>> >  diff --git a/binutils/readelf.c b/binutils/readelf.c
>> > -index 2b15f0f2cb..092744708e 100644
>> > +index ae1cda9a7b..fed0387a94 100644
>> >  --- a/binutils/readelf.c
>> >  +++ b/binutils/readelf.c
>> > -@@ -3335,6 +3335,7 @@ get_machine_flags (unsigned e_flags, unsigned
>> e_machine)
>> > +@@ -3370,6 +3370,7 @@ get_machine_flags (Filedata * filedata, unsigne=
d
>> e_flags, unsigned e_machine)
>> >             case E_MIPS_MACH_OCTEON3: strcat (buf, ", octeon3"); break=
;
>> >             case E_MIPS_MACH_XLR:  strcat (buf, ", xlr"); break;
>> >             case E_MIPS_MACH_IAMR2:  strcat (buf, ", interaptiv-mr2");
>> break;
>> > @@ -155,7 +155,7 @@ index 2b15f0f2cb..092744708e 100644
>> >             /* We simply ignore the field in this case to avoid
>> confusion:
>> >                MIPS ELF does not specify EF_MIPS_MACH, it is a GNU
>> >  diff --git a/gas/config/tc-mips.c b/gas/config/tc-mips.c
>> > -index 3804df2958..9576c986db 100644
>> > +index c135131b59..d8fbda8e31 100644
>> >  --- a/gas/config/tc-mips.c
>> >  +++ b/gas/config/tc-mips.c
>> >  @@ -552,6 +552,7 @@ static int mips_32bitmode =3D 0;
>> > @@ -174,7 +174,7 @@ index 3804df2958..9576c986db 100644
>> >      )
>> >
>> >   /* Whether the processor uses hardware interlocks to protect reads
>> > -@@ -19738,7 +19740,7 @@ static const struct mips_cpu_info
>> mips_cpu_info_table[] =3D
>> > +@@ -19737,7 +19739,7 @@ static const struct mips_cpu_info
>> mips_cpu_info_table[] =3D
>> >     /* Broadcom XLP.
>> >        XLP is mostly like XLR, with the prominent exception that it is
>> >        MIPS64R2 rather than MIPS64.  */
>> > @@ -184,7 +184,7 @@ index 3804df2958..9576c986db 100644
>> >     /* MIPS 64 Release 6 */
>> >     { "i6400",        0, ASE_MSA,               ISA_MIPS64R6,
>> CPU_MIPS64R6},
>> >  diff --git a/gas/configure b/gas/configure
>> > -index 81dd4cbd97..95bdf3b19b 100755
>> > +index a40ac2144f..65a6995243 100755
>> >  --- a/gas/configure
>> >  +++ b/gas/configure
>> >  @@ -12989,6 +12989,9 @@ _ACEOF
>> > @@ -198,7 +198,7 @@ index 81dd4cbd97..95bdf3b19b 100755
>> >             mips_cpu=3Dr3900
>> >             ;;
>> >  diff --git a/include/elf/mips.h b/include/elf/mips.h
>> > -index a4bea43ff8..73d904e25f 100644
>> > +index 9de0b4e175..74fc4f7e55 100644
>> >  --- a/include/elf/mips.h
>> >  +++ b/include/elf/mips.h
>> >  @@ -290,6 +290,7 @@ END_RELOC_NUMBERS (R_MIPS_maxext)
>> > @@ -210,7 +210,7 @@ index a4bea43ff8..73d904e25f 100644
>> >   #define E_MIPS_MACH_OCTEON3   0x008e0000
>> >   #define E_MIPS_MACH_5400      0x00910000
>> >  diff --git a/include/opcode/mips.h b/include/opcode/mips.h
>> > -index ceae9ec50a..276ee3c6c1 100644
>> > +index 5eea72f139..90f6d57e15 100644
>> >  --- a/include/opcode/mips.h
>> >  +++ b/include/opcode/mips.h
>> >  @@ -1259,6 +1259,8 @@ static const unsigned int mips_isa_table[] =3D =
{
>> > @@ -241,10 +241,10 @@ index ceae9ec50a..276ee3c6c1 100644
>> >         return FALSE;
>> >       }
>> >  diff --git a/ld/configure.tgt b/ld/configure.tgt
>> > -index fe7b9238b2..2adf108b17 100644
>> > +index 1d78465590..307e787b64 100644
>> >  --- a/ld/configure.tgt
>> >  +++ b/ld/configure.tgt
>> > -@@ -516,6 +516,8 @@ mips*el-sde-elf* | mips*el-mti-elf* |
>> mips*el-img-elf*)
>> > +@@ -521,6 +521,8 @@ mips*el-sde-elf* | mips*el-mti-elf* |
>> mips*el-img-elf*)
>> >   mips*-sde-elf* | mips*-mti-elf* | mips*-img-elf*)
>> >                         targ_emul=3Delf32btsmip
>> >                         targ_extra_emuls=3D"elf32ltsmip elf32btsmipn32
>> elf64btsmip elf32ltsmipn32 elf64ltsmip" ;;
>> > @@ -254,7 +254,7 @@ index fe7b9238b2..2adf108b17 100644
>> >                         targ_extra_emuls=3D"elf32lr5900"
>> >                         targ_extra_libpath=3D$targ_extra_emuls ;;
>> >  diff --git a/opcodes/mips-dis.c b/opcodes/mips-dis.c
>> > -index 45195007c1..4a80a05d19 100644
>> > +index 984fcbb802..95b107d216 100644
>> >  --- a/opcodes/mips-dis.c
>> >  +++ b/opcodes/mips-dis.c
>> >  @@ -655,13 +655,11 @@ const struct mips_arch_choice
>> mips_arch_choices[] =3D
>> > @@ -277,7 +277,7 @@ index 45195007c1..4a80a05d19 100644
>> >     /* This entry, mips16, is here only for ISA/processor selection; d=
o
>> >        not print its name.  */
>> >  diff --git a/opcodes/mips-opc.c b/opcodes/mips-opc.c
>> > -index 19fca408c9..d02069c528 100644
>> > +index 180d613c93..65b7b8cc23 100644
>> >  --- a/opcodes/mips-opc.c
>> >  +++ b/opcodes/mips-opc.c
>> >  @@ -328,6 +328,7 @@ decode_mips_operand (const char *p)
>> > @@ -389,5 +389,5 @@ index 19fca408c9..d02069c528 100644
>> >   {"swc0",              "E,A(b)",       0,    (int) M_SWC0_AB,
>> INSN_MACRO,             0,              I1,             0,
>> IOCT|IOCTP|IOCT2|I37 },
>> >   {"swc1",              "T,o(b)",       0xe4000000, 0xfc000000,
>> RD_1|RD_3|SM|FP_S,      0,              I1,             0,      0 },
>> >  --
>> > -2.14.0
>> > +2.16.1
>> >
>> > diff --git a/meta/recipes-devtools/binutils/binutils/0013-fix-the-
>> incorrect-assembling-for-ppc-wait-mnemonic.patch
>> b/meta/recipes-devtools/binutils/binutils/0013-fix-the-
>> incorrect-assembling-for-ppc-wait-mnemonic.patch
>> > index 247376b7ed..c3e1b13841 100644
>> > --- a/meta/recipes-devtools/binutils/binutils/0013-fix-the-
>> incorrect-assembling-for-ppc-wait-mnemonic.patch
>> > +++ b/meta/recipes-devtools/binutils/binutils/0013-fix-the-
>> incorrect-assembling-for-ppc-wait-mnemonic.patch
>> > @@ -1,4 +1,4 @@
>> > -From e46202becab625c6c08caf91e08ccbbc1bf799c4 Mon Sep 17 00:00:00 200=
1
>> > +From 27ec22ca3cd56cfdf060d2e1f414bedce269b322 Mon Sep 17 00:00:00 200=
1
>> >  From: Zhenhua Luo <zhenhua.luo@nxp.com>
>> >  Date: Sat, 11 Jun 2016 22:08:29 -0500
>> >  Subject: [PATCH 13/15] fix the incorrect assembling for ppc wait
>> mnemonic
>> > @@ -11,10 +11,10 @@ Upstream-Status: Pending
>> >   1 file changed, 1 insertion(+), 2 deletions(-)
>> >
>> >  diff --git a/opcodes/ppc-opc.c b/opcodes/ppc-opc.c
>> > -index 426261ab21..0d35916cdd 100644
>> > +index bb17f26c2e..dbdd762b4e 100644
>> >  --- a/opcodes/ppc-opc.c
>> >  +++ b/opcodes/ppc-opc.c
>> > -@@ -4881,7 +4881,6 @@ const struct powerpc_opcode powerpc_opcodes[] =
=3D {
>> > +@@ -5338,7 +5338,6 @@ const struct powerpc_opcode powerpc_opcodes[] =
=3D {
>> >   {"ldepx",     X(31,29),       X_MASK,   E500MC|PPCA2, 0,
>> {RT, RA0, RB}},
>> >
>> >   {"waitasec",  X(31,30),      XRTRARB_MASK, POWER8,    POWER9,
>>  {0}},
>> > @@ -22,7 +22,7 @@ index 426261ab21..0d35916cdd 100644
>> >
>> >   {"lwepx",     X(31,31),       X_MASK,   E500MC|PPCA2, 0,
>> {RT, RA0, RB}},
>> >
>> > -@@ -4935,7 +4934,7 @@ const struct powerpc_opcode powerpc_opcodes[] =
=3D {
>> > +@@ -5392,7 +5391,7 @@ const struct powerpc_opcode powerpc_opcodes[] =
=3D {
>> >
>> >   {"waitrsv",   X(31,62)|(1<<21), 0xffffffff, E500MC|PPCA2, 0,
>> {0}},
>> >   {"waitimpl",  X(31,62)|(2<<21), 0xffffffff, E500MC|PPCA2, 0,
>> {0}},
>> > @@ -32,5 +32,5 @@ index 426261ab21..0d35916cdd 100644
>> >   {"dcbstep",   XRT(31,63,0),   XRT_MASK,    E500MC|PPCA2, 0,
>>  {RA0, RB}},
>> >
>> >  --
>> > -2.14.0
>> > +2.16.1
>> >
>> > diff --git a/meta/recipes-devtools/binutils/binutils/0014-Detect-64-bi=
t-MIPS-targets.patch
>> b/meta/recipes-devtools/binutils/binutils/0014-Detect-64-
>> bit-MIPS-targets.patch
>> > index 42b1065f8d..cf3690f25d 100644
>> > --- a/meta/recipes-devtools/binutils/binutils/0014-Detect-64-
>> bit-MIPS-targets.patch
>> > +++ b/meta/recipes-devtools/binutils/binutils/0014-Detect-64-
>> bit-MIPS-targets.patch
>> > @@ -1,4 +1,4 @@
>> > -From bf20d5823662d1f2eb47de2cdfd173627a205b17 Mon Sep 17 00:00:00 200=
1
>> > +From 7dfbd6889d868a09d695dd2736104848c1a9c9c3 Mon Sep 17 00:00:00 200=
1
>> >  From: Khem Raj <raj.khem@gmail.com>
>> >  Date: Fri, 31 Mar 2017 11:42:03 -0700
>> >  Subject: [PATCH 14/15] Detect 64-bit MIPS targets
>> > @@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >   1 file changed, 14 insertions(+)
>> >
>> >  diff --git a/gold/configure.tgt b/gold/configure.tgt
>> > -index 3d63027297..c1f92a1360 100644
>> > +index 8aef22a318..7030026ffa 100644
>> >  --- a/gold/configure.tgt
>> >  +++ b/gold/configure.tgt
>> >  @@ -153,6 +153,13 @@ aarch64*-*)
>> > @@ -46,5 +46,5 @@ index 3d63027297..c1f92a1360 100644
>> >    targ_obj=3Dmips
>> >    targ_machine=3DEM_MIPS
>> >  --
>> > -2.14.0
>> > +2.16.1
>> >
>> > diff --git a/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE=
-libtool-changes.patch
>> b/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-
>> libtool-changes.patch
>> > index 2c8900cb66..8c9fd237e7 100644
>> > --- a/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-
>> libtool-changes.patch
>> > +++ b/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-
>> libtool-changes.patch
>> > @@ -1,4 +1,4 @@
>> > -From 9b456a0e4f284fd41ac36595144ed44dc82410ee Mon Sep 17 00:00:00 200=
1
>> > +From 298804f430939d6cc94b09732ee93e64c5e6be18 Mon Sep 17 00:00:00 200=
1
>> >  From: Ross Burton <ross.burton@intel.com>
>> >  Date: Mon, 6 Mar 2017 23:33:27 -0800
>> >  Subject: [PATCH 15/15] sync with OE libtool changes
>> > @@ -85,5 +85,5 @@ index 11ee684ccc..3b19ac1532 100644
>> >         elif test -n "$runpath_var"; then
>> >           case "$finalize_perm_rpath " in
>> >  --
>> > -2.14.0
>> > +2.16.1
>> >
>> > diff --git a/meta/recipes-devtools/binutils/binutils_2.29.1.bb
>> b/meta/recipes-devtools/binutils/binutils_2.30.bb
>> > similarity index 100%
>> > rename from meta/recipes-devtools/binutils/binutils_2.29.1.bb
>> > rename to meta/recipes-devtools/binutils/binutils_2.30.bb
>> > --
>> > 2.16.1
>> >
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>

--94eb2c07e806445f800565a26a74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ah yes, aarch64.<div><br></div><div>Lots of errors like th=
is when building glibc 2.26:</div><div><br>| /usr/src/debug/glibc/2.26-r0/g=
it/elf/dl-lookup.c:287:(.text+0x82fc): relocation truncated to fit: R_AARCH=
64_LD64_GOT_LO12_NC against symbol `free&#39; defined in .text section in /=
home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm64/build/build/tmp=
/work/aarch64-poky-linux/glibc/2.26-r0/build-aarch64-poky-linux/elf/librtld=
.os<br><br>| /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm64/b=
uild/build/tmp/work/aarch64-poky-linux/glibc/2.26-r0/recipe-sysroot-native/=
usr/bin/aarch64-poky-linux.gcc-cross-initial-aarch64/../../libexec/aarch64-=
poky-linux.gcc-cross-initial-aarch64/gcc/aarch64-poky-linux/7.3.0/ld: BFD (=
GNU Binutils) 2.30.0.20180208 assertion fail ../../bfd/elfnn-aarch64.c:4386=
<br><br>| /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm64/buil=
d/build/tmp/work/aarch64-poky-linux/glibc/2.26-r0/build-aarch64-poky-linux/=
elf/librtld.os:(.<a href=3D"http://data.rel.ro">data.rel.ro</a>+0x310): dan=
gerous relocation: unsupported relocation</div><div><br></div><div><a href=
=3D"https://autobuilder.yocto.io/builders/nightly-arm64/builds/758/steps/Bu=
ildImages/logs/stdio">https://autobuilder.yocto.io/builders/nightly-arm64/b=
uilds/758/steps/BuildImages/logs/stdio</a><br></div><div><br></div><div>Apa=
rt from that the AB was entirely green.</div><div><br></div><div>Ross</div>=
</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 20 Febru=
ary 2018 at 01:06, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ros=
s.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Can&#39;t remembe=
r if this failed anywhere that wasn&#39;t related to the glibc upgrade, so =
I just fired this patch standalone on the autobuilder.<span class=3D"HOEnZb=
"><font color=3D"#888888"><div><br></div><div>Ross</div></font></span></div=
><div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra"><br><di=
v class=3D"gmail_quote">On 16 February 2018 at 03:03, Khem Raj <span dir=3D=
"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@=
gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">ping<br>
<div class=3D"m_7477627778303079584HOEnZb"><div class=3D"m_7477627778303079=
584h5"><br>
On Thu, Feb 8, 2018 at 9:35 AM, Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; Additionally cherry-pick<br>
&gt;<br>
&gt; 5ffeba4a09 Revert &quot;PowerPC PLT speculative execution barriers&quo=
t;<br>
&gt; b01452b1d4 [PR22764][LD][AARCH64]Allow R_AARCH64_ABS16 and R_AARCH64_A=
BS32 against absolution symbol or undefine symbol in shared object.<br>
&gt; a985e9b9de Import patch from mainline to remove PROVODE qualifiers aro=
und definitions of __CTOR_LIST__ and __DTOR_LIST__ in PE linker scripts.<br=
>
&gt; eec4607fc5 Add support for DWARF-4 line number tables.<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; Changes since v1:<br>
&gt;<br>
&gt; - Backport fixes for aarch64 relocs<br>
&gt; - ppc plt fix, dwarf-4 line number support and linker script fix for r=
emoving PROVODE<br>
&gt;<br>
&gt;=C2=A0 meta/conf/distro/include/tcmod<wbr>e-default.inc=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 .../{binutils-2.29.1.inc =3D&gt; binutils-2.30.inc}=C2=A0 =C2=A0=
 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 ...<a href=3D"http://n_2.29.1.bb" rel=3D"noreferrer" target=3D"_=
blank">n_2.29.1.bb</a> =3D&gt; <a href=3D"http://binutils-cross-canadian_2.=
30.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross-canadian_2.30.b<=
wbr>b</a>} |=C2=A0 0<br>
&gt;=C2=A0 ...<a href=3D"http://tils-cross_2.29.1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">tils-cross_2.29.1.bb</a> =3D&gt; <a href=3D"http://binutils=
-cross_2.30.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross_2.30.bb=
</a>} |=C2=A0 0<br>
&gt;=C2=A0 ...<a href=3D"http://rosssdk_2.29.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">rosssdk_2.29.1.bb</a> =3D&gt; <a href=3D"http://binutils-cross=
sdk_2.30.bb" rel=3D"noreferrer" target=3D"_blank">binutils-crosssdk_2.30.bb=
</a>} |=C2=A0 0<br>
&gt;=C2=A0 ...nutils-crosssdk-Generate-re<wbr>locatable-SDKs.patch | 14 ++-=
--<br>
&gt;=C2=A0 ...oss-Do-not-generate-linker-<wbr>script-directo.patch |=C2=A0 =
6 +-<br>
&gt;=C2=A0 ...ure-widen-the-regexp-for-SH<wbr>-architectures.patch | 14 ++-=
--<br>
&gt;=C2=A0 .../0004-Point-scripts-locatio<wbr>n-to-libdir.patch=C2=A0 =C2=
=A0 |=C2=A0 8 +--<br>
&gt;=C2=A0 ...te-an-RPATH-entry-if-LD_RUN<wbr>_PATH-is-not-e.patch | 10 ++-=
-<br>
&gt;=C2=A0 .../binutils/binutils/0006-Use<wbr>-libtool-2.4.patch=C2=A0 =C2=
=A0| 66 ++++++++------------<br>
&gt;=C2=A0 ...7-Add-the-armv5e-architectu<wbr>re-to-binutils.patch |=C2=A0 =
8 +--<br>
&gt;=C2=A0 ...he-distro-compiler-point-to<wbr>-the-wrong-ins.patch |=C2=A0 =
6 +-<br>
&gt;=C2=A0 ...es-of-system-directories-wh<wbr>en-cross-linki.patch | 24 +++=
+----<br>
&gt;=C2=A0 ...-rpath-in-libtool-when-sysr<wbr>oot-is-enabled.patch |=C2=A0 =
4 +-<br>
&gt;=C2=A0 ...Change-default-emulation-fo<wbr>r-mips64-linux.patch | 14 ++-=
--<br>
&gt;=C2=A0 .../0012-Add-support-for-Netlo<wbr>gic-XLP.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 70 +++++++++++-----------<br>
&gt;=C2=A0 ...ncorrect-assembling-for-ppc<wbr>-wait-mnemonic.patch | 10 ++-=
-<br>
&gt;=C2=A0 .../binutils/0014-Detect-64-bi<wbr>t-MIPS-targets.patch |=C2=A0 =
6 +-<br>
&gt;=C2=A0 .../0015-sync-with-OE-libtool-<wbr>changes.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 4 +-<br>
&gt;=C2=A0 .../{<a href=3D"http://binutils_2.29.1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">binutils_2.29.1.bb</a> =3D&gt; <a href=3D"http://binutils_2=
.30.bb" rel=3D"noreferrer" target=3D"_blank">binutils_2.30.bb</a>}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
&gt;=C2=A0 21 files changed, 127 insertions(+), 141 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-devtools/binutils<wbr>/{binutils-2.29.1.inc =
=3D&gt; binutils-2.30.inc} (97%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/binutils<wbr>/{<a href=3D"http://bi=
nutils-cross-canadian_2.29.1.bb" rel=3D"noreferrer" target=3D"_blank">binut=
ils-cross-canadian_2.<wbr>29.1.bb</a> =3D&gt; <a href=3D"http://binutils-cr=
oss-canadian_2.30.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross-c=
anadian_2.30.b<wbr>b</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/binutils<wbr>/{<a href=3D"http://bi=
nutils-cross_2.29.1.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross=
_2.29.1.bb</a> =3D&gt; <a href=3D"http://binutils-cross_2.30.bb" rel=3D"nor=
eferrer" target=3D"_blank">binutils-cross_2.30.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/binutils<wbr>/{<a href=3D"http://bi=
nutils-crosssdk_2.29.1.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cr=
osssdk_2.29.1.bb</a> =3D&gt; <a href=3D"http://binutils-crosssdk_2.30.bb" r=
el=3D"noreferrer" target=3D"_blank">binutils-crosssdk_2.30.bb</a>} (100%)<b=
r>
&gt;=C2=A0 rename meta/recipes-devtools/binutils<wbr>/{<a href=3D"http://bi=
nutils_2.29.1.bb" rel=3D"noreferrer" target=3D"_blank">binutils_2.29.1.bb</=
a> =3D&gt; <a href=3D"http://binutils_2.30.bb" rel=3D"noreferrer" target=3D=
"_blank">binutils_2.30.bb</a>} (100%)<br>
&gt;<br>
&gt; diff --git a/meta/conf/distro/include/tcm<wbr>ode-default.inc b/meta/c=
onf/distro/include/tcm<wbr>ode-default.inc<br>
&gt; index da45642440..037d331605 100644<br>
&gt; --- a/meta/conf/distro/include/tcm<wbr>ode-default.inc<br>
&gt; +++ b/meta/conf/distro/include/tcm<wbr>ode-default.inc<br>
&gt; @@ -24,7 +24,7 @@ PREFERRED_PROVIDER_virtual/get<wbr>text ??=3D &quot;=
gettext&quot;<br>
&gt;<br>
&gt;=C2=A0 GCCVERSION ?=3D &quot;7.%&quot;<br>
&gt;=C2=A0 SDKGCCVERSION ?=3D &quot;${GCCVERSION}&quot;<br>
&gt; -BINUVERSION ?=3D &quot;2.29%&quot;<br>
&gt; +BINUVERSION ?=3D &quot;2.30%&quot;<br>
&gt;=C2=A0 GDBVERSION ?=3D &quot;8.0%&quot;<br>
&gt;=C2=A0 LINUXLIBCVERSION ?=3D &quot;4.14%&quot;<br>
&gt;=C2=A0 GLIBCVERSION ?=3D &quot;2.27%&quot;<br>
&gt; diff --git a/meta/recipes-devtools/binuti<wbr>ls/binutils-2.29.1.inc b=
/meta/recipes-devtools/binuti<wbr>ls/binutils-2.30.inc<br>
&gt; similarity index 97%<br>
&gt; rename from meta/recipes-devtools/binutils<wbr>/binutils-2.29.1.inc<br=
>
&gt; rename to meta/recipes-devtools/binutils<wbr>/binutils-2.30.inc<br>
&gt; index 07a72e2b5a..9c883acc52 100644<br>
&gt; --- a/meta/recipes-devtools/binuti<wbr>ls/binutils-2.29.1.inc<br>
&gt; +++ b/meta/recipes-devtools/binuti<wbr>ls/binutils-2.30.inc<br>
&gt; @@ -18,7 +18,7 @@ BINUPV =3D &quot;${@binutils_branch_version(d)<wbr>}=
&quot;<br>
&gt;<br>
&gt;=C2=A0 UPSTREAM_CHECK_GITTAGREGEX =3D &quot;binutils-(?P&lt;pver&gt;\d+=
_(\d_?)*<wbr>)&quot;<br>
&gt;<br>
&gt; -SRCREV ?=3D &quot;90276f15379d380761fc499da2ba2<wbr>4cfb3c12a94&quot;=
<br>
&gt; +SRCREV ?=3D &quot;caa839fba66600a6c36d3639906ed<wbr>9110b79c307&quot;=
<br>
&gt;=C2=A0 BINUTILS_GIT_URI ?=3D &quot;git://<a href=3D"http://sourceware.o=
rg/git/binutils-gdb.git;branch=3Dbinutils-$%7BBINUPV%7D-branch;protocol=3Dg=
it" rel=3D"noreferrer" target=3D"_blank">sourceware.org/git/binu<wbr>tils-g=
db.git;branch=3Dbinutils-$<wbr>{BINUPV}-branch;protocol=3Dgit</a>&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0${BINUTILS_GIT_URI} \<br>
&gt; diff --git a/meta/recipes-devtools/binuti<wbr>ls/<a href=3D"http://bin=
utils-cross-canadian_2.29.1.bb" rel=3D"noreferrer" target=3D"_blank">binuti=
ls-cross-canadian_2.<wbr>29.1.bb</a> b/meta/recipes-devtools/binuti<wbr>ls/=
<a href=3D"http://binutils-cross-canadian_2.30.bb" rel=3D"noreferrer" targe=
t=3D"_blank">binutils-cross-canadian_2.<wbr>30.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/binutils<wbr>/<a href=3D"http://binu=
tils-cross-canadian_2.29.1.bb" rel=3D"noreferrer" target=3D"_blank">binutil=
s-cross-canadian_2.29.<wbr>1.bb</a><br>
&gt; rename to meta/recipes-devtools/binutils<wbr>/<a href=3D"http://binuti=
ls-cross-canadian_2.30.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cr=
oss-canadian_2.30.<wbr>bb</a><br>
&gt; diff --git a/meta/recipes-devtools/binuti<wbr>ls/<a href=3D"http://bin=
utils-cross_2.29.1.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross_=
2.29.1.bb</a> b/meta/recipes-devtools/binuti<wbr>ls/<a href=3D"http://binut=
ils-cross_2.30.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross_2.30=
.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/binutils<wbr>/<a href=3D"http://binu=
tils-cross_2.29.1.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross_2=
.29.1.bb</a><br>
&gt; rename to meta/recipes-devtools/binutils<wbr>/<a href=3D"http://binuti=
ls-cross_2.30.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross_2.30.=
bb</a><br>
&gt; diff --git a/meta/recipes-devtools/binuti<wbr>ls/<a href=3D"http://bin=
utils-crosssdk_2.29.1.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cro=
sssdk_2.29.1.bb</a> b/meta/recipes-devtools/binuti<wbr>ls/<a href=3D"http:/=
/binutils-crosssdk_2.30.bb" rel=3D"noreferrer" target=3D"_blank">binutils-c=
rosssdk_2.30.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/binutils<wbr>/<a href=3D"http://binu=
tils-crosssdk_2.29.1.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cros=
ssdk_2.29.1.bb</a><br>
&gt; rename to meta/recipes-devtools/binutils<wbr>/<a href=3D"http://binuti=
ls-crosssdk_2.30.bb" rel=3D"noreferrer" target=3D"_blank">binutils-crosssdk=
_2.30.bb</a><br>
&gt; diff --git a/meta/recipes-devtools/binuti<wbr>ls/binutils/0001-binutil=
s-<wbr>crosssdk-Generate-relocatable-<wbr>SDKs.patch b/meta/recipes-devtool=
s/binuti<wbr>ls/binutils/0001-binutils-<wbr>crosssdk-Generate-relocatable-<=
wbr>SDKs.patch<br>
&gt; index 0b515d83c7..2df836057d 100644<br>
&gt; --- a/meta/recipes-devtools/binuti<wbr>ls/binutils/0001-binutils-<wbr>=
crosssdk-Generate-relocatable-<wbr>SDKs.patch<br>
&gt; +++ b/meta/recipes-devtools/binuti<wbr>ls/binutils/0001-binutils-<wbr>=
crosssdk-Generate-relocatable-<wbr>SDKs.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 58ac9f95a3d83c29efaf7a8906fb6a<wbr>efea8c8e79 Mon Sep 17 00:00:0=
0 2001<br>
&gt; +From 2e1b5e24a6759de7f73aa6060a5748<wbr>48d9131b5a Mon Sep 17 00:00:0=
0 2001<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 2 Mar 2015 01:58:54 +0000<br>
&gt;=C2=A0 Subject: [PATCH 01/15] binutils-crosssdk: Generate relocatable S=
DKs<br>
&gt; @@ -18,7 +18,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A02 files changed, 5 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/ld/genscripts.sh b/ld/genscripts.sh<br>
&gt; -index b6940d376d..a42c4d7a4b 100755<br>
&gt; +index 8732422b3a..1f257e99ca 100755<br>
&gt;=C2=A0 --- a/ld/genscripts.sh<br>
&gt;=C2=A0 +++ b/ld/genscripts.sh<br>
&gt;=C2=A0 @@ -277,6 +277,7 @@ DATA_ALIGNMENT_u=3D&quot;${DATA_ALIGN<wbr>ME=
NT_u-${DATA_ALIGNMENT_r}}&quot;<br>
&gt; @@ -37,16 +37,16 @@ index b6940d376d..a42c4d7a4b 100755<br>
&gt;=C2=A0 =C2=A0( echo &quot;/* Script for ld -Ur: link w/out relocation, =
do create constructors */&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0. ${CUSTOMIZER_SCRIPT}<br>
&gt;=C2=A0 =C2=A0 =C2=A0. ${srcdir}/scripttempl/${SCRIPT<wbr>_NAME}.sc<br>
&gt; - ) | sed -e &#39;/^ *$/d;s/[=C2=A0 =C2=A0 =C2=A0 =C2=A0]*$//&#39; &gt=
; ldscripts/${EMULATION_NAME}.xu<br>
&gt; + ) | sed -e &#39;/^ *$/d;s/[=C2=A0 =C2=A0 =C2=A0 =C2=A0 ]*$//&#39; &g=
t; ldscripts/${EMULATION_NAME}.xu<br>
&gt;=C2=A0 +unset PARTIAL_LINKING<br>
&gt;<br>
&gt; - LD_FLAG=3D<br>
&gt;=C2=A0 =C2=A0DATA_ALIGNMENT=3D${DATA_ALIGNME<wbr>NT_}<br>
&gt; + RELOCATING=3D&quot; &quot;<br>
&gt;=C2=A0 diff --git a/ld/scripttempl/<a href=3D"http://elf.sc" rel=3D"nor=
eferrer" target=3D"_blank">elf.sc</a> b/ld/scripttempl/<a href=3D"http://el=
f.sc" rel=3D"noreferrer" target=3D"_blank">elf.sc</a><br>
&gt; -index d9138bc059..e48faeca43 100644<br>
&gt; +index 9787ab5dac..0c8a93c2c8 100644<br>
&gt;=C2=A0 --- a/ld/scripttempl/<a href=3D"http://elf.sc" rel=3D"noreferrer=
" target=3D"_blank">elf.sc</a><br>
&gt;=C2=A0 +++ b/ld/scripttempl/<a href=3D"http://elf.sc" rel=3D"noreferrer=
" target=3D"_blank">elf.sc</a><br>
&gt; -@@ -138,8 +138,8 @@ if test -z &quot;$DATA_SEGMENT_ALIGN&quot;; then<=
br>
&gt; +@@ -139,8 +139,8 @@ if test -z &quot;$DATA_SEGMENT_ALIGN&quot;; then<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DATA_SEGMENT_RELRO_END=3D&quot;. =3D DATA_SE=
GMENT_RELRO_END (${SEPARATE_GOTPLT-0}, .);&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0fi<br>
&gt; @@ -58,5 +58,5 @@ index d9138bc059..e48faeca43 100644<br>
&gt;=C2=A0 =C2=A0if test -z &quot;$PLT&quot;; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0IPLT=3D&quot;.iplt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0${RELOCATING-0} : { *(.iplt) }&quot;<br>
&gt;=C2=A0 --<br>
&gt; -2.14.0<br>
&gt; +2.16.1<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/binuti<wbr>ls/binutils/0002-binutil=
s-<wbr>cross-Do-not-generate-linker-<wbr>script-directo.patch b/meta/recipe=
s-devtools/binuti<wbr>ls/binutils/0002-binutils-<wbr>cross-Do-not-generate-=
linker-<wbr>script-directo.patch<br>
&gt; index 370333d5d0..bac7fb2d1a 100644<br>
&gt; --- a/meta/recipes-devtools/binuti<wbr>ls/binutils/0002-binutils-<wbr>=
cross-Do-not-generate-linker-<wbr>script-directo.patch<br>
&gt; +++ b/meta/recipes-devtools/binuti<wbr>ls/binutils/0002-binutils-<wbr>=
cross-Do-not-generate-linker-<wbr>script-directo.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 8f929c616208351d0971d7dfd7574d<wbr>48d3144603 Mon Sep 17 00:00:0=
0 2001<br>
&gt; +From 58ddf38fa53abb48b69dd76e398c73<wbr>451ad1a5eb Mon Sep 17 00:00:0=
0 2001<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 6 Mar 2017 23:37:05 -0800<br>
&gt;=C2=A0 Subject: [PATCH 02/15] binutils-cross: Do not generate linker sc=
ript<br>
&gt; @@ -23,7 +23,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A01 file changed, 23 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/ld/genscripts.sh b/ld/genscripts.sh<br>
&gt; -index a42c4d7a4b..d727b4d07e 100755<br>
&gt; +index 1f257e99ca..1583b73a2b 100755<br>
&gt;=C2=A0 --- a/ld/genscripts.sh<br>
&gt;=C2=A0 +++ b/ld/genscripts.sh<br>
&gt;=C2=A0 @@ -189,29 +189,6 @@ append_to_lib_path()<br>
&gt; @@ -57,5 +57,5 @@ index a42c4d7a4b..d727b4d07e 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0libs=3D${NATIVE_LIB_DIRS}<br>
&gt;=C2=A0 =C2=A0 =C2=A0if [ &quot;x${NATIVE}&quot; =3D &quot;xyes&quot; ] =
; then<br>
&gt;=C2=A0 --<br>
&gt; -2.14.0<br>
&gt; +2.16.1<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/binuti<wbr>ls/binutils/0003-configu=
re-<wbr>widen-the-regexp-for-SH-<wbr>architectures.patch b/meta/recipes-dev=
tools/binuti<wbr>ls/binutils/0003-configure-<wbr>widen-the-regexp-for-SH-<w=
br>architectures.patch<br>
&gt; index b6c09ccf19..306afe7018 100644<br>
&gt; --- a/meta/recipes-devtools/binuti<wbr>ls/binutils/0003-configure-<wbr=
>widen-the-regexp-for-SH-<wbr>architectures.patch<br>
&gt; +++ b/meta/recipes-devtools/binuti<wbr>ls/binutils/0003-configure-<wbr=
>widen-the-regexp-for-SH-<wbr>architectures.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From e5a806aae02a10290c71deb72f6294<wbr>c98068368d Mon Sep 17 00:00:0=
0 2001<br>
&gt; +From 5089be88f670bcadf7db0e778894f9<wbr>00b2c05d7b Mon Sep 17 00:00:0=
0 2001<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 2 Mar 2015 01:07:33 +0000<br>
&gt;=C2=A0 Subject: [PATCH 03/15] configure: widen the regexp for SH archit=
ectures<br>
&gt; @@ -14,12 +14,12 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A02 files changed, 6 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/configure b/configure<br>
&gt; -index be9dd89d9b..d8af155ab5 100755<br>
&gt; +index 2d615a9996..c4ad45c06c 100755<br>
&gt;=C2=A0 --- a/configure<br>
&gt;=C2=A0 +++ b/configure<br>
&gt; -@@ -3844,7 +3844,7 @@ case &quot;${target}&quot; in<br>
&gt; -=C2=A0 =C2=A0or1k*-*-*)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0noconfigdirs=3D&quot;$noconfigdirs gdb&quot;<br>
&gt; +@@ -3835,7 +3835,7 @@ case &quot;${target}&quot; in<br>
&gt; +=C2=A0 =C2=A0nvptx*-*-*)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0noconfigdirs=3D&quot;$noconfigdirs target-libssp =
target-libstdc++-v3 target-libobjc&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt;=C2=A0 -=C2=A0 sh-*-*)<br>
&gt;=C2=A0 +=C2=A0 sh*-*-* | sh64-*-*)<br>
&gt; @@ -27,7 +27,7 @@ index be9dd89d9b..d8af155ab5 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sh*-*-elf)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;=C2=A0 diff --git a/gprof/configure b/gprof/configure<br>
&gt; -index e71fe8b9e4..679e0dce77 100755<br>
&gt; +index 1e25102976..6b43bf2b18 100755<br>
&gt;=C2=A0 --- a/gprof/configure<br>
&gt;=C2=A0 +++ b/gprof/configure<br>
&gt;=C2=A0 @@ -5874,6 +5874,11 @@ linux* | k*bsd*-gnu | kopensolaris*-gnu)<=
br>
&gt; @@ -43,5 +43,5 @@ index e71fe8b9e4..679e0dce77 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0if echo __ELF__ | $CC -E - | $GREP __ELF__ &gt; /de=
v/null; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0lt_cv_deplibs_check_method=3D&#39;m<wbr>atch=
_pattern /lib[^/]+(\.so\.[0-9]+\.[0-9]+<wbr>|_pic\.a)$&#39;<br>
&gt;=C2=A0 --<br>
&gt; -2.14.0<br>
&gt; +2.16.1<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/binuti<wbr>ls/binutils/0004-Point-s=
cripts<wbr>-location-to-libdir.patch b/meta/recipes-devtools/binuti<wbr>ls/=
binutils/0004-Point-scripts<wbr>-location-to-libdir.patch<br>
&gt; index 38eee30855..3e29c5815a 100644<br>
&gt; --- a/meta/recipes-devtools/binuti<wbr>ls/binutils/0004-Point-scripts<=
wbr>-location-to-libdir.patch<br>
&gt; +++ b/meta/recipes-devtools/binuti<wbr>ls/binutils/0004-Point-scripts<=
wbr>-location-to-libdir.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 3634ec3547bc0f8a5d1b8ad15365e2<wbr>f836cda642 Mon Sep 17 00:00:0=
0 2001<br>
&gt; +From a0e893ea094c48fa803046ffa89e31<wbr>907aee0597 Mon Sep 17 00:00:0=
0 2001<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 2 Mar 2015 01:09:58 +0000<br>
&gt;=C2=A0 Subject: [PATCH 04/15] Point scripts location to libdir<br>
&gt; @@ -12,7 +12,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/ld/Makefile.am b/ld/Makefile.am<br>
&gt; -index 625347ff62..d5334d2681 100644<br>
&gt; +index 6243c12528..3c5d6c8202 100644<br>
&gt;=C2=A0 --- a/ld/Makefile.am<br>
&gt;=C2=A0 +++ b/ld/Makefile.am<br>
&gt;=C2=A0 @@ -57,7 +57,7 @@ endif<br>
&gt; @@ -25,7 +25,7 @@ index 625347ff62..d5334d2681 100644<br>
&gt;=C2=A0 =C2=A0EMUL =3D @EMUL@<br>
&gt;=C2=A0 =C2=A0EMULATION_OFILES =3D @EMULATION_OFILES@<br>
&gt;=C2=A0 diff --git a/ld/Makefile.in b/ld/Makefile.in<br>
&gt; -index ba251777b0..a2cf2282b5 100644<br>
&gt; +index 760c037f9d..6dea692869 100644<br>
&gt;=C2=A0 --- a/ld/Makefile.in<br>
&gt;=C2=A0 +++ b/ld/Makefile.in<br>
&gt;=C2=A0 @@ -446,7 +446,7 @@ AM_CFLAGS =3D $(WARN_CFLAGS) $(ELF_CLFAGS)<b=
r>
&gt; @@ -38,5 +38,5 @@ index ba251777b0..a2cf2282b5 100644<br>
&gt;=C2=A0 =C2=A0BFDDIR =3D $(BASEDIR)/bfd<br>
&gt;=C2=A0 =C2=A0INCDIR =3D $(BASEDIR)/include<br>
&gt;=C2=A0 --<br>
&gt; -2.14.0<br>
&gt; +2.16.1<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/binuti<wbr>ls/binutils/0005-Only-ge=
nerate<wbr>-an-RPATH-entry-if-LD_RUN_<wbr>PATH-is-not-e.patch b/meta/recipe=
s-devtools/binuti<wbr>ls/binutils/0005-Only-generate<wbr>-an-RPATH-entry-if=
-LD_RUN_<wbr>PATH-is-not-e.patch<br>
&gt; index 59150a2e4d..2f49969371 100644<br>
&gt; --- a/meta/recipes-devtools/binuti<wbr>ls/binutils/0005-Only-generate<=
wbr>-an-RPATH-entry-if-LD_RUN_<wbr>PATH-is-not-e.patch<br>
&gt; +++ b/meta/recipes-devtools/binuti<wbr>ls/binutils/0005-Only-generate<=
wbr>-an-RPATH-entry-if-LD_RUN_<wbr>PATH-is-not-e.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 9d37c8f68c07da63186cb993f1221f<wbr>6c11eca422 Mon Sep 17 00:00:0=
0 2001<br>
&gt; +From 518abb195d0eb47d8eef581d7fd0a5<wbr>fd9fa73f7d Mon Sep 17 00:00:0=
0 2001<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 2 Mar 2015 01:27:17 +0000<br>
&gt;=C2=A0 Subject: [PATCH 05/15] Only generate an RPATH entry if LD_RUN_PA=
TH is not<br>
&gt; @@ -15,10 +15,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/ld/emultempl/elf32.em b/ld/emultempl/elf32.em<br>
&gt; -index 9ac1840316..9dc4c149bc 100644<br>
&gt; +index c0925fc9b9..7d7670a89f 100644<br>
&gt;=C2=A0 --- a/ld/emultempl/elf32.em<br>
&gt;=C2=A0 +++ b/ld/emultempl/elf32.em<br>
&gt; -@@ -1463,6 +1463,8 @@ fragment &lt;&lt;EOF<br>
&gt; +@@ -1470,6 +1470,8 @@ fragment &lt;&lt;EOF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; comma=
nd_line.rpath =3D=3D NULL)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D (const =
char *) getenv (&quot;LD_RUN_PATH&quot;);<br>
&gt; @@ -27,7 +27,7 @@ index 9ac1840316..9dc4c149bc 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (path<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&a=
mp;&amp; gld${EMULATION_NAME}_search_ne<wbr>eded (path, &amp;n, force))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br=
>
&gt; -@@ -1740,6 +1742,8 @@ gld${EMULATION_NAME}_before_al<wbr>location (vo=
id)<br>
&gt; +@@ -1750,6 +1752,8 @@ gld${EMULATION_NAME}_before_al<wbr>location (vo=
id)<br>
&gt;=C2=A0 =C2=A0 =C2=A0rpath =3D command_line.rpath;<br>
&gt;=C2=A0 =C2=A0 =C2=A0if (rpath =3D=3D NULL)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rpath =3D (const char *) getenv (&quot;LD_RU=
N_PATH&quot;);<br>
&gt; @@ -37,5 +37,5 @@ index 9ac1840316..9dc4c149bc 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0for (abfd =3D link_info.input_bfds; abfd; abfd =3D =
abfd-&gt;link.next)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bfd_get_flavour (abfd) =3D=3D bfd_target=
_elf_flavour)<br>
&gt;=C2=A0 --<br>
&gt; -2.14.0<br>
&gt; +2.16.1<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/binuti<wbr>ls/binutils/0006-Use-lib=
tool-<wbr>2.4.patch b/meta/recipes-devtools/binuti<wbr>ls/binutils/0006-Use=
-libtool-<wbr>2.4.patch<br>
&gt; index e87efe653b..333e2ee176 100644<br>
&gt; --- a/meta/recipes-devtools/binuti<wbr>ls/binutils/0006-Use-libtool-<w=
br>2.4.patch<br>
&gt; +++ b/meta/recipes-devtools/binuti<wbr>ls/binutils/0006-Use-libtool-<w=
br>2.4.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 71c734bb3754319029dcfc898cedba<wbr>de42274dcb Mon Sep 17 00:00:0=
0 2001<br>
&gt; +From fad053cc59baa6277182b0fc90415a<wbr>214060ba99 Mon Sep 17 00:00:0=
0 2001<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Sun, 14 Feb 2016 17:04:07 +0000<br>
&gt;=C2=A0 Subject: [PATCH 06/15] Use libtool 2.4<br>
&gt; @@ -12,7 +12,6 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0bfd/configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1318 ++++++++++=
+++++++------<br>
&gt;=C2=A0 =C2=A0bfd/<a href=3D"http://configure.ac" rel=3D"noreferrer" tar=
get=3D"_blank">configure.ac</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0binutils/configure=C2=A0 =C2=A0| 1316 +++++++++++++++++---=
---<br>
&gt; - configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 =
+-<br>
&gt;=C2=A0 =C2=A0gas/configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1314 ++++++++++=
+++++++------<br>
&gt;=C2=A0 =C2=A0gprof/configure=C2=A0 =C2=A0 =C2=A0 | 1321 +++++++++++++++=
++------<br>
&gt;=C2=A0 =C2=A0ld/configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1691 +++++=
++++++++++++++++--------<br>
&gt; @@ -24,10 +23,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0opcodes/configure=C2=A0 =C2=A0 | 1318 +++++++++++++++++---=
---<br>
&gt;=C2=A0 =C2=A0opcodes/<a href=3D"http://configure.ac" rel=3D"noreferrer"=
 target=3D"_blank">configure.ac</a> |=C2=A0 =C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0zlib/configure=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1316 ++++++++++=
+++++++------<br>
&gt; - 15 files changed, 9927 insertions(+), 3694 deletions(-)<br>
&gt; + 14 files changed, 9926 insertions(+), 3693 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/bfd/configure b/bfd/configure<br>
&gt; -index 48276594ed..3ece8943f3 100755<br>
&gt; +index 6c2b24ebe3..5fdd723b7f 100755<br>
&gt;=C2=A0 --- a/bfd/configure<br>
&gt;=C2=A0 +++ b/bfd/configure<br>
&gt;=C2=A0 @@ -672,6 +672,9 @@ OTOOL<br>
&gt; @@ -1931,7 +1930,7 @@ index 48276594ed..3ece8943f3 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0chmod +x &quot;$ofile&quot;<br>
&gt;<br>
&gt;=C2=A0 diff --git a/bfd/<a href=3D"http://configure.ac" rel=3D"noreferr=
er" target=3D"_blank">configure.ac</a> b/bfd/<a href=3D"http://configure.ac=
" rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt; -index 8fd03a7ea8..8816c3286c 100644<br>
&gt; +index 2342f3faea..a6451fccda 100644<br>
&gt;=C2=A0 --- a/bfd/<a href=3D"http://configure.ac" rel=3D"noreferrer" tar=
get=3D"_blank">configure.ac</a><br>
&gt;=C2=A0 +++ b/bfd/<a href=3D"http://configure.ac" rel=3D"noreferrer" tar=
get=3D"_blank">configure.ac</a><br>
&gt;=C2=A0 @@ -254,7 +254,7 @@ changequote(,)dnl<br>
&gt; @@ -1944,7 +1943,7 @@ index 8fd03a7ea8..8816c3286c 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0# More hacks to build DLLs on Windows.<br>
&gt;=C2=A0 diff --git a/binutils/configure b/binutils/configure<br>
&gt; -index 22e1b1736e..321b63535b 100755<br>
&gt; +index 5d9c9105a7..a65b2b4518 100755<br>
&gt;=C2=A0 --- a/binutils/configure<br>
&gt;=C2=A0 +++ b/binutils/configure<br>
&gt;=C2=A0 @@ -659,8 +659,11 @@ OTOOL<br>
&gt; @@ -3841,21 +3840,8 @@ index 22e1b1736e..321b63535b 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(rm -f &quot;$ofile&quot; &amp;&amp; cp &quo=
t;$cfgfile&quot; &quot;$ofile&quot; &amp;&amp; rm -f &quot;$cfgfile&quot;)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0chmod +x &quot;$ofile&quot;<br>
&gt;<br>
&gt; -diff --git a/configure b/configure<br>
&gt; -index d8af155ab5..005ed827ab 100755<br>
&gt; ---- a/configure<br>
&gt; -+++ b/configure<br>
&gt; -@@ -3844,7 +3844,7 @@ case &quot;${target}&quot; in<br>
&gt; -=C2=A0 =C2=A0or1k*-*-*)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0noconfigdirs=3D&quot;$noconfigdirs gdb&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0;;<br>
&gt; --=C2=A0 sh*-*-* | sh64-*-*)<br>
&gt; -+=C2=A0 sh-*-* | sh64-*-*)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0case &quot;${target}&quot; in<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sh*-*-elf)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;=C2=A0 diff --git a/gas/configure b/gas/configure<br>
&gt; -index 93afb20c8f..81dd4cbd97 100755<br>
&gt; +index fbac8f44d5..a40ac2144f 100755<br>
&gt;=C2=A0 --- a/gas/configure<br>
&gt;=C2=A0 +++ b/gas/configure<br>
&gt;=C2=A0 @@ -650,8 +650,11 @@ OTOOL<br>
&gt; @@ -5156,7 +5142,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
&gt;=C2=A0 =C2=A0int main ()<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_=
NOW);<br>
&gt; -@@ -15436,13 +16089,20 @@ exeext=3D&#39;`$ECHO &quot;$exeext&quot; | =
$SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
&gt; +@@ -15437,13 +16090,20 @@ exeext=3D&#39;`$ECHO &quot;$exeext&quot; | =
$SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
&gt;=C2=A0 =C2=A0lt_unset=3D&#39;`$ECHO &quot;$lt_unset&quot; | $SED &quot;=
$delay_single_quote_subst&quot;`&#39;<br>
&gt;=C2=A0 =C2=A0lt_SP2NL=3D&#39;`$ECHO &quot;$lt_SP2NL&quot; | $SED &quot;=
$delay_single_quote_subst&quot;`&#39;<br>
&gt;=C2=A0 =C2=A0lt_NL2SP=3D&#39;`$ECHO &quot;$lt_NL2SP&quot; | $SED &quot;=
$delay_single_quote_subst&quot;`&#39;<br>
&gt; @@ -5177,7 +5163,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
&gt;=C2=A0 =C2=A0STRIP=3D&#39;`$ECHO &quot;$STRIP&quot; | $SED &quot;$delay=
_single_quote_subst&quot;`&#39;<br>
&gt;=C2=A0 =C2=A0RANLIB=3D&#39;`$ECHO &quot;$RANLIB&quot; | $SED &quot;$del=
ay_single_quote_subst&quot;`&#39;<br>
&gt;=C2=A0 =C2=A0old_postinstall_cmds=3D&#39;`$ECHO &quot;$old_postinstall_=
cmds&quot; | $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
&gt; -@@ -15457,14 +16117,17 @@ lt_cv_sys_global_symbol_pipe=3D&#39;<wbr>`$=
ECHO &quot;$lt_cv_sys_global_symbol_pipe<wbr>&quot; | $SED &quot;$de<br>
&gt; +@@ -15458,14 +16118,17 @@ lt_cv_sys_global_symbol_pipe=3D&#39;<wbr>`$=
ECHO &quot;$lt_cv_sys_global_symbol_pipe<wbr>&quot; | $SED &quot;$de<br>
&gt;=C2=A0 =C2=A0lt_cv_sys_global_symbol_to_cd<wbr>ecl=3D&#39;`$ECHO &quot;=
$lt_cv_sys_global_symbol_to_c<wbr>decl&quot; | $SED &quot;$delay_single_quo=
te_subst&quot;`&#39;<br>
&gt;=C2=A0 =C2=A0lt_cv_sys_global_symbol_to_c_<wbr>name_address=3D&#39;`$EC=
HO &quot;$lt_cv_sys_global_symbol_to_c<wbr>_name_address&quot; | $SED &quot=
;$delay_single_quote_subst&quot;`&#39;<br>
&gt;=C2=A0 =C2=A0lt_cv_sys_global_symbol_to_c_<wbr>name_address_lib_prefix=
=3D&#39;`$ECH<wbr>O &quot;$lt_cv_sys_global_symbol_to_c<wbr>_name_address_l=
ib_prefix&quot; | $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
&gt; @@ -5196,7 +5182,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
&gt;=C2=A0 =C2=A0DSYMUTIL=3D&#39;`$ECHO &quot;$DSYMUTIL&quot; | $SED &quot;=
$delay_single_quote_subst&quot;`&#39;<br>
&gt;=C2=A0 =C2=A0NMEDIT=3D&#39;`$ECHO &quot;$NMEDIT&quot; | $SED &quot;$del=
ay_single_quote_subst&quot;`&#39;<br>
&gt;=C2=A0 =C2=A0LIPO=3D&#39;`$ECHO &quot;$LIPO&quot; | $SED &quot;$delay_s=
ingle_quote_subst&quot;`&#39;<br>
&gt; -@@ -15497,12 +16160,12 @@ hardcode_shlibpath_var=3D&#39;`$ECHO &quot;=
$hardcode_shlibpath_var&quot; | $SED &quot;$delay_single_q<br>
&gt; +@@ -15498,12 +16161,12 @@ hardcode_shlibpath_var=3D&#39;`$ECHO &quot;=
$hardcode_shlibpath_var&quot; | $SED &quot;$delay_single_q<br>
&gt;=C2=A0 =C2=A0hardcode_automatic=3D&#39;`$ECHO &quot;$hardcode_automatic=
&quot; | $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
&gt;=C2=A0 =C2=A0inherit_rpath=3D&#39;`$ECHO &quot;$inherit_rpath&quot; | $=
SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
&gt;=C2=A0 =C2=A0link_all_deplibs=3D&#39;`$ECHO &quot;$link_all_deplibs&quo=
t; | $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
&gt; @@ -5210,7 +5196,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
&gt;=C2=A0 =C2=A0file_list_spec=3D&#39;`$ECHO &quot;$file_list_spec&quot; |=
 $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
&gt;=C2=A0 =C2=A0variables_saved_for_relink=3D&#39;`<wbr>$ECHO &quot;$varia=
bles_saved_for_relink&quot; | $SED &quot;$delay_single_quote_subst&quot;`&#=
39;<br>
&gt;=C2=A0 =C2=A0need_lib_prefix=3D&#39;`$ECHO &quot;$need_lib_prefix&quot;=
 | $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
&gt; -@@ -15557,8 +16220,13 @@ reload_flag \<br>
&gt; +@@ -15558,8 +16221,13 @@ reload_flag \<br>
&gt;=C2=A0 =C2=A0OBJDUMP \<br>
&gt;=C2=A0 =C2=A0deplibs_check_method \<br>
&gt;=C2=A0 =C2=A0file_magic_cmd \<br>
&gt; @@ -5224,7 +5210,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
&gt;=C2=A0 =C2=A0STRIP \<br>
&gt;=C2=A0 =C2=A0RANLIB \<br>
&gt;=C2=A0 =C2=A0CC \<br>
&gt; -@@ -15568,12 +16236,14 @@ lt_cv_sys_global_symbol_pipe \<br>
&gt; +@@ -15569,12 +16237,14 @@ lt_cv_sys_global_symbol_pipe \<br>
&gt;=C2=A0 =C2=A0lt_cv_sys_global_symbol_to_cd<wbr>ecl \<br>
&gt;=C2=A0 =C2=A0lt_cv_sys_global_symbol_to_c_<wbr>name_address \<br>
&gt;=C2=A0 =C2=A0lt_cv_sys_global_symbol_to_c_<wbr>name_address_lib_prefix =
\<br>
&gt; @@ -5240,7 +5226,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
&gt;=C2=A0 =C2=A0DSYMUTIL \<br>
&gt;=C2=A0 =C2=A0NMEDIT \<br>
&gt;=C2=A0 =C2=A0LIPO \<br>
&gt; -@@ -15589,7 +16259,6 @@ no_undefined_flag \<br>
&gt; +@@ -15590,7 +16260,6 @@ no_undefined_flag \<br>
&gt;=C2=A0 =C2=A0hardcode_libdir_flag_spec \<br>
&gt;=C2=A0 =C2=A0hardcode_libdir_flag_spec_ld \<br>
&gt;=C2=A0 =C2=A0hardcode_libdir_separator \<br>
&gt; @@ -5248,7 +5234,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
&gt;=C2=A0 =C2=A0exclude_expsyms \<br>
&gt;=C2=A0 =C2=A0include_expsyms \<br>
&gt;=C2=A0 =C2=A0file_list_spec \<br>
&gt; -@@ -15625,6 +16294,7 @@ module_cmds \<br>
&gt; +@@ -15626,6 +16295,7 @@ module_cmds \<br>
&gt;=C2=A0 =C2=A0module_expsym_cmds \<br>
&gt;=C2=A0 =C2=A0export_symbols_cmds \<br>
&gt;=C2=A0 =C2=A0prelink_cmds \<br>
&gt; @@ -5256,7 +5242,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
&gt;=C2=A0 =C2=A0postinstall_cmds \<br>
&gt;=C2=A0 =C2=A0postuninstall_cmds \<br>
&gt;=C2=A0 =C2=A0finish_cmds \<br>
&gt; -@@ -16389,7 +17059,8 @@ $as_echo X&quot;$file&quot; |<br>
&gt; +@@ -16390,7 +17060,8 @@ $as_echo X&quot;$file&quot; |<br>
&gt;=C2=A0 =C2=A0# NOTE: Changes made to this file will be lost: look at lt=
main.sh.<br>
&gt;=C2=A0 =C2=A0#<br>
&gt;=C2=A0 =C2=A0#=C2=A0 =C2=A0Copyright (C) 1996, 1997, 1998, 1999, 2000, =
2001, 2003, 2004, 2005,<br>
&gt; @@ -5266,7 +5252,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
&gt;=C2=A0 =C2=A0#=C2=A0 =C2=A0Written by Gordon Matzigkeit, 1996<br>
&gt;=C2=A0 =C2=A0#<br>
&gt;=C2=A0 =C2=A0#=C2=A0 =C2=A0This file is part of GNU Libtool.<br>
&gt; -@@ -16492,19 +17163,42 @@ SP2NL=3D$lt_lt_SP2NL<br>
&gt; +@@ -16493,19 +17164,42 @@ SP2NL=3D$lt_lt_SP2NL<br>
&gt;=C2=A0 =C2=A0# turn newlines into spaces.<br>
&gt;=C2=A0 =C2=A0NL2SP=3D$lt_lt_NL2SP<br>
&gt;<br>
&gt; @@ -5310,7 +5296,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
&gt;=C2=A0 =C2=A0# A symbol stripping program.<br>
&gt;=C2=A0 =C2=A0STRIP=3D$lt_STRIP<br>
&gt;<br>
&gt; -@@ -16534,6 +17228,12 @@ global_symbol_to_c_name_addres<wbr>s=3D$lt_l=
t_cv_sys_global_symbol_<wbr>to_c_name_address<br>
&gt; +@@ -16535,6 +17229,12 @@ global_symbol_to_c_name_addres<wbr>s=3D$lt_l=
t_cv_sys_global_symbol_<wbr>to_c_name_address<br>
&gt;=C2=A0 =C2=A0# Transform the output of nm in a C name address pair when=
 lib prefix is needed.<br>
&gt;=C2=A0 =C2=A0global_symbol_to_c_name_addre<wbr>ss_lib_prefix=3D$lt_lt_c=
v_sys_<wbr>global_symbol_to_c_name_addres<wbr>s_lib_prefix<br>
&gt;<br>
&gt; @@ -5323,7 +5309,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
&gt;=C2=A0 =C2=A0# The name of the directory that contains temporary libtoo=
l files.<br>
&gt;=C2=A0 =C2=A0objdir=3D$objdir<br>
&gt;<br>
&gt; -@@ -16543,6 +17243,9 @@ MAGIC_CMD=3D$MAGIC_CMD<br>
&gt; +@@ -16544,6 +17244,9 @@ MAGIC_CMD=3D$MAGIC_CMD<br>
&gt;=C2=A0 =C2=A0# Must we lock files when doing compilation?<br>
&gt;=C2=A0 =C2=A0need_locks=3D$lt_need_locks<br>
&gt;<br>
&gt; @@ -5333,7 +5319,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
&gt;=C2=A0 =C2=A0# Tool to manipulate archived DWARF debug symbol files on =
Mac OS X.<br>
&gt;=C2=A0 =C2=A0DSYMUTIL=3D$lt_DSYMUTIL<br>
&gt;<br>
&gt; -@@ -16657,12 +17360,12 @@ with_gcc=3D$GCC<br>
&gt; +@@ -16658,12 +17361,12 @@ with_gcc=3D$GCC<br>
&gt;=C2=A0 =C2=A0# Compiler flag to turn off builtin functions.<br>
&gt;=C2=A0 =C2=A0no_builtin_flag=3D$lt_lt_prog_c<wbr>ompiler_no_builtin_fla=
g<br>
&gt;<br>
&gt; @@ -5349,7 +5335,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
&gt;=C2=A0 =C2=A0# Compiler flag to prevent dynamic linking.<br>
&gt;=C2=A0 =C2=A0link_static_flag=3D$lt_lt_prog_<wbr>compiler_static<br>
&gt;<br>
&gt; -@@ -16749,9 +17452,6 @@ inherit_rpath=3D$inherit_rpath<br>
&gt; +@@ -16750,9 +17453,6 @@ inherit_rpath=3D$inherit_rpath<br>
&gt;=C2=A0 =C2=A0# Whether libtool must link a program against all its depe=
ndency libraries.<br>
&gt;=C2=A0 =C2=A0link_all_deplibs=3D$link_all_de<wbr>plibs<br>
&gt;<br>
&gt; @@ -5359,7 +5345,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
&gt;=C2=A0 =C2=A0# Set to &quot;yes&quot; if exported symbols are required.=
<br>
&gt;=C2=A0 =C2=A0always_export_symbols=3D$<wbr>always_export_symbols<br>
&gt;<br>
&gt; -@@ -16767,6 +17467,9 @@ include_expsyms=3D$lt_include_ex<wbr>psyms<br=
>
&gt; +@@ -16768,6 +17468,9 @@ include_expsyms=3D$lt_include_ex<wbr>psyms<br=
>
&gt;=C2=A0 =C2=A0# Commands necessary for linking programs (against librari=
es) with templates.<br>
&gt;=C2=A0 =C2=A0prelink_cmds=3D$lt_prelink_cmds<br>
&gt;<br>
&gt; @@ -5369,7 +5355,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
&gt;=C2=A0 =C2=A0# Specify filename containing input files.<br>
&gt;=C2=A0 =C2=A0file_list_spec=3D$lt_file_list_<wbr>spec<br>
&gt;<br>
&gt; -@@ -16799,210 +17502,169 @@ ltmain=3D&quot;$ac_aux_dir/ltmain.sh&quot=
;<br>
&gt; +@@ -16800,210 +17503,169 @@ ltmain=3D&quot;$ac_aux_dir/ltmain.sh&quot=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0# if finds mixed CR/LF and LF-only lines.=C2=A0 Sin=
ce sed operates in<br>
&gt;=C2=A0 =C2=A0 =C2=A0# text mode, it properly converts lines to CR/LF.=
=C2=A0 This bash problem<br>
&gt;=C2=A0 =C2=A0 =C2=A0# is reportedly fixed, but why not run on old versi=
ons too?<br>
&gt; @@ -5744,7 +5730,7 @@ index 93afb20c8f..81dd4cbd97 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0chmod +x &quot;$ofile&quot;<br>
&gt;<br>
&gt;=C2=A0 diff --git a/gprof/configure b/gprof/configure<br>
&gt; -index 679e0dce77..ac4c016a63 100755<br>
&gt; +index 6b43bf2b18..245ee48bc3 100755<br>
&gt;=C2=A0 --- a/gprof/configure<br>
&gt;=C2=A0 +++ b/gprof/configure<br>
&gt;=C2=A0 @@ -631,8 +631,11 @@ OTOOL<br>
&gt; @@ -7654,7 +7640,7 @@ index 679e0dce77..ac4c016a63 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0chmod +x &quot;$ofile&quot;<br>
&gt;<br>
&gt;=C2=A0 diff --git a/ld/configure b/ld/configure<br>
&gt; -index d7f66f8cdc..4e71511bd1 100755<br>
&gt; +index 0cc6e8a50f..db8b998722 100755<br>
&gt;=C2=A0 --- a/ld/configure<br>
&gt;=C2=A0 +++ b/ld/configure<br>
&gt;=C2=A0 @@ -655,8 +655,11 @@ OTOOL<br>
&gt; @@ -17336,7 +17322,7 @@ index bf92b5e079..c573da90c5 100644<br>
&gt;=C2=A0 =C2=A0# These exist entirely to fool aclocal when bootstrapping =
libtool.<br>
&gt;=C2=A0 =C2=A0#<br>
&gt;=C2=A0 diff --git a/opcodes/configure b/opcodes/configure<br>
&gt; -index 17530f54b9..79b39611c2 100755<br>
&gt; +index 4f29887098..2127d39288 100755<br>
&gt;=C2=A0 --- a/opcodes/configure<br>
&gt;=C2=A0 +++ b/opcodes/configure<br>
&gt;=C2=A0 @@ -650,6 +650,9 @@ OTOOL<br>
&gt; @@ -19240,7 +19226,7 @@ index 17530f54b9..79b39611c2 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0chmod +x &quot;$ofile&quot;<br>
&gt;<br>
&gt;=C2=A0 diff --git a/opcodes/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a> b/opcodes/<a href=3D"http://conf=
igure.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt; -index a9fbfd61f1..c43780f64d 100644<br>
&gt; +index b07f3f3629..5a32d9b1fc 100644<br>
&gt;=C2=A0 --- a/opcodes/<a href=3D"http://configure.ac" rel=3D"noreferrer"=
 target=3D"_blank">configure.ac</a><br>
&gt;=C2=A0 +++ b/opcodes/<a href=3D"http://configure.ac" rel=3D"noreferrer"=
 target=3D"_blank">configure.ac</a><br>
&gt;=C2=A0 @@ -167,7 +167,7 @@ changequote(,)dnl<br>
&gt; @@ -21153,5 +21139,5 @@ index dc2d9ed383..ed9a492f5c 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0chmod +x &quot;$ofile&quot;<br>
&gt;<br>
&gt;=C2=A0 --<br>
&gt; -2.14.0<br>
&gt; +2.16.1<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/binuti<wbr>ls/binutils/0007-Add-the=
-<wbr>armv5e-architecture-to-binutil<wbr>s.patch b/meta/recipes-devtools/bi=
nuti<wbr>ls/binutils/0007-Add-the-<wbr>armv5e-architecture-to-binutil<wbr>s=
.patch<br>
&gt; index 88019606f7..4a5127380f 100644<br>
&gt; --- a/meta/recipes-devtools/binuti<wbr>ls/binutils/0007-Add-the-<wbr>a=
rmv5e-architecture-to-binutil<wbr>s.patch<br>
&gt; +++ b/meta/recipes-devtools/binuti<wbr>ls/binutils/0007-Add-the-<wbr>a=
rmv5e-architecture-to-binutil<wbr>s.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 2b87aad1741bc481dd0982f100ad5e<wbr>a7f937bb61 Mon Sep 17 00:00:0=
0 2001<br>
&gt; +From 697903256e09533778baa8af66402c<wbr>44d70219d9 Mon Sep 17 00:00:0=
0 2001<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 2 Mar 2015 01:37:10 +0000<br>
&gt;=C2=A0 Subject: [PATCH 07/15] Add the armv5e architecture to binutils<b=
r>
&gt; @@ -19,10 +19,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/gas/config/tc-arm.c b/gas/config/tc-arm.c<br>
&gt; -index a885efe4fc..735eaa7447 100644<br>
&gt; +index ec50420518..a25d1721af 100644<br>
&gt;=C2=A0 --- a/gas/config/tc-arm.c<br>
&gt;=C2=A0 +++ b/gas/config/tc-arm.c<br>
&gt; -@@ -25990,6 +25990,7 @@ static const struct arm_arch_option_table arm=
_archs[] =3D<br>
&gt; +@@ -26195,6 +26195,7 @@ static const struct arm_arch_option_table arm=
_archs[] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0ARM_ARCH_OPT (&quot;armv4t&quot;,=C2=A0 =C2=A0 =C2=
=A0ARM_ARCH_V4T,=C2=A0 =C2=A0 FPU_ARCH_FPA),<br>
&gt;=C2=A0 =C2=A0 =C2=A0ARM_ARCH_OPT (&quot;armv4txm&quot;,=C2=A0 =C2=A0ARM=
_ARCH_V4TxM,=C2=A0 FPU_ARCH_FPA),<br>
&gt;=C2=A0 =C2=A0 =C2=A0ARM_ARCH_OPT (&quot;armv5&quot;,=C2=A0 =C2=A0 =C2=
=A0 ARM_ARCH_V5,=C2=A0 =C2=A0 =C2=A0FPU_ARCH_VFP),<br>
&gt; @@ -31,5 +31,5 @@ index a885efe4fc..735eaa7447 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0ARM_ARCH_OPT (&quot;armv5txm&quot;,=C2=A0 =C2=A0ARM=
_ARCH_V5TxM,=C2=A0 FPU_ARCH_VFP),<br>
&gt;=C2=A0 =C2=A0 =C2=A0ARM_ARCH_OPT (&quot;armv5te&quot;,=C2=A0 =C2=A0 ARM=
_ARCH_V5TE,=C2=A0 =C2=A0FPU_ARCH_VFP),<br>
&gt;=C2=A0 --<br>
&gt; -2.14.0<br>
&gt; +2.16.1<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/binuti<wbr>ls/binutils/0008-don-t-l=
et-<wbr>the-distro-compiler-point-to-<wbr>the-wrong-ins.patch b/meta/recipe=
s-devtools/binuti<wbr>ls/binutils/0008-don-t-let-<wbr>the-distro-compiler-p=
oint-to-<wbr>the-wrong-ins.patch<br>
&gt; index 30a22b504f..939be67b58 100644<br>
&gt; --- a/meta/recipes-devtools/binuti<wbr>ls/binutils/0008-don-t-let-<wbr=
>the-distro-compiler-point-to-<wbr>the-wrong-ins.patch<br>
&gt; +++ b/meta/recipes-devtools/binuti<wbr>ls/binutils/0008-don-t-let-<wbr=
>the-distro-compiler-point-to-<wbr>the-wrong-ins.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 331443a87a31ec504e5652fc099d91<wbr>29a9a4deb8 Mon Sep 17 00:00:0=
0 2001<br>
&gt; +From 622d66634eb2e509d4126f5bdcab26<wbr>de367241a1 Mon Sep 17 00:00:0=
0 2001<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 2 Mar 2015 01:39:01 +0000<br>
&gt;=C2=A0 Subject: [PATCH 08/15] don&#39;t let the distro compiler point t=
o the wrong<br>
&gt; @@ -17,7 +17,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/libiberty/Makefile.in b/libiberty/Makefile.in<br>
&gt; -index 25cfa29ad5..ce67a710e3 100644<br>
&gt; +index ed1b334c36..d4ffd8b57b 100644<br>
&gt;=C2=A0 --- a/libiberty/Makefile.in<br>
&gt;=C2=A0 +++ b/libiberty/Makefile.in<br>
&gt;=C2=A0 @@ -364,7 +364,8 @@ install-strip: install<br>
&gt; @@ -31,5 +31,5 @@ index 25cfa29ad5..ce67a710e3 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test -n &quot;${target_header_dir}=
&quot;; then \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${mkinsta=
lldirs} $(DESTDIR)$(libdir)/$(MULTIOSD<wbr>IR); \<br>
&gt;=C2=A0 --<br>
&gt; -2.14.0<br>
&gt; +2.16.1<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/binuti<wbr>ls/binutils/0009-warn-fo=
r-<wbr>uses-of-system-directories-<wbr>when-cross-linki.patch b/meta/recipe=
s-devtools/binuti<wbr>ls/binutils/0009-warn-for-<wbr>uses-of-system-directo=
ries-<wbr>when-cross-linki.patch<br>
&gt; index e0e257880d..e75104722b 100644<br>
&gt; --- a/meta/recipes-devtools/binuti<wbr>ls/binutils/0009-warn-for-<wbr>=
uses-of-system-directories-<wbr>when-cross-linki.patch<br>
&gt; +++ b/meta/recipes-devtools/binuti<wbr>ls/binutils/0009-warn-for-<wbr>=
uses-of-system-directories-<wbr>when-cross-linki.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 0a4afdcf0700efd45963568e2d0049<wbr>127cdf4434 Mon Sep 17 00:00:0=
0 2001<br>
&gt; +From 27e38ee92c24fca86b1c3f6ef156a1<wbr>892dd06bfd Mon Sep 17 00:00:0=
0 2001<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Fri, 15 Jan 2016 06:31:09 +0000<br>
&gt;=C2=A0 Subject: [PATCH 09/15] warn for uses of system directories when =
cross linking<br>
&gt; @@ -77,7 +77,7 @@ index a846743da6..df3cd5fb60 100644<br>
&gt;=C2=A0 =C2=A0#undef EXTRA_SHLIB_EXTENSION<br>
&gt;<br>
&gt;=C2=A0 diff --git a/ld/configure b/ld/configure<br>
&gt; -index 4e71511bd1..71c6ad1fd1 100755<br>
&gt; +index db8b998722..489ead5c13 100755<br>
&gt;=C2=A0 --- a/ld/configure<br>
&gt;=C2=A0 +++ b/ld/configure<br>
&gt;=C2=A0 @@ -789,6 +789,7 @@ with_lib_path<br>
&gt; @@ -118,7 +118,7 @@ index 4e71511bd1..71c6ad1fd1 100755<br>
&gt;=C2=A0 =C2=A0if test &quot;${enable_gold+set}&quot; =3D set; then :<br>
&gt;=C2=A0 =C2=A0 =C2=A0enableval=3D$enable_gold; case &quot;${enableval}&q=
uot; in<br>
&gt;=C2=A0 diff --git a/ld/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a> b/ld/<a href=3D"http://configure.ac" =
rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt; -index 00080f85fd..3aa98e37fb 100644<br>
&gt; +index bada1b50b0..d074a3820b 100644<br>
&gt;=C2=A0 --- a/ld/<a href=3D"http://configure.ac" rel=3D"noreferrer" targ=
et=3D"_blank">configure.ac</a><br>
&gt;=C2=A0 +++ b/ld/<a href=3D"http://configure.ac" rel=3D"noreferrer" targ=
et=3D"_blank">configure.ac</a><br>
&gt;=C2=A0 @@ -95,6 +95,16 @@ AC_SUBST(use_sysroot)<br>
&gt; @@ -139,10 +139,10 @@ index 00080f85fd..3aa98e37fb 100644<br>
&gt;=C2=A0 =C2=A0dnl &quot;install_as_default&quot; is set to false if gold=
 is the default linker.<br>
&gt;=C2=A0 =C2=A0dnl &quot;installed_linker&quot; is the installed BFD link=
er name.<br>
&gt;=C2=A0 diff --git a/ld/ld.h b/ld/ld.h<br>
&gt; -index c6fa1247f0..01c373498f 100644<br>
&gt; +index ba914b921e..9df17dab6c 100644<br>
&gt;=C2=A0 --- a/ld/ld.h<br>
&gt;=C2=A0 +++ b/ld/ld.h<br>
&gt; -@@ -174,6 +174,14 @@ typedef struct<br>
&gt; +@@ -180,6 +180,14 @@ typedef struct<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 in the linker script.=C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0bfd_boolean force_group_allocation;<br>
&gt;<br>
&gt; @@ -158,10 +158,10 @@ index c6fa1247f0..01c373498f 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0enum endian_enum endian;<br>
&gt;<br>
&gt;=C2=A0 diff --git a/ld/ld.texinfo b/ld/ld.texinfo<br>
&gt; -index ebe7e7b7bd..33aa2c62fa 100644<br>
&gt; +index c89915f1aa..df430837e2 100644<br>
&gt;=C2=A0 --- a/ld/ld.texinfo<br>
&gt;=C2=A0 +++ b/ld/ld.texinfo<br>
&gt; -@@ -2480,6 +2480,18 @@ string identifying the original linked file do=
es not change.<br>
&gt; +@@ -2498,6 +2498,18 @@ string identifying the original linked file do=
es not change.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Passing @code{none} for @var{style} disables the setting f=
rom any<br>
&gt;=C2=A0 =C2=A0@code{--build-id} options earlier on the command line.<br>
&gt; @@ -181,7 +181,7 @@ index ebe7e7b7bd..33aa2c62fa 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0@c man end<br>
&gt;=C2=A0 diff --git a/ld/ldfile.c b/ld/ldfile.c<br>
&gt; -index 3b37a0a3e2..5c85b01849 100644<br>
&gt; +index 6532a57d96..f943f0b2e5 100644<br>
&gt;=C2=A0 --- a/ld/ldfile.c<br>
&gt;=C2=A0 +++ b/ld/ldfile.c<br>
&gt;=C2=A0 @@ -116,6 +116,23 @@ ldfile_add_library_path (const char *name, =
bfd_boolean cmdline)<br>
&gt; @@ -209,7 +209,7 @@ index 3b37a0a3e2..5c85b01849 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0/* Try to open a BFD for a lang_input_statement.=C2=A0 */<=
br>
&gt;=C2=A0 diff --git a/ld/ldlex.h b/ld/ldlex.h<br>
&gt; -index 5aa7f6bc3e..cb655e0399 100644<br>
&gt; +index 140ed1d9da..9965cbc04f 100644<br>
&gt;=C2=A0 --- a/ld/ldlex.h<br>
&gt;=C2=A0 +++ b/ld/ldlex.h<br>
&gt;=C2=A0 @@ -147,6 +147,8 @@ enum option_values<br>
&gt; @@ -222,7 +222,7 @@ index 5aa7f6bc3e..cb655e0399 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0/* The initial parser states.=C2=A0 */<br>
&gt;=C2=A0 diff --git a/ld/ldmain.c b/ld/ldmain.c<br>
&gt; -index 2b09f20413..89e2a3a805 100644<br>
&gt; +index c473ed24c3..adae0b4610 100644<br>
&gt;=C2=A0 --- a/ld/ldmain.c<br>
&gt;=C2=A0 +++ b/ld/ldmain.c<br>
&gt;=C2=A0 @@ -261,6 +261,8 @@ main (int argc, char **argv)<br>
&gt; @@ -235,7 +235,7 @@ index 2b09f20413..89e2a3a805 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0/* We initialize DEMANGLING based on the environmen=
t variable<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 COLLECT_NO_DEMANGLE.=C2=A0 The gcc collect2=
 program will demangle the<br>
&gt;=C2=A0 diff --git a/ld/lexsup.c b/ld/lexsup.c<br>
&gt; -index effa277b16..e4929607e9 100644<br>
&gt; +index f2191602d4..bccb3bdeef 100644<br>
&gt;=C2=A0 --- a/ld/lexsup.c<br>
&gt;=C2=A0 +++ b/ld/lexsup.c<br>
&gt;=C2=A0 @@ -538,6 +538,14 @@ static const struct ld_option ld_options[] =
=3D<br>
&gt; @@ -269,5 +269,5 @@ index effa277b16..e4929607e9 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt;=C2=A0 --<br>
&gt; -2.14.0<br>
&gt; +2.16.1<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/binuti<wbr>ls/binutils/0010-Fix-rpa=
th-in-<wbr>libtool-when-sysroot-is-<wbr>enabled.patch b/meta/recipes-devtoo=
ls/binuti<wbr>ls/binutils/0010-Fix-rpath-in-<wbr>libtool-when-sysroot-is-<w=
br>enabled.patch<br>
&gt; index 496242efa4..33dfff9bd7 100644<br>
&gt; --- a/meta/recipes-devtools/binuti<wbr>ls/binutils/0010-Fix-rpath-in-<=
wbr>libtool-when-sysroot-is-<wbr>enabled.patch<br>
&gt; +++ b/meta/recipes-devtools/binuti<wbr>ls/binutils/0010-Fix-rpath-in-<=
wbr>libtool-when-sysroot-is-<wbr>enabled.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 88fac08f1c472c612f381cbb940875<wbr>6f2f58b4ff Mon Sep 17 00:00:0=
0 2001<br>
&gt; +From e205ae05c41a8cc8d47708f0a3b6f7<wbr>40e2bf2526 Mon Sep 17 00:00:0=
0 2001<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 2 Mar 2015 01:42:38 +0000<br>
&gt;=C2=A0 Subject: [PATCH 10/15] Fix rpath in libtool when sysroot is enab=
led<br>
&gt; @@ -48,5 +48,5 @@ index 70e856e065..11ee684ccc 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test -z &quot;$hardc=
ode_libdirs&quot;; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hardcode_libdirs=
=3D&quot;$libdir&quot;<br>
&gt;=C2=A0 --<br>
&gt; -2.14.0<br>
&gt; +2.16.1<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/binuti<wbr>ls/binutils/0011-Change-=
defaul<wbr>t-emulation-for-mips64-linux.<wbr>patch b/meta/recipes-devtools/=
binuti<wbr>ls/binutils/0011-Change-defaul<wbr>t-emulation-for-mips64-linux.=
<wbr>patch<br>
&gt; index ac87a2d1de..80fcbc1194 100644<br>
&gt; --- a/meta/recipes-devtools/binuti<wbr>ls/binutils/0011-Change-defaul<=
wbr>t-emulation-for-mips64-linux.<wbr>patch<br>
&gt; +++ b/meta/recipes-devtools/binuti<wbr>ls/binutils/0011-Change-defaul<=
wbr>t-emulation-for-mips64-linux.<wbr>patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 497660bdbeb6788786553a5d733105<wbr>f7f898dc62 Mon Sep 17 00:00:0=
0 2001<br>
&gt; +From 7978c1299021033c35c29c94e09972<wbr>35f7ede248 Mon Sep 17 00:00:0=
0 2001<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 2 Mar 2015 01:44:14 +0000<br>
&gt;=C2=A0 Subject: [PATCH 11/15] Change default emulation for mips64*-*-li=
nux<br>
&gt; @@ -14,10 +14,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A02 files changed, 8 insertions(+), 8 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/bfd/config.bfd b/bfd/config.bfd<br>
&gt; -index dc24aabad5..4511024f22 100644<br>
&gt; +index f04a993f06..8777f96bd2 100644<br>
&gt;=C2=A0 --- a/bfd/config.bfd<br>
&gt;=C2=A0 +++ b/bfd/config.bfd<br>
&gt; -@@ -1186,12 +1186,12 @@ case &quot;${targ}&quot; in<br>
&gt; +@@ -1189,12 +1189,12 @@ case &quot;${targ}&quot; in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0targ_selvecs=3D&quot;mips_elf32_le_v<wbr>ec =
mips_elf64_be_vec mips_elf64_le_vec mips_ecoff_be_vec mips_ecoff_le_vec&quo=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0mips64*el-*-linux*)<br>
&gt; @@ -35,12 +35,12 @@ index dc24aabad5..4511024f22 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0mips*el-*-linux*)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0targ_defvec=3Dmips_elf32_trad_l<wbr>e_vec<br=
>
&gt;=C2=A0 diff --git a/ld/configure.tgt b/ld/configure.tgt<br>
&gt; -index 47c719cd05..fe7b9238b2 100644<br>
&gt; +index 6183a85b3d..1d78465590 100644<br>
&gt;=C2=A0 --- a/ld/configure.tgt<br>
&gt;=C2=A0 +++ b/ld/configure.tgt<br>
&gt; -@@ -530,11 +530,11 @@ mips*el-*-vxworks*)=C2=A0 =C2=A0 =C2=A0 targ_em=
ul=3Delf32elmipvxworks<br>
&gt; +@@ -535,11 +535,11 @@ mips*el-*-vxworks*)=C2=A0 =C2=A0 =C2=A0 targ_em=
ul=3Delf32elmipvxworks<br>
&gt;=C2=A0 =C2=A0mips*-*-vxworks*)=C2=A0 =C2=A0 =C2=A0targ_emul=3Delf32ebmi=
pvxworks<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0targ_extra_emuls=3D&quot;elf32elmipv<wbr>xworks&quot; ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0targ_extra_emuls=3D&quot;elf32elmipv<wbr>xworks&quot; ;;<br>
&gt;=C2=A0 =C2=A0mips*-*-windiss)=C2=A0 =C2=A0 =C2=A0 targ_emul=3Delf32mips=
windiss ;;<br>
&gt;=C2=A0 -mips64*el-*-linux-*)=C2=A0 targ_emul=3Delf32ltsmipn32<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 targ_extra_emuls=3D&quot;elf32btsmipn<wbr>32 elf32ltsmip elf3=
2btsmip elf64ltsmip elf64btsmip&quot;<br>
&gt; @@ -55,5 +55,5 @@ index 47c719cd05..fe7b9238b2 100644<br>
&gt;=C2=A0 =C2=A0mips*el-*-linux-*)=C2=A0 =C2=A0 targ_emul=3Delf32ltsmip<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0targ_extra_emuls=3D&quot;elf32btsmip elf32ltsmipn32 elf=
64ltsmip elf32btsmipn32 elf64btsmip&quot;<br>
&gt;=C2=A0 --<br>
&gt; -2.14.0<br>
&gt; +2.16.1<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/binuti<wbr>ls/binutils/0012-Add-sup=
port-<wbr>for-Netlogic-XLP.patch b/meta/recipes-devtools/binuti<wbr>ls/binu=
tils/0012-Add-support-<wbr>for-Netlogic-XLP.patch<br>
&gt; index dc5e580739..1fefb680f8 100644<br>
&gt; --- a/meta/recipes-devtools/binuti<wbr>ls/binutils/0012-Add-support-<w=
br>for-Netlogic-XLP.patch<br>
&gt; +++ b/meta/recipes-devtools/binuti<wbr>ls/binutils/0012-Add-support-<w=
br>for-Netlogic-XLP.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 8c60a55d3678589d93739bd27fec21<wbr>6911d80968 Mon Sep 17 00:00:0=
0 2001<br>
&gt; +From 3b40bf584615f794b85fd50d4d0a5c<wbr>0a1d2ee7bf Mon Sep 17 00:00:0=
0 2001<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Sun, 14 Feb 2016 17:06:19 +0000<br>
&gt;=C2=A0 Subject: [PATCH 12/15] Add support for Netlogic XLP<br>
&gt; @@ -34,7 +34,7 @@ Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark=
.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a>&gt;<br=
>
&gt;=C2=A0 =C2=A014 files changed, 61 insertions(+), 21 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/bfd/aoutx.h b/bfd/aoutx.h<br>
&gt; -index 3d38fda14b..0aec49bbb3 100644<br>
&gt; +index eec9c4ad2a..3bf0a71e63 100644<br>
&gt;=C2=A0 --- a/bfd/aoutx.h<br>
&gt;=C2=A0 +++ b/bfd/aoutx.h<br>
&gt;=C2=A0 @@ -814,6 +814,7 @@ NAME (aout, machine_type) (enum bfd_architec=
ture arch,<br>
&gt; @@ -46,34 +46,34 @@ index 3d38fda14b..0aec49bbb3 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arch_flags =3D M_MIPS2;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 diff --git a/bfd/archures.c b/bfd/archures.c<br>
&gt; -index 433b95fa08..063b7943a1 100644<br>
&gt; +index e83c57a2f3..3016ea1bae 100644<br>
&gt;=C2=A0 --- a/bfd/archures.c<br>
&gt;=C2=A0 +++ b/bfd/archures.c<br>
&gt;=C2=A0 @@ -201,6 +201,7 @@ DESCRIPTION<br>
&gt; - .#define bfd_mach_mips_octeon3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 650=
3<br>
&gt; - .#define bfd_mach_mips_xlr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 887682=C2=A0 =C2=A0{* decimal &#39;XLR&#39;=C2=A0 *}<br>
&gt; - .#define bfd_mach_mips_interaptiv_mr2=C2=A0 =C2=A0736550=C2=A0 =C2=
=A0{* decimal &#39;IA2&#39;=C2=A0 *}<br>
&gt; -+.#define bfd_mach_mips_xlp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 887680=C2=A0 =C2=A0{* decimal &#39;XLP&#39;=C2=A0 *}<br>
&gt; - .#define bfd_mach_mipsisa32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A032<br>
&gt; - .#define bfd_mach_mipsisa32r2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A033<br>
&gt; - .#define bfd_mach_mipsisa32r3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A034<br>
&gt; + .#define bfd_mach_mips_octeon3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 6503<br>
&gt; + .#define bfd_mach_mips_xlr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
887682=C2=A0 =C2=A0{* decimal &#39;XLR&#39;.=C2=A0 *}<br>
&gt; + .#define bfd_mach_mips_interaptiv_mr2 736550=C2=A0 =C2=A0{* decimal =
&#39;IA2&#39;.=C2=A0 *}<br>
&gt; ++.#define bfd_mach_mips_xlp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 887680=C2=A0 =C2=A0{* decimal &#39;XLP&#39;.=C2=A0 *}<br>
&gt; + .#define bfd_mach_mipsisa32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
32<br>
&gt; + .#define bfd_mach_mipsisa32r2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A033<br=
>
&gt; + .#define bfd_mach_mipsisa32r3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A034<br=
>
&gt;=C2=A0 diff --git a/bfd/bfd-in2.h b/bfd/bfd-in2.h<br>
&gt; -index d126aed086..2b753b3a93 100644<br>
&gt; +index 42991e7848..27abc5d5a8 100644<br>
&gt;=C2=A0 --- a/bfd/bfd-in2.h<br>
&gt;=C2=A0 +++ b/bfd/bfd-in2.h<br>
&gt; -@@ -2060,6 +2060,7 @@ enum bfd_architecture<br>
&gt; +@@ -2062,6 +2062,7 @@ enum bfd_architecture<br>
&gt;=C2=A0 =C2=A0#define bfd_mach_mips_octeon3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 6503<br>
&gt; - #define bfd_mach_mips_xlr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 887682=C2=A0 =C2=A0/* decimal &#39;XLR&#39;=C2=A0 */<br>
&gt; - #define bfd_mach_mips_interaptiv_mr2=C2=A0 =C2=A0736550=C2=A0 =C2=A0=
/* decimal &#39;IA2&#39;=C2=A0 */<br>
&gt; -+#define bfd_mach_mips_xlp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 887680=C2=A0 =C2=A0/* decimal &#39;XLP&#39;=C2=A0 */<br>
&gt; + #define bfd_mach_mips_xlr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 887682=C2=A0 =C2=A0/* decimal &#39;XLR&#39;.=C2=A0 */<br>
&gt; + #define bfd_mach_mips_interaptiv_mr2=C2=A0 =C2=A0736550=C2=A0 =C2=A0=
/* decimal &#39;IA2&#39;.=C2=A0 */<br>
&gt; ++#define bfd_mach_mips_xlp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 887680=C2=A0 =C2=A0/* decimal &#39;XLP&#39;.=C2=A0 */<br>
&gt;=C2=A0 =C2=A0#define bfd_mach_mipsisa32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A032<br>
&gt;=C2=A0 =C2=A0#define bfd_mach_mipsisa32r2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A033<br>
&gt;=C2=A0 =C2=A0#define bfd_mach_mipsisa32r3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A034<br>
&gt;=C2=A0 diff --git a/bfd/config.bfd b/bfd/config.bfd<br>
&gt; -index 4511024f22..f0f9072f10 100644<br>
&gt; +index 8777f96bd2..7b80bda8c9 100644<br>
&gt;=C2=A0 --- a/bfd/config.bfd<br>
&gt;=C2=A0 +++ b/bfd/config.bfd<br>
&gt; -@@ -1169,6 +1169,11 @@ case &quot;${targ}&quot; in<br>
&gt; +@@ -1172,6 +1172,11 @@ case &quot;${targ}&quot; in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0targ_defvec=3Dmips_elf32_le_vec<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0targ_selvecs=3D&quot;mips_elf32_be_v<wbr>ec =
mips_elf64_be_vec mips_elf64_le_vec&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; @@ -86,7 +86,7 @@ index 4511024f22..f0f9072f10 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0targ_defvec=3Dmips_elf32_be_vec<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0targ_selvecs=3D&quot;mips_elf32_le_v<wbr>ec =
mips_elf64_be_vec mips_elf64_le_vec&quot;<br>
&gt;=C2=A0 diff --git a/bfd/cpu-mips.c b/bfd/cpu-mips.c<br>
&gt; -index 2493094bef..8375d1ae96 100644<br>
&gt; +index cb50c64371..2b9d1d6ecf 100644<br>
&gt;=C2=A0 --- a/bfd/cpu-mips.c<br>
&gt;=C2=A0 +++ b/bfd/cpu-mips.c<br>
&gt;=C2=A0 @@ -105,7 +105,8 @@ enum<br>
&gt; @@ -100,7 +100,7 @@ index 2493094bef..8375d1ae96 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#define NN(index) (&amp;arch_info_struct[(index) + 1])<br>
&gt;=C2=A0 @@ -158,7 +159,8 @@ static const bfd_arch_info_type arch_info_st=
ruct[] =3D<br>
&gt; -=C2=A0 =C2=A0N (64, 64, bfd_mach_mips_xlr, &quot;mips:xlr&quot;,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0FALSE, NN(I_xlr)),<br>
&gt; +=C2=A0 =C2=A0N (64, 64, bfd_mach_mips_xlr, &quot;mips:xlr&quot;,=C2=
=A0 =C2=A0 =C2=A0FALSE, NN(I_xlr)),<br>
&gt;=C2=A0 =C2=A0 =C2=A0N (32, 32, bfd_mach_mips_interaptiv_mr2, &quot;mips=
:interaptiv-mr2&quot;, FALSE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 NN(I_interaptiv_mr2)),<br>
&gt;=C2=A0 -=C2=A0 N (64, 64, bfd_mach_mips_micromips,&quot;mips:<wbr>micro=
mips&quot;,FALSE,0)<br>
&gt; @@ -110,10 +110,10 @@ index 2493094bef..8375d1ae96 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0/* The default architecture is mips:3000, but with a machi=
ne number of<br>
&gt;=C2=A0 diff --git a/bfd/elfxx-mips.c b/bfd/elfxx-mips.c<br>
&gt; -index fddf68c816..354c85d00b 100644<br>
&gt; +index 285401367d..14ebb5f175 100644<br>
&gt;=C2=A0 --- a/bfd/elfxx-mips.c<br>
&gt;=C2=A0 +++ b/bfd/elfxx-mips.c<br>
&gt; -@@ -6796,6 +6796,9 @@ _bfd_elf_mips_mach (flagword flags)<br>
&gt; +@@ -6806,6 +6806,9 @@ _bfd_elf_mips_mach (flagword flags)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case E_MIPS_MACH_IAMR2:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return bfd_mach_mips_interaptiv_mr2;<=
br>
&gt;<br>
&gt; @@ -123,7 +123,7 @@ index fddf68c816..354c85d00b 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (flags &amp; EF_MIPS_ARCH)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; -@@ -11956,6 +11959,10 @@ mips_set_isa_flags (bfd *abfd)<br>
&gt; +@@ -11963,6 +11966,10 @@ mips_set_isa_flags (bfd *abfd)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D E_MIPS_ARCH_64R2 | E_MIPS_MAC=
H_OCTEON2;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;<br>
&gt; @@ -134,7 +134,7 @@ index fddf68c816..354c85d00b 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case bfd_mach_mipsisa32:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D E_MIPS_ARCH_32;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; -@@ -13989,6 +13996,7 @@ static const struct mips_mach_extension mips_=
mach_extensions[] =3D<br>
&gt; +@@ -13936,6 +13943,7 @@ static const struct mips_mach_extension mips_=
mach_extensions[] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0{ bfd_mach_mips_octeonp, bfd_mach_mips_octeon },<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0{ bfd_mach_mips_octeon, bfd_mach_mipsisa64r2 },<br>
&gt;=C2=A0 =C2=A0 =C2=A0{ bfd_mach_mips_loongson_3a, bfd_mach_mipsisa64r2 }=
,<br>
&gt; @@ -143,10 +143,10 @@ index fddf68c816..354c85d00b 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0/* MIPS64 extensions.=C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0{ bfd_mach_mipsisa64r2, bfd_mach_mipsisa64 },<br>
&gt;=C2=A0 diff --git a/binutils/readelf.c b/binutils/readelf.c<br>
&gt; -index 2b15f0f2cb..092744708e 100644<br>
&gt; +index ae1cda9a7b..fed0387a94 100644<br>
&gt;=C2=A0 --- a/binutils/readelf.c<br>
&gt;=C2=A0 +++ b/binutils/readelf.c<br>
&gt; -@@ -3335,6 +3335,7 @@ get_machine_flags (unsigned e_flags, unsigned e=
_machine)<br>
&gt; +@@ -3370,6 +3370,7 @@ get_machine_flags (Filedata * filedata, unsigne=
d e_flags, unsigned e_machine)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case E_MIPS_MACH_OCTEON=
3: strcat (buf, &quot;, octeon3&quot;); break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case E_MIPS_MACH_XLR:=
=C2=A0 strcat (buf, &quot;, xlr&quot;); break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case E_MIPS_MACH_IAMR2:=
=C2=A0 strcat (buf, &quot;, interaptiv-mr2&quot;); break;<br>
&gt; @@ -155,7 +155,7 @@ index 2b15f0f2cb..092744708e 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* We simply ignore the=
 field in this case to avoid confusion:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MIPS ELF does n=
ot specify EF_MIPS_MACH, it is a GNU<br>
&gt;=C2=A0 diff --git a/gas/config/tc-mips.c b/gas/config/tc-mips.c<br>
&gt; -index 3804df2958..9576c986db 100644<br>
&gt; +index c135131b59..d8fbda8e31 100644<br>
&gt;=C2=A0 --- a/gas/config/tc-mips.c<br>
&gt;=C2=A0 +++ b/gas/config/tc-mips.c<br>
&gt;=C2=A0 @@ -552,6 +552,7 @@ static int mips_32bitmode =3D 0;<br>
&gt; @@ -174,7 +174,7 @@ index 3804df2958..9576c986db 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 )<br>
&gt;<br>
&gt;=C2=A0 =C2=A0/* Whether the processor uses hardware interlocks to prote=
ct reads<br>
&gt; -@@ -19738,7 +19740,7 @@ static const struct mips_cpu_info mips_cpu_in=
fo_table[] =3D<br>
&gt; +@@ -19737,7 +19739,7 @@ static const struct mips_cpu_info mips_cpu_in=
fo_table[] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0/* Broadcom XLP.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 XLP is mostly like XLR, with the prominent =
exception that it is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 MIPS64R2 rather than MIPS64.=C2=A0 */<br>
&gt; @@ -184,7 +184,7 @@ index 3804df2958..9576c986db 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0/* MIPS 64 Release 6 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0{ &quot;i6400&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 0, =
ASE_MSA,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ISA_MIPS64R6=
, CPU_MIPS64R6},<br>
&gt;=C2=A0 diff --git a/gas/configure b/gas/configure<br>
&gt; -index 81dd4cbd97..95bdf3b19b 100755<br>
&gt; +index a40ac2144f..65a6995243 100755<br>
&gt;=C2=A0 --- a/gas/configure<br>
&gt;=C2=A0 +++ b/gas/configure<br>
&gt;=C2=A0 @@ -12989,6 +12989,9 @@ _ACEOF<br>
&gt; @@ -198,7 +198,7 @@ index 81dd4cbd97..95bdf3b19b 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mips_cpu=3Dr3900<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt;=C2=A0 diff --git a/include/elf/mips.h b/include/elf/mips.h<br>
&gt; -index a4bea43ff8..73d904e25f 100644<br>
&gt; +index 9de0b4e175..74fc4f7e55 100644<br>
&gt;=C2=A0 --- a/include/elf/mips.h<br>
&gt;=C2=A0 +++ b/include/elf/mips.h<br>
&gt;=C2=A0 @@ -290,6 +290,7 @@ END_RELOC_NUMBERS (R_MIPS_maxext)<br>
&gt; @@ -210,7 +210,7 @@ index a4bea43ff8..73d904e25f 100644<br>
&gt;=C2=A0 =C2=A0#define E_MIPS_MACH_OCTEON3=C2=A0 =C2=A00x008e0000<br>
&gt;=C2=A0 =C2=A0#define E_MIPS_MACH_5400=C2=A0 =C2=A0 =C2=A0 0x00910000<br=
>
&gt;=C2=A0 diff --git a/include/opcode/mips.h b/include/opcode/mips.h<br>
&gt; -index ceae9ec50a..276ee3c6c1 100644<br>
&gt; +index 5eea72f139..90f6d57e15 100644<br>
&gt;=C2=A0 --- a/include/opcode/mips.h<br>
&gt;=C2=A0 +++ b/include/opcode/mips.h<br>
&gt;=C2=A0 @@ -1259,6 +1259,8 @@ static const unsigned int mips_isa_table[]=
 =3D {<br>
&gt; @@ -241,10 +241,10 @@ index ceae9ec50a..276ee3c6c1 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return FALSE;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 diff --git a/ld/configure.tgt b/ld/configure.tgt<br>
&gt; -index fe7b9238b2..2adf108b17 100644<br>
&gt; +index 1d78465590..307e787b64 100644<br>
&gt;=C2=A0 --- a/ld/configure.tgt<br>
&gt;=C2=A0 +++ b/ld/configure.tgt<br>
&gt; -@@ -516,6 +516,8 @@ mips*el-sde-elf* | mips*el-mti-elf* | mips*el-img=
-elf*)<br>
&gt; +@@ -521,6 +521,8 @@ mips*el-sde-elf* | mips*el-mti-elf* | mips*el-img=
-elf*)<br>
&gt;=C2=A0 =C2=A0mips*-sde-elf* | mips*-mti-elf* | mips*-img-elf*)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0targ_emul=3Delf32btsmip<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0targ_extra_emuls=3D&quot;elf32ltsmip elf32btsmipn32 elf=
64btsmip elf32ltsmipn32 elf64ltsmip&quot; ;;<br>
&gt; @@ -254,7 +254,7 @@ index fe7b9238b2..2adf108b17 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0targ_extra_emuls=3D&quot;<wbr>elf32lr5900&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0targ_extra_libpath=3D$targ_extr<wbr>a_emuls ;;<br>
&gt;=C2=A0 diff --git a/opcodes/mips-dis.c b/opcodes/mips-dis.c<br>
&gt; -index 45195007c1..4a80a05d19 100644<br>
&gt; +index 984fcbb802..95b107d216 100644<br>
&gt;=C2=A0 --- a/opcodes/mips-dis.c<br>
&gt;=C2=A0 +++ b/opcodes/mips-dis.c<br>
&gt;=C2=A0 @@ -655,13 +655,11 @@ const struct mips_arch_choice mips_arch_ch=
oices[] =3D<br>
&gt; @@ -277,7 +277,7 @@ index 45195007c1..4a80a05d19 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0/* This entry, mips16, is here only for ISA/process=
or selection; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 not print its name.=C2=A0 */<br>
&gt;=C2=A0 diff --git a/opcodes/mips-opc.c b/opcodes/mips-opc.c<br>
&gt; -index 19fca408c9..d02069c528 100644<br>
&gt; +index 180d613c93..65b7b8cc23 100644<br>
&gt;=C2=A0 --- a/opcodes/mips-opc.c<br>
&gt;=C2=A0 +++ b/opcodes/mips-opc.c<br>
&gt;=C2=A0 @@ -328,6 +328,7 @@ decode_mips_operand (const char *p)<br>
&gt; @@ -389,5 +389,5 @@ index 19fca408c9..d02069c528 100644<br>
&gt;=C2=A0 =C2=A0{&quot;swc0&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;E,A(b)&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 (i=
nt) M_SWC0_AB,=C2=A0 INSN_MACRO,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I1,=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=C2=A0 =C2=A0 =C2=A0 IOCT|IOCTP|IOCT2|I=
37 },<br>
&gt;=C2=A0 =C2=A0{&quot;swc1&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;T,o(b)&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00xe4000000, 0xfc00=
0000, RD_1|RD_3|SM|FP_S,=C2=A0 =C2=A0 =C2=A0 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 I1,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00,=
=C2=A0 =C2=A0 =C2=A0 0 },<br>
&gt;=C2=A0 --<br>
&gt; -2.14.0<br>
&gt; +2.16.1<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/binuti<wbr>ls/binutils/0013-fix-the=
-<wbr>incorrect-assembling-for-ppc-<wbr>wait-mnemonic.patch b/meta/recipes-=
devtools/binuti<wbr>ls/binutils/0013-fix-the-<wbr>incorrect-assembling-for-=
ppc-<wbr>wait-mnemonic.patch<br>
&gt; index 247376b7ed..c3e1b13841 100644<br>
&gt; --- a/meta/recipes-devtools/binuti<wbr>ls/binutils/0013-fix-the-<wbr>i=
ncorrect-assembling-for-ppc-<wbr>wait-mnemonic.patch<br>
&gt; +++ b/meta/recipes-devtools/binuti<wbr>ls/binutils/0013-fix-the-<wbr>i=
ncorrect-assembling-for-ppc-<wbr>wait-mnemonic.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From e46202becab625c6c08caf91e08ccb<wbr>bc1bf799c4 Mon Sep 17 00:00:0=
0 2001<br>
&gt; +From 27ec22ca3cd56cfdf060d2e1f414be<wbr>dce269b322 Mon Sep 17 00:00:0=
0 2001<br>
&gt;=C2=A0 From: Zhenhua Luo &lt;<a href=3D"mailto:zhenhua.luo@nxp.com" tar=
get=3D"_blank">zhenhua.luo@nxp.com</a>&gt;<br>
&gt;=C2=A0 Date: Sat, 11 Jun 2016 22:08:29 -0500<br>
&gt;=C2=A0 Subject: [PATCH 13/15] fix the incorrect assembling for ppc wait=
 mnemonic<br>
&gt; @@ -11,10 +11,10 @@ Upstream-Status: Pending<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/opcodes/ppc-opc.c b/opcodes/ppc-opc.c<br>
&gt; -index 426261ab21..0d35916cdd 100644<br>
&gt; +index bb17f26c2e..dbdd762b4e 100644<br>
&gt;=C2=A0 --- a/opcodes/ppc-opc.c<br>
&gt;=C2=A0 +++ b/opcodes/ppc-opc.c<br>
&gt; -@@ -4881,7 +4881,6 @@ const struct powerpc_opcode powerpc_opcodes[] =
=3D {<br>
&gt; +@@ -5338,7 +5338,6 @@ const struct powerpc_opcode powerpc_opcodes[] =
=3D {<br>
&gt;=C2=A0 =C2=A0{&quot;ldepx&quot;,=C2=A0 =C2=A0 =C2=A0X(31,29),=C2=A0 =C2=
=A0 =C2=A0 =C2=A0X_MASK,=C2=A0 =C2=A0E500MC|PPCA2, 0,=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {RT, RA0, RB}},<br>
&gt;<br>
&gt;=C2=A0 =C2=A0{&quot;waitasec&quot;,=C2=A0 X(31,30),=C2=A0 =C2=A0 =C2=A0=
 XRTRARB_MASK, POWER8,=C2=A0 =C2=A0 POWER9,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0{0}},<br>
&gt; @@ -22,7 +22,7 @@ index 426261ab21..0d35916cdd 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0{&quot;lwepx&quot;,=C2=A0 =C2=A0 =C2=A0X(31,31),=C2=A0 =C2=
=A0 =C2=A0 =C2=A0X_MASK,=C2=A0 =C2=A0E500MC|PPCA2, 0,=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {RT, RA0, RB}},<br>
&gt;<br>
&gt; -@@ -4935,7 +4934,7 @@ const struct powerpc_opcode powerpc_opcodes[] =
=3D {<br>
&gt; +@@ -5392,7 +5391,7 @@ const struct powerpc_opcode powerpc_opcodes[] =
=3D {<br>
&gt;<br>
&gt;=C2=A0 =C2=A0{&quot;waitrsv&quot;,=C2=A0 =C2=A0X(31,62)|(1&lt;&lt;21), =
0xffffffff, E500MC|PPCA2, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {0}},<br>
&gt;=C2=A0 =C2=A0{&quot;waitimpl&quot;,=C2=A0 X(31,62)|(2&lt;&lt;21), 0xfff=
fffff, E500MC|PPCA2, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {0}},<br>
&gt; @@ -32,5 +32,5 @@ index 426261ab21..0d35916cdd 100644<br>
&gt;=C2=A0 =C2=A0{&quot;dcbstep&quot;,=C2=A0 =C2=A0XRT(31,63,0),=C2=A0 =C2=
=A0XRT_MASK,=C2=A0 =C2=A0 E500MC|PPCA2, 0,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0{RA0, RB}},<br>
&gt;<br>
&gt;=C2=A0 --<br>
&gt; -2.14.0<br>
&gt; +2.16.1<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/binuti<wbr>ls/binutils/0014-Detect-=
64-<wbr>bit-MIPS-targets.patch b/meta/recipes-devtools/binuti<wbr>ls/binuti=
ls/0014-Detect-64-<wbr>bit-MIPS-targets.patch<br>
&gt; index 42b1065f8d..cf3690f25d 100644<br>
&gt; --- a/meta/recipes-devtools/binuti<wbr>ls/binutils/0014-Detect-64-<wbr=
>bit-MIPS-targets.patch<br>
&gt; +++ b/meta/recipes-devtools/binuti<wbr>ls/binutils/0014-Detect-64-<wbr=
>bit-MIPS-targets.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From bf20d5823662d1f2eb47de2cdfd173<wbr>627a205b17 Mon Sep 17 00:00:0=
0 2001<br>
&gt; +From 7dfbd6889d868a09d695dd27361048<wbr>48c1a9c9c3 Mon Sep 17 00:00:0=
0 2001<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Fri, 31 Mar 2017 11:42:03 -0700<br>
&gt;=C2=A0 Subject: [PATCH 14/15] Detect 64-bit MIPS targets<br>
&gt; @@ -14,7 +14,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A01 file changed, 14 insertions(+)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/gold/configure.tgt b/gold/configure.tgt<br>
&gt; -index 3d63027297..c1f92a1360 100644<br>
&gt; +index 8aef22a318..7030026ffa 100644<br>
&gt;=C2=A0 --- a/gold/configure.tgt<br>
&gt;=C2=A0 +++ b/gold/configure.tgt<br>
&gt;=C2=A0 @@ -153,6 +153,13 @@ aarch64*-*)<br>
&gt; @@ -46,5 +46,5 @@ index 3d63027297..c1f92a1360 100644<br>
&gt;=C2=A0 =C2=A0 targ_obj=3Dmips<br>
&gt;=C2=A0 =C2=A0 targ_machine=3DEM_MIPS<br>
&gt;=C2=A0 --<br>
&gt; -2.14.0<br>
&gt; +2.16.1<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/binuti<wbr>ls/binutils/0015-sync-wi=
th-OE-<wbr>libtool-changes.patch b/meta/recipes-devtools/binuti<wbr>ls/binu=
tils/0015-sync-with-OE-<wbr>libtool-changes.patch<br>
&gt; index 2c8900cb66..8c9fd237e7 100644<br>
&gt; --- a/meta/recipes-devtools/binuti<wbr>ls/binutils/0015-sync-with-OE-<=
wbr>libtool-changes.patch<br>
&gt; +++ b/meta/recipes-devtools/binuti<wbr>ls/binutils/0015-sync-with-OE-<=
wbr>libtool-changes.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 9b456a0e4f284fd41ac36595144ed4<wbr>4dc82410ee Mon Sep 17 00:00:0=
0 2001<br>
&gt; +From 298804f430939d6cc94b09732ee93e<wbr>64c5e6be18 Mon Sep 17 00:00:0=
0 2001<br>
&gt;=C2=A0 From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" t=
arget=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 6 Mar 2017 23:33:27 -0800<br>
&gt;=C2=A0 Subject: [PATCH 15/15] sync with OE libtool changes<br>
&gt; @@ -85,5 +85,5 @@ index 11ee684ccc..3b19ac1532 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif test -n &quot;$runpath_var&quot;=
; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &quot;$finalize_perm_rpat=
h &quot; in<br>
&gt;=C2=A0 --<br>
&gt; -2.14.0<br>
&gt; +2.16.1<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/binuti<wbr>ls/<a href=3D"http://bin=
utils_2.29.1.bb" rel=3D"noreferrer" target=3D"_blank">binutils_2.29.1.bb</a=
> b/meta/recipes-devtools/binuti<wbr>ls/<a href=3D"http://binutils_2.30.bb"=
 rel=3D"noreferrer" target=3D"_blank">binutils_2.30.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/binutils<wbr>/<a href=3D"http://binu=
tils_2.29.1.bb" rel=3D"noreferrer" target=3D"_blank">binutils_2.29.1.bb</a>=
<br>
&gt; rename to meta/recipes-devtools/binutils<wbr>/<a href=3D"http://binuti=
ls_2.30.bb" rel=3D"noreferrer" target=3D"_blank">binutils_2.30.bb</a><br>
&gt; --<br>
&gt; 2.16.1<br>
&gt;<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--94eb2c07e806445f800565a26a74--
