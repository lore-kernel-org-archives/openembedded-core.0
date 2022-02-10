Return-Path: <raj.khem@gmail.com>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0ABDC433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 19:19:34 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web09.369.1644520772787667435
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 11:19:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L8yMWC8r;
 spf=pass (domain: gmail.com, ip: 209.85.160.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id s1so6423651qtw.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 11:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=KQBP21jLlYltbPoIptr2uEWKeWpch7lmFLHa9zthz0Y=;
        b=L8yMWC8rUZwAOD/9sdjBffGi01tZ8Ya+UXCueZnyrKfs/u+aHIkbj5nawJozCZ/d7U
         oqo9snZPnT14k5Vu7Ll9K2Y1usFBwpzRehBKGx3Ivg/iprr+FBpF6To+W/jxQdntLfef
         1Ru/aOpEpFtPpkjzPVChdkcH25H++7iZYbBNuGid54/gSd83X+M0ztyE27X66CsWbMr3
         iirfH4yg5zOvwtH+tP94fHg8cszJiO4qqyjZLLj022I7f1xmizjlS4hawqkVY4lhvaC/
         S9iiaTzPobXLCnYyXpMMjNr/TtLVevS0xS+UN6wNBIj4wnAO+5Kszn6/wkZzCI5ZZXfT
         s76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=KQBP21jLlYltbPoIptr2uEWKeWpch7lmFLHa9zthz0Y=;
        b=hGkgQdkc0MAx/LN8rz/o8iSJNHK7JSM/836zF/f2z0S0XztjsR49KO8UR6dCMncVwL
         okTIc4rebJremKqUbMNDfT32G+mz+kjY2jqqYW9WF/mzzKNsDldsXJ1NoczOCkyEZjnG
         zK0IKSGqWkGDK/5ztoT7L6Bv7Sb2ArtDItW8MyffGa+/6myceLVPFuVe1K+LSszDsdzl
         agJQBmf9Ti3vH3PP+tIEb8SniMEZ+I6Xl0jEXUth0r24kkr5t+3O+V96mMVrJxMI0leJ
         2NkK2vrwdqTEoo/BBNOMftXMSSNoTJgVutyMXJ0vtX3o52NGFueYqkbZzPjnYO/YyvuD
         lW4g==
X-Gm-Message-State: AOAM533/m18Hw3gdMSk70URZoyFaunSlkXCOIq5Gtipiulca+U7TRfto
	BEG4j9voI2dttfh8lbM2kpJtsxTv7BajVle1uBFb2GB94veOzg==
X-Google-Smtp-Source: 
 ABdhPJyhl0SdgnVdQRxieBRxrLLC6UBBDHjzrnTieGfhMS+CQcShgImAL4RDRW58qTAVZbioeXp9rDvV6YV8zwuR3Ng=
X-Received: by 2002:a05:622a:1a99:: with SMTP id
 s25mr5885960qtc.634.1644520770045;
 Thu, 10 Feb 2022 11:19:30 -0800 (PST)
MIME-Version: 1.0
References: <20220210183719.3213809-1-raj.khem@gmail.com>
In-Reply-To: <20220210183719.3213809-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Feb 2022 11:19:02 -0800
Message-ID: 
 <CAMKF1spJe5Pe3qAwm1vgkQ+hSukUPezZj7xzgLhaR59o=+17JA@mail.gmail.com>
Subject: Re: [PATCH] binutils: Upgrade to 2.38 release
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Feb 2022 19:19:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161626

Hi Bruce

We will need https://lkml.org/lkml/2022/1/26/855
in kernel backported to let RV64 kernel compile with this upgrade.

On Thu, Feb 10, 2022 at 10:37 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Release Notes are here [1]
>
> [1] https://lists.gnu.org/archive/html/info-gnu/2022-02/msg00009.html
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc   |    2 +-
>  .../binutils/binutils-2.37.inc                |   39 -
>  .../binutils/binutils-2.38.inc                |   35 +
>  ....37.bb =3D> binutils-cross-canadian_2.38.bb} |    0
>  ...37.bb =3D> binutils-cross-testsuite_2.38.bb} |    0
>  ...s-cross_2.37.bb =3D> binutils-cross_2.38.bb} |    0
>  ...ssdk_2.37.bb =3D> binutils-crosssdk_2.38.bb} |    0
>  .../binutils/0001-CVE-2021-42574.patch        | 2001 ---------
>  ...s-crosssdk-Generate-relocatable-SDKs.patch |   12 +-
>  ...rd-input-.note.gnu.build-id-sections.patch |  215 -
>  ...o-not-generate-linker-script-directo.patch |    4 +-
>  ...dk-Search-for-alternative-ld.so.conf.patch |   16 +-
>  ...04-Point-scripts-location-to-libdir.patch} |    8 +-
>  ...RPATH-entry-if-LD_RUN_PATH-is-not-e.patch} |    8 +-
>  ...tro-compiler-point-to-the-wrong-ins.patch} |    6 +-
>  ...system-directories-when-cross-linki.patch} |   48 +-
>  ...ct-assembling-for-ppc-wait-mnemonic.patch} |    7 +-
>  ...l-2.4.patch =3D> 0009-Use-libtool-2.4.patch} | 3964 +++++++++++++----
>  ...-in-libtool-when-sysroot-is-enabled.patch} |    2 +-
>  ...> 0011-sync-with-OE-libtool-changes.patch} |    2 +-
>  ...r-clang-before-checking-gcc-version.patch} |    8 +-
>  ...le-descriptor-if-there-is-no-archive.patch |  234 -
>  ...87d12167b1e36193385485c1f6ce92f74f02.patch |  247 -
>  .../{binutils_2.37.bb =3D> binutils_2.38.bb}    |    0
>  24 files changed, 3132 insertions(+), 3726 deletions(-)
>  delete mode 100644 meta/recipes-devtools/binutils/binutils-2.37.inc
>  create mode 100644 meta/recipes-devtools/binutils/binutils-2.38.inc
>  rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.37.bb =
=3D> binutils-cross-canadian_2.38.bb} (100%)
>  rename meta/recipes-devtools/binutils/{binutils-cross-testsuite_2.37.bb =
=3D> binutils-cross-testsuite_2.38.bb} (100%)
>  rename meta/recipes-devtools/binutils/{binutils-cross_2.37.bb =3D> binut=
ils-cross_2.38.bb} (100%)
>  rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.37.bb =3D> bi=
nutils-crosssdk_2.38.bb} (100%)
>  delete mode 100644 meta/recipes-devtools/binutils/binutils/0001-CVE-2021=
-42574.patch
>  delete mode 100644 meta/recipes-devtools/binutils/binutils/0001-elf-Disc=
ard-input-.note.gnu.build-id-sections.patch
>  rename meta/recipes-devtools/binutils/binutils/{0005-Point-scripts-locat=
ion-to-libdir.patch =3D> 0004-Point-scripts-location-to-libdir.patch} (85%)
>  rename meta/recipes-devtools/binutils/binutils/{0006-Only-generate-an-RP=
ATH-entry-if-LD_RUN_PATH-is-not-e.patch =3D> 0005-Only-generate-an-RPATH-en=
try-if-LD_RUN_PATH-is-not-e.patch} (82%)
>  rename meta/recipes-devtools/binutils/binutils/{0007-don-t-let-the-distr=
o-compiler-point-to-the-wrong-ins.patch =3D> 0006-don-t-let-the-distro-comp=
iler-point-to-the-wrong-ins.patch} (87%)
>  rename meta/recipes-devtools/binutils/binutils/{0008-warn-for-uses-of-sy=
stem-directories-when-cross-linki.patch =3D> 0007-warn-for-uses-of-system-d=
irectories-when-cross-linki.patch} (85%)
>  rename meta/recipes-devtools/binutils/binutils/{0011-fix-the-incorrect-a=
ssembling-for-ppc-wait-mnemonic.patch =3D> 0008-fix-the-incorrect-assemblin=
g-for-ppc-wait-mnemonic.patch} (93%)
>  rename meta/recipes-devtools/binutils/binutils/{0013-Use-libtool-2.4.pat=
ch =3D> 0009-Use-libtool-2.4.patch} (88%)
>  rename meta/recipes-devtools/binutils/binutils/{0014-Fix-rpath-in-libtoo=
l-when-sysroot-is-enabled.patch =3D> 0010-Fix-rpath-in-libtool-when-sysroot=
-is-enabled.patch} (96%)
>  rename meta/recipes-devtools/binutils/binutils/{0015-sync-with-OE-libtoo=
l-changes.patch =3D> 0011-sync-with-OE-libtool-changes.patch} (97%)
>  rename meta/recipes-devtools/binutils/binutils/{0016-Check-for-clang-bef=
ore-checking-gcc-version.patch =3D> 0012-Check-for-clang-before-checking-gc=
c-version.patch} (87%)
>  delete mode 100644 meta/recipes-devtools/binutils/binutils/0017-bfd-Clos=
e-the-file-descriptor-if-there-is-no-archive.patch
>  delete mode 100644 meta/recipes-devtools/binutils/binutils/161e87d12167b=
1e36193385485c1f6ce92f74f02.patch
>  rename meta/recipes-devtools/binutils/{binutils_2.37.bb =3D> binutils_2.=
38.bb} (100%)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dist=
ro/include/tcmode-default.inc
> index adaa11e0f8f..f311e73f8d1 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -18,7 +18,7 @@ PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
>
>  GCCVERSION ?=3D "11.%"
>  SDKGCCVERSION ?=3D "${GCCVERSION}"
> -BINUVERSION ?=3D "2.37%"
> +BINUVERSION ?=3D "2.38%"
>  GDBVERSION ?=3D "11.%"
>  GLIBCVERSION ?=3D "2.35"
>  LINUXLIBCVERSION ?=3D "5.16%"
> diff --git a/meta/recipes-devtools/binutils/binutils-2.37.inc b/meta/reci=
pes-devtools/binutils/binutils-2.37.inc
> deleted file mode 100644
> index bc6eef0fbb4..00000000000
> --- a/meta/recipes-devtools/binutils/binutils-2.37.inc
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -LIC_FILES_CHKSUM=3D"\
> -    file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552\
> -    file://COPYING.LIB;md5=3D9f604d8a4f8e74f4f5140845a21b6674\
> -    file://COPYING3;md5=3Dd32239bcb673463ab874e80d47fae504\
> -    file://COPYING3.LIB;md5=3D6a6a8e020838b23406c81b19c1d46df6\
> -    file://gas/COPYING;md5=3Dd32239bcb673463ab874e80d47fae504\
> -    file://include/COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552\
> -    file://include/COPYING3;md5=3Dd32239bcb673463ab874e80d47fae504\
> -    file://libiberty/COPYING.LIB;md5=3Da916467b91076e631dd8edb7424769c7\
> -    file://bfd/COPYING;md5=3Dd32239bcb673463ab874e80d47fae504\
> -    "
> -
> -# When upgrading to 2.37, please make sure there is no trailing .0, so
> -# that upstream version check can work correctly.
> -PV =3D "2.37"
> -CVE_VERSION =3D "2.37"
> -SRCBRANCH ?=3D "binutils-2_37-branch"
> -
> -UPSTREAM_CHECK_GITTAGREGEX =3D "binutils-(?P<pver>\d+_(\d_?)*)"
> -
> -SRCREV ?=3D "87d4632d36323091e731eb07b8aa65f90293da66"
> -BINUTILS_GIT_URI ?=3D "git://sourceware.org/git/binutils-gdb.git;branch=
=3D${SRCBRANCH};protocol=3Dgit"
> -SRC_URI =3D "\
> -     ${BINUTILS_GIT_URI} \
> -     file://0005-Point-scripts-location-to-libdir.patch \
> -     file://0006-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.pa=
tch \
> -     file://0007-don-t-let-the-distro-compiler-point-to-the-wrong-ins.pa=
tch \
> -     file://0008-warn-for-uses-of-system-directories-when-cross-linki.pa=
tch \
> -     file://0011-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patc=
h \
> -     file://0013-Use-libtool-2.4.patch \
> -     file://0014-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
> -     file://0015-sync-with-OE-libtool-changes.patch \
> -     file://0016-Check-for-clang-before-checking-gcc-version.patch \
> -     file://0017-bfd-Close-the-file-descriptor-if-there-is-no-archive.pa=
tch \
> -     file://0001-elf-Discard-input-.note.gnu.build-id-sections.patch \
> -     file://0001-CVE-2021-42574.patch \
> -     file://161e87d12167b1e36193385485c1f6ce92f74f02.patch \
> -"
> -S  =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/reci=
pes-devtools/binutils/binutils-2.38.inc
> new file mode 100644
> index 00000000000..6d4415048ac
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
> @@ -0,0 +1,35 @@
> +LIC_FILES_CHKSUM=3D"\
> +    file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552\
> +    file://COPYING.LIB;md5=3D9f604d8a4f8e74f4f5140845a21b6674\
> +    file://COPYING3;md5=3Dd32239bcb673463ab874e80d47fae504\
> +    file://COPYING3.LIB;md5=3D6a6a8e020838b23406c81b19c1d46df6\
> +    file://gas/COPYING;md5=3Dd32239bcb673463ab874e80d47fae504\
> +    file://include/COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552\
> +    file://include/COPYING3;md5=3Dd32239bcb673463ab874e80d47fae504\
> +    file://libiberty/COPYING.LIB;md5=3Da916467b91076e631dd8edb7424769c7\
> +    file://bfd/COPYING;md5=3Dd32239bcb673463ab874e80d47fae504\
> +    "
> +
> +# When upgrading to 2.39, please make sure there is no trailing .0, so
> +# that upstream version check can work correctly.
> +PV =3D "2.38"
> +CVE_VERSION =3D "2.38"
> +SRCBRANCH ?=3D "binutils-2_38-branch"
> +
> +UPSTREAM_CHECK_GITTAGREGEX =3D "binutils-(?P<pver>\d+_(\d_?)*)"
> +
> +SRCREV ?=3D "a96f7ba94b69b588bf524624ff2410b31420c957"
> +BINUTILS_GIT_URI ?=3D "git://sourceware.org/git/binutils-gdb.git;branch=
=3D${SRCBRANCH};protocol=3Dgit"
> +SRC_URI =3D "\
> +     ${BINUTILS_GIT_URI} \
> +     file://0004-Point-scripts-location-to-libdir.patch \
> +     file://0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.pa=
tch \
> +     file://0006-don-t-let-the-distro-compiler-point-to-the-wrong-ins.pa=
tch \
> +     file://0007-warn-for-uses-of-system-directories-when-cross-linki.pa=
tch \
> +     file://0008-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patc=
h \
> +     file://0009-Use-libtool-2.4.patch \
> +     file://0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch \
> +     file://0011-sync-with-OE-libtool-changes.patch \
> +     file://0012-Check-for-clang-before-checking-gcc-version.patch \
> +"
> +S  =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.37.=
bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.38.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils-cross-canadian_2.37.b=
b
> rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.38.bb
> diff --git a/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.37=
.bb b/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.38.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils-cross-testsuite_2.37.=
bb
> rename to meta/recipes-devtools/binutils/binutils-cross-testsuite_2.38.bb
> diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.37.bb b/meta=
/recipes-devtools/binutils/binutils-cross_2.38.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils-cross_2.37.bb
> rename to meta/recipes-devtools/binutils/binutils-cross_2.38.bb
> diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.37.bb b/m=
eta/recipes-devtools/binutils/binutils-crosssdk_2.38.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.37.bb
> rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.38.bb
> diff --git a/meta/recipes-devtools/binutils/binutils/0001-CVE-2021-42574.=
patch b/meta/recipes-devtools/binutils/binutils/0001-CVE-2021-42574.patch
> deleted file mode 100644
> index 0622ae389eb..00000000000
> --- a/meta/recipes-devtools/binutils/binutils/0001-CVE-2021-42574.patch
> +++ /dev/null
> @@ -1,2001 +0,0 @@
> -From b3aa80b45c4f46029efeb204bb9f2d2c4278a0e5 Mon Sep 17 00:00:00 2001
> -From: Nick Clifton <nickc@redhat.com>
> -Date: Tue, 9 Nov 2021 13:25:42 +0000
> -Subject: [PATCH] Add --unicode option to control how unicode characters =
are
> - handled by display tools.
> -
> -       * nm.c: Add --unicode option to control how unicode characters ar=
e
> -       handled.
> -       * objdump.c: Likewise.
> -       * readelf.c: Likewise.
> -       * strings.c: Likewise.
> -       * binutils.texi: Document the new feature.
> -       * NEWS: Document the new feature.
> -       * testsuite/binutils-all/unicode.exp: New file.
> -       * testsuite/binutils-all/nm.hex.unicode
> -       * testsuite/binutils-all/strings.escape.unicode
> -       * testsuite/binutils-all/objdump.highlight.unicode
> -       * testsuite/binutils-all/readelf.invalid.unicode
> -
> -CVE: CVE-2021-42574
> -Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.=
git;a=3Dcommit;h=3Db3aa80b45c4f46029efeb204bb9f2d2c4278a0e5]
> -
> -RP: Added tweak uint -> unsigned int partial backport of
> -https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdiff;h=3D7955=
88aec4f894206863c938bd6d716895886009
> -
> -Signed-off-by: pgowda <pgowda.cve@gmail.com>
> ----
> - binutils/ChangeLog         |  15 +
> - binutils/NEWS              |   9 +
> - binutils/doc/binutils.texi |  78 ++++
> - binutils/nm.c              | 228 ++++++++++-
> - binutils/objdump.c         | 235 ++++++++++--
> - binutils/readelf.c         | 190 +++++++++-
> - binutils/strings.c         | 757 ++++++++++++++++++++++++++++++++++---
> - 7 files changed, 1409 insertions(+), 103 deletions(-)
> -
> -diff --git a/binutils/ChangeLog b/binutils/ChangeLog
> ---- a/binutils/ChangeLog       2021-12-19 19:00:27.038540406 -0800
> -+++ b/binutils/ChangeLog       2021-12-19 19:28:42.733565078 -0800
> -@@ -1,3 +1,18 @@
> -+2021-11-09  Nick Clifton  <nickc@redhat.com>
> -+
> -+      * nm.c: Add --unicode option to control how unicode characters ar=
e
> -+      handled.
> -+      * objdump.c: Likewise.
> -+      * readelf.c: Likewise.
> -+      * strings.c: Likewise.
> -+      * binutils.texi: Document the new feature.
> -+      * NEWS: Document the new feature.
> -+      * testsuite/binutils-all/unicode.exp: New file.
> -+      * testsuite/binutils-all/nm.hex.unicode
> -+      * testsuite/binutils-all/strings.escape.unicode
> -+      * testsuite/binutils-all/objdump.highlight.unicode
> -+      * testsuite/binutils-all/readelf.invalid.unicode
> -+
> - 2021-07-16  Nick Clifton  <nickc@redhat.com>
> -
> -       * po/sv.po: Updated Swedish translation.
> -diff --git a/binutils/doc/binutils.texi b/binutils/doc/binutils.texi
> ---- a/binutils/doc/binutils.texi       2021-12-19 19:00:27.042540338 -08=
00
> -+++ b/binutils/doc/binutils.texi       2021-12-19 19:27:56.526354667 -08=
00
> -@@ -812,6 +812,7 @@ nm [@option{-A}|@option{-o}|@option{--pr
> -    [@option{-s}|@option{--print-armap}]
> -    [@option{-t} @var{radix}|@option{--radix=3D}@var{radix}]
> -    [@option{-u}|@option{--undefined-only}]
> -+   [@option{-U} @var{method}] [@option{--unicode=3D}@var{method}]
> -    [@option{-V}|@option{--version}]
> -    [@option{-X 32_64}]
> -    [@option{--defined-only}]
> -@@ -1132,6 +1133,21 @@ Use @var{radix} as the radix for printin
> - @cindex undefined symbols
> - Display only undefined symbols (those external to each object file).
> -
> -+@item -U @var{[d|i|l|e|x|h]}
> -+@itemx --unicode=3D@var{[default|invalid|locale|escape|hex|highlight]}
> -+Controls the display of UTF-8 encoded mulibyte characters in strings.
> -+The default (@option{--unicode=3Ddefault}) is to give them no special
> -+treatment.  The @option{--unicode=3Dlocale} option displays the sequenc=
e
> -+in the current locale, which may or may not support them.  The options
> -+@option{--unicode=3Dhex} and @option{--unicode=3Dinvalid} display them =
as
> -+hex byte sequences enclosed by either angle brackets or curly braces.
> -+
> -+The @option{--unicode=3Descape} option displays them as escape sequence=
s
> -+(@var{\uxxxx}) and the @option{--unicode=3Dhighlight} option displays
> -+them as escape sequences highlighted in red (if supported by the
> -+output device).  The colouring is intended to draw attention to the
> -+presence of unicode sequences where they might not be expected.
> -+
> - @item -V
> - @itemx --version
> - Show the version number of @command{nm} and exit.
> -@@ -2247,6 +2263,7 @@ objdump [@option{-a}|@option{--archive-h
> -         [@option{--prefix-strip=3D}@var{level}]
> -         [@option{--insn-width=3D}@var{width}]
> -         [@option{--visualize-jumps[=3Dcolor|=3Dextended-color|=3Doff]}
> -+        [@option{-U} @var{method}] [@option{--unicode=3D}@var{method}]
> -         [@option{-V}|@option{--version}]
> -         [@option{-H}|@option{--help}]
> -         @var{objfile}@dots{}
> -@@ -2921,6 +2938,21 @@ When displaying symbols include those wh
> - special in some way and which would not normally be of interest to the
> - user.
> -
> -+@item -U @var{[d|i|l|e|x|h]}
> -+@itemx --unicode=3D@var{[default|invalid|locale|escape|hex|highlight]}
> -+Controls the display of UTF-8 encoded mulibyte characters in strings.
> -+The default (@option{--unicode=3Ddefault}) is to give them no special
> -+treatment.  The @option{--unicode=3Dlocale} option displays the sequenc=
e
> -+in the current locale, which may or may not support them.  The options
> -+@option{--unicode=3Dhex} and @option{--unicode=3Dinvalid} display them =
as
> -+hex byte sequences enclosed by either angle brackets or curly braces.
> -+
> -+The @option{--unicode=3Descape} option displays them as escape sequence=
s
> -+(@var{\uxxxx}) and the @option{--unicode=3Dhighlight} option displays
> -+them as escape sequences highlighted in red (if supported by the
> -+output device).  The colouring is intended to draw attention to the
> -+presence of unicode sequences where they might not be expected.
> -+
> - @item -V
> - @itemx --version
> - Print the version number of @command{objdump} and exit.
> -@@ -3197,6 +3229,7 @@ strings [@option{-afovV}] [@option{-}@va
> -         [@option{-n} @var{min-len}] [@option{--bytes=3D}@var{min-len}]
> -         [@option{-t} @var{radix}] [@option{--radix=3D}@var{radix}]
> -         [@option{-e} @var{encoding}] [@option{--encoding=3D}@var{encodi=
ng}]
> -+        [@option{-U} @var{method}] [@option{--unicode=3D}@var{method}]
> -         [@option{-}] [@option{--all}] [@option{--print-file-name}]
> -         [@option{-T} @var{bfdname}] [@option{--target=3D}@var{bfdname}]
> -         [@option{-w}] [@option{--include-all-whitespace}]
> -@@ -3288,6 +3321,28 @@ single-8-bit-byte characters, @samp{b} =3D
> - littleendian.  Useful for finding wide character strings. (@samp{l}
> - and @samp{b} apply to, for example, Unicode UTF-16/UCS-2 encodings).
> -
> -+@item -U @var{[d|i|l|e|x|h]}
> -+@itemx --unicode=3D@var{[default|invalid|locale|escape|hex|highlight]}
> -+Controls the display of UTF-8 encoded mulibyte characters in strings.
> -+The default (@option{--unicode=3Ddefault}) is to give them no special
> -+treatment, and instead rely upon the setting of the
> -+@option{--encoding} option.  The other values for this option
> -+automatically enable @option{--encoding=3DS}.
> -+
> -+The @option{--unicode=3Dinvalid} option treats them as non-graphic
> -+characters and hence not part of a valid string.  All the remaining
> -+options treat them as valid string characters.
> -+
> -+The @option{--unicode=3Dlocale} option displays them in the current
> -+locale, which may or may not support UTF-8 encoding.  The
> -+@option{--unicode=3Dhex} option displays them as hex byte sequences
> -+enclosed between @var{<>} characters.  The @option{--unicode=3Descape}
> -+option displays them as escape sequences (@var{\uxxxx}) and the
> -+@option{--unicode=3Dhighlight} option displays them as escape sequences
> -+highlighted in red (if supported by the output device).  The colouring
> -+is intended to draw attention to the presence of unicode sequences
> -+where they might not be expected.
> -+
> - @item -T @var{bfdname}
> - @itemx --target=3D@var{bfdname}
> - @cindex object code format
> -@@ -4796,6 +4851,7 @@ readelf [@option{-a}|@option{--all}]
> -         [@option{--demangle@var{=3Dstyle}}|@option{--no-demangle}]
> -         [@option{--quiet}]
> -         [@option{--recurse-limit}|@option{--no-recurse-limit}]
> -+        [@option{-U} @var{method}|@option{--unicode=3D}@var{method}]
> -         [@option{-n}|@option{--notes}]
> -         [@option{-r}|@option{--relocs}]
> -         [@option{-u}|@option{--unwind}]
> -@@ -4962,6 +5018,28 @@ necessary in order to demangle truly com
> - that if the recursion limit is disabled then stack exhaustion is
> - possible and any bug reports about such an event will be rejected.
> -
> -+@item -U @var{[d|i|l|e|x|h]}
> -+@itemx --unicode=3D[default|invalid|locale|escape|hex|highlight]
> -+Controls the display of non-ASCII characters in identifier names.
> -+The default (@option{--unicode=3Dlocale} or @option{--unicode=3Ddefault=
}) is
> -+to treat them as multibyte characters and display them in the current
> -+locale.  All other versions of this option treat the bytes as UTF-8
> -+encoded values and attempt to interpret them.  If they cannot be
> -+interpreted or if the @option{--unicode=3Dinvalid} option is used then
> -+they are displayed as a sequence of hex bytes, encloses in curly
> -+parethesis characters.
> -+
> -+Using the @option{--unicode=3Descape} option will display the character=
s
> -+as as unicode escape sequences (@var{\uxxxx}).  Using the
> -+@option{--unicode=3Dhex} will display the characters as hex byte
> -+sequences enclosed between angle brackets.
> -+
> -+Using the @option{--unicode=3Dhighlight} will display the characters as
> -+unicode escape sequences but it will also highlighted them in red,
> -+assuming that colouring is supported by the output device.  The
> -+colouring is intended to draw attention to the presence of unicode
> -+sequences when they might not be expected.
> -+
> - @item -e
> - @itemx --headers
> - Display all the headers in the file.  Equivalent to @option{-h -l -S}.
> -diff --git a/binutils/NEWS b/binutils/NEWS
> ---- a/binutils/NEWS    2021-12-19 19:00:27.038540406 -0800
> -+++ b/binutils/NEWS    2021-12-19 19:30:04.764162972 -0800
> -@@ -1,5 +1,14 @@
> - -*- text -*-
> -
> -+* Tools which display symbols or strings (readelf, strings, nm, objdump=
)
> -+  have a new command line option which controls how unicode characters =
are
> -+  handled.  By default they are treated as normal for the tool.  Using
> -+  --unicode=3Dlocale will display them according to the current locale.
> -+  Using --unicode=3Dhex will display them as hex byte values, whilst
> -+  --unicode=3Descape will display them as escape sequences.  In additio=
n
> -+  using --unicode=3Dhighlight will display them as unicode escape seque=
nces
> -+  highlighted in red (if supported by the output device).
> -+
> - Changes in 2.37:
> -
> - * The readelf tool has a new command line option which can be used to s=
pecify
> -diff --git a/binutils/nm.c b/binutils/nm.c
> ---- a/binutils/nm.c    2021-12-19 19:00:27.046540270 -0800
> -+++ b/binutils/nm.c    2021-12-19 19:36:34.797491555 -0800
> -@@ -38,6 +38,11 @@
> - #include "bucomm.h"
> - #include "plugin-api.h"
> - #include "plugin.h"
> -+#include "safe-ctype.h"
> -+
> -+#ifndef streq
> -+#define streq(a,b) (strcmp ((a),(b)) =3D=3D 0)
> -+#endif
> -
> - /* When sorting by size, we use this structure to hold the size and a
> -    pointer to the minisymbol.  */
> -@@ -216,6 +221,18 @@ static const char *plugin_target =3D NULL;
> - static bfd *lineno_cache_bfd;
> - static bfd *lineno_cache_rel_bfd;
> -
> -+typedef enum unicode_display_type
> -+{
> -+  unicode_default =3D 0,
> -+  unicode_locale,
> -+  unicode_escape,
> -+  unicode_hex,
> -+  unicode_highlight,
> -+  unicode_invalid
> -+} unicode_display_type;
> -+
> -+static unicode_display_type unicode_display =3D unicode_default;
> -+
> - enum long_option_values
> - {
> -   OPTION_TARGET =3D 200,
> -@@ -260,6 +277,7 @@ static struct option long_options[] =3D
> -   {"target", required_argument, 0, OPTION_TARGET},
> -   {"defined-only", no_argument, &defined_only, 1},
> -   {"undefined-only", no_argument, &undefined_only, 1},
> -+  {"unicode", required_argument, NULL, 'U'},
> -   {"version", no_argument, &show_version, 1},
> -   {"with-symbol-versions", no_argument, &with_symbol_versions, 1},
> -   {"without-symbol-versions", no_argument, &with_symbol_versions, 0},
> -@@ -313,6 +331,8 @@ usage (FILE *stream, int status)
> -   -t, --radix=3DRADIX      Use RADIX for printing symbol values\n\
> -       --target=3DBFDNAME   Specify the target object format as BFDNAME\=
n\
> -   -u, --undefined-only   Display only undefined symbols\n\
> -+  -U {d|s|i|x|e|h}       Specify how to treat UTF-8 encoded unicode cha=
racters\n\
> -+      --unicode=3D{default|show|invalid|hex|escape|highlight}\n\
> -       --with-symbol-versions  Display version strings after symbol name=
s\n\
> -   -X 32_64               (ignored)\n\
> -   @FILE                  Read options from FILE\n\
> -@@ -432,6 +452,187 @@ get_coff_symbol_type (const struct inter
> -   return bufp;
> - }
> -
> -+/* Convert a potential UTF-8 encoded sequence in IN into characters in =
OUT.
> -+   The conversion format is controlled by the unicode_display variable.
> -+   Returns the number of characters added to OUT.
> -+   Returns the number of bytes consumed from IN in CONSUMED.
> -+   Always consumes at least one byte and displays at least one characte=
r.  */
> -+
> -+static unsigned int
> -+display_utf8 (const unsigned char * in, char * out, unsigned int * cons=
umed)
> -+{
> -+  char *        orig_out =3D out;
> -+  unsigned int  nchars =3D 0;
> -+  unsigned int j;
> -+
> -+  if (unicode_display =3D=3D unicode_default)
> -+    goto invalid;
> -+
> -+  if (in[0] < 0xc0)
> -+    goto invalid;
> -+
> -+  if ((in[1] & 0xc0) !=3D 0x80)
> -+    goto invalid;
> -+
> -+  if ((in[0] & 0x20) =3D=3D 0)
> -+    {
> -+      nchars =3D 2;
> -+      goto valid;
> -+    }
> -+
> -+  if ((in[2] & 0xc0) !=3D 0x80)
> -+    goto invalid;
> -+
> -+  if ((in[0] & 0x10) =3D=3D 0)
> -+    {
> -+      nchars =3D 3;
> -+      goto valid;
> -+    }
> -+
> -+  if ((in[3] & 0xc0) !=3D 0x80)
> -+    goto invalid;
> -+
> -+  nchars =3D 4;
> -+
> -+ valid:
> -+  switch (unicode_display)
> -+    {
> -+    case unicode_locale:
> -+      /* Copy the bytes into the output buffer as is.  */
> -+      memcpy (out, in, nchars);
> -+      out +=3D nchars;
> -+      break;
> -+
> -+    case unicode_invalid:
> -+    case unicode_hex:
> -+      out +=3D sprintf (out, "%c", unicode_display =3D=3D unicode_hex ?=
 '<' : '{');
> -+      out +=3D sprintf (out, "0x");
> -+      for (j =3D 0; j < nchars; j++)
> -+      out +=3D sprintf (out, "%02x", in [j]);
> -+      out +=3D sprintf (out, "%c", unicode_display =3D=3D unicode_hex ?=
 '>' : '}');
> -+      break;
> -+
> -+    case unicode_highlight:
> -+      if (isatty (1))
> -+      out +=3D sprintf (out, "\x1B[31;47m"); /* Red.  */
> -+      /* Fall through.  */
> -+    case unicode_escape:
> -+      switch (nchars)
> -+      {
> -+      case 2:
> -+        out +=3D sprintf (out, "\\u%02x%02x",
> -+                ((in[0] & 0x1c) >> 2),
> -+                ((in[0] & 0x03) << 6) | (in[1] & 0x3f));
> -+        break;
> -+
> -+      case 3:
> -+        out +=3D sprintf (out, "\\u%02x%02x",
> -+                ((in[0] & 0x0f) << 4) | ((in[1] & 0x3c) >> 2),
> -+                ((in[1] & 0x03) << 6) | ((in[2] & 0x3f)));
> -+        break;
> -+
> -+      case 4:
> -+        out +=3D sprintf (out, "\\u%02x%02x%02x",
> -+                ((in[0] & 0x07) << 6) | ((in[1] & 0x3c) >> 2),
> -+                ((in[1] & 0x03) << 6) | ((in[2] & 0x3c) >> 2),
> -+                ((in[2] & 0x03) << 6) | ((in[3] & 0x3f)));
> -+        break;
> -+      default:
> -+        /* URG.  */
> -+        break;
> -+      }
> -+
> -+      if (unicode_display =3D=3D unicode_highlight && isatty (1))
> -+      out +=3D sprintf (out, "\033[0m"); /* Default colour.  */
> -+      break;
> -+
> -+    default:
> -+      /* URG */
> -+      break;
> -+    }
> -+
> -+  * consumed =3D nchars;
> -+  return out - orig_out;
> -+
> -+ invalid:
> -+  /* Not a valid UTF-8 sequence.  */
> -+  *out =3D *in;
> -+  * consumed =3D 1;
> -+  return 1;
> -+}
> -+
> -+/* Convert any UTF-8 encoded characters in NAME into the form specified=
 by
> -+   unicode_display.  Also converts control characters.  Returns a stati=
c
> -+   buffer if conversion was necessary.
> -+   Code stolen from objdump.c:sanitize_string().  */
> -+
> -+static const char *
> -+convert_utf8 (const char * in)
> -+{
> -+  static char *  buffer =3D NULL;
> -+  static size_t  buffer_len =3D 0;
> -+  const char *   original =3D in;
> -+  char *         out;
> -+
> -+  /* Paranoia.  */
> -+  if (in =3D=3D NULL)
> -+    return "";
> -+
> -+  /* See if any conversion is necessary.
> -+     In the majority of cases it will not be needed.  */
> -+  do
> -+    {
> -+      unsigned char c =3D *in++;
> -+
> -+      if (c =3D=3D 0)
> -+      return original;
> -+
> -+      if (ISCNTRL (c))
> -+      break;
> -+
> -+      if (unicode_display !=3D unicode_default && c >=3D 0xc0)
> -+      break;
> -+    }
> -+  while (1);
> -+
> -+  /* Copy the input, translating as needed.  */
> -+  in =3D original;
> -+  if (buffer_len < (strlen (in) * 9))
> -+    {
> -+      free ((void *) buffer);
> -+      buffer_len =3D strlen (in) * 9;
> -+      buffer =3D xmalloc (buffer_len + 1);
> -+    }
> -+
> -+  out =3D buffer;
> -+  do
> -+    {
> -+      unsigned char c =3D *in++;
> -+
> -+      if (c =3D=3D 0)
> -+      break;
> -+
> -+      if (ISCNTRL (c))
> -+      {
> -+        *out++ =3D '^';
> -+        *out++ =3D c + 0x40;
> -+      }
> -+      else if (unicode_display !=3D unicode_default && c >=3D 0xc0)
> -+      {
> -+        unsigned int num_consumed;
> -+
> -+        out +=3D display_utf8 ((const unsigned char *)(in - 1), out, & =
num_consumed);
> -+        in +=3D num_consumed - 1;
> -+      }
> -+      else
> -+      *out++ =3D c;
> -+    }
> -+  while (1);
> -+
> -+  *out =3D 0;
> -+  return buffer;
> -+}
> -+
> - /* Print symbol name NAME, read from ABFD, with printf format FORM,
> -    demangling it if requested.  */
> -
> -@@ -444,6 +645,7 @@ print_symname (const char *form, struct
> -
> -   if (name =3D=3D NULL)
> -     name =3D info->sinfo->name;
> -+
> -   if (!with_symbol_versions
> -       && bfd_get_flavour (abfd) =3D=3D bfd_target_elf_flavour)
> -     {
> -@@ -451,6 +653,7 @@ print_symname (const char *form, struct
> -       if (atver)
> -       *atver =3D 0;
> -     }
> -+
> -   if (do_demangle && *name)
> -     {
> -       alloc =3D bfd_demangle (abfd, name, demangle_flags);
> -@@ -458,6 +661,11 @@ print_symname (const char *form, struct
> -       name =3D alloc;
> -     }
> -
> -+  if (unicode_display !=3D unicode_default)
> -+    {
> -+      name =3D convert_utf8 (name);
> -+    }
> -+
> -   if (info !=3D NULL && info->elfinfo && with_symbol_versions)
> -     {
> -       const char *version_string;
> -@@ -1807,7 +2015,7 @@ main (int argc, char **argv)
> -     fatal (_("fatal error: libbfd ABI mismatch"));
> -   set_default_bfd_target ();
> -
> --  while ((c =3D getopt_long (argc, argv, "aABCDef:gHhjJlnopPrSst:uvVvX:=
",
> -+  while ((c =3D getopt_long (argc, argv, "aABCDef:gHhjJlnopPrSst:uU:vVv=
X:",
> -                          long_options, (int *) 0)) !=3D EOF)
> -     {
> -       switch (c)
> -@@ -1900,6 +2108,24 @@ main (int argc, char **argv)
> -       case 'u':
> -         undefined_only =3D 1;
> -         break;
> -+
> -+      case 'U':
> -+        if (streq (optarg, "default") || streq (optarg, "d"))
> -+          unicode_display =3D unicode_default;
> -+        else if (streq (optarg, "locale") || streq (optarg, "l"))
> -+          unicode_display =3D unicode_locale;
> -+        else if (streq (optarg, "escape") || streq (optarg, "e"))
> -+          unicode_display =3D unicode_escape;
> -+        else if (streq (optarg, "invalid") || streq (optarg, "i"))
> -+          unicode_display =3D unicode_invalid;
> -+        else if (streq (optarg, "hex") || streq (optarg, "x"))
> -+          unicode_display =3D unicode_hex;
> -+        else if (streq (optarg, "highlight") || streq (optarg, "h"))
> -+          unicode_display =3D unicode_highlight;
> -+        else
> -+          fatal (_("invalid argument to -U/--unicode: %s"), optarg);
> -+        break;
> -+
> -       case 'V':
> -         show_version =3D 1;
> -         break;
> -diff --git a/binutils/objdump.c b/binutils/objdump.c
> ---- a/binutils/objdump.c       2021-12-19 19:00:27.046540270 -0800
> -+++ b/binutils/objdump.c       2021-12-19 19:43:09.438736729 -0800
> -@@ -204,6 +204,18 @@ static const struct objdump_private_desc
> -
> - /* The list of detected jumps inside a function.  */
> - static struct jump_info *detected_jumps =3D NULL;
> -+
> -+typedef enum unicode_display_type
> -+{
> -+  unicode_default =3D 0,
> -+  unicode_locale,
> -+  unicode_escape,
> -+  unicode_hex,
> -+  unicode_highlight,
> -+  unicode_invalid
> -+} unicode_display_type;
> -+
> -+static unicode_display_type unicode_display =3D unicode_default;
> -
> - static void usage (FILE *, int) ATTRIBUTE_NORETURN;
> - static void
> -@@ -330,6 +342,9 @@ usage (FILE *stream, int status)
> -       fprintf (stream, _("\
> -   -w, --wide                     Format output for more than 80 columns=
\n"));
> -       fprintf (stream, _("\
> -+  -U[d|l|i|x|e|h]                Controls the display of UTF-8 unicode =
characters\n\
> -+  --unicode=3D[default|locale|invalid|hex|escape|highlight]\n"));
> -+      fprintf (stream, _("\
> -   -z, --disassemble-zeroes       Do not skip blocks of zeroes when disa=
ssembling\n"));
> -       fprintf (stream, _("\
> -       --start-address=3DADDR       Only process data whose address is >=
=3D ADDR\n"));
> -@@ -420,17 +435,23 @@ static struct option long_options[]=3D
> - {
> -   {"adjust-vma", required_argument, NULL, OPTION_ADJUST_VMA},
> -   {"all-headers", no_argument, NULL, 'x'},
> --  {"private-headers", no_argument, NULL, 'p'},
> --  {"private", required_argument, NULL, 'P'},
> -   {"architecture", required_argument, NULL, 'm'},
> -   {"archive-headers", no_argument, NULL, 'a'},
> -+#ifdef ENABLE_LIBCTF
> -+  {"ctf", required_argument, NULL, OPTION_CTF},
> -+  {"ctf-parent", required_argument, NULL, OPTION_CTF_PARENT},
> -+#endif
> -   {"debugging", no_argument, NULL, 'g'},
> -   {"debugging-tags", no_argument, NULL, 'e'},
> -   {"demangle", optional_argument, NULL, 'C'},
> -   {"disassemble", optional_argument, NULL, 'd'},
> -   {"disassemble-all", no_argument, NULL, 'D'},
> --  {"disassembler-options", required_argument, NULL, 'M'},
> -   {"disassemble-zeroes", no_argument, NULL, 'z'},
> -+  {"disassembler-options", required_argument, NULL, 'M'},
> -+  {"dwarf", optional_argument, NULL, OPTION_DWARF},
> -+  {"dwarf-check", no_argument, 0, OPTION_DWARF_CHECK},
> -+  {"dwarf-depth", required_argument, 0, OPTION_DWARF_DEPTH},
> -+  {"dwarf-start", required_argument, 0, OPTION_DWARF_START},
> -   {"dynamic-reloc", no_argument, NULL, 'R'},
> -   {"dynamic-syms", no_argument, NULL, 'T'},
> -   {"endian", required_argument, NULL, OPTION_ENDIAN},
> -@@ -440,16 +461,23 @@ static struct option long_options[]=3D
> -   {"full-contents", no_argument, NULL, 's'},
> -   {"headers", no_argument, NULL, 'h'},
> -   {"help", no_argument, NULL, 'H'},
> -+  {"include", required_argument, NULL, 'I'},
> -   {"info", no_argument, NULL, 'i'},
> -+  {"inlines", no_argument, 0, OPTION_INLINES},
> -+  {"insn-width", required_argument, NULL, OPTION_INSN_WIDTH},
> -   {"line-numbers", no_argument, NULL, 'l'},
> --  {"no-show-raw-insn", no_argument, &show_raw_insn, -1},
> -   {"no-addresses", no_argument, &no_addresses, 1},
> --  {"process-links", no_argument, &process_links, true},
> -+  {"no-recurse-limit", no_argument, NULL, OPTION_NO_RECURSE_LIMIT},
> -+  {"no-recursion-limit", no_argument, NULL, OPTION_NO_RECURSE_LIMIT},
> -+  {"no-show-raw-insn", no_argument, &show_raw_insn, -1},
> -+  {"prefix", required_argument, NULL, OPTION_PREFIX},
> -   {"prefix-addresses", no_argument, &prefix_addresses, 1},
> -+  {"prefix-strip", required_argument, NULL, OPTION_PREFIX_STRIP},
> -+  {"private", required_argument, NULL, 'P'},
> -+  {"private-headers", no_argument, NULL, 'p'},
> -+  {"process-links", no_argument, &process_links, true},
> -   {"recurse-limit", no_argument, NULL, OPTION_RECURSE_LIMIT},
> -   {"recursion-limit", no_argument, NULL, OPTION_RECURSE_LIMIT},
> --  {"no-recurse-limit", no_argument, NULL, OPTION_NO_RECURSE_LIMIT},
> --  {"no-recursion-limit", no_argument, NULL, OPTION_NO_RECURSE_LIMIT},
> -   {"reloc", no_argument, NULL, 'r'},
> -   {"section", required_argument, NULL, 'j'},
> -   {"section-headers", no_argument, NULL, 'h'},
> -@@ -457,28 +485,16 @@ static struct option long_options[]=3D
> -   {"source", no_argument, NULL, 'S'},
> -   {"source-comment", optional_argument, NULL, OPTION_SOURCE_COMMENT},
> -   {"special-syms", no_argument, &dump_special_syms, 1},
> --  {"include", required_argument, NULL, 'I'},
> --  {"dwarf", optional_argument, NULL, OPTION_DWARF},
> --#ifdef ENABLE_LIBCTF
> --  {"ctf", required_argument, NULL, OPTION_CTF},
> --  {"ctf-parent", required_argument, NULL, OPTION_CTF_PARENT},
> --#endif
> -   {"stabs", no_argument, NULL, 'G'},
> -   {"start-address", required_argument, NULL, OPTION_START_ADDRESS},
> -   {"stop-address", required_argument, NULL, OPTION_STOP_ADDRESS},
> -   {"syms", no_argument, NULL, 't'},
> -   {"target", required_argument, NULL, 'b'},
> -+  {"unicode", required_argument, NULL, 'U'},
> -   {"version", no_argument, NULL, 'V'},
> --  {"wide", no_argument, NULL, 'w'},
> --  {"prefix", required_argument, NULL, OPTION_PREFIX},
> --  {"prefix-strip", required_argument, NULL, OPTION_PREFIX_STRIP},
> --  {"insn-width", required_argument, NULL, OPTION_INSN_WIDTH},
> --  {"dwarf-depth", required_argument, 0, OPTION_DWARF_DEPTH},
> --  {"dwarf-start", required_argument, 0, OPTION_DWARF_START},
> --  {"dwarf-check", no_argument, 0, OPTION_DWARF_CHECK},
> --  {"inlines", no_argument, 0, OPTION_INLINES},
> -   {"visualize-jumps", optional_argument, 0, OPTION_VISUALIZE_JUMPS},
> --  {0, no_argument, 0, 0}
> -+  {"wide", no_argument, NULL, 'w'},
> -+  {NULL, no_argument, NULL, 0}
> - };
> -
> - static void
> -@@ -488,9 +504,121 @@ nonfatal (const char *msg)
> -   exit_status =3D 1;
> - }
> -
> -+/* Convert a potential UTF-8 encoded sequence in IN into characters in =
OUT.
> -+   The conversion format is controlled by the unicode_display variable.
> -+   Returns the number of characters added to OUT.
> -+   Returns the number of bytes consumed from IN in CONSUMED.
> -+   Always consumes at least one byte and displays at least one characte=
r.  */
> -+
> -+static unsigned int
> -+display_utf8 (const unsigned char * in, char * out, unsigned int * cons=
umed)
> -+{
> -+  char *        orig_out =3D out;
> -+  unsigned int  nchars =3D 0;
> -+  unsigned int j;
> -+
> -+  if (unicode_display =3D=3D unicode_default)
> -+    goto invalid;
> -+
> -+  if (in[0] < 0xc0)
> -+    goto invalid;
> -+
> -+  if ((in[1] & 0xc0) !=3D 0x80)
> -+    goto invalid;
> -+
> -+  if ((in[0] & 0x20) =3D=3D 0)
> -+    {
> -+      nchars =3D 2;
> -+      goto valid;
> -+    }
> -+
> -+  if ((in[2] & 0xc0) !=3D 0x80)
> -+    goto invalid;
> -+
> -+  if ((in[0] & 0x10) =3D=3D 0)
> -+    {
> -+      nchars =3D 3;
> -+      goto valid;
> -+    }
> -+
> -+  if ((in[3] & 0xc0) !=3D 0x80)
> -+    goto invalid;
> -+
> -+  nchars =3D 4;
> -+
> -+ valid:
> -+  switch (unicode_display)
> -+    {
> -+    case unicode_locale:
> -+      /* Copy the bytes into the output buffer as is.  */
> -+      memcpy (out, in, nchars);
> -+      out +=3D nchars;
> -+      break;
> -+
> -+    case unicode_invalid:
> -+    case unicode_hex:
> -+      out +=3D sprintf (out, "%c", unicode_display =3D=3D unicode_hex ?=
 '<' : '{');
> -+      out +=3D sprintf (out, "0x");
> -+      for (j =3D 0; j < nchars; j++)
> -+      out +=3D sprintf (out, "%02x", in [j]);
> -+      out +=3D sprintf (out, "%c", unicode_display =3D=3D unicode_hex ?=
 '>' : '}');
> -+      break;
> -+
> -+    case unicode_highlight:
> -+      if (isatty (1))
> -+      out +=3D sprintf (out, "\x1B[31;47m"); /* Red.  */
> -+      /* Fall through.  */
> -+    case unicode_escape:
> -+      switch (nchars)
> -+      {
> -+      case 2:
> -+        out +=3D sprintf (out, "\\u%02x%02x",
> -+                ((in[0] & 0x1c) >> 2),
> -+                ((in[0] & 0x03) << 6) | (in[1] & 0x3f));
> -+        break;
> -+
> -+      case 3:
> -+        out +=3D sprintf (out, "\\u%02x%02x",
> -+                ((in[0] & 0x0f) << 4) | ((in[1] & 0x3c) >> 2),
> -+                ((in[1] & 0x03) << 6) | ((in[2] & 0x3f)));
> -+        break;
> -+
> -+      case 4:
> -+        out +=3D sprintf (out, "\\u%02x%02x%02x",
> -+                ((in[0] & 0x07) << 6) | ((in[1] & 0x3c) >> 2),
> -+                ((in[1] & 0x03) << 6) | ((in[2] & 0x3c) >> 2),
> -+                ((in[2] & 0x03) << 6) | ((in[3] & 0x3f)));
> -+        break;
> -+      default:
> -+        /* URG.  */
> -+        break;
> -+      }
> -+
> -+      if (unicode_display =3D=3D unicode_highlight && isatty (1))
> -+      out +=3D sprintf (out, "\033[0m"); /* Default colour.  */
> -+      break;
> -+
> -+    default:
> -+      /* URG */
> -+      break;
> -+    }
> -+
> -+  * consumed =3D nchars;
> -+  return out - orig_out;
> -+
> -+ invalid:
> -+  /* Not a valid UTF-8 sequence.  */
> -+  *out =3D *in;
> -+  * consumed =3D 1;
> -+  return 1;
> -+}
> -+
> - /* Returns a version of IN with any control characters
> -    replaced by escape sequences.  Uses a static buffer
> --   if necessary.  */
> -+   if necessary.
> -+
> -+   If unicode display is enabled, then also handles the
> -+   conversion of unicode characters.  */
> -
> - static const char *
> - sanitize_string (const char * in)
> -@@ -508,40 +636,50 @@ sanitize_string (const char * in)
> -      of cases it will not be needed.  */
> -   do
> -     {
> --      char c =3D *in++;
> -+      unsigned char c =3D *in++;
> -
> -       if (c =3D=3D 0)
> -       return original;
> -
> -       if (ISCNTRL (c))
> -       break;
> -+
> -+      if (unicode_display !=3D unicode_default && c >=3D 0xc0)
> -+      break;
> -     }
> -   while (1);
> -
> -   /* Copy the input, translating as needed.  */
> -   in =3D original;
> --  if (buffer_len < (strlen (in) * 2))
> -+  if (buffer_len < (strlen (in) * 9))
> -     {
> -       free ((void *) buffer);
> --      buffer_len =3D strlen (in) * 2;
> -+      buffer_len =3D strlen (in) * 9;
> -       buffer =3D xmalloc (buffer_len + 1);
> -     }
> -
> -   out =3D buffer;
> -   do
> -     {
> --      char c =3D *in++;
> -+      unsigned char c =3D *in++;
> -
> -       if (c =3D=3D 0)
> -       break;
> -
> --      if (!ISCNTRL (c))
> --      *out++ =3D c;
> --      else
> -+      if (ISCNTRL (c))
> -       {
> -         *out++ =3D '^';
> -         *out++ =3D c + 0x40;
> -       }
> -+      else if (unicode_display !=3D unicode_default && c >=3D 0xc0)
> -+      {
> -+        unsigned int num_consumed;
> -+
> -+        out +=3D display_utf8 ((const unsigned char *)(in - 1), out, & =
num_consumed);
> -+        in +=3D num_consumed - 1;
> -+      }
> -+      else
> -+      *out++ =3D c;
> -     }
> -   while (1);
> -
> -@@ -4529,6 +4667,24 @@ dump_symbols (bfd *abfd ATTRIBUTE_UNUSED
> -                 free (alloc);
> -               }
> -           }
> -+        else if (unicode_display !=3D unicode_default
> -+                 && name !=3D NULL && *name !=3D '\0')
> -+          {
> -+            const char * sanitized_name;
> -+
> -+            /* If we want to sanitize the name, we do it here, and
> -+               temporarily clobber it while calling bfd_print_symbol.
> -+               FIXME: This is a gross hack.  */
> -+            sanitized_name =3D sanitize_string (name);
> -+            if (sanitized_name !=3D name)
> -+              (*current)->name =3D sanitized_name;
> -+            else
> -+              sanitized_name =3D NULL;
> -+            bfd_print_symbol (cur_bfd, stdout, *current,
> -+                              bfd_print_symbol_all);
> -+            if (sanitized_name !=3D NULL)
> -+              (*current)->name =3D name;
> -+          }
> -         else
> -           bfd_print_symbol (cur_bfd, stdout, *current,
> -                             bfd_print_symbol_all);
> -@@ -5212,7 +5368,7 @@ main (int argc, char **argv)
> -   set_default_bfd_target ();
> -
> -   while ((c =3D getopt_long (argc, argv,
> --                         "pP:ib:m:M:VvCdDlfFaHhrRtTxsSI:j:wE:zgeGW::",
> -+                         "CDE:FGHI:LM:P:RSTU:VW::ab:defghij:lm:prstvwxz=
",
> -                          long_options, (int *) 0))
> -        !=3D EOF)
> -     {
> -@@ -5495,6 +5651,23 @@ main (int argc, char **argv)
> -         seenflag =3D true;
> -         break;
> -
> -+      case 'U':
> -+        if (streq (optarg, "default") || streq (optarg, "d"))
> -+          unicode_display =3D unicode_default;
> -+        else if (streq (optarg, "locale") || streq (optarg, "l"))
> -+          unicode_display =3D unicode_locale;
> -+        else if (streq (optarg, "escape") || streq (optarg, "e"))
> -+          unicode_display =3D unicode_escape;
> -+        else if (streq (optarg, "invalid") || streq (optarg, "i"))
> -+          unicode_display =3D unicode_invalid;
> -+        else if (streq (optarg, "hex") || streq (optarg, "x"))
> -+          unicode_display =3D unicode_hex;
> -+        else if (streq (optarg, "highlight") || streq (optarg, "h"))
> -+          unicode_display =3D unicode_highlight;
> -+        else
> -+          fatal (_("invalid argument to -U/--unicode: %s"), optarg);
> -+        break;
> -+
> -       case 'H':
> -         usage (stdout, 0);
> -         /* No need to set seenflag or to break - usage() does not retur=
n.  */
> -diff --git a/binutils/readelf.c b/binutils/readelf.c
> ---- a/binutils/readelf.c       2021-12-19 19:00:27.058540065 -0800
> -+++ b/binutils/readelf.c       2021-12-19 19:27:56.538354462 -0800
> -@@ -328,6 +328,19 @@ typedef enum print_mode
> - }
> - print_mode;
> -
> -+typedef enum unicode_display_type
> -+{
> -+  unicode_default =3D 0,
> -+  unicode_locale,
> -+  unicode_escape,
> -+  unicode_hex,
> -+  unicode_highlight,
> -+  unicode_invalid
> -+} unicode_display_type;
> -+
> -+static unicode_display_type unicode_display =3D unicode_default;
> -+
> -+
> - /* Versioned symbol info.  */
> - enum versioned_symbol_info
> - {
> -@@ -632,11 +645,18 @@ print_symbol (signed int width, const ch
> -       if (c =3D=3D 0)
> -       break;
> -
> --      /* Do not print control characters directly as they can affect te=
rminal
> --       settings.  Such characters usually appear in the names generated
> --       by the assembler for local labels.  */
> --      if (ISCNTRL (c))
> -+      if (ISPRINT (c))
> -+      {
> -+        putchar (c);
> -+        width_remaining --;
> -+        num_printed ++;
> -+      }
> -+      else if (ISCNTRL (c))
> -       {
> -+        /* Do not print control characters directly as they can affect =
terminal
> -+           settings.  Such characters usually appear in the names gener=
ated
> -+           by the assembler for local labels.  */
> -+
> -         if (width_remaining < 2)
> -           break;
> -
> -@@ -644,11 +664,137 @@ print_symbol (signed int width, const ch
> -         width_remaining -=3D 2;
> -         num_printed +=3D 2;
> -       }
> --      else if (ISPRINT (c))
> -+      else if (c =3D=3D 0x7f)
> -       {
> --        putchar (c);
> --        width_remaining --;
> --        num_printed ++;
> -+        if (width_remaining < 5)
> -+          break;
> -+        printf ("<DEL>");
> -+        width_remaining -=3D 5;
> -+        num_printed +=3D 5;
> -+      }
> -+      else if (unicode_display !=3D unicode_locale
> -+             && unicode_display !=3D unicode_default)
> -+      {
> -+        /* Display unicode characters as something else.  */
> -+        unsigned char bytes[4];
> -+        bool          is_utf8;
> -+        unsigned int          nbytes;
> -+
> -+        bytes[0] =3D c;
> -+
> -+        if (bytes[0] < 0xc0)
> -+          {
> -+            nbytes =3D 1;
> -+            is_utf8 =3D false;
> -+          }
> -+        else
> -+          {
> -+            bytes[1] =3D *symbol++;
> -+
> -+            if ((bytes[1] & 0xc0) !=3D 0x80)
> -+              {
> -+                is_utf8 =3D false;
> -+                /* Do not consume this character.  It may only
> -+                   be the first byte in the sequence that was
> -+                   corrupt.  */
> -+                --symbol;
> -+                nbytes =3D 1;
> -+              }
> -+            else if ((bytes[0] & 0x20) =3D=3D 0)
> -+              {
> -+                is_utf8 =3D true;
> -+                nbytes =3D 2;
> -+              }
> -+            else
> -+              {
> -+                bytes[2] =3D *symbol++;
> -+
> -+                if ((bytes[2] & 0xc0) !=3D 0x80)
> -+                  {
> -+                    is_utf8 =3D false;
> -+                    symbol -=3D 2;
> -+                    nbytes =3D 1;
> -+                  }
> -+                else if ((bytes[0] & 0x10) =3D=3D 0)
> -+                  {
> -+                    is_utf8 =3D true;
> -+                    nbytes =3D 3;
> -+                  }
> -+                else
> -+                  {
> -+                    bytes[3] =3D *symbol++;
> -+
> -+                    nbytes =3D 4;
> -+
> -+                    if ((bytes[3] & 0xc0) !=3D 0x80)
> -+                      {
> -+                        is_utf8 =3D false;
> -+                        symbol -=3D 3;
> -+                        nbytes =3D 1;
> -+                      }
> -+                    else
> -+                      is_utf8 =3D true;
> -+                  }
> -+              }
> -+          }
> -+
> -+        if (unicode_display =3D=3D unicode_invalid)
> -+          is_utf8 =3D false;
> -+
> -+        if (unicode_display =3D=3D unicode_hex || ! is_utf8)
> -+          {
> -+            unsigned int i;
> -+
> -+            if (width_remaining < (nbytes * 2) + 2)
> -+              break;
> -+
> -+            putchar (is_utf8 ? '<' : '{');
> -+            printf ("0x");
> -+            for (i =3D 0; i < nbytes; i++)
> -+              printf ("%02x", bytes[i]);
> -+            putchar (is_utf8 ? '>' : '}');
> -+          }
> -+        else
> -+          {
> -+            if (unicode_display =3D=3D unicode_highlight && isatty (1))
> -+              printf ("\x1B[31;47m"); /* Red.  */
> -+
> -+            switch (nbytes)
> -+              {
> -+              case 2:
> -+                if (width_remaining < 6)
> -+                  break;
> -+                printf ("\\u%02x%02x",
> -+                        (bytes[0] & 0x1c) >> 2,
> -+                        ((bytes[0] & 0x03) << 6) | (bytes[1] & 0x3f));
> -+                break;
> -+              case 3:
> -+                if (width_remaining < 6)
> -+                  break;
> -+                printf ("\\u%02x%02x",
> -+                        ((bytes[0] & 0x0f) << 4) | ((bytes[1] & 0x3c) >=
> 2),
> -+                        ((bytes[1] & 0x03) << 6) | (bytes[2] & 0x3f));
> -+                break;
> -+              case 4:
> -+                if (width_remaining < 8)
> -+                  break;
> -+                printf ("\\u%02x%02x%02x",
> -+                        ((bytes[0] & 0x07) << 6) | ((bytes[1] & 0x3c) >=
> 2),
> -+                        ((bytes[1] & 0x03) << 6) | ((bytes[2] & 0x3c) >=
> 2),
> -+                        ((bytes[2] & 0x03) << 6) | (bytes[3] & 0x3f));
> -+
> -+                break;
> -+              default:
> -+                /* URG.  */
> -+                break;
> -+              }
> -+
> -+            if (unicode_display =3D=3D unicode_highlight && isatty (1))
> -+              printf ("\033[0m"); /* Default colour.  */
> -+          }
> -+
> -+        if (bytes[nbytes - 1] =3D=3D 0)
> -+          break;
> -       }
> -       else
> -       {
> -@@ -4668,6 +4814,7 @@ static struct option options[] =3D
> -   {"syms",           no_argument, 0, 's'},
> -   {"silent-truncation",no_argument, 0, 'T'},
> -   {"section-details",  no_argument, 0, 't'},
> -+  {"unicode",          required_argument, NULL, 'U'},
> -   {"unwind",         no_argument, 0, 'u'},
> -   {"version-info",     no_argument, 0, 'V'},
> -   {"version",        no_argument, 0, 'v'},
> -@@ -4744,6 +4891,12 @@ usage (FILE * stream)
> -   fprintf (stream, _("\
> -      --no-recurse-limit  Disable a demangling recursion limit\n"));
> -   fprintf (stream, _("\
> -+     -U[dlexhi] --unicode=3D[default|locale|escape|hex|highlight|invali=
d]\n\
> -+                         Display unicode characters as determined by th=
e current locale\n\
> -+                          (default), escape sequences, \"<hex sequences=
>\", highlighted\n\
> -+                          escape sequences, or treat them as invalid an=
d display as\n\
> -+                          \"{hex sequences}\"\n"));
> -+  fprintf (stream, _("\
> -   -n --notes             Display the core notes (if present)\n"));
> -   fprintf (stream, _("\
> -   -r --relocs            Display the relocations (if present)\n"));
> -@@ -4928,7 +5081,7 @@ parse_args (struct dump_data *dumpdata,
> -     usage (stderr);
> -
> -   while ((c =3D getopt_long
> --        (argc, argv, "ACDHILNPR:STVWacdeghi:lnp:rstuvw::x:z", options, =
NULL)) !=3D EOF)
> -+        (argc, argv, "ACDHILNPR:STU:VWacdeghi:lnp:rstuvw::x:z", options=
, NULL)) !=3D EOF)
> -     {
> -       switch (c)
> -       {
> -@@ -5130,6 +5283,25 @@ parse_args (struct dump_data *dumpdata,
> -         /* Ignored for backward compatibility.  */
> -         break;
> -
> -+      case 'U':
> -+        if (optarg =3D=3D NULL)
> -+          error (_("Missing arg to -U/--unicode")); /* Can this happen =
?  */
> -+        else if (streq (optarg, "default") || streq (optarg, "d"))
> -+          unicode_display =3D unicode_default;
> -+        else if (streq (optarg, "locale") || streq (optarg, "l"))
> -+          unicode_display =3D unicode_locale;
> -+        else if (streq (optarg, "escape") || streq (optarg, "e"))
> -+          unicode_display =3D unicode_escape;
> -+        else if (streq (optarg, "invalid") || streq (optarg, "i"))
> -+          unicode_display =3D unicode_invalid;
> -+        else if (streq (optarg, "hex") || streq (optarg, "x"))
> -+          unicode_display =3D unicode_hex;
> -+        else if (streq (optarg, "highlight") || streq (optarg, "h"))
> -+          unicode_display =3D unicode_highlight;
> -+        else
> -+          error (_("invalid argument to -U/--unicode: %s"), optarg);
> -+        break;
> -+
> -       case OPTION_SYM_BASE:
> -         sym_base =3D 0;
> -         if (optarg !=3D NULL)
> -diff --git a/binutils/strings.c b/binutils/strings.c
> ---- a/binutils/strings.c       2021-12-19 19:00:27.058540065 -0800
> -+++ b/binutils/strings.c       2021-12-19 19:48:26.205313218 -0800
> -@@ -55,6 +55,19 @@
> -    -T {bfdname}
> -               Specify a non-default object file format.
> -
> -+  --unicode=3D{default|locale|invalid|hex|escape|highlight}
> -+  -u {d|l|i|x|e|h}
> -+                Determine how to handle UTF-8 unicode characters.  The =
default
> -+              is no special treatment.  All other versions of this opti=
on
> -+              only apply if the encoding is valid and enabling the opti=
on
> -+              implies --encoding=3DS.
> -+              The 'locale' option displays the characters according to =
the
> -+              current locale.  The 'invalid' option treats them as
> -+              non-string characters.  The 'hex' option displays them as=
 hex
> -+              byte sequences.  The 'escape' option displays them as esc=
ape
> -+              sequences and the 'highlight' option displays them as
> -+              coloured escape sequences.
> -+
> -   --output-separator=3Dsep_string
> -   -s sep_string       String used to separate parsed strings in output.
> -               Default is newline.
> -@@ -76,6 +89,22 @@
> - #include "safe-ctype.h"
> - #include "bucomm.h"
> -
> -+#ifndef streq
> -+#define streq(a,b) (strcmp ((a),(b)) =3D=3D 0)
> -+#endif
> -+
> -+typedef enum unicode_display_type
> -+{
> -+  unicode_default =3D 0,
> -+  unicode_locale,
> -+  unicode_escape,
> -+  unicode_hex,
> -+  unicode_highlight,
> -+  unicode_invalid
> -+} unicode_display_type;
> -+
> -+static unicode_display_type unicode_display =3D unicode_default;
> -+
> - #define STRING_ISGRAPHIC(c) \
> -       (   (c) >=3D 0 \
> -        && (c) <=3D 255 \
> -@@ -94,7 +123,7 @@ extern int errno;
> - static int address_radix;
> -
> - /* Minimum length of sequence of graphic chars to trigger output.  */
> --static int string_min;
> -+static unsigned int string_min;
> -
> - /* Whether or not we include all whitespace as a graphic char.   */
> - static bool include_all_whitespace;
> -@@ -121,21 +150,22 @@ static char *output_separator;
> - static struct option long_options[] =3D
> - {
> -   {"all", no_argument, NULL, 'a'},
> -+  {"bytes", required_argument, NULL, 'n'},
> -   {"data", no_argument, NULL, 'd'},
> -+  {"encoding", required_argument, NULL, 'e'},
> -+  {"help", no_argument, NULL, 'h'},
> -+  {"include-all-whitespace", no_argument, NULL, 'w'},
> -+  {"output-separator", required_argument, NULL, 's'},
> -   {"print-file-name", no_argument, NULL, 'f'},
> --  {"bytes", required_argument, NULL, 'n'},
> -   {"radix", required_argument, NULL, 't'},
> --  {"include-all-whitespace", no_argument, NULL, 'w'},
> --  {"encoding", required_argument, NULL, 'e'},
> -   {"target", required_argument, NULL, 'T'},
> --  {"output-separator", required_argument, NULL, 's'},
> --  {"help", no_argument, NULL, 'h'},
> -+  {"unicode", required_argument, NULL, 'U'},
> -   {"version", no_argument, NULL, 'v'},
> -   {NULL, 0, NULL, 0}
> - };
> -
> - static bool strings_file (char *);
> --static void print_strings (const char *, FILE *, file_ptr, int, int, ch=
ar *);
> -+static void print_strings (const char *, FILE *, file_ptr, int, char *)=
;
> - static void usage (FILE *, int) ATTRIBUTE_NORETURN;
> -
> - int main (int, char **);
> -@@ -171,7 +201,7 @@ main (int argc, char **argv)
> -   encoding =3D 's';
> -   output_separator =3D NULL;
> -
> --  while ((optc =3D getopt_long (argc, argv, "adfhHn:wot:e:T:s:Vv0123456=
789",
> -+  while ((optc =3D getopt_long (argc, argv, "adfhHn:wot:e:T:s:U:Vv01234=
56789",
> -                             long_options, (int *) 0)) !=3D EOF)
> -     {
> -       switch (optc)
> -@@ -244,6 +274,23 @@ main (int argc, char **argv)
> -         output_separator =3D optarg;
> -           break;
> -
> -+      case 'U':
> -+        if (streq (optarg, "default") || streq (optarg, "d"))
> -+          unicode_display =3D unicode_default;
> -+        else if (streq (optarg, "locale") || streq (optarg, "l"))
> -+          unicode_display =3D unicode_locale;
> -+        else if (streq (optarg, "escape") || streq (optarg, "e"))
> -+          unicode_display =3D unicode_escape;
> -+        else if (streq (optarg, "invalid") || streq (optarg, "i"))
> -+          unicode_display =3D unicode_invalid;
> -+        else if (streq (optarg, "hex") || streq (optarg, "x"))
> -+          unicode_display =3D unicode_hex;
> -+        else if (streq (optarg, "highlight") || streq (optarg, "h"))
> -+          unicode_display =3D unicode_highlight;
> -+        else
> -+          fatal (_("invalid argument to -U/--unicode: %s"), optarg);
> -+        break;
> -+
> -       case 'V':
> -       case 'v':
> -         print_version ("strings");
> -@@ -258,6 +305,9 @@ main (int argc, char **argv)
> -       }
> -     }
> -
> -+  if (unicode_display !=3D unicode_default)
> -+    encoding =3D 'S';
> -+
> -   if (numeric_opt !=3D 0)
> -     {
> -       string_min =3D (int) strtoul (argv[numeric_opt - 1] + 1, &s, 0);
> -@@ -293,14 +343,14 @@ main (int argc, char **argv)
> -     {
> -       datasection_only =3D false;
> -       SET_BINARY (fileno (stdin));
> --      print_strings ("{standard input}", stdin, 0, 0, 0, (char *) NULL)=
;
> -+      print_strings ("{standard input}", stdin, 0, 0, (char *) NULL);
> -       files_given =3D true;
> -     }
> -   else
> -     {
> -       for (; optind < argc; ++optind)
> -       {
> --        if (strcmp (argv[optind], "-") =3D=3D 0)
> -+        if (streq (argv[optind], "-"))
> -           datasection_only =3D false;
> -         else
> -           {
> -@@ -342,7 +392,7 @@ strings_a_section (bfd *abfd, asection *
> -     }
> -
> -   *got_a_section =3D true;
> --  print_strings (filename, NULL, sect->filepos, 0, sectsize, (char *) m=
em);
> -+  print_strings (filename, NULL, sect->filepos, sectsize, (char *) mem)=
;
> -   free (mem);
> - }
> -
> -@@ -427,7 +477,7 @@ strings_file (char *file)
> -         return false;
> -       }
> -
> --      print_strings (file, stream, (file_ptr) 0, 0, 0, (char *) 0);
> -+      print_strings (file, stream, (file_ptr) 0, 0, (char *) NULL);
> -
> -       if (fclose (stream) =3D=3D EOF)
> -       {
> -@@ -551,6 +601,626 @@ unget_part_char (long c, file_ptr *addre
> -       }
> -     }
> - }
> -+
> -+static void
> -+print_filename_and_address (const char * filename, file_ptr address)
> -+{
> -+  if (print_filenames)
> -+    printf ("%s: ", filename);
> -+
> -+  if (! print_addresses)
> -+    return;
> -+
> -+  switch (address_radix)
> -+    {
> -+    case 8:
> -+      if (sizeof (address) > sizeof (long))
> -+      {
> -+#ifndef __MSVCRT__
> -+        printf ("%7llo ", (unsigned long long) address);
> -+#else
> -+        printf ("%7I64o ", (unsigned long long) address);
> -+#endif
> -+      }
> -+      else
> -+      printf ("%7lo ", (unsigned long) address);
> -+      break;
> -+
> -+    case 10:
> -+      if (sizeof (address) > sizeof (long))
> -+      {
> -+#ifndef __MSVCRT__
> -+        printf ("%7llu ", (unsigned long long) address);
> -+#else
> -+        printf ("%7I64d ", (unsigned long long) address);
> -+#endif
> -+      }
> -+      else
> -+      printf ("%7ld ", (long) address);
> -+      break;
> -+
> -+    case 16:
> -+      if (sizeof (address) > sizeof (long))
> -+      {
> -+#ifndef __MSVCRT__
> -+        printf ("%7llx ", (unsigned long long) address);
> -+#else
> -+        printf ("%7I64x ", (unsigned long long) address);
> -+#endif
> -+      }
> -+      else
> -+      printf ("%7lx ", (unsigned long) address);
> -+      break;
> -+    }
> -+}
> -+
> -+/* Return non-zero if the bytes starting at BUFFER form a valid UTF-8 e=
ncoding.
> -+   If the encoding is valid then returns the number of bytes it uses.  =
*/
> -+
> -+static unsigned int
> -+is_valid_utf8 (const unsigned char * buffer, unsigned long buflen)
> -+{
> -+  if (buffer[0] < 0xc0)
> -+    return 0;
> -+
> -+  if (buflen < 2)
> -+    return 0;
> -+
> -+  if ((buffer[1] & 0xc0) !=3D 0x80)
> -+    return 0;
> -+
> -+  if ((buffer[0] & 0x20) =3D=3D 0)
> -+    return 2;
> -+
> -+  if (buflen < 3)
> -+    return 0;
> -+
> -+  if ((buffer[2] & 0xc0) !=3D 0x80)
> -+    return 0;
> -+
> -+  if ((buffer[0] & 0x10) =3D=3D 0)
> -+    return 3;
> -+
> -+  if (buflen < 4)
> -+    return 0;
> -+
> -+  if ((buffer[3] & 0xc0) !=3D 0x80)
> -+    return 0;
> -+
> -+  return 4;
> -+}
> -+
> -+/* Display a UTF-8 encoded character in BUFFER according to the setting
> -+   of unicode_display.  The character is known to be valid.
> -+   Returns the number of bytes consumed.  */
> -+
> -+static unsigned int
> -+display_utf8_char (const unsigned char * buffer)
> -+{
> -+  unsigned int j;
> -+  unsigned int utf8_len;
> -+
> -+  switch (buffer[0] & 0x30)
> -+    {
> -+    case 0x00:
> -+    case 0x10:
> -+      utf8_len =3D 2;
> -+      break;
> -+    case 0x20:
> -+      utf8_len =3D 3;
> -+      break;
> -+    default:
> -+      utf8_len =3D 4;
> -+    }
> -+
> -+  switch (unicode_display)
> -+    {
> -+    default:
> -+      fprintf (stderr, "ICE: unexpected unicode display type\n");
> -+      break;
> -+
> -+    case unicode_escape:
> -+    case unicode_highlight:
> -+      if (unicode_display =3D=3D unicode_highlight && isatty (1))
> -+      printf ("\x1B[31;47m"); /* Red.  */
> -+
> -+      switch (utf8_len)
> -+      {
> -+      case 2:
> -+        printf ("\\u%02x%02x",
> -+                ((buffer[0] & 0x1c) >> 2),
> -+                ((buffer[0] & 0x03) << 6) | (buffer[1] & 0x3f));
> -+        break;
> -+
> -+      case 3:
> -+        printf ("\\u%02x%02x",
> -+                ((buffer[0] & 0x0f) << 4) | ((buffer[1] & 0x3c) >> 2),
> -+                ((buffer[1] & 0x03) << 6) | ((buffer[2] & 0x3f)));
> -+        break;
> -+
> -+      case 4:
> -+        printf ("\\u%02x%02x%02x",
> -+                ((buffer[0] & 0x07) << 6) | ((buffer[1] & 0x3c) >> 2),
> -+                ((buffer[1] & 0x03) << 6) | ((buffer[2] & 0x3c) >> 2),
> -+                ((buffer[2] & 0x03) << 6) | ((buffer[3] & 0x3f)));
> -+        break;
> -+      default:
> -+        /* URG.  */
> -+        break;
> -+      }
> -+
> -+      if (unicode_display =3D=3D unicode_highlight && isatty (1))
> -+      printf ("\033[0m"); /* Default colour.  */
> -+      break;
> -+
> -+    case unicode_hex:
> -+      putchar ('<');
> -+      printf ("0x");
> -+      for (j =3D 0; j < utf8_len; j++)
> -+      printf ("%02x", buffer [j]);
> -+      putchar ('>');
> -+      break;
> -+
> -+    case unicode_locale:
> -+      printf ("%.1s", buffer);
> -+      break;
> -+    }
> -+
> -+  return utf8_len;
> -+}
> -+
> -+/* Display strings in BUFFER.  Treat any UTF-8 encoded characters encou=
ntered
> -+   according to the setting of the unicode_display variable.  The buffe=
r
> -+   contains BUFLEN bytes.
> -+
> -+   Display the characters as if they started at ADDRESS and are contain=
ed in
> -+   FILENAME.  */
> -+
> -+static void
> -+print_unicode_buffer (const char *            filename,
> -+                    file_ptr                address,
> -+                    const unsigned char *   buffer,
> -+                    unsigned long           buflen)
> -+{
> -+  /* Paranoia checks...  */
> -+  if (filename =3D=3D NULL
> -+      || buffer =3D=3D NULL
> -+      || unicode_display =3D=3D unicode_default
> -+      || encoding !=3D 'S'
> -+      || encoding_bytes !=3D 1)
> -+    {
> -+      fprintf (stderr, "ICE: bad arguments to print_unicode_buffer\n");
> -+      return;
> -+    }
> -+
> -+  if (buflen =3D=3D 0)
> -+    return;
> -+
> -+  /* We must only display strings that are at least string_min *charact=
ers*
> -+     long.  So we scan the buffer in two stages.  First we locate the s=
tart
> -+     of a potential string.  Then we walk along it until we have found
> -+     string_min characters.  Then we go back to the start point and sta=
rt
> -+     displaying characters according to the unicode_display setting.  *=
/
> -+
> -+  unsigned long start_point =3D 0;
> -+  unsigned long i =3D 0;
> -+  unsigned int char_len =3D 1;
> -+  unsigned int num_found =3D 0;
> -+
> -+  for (i =3D 0; i < buflen; i +=3D char_len)
> -+    {
> -+      int c =3D buffer[i];
> -+
> -+      char_len =3D 1;
> -+
> -+      /* Find the first potential character of a string.  */
> -+      if (! STRING_ISGRAPHIC (c))
> -+      {
> -+        num_found =3D 0;
> -+        continue;
> -+      }
> -+
> -+      if (c > 126)
> -+      {
> -+        if (c < 0xc0)
> -+          {
> -+            num_found =3D 0;
> -+            continue;
> -+          }
> -+
> -+        if ((char_len =3D is_valid_utf8 (buffer + i, buflen - i)) =3D=
=3D 0)
> -+          {
> -+            char_len =3D 1;
> -+            num_found =3D 0;
> -+            continue;
> -+          }
> -+
> -+        if (unicode_display =3D=3D unicode_invalid)
> -+          {
> -+            /* We have found a valid UTF-8 character, but we treat it a=
s non-graphic.  */
> -+            num_found =3D 0;
> -+            continue;
> -+          }
> -+      }
> -+
> -+      if (num_found =3D=3D 0)
> -+      /* We have found a potential starting point for a string.  */
> -+      start_point =3D i;
> -+
> -+      ++ num_found;
> -+
> -+      if (num_found >=3D string_min)
> -+      break;
> -+    }
> -+
> -+  if (num_found < string_min)
> -+    return;
> -+
> -+  print_filename_and_address (filename, address + start_point);
> -+
> -+  /* We have found string_min characters.  Display them and any
> -+     more that follow.  */
> -+  for (i =3D start_point; i < buflen; i +=3D char_len)
> -+    {
> -+      int c =3D buffer[i];
> -+
> -+      char_len =3D 1;
> -+
> -+      if (! STRING_ISGRAPHIC (c))
> -+      break;
> -+      else if (c < 127)
> -+      putchar (c);
> -+      else if (! is_valid_utf8 (buffer + i, buflen - i))
> -+      break;
> -+      else if (unicode_display =3D=3D unicode_invalid)
> -+      break;
> -+      else
> -+      char_len =3D display_utf8_char (buffer + i);
> -+    }
> -+
> -+  if (output_separator)
> -+    fputs (output_separator, stdout);
> -+  else
> -+    putchar ('\n');
> -+
> -+  /* FIXME: Using tail recursion here is lazy programming...  */
> -+  print_unicode_buffer (filename, address + i, buffer + i, buflen - i);
> -+}
> -+
> -+static int
> -+get_unicode_byte (FILE *          stream,
> -+                unsigned char * putback,
> -+                unsigned int *  num_putback,
> -+                unsigned int *  num_read)
> -+{
> -+  if (* num_putback > 0)
> -+    {
> -+      * num_putback =3D * num_putback - 1;
> -+      return putback [* num_putback];
> -+    }
> -+
> -+  * num_read =3D * num_read + 1;
> -+
> -+#if defined(HAVE_GETC_UNLOCKED) && HAVE_DECL_GETC_UNLOCKED
> -+  return getc_unlocked (stream);
> -+#else
> -+  return getc (stream);
> -+#endif
> -+}
> -+
> -+/* Helper function for print_unicode_stream.  */
> -+
> -+static void
> -+print_unicode_stream_body (const char *     filename,
> -+                         file_ptr         address,
> -+                         FILE *           stream,
> -+                         unsigned char *  putback_buf,
> -+                         unsigned int     num_putback,
> -+                         unsigned char *  print_buf)
> -+{
> -+  /* It would be nice if we could just read the stream into a buffer
> -+     and then process if with print_unicode_buffer.  But the input
> -+     might be huge or it might time-locked (eg stdin).  So instead
> -+     we go one byte at a time...  */
> -+
> -+  file_ptr start_point =3D 0;
> -+  unsigned int num_read =3D 0;
> -+  unsigned int num_chars =3D 0;
> -+  unsigned int num_print =3D 0;
> -+  int c =3D 0;
> -+
> -+  /* Find a series of string_min characters.  Put them into print_buf. =
 */
> -+  do
> -+    {
> -+      if (num_chars >=3D string_min)
> -+      break;
> -+
> -+      c =3D get_unicode_byte (stream, putback_buf, & num_putback, & num=
_read);
> -+      if (c =3D=3D EOF)
> -+      break;
> -+
> -+      if (! STRING_ISGRAPHIC (c))
> -+      {
> -+        num_chars =3D num_print =3D 0;
> -+        continue;
> -+      }
> -+
> -+      if (num_chars =3D=3D 0)
> -+      start_point =3D num_read - 1;
> -+
> -+      if (c < 127)
> -+      {
> -+        print_buf[num_print] =3D c;
> -+        num_chars ++;
> -+        num_print ++;
> -+        continue;
> -+      }
> -+
> -+      if (c < 0xc0)
> -+      {
> -+        num_chars =3D num_print =3D 0;
> -+        continue;
> -+      }
> -+
> -+      /* We *might* have a UTF-8 sequence.  Time to start peeking.  */
> -+      char utf8[4];
> -+
> -+      utf8[0] =3D c;
> -+      c =3D get_unicode_byte (stream, putback_buf, & num_putback, & num=
_read);
> -+      if (c =3D=3D EOF)
> -+      break;
> -+      utf8[1] =3D c;
> -+
> -+      if ((utf8[1] & 0xc0) !=3D 0x80)
> -+      {
> -+        /* Invalid UTF-8.  */
> -+        putback_buf[num_putback++] =3D utf8[1];
> -+        num_chars =3D num_print =3D 0;
> -+        continue;
> -+      }
> -+      else if ((utf8[0] & 0x20) =3D=3D 0)
> -+      {
> -+        /* A valid 2-byte UTF-8 encoding.  */
> -+        if (unicode_display =3D=3D unicode_invalid)
> -+          {
> -+            putback_buf[num_putback++] =3D utf8[1];
> -+            num_chars =3D num_print =3D 0;
> -+          }
> -+        else
> -+          {
> -+            print_buf[num_print ++] =3D utf8[0];
> -+            print_buf[num_print ++] =3D utf8[1];
> -+            num_chars ++;
> -+          }
> -+        continue;
> -+      }
> -+
> -+      c =3D get_unicode_byte (stream, putback_buf, & num_putback, & num=
_read);
> -+      if (c =3D=3D EOF)
> -+      break;
> -+      utf8[2] =3D c;
> -+
> -+      if ((utf8[2] & 0xc0) !=3D 0x80)
> -+      {
> -+        /* Invalid UTF-8.  */
> -+        putback_buf[num_putback++] =3D utf8[2];
> -+        putback_buf[num_putback++] =3D utf8[1];
> -+        num_chars =3D num_print =3D 0;
> -+        continue;
> -+      }
> -+      else if ((utf8[0] & 0x10) =3D=3D 0)
> -+      {
> -+        /* A valid 3-byte UTF-8 encoding.  */
> -+        if (unicode_display =3D=3D unicode_invalid)
> -+          {
> -+            putback_buf[num_putback++] =3D utf8[2];
> -+            putback_buf[num_putback++] =3D utf8[1];
> -+            num_chars =3D num_print =3D 0;
> -+          }
> -+        else
> -+          {
> -+            print_buf[num_print ++] =3D utf8[0];
> -+            print_buf[num_print ++] =3D utf8[1];
> -+            print_buf[num_print ++] =3D utf8[2];
> -+            num_chars ++;
> -+          }
> -+        continue;
> -+      }
> -+
> -+      c =3D get_unicode_byte (stream, putback_buf, & num_putback, & num=
_read);
> -+      if (c =3D=3D EOF)
> -+      break;
> -+      utf8[3] =3D c;
> -+
> -+      if ((utf8[3] & 0xc0) !=3D 0x80)
> -+      {
> -+        /* Invalid UTF-8.  */
> -+        putback_buf[num_putback++] =3D utf8[3];
> -+        putback_buf[num_putback++] =3D utf8[2];
> -+        putback_buf[num_putback++] =3D utf8[1];
> -+        num_chars =3D num_print =3D 0;
> -+      }
> -+      /* We have a valid 4-byte UTF-8 encoding.  */
> -+      else if (unicode_display =3D=3D unicode_invalid)
> -+      {
> -+        putback_buf[num_putback++] =3D utf8[3];
> -+        putback_buf[num_putback++] =3D utf8[1];
> -+        putback_buf[num_putback++] =3D utf8[2];
> -+        num_chars =3D num_print =3D 0;
> -+      }
> -+      else
> -+      {
> -+        print_buf[num_print ++] =3D utf8[0];
> -+        print_buf[num_print ++] =3D utf8[1];
> -+        print_buf[num_print ++] =3D utf8[2];
> -+        print_buf[num_print ++] =3D utf8[3];
> -+        num_chars ++;
> -+      }
> -+    }
> -+  while (1);
> -+
> -+  if (num_chars >=3D string_min)
> -+    {
> -+      /* We know that we have string_min valid characters in print_buf,
> -+       and there may be more to come in the stream.  Start displaying
> -+       them.  */
> -+
> -+      print_filename_and_address (filename, address + start_point);
> -+
> -+      unsigned int i;
> -+      for (i =3D 0; i < num_print;)
> -+      {
> -+        if (print_buf[i] < 127)
> -+          putchar (print_buf[i++]);
> -+        else
> -+          i +=3D display_utf8_char (print_buf + i);
> -+      }
> -+
> -+      /* OK so now we have to start read unchecked bytes.  */
> -+
> -+      /* Find a series of string_min characters.  Put them into print_b=
uf.  */
> -+      do
> -+      {
> -+        c =3D get_unicode_byte (stream, putback_buf, & num_putback, & n=
um_read);
> -+        if (c =3D=3D EOF)
> -+          break;
> -+
> -+        if (! STRING_ISGRAPHIC (c))
> -+          break;
> -+
> -+        if (c < 127)
> -+          {
> -+            putchar (c);
> -+            continue;
> -+          }
> -+
> -+        if (c < 0xc0)
> -+          break;
> -+
> -+        /* We *might* have a UTF-8 sequence.  Time to start peeking.  *=
/
> -+        unsigned char utf8[4];
> -+
> -+        utf8[0] =3D c;
> -+        c =3D get_unicode_byte (stream, putback_buf, & num_putback, & n=
um_read);
> -+        if (c =3D=3D EOF)
> -+          break;
> -+        utf8[1] =3D c;
> -+
> -+        if ((utf8[1] & 0xc0) !=3D 0x80)
> -+          {
> -+            /* Invalid UTF-8.  */
> -+            putback_buf[num_putback++] =3D utf8[1];
> -+            break;
> -+          }
> -+        else if ((utf8[0] & 0x20) =3D=3D 0)
> -+          {
> -+            /* Valid 2-byte UTF-8.  */
> -+            if (unicode_display =3D=3D unicode_invalid)
> -+              {
> -+                putback_buf[num_putback++] =3D utf8[1];
> -+                break;
> -+              }
> -+            else
> -+              {
> -+                (void) display_utf8_char (utf8);
> -+                continue;
> -+              }
> -+          }
> -+
> -+        c =3D get_unicode_byte (stream, putback_buf, & num_putback, & n=
um_read);
> -+        if (c =3D=3D EOF)
> -+          break;
> -+        utf8[2] =3D c;
> -+
> -+        if ((utf8[2] & 0xc0) !=3D 0x80)
> -+          {
> -+            /* Invalid UTF-8.  */
> -+            putback_buf[num_putback++] =3D utf8[2];
> -+            putback_buf[num_putback++] =3D utf8[1];
> -+            break;
> -+          }
> -+        else if ((utf8[0] & 0x10) =3D=3D 0)
> -+          {
> -+            /* Valid 3-byte UTF-8.  */
> -+            if (unicode_display =3D=3D unicode_invalid)
> -+              {
> -+                putback_buf[num_putback++] =3D utf8[2];
> -+                putback_buf[num_putback++] =3D utf8[1];
> -+                break;
> -+              }
> -+            else
> -+              {
> -+                (void) display_utf8_char (utf8);
> -+                continue;
> -+              }
> -+          }
> -+
> -+        c =3D get_unicode_byte (stream, putback_buf, & num_putback, & n=
um_read);
> -+        if (c =3D=3D EOF)
> -+          break;
> -+        utf8[3] =3D c;
> -+
> -+        if ((utf8[3] & 0xc0) !=3D 0x80)
> -+          {
> -+            /* Invalid UTF-8.  */
> -+            putback_buf[num_putback++] =3D utf8[3];
> -+            putback_buf[num_putback++] =3D utf8[2];
> -+            putback_buf[num_putback++] =3D utf8[1];
> -+            break;
> -+          }
> -+        else if (unicode_display =3D=3D unicode_invalid)
> -+          {
> -+            putback_buf[num_putback++] =3D utf8[3];
> -+            putback_buf[num_putback++] =3D utf8[2];
> -+            putback_buf[num_putback++] =3D utf8[1];
> -+            break;
> -+          }
> -+        else
> -+          /* A valid 4-byte UTF-8 encoding.  */
> -+          (void) display_utf8_char (utf8);
> -+      }
> -+      while (1);
> -+
> -+      if (output_separator)
> -+      fputs (output_separator, stdout);
> -+      else
> -+      putchar ('\n');
> -+    }
> -+
> -+  if (c !=3D EOF)
> -+    /* FIXME: Using tail recursion here is lazy, but it works.  */
> -+    print_unicode_stream_body (filename, address + num_read, stream, pu=
tback_buf, num_putback, print_buf);
> -+}
> -+
> -+/* Display strings read in from STREAM.  Treat any UTF-8 encoded charac=
ters
> -+   encountered according to the setting of the unicode_display variable=
.
> -+   The stream is positioned at ADDRESS and is attached to FILENAME.  */
> -+
> -+static void
> -+print_unicode_stream (const char * filename,
> -+                    file_ptr     address,
> -+                    FILE *       stream)
> -+{
> -+  /* Paranoia checks...  */
> -+  if (filename =3D=3D NULL
> -+      || stream =3D=3D NULL
> -+      || unicode_display =3D=3D unicode_default
> -+      || encoding !=3D 'S'
> -+      || encoding_bytes !=3D 1)
> -+    {
> -+      fprintf (stderr, "ICE: bad arguments to print_unicode_stream\n");
> -+      return;
> -+    }
> -+
> -+  /* Allocate space for string_min 4-byte utf-8 characters.  */
> -+  unsigned char * print_buf =3D xmalloc ((4 * string_min) + 1);
> -+  /* We should never have to put back more than 4 bytes.  */
> -+  unsigned char putback_buf[5];
> -+  unsigned int num_putback =3D 0;
> -+
> -+  print_unicode_stream_body (filename, address, stream, putback_buf, nu=
m_putback, print_buf);
> -+  free (print_buf);
> -+}
> -
> - /* Find the strings in file FILENAME, read from STREAM.
> -    Assume that STREAM is positioned so that the next byte read
> -@@ -566,20 +1236,29 @@ unget_part_char (long c, file_ptr *addre
> -
> - static void
> - print_strings (const char *filename, FILE *stream, file_ptr address,
> --             int stop_point, int magiccount, char *magic)
> -+             int magiccount, char *magic)
> - {
> -+  if (unicode_display !=3D unicode_default)
> -+    {
> -+      if (magic !=3D NULL)
> -+      print_unicode_buffer (filename, address,
> -+                            (const unsigned char *) magic, magiccount);
> -+
> -+      if (stream !=3D NULL)
> -+      print_unicode_stream (filename, address, stream);
> -+      return;
> -+    }
> -+
> -   char *buf =3D (char *) xmalloc (sizeof (char) * (string_min + 1));
> -
> -   while (1)
> -     {
> -       file_ptr start;
> --      int i;
> -+      unsigned int i;
> -       long c;
> -
> -       /* See if the next `string_min' chars are all graphic chars.  */
> -     tryline:
> --      if (stop_point && address >=3D stop_point)
> --      break;
> -       start =3D address;
> -       for (i =3D 0; i < string_min; i++)
> -       {
> -@@ -601,51 +1280,7 @@ print_strings (const char *filename, FIL
> -
> -       /* We found a run of `string_min' graphic characters.  Print up
> -        to the next non-graphic character.  */
> --
> --      if (print_filenames)
> --      printf ("%s: ", filename);
> --      if (print_addresses)
> --      switch (address_radix)
> --        {
> --        case 8:
> --          if (sizeof (start) > sizeof (long))
> --            {
> --#ifndef __MSVCRT__
> --              printf ("%7llo ", (unsigned long long) start);
> --#else
> --              printf ("%7I64o ", (unsigned long long) start);
> --#endif
> --            }
> --          else
> --            printf ("%7lo ", (unsigned long) start);
> --          break;
> --
> --        case 10:
> --          if (sizeof (start) > sizeof (long))
> --            {
> --#ifndef __MSVCRT__
> --              printf ("%7llu ", (unsigned long long) start);
> --#else
> --              printf ("%7I64d ", (unsigned long long) start);
> --#endif
> --            }
> --          else
> --            printf ("%7ld ", (long) start);
> --          break;
> --
> --        case 16:
> --          if (sizeof (start) > sizeof (long))
> --            {
> --#ifndef __MSVCRT__
> --              printf ("%7llx ", (unsigned long long) start);
> --#else
> --              printf ("%7I64x ", (unsigned long long) start);
> --#endif
> --            }
> --          else
> --            printf ("%7lx ", (unsigned long) start);
> --          break;
> --        }
> -+      print_filename_and_address (filename, start);
> -
> -       buf[i] =3D '\0';
> -       fputs (buf, stdout);
> -@@ -697,6 +1332,8 @@ usage (FILE *stream, int status)
> -   -T --target=3D<BFDNAME>     Specify the binary file format\n\
> -   -e --encoding=3D{s,S,b,l,B,L} Select character size and endianness:\n=
\
> -                             s =3D 7-bit, S =3D 8-bit, {b,l} =3D 16-bit,=
 {B,L} =3D 32-bit\n\
> -+  --unicode=3D{default|show|invalid|hex|escape|highlight}\n\
> -+  -u {d|s|i|x|e|h}          Specify how to treat UTF-8 encoded unicode =
characters\n\
> -   -s --output-separator=3D<string> String used to separate strings in o=
utput.\n\
> -   @<file>                   Read options from <file>\n\
> -   -h --help                 Display this information\n\
> diff --git a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosss=
dk-Generate-relocatable-SDKs.patch b/meta/recipes-devtools/binutils/binutil=
s/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
> index 53e30a0aaa2..719928be798 100644
> --- a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Gene=
rate-relocatable-SDKs.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Gene=
rate-relocatable-SDKs.patch
> @@ -1,4 +1,4 @@
> -From 257ad1ce148417e1cefe2332d8acc5c8216c2522 Mon Sep 17 00:00:00 2001
> +From 07bb7fbdacaf9cd6a1a252ffbc98f4e05e305d50 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:58:54 +0000
>  Subject: [PATCH] binutils-crosssdk: Generate relocatable SDKs
> @@ -21,10 +21,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   3 files changed, 6 insertions(+), 3 deletions(-)
>
>  diff --git a/gold/layout.cc b/gold/layout.cc
> -index a27cb071c75..32b52890b39 100644
> +index 3efe8d98ae9..9cc389664a6 100644
>  --- a/gold/layout.cc
>  +++ b/gold/layout.cc
> -@@ -5032,7 +5032,7 @@ Layout::create_interp(const Target* target)
> +@@ -5033,7 +5033,7 @@ Layout::create_interp(const Target* target)
>         gold_assert(interp !=3D NULL);
>       }
>
> @@ -34,7 +34,7 @@ index a27cb071c75..32b52890b39 100644
>     Output_section_data* odata =3D new Output_data_const(interp, len, 1);
>
>  diff --git a/ld/genscripts.sh b/ld/genscripts.sh
> -index 088417ef2d5..46a2db7005c 100755
> +index 278f212bdad..0c52ebee4d0 100755
>  --- a/ld/genscripts.sh
>  +++ b/ld/genscripts.sh
>  @@ -304,6 +304,7 @@ DATA_ALIGNMENT_u=3D"${DATA_ALIGNMENT_u-${DATA_ALIGNM=
ENT_r}}"
> @@ -59,10 +59,10 @@ index 088417ef2d5..46a2db7005c 100755
>   DATA_ALIGNMENT=3D${DATA_ALIGNMENT_}
>   RELOCATING=3D" "
>  diff --git a/ld/scripttempl/elf.sc b/ld/scripttempl/elf.sc
> -index 29a8f0781d5..75e46f4adaf 100644
> +index bf2268bb0ad..b1811ef130f 100644
>  --- a/ld/scripttempl/elf.sc
>  +++ b/ld/scripttempl/elf.sc
> -@@ -147,8 +147,8 @@ if test -z "$DATA_SEGMENT_ALIGN"; then
> +@@ -148,8 +148,8 @@ if test -z "$DATA_SEGMENT_ALIGN"; then
>       DATA_SEGMENT_RELRO_END=3D". =3D DATA_SEGMENT_RELRO_END (${SEPARATE_=
GOTPLT-0}, .);"
>     fi
>   fi
> diff --git a/meta/recipes-devtools/binutils/binutils/0001-elf-Discard-inp=
ut-.note.gnu.build-id-sections.patch b/meta/recipes-devtools/binutils/binut=
ils/0001-elf-Discard-input-.note.gnu.build-id-sections.patch
> deleted file mode 100644
> index c93af4e46f8..00000000000
> --- a/meta/recipes-devtools/binutils/binutils/0001-elf-Discard-input-.not=
e.gnu.build-id-sections.patch
> +++ /dev/null
> @@ -1,215 +0,0 @@
> -From b2e18d3ea300f7491705b6e86a7cc3d6366e3b1f Mon Sep 17 00:00:00 2001
> -From: "H.J. Lu" <hjl.tools@gmail.com>
> -Date: Tue, 30 Nov 2021 20:40:38 -0800
> -Subject: [PATCH] elf: Discard input .note.gnu.build-id sections
> -
> -1. Discard input .note.gnu.build-id sections.
> -2. Clear the build ID field before writing.
> -3. Use bfd_make_section_anyway_with_flags to create the output
> -.note.gnu.build-id section.
> -
> -       PR ld/28639
> -       * ldelf.c (ldelf_after_open): Discard input .note.gnu.build-id
> -       sections, excluding the first one.
> -       (write_build_id): Clear the build ID field before writing.
> -       (ldelf_setup_build_id): Use bfd_make_section_anyway_with_flags
> -       to create the output .note.gnu.build-id section.
> -       * testsuite/ld-elf/build-id.exp: New file.
> -       * testsuite/ld-elf/pr28639a.rd: Likewise.
> -       * testsuite/ld-elf/pr28639b.rd: Likewise.
> -       * testsuite/ld-elf/pr28639c.rd: Likewise.
> -       * testsuite/ld-elf/pr28639d.rd: Likewise.
> -
> -Upstream-Status: Backport
> -
> -Reference to upstream patch:
> -[https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D1f1d0f8=
888a6c944e612b416a2a6e11abcf5199f]
> ----
> - ld/ldelf.c                       | 15 ++++++-
> - ld/testsuite/ld-elf/build-id.exp | 77 ++++++++++++++++++++++++++++++++
> - ld/testsuite/ld-elf/pr28639a.rd  |  6 +++
> - ld/testsuite/ld-elf/pr28639b.rd  |  6 +++
> - ld/testsuite/ld-elf/pr28639c.rd  | 10 +++++
> - ld/testsuite/ld-elf/pr28639d.rd  |  4 ++
> - 6 files changed, 117 insertions(+), 1 deletion(-)
> - create mode 100644 ld/testsuite/ld-elf/build-id.exp
> - create mode 100644 ld/testsuite/ld-elf/pr28639a.rd
> - create mode 100644 ld/testsuite/ld-elf/pr28639b.rd
> - create mode 100644 ld/testsuite/ld-elf/pr28639c.rd
> - create mode 100644 ld/testsuite/ld-elf/pr28639d.rd
> -
> -diff --git a/ld/ldelf.c b/ld/ldelf.c
> -index 21e655bb55c..8501d98b48f 100644
> ---- a/ld/ldelf.c
> -+++ b/ld/ldelf.c
> -@@ -1043,6 +1043,15 @@ ldelf_after_open (int use_libpath, int native, in=
t is_linux, int is_freebsd,
> -   /* Do not allow executable files to be used as inputs to the link.  *=
/
> -   for (abfd =3D link_info.input_bfds; abfd; abfd =3D abfd->link.next)
> -     {
> -+      /* Discard input .note.gnu.build-id sections.  */
> -+      s =3D bfd_get_section_by_name (abfd, ".note.gnu.build-id");
> -+      while (s !=3D NULL)
> -+      {
> -+        if (s !=3D elf_tdata (link_info.output_bfd)->o->build_id.sec)
> -+          s->flags |=3D SEC_EXCLUDE;
> -+        s =3D bfd_get_next_section_by_name (NULL, s);
> -+      }
> -+
> -       if (abfd->xvec->flavour =3D=3D bfd_target_elf_flavour
> -         && !bfd_input_just_syms (abfd)
> -         && elf_tdata (abfd) !=3D NULL
> -@@ -1387,6 +1396,9 @@ write_build_id (bfd *abfd)
> -   id_bits =3D contents + size;
> -   size =3D asec->size - size;
> -
> -+  /* Clear the build ID field.  */
> -+  memset (id_bits, 0, size);
> -+
> -   bfd_h_put_32 (abfd, sizeof "GNU", &e_note->namesz);
> -   bfd_h_put_32 (abfd, size, &e_note->descsz);
> -   bfd_h_put_32 (abfd, NT_GNU_BUILD_ID, &e_note->type);
> -@@ -1418,7 +1430,8 @@ ldelf_setup_build_id (bfd *ibfd)
> -
> -   flags =3D (SEC_ALLOC | SEC_LOAD | SEC_IN_MEMORY
> -          | SEC_LINKER_CREATED | SEC_READONLY | SEC_DATA);
> --  s =3D bfd_make_section_with_flags (ibfd, ".note.gnu.build-id", flags)=
;
> -+  s =3D bfd_make_section_anyway_with_flags (ibfd, ".note.gnu.build-id",
> -+                                        flags);
> -   if (s !=3D NULL && bfd_set_section_alignment (s, 2))
> -     {
> -       struct elf_obj_tdata *t =3D elf_tdata (link_info.output_bfd);
> -diff --git a/ld/testsuite/ld-elf/build-id.exp b/ld/testsuite/ld-elf/buil=
d-id.exp
> -new file mode 100644
> -index 00000000000..19c22a75c4d
> ---- /dev/null
> -+++ b/ld/testsuite/ld-elf/build-id.exp
> -@@ -0,0 +1,77 @@
> -+# Expect script for --build-id tests.
> -+#   Copyright (C) 2021 Free Software Foundation, Inc.
> -+#
> -+# This file is part of the GNU Binutils.
> -+#
> -+# This program is free software; you can redistribute it and/or modify
> -+# it under the terms of the GNU General Public License as published by
> -+# the Free Software Foundation; either version 3 of the License, or
> -+# (at your option) any later version.
> -+#
> -+# This program is distributed in the hope that it will be useful,
> -+# but WITHOUT ANY WARRANTY; without even the implied warranty of
> -+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -+# GNU General Public License for more details.
> -+#
> -+# You should have received a copy of the GNU General Public License
> -+# along with this program; if not, write to the Free Software
> -+# Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston,
> -+# MA 02110-1301, USA.
> -+#
> -+
> -+# Exclude non-ELF targets.
> -+
> -+if ![is_elf_format] {
> -+    return
> -+}
> -+
> -+if { [istarget frv-*-*] || [istarget lm32-*-*] } {
> -+    return
> -+}
> -+
> -+if { !([istarget *-*-linux*]
> -+       || [istarget arm*-*-uclinuxfdpiceabi]
> -+       || [istarget *-*-nacl*]
> -+       || [istarget *-*-gnu*]) } then {
> -+    return
> -+}
> -+
> -+run_ld_link_tests [list \
> -+    [list \
> -+      "pr28639a.o" \
> -+      "-r --build-id=3Dmd5" \
> -+      "" \
> -+      "" \
> -+      {start.s} \
> -+      {{readelf {--notes} pr28639a.rd}} \
> -+      "pr28639a.o" \
> -+    ] \
> -+    [list \
> -+      "pr28639a.o" \
> -+      "-r --build-id" \
> -+      "" \
> -+      "" \
> -+      {dummy.s} \
> -+      {{readelf {--notes} pr28639b.rd}} \
> -+      "pr28639b.o" \
> -+    ] \
> -+    [list \
> -+      "pr28639a" \
> -+      "--build-id tmpdir/pr28639a.o tmpdir/pr28639b.o" \
> -+      "" \
> -+      "" \
> -+      {dummy.s} \
> -+      {{readelf {--notes} pr28639b.rd}  \
> -+       {readelf {--notes} pr28639c.rd}} \
> -+      "pr28639a" \
> -+    ] \
> -+    [list \
> -+      "pr28639b" \
> -+      "--build-id=3Dnone tmpdir/pr28639a.o tmpdir/pr28639b.o" \
> -+      "" \
> -+      "" \
> -+      {dummy.s} \
> -+      {{readelf {--notes} pr28639d.rd}} \
> -+      "pr28639b" \
> -+    ] \
> -+]
> -diff --git a/ld/testsuite/ld-elf/pr28639a.rd b/ld/testsuite/ld-elf/pr286=
39a.rd
> -new file mode 100644
> -index 00000000000..e85087064d0
> ---- /dev/null
> -+++ b/ld/testsuite/ld-elf/pr28639a.rd
> -@@ -0,0 +1,6 @@
> -+#...
> -+Displaying notes found in: \.note\.gnu\.build-id
> -+  Owner                Data size      Description
> -+  GNU                  0x00000010     NT_GNU_BUILD_ID \(unique build ID=
 bitstring\)
> -+    Build ID: [0-9a-f]+
> -+#pass
> -diff --git a/ld/testsuite/ld-elf/pr28639b.rd b/ld/testsuite/ld-elf/pr286=
39b.rd
> -new file mode 100644
> -index 00000000000..04dcb04bec2
> ---- /dev/null
> -+++ b/ld/testsuite/ld-elf/pr28639b.rd
> -@@ -0,0 +1,6 @@
> -+#...
> -+Displaying notes found in: \.note\.gnu\.build-id
> -+  Owner                Data size      Description
> -+  GNU                  0x00000014     NT_GNU_BUILD_ID \(unique build ID=
 bitstring\)
> -+    Build ID: [0-9a-f]+
> -+#pass
> -diff --git a/ld/testsuite/ld-elf/pr28639c.rd b/ld/testsuite/ld-elf/pr286=
39c.rd
> -new file mode 100644
> -index 00000000000..64221e5fa51
> ---- /dev/null
> -+++ b/ld/testsuite/ld-elf/pr28639c.rd
> -@@ -0,0 +1,10 @@
> -+#failif
> -+#...
> -+Displaying notes found in: \.note\.gnu\.build-id
> -+  Owner                Data size      Description
> -+  GNU                  0x[0-9a-f]+    NT_GNU_BUILD_ID \(unique build ID=
 bitstring\)
> -+    Build ID: [0-9a-f]+
> -+  Owner                Data size      Description
> -+  GNU                  0x[0-9a-f]+    NT_GNU_BUILD_ID \(unique build ID=
 bitstring\)
> -+    Build ID: [0-9a-f]+
> -+#...
> -diff --git a/ld/testsuite/ld-elf/pr28639d.rd b/ld/testsuite/ld-elf/pr286=
39d.rd
> -new file mode 100644
> -index 00000000000..897c8493efa
> ---- /dev/null
> -+++ b/ld/testsuite/ld-elf/pr28639d.rd
> -@@ -0,0 +1,4 @@
> -+#failif
> -+#...
> -+Displaying notes found in: \.note\.gnu\.build-id
> -+#...
> ---
> -
> diff --git a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-=
Do-not-generate-linker-script-directo.patch b/meta/recipes-devtools/binutil=
s/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
> index a6ca41374a8..a3f7d62898b 100644
> --- a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-=
generate-linker-script-directo.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-=
generate-linker-script-directo.patch
> @@ -1,4 +1,4 @@
> -From 6e93d0328f499569db7ce6396f94f304ce340df8 Mon Sep 17 00:00:00 2001
> +From f820ab7ea7e94d4df548be3388163ff2efb2ea96 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 6 Mar 2017 23:37:05 -0800
>  Subject: [PATCH] binutils-cross: Do not generate linker script directori=
es
> @@ -22,7 +22,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 25 deletions(-)
>
>  diff --git a/ld/genscripts.sh b/ld/genscripts.sh
> -index 46a2db7005c..4bb7c33f560 100755
> +index 0c52ebee4d0..1acbe66bd2e 100755
>  --- a/ld/genscripts.sh
>  +++ b/ld/genscripts.sh
>  @@ -235,31 +235,6 @@ append_to_lib_path()
> diff --git a/meta/recipes-devtools/binutils/binutils/0003-binutils-native=
sdk-Search-for-alternative-ld.so.conf.patch b/meta/recipes-devtools/binutil=
s/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
> index 3c4f706f2d9..59a97c13c75 100644
> --- a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Sea=
rch-for-alternative-ld.so.conf.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Sea=
rch-for-alternative-ld.so.conf.patch
> @@ -1,4 +1,4 @@
> -From d49016d3faf684319bf3ac37450558920d70be03 Mon Sep 17 00:00:00 2001
> +From b2ccd25828b40310caeb094c0413e3a30a4dc0a5 Mon Sep 17 00:00:00 2001
>  From: Richard Purdie <richard.purdie@linuxfoundation.org>
>  Date: Wed, 19 Feb 2020 09:51:16 -0800
>  Subject: [PATCH] binutils-nativesdk: Search for alternative ld.so.conf i=
n SDK
> @@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   5 files changed, 7 insertions(+), 3 deletions(-)
>
>  diff --git a/ld/Makefile.am b/ld/Makefile.am
> -index f8e99325361..fd196541f59 100644
> +index b55a873d927..61db131fb0d 100644
>  --- a/ld/Makefile.am
>  +++ b/ld/Makefile.am
>  @@ -42,7 +42,8 @@ ZLIBINC =3D @zlibinc@
> @@ -43,10 +43,10 @@ index f8e99325361..fd196541f59 100644
>   NO_WERROR =3D @NO_WERROR@
>   AM_CFLAGS =3D $(WARN_CFLAGS) $(ELF_CLFAGS)
>  diff --git a/ld/Makefile.in b/ld/Makefile.in
> -index ef2e99e08da..cb8f5bfb70e 100644
> +index 61e93eeaf1e..860eb21a785 100644
>  --- a/ld/Makefile.in
>  +++ b/ld/Makefile.in
> -@@ -555,7 +555,8 @@ ZLIB =3D @zlibdir@ -lz
> +@@ -556,7 +556,8 @@ ZLIB =3D @zlibdir@ -lz
>   ZLIBINC =3D @zlibinc@
>   ELF_CLFAGS =3D -DELF_LIST_OPTIONS=3D@elf_list_options@ \
>            -DELF_SHLIB_LIST_OPTIONS=3D@elf_shlib_list_options@ \
> @@ -57,10 +57,10 @@ index ef2e99e08da..cb8f5bfb70e 100644
>   AM_CFLAGS =3D $(WARN_CFLAGS) $(ELF_CLFAGS)
>
>  diff --git a/ld/ldelf.c b/ld/ldelf.c
> -index 21e655bb55c..d1615003ede 100644
> +index 121c25d948f..34cbc60e5e9 100644
>  --- a/ld/ldelf.c
>  +++ b/ld/ldelf.c
> -@@ -911,7 +911,7 @@ ldelf_check_ld_so_conf (const struct bfd_link_needed=
_list *l, int force,
> +@@ -930,7 +930,7 @@ ldelf_check_ld_so_conf (const struct bfd_link_needed=
_list *l, int force,
>
>         info.path =3D NULL;
>         info.len =3D info.alloc =3D 0;
> @@ -70,7 +70,7 @@ index 21e655bb55c..d1615003ede 100644
>         if (!ldelf_parse_ld_so_conf (&info, tmppath))
>         {
>  diff --git a/ld/ldmain.c b/ld/ldmain.c
> -index 42660eb9a3c..5a4a4d5da3d 100644
> +index ea72b14a301..1ae90a77749 100644
>  --- a/ld/ldmain.c
>  +++ b/ld/ldmain.c
>  @@ -70,6 +70,7 @@ char *program_name;
> @@ -82,7 +82,7 @@ index 42660eb9a3c..5a4a4d5da3d 100644
>   /* The canonical representation of ld_sysroot.  */
>   char *ld_canon_sysroot;
>  diff --git a/ld/ldmain.h b/ld/ldmain.h
> -index 39d08a6c378..4c3519e7970 100644
> +index f6d05a02f59..e60292cd522 100644
>  --- a/ld/ldmain.h
>  +++ b/ld/ldmain.h
>  @@ -23,6 +23,7 @@
> diff --git a/meta/recipes-devtools/binutils/binutils/0005-Point-scripts-l=
ocation-to-libdir.patch b/meta/recipes-devtools/binutils/binutils/0004-Poin=
t-scripts-location-to-libdir.patch
> similarity index 85%
> rename from meta/recipes-devtools/binutils/binutils/0005-Point-scripts-lo=
cation-to-libdir.patch
> rename to meta/recipes-devtools/binutils/binutils/0004-Point-scripts-loca=
tion-to-libdir.patch
> index 7cd4a99d332..8f323eb0c5b 100644
> --- a/meta/recipes-devtools/binutils/binutils/0005-Point-scripts-location=
-to-libdir.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location=
-to-libdir.patch
> @@ -1,4 +1,4 @@
> -From 1a9fcaae50e63b993019bd4dc00219e43421efdc Mon Sep 17 00:00:00 2001
> +From 7a7b777cdfded080aab1021fa6bcdb20345f5cfd Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:09:58 +0000
>  Subject: [PATCH] Point scripts location to libdir
> @@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/ld/Makefile.am b/ld/Makefile.am
> -index fd196541f59..d94fa7e64e1 100644
> +index 61db131fb0d..5b5ee64d121 100644
>  --- a/ld/Makefile.am
>  +++ b/ld/Makefile.am
>  @@ -51,7 +51,7 @@ AM_CFLAGS =3D $(WARN_CFLAGS) $(ELF_CLFAGS)
> @@ -25,10 +25,10 @@ index fd196541f59..d94fa7e64e1 100644
>   EMUL =3D @EMUL@
>   EMULATION_OFILES =3D @EMULATION_OFILES@
>  diff --git a/ld/Makefile.in b/ld/Makefile.in
> -index cb8f5bfb70e..9a58879c5ca 100644
> +index 860eb21a785..d719747919c 100644
>  --- a/ld/Makefile.in
>  +++ b/ld/Makefile.in
> -@@ -563,7 +563,7 @@ AM_CFLAGS =3D $(WARN_CFLAGS) $(ELF_CLFAGS)
> +@@ -564,7 +564,7 @@ AM_CFLAGS =3D $(WARN_CFLAGS) $(ELF_CLFAGS)
>   # We put the scripts in the directory $(scriptdir)/ldscripts.
>   # We can't put the scripts in $(datadir) because the SEARCH_DIR
>   # directives need to be different for native and cross linkers.
> diff --git a/meta/recipes-devtools/binutils/binutils/0006-Only-generate-a=
n-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch b/meta/recipes-devtools/binutil=
s/binutils/0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
> similarity index 82%
> rename from meta/recipes-devtools/binutils/binutils/0006-Only-generate-an=
-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
> rename to meta/recipes-devtools/binutils/binutils/0005-Only-generate-an-R=
PATH-entry-if-LD_RUN_PATH-is-not-e.patch
> index d6b04fdae47..997774020e2 100644
> --- a/meta/recipes-devtools/binutils/binutils/0006-Only-generate-an-RPATH=
-entry-if-LD_RUN_PATH-is-not-e.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0005-Only-generate-an-RPATH=
-entry-if-LD_RUN_PATH-is-not-e.patch
> @@ -1,4 +1,4 @@
> -From 29517900352336708495d41902b5b7e8cc9a401a Mon Sep 17 00:00:00 2001
> +From edddb1f294d667eac94649ba0665fe464990ed18 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:27:17 +0000
>  Subject: [PATCH] Only generate an RPATH entry if LD_RUN_PATH is not empt=
y
> @@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 4 insertions(+)
>
>  diff --git a/ld/ldelf.c b/ld/ldelf.c
> -index d1615003ede..6a894285b11 100644
> +index 34cbc60e5e9..b1965a9e96f 100644
>  --- a/ld/ldelf.c
>  +++ b/ld/ldelf.c
> -@@ -1250,6 +1250,8 @@ ldelf_after_open (int use_libpath, int native, int=
 is_linux, int is_freebsd,
> +@@ -1277,6 +1277,8 @@ ldelf_after_open (int use_libpath, int native, int=
 is_linux, int is_freebsd,
>                   && command_line.rpath =3D=3D NULL)
>                 {
>                   path =3D (const char *) getenv ("LD_RUN_PATH");
> @@ -26,7 +26,7 @@ index d1615003ede..6a894285b11 100644
>                   if (path
>                       && ldelf_search_needed (path, &n, force,
>                                               is_linux, elfsize))
> -@@ -1610,6 +1612,8 @@ ldelf_before_allocation (char *audit, char *depaud=
it,
> +@@ -1636,6 +1638,8 @@ ldelf_before_allocation (char *audit, char *depaud=
it,
>     rpath =3D command_line.rpath;
>     if (rpath =3D=3D NULL)
>       rpath =3D (const char *) getenv ("LD_RUN_PATH");
> diff --git a/meta/recipes-devtools/binutils/binutils/0007-don-t-let-the-d=
istro-compiler-point-to-the-wrong-ins.patch b/meta/recipes-devtools/binutil=
s/binutils/0006-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
> similarity index 87%
> rename from meta/recipes-devtools/binutils/binutils/0007-don-t-let-the-di=
stro-compiler-point-to-the-wrong-ins.patch
> rename to meta/recipes-devtools/binutils/binutils/0006-don-t-let-the-dist=
ro-compiler-point-to-the-wrong-ins.patch
> index 39cef70bcd4..507d0b1b2d8 100644
> --- a/meta/recipes-devtools/binutils/binutils/0007-don-t-let-the-distro-c=
ompiler-point-to-the-wrong-ins.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0006-don-t-let-the-distro-c=
ompiler-point-to-the-wrong-ins.patch
> @@ -1,4 +1,4 @@
> -From 37581c8ce9d98a1183706e12a2c9a73f7f40462d Mon Sep 17 00:00:00 2001
> +From fc9e8b99969bb32a4b009eab763bade6c554ef73 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:39:01 +0000
>  Subject: [PATCH] don't let the distro compiler point to the wrong instal=
lation
> @@ -17,10 +17,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
>  diff --git a/libiberty/Makefile.in b/libiberty/Makefile.in
> -index 4f1213b983b..2ba18b75cac 100644
> +index abef3c4601b..880c8826482 100644
>  --- a/libiberty/Makefile.in
>  +++ b/libiberty/Makefile.in
> -@@ -367,7 +367,8 @@ install-strip: install
> +@@ -385,7 +385,8 @@ install-strip: install
>   # multilib-specific flags, it's overridden by FLAGS_TO_PASS from the
>   # default multilib, so we have to take CFLAGS into account as well,
>   # since it will be passed the multilib flags.
> diff --git a/meta/recipes-devtools/binutils/binutils/0008-warn-for-uses-o=
f-system-directories-when-cross-linki.patch b/meta/recipes-devtools/binutil=
s/binutils/0007-warn-for-uses-of-system-directories-when-cross-linki.patch
> similarity index 85%
> rename from meta/recipes-devtools/binutils/binutils/0008-warn-for-uses-of=
-system-directories-when-cross-linki.patch
> rename to meta/recipes-devtools/binutils/binutils/0007-warn-for-uses-of-s=
ystem-directories-when-cross-linki.patch
> index c724dfd7a77..547bfcac681 100644
> --- a/meta/recipes-devtools/binutils/binutils/0008-warn-for-uses-of-syste=
m-directories-when-cross-linki.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0007-warn-for-uses-of-syste=
m-directories-when-cross-linki.patch
> @@ -1,4 +1,4 @@
> -From 99e1565b9d2b929d4ee4e9da6f63766b22b23fc3 Mon Sep 17 00:00:00 2001
> +From 9fb1bafb20371d82b674778d2a8b5c9444fed417 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 15 Jan 2016 06:31:09 +0000
>  Subject: [PATCH] warn for uses of system directories when cross linking
> @@ -58,10 +58,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   ld/ld.texi      | 12 ++++++++++++
>   ld/ldfile.c     | 17 +++++++++++++++++
>   ld/ldlex.h      |  2 ++
> - ld/ldmain.c     |  2 ++
> + ld/ldmain.c     |  6 ++++--
>   ld/lexsup.c     | 16 ++++++++++++++++
> - 9 files changed, 86 insertions(+)
> + 9 files changed, 88 insertions(+), 2 deletions(-)
>
> +diff --git a/ld/config.in b/ld/config.in
> +index 26d55a00d47..ffad464783c 100644
>  --- a/ld/config.in
>  +++ b/ld/config.in
>  @@ -43,6 +43,9 @@
> @@ -74,9 +76,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   /* Additional extension a shared object might have. */
>   #undef EXTRA_SHLIB_EXTENSION
>
> +diff --git a/ld/configure b/ld/configure
> +index 26150d62898..1f9ec8ec580 100755
>  --- a/ld/configure
>  +++ b/ld/configure
> -@@ -829,6 +829,7 @@ with_lib_path
> +@@ -831,6 +831,7 @@ with_lib_path
>   enable_targets
>   enable_64_bit_bfd
>   with_sysroot
> @@ -84,7 +88,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   enable_gold
>   enable_got
>   enable_compressed_debug_sections
> -@@ -1498,6 +1499,8 @@ Optional Features:
> +@@ -1500,6 +1501,8 @@ Optional Features:
>     --enable-checking       enable run-time checks
>     --enable-targets        alternative target configurations
>     --enable-64-bit-bfd     64-bit support (on hosts with narrower word s=
izes)
> @@ -93,7 +97,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>     --enable-gold[=3DARG]     build gold [ARG=3D{default,yes,no}]
>     --enable-got=3D<type>     GOT handling scheme (target, single, negati=
ve,
>                             multigot)
> -@@ -15215,6 +15218,19 @@ fi
> +@@ -15312,6 +15315,19 @@ fi
>
>
>
> @@ -113,9 +117,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   # Check whether --enable-gold was given.
>   if test "${enable_gold+set}" =3D set; then :
>     enableval=3D$enable_gold; case "${enableval}" in
> +diff --git a/ld/configure.ac b/ld/configure.ac
> +index 7f4cff079b7..57d1abff870 100644
>  --- a/ld/configure.ac
>  +++ b/ld/configure.ac
> -@@ -106,6 +106,16 @@ AC_SUBST(use_sysroot)
> +@@ -102,6 +102,16 @@ AC_SUBST(use_sysroot)
>   AC_SUBST(TARGET_SYSTEM_ROOT)
>   AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)
>
> @@ -132,6 +138,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   dnl Use --enable-gold to decide if this linker should be the default.
>   dnl "install_as_default" is set to false if gold is the default linker.
>   dnl "installed_linker" is the installed BFD linker name.
> +diff --git a/ld/ld.h b/ld/ld.h
> +index f3086bf30de..db5064243c7 100644
>  --- a/ld/ld.h
>  +++ b/ld/ld.h
>  @@ -162,6 +162,14 @@ typedef struct
> @@ -149,9 +157,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>     /* Big or little endian as set on command line.  */
>     enum endian_enum endian;
>
> +diff --git a/ld/ld.texi b/ld/ld.texi
> +index fc75e9b3625..dca697d626e 100644
>  --- a/ld/ld.texi
>  +++ b/ld/ld.texi
> -@@ -2863,6 +2863,18 @@ string identifying the original linked f
> +@@ -2892,6 +2892,18 @@ string identifying the original linked file does =
not change.
>
>   Passing @code{none} for @var{style} disables the setting from any
>   @code{--build-id} options earlier on the command line.
> @@ -170,9 +180,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   @end table
>
>   @c man end
> +diff --git a/ld/ldfile.c b/ld/ldfile.c
> +index 731ae5f7aed..dd8f03fd960 100644
>  --- a/ld/ldfile.c
>  +++ b/ld/ldfile.c
> -@@ -117,6 +117,23 @@ ldfile_add_library_path (const char *nam
> +@@ -117,6 +117,23 @@ ldfile_add_library_path (const char *name, bool cmd=
line)
>       new_dirs->name =3D concat (ld_sysroot, name + strlen ("$SYSROOT"), =
(const char *) NULL);
>     else
>       new_dirs->name =3D xstrdup (name);
> @@ -196,9 +208,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   }
>
>   /* Try to open a BFD for a lang_input_statement.  */
> +diff --git a/ld/ldlex.h b/ld/ldlex.h
> +index bc58fea73cc..a1595589197 100644
>  --- a/ld/ldlex.h
>  +++ b/ld/ldlex.h
> -@@ -163,6 +163,8 @@ enum option_values
> +@@ -164,6 +164,8 @@ enum option_values
>     OPTION_CTF_VARIABLES,
>     OPTION_NO_CTF_VARIABLES,
>     OPTION_CTF_SHARE_TYPES,
> @@ -207,9 +221,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   };
>
>   /* The initial parser states.  */
> +diff --git a/ld/ldmain.c b/ld/ldmain.c
> +index 1ae90a77749..f40750fd816 100644
>  --- a/ld/ldmain.c
>  +++ b/ld/ldmain.c
> -@@ -321,6 +321,8 @@ main (int argc, char **argv)
> +@@ -322,6 +322,8 @@ main (int argc, char **argv)
>     command_line.warn_mismatch =3D true;
>     command_line.warn_search_mismatch =3D true;
>     command_line.check_section_addresses =3D -1;
> @@ -218,7 +234,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
>     /* We initialize DEMANGLING based on the environment variable
>        COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
> -@@ -1444,7 +1446,7 @@ undefined_symbol (struct bfd_link_info *
> +@@ -1447,7 +1449,7 @@ undefined_symbol (struct bfd_link_info *info,
>         argv[1] =3D "undefined-symbol";
>         argv[2] =3D (char *) name;
>         argv[3] =3D NULL;
> @@ -227,7 +243,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>         if (verbose)
>         einfo (_("%P: About to run error handling script '%s' with argume=
nts: '%s' '%s'\n"),
>                argv[0], argv[1], argv[2]);
> -@@ -1465,7 +1467,7 @@ undefined_symbol (struct bfd_link_info *
> +@@ -1468,7 +1470,7 @@ undefined_symbol (struct bfd_link_info *info,
>          carry on to issue the normal error message.  */
>       }
>   #endif /* SUPPORT_ERROR_HANDLING_SCRIPT */
> @@ -236,9 +252,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>     if (section !=3D NULL)
>       {
>         if (error_count < MAX_ERRORS_IN_A_ROW)
> +diff --git a/ld/lexsup.c b/ld/lexsup.c
> +index 5acc47ed5a0..d03c6136ccf 100644
>  --- a/ld/lexsup.c
>  +++ b/ld/lexsup.c
> -@@ -595,6 +595,14 @@ static const struct ld_option ld_options
> +@@ -600,6 +600,14 @@ static const struct ld_option ld_options[] =3D
>                    "                                <method> is: share-un=
conflicted (default),\n"
>                    "                                             share-du=
plicated"),
>       TWO_DASHES },
> @@ -253,7 +271,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   };
>
>   #define OPTION_COUNT ARRAY_SIZE (ld_options)
> -@@ -1686,6 +1694,14 @@ parse_args (unsigned argc, char **argv)
> +@@ -1702,6 +1710,14 @@ parse_args (unsigned argc, char **argv)
>           config.print_map_discarded =3D true;
>           break;
>
> diff --git a/meta/recipes-devtools/binutils/binutils/0011-fix-the-incorre=
ct-assembling-for-ppc-wait-mnemonic.patch b/meta/recipes-devtools/binutils/=
binutils/0008-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> similarity index 93%
> rename from meta/recipes-devtools/binutils/binutils/0011-fix-the-incorrec=
t-assembling-for-ppc-wait-mnemonic.patch
> rename to meta/recipes-devtools/binutils/binutils/0008-fix-the-incorrect-=
assembling-for-ppc-wait-mnemonic.patch
> index a271f55ea1a..648bdc13d2c 100644
> --- a/meta/recipes-devtools/binutils/binutils/0011-fix-the-incorrect-asse=
mbling-for-ppc-wait-mnemonic.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0008-fix-the-incorrect-asse=
mbling-for-ppc-wait-mnemonic.patch
> @@ -1,4 +1,4 @@
> -From b77c5a67d4ac2513d0b4bab5e4dd1c33b339689b Mon Sep 17 00:00:00 2001
> +From 00ae1ee97ad3ad0624798b28c6bab94a19b3ef39 Mon Sep 17 00:00:00 2001
>  From: Zhenhua Luo <zhenhua.luo@nxp.com>
>  Date: Sat, 11 Jun 2016 22:08:29 -0500
>  Subject: [PATCH] fix the incorrect assembling for ppc wait mnemonic
> @@ -7,15 +7,14 @@ The wait mnemonic for ppc targets is incorrectly assemb=
led into 0x7c00003c due
>  to duplicated address definition with waitasec instruction. The issue ca=
uses
>  kernel boot calltrace for ppc targets when wait instruction is executed.
>
> -Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
> -
>  Upstream-Status: Pending
> +Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
>  ---
>   opcodes/ppc-opc.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
>  diff --git a/opcodes/ppc-opc.c b/opcodes/ppc-opc.c
> -index 13d8b6c3c07..cd979f9c80c 100644
> +index a424dd924de..406d5b60917 100644
>  --- a/opcodes/ppc-opc.c
>  +++ b/opcodes/ppc-opc.c
>  @@ -6378,8 +6378,6 @@ const struct powerpc_opcode powerpc_opcodes[] =3D =
{
> diff --git a/meta/recipes-devtools/binutils/binutils/0013-Use-libtool-2.4=
.patch b/meta/recipes-devtools/binutils/binutils/0009-Use-libtool-2.4.patch
> similarity index 88%
> rename from meta/recipes-devtools/binutils/binutils/0013-Use-libtool-2.4.=
patch
> rename to meta/recipes-devtools/binutils/binutils/0009-Use-libtool-2.4.pa=
tch
> index 8f87cfdb777..9f0209e2745 100644
> --- a/meta/recipes-devtools/binutils/binutils/0013-Use-libtool-2.4.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0009-Use-libtool-2.4.patch
> @@ -1,4 +1,4 @@
> -From fd34d57c9e2a0bff1283a6707062ed4a42476b10 Mon Sep 17 00:00:00 2001
> +From 9a0dea4d2f1f0f2c71f519e6195ef9cfacd9fda9 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sun, 14 Feb 2016 17:04:07 +0000
>  Subject: [PATCH] Use libtool 2.4
> @@ -9,27 +9,28 @@ Upstream-Status: Pending
>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> - bfd/configure      | 1340 +++++++++++++++-----
> - bfd/configure.ac   |    2 +-
> - binutils/configure | 1338 +++++++++++++++-----
> - gas/configure      | 1338 +++++++++++++++-----
> - gprof/configure    | 1338 +++++++++++++++-----
> - ld/configure       | 1713 +++++++++++++++++++-------
> - libctf/configure   | 1337 +++++++++++++++-----
> - libtool.m4         | 1100 +++++++++++------
> - ltmain.sh          | 2925 +++++++++++++++++++++++++++++---------------
> - ltoptions.m4       |    2 +-
> - ltversion.m4       |   12 +-
> - lt~obsolete.m4     |    2 +-
> - opcodes/configure  | 1338 +++++++++++++++-----
> - zlib/configure     | 1338 +++++++++++++++-----
> - 14 files changed, 10995 insertions(+), 4128 deletions(-)
> + bfd/configure          | 1333 +++++++++++++-----
> + bfd/configure.ac       |    2 +-
> + binutils/configure     | 1331 +++++++++++++-----
> + gas/configure          | 1331 +++++++++++++-----
> + gprof/configure        | 1331 +++++++++++++-----
> + ld/configure           | 1704 +++++++++++++++++------
> + libbacktrace/configure | 1534 +++++++++++++++------
> + libctf/configure       | 1330 +++++++++++++-----
> + libtool.m4             | 1093 ++++++++++-----
> + ltmain.sh              | 2925 +++++++++++++++++++++++++++-------------
> + ltoptions.m4           |    2 +-
> + ltversion.m4           |   12 +-
> + lt~obsolete.m4         |    2 +-
> + opcodes/configure      | 1331 +++++++++++++-----
> + zlib/configure         | 1331 +++++++++++++-----
> + 15 files changed, 12067 insertions(+), 4525 deletions(-)
>
>  diff --git a/bfd/configure b/bfd/configure
> -index daa51244369..79d0c4b4623 100755
> +index b23c9eebfd7..fb25d046cd2 100755
>  --- a/bfd/configure
>  +++ b/bfd/configure
> -@@ -705,6 +705,9 @@ OTOOL
> +@@ -707,6 +707,9 @@ OTOOL
>   LIPO
>   NMEDIT
>   DSYMUTIL
> @@ -39,7 +40,7 @@ index daa51244369..79d0c4b4623 100755
>   OBJDUMP
>   LN_S
>   NM
> -@@ -823,6 +826,7 @@ enable_static
> +@@ -825,6 +828,7 @@ enable_static
>   with_pic
>   enable_fast_install
>   with_gnu_ld
> @@ -47,7 +48,7 @@ index daa51244369..79d0c4b4623 100755
>   enable_libtool_lock
>   enable_plugins
>   enable_largefile
> -@@ -1507,6 +1511,8 @@ Optional Packages:
> +@@ -1509,6 +1513,8 @@ Optional Packages:
>     --with-pic              try to use only PIC/non-PIC objects [default=
=3Duse
>                             both]
>     --with-gnu-ld           assume the C compiler uses GNU ld [default=3D=
no]
> @@ -56,7 +57,7 @@ index daa51244369..79d0c4b4623 100755
>     --with-mmap             try using mmap for BFD input files if availab=
le
>     --with-separate-debug-dir=3DDIR
>                             Look for global separate debug info in DIR
> -@@ -4988,8 +4994,8 @@ esac
> +@@ -5029,8 +5035,8 @@ esac
>
>
>
> @@ -67,7 +68,7 @@ index daa51244369..79d0c4b4623 100755
>
>
>
> -@@ -5029,7 +5035,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -5070,7 +5076,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings"=
 >&5
>   $as_echo_n "checking how to print strings... " >&6; }
>   # Test print first, because it will be a builtin if present.
> @@ -76,7 +77,7 @@ index daa51244369..79d0c4b4623 100755
>      test "X`print -r -- $ECHO 2>/dev/null`" =3D "X$ECHO"; then
>     ECHO=3D'print -r --'
>   elif test "X`printf %s $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> -@@ -5715,8 +5721,8 @@ $as_echo_n "checking whether the shell understands=
 some XSI constructs... " >&6;
> +@@ -5757,8 +5763,8 @@ $as_echo_n "checking whether the shell understands=
 some XSI constructs... " >&6;
>   # Try some XSI features
>   xsi_shell=3Dno
>   ( _lt_dummy=3D"a/b/c"
> @@ -87,7 +88,7 @@ index daa51244369..79d0c4b4623 100755
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=3Dyes
> -@@ -5765,6 +5771,80 @@ esac
> +@@ -5807,6 +5813,80 @@ esac
>
>
>
> @@ -168,7 +169,7 @@ index daa51244369..79d0c4b4623 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to rel=
oad object files" >&5
>   $as_echo_n "checking for $LD option to reload object files... " >&6; }
>   if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -5781,6 +5861,11 @@ case $reload_flag in
> +@@ -5823,6 +5903,11 @@ case $reload_flag in
>   esac
>   reload_cmds=3D'$LD$reload_flag -o $output$reload_objs'
>   case $host_os in
> @@ -180,7 +181,7 @@ index daa51244369..79d0c4b4623 100755
>     darwin*)
>       if test "$GCC" =3D yes; then
>         reload_cmds=3D'$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reloa=
d_objs'
> -@@ -5949,7 +6034,8 @@ mingw* | pw32*)
> +@@ -5991,7 +6076,8 @@ mingw* | pw32*)
>       lt_cv_deplibs_check_method=3D'file_magic ^x86 archive import|^x86 D=
LL'
>       lt_cv_file_magic_cmd=3D'func_win32_libid'
>     else
> @@ -190,7 +191,7 @@ index daa51244369..79d0c4b4623 100755
>       lt_cv_file_magic_cmd=3D'$OBJDUMP -f'
>     fi
>     ;;
> -@@ -6103,6 +6189,21 @@ esac
> +@@ -6145,6 +6231,21 @@ esac
>   fi
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_m=
ethod" >&5
>   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -212,7 +213,7 @@ index daa51244369..79d0c4b4623 100755
>   file_magic_cmd=3D$lt_cv_file_magic_cmd
>   deplibs_check_method=3D$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=3Dunknown
> -@@ -6118,6 +6219,157 @@ test -z "$deplibs_check_method" && deplibs_check=
_method=3Dunknown
> +@@ -6160,6 +6261,157 @@ test -z "$deplibs_check_method" && deplibs_check=
_method=3Dunknown
>
>
>
> @@ -370,7 +371,7 @@ index daa51244369..79d0c4b4623 100755
>   plugin_option=3D
>   plugin_names=3D"liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dl=
l"
>   for plugin in $plugin_names; do
> -@@ -6132,8 +6384,10 @@ for plugin in $plugin_names; do
> +@@ -6174,8 +6426,10 @@ for plugin in $plugin_names; do
>   done
>
>   if test -n "$ac_tool_prefix"; then
> @@ -383,7 +384,7 @@ index daa51244369..79d0c4b4623 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_AR+:} false; then :
> -@@ -6149,7 +6403,7 @@ do
> +@@ -6191,7 +6445,7 @@ do
>     test -z "$as_dir" && as_dir=3D.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -392,7 +393,7 @@ index daa51244369..79d0c4b4623 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_ex=
ec_ext" >&5
>       break 2
>     fi
> -@@ -6169,11 +6423,15 @@ $as_echo "no" >&6; }
> +@@ -6211,11 +6465,15 @@ $as_echo "no" >&6; }
>   fi
>
>
> @@ -411,7 +412,7 @@ index daa51244369..79d0c4b4623 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -6189,7 +6447,7 @@ do
> +@@ -6231,7 +6489,7 @@ do
>     test -z "$as_dir" && as_dir=3D.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -420,7 +421,7 @@ index daa51244369..79d0c4b4623 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_ex=
ec_ext" >&5
>       break 2
>     fi
> -@@ -6208,6 +6466,10 @@ else
> +@@ -6250,6 +6508,10 @@ else
>   $as_echo "no" >&6; }
>   fi
>
> @@ -431,7 +432,7 @@ index daa51244369..79d0c4b4623 100755
>     if test "x$ac_ct_AR" =3D x; then
>       AR=3D"false"
>     else
> -@@ -6219,25 +6481,20 @@ ac_tool_warned=3Dyes ;;
> +@@ -6261,25 +6523,20 @@ ac_tool_warned=3Dyes ;;
>   esac
>       AR=3D$ac_ct_AR
>     fi
> @@ -467,7 +468,7 @@ index daa51244369..79d0c4b4623 100755
>
>
>
> -@@ -6248,6 +6505,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=3Dcru
> +@@ -6290,6 +6547,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=3Dcru
>
>
>
> @@ -531,7 +532,7 @@ index daa51244369..79d0c4b4623 100755
>
>   if test -n "$ac_tool_prefix"; then
>     # Extract the first word of "${ac_tool_prefix}strip", so it can be a =
program name with args.
> -@@ -6588,8 +6902,8 @@ esac
> +@@ -6630,8 +6944,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl=3D"sed -n -e 's/^T .* \(.*\)$/extern i=
nt \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>
>   # Transform an extracted symbol line into symbol name and symbol addres=
s
> @@ -542,7 +543,7 @@ index daa51244369..79d0c4b4623 100755
>
>   # Handle CRLF in mingw tool chain
>   opt_cr=3D
> -@@ -6625,6 +6939,7 @@ for ac_symprfx in "" "_"; do
> +@@ -6667,6 +6981,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe=3D"sed -n -e 's/^.*[    ]\($symcode$sy=
mcode*\)[         ][      ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -550,7 +551,7 @@ index daa51244369..79d0c4b4623 100755
>
>     # Check to see that the pipe works correctly.
>     pipe_works=3Dno
> -@@ -6666,6 +6981,18 @@ _LT_EOF
> +@@ -6708,6 +7023,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>         if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>           cat <<_LT_EOF > conftest.$ac_ext
> @@ -569,7 +570,7 @@ index daa51244369..79d0c4b4623 100755
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -6677,7 +7004,7 @@ _LT_EOF
> +@@ -6719,7 +7046,7 @@ _LT_EOF
>           cat <<_LT_EOF >> conftest.$ac_ext
>
>   /* The mapping between symbol names and symbols.  */
> @@ -578,7 +579,7 @@ index daa51244369..79d0c4b4623 100755
>     const char *name;
>     void       *address;
>   }
> -@@ -6703,8 +7030,8 @@ static const void *lt_preloaded_setup() {
> +@@ -6745,8 +7072,8 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>           # Now try linking the two files.
>           mv conftest.$ac_objext conftstm.$ac_objext
> @@ -589,7 +590,7 @@ index daa51244369..79d0c4b4623 100755
>           LIBS=3D"conftstm.$ac_objext"
>           CFLAGS=3D"$CFLAGS$lt_prog_compiler_no_builtin_flag"
>           if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\=
""; } >&5
> -@@ -6714,8 +7041,8 @@ _LT_EOF
> +@@ -6756,8 +7083,8 @@ _LT_EOF
>     test $ac_status =3D 0; } && test -s conftest${ac_exeext}; then
>             pipe_works=3Dyes
>           fi
> @@ -600,7 +601,7 @@ index daa51244369..79d0c4b4623 100755
>         else
>           echo "cannot find nm_test_func in $nlist" >&5
>         fi
> -@@ -6752,6 +7079,14 @@ else
> +@@ -6794,6 +7121,14 @@ else
>   $as_echo "ok" >&6; }
>   fi
>
> @@ -615,7 +616,7 @@ index daa51244369..79d0c4b4623 100755
>
>
>
> -@@ -6770,6 +7105,47 @@ fi
> +@@ -6812,6 +7147,47 @@ fi
>
>
>
> @@ -663,7 +664,7 @@ index daa51244369..79d0c4b4623 100755
>
>
>
> -@@ -6979,6 +7355,123 @@ esac
> +@@ -7021,6 +7397,123 @@ esac
>
>   need_locks=3D"$enable_libtool_lock"
>
> @@ -787,7 +788,7 @@ index daa51244369..79d0c4b4623 100755
>
>     case $host_os in
>       rhapsody* | darwin*)
> -@@ -7542,6 +8035,8 @@ _LT_EOF
> +@@ -7584,6 +8077,8 @@ _LT_EOF
>         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>         echo "$AR cru libconftest.a conftest.o" >&5
>         $AR cru libconftest.a conftest.o 2>&5
> @@ -796,7 +797,7 @@ index daa51244369..79d0c4b4623 100755
>         cat > conftest.c << _LT_EOF
>   int main() { return 0;}
>   _LT_EOF
> -@@ -8093,8 +8589,6 @@ fi
> +@@ -8135,8 +8630,6 @@ fi
>   lt_prog_compiler_pic=3D
>   lt_prog_compiler_static=3D
>
> @@ -805,7 +806,7 @@ index daa51244369..79d0c4b4623 100755
>
>     if test "$GCC" =3D yes; then
>       lt_prog_compiler_wl=3D'-Wl,'
> -@@ -8260,6 +8754,12 @@ $as_echo_n "checking for $compiler option to prod=
uce PIC... " >&6; }
> +@@ -8302,6 +8795,12 @@ $as_echo_n "checking for $compiler option to prod=
uce PIC... " >&6; }
>         lt_prog_compiler_pic=3D'--shared'
>         lt_prog_compiler_static=3D'--static'
>         ;;
> @@ -818,7 +819,7 @@ index daa51244369..79d0c4b4623 100755
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>         # which looks to be a dead project)
> -@@ -8322,7 +8822,7 @@ $as_echo_n "checking for $compiler option to produ=
ce PIC... " >&6; }
> +@@ -8364,7 +8863,7 @@ $as_echo_n "checking for $compiler option to produ=
ce PIC... " >&6; }
>         lt_prog_compiler_pic=3D'-KPIC'
>         lt_prog_compiler_static=3D'-Bstatic'
>         case $cc_basename in
> @@ -827,7 +828,7 @@ index daa51244369..79d0c4b4623 100755
>         lt_prog_compiler_wl=3D'-Qoption ld ';;
>         *)
>         lt_prog_compiler_wl=3D'-Wl,';;
> -@@ -8379,13 +8879,17 @@ case $host_os in
> +@@ -8421,13 +8920,17 @@ case $host_os in
>       lt_prog_compiler_pic=3D"$lt_prog_compiler_pic -DPIC"
>       ;;
>   esac
> @@ -851,7 +852,7 @@ index daa51244369..79d0c4b4623 100755
>
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -8446,6 +8950,11 @@ fi
> +@@ -8488,6 +8991,11 @@ fi
>
>
>
> @@ -863,7 +864,7 @@ index daa51244369..79d0c4b4623 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -8796,7 +9305,8 @@ _LT_EOF
> +@@ -8838,7 +9346,8 @@ _LT_EOF
>         allow_undefined_flag=3Dunsupported
>         always_export_symbols=3Dno
>         enable_shared_with_static_runtimes=3Dyes
> @@ -873,7 +874,7 @@ index daa51244369..79d0c4b4623 100755
>
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags -=
o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-impli=
b -Xlinker $lib'
> -@@ -8895,12 +9405,12 @@ _LT_EOF
> +@@ -8937,12 +9446,12 @@ _LT_EOF
>           whole_archive_flag_spec=3D'--whole-archive$convenience --no-who=
le-archive'
>           hardcode_libdir_flag_spec=3D
>           hardcode_libdir_flag_spec_ld=3D'-rpath $libdir'
> @@ -888,7 +889,7 @@ index daa51244369..79d0c4b4623 100755
>           fi
>           ;;
>         esac
> -@@ -8914,8 +9424,8 @@ _LT_EOF
> +@@ -8956,8 +9465,8 @@ _LT_EOF
>         archive_cmds=3D'$LD -Bshareable $libobjs $deplibs $linker_flags -=
o $lib'
>         wlarc=3D
>         else
> @@ -899,7 +900,7 @@ index daa51244369..79d0c4b4623 100755
>         fi
>         ;;
>
> -@@ -8933,8 +9443,8 @@ _LT_EOF
> +@@ -8975,8 +9484,8 @@ _LT_EOF
>
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/=
null; then
> @@ -910,7 +911,7 @@ index daa51244369..79d0c4b4623 100755
>         else
>         ld_shlibs=3Dno
>         fi
> -@@ -8980,8 +9490,8 @@ _LT_EOF
> +@@ -9022,8 +9531,8 @@ _LT_EOF
>
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/nu=
ll; then
> @@ -921,7 +922,7 @@ index daa51244369..79d0c4b4623 100755
>         else
>         ld_shlibs=3Dno
>         fi
> -@@ -9111,7 +9621,13 @@ _LT_EOF
> +@@ -9153,7 +9662,13 @@ _LT_EOF
>         allow_undefined_flag=3D'-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -936,7 +937,7 @@ index daa51244369..79d0c4b4623 100755
>   /* end confdefs.h.  */
>
>   int
> -@@ -9124,22 +9640,29 @@ main ()
> +@@ -9166,22 +9681,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>
> @@ -979,7 +980,7 @@ index daa51244369..79d0c4b4623 100755
>
>           hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libp=
ath"
>           archive_expsym_cmds=3D'$CC -o $output_objdir/$soname $libobjs $=
deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefin=
ed_flag}" !=3D "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else=
 :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -9151,7 +9674,13 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/u=
sr/lib:/lib"; fi
> +@@ -9193,7 +9715,13 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/u=
sr/lib:/lib"; fi
>         else
>          # Determine the default libpath from the value encoded in an
>          # empty executable.
> @@ -994,7 +995,7 @@ index daa51244369..79d0c4b4623 100755
>   /* end confdefs.h.  */
>
>   int
> -@@ -9164,22 +9693,29 @@ main ()
> +@@ -9206,22 +9734,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>
> @@ -1037,7 +1038,7 @@ index daa51244369..79d0c4b4623 100755
>
>          hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libpa=
th"
>           # Warning - without using the other run time loading flags,
> -@@ -9224,20 +9760,63 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
> +@@ -9266,20 +9801,63 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
>         # no search path for DLLs.
> @@ -1115,7 +1116,7 @@ index daa51244369..79d0c4b4623 100755
>         ;;
>
>       darwin* | rhapsody*)
> -@@ -9298,7 +9877,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
> +@@ -9340,7 +9918,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
>
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -1124,7 +1125,7 @@ index daa51244369..79d0c4b4623 100755
>         hardcode_libdir_flag_spec=3D'-R$libdir'
>         hardcode_direct=3Dyes
>         hardcode_shlibpath_var=3Dno
> -@@ -9306,7 +9885,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
> +@@ -9348,7 +9926,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
>
>       hpux9*)
>         if test "$GCC" =3D yes; then
> @@ -1133,7 +1134,7 @@ index daa51244369..79d0c4b4623 100755
>         else
>         archive_cmds=3D'$RM $output_objdir/$soname~$LD -b +b $install_lib=
dir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_=
objdir/$soname =3D $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -9322,7 +9901,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
> +@@ -9364,7 +9942,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
>
>       hpux10*)
>         if test "$GCC" =3D yes && test "$with_gnu_ld" =3D no; then
> @@ -1142,7 +1143,7 @@ index daa51244369..79d0c4b4623 100755
>         else
>         archive_cmds=3D'$LD -b +h $soname +b $install_libdir -o $lib $lib=
objs $deplibs $linker_flags'
>         fi
> -@@ -9346,10 +9925,10 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
> +@@ -9388,10 +9966,10 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
>           archive_cmds=3D'$CC -shared ${wl}+h ${wl}$soname -o $lib $libob=
js $deplibs $compiler_flags'
>           ;;
>         ia64*)
> @@ -1155,7 +1156,7 @@ index daa51244369..79d0c4b4623 100755
>           ;;
>         esac
>         else
> -@@ -9428,23 +10007,36 @@ fi
> +@@ -9470,23 +10048,36 @@ fi
>
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" =3D yes; then
> @@ -1200,7 +1201,7 @@ index daa51244369..79d0c4b4623 100755
>         else
>         archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags -so=
name $soname `test -n "$verstring" && func_echo_all "-set_version $verstrin=
g"` -update_registry ${output_objdir}/so_locations -o $lib'
>         archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_fl=
ags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $v=
erstring"` -update_registry ${output_objdir}/so_locations -exports_file $ex=
port_symbols -o $lib'
> -@@ -9529,7 +10121,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9571,7 +10162,7 @@ rm -f core conftest.err conftest.$ac_objext \
>       osf4* | osf5*)    # as osf3* with the addition of -msym flag
>         if test "$GCC" =3D yes; then
>         allow_undefined_flag=3D' ${wl}-expect_unresolved ${wl}\*'
> @@ -1209,7 +1210,7 @@ index daa51244369..79d0c4b4623 100755
>         hardcode_libdir_flag_spec=3D'${wl}-rpath ${wl}$libdir'
>         else
>         allow_undefined_flag=3D' -expect_unresolved \*'
> -@@ -9548,9 +10140,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9590,9 +10181,9 @@ rm -f core conftest.err conftest.$ac_objext \
>         no_undefined_flag=3D' -z defs'
>         if test "$GCC" =3D yes; then
>         wlarc=3D'${wl}'
> @@ -1221,7 +1222,7 @@ index daa51244369..79d0c4b4623 100755
>         else
>         case `$CC -V 2>&1` in
>         *"Compilers 5.0"*)
> -@@ -10126,8 +10718,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10168,8 +10759,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=3Dno
>     need_lib_prefix=3Dno
>
> @@ -1233,7 +1234,7 @@ index daa51244369..79d0c4b4623 100755
>       library_names_spec=3D'$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds=3D'base_file=3D`basename \${file}`~
> -@@ -10160,13 +10753,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10202,13 +10794,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec=3D'`echo ${libname} | sed -e 's/^lib/pw/'``ech=
o ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -1306,25 +1307,16 @@ index daa51244369..79d0c4b4623 100755
>     # FIXME: first we should search . and the directory the executable is=
 in
>     shlibpath_var=3DPATH
>     ;;
> -@@ -10248,7 +10899,7 @@ haiku*)
> -   soname_spec=3D'${libname}${release}${shared_ext}$major'
> -   shlibpath_var=3DLIBRARY_PATH
> -   shlibpath_overrides_runpath=3Dyes
> --  sys_lib_dlsearch_path_spec=3D'/boot/home/config/lib /boot/common/lib =
/boot/beos/system/lib'
> -+  sys_lib_dlsearch_path_spec=3D'/boot/home/config/lib /boot/common/lib =
/boot/system/lib'
> -   hardcode_into_libs=3Dyes
> -   ;;
> -
> -@@ -11044,7 +11695,7 @@ else
> +@@ -11086,7 +11736,7 @@ else
>     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
>     lt_status=3D$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11047 "configure"
> +-#line 11089 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>
>   #if HAVE_DLFCN_H
> -@@ -11088,10 +11739,10 @@ else
> +@@ -11130,10 +11780,10 @@ else
>   /* When -fvisbility=3Dhidden is used, assume the code has been annotate=
d
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=3D =
3)) || (__GNUC__ > 3))
> @@ -1337,16 +1329,16 @@ index daa51244369..79d0c4b4623 100755
>   int main ()
>   {
>     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -11150,7 +11801,7 @@ else
> +@@ -11192,7 +11842,7 @@ else
>     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
>     lt_status=3D$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11153 "configure"
> +-#line 11195 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>
>   #if HAVE_DLFCN_H
> -@@ -11194,10 +11845,10 @@ else
> +@@ -11236,10 +11886,10 @@ else
>   /* When -fvisbility=3Dhidden is used, assume the code has been annotate=
d
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=3D =
3)) || (__GNUC__ > 3))
> @@ -1359,7 +1351,7 @@ index daa51244369..79d0c4b4623 100755
>   int main ()
>   {
>     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -13114,7 +13765,7 @@ SHARED_LDFLAGS=3D
> +@@ -13224,7 +13874,7 @@ SHARED_LDFLAGS=3D
>   if test "$enable_shared" =3D "yes"; then
>     x=3D`sed -n -e 's/^[  ]*PICFLAG[      ]*=3D[    ]*//p' < ../libiberty=
/Makefile | sed -n '$p'`
>     if test -n "$x"; then
> @@ -1368,7 +1360,7 @@ index daa51244369..79d0c4b4623 100755
>     fi
>   fi
>
> -@@ -15762,13 +16413,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_sing=
le_quote_subst"`'
> +@@ -15879,13 +16529,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_sing=
le_quote_subst"`'
>   lt_unset=3D'`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL=3D'`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP=3D'`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -1389,7 +1381,7 @@ index daa51244369..79d0c4b4623 100755
>   STRIP=3D'`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB=3D'`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds=3D'`$ECHO "$old_postinstall_cmds" | $SED "$delay_s=
ingle_quote_subst"`'
> -@@ -15783,14 +16441,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_cv=
_sys_global_symbol_pipe" | $SED "$de
> +@@ -15900,14 +16557,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_cv=
_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl=3D'`$ECHO "$lt_cv_sys_global_symbol_to=
_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address=3D'`$ECHO "$lt_cv_sys_global_=
symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'`$ECHO "$lt_cv_=
sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote=
_subst"`'
> @@ -1408,7 +1400,7 @@ index daa51244369..79d0c4b4623 100755
>   DSYMUTIL=3D'`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT=3D'`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO=3D'`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -15823,12 +16484,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_sh=
libpath_var" | $SED "$delay_single_q
> +@@ -15940,12 +16600,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_sh=
libpath_var" | $SED "$delay_single_q
>   hardcode_automatic=3D'`$ECHO "$hardcode_automatic" | $SED "$delay_singl=
e_quote_subst"`'
>   inherit_rpath=3D'`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_su=
bst"`'
>   link_all_deplibs=3D'`$ECHO "$link_all_deplibs" | $SED "$delay_single_qu=
ote_subst"`'
> @@ -1422,7 +1414,7 @@ index daa51244369..79d0c4b4623 100755
>   file_list_spec=3D'`$ECHO "$file_list_spec" | $SED "$delay_single_quote_=
subst"`'
>   variables_saved_for_relink=3D'`$ECHO "$variables_saved_for_relink" | $S=
ED "$delay_single_quote_subst"`'
>   need_lib_prefix=3D'`$ECHO "$need_lib_prefix" | $SED "$delay_single_quot=
e_subst"`'
> -@@ -15883,8 +16544,13 @@ reload_flag \
> +@@ -16000,8 +16660,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -1436,7 +1428,7 @@ index daa51244369..79d0c4b4623 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -15894,12 +16560,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -16011,12 +16676,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -1452,7 +1444,7 @@ index daa51244369..79d0c4b4623 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -15915,7 +16583,6 @@ no_undefined_flag \
> +@@ -16032,7 +16699,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -1460,7 +1452,7 @@ index daa51244369..79d0c4b4623 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -15951,6 +16618,7 @@ module_cmds \
> +@@ -16068,6 +16734,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -1468,7 +1460,7 @@ index daa51244369..79d0c4b4623 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -16720,7 +17388,8 @@ $as_echo X"$file" |
> +@@ -16837,7 +17504,8 @@ $as_echo X"$file" |
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -1478,7 +1470,7 @@ index daa51244369..79d0c4b4623 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -16823,19 +17492,42 @@ SP2NL=3D$lt_lt_SP2NL
> +@@ -16940,19 +17608,42 @@ SP2NL=3D$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=3D$lt_lt_NL2SP
>
> @@ -1522,7 +1514,7 @@ index daa51244369..79d0c4b4623 100755
>   # A symbol stripping program.
>   STRIP=3D$lt_STRIP
>
> -@@ -16865,6 +17557,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_sys=
_global_symbol_to_c_name_address
> +@@ -16982,6 +17673,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_sys=
_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix i=
s needed.
>   global_symbol_to_c_name_address_lib_prefix=3D$lt_lt_cv_sys_global_symbo=
l_to_c_name_address_lib_prefix
>
> @@ -1535,7 +1527,7 @@ index daa51244369..79d0c4b4623 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=3D$objdir
>
> -@@ -16874,6 +17572,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> +@@ -16991,6 +17688,9 @@ MAGIC_CMD=3D$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=3D$lt_need_locks
>
> @@ -1545,7 +1537,7 @@ index daa51244369..79d0c4b4623 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=3D$lt_DSYMUTIL
>
> -@@ -16988,12 +17689,12 @@ with_gcc=3D$GCC
> +@@ -17105,12 +17805,12 @@ with_gcc=3D$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag
>
> @@ -1561,7 +1553,7 @@ index daa51244369..79d0c4b4623 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=3D$lt_lt_prog_compiler_static
>
> -@@ -17080,9 +17781,6 @@ inherit_rpath=3D$inherit_rpath
> +@@ -17197,9 +17897,6 @@ inherit_rpath=3D$inherit_rpath
>   # Whether libtool must link a program against all its dependency librar=
ies.
>   link_all_deplibs=3D$link_all_deplibs
>
> @@ -1571,7 +1563,7 @@ index daa51244369..79d0c4b4623 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=3D$always_export_symbols
>
> -@@ -17098,6 +17796,9 @@ include_expsyms=3D$lt_include_expsyms
> +@@ -17215,6 +17912,9 @@ include_expsyms=3D$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with temp=
lates.
>   prelink_cmds=3D$lt_prelink_cmds
>
> @@ -1581,7 +1573,7 @@ index daa51244369..79d0c4b4623 100755
>   # Specify filename containing input files.
>   file_list_spec=3D$lt_file_list_spec
>
> -@@ -17130,210 +17831,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> +@@ -17247,210 +17947,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> @@ -1956,10 +1948,10 @@ index daa51244369..79d0c4b4623 100755
>     chmod +x "$ofile"
>
>  diff --git a/bfd/configure.ac b/bfd/configure.ac
> -index 07a75ed1626..288374c504c 100644
> +index a9078965c40..22b5b7ea567 100644
>  --- a/bfd/configure.ac
>  +++ b/bfd/configure.ac
> -@@ -304,7 +304,7 @@ changequote(,)dnl
> +@@ -303,7 +303,7 @@ changequote(,)dnl
>     x=3D`sed -n -e 's/^[  ]*PICFLAG[      ]*=3D[    ]*//p' < ../libiberty=
/Makefile | sed -n '$p'`
>   changequote([,])dnl
>     if test -n "$x"; then
> @@ -1969,7 +1961,7 @@ index 07a75ed1626..288374c504c 100644
>   fi
>
>  diff --git a/binutils/configure b/binutils/configure
> -index bf6461dab1e..8e6f6d30b4d 100755
> +index 8cde216cb1f..15f3f4eb874 100755
>  --- a/binutils/configure
>  +++ b/binutils/configure
>  @@ -696,8 +696,11 @@ OTOOL
> @@ -2001,7 +1993,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>     --with-debuginfod       Enable debuginfo lookups with debuginfod
>                             (auto/yes/no)
>     --with-system-zlib      use installed libz
> -@@ -4844,8 +4850,8 @@ esac
> +@@ -4883,8 +4889,8 @@ esac
>
>
>
> @@ -2012,7 +2004,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>
>
>
> -@@ -4885,7 +4891,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -4924,7 +4930,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings"=
 >&5
>   $as_echo_n "checking how to print strings... " >&6; }
>   # Test print first, because it will be a builtin if present.
> @@ -2021,7 +2013,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>      test "X`print -r -- $ECHO 2>/dev/null`" =3D "X$ECHO"; then
>     ECHO=3D'print -r --'
>   elif test "X`printf %s $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> -@@ -5571,8 +5577,8 @@ $as_echo_n "checking whether the shell understands=
 some XSI constructs... " >&6;
> +@@ -5611,8 +5617,8 @@ $as_echo_n "checking whether the shell understands=
 some XSI constructs... " >&6;
>   # Try some XSI features
>   xsi_shell=3Dno
>   ( _lt_dummy=3D"a/b/c"
> @@ -2032,7 +2024,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=3Dyes
> -@@ -5621,6 +5627,80 @@ esac
> +@@ -5661,6 +5667,80 @@ esac
>
>
>
> @@ -2113,7 +2105,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to rel=
oad object files" >&5
>   $as_echo_n "checking for $LD option to reload object files... " >&6; }
>   if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -5637,6 +5717,11 @@ case $reload_flag in
> +@@ -5677,6 +5757,11 @@ case $reload_flag in
>   esac
>   reload_cmds=3D'$LD$reload_flag -o $output$reload_objs'
>   case $host_os in
> @@ -2125,7 +2117,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>     darwin*)
>       if test "$GCC" =3D yes; then
>         reload_cmds=3D'$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reloa=
d_objs'
> -@@ -5805,7 +5890,8 @@ mingw* | pw32*)
> +@@ -5845,7 +5930,8 @@ mingw* | pw32*)
>       lt_cv_deplibs_check_method=3D'file_magic ^x86 archive import|^x86 D=
LL'
>       lt_cv_file_magic_cmd=3D'func_win32_libid'
>     else
> @@ -2135,7 +2127,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>       lt_cv_file_magic_cmd=3D'$OBJDUMP -f'
>     fi
>     ;;
> -@@ -5959,6 +6045,21 @@ esac
> +@@ -5999,6 +6085,21 @@ esac
>   fi
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_m=
ethod" >&5
>   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -2157,7 +2149,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>   file_magic_cmd=3D$lt_cv_file_magic_cmd
>   deplibs_check_method=3D$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=3Dunknown
> -@@ -5974,6 +6075,157 @@ test -z "$deplibs_check_method" && deplibs_check=
_method=3Dunknown
> +@@ -6014,6 +6115,157 @@ test -z "$deplibs_check_method" && deplibs_check=
_method=3Dunknown
>
>
>
> @@ -2315,7 +2307,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>   plugin_option=3D
>   plugin_names=3D"liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dl=
l"
>   for plugin in $plugin_names; do
> -@@ -5988,8 +6240,10 @@ for plugin in $plugin_names; do
> +@@ -6028,8 +6280,10 @@ for plugin in $plugin_names; do
>   done
>
>   if test -n "$ac_tool_prefix"; then
> @@ -2328,7 +2320,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_AR+:} false; then :
> -@@ -6005,7 +6259,7 @@ do
> +@@ -6045,7 +6299,7 @@ do
>     test -z "$as_dir" && as_dir=3D.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -2337,7 +2329,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_ex=
ec_ext" >&5
>       break 2
>     fi
> -@@ -6025,11 +6279,15 @@ $as_echo "no" >&6; }
> +@@ -6065,11 +6319,15 @@ $as_echo "no" >&6; }
>   fi
>
>
> @@ -2356,7 +2348,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -6045,7 +6303,7 @@ do
> +@@ -6085,7 +6343,7 @@ do
>     test -z "$as_dir" && as_dir=3D.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -2365,7 +2357,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_ex=
ec_ext" >&5
>       break 2
>     fi
> -@@ -6064,6 +6322,10 @@ else
> +@@ -6104,6 +6362,10 @@ else
>   $as_echo "no" >&6; }
>   fi
>
> @@ -2376,7 +2368,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>     if test "x$ac_ct_AR" =3D x; then
>       AR=3D"false"
>     else
> -@@ -6075,29 +6337,81 @@ ac_tool_warned=3Dyes ;;
> +@@ -6115,29 +6377,81 @@ ac_tool_warned=3Dyes ;;
>   esac
>       AR=3D$ac_ct_AR
>     fi
> @@ -2473,7 +2465,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>
>
>
> -@@ -6444,8 +6758,8 @@ esac
> +@@ -6484,8 +6798,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl=3D"sed -n -e 's/^T .* \(.*\)$/extern i=
nt \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>
>   # Transform an extracted symbol line into symbol name and symbol addres=
s
> @@ -2484,7 +2476,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>
>   # Handle CRLF in mingw tool chain
>   opt_cr=3D
> -@@ -6481,6 +6795,7 @@ for ac_symprfx in "" "_"; do
> +@@ -6521,6 +6835,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe=3D"sed -n -e 's/^.*[    ]\($symcode$sy=
mcode*\)[         ][      ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -2492,7 +2484,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>
>     # Check to see that the pipe works correctly.
>     pipe_works=3Dno
> -@@ -6522,6 +6837,18 @@ _LT_EOF
> +@@ -6562,6 +6877,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>         if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>           cat <<_LT_EOF > conftest.$ac_ext
> @@ -2511,7 +2503,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -6533,7 +6860,7 @@ _LT_EOF
> +@@ -6573,7 +6900,7 @@ _LT_EOF
>           cat <<_LT_EOF >> conftest.$ac_ext
>
>   /* The mapping between symbol names and symbols.  */
> @@ -2520,7 +2512,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>     const char *name;
>     void       *address;
>   }
> -@@ -6559,8 +6886,8 @@ static const void *lt_preloaded_setup() {
> +@@ -6599,8 +6926,8 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>           # Now try linking the two files.
>           mv conftest.$ac_objext conftstm.$ac_objext
> @@ -2531,7 +2523,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>           LIBS=3D"conftstm.$ac_objext"
>           CFLAGS=3D"$CFLAGS$lt_prog_compiler_no_builtin_flag"
>           if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\=
""; } >&5
> -@@ -6570,8 +6897,8 @@ _LT_EOF
> +@@ -6610,8 +6937,8 @@ _LT_EOF
>     test $ac_status =3D 0; } && test -s conftest${ac_exeext}; then
>             pipe_works=3Dyes
>           fi
> @@ -2542,7 +2534,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>         else
>           echo "cannot find nm_test_func in $nlist" >&5
>         fi
> -@@ -6608,6 +6935,19 @@ else
> +@@ -6648,6 +6975,19 @@ else
>   $as_echo "ok" >&6; }
>   fi
>
> @@ -2562,7 +2554,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>
>
>
> -@@ -6624,6 +6964,42 @@ fi
> +@@ -6664,6 +7004,42 @@ fi
>
>
>
> @@ -2605,7 +2597,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>
>
>
> -@@ -6835,6 +7211,123 @@ esac
> +@@ -6875,6 +7251,123 @@ esac
>
>   need_locks=3D"$enable_libtool_lock"
>
> @@ -2729,7 +2721,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>
>     case $host_os in
>       rhapsody* | darwin*)
> -@@ -7398,6 +7891,8 @@ _LT_EOF
> +@@ -7438,6 +7931,8 @@ _LT_EOF
>         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>         echo "$AR cru libconftest.a conftest.o" >&5
>         $AR cru libconftest.a conftest.o 2>&5
> @@ -2738,7 +2730,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>         cat > conftest.c << _LT_EOF
>   int main() { return 0;}
>   _LT_EOF
> -@@ -7980,8 +8476,6 @@ fi
> +@@ -8020,8 +8515,6 @@ fi
>   lt_prog_compiler_pic=3D
>   lt_prog_compiler_static=3D
>
> @@ -2747,7 +2739,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>
>     if test "$GCC" =3D yes; then
>       lt_prog_compiler_wl=3D'-Wl,'
> -@@ -8147,6 +8641,12 @@ $as_echo_n "checking for $compiler option to prod=
uce PIC... " >&6; }
> +@@ -8187,6 +8680,12 @@ $as_echo_n "checking for $compiler option to prod=
uce PIC... " >&6; }
>         lt_prog_compiler_pic=3D'--shared'
>         lt_prog_compiler_static=3D'--static'
>         ;;
> @@ -2760,7 +2752,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>         # which looks to be a dead project)
> -@@ -8209,7 +8709,7 @@ $as_echo_n "checking for $compiler option to produ=
ce PIC... " >&6; }
> +@@ -8249,7 +8748,7 @@ $as_echo_n "checking for $compiler option to produ=
ce PIC... " >&6; }
>         lt_prog_compiler_pic=3D'-KPIC'
>         lt_prog_compiler_static=3D'-Bstatic'
>         case $cc_basename in
> @@ -2769,7 +2761,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>         lt_prog_compiler_wl=3D'-Qoption ld ';;
>         *)
>         lt_prog_compiler_wl=3D'-Wl,';;
> -@@ -8266,13 +8766,17 @@ case $host_os in
> +@@ -8306,13 +8805,17 @@ case $host_os in
>       lt_prog_compiler_pic=3D"$lt_prog_compiler_pic -DPIC"
>       ;;
>   esac
> @@ -2793,7 +2785,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -8333,6 +8837,11 @@ fi
> +@@ -8373,6 +8876,11 @@ fi
>
>
>
> @@ -2805,7 +2797,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -8683,7 +9192,8 @@ _LT_EOF
> +@@ -8723,7 +9231,8 @@ _LT_EOF
>         allow_undefined_flag=3Dunsupported
>         always_export_symbols=3Dno
>         enable_shared_with_static_runtimes=3Dyes
> @@ -2815,7 +2807,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags -=
o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-impli=
b -Xlinker $lib'
> -@@ -8782,12 +9292,12 @@ _LT_EOF
> +@@ -8822,12 +9331,12 @@ _LT_EOF
>           whole_archive_flag_spec=3D'--whole-archive$convenience --no-who=
le-archive'
>           hardcode_libdir_flag_spec=3D
>           hardcode_libdir_flag_spec_ld=3D'-rpath $libdir'
> @@ -2830,7 +2822,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>           fi
>           ;;
>         esac
> -@@ -8801,8 +9311,8 @@ _LT_EOF
> +@@ -8841,8 +9350,8 @@ _LT_EOF
>         archive_cmds=3D'$LD -Bshareable $libobjs $deplibs $linker_flags -=
o $lib'
>         wlarc=3D
>         else
> @@ -2841,7 +2833,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>         fi
>         ;;
>
> -@@ -8820,8 +9330,8 @@ _LT_EOF
> +@@ -8860,8 +9369,8 @@ _LT_EOF
>
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/=
null; then
> @@ -2852,7 +2844,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>         else
>         ld_shlibs=3Dno
>         fi
> -@@ -8867,8 +9377,8 @@ _LT_EOF
> +@@ -8907,8 +9416,8 @@ _LT_EOF
>
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/nu=
ll; then
> @@ -2863,7 +2855,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>         else
>         ld_shlibs=3Dno
>         fi
> -@@ -8998,7 +9508,13 @@ _LT_EOF
> +@@ -9038,7 +9547,13 @@ _LT_EOF
>         allow_undefined_flag=3D'-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -2878,7 +2870,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>   /* end confdefs.h.  */
>
>   int
> -@@ -9011,22 +9527,29 @@ main ()
> +@@ -9051,22 +9566,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>
> @@ -2921,7 +2913,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>
>           hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libp=
ath"
>           archive_expsym_cmds=3D'$CC -o $output_objdir/$soname $libobjs $=
deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefin=
ed_flag}" !=3D "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else=
 :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -9038,7 +9561,13 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/u=
sr/lib:/lib"; fi
> +@@ -9078,7 +9600,13 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/u=
sr/lib:/lib"; fi
>         else
>          # Determine the default libpath from the value encoded in an
>          # empty executable.
> @@ -2936,7 +2928,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>   /* end confdefs.h.  */
>
>   int
> -@@ -9051,22 +9580,29 @@ main ()
> +@@ -9091,22 +9619,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>
> @@ -2979,7 +2971,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>
>          hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libpa=
th"
>           # Warning - without using the other run time loading flags,
> -@@ -9111,20 +9647,63 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
> +@@ -9151,20 +9686,63 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
>         # no search path for DLLs.
> @@ -3057,7 +3049,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>         ;;
>
>       darwin* | rhapsody*)
> -@@ -9185,7 +9764,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
> +@@ -9225,7 +9803,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
>
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -3066,7 +3058,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>         hardcode_libdir_flag_spec=3D'-R$libdir'
>         hardcode_direct=3Dyes
>         hardcode_shlibpath_var=3Dno
> -@@ -9193,7 +9772,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
> +@@ -9233,7 +9811,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
>
>       hpux9*)
>         if test "$GCC" =3D yes; then
> @@ -3075,7 +3067,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>         else
>         archive_cmds=3D'$RM $output_objdir/$soname~$LD -b +b $install_lib=
dir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_=
objdir/$soname =3D $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -9209,7 +9788,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
> +@@ -9249,7 +9827,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
>
>       hpux10*)
>         if test "$GCC" =3D yes && test "$with_gnu_ld" =3D no; then
> @@ -3084,7 +3076,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>         else
>         archive_cmds=3D'$LD -b +h $soname +b $install_libdir -o $lib $lib=
objs $deplibs $linker_flags'
>         fi
> -@@ -9233,10 +9812,10 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
> +@@ -9273,10 +9851,10 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
>           archive_cmds=3D'$CC -shared ${wl}+h ${wl}$soname -o $lib $libob=
js $deplibs $compiler_flags'
>           ;;
>         ia64*)
> @@ -3097,7 +3089,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>           ;;
>         esac
>         else
> -@@ -9315,23 +9894,36 @@ fi
> +@@ -9355,23 +9933,36 @@ fi
>
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" =3D yes; then
> @@ -3142,7 +3134,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>         else
>         archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags -so=
name $soname `test -n "$verstring" && func_echo_all "-set_version $verstrin=
g"` -update_registry ${output_objdir}/so_locations -o $lib'
>         archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_fl=
ags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $v=
erstring"` -update_registry ${output_objdir}/so_locations -exports_file $ex=
port_symbols -o $lib'
> -@@ -9416,7 +10008,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9456,7 +10047,7 @@ rm -f core conftest.err conftest.$ac_objext \
>       osf4* | osf5*)    # as osf3* with the addition of -msym flag
>         if test "$GCC" =3D yes; then
>         allow_undefined_flag=3D' ${wl}-expect_unresolved ${wl}\*'
> @@ -3151,7 +3143,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>         hardcode_libdir_flag_spec=3D'${wl}-rpath ${wl}$libdir'
>         else
>         allow_undefined_flag=3D' -expect_unresolved \*'
> -@@ -9435,9 +10027,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9475,9 +10066,9 @@ rm -f core conftest.err conftest.$ac_objext \
>         no_undefined_flag=3D' -z defs'
>         if test "$GCC" =3D yes; then
>         wlarc=3D'${wl}'
> @@ -3163,7 +3155,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>         else
>         case `$CC -V 2>&1` in
>         *"Compilers 5.0"*)
> -@@ -10013,8 +10605,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10053,8 +10644,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=3Dno
>     need_lib_prefix=3Dno
>
> @@ -3175,7 +3167,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>       library_names_spec=3D'$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds=3D'base_file=3D`basename \${file}`~
> -@@ -10047,13 +10640,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10087,13 +10679,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec=3D'`echo ${libname} | sed -e 's/^lib/pw/'``ech=
o ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -3248,25 +3240,16 @@ index bf6461dab1e..8e6f6d30b4d 100755
>     # FIXME: first we should search . and the directory the executable is=
 in
>     shlibpath_var=3DPATH
>     ;;
> -@@ -10135,7 +10786,7 @@ haiku*)
> -   soname_spec=3D'${libname}${release}${shared_ext}$major'
> -   shlibpath_var=3DLIBRARY_PATH
> -   shlibpath_overrides_runpath=3Dyes
> --  sys_lib_dlsearch_path_spec=3D'/boot/home/config/lib /boot/common/lib =
/boot/beos/system/lib'
> -+  sys_lib_dlsearch_path_spec=3D'/boot/home/config/lib /boot/common/lib =
/boot/system/lib'
> -   hardcode_into_libs=3Dyes
> -   ;;
> -
> -@@ -10931,7 +11582,7 @@ else
> +@@ -10971,7 +11621,7 @@ else
>     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
>     lt_status=3D$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 10934 "configure"
> +-#line 10974 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>
>   #if HAVE_DLFCN_H
> -@@ -10975,10 +11626,10 @@ else
> +@@ -11015,10 +11665,10 @@ else
>   /* When -fvisbility=3Dhidden is used, assume the code has been annotate=
d
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=3D =
3)) || (__GNUC__ > 3))
> @@ -3279,16 +3262,16 @@ index bf6461dab1e..8e6f6d30b4d 100755
>   int main ()
>   {
>     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -11037,7 +11688,7 @@ else
> +@@ -11077,7 +11727,7 @@ else
>     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
>     lt_status=3D$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11040 "configure"
> +-#line 11080 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>
>   #if HAVE_DLFCN_H
> -@@ -11081,10 +11732,10 @@ else
> +@@ -11121,10 +11771,10 @@ else
>   /* When -fvisbility=3Dhidden is used, assume the code has been annotate=
d
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=3D =
3)) || (__GNUC__ > 3))
> @@ -3301,7 +3284,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>   int main ()
>   {
>     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -15455,13 +16106,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_sing=
le_quote_subst"`'
> +@@ -15505,13 +16155,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_sing=
le_quote_subst"`'
>   lt_unset=3D'`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL=3D'`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP=3D'`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -3322,7 +3305,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>   STRIP=3D'`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB=3D'`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds=3D'`$ECHO "$old_postinstall_cmds" | $SED "$delay_s=
ingle_quote_subst"`'
> -@@ -15476,14 +16134,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_cv=
_sys_global_symbol_pipe" | $SED "$de
> +@@ -15526,14 +16183,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_cv=
_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl=3D'`$ECHO "$lt_cv_sys_global_symbol_to=
_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address=3D'`$ECHO "$lt_cv_sys_global_=
symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'`$ECHO "$lt_cv_=
sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote=
_subst"`'
> @@ -3341,7 +3324,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>   DSYMUTIL=3D'`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT=3D'`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO=3D'`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -15516,12 +16177,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_sh=
libpath_var" | $SED "$delay_single_q
> +@@ -15566,12 +16226,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_sh=
libpath_var" | $SED "$delay_single_q
>   hardcode_automatic=3D'`$ECHO "$hardcode_automatic" | $SED "$delay_singl=
e_quote_subst"`'
>   inherit_rpath=3D'`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_su=
bst"`'
>   link_all_deplibs=3D'`$ECHO "$link_all_deplibs" | $SED "$delay_single_qu=
ote_subst"`'
> @@ -3355,7 +3338,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>   file_list_spec=3D'`$ECHO "$file_list_spec" | $SED "$delay_single_quote_=
subst"`'
>   variables_saved_for_relink=3D'`$ECHO "$variables_saved_for_relink" | $S=
ED "$delay_single_quote_subst"`'
>   need_lib_prefix=3D'`$ECHO "$need_lib_prefix" | $SED "$delay_single_quot=
e_subst"`'
> -@@ -15576,8 +16237,13 @@ reload_flag \
> +@@ -15626,8 +16286,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -3369,7 +3352,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -15587,12 +16253,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -15637,12 +16302,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -3385,7 +3368,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -15608,7 +16276,6 @@ no_undefined_flag \
> +@@ -15658,7 +16325,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -3393,7 +3376,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -15644,6 +16311,7 @@ module_cmds \
> +@@ -15694,6 +16360,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -3401,7 +3384,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -16410,7 +17078,8 @@ $as_echo X"$file" |
> +@@ -16459,7 +17126,8 @@ $as_echo X"$file" |
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -3411,7 +3394,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -16513,19 +17182,42 @@ SP2NL=3D$lt_lt_SP2NL
> +@@ -16562,19 +17230,42 @@ SP2NL=3D$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=3D$lt_lt_NL2SP
>
> @@ -3455,7 +3438,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>   # A symbol stripping program.
>   STRIP=3D$lt_STRIP
>
> -@@ -16555,6 +17247,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_sys=
_global_symbol_to_c_name_address
> +@@ -16604,6 +17295,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_sys=
_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix i=
s needed.
>   global_symbol_to_c_name_address_lib_prefix=3D$lt_lt_cv_sys_global_symbo=
l_to_c_name_address_lib_prefix
>
> @@ -3468,7 +3451,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=3D$objdir
>
> -@@ -16564,6 +17262,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> +@@ -16613,6 +17310,9 @@ MAGIC_CMD=3D$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=3D$lt_need_locks
>
> @@ -3478,7 +3461,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=3D$lt_DSYMUTIL
>
> -@@ -16678,12 +17379,12 @@ with_gcc=3D$GCC
> +@@ -16727,12 +17427,12 @@ with_gcc=3D$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag
>
> @@ -3494,7 +3477,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=3D$lt_lt_prog_compiler_static
>
> -@@ -16770,9 +17471,6 @@ inherit_rpath=3D$inherit_rpath
> +@@ -16819,9 +17519,6 @@ inherit_rpath=3D$inherit_rpath
>   # Whether libtool must link a program against all its dependency librar=
ies.
>   link_all_deplibs=3D$link_all_deplibs
>
> @@ -3504,7 +3487,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=3D$always_export_symbols
>
> -@@ -16788,6 +17486,9 @@ include_expsyms=3D$lt_include_expsyms
> +@@ -16837,6 +17534,9 @@ include_expsyms=3D$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with temp=
lates.
>   prelink_cmds=3D$lt_prelink_cmds
>
> @@ -3514,7 +3497,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>   # Specify filename containing input files.
>   file_list_spec=3D$lt_file_list_spec
>
> -@@ -16820,210 +17521,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> +@@ -16869,210 +17569,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> @@ -3889,7 +3872,7 @@ index bf6461dab1e..8e6f6d30b4d 100755
>     chmod +x "$ofile"
>
>  diff --git a/gas/configure b/gas/configure
> -index 789d1b38b33..7ac563a13ad 100755
> +index dc6a6682aa4..10364bd81da 100755
>  --- a/gas/configure
>  +++ b/gas/configure
>  @@ -681,8 +681,11 @@ OTOOL
> @@ -3921,7 +3904,7 @@ index 789d1b38b33..7ac563a13ad 100755
>     --with-cpu=3DCPU          default cpu variant is CPU (currently only =
supported
>                             on ARC)
>     --with-system-zlib      use installed libz
> -@@ -4569,8 +4575,8 @@ esac
> +@@ -4608,8 +4614,8 @@ esac
>
>
>
> @@ -3932,7 +3915,7 @@ index 789d1b38b33..7ac563a13ad 100755
>
>
>
> -@@ -4610,7 +4616,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -4649,7 +4655,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings"=
 >&5
>   $as_echo_n "checking how to print strings... " >&6; }
>   # Test print first, because it will be a builtin if present.
> @@ -3941,7 +3924,7 @@ index 789d1b38b33..7ac563a13ad 100755
>      test "X`print -r -- $ECHO 2>/dev/null`" =3D "X$ECHO"; then
>     ECHO=3D'print -r --'
>   elif test "X`printf %s $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> -@@ -5296,8 +5302,8 @@ $as_echo_n "checking whether the shell understands=
 some XSI constructs... " >&6;
> +@@ -5336,8 +5342,8 @@ $as_echo_n "checking whether the shell understands=
 some XSI constructs... " >&6;
>   # Try some XSI features
>   xsi_shell=3Dno
>   ( _lt_dummy=3D"a/b/c"
> @@ -3952,7 +3935,7 @@ index 789d1b38b33..7ac563a13ad 100755
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=3Dyes
> -@@ -5346,6 +5352,80 @@ esac
> +@@ -5386,6 +5392,80 @@ esac
>
>
>
> @@ -4033,7 +4016,7 @@ index 789d1b38b33..7ac563a13ad 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to rel=
oad object files" >&5
>   $as_echo_n "checking for $LD option to reload object files... " >&6; }
>   if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -5362,6 +5442,11 @@ case $reload_flag in
> +@@ -5402,6 +5482,11 @@ case $reload_flag in
>   esac
>   reload_cmds=3D'$LD$reload_flag -o $output$reload_objs'
>   case $host_os in
> @@ -4045,7 +4028,7 @@ index 789d1b38b33..7ac563a13ad 100755
>     darwin*)
>       if test "$GCC" =3D yes; then
>         reload_cmds=3D'$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reloa=
d_objs'
> -@@ -5530,7 +5615,8 @@ mingw* | pw32*)
> +@@ -5570,7 +5655,8 @@ mingw* | pw32*)
>       lt_cv_deplibs_check_method=3D'file_magic ^x86 archive import|^x86 D=
LL'
>       lt_cv_file_magic_cmd=3D'func_win32_libid'
>     else
> @@ -4055,7 +4038,7 @@ index 789d1b38b33..7ac563a13ad 100755
>       lt_cv_file_magic_cmd=3D'$OBJDUMP -f'
>     fi
>     ;;
> -@@ -5684,6 +5770,21 @@ esac
> +@@ -5724,6 +5810,21 @@ esac
>   fi
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_m=
ethod" >&5
>   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -4077,7 +4060,7 @@ index 789d1b38b33..7ac563a13ad 100755
>   file_magic_cmd=3D$lt_cv_file_magic_cmd
>   deplibs_check_method=3D$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=3Dunknown
> -@@ -5699,6 +5800,157 @@ test -z "$deplibs_check_method" && deplibs_check=
_method=3Dunknown
> +@@ -5739,6 +5840,157 @@ test -z "$deplibs_check_method" && deplibs_check=
_method=3Dunknown
>
>
>
> @@ -4235,7 +4218,7 @@ index 789d1b38b33..7ac563a13ad 100755
>   plugin_option=3D
>   plugin_names=3D"liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dl=
l"
>   for plugin in $plugin_names; do
> -@@ -5713,8 +5965,10 @@ for plugin in $plugin_names; do
> +@@ -5753,8 +6005,10 @@ for plugin in $plugin_names; do
>   done
>
>   if test -n "$ac_tool_prefix"; then
> @@ -4248,7 +4231,7 @@ index 789d1b38b33..7ac563a13ad 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_AR+:} false; then :
> -@@ -5730,7 +5984,7 @@ do
> +@@ -5770,7 +6024,7 @@ do
>     test -z "$as_dir" && as_dir=3D.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -4257,7 +4240,7 @@ index 789d1b38b33..7ac563a13ad 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_ex=
ec_ext" >&5
>       break 2
>     fi
> -@@ -5750,11 +6004,15 @@ $as_echo "no" >&6; }
> +@@ -5790,11 +6044,15 @@ $as_echo "no" >&6; }
>   fi
>
>
> @@ -4276,7 +4259,7 @@ index 789d1b38b33..7ac563a13ad 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -5770,7 +6028,7 @@ do
> +@@ -5810,7 +6068,7 @@ do
>     test -z "$as_dir" && as_dir=3D.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -4285,7 +4268,7 @@ index 789d1b38b33..7ac563a13ad 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_ex=
ec_ext" >&5
>       break 2
>     fi
> -@@ -5789,6 +6047,10 @@ else
> +@@ -5829,6 +6087,10 @@ else
>   $as_echo "no" >&6; }
>   fi
>
> @@ -4296,7 +4279,7 @@ index 789d1b38b33..7ac563a13ad 100755
>     if test "x$ac_ct_AR" =3D x; then
>       AR=3D"false"
>     else
> -@@ -5800,29 +6062,81 @@ ac_tool_warned=3Dyes ;;
> +@@ -5840,29 +6102,81 @@ ac_tool_warned=3Dyes ;;
>   esac
>       AR=3D$ac_ct_AR
>     fi
> @@ -4393,7 +4376,7 @@ index 789d1b38b33..7ac563a13ad 100755
>
>
>
> -@@ -6169,8 +6483,8 @@ esac
> +@@ -6209,8 +6523,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl=3D"sed -n -e 's/^T .* \(.*\)$/extern i=
nt \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>
>   # Transform an extracted symbol line into symbol name and symbol addres=
s
> @@ -4404,7 +4387,7 @@ index 789d1b38b33..7ac563a13ad 100755
>
>   # Handle CRLF in mingw tool chain
>   opt_cr=3D
> -@@ -6206,6 +6520,7 @@ for ac_symprfx in "" "_"; do
> +@@ -6246,6 +6560,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe=3D"sed -n -e 's/^.*[    ]\($symcode$sy=
mcode*\)[         ][      ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -4412,7 +4395,7 @@ index 789d1b38b33..7ac563a13ad 100755
>
>     # Check to see that the pipe works correctly.
>     pipe_works=3Dno
> -@@ -6247,6 +6562,18 @@ _LT_EOF
> +@@ -6287,6 +6602,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>         if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>           cat <<_LT_EOF > conftest.$ac_ext
> @@ -4431,7 +4414,7 @@ index 789d1b38b33..7ac563a13ad 100755
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -6258,7 +6585,7 @@ _LT_EOF
> +@@ -6298,7 +6625,7 @@ _LT_EOF
>           cat <<_LT_EOF >> conftest.$ac_ext
>
>   /* The mapping between symbol names and symbols.  */
> @@ -4440,7 +4423,7 @@ index 789d1b38b33..7ac563a13ad 100755
>     const char *name;
>     void       *address;
>   }
> -@@ -6284,8 +6611,8 @@ static const void *lt_preloaded_setup() {
> +@@ -6324,8 +6651,8 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>           # Now try linking the two files.
>           mv conftest.$ac_objext conftstm.$ac_objext
> @@ -4451,7 +4434,7 @@ index 789d1b38b33..7ac563a13ad 100755
>           LIBS=3D"conftstm.$ac_objext"
>           CFLAGS=3D"$CFLAGS$lt_prog_compiler_no_builtin_flag"
>           if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\=
""; } >&5
> -@@ -6295,8 +6622,8 @@ _LT_EOF
> +@@ -6335,8 +6662,8 @@ _LT_EOF
>     test $ac_status =3D 0; } && test -s conftest${ac_exeext}; then
>             pipe_works=3Dyes
>           fi
> @@ -4462,7 +4445,7 @@ index 789d1b38b33..7ac563a13ad 100755
>         else
>           echo "cannot find nm_test_func in $nlist" >&5
>         fi
> -@@ -6333,6 +6660,19 @@ else
> +@@ -6373,6 +6700,19 @@ else
>   $as_echo "ok" >&6; }
>   fi
>
> @@ -4482,7 +4465,7 @@ index 789d1b38b33..7ac563a13ad 100755
>
>
>
> -@@ -6349,6 +6689,42 @@ fi
> +@@ -6389,6 +6729,42 @@ fi
>
>
>
> @@ -4525,7 +4508,7 @@ index 789d1b38b33..7ac563a13ad 100755
>
>
>
> -@@ -6560,6 +6936,123 @@ esac
> +@@ -6600,6 +6976,123 @@ esac
>
>   need_locks=3D"$enable_libtool_lock"
>
> @@ -4649,7 +4632,7 @@ index 789d1b38b33..7ac563a13ad 100755
>
>     case $host_os in
>       rhapsody* | darwin*)
> -@@ -7123,6 +7616,8 @@ _LT_EOF
> +@@ -7163,6 +7656,8 @@ _LT_EOF
>         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>         echo "$AR cru libconftest.a conftest.o" >&5
>         $AR cru libconftest.a conftest.o 2>&5
> @@ -4658,7 +4641,7 @@ index 789d1b38b33..7ac563a13ad 100755
>         cat > conftest.c << _LT_EOF
>   int main() { return 0;}
>   _LT_EOF
> -@@ -7705,8 +8201,6 @@ fi
> +@@ -7745,8 +8240,6 @@ fi
>   lt_prog_compiler_pic=3D
>   lt_prog_compiler_static=3D
>
> @@ -4667,7 +4650,7 @@ index 789d1b38b33..7ac563a13ad 100755
>
>     if test "$GCC" =3D yes; then
>       lt_prog_compiler_wl=3D'-Wl,'
> -@@ -7872,6 +8366,12 @@ $as_echo_n "checking for $compiler option to prod=
uce PIC... " >&6; }
> +@@ -7912,6 +8405,12 @@ $as_echo_n "checking for $compiler option to prod=
uce PIC... " >&6; }
>         lt_prog_compiler_pic=3D'--shared'
>         lt_prog_compiler_static=3D'--static'
>         ;;
> @@ -4680,7 +4663,7 @@ index 789d1b38b33..7ac563a13ad 100755
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>         # which looks to be a dead project)
> -@@ -7934,7 +8434,7 @@ $as_echo_n "checking for $compiler option to produ=
ce PIC... " >&6; }
> +@@ -7974,7 +8473,7 @@ $as_echo_n "checking for $compiler option to produ=
ce PIC... " >&6; }
>         lt_prog_compiler_pic=3D'-KPIC'
>         lt_prog_compiler_static=3D'-Bstatic'
>         case $cc_basename in
> @@ -4689,7 +4672,7 @@ index 789d1b38b33..7ac563a13ad 100755
>         lt_prog_compiler_wl=3D'-Qoption ld ';;
>         *)
>         lt_prog_compiler_wl=3D'-Wl,';;
> -@@ -7991,13 +8491,17 @@ case $host_os in
> +@@ -8031,13 +8530,17 @@ case $host_os in
>       lt_prog_compiler_pic=3D"$lt_prog_compiler_pic -DPIC"
>       ;;
>   esac
> @@ -4713,7 +4696,7 @@ index 789d1b38b33..7ac563a13ad 100755
>
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -8058,6 +8562,11 @@ fi
> +@@ -8098,6 +8601,11 @@ fi
>
>
>
> @@ -4725,7 +4708,7 @@ index 789d1b38b33..7ac563a13ad 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -8408,7 +8917,8 @@ _LT_EOF
> +@@ -8448,7 +8956,8 @@ _LT_EOF
>         allow_undefined_flag=3Dunsupported
>         always_export_symbols=3Dno
>         enable_shared_with_static_runtimes=3Dyes
> @@ -4735,7 +4718,7 @@ index 789d1b38b33..7ac563a13ad 100755
>
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags -=
o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-impli=
b -Xlinker $lib'
> -@@ -8507,12 +9017,12 @@ _LT_EOF
> +@@ -8547,12 +9056,12 @@ _LT_EOF
>           whole_archive_flag_spec=3D'--whole-archive$convenience --no-who=
le-archive'
>           hardcode_libdir_flag_spec=3D
>           hardcode_libdir_flag_spec_ld=3D'-rpath $libdir'
> @@ -4750,7 +4733,7 @@ index 789d1b38b33..7ac563a13ad 100755
>           fi
>           ;;
>         esac
> -@@ -8526,8 +9036,8 @@ _LT_EOF
> +@@ -8566,8 +9075,8 @@ _LT_EOF
>         archive_cmds=3D'$LD -Bshareable $libobjs $deplibs $linker_flags -=
o $lib'
>         wlarc=3D
>         else
> @@ -4761,7 +4744,7 @@ index 789d1b38b33..7ac563a13ad 100755
>         fi
>         ;;
>
> -@@ -8545,8 +9055,8 @@ _LT_EOF
> +@@ -8585,8 +9094,8 @@ _LT_EOF
>
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/=
null; then
> @@ -4772,7 +4755,7 @@ index 789d1b38b33..7ac563a13ad 100755
>         else
>         ld_shlibs=3Dno
>         fi
> -@@ -8592,8 +9102,8 @@ _LT_EOF
> +@@ -8632,8 +9141,8 @@ _LT_EOF
>
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/nu=
ll; then
> @@ -4783,7 +4766,7 @@ index 789d1b38b33..7ac563a13ad 100755
>         else
>         ld_shlibs=3Dno
>         fi
> -@@ -8723,7 +9233,13 @@ _LT_EOF
> +@@ -8763,7 +9272,13 @@ _LT_EOF
>         allow_undefined_flag=3D'-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -4798,7 +4781,7 @@ index 789d1b38b33..7ac563a13ad 100755
>   /* end confdefs.h.  */
>
>   int
> -@@ -8736,22 +9252,29 @@ main ()
> +@@ -8776,22 +9291,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>
> @@ -4841,7 +4824,7 @@ index 789d1b38b33..7ac563a13ad 100755
>
>           hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libp=
ath"
>           archive_expsym_cmds=3D'$CC -o $output_objdir/$soname $libobjs $=
deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefin=
ed_flag}" !=3D "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else=
 :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -8763,7 +9286,13 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/u=
sr/lib:/lib"; fi
> +@@ -8803,7 +9325,13 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/u=
sr/lib:/lib"; fi
>         else
>          # Determine the default libpath from the value encoded in an
>          # empty executable.
> @@ -4856,7 +4839,7 @@ index 789d1b38b33..7ac563a13ad 100755
>   /* end confdefs.h.  */
>
>   int
> -@@ -8776,22 +9305,29 @@ main ()
> +@@ -8816,22 +9344,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>
> @@ -4899,7 +4882,7 @@ index 789d1b38b33..7ac563a13ad 100755
>
>          hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libpa=
th"
>           # Warning - without using the other run time loading flags,
> -@@ -8836,20 +9372,63 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
> +@@ -8876,20 +9411,63 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
>         # no search path for DLLs.
> @@ -4977,7 +4960,7 @@ index 789d1b38b33..7ac563a13ad 100755
>         ;;
>
>       darwin* | rhapsody*)
> -@@ -8910,7 +9489,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
> +@@ -8950,7 +9528,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
>
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -4986,7 +4969,7 @@ index 789d1b38b33..7ac563a13ad 100755
>         hardcode_libdir_flag_spec=3D'-R$libdir'
>         hardcode_direct=3Dyes
>         hardcode_shlibpath_var=3Dno
> -@@ -8918,7 +9497,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
> +@@ -8958,7 +9536,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
>
>       hpux9*)
>         if test "$GCC" =3D yes; then
> @@ -4995,7 +4978,7 @@ index 789d1b38b33..7ac563a13ad 100755
>         else
>         archive_cmds=3D'$RM $output_objdir/$soname~$LD -b +b $install_lib=
dir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_=
objdir/$soname =3D $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -8934,7 +9513,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
> +@@ -8974,7 +9552,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
>
>       hpux10*)
>         if test "$GCC" =3D yes && test "$with_gnu_ld" =3D no; then
> @@ -5004,7 +4987,7 @@ index 789d1b38b33..7ac563a13ad 100755
>         else
>         archive_cmds=3D'$LD -b +h $soname +b $install_libdir -o $lib $lib=
objs $deplibs $linker_flags'
>         fi
> -@@ -8958,10 +9537,10 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
> +@@ -8998,10 +9576,10 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
>           archive_cmds=3D'$CC -shared ${wl}+h ${wl}$soname -o $lib $libob=
js $deplibs $compiler_flags'
>           ;;
>         ia64*)
> @@ -5017,7 +5000,7 @@ index 789d1b38b33..7ac563a13ad 100755
>           ;;
>         esac
>         else
> -@@ -9040,23 +9619,36 @@ fi
> +@@ -9080,23 +9658,36 @@ fi
>
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" =3D yes; then
> @@ -5062,7 +5045,7 @@ index 789d1b38b33..7ac563a13ad 100755
>         else
>         archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags -so=
name $soname `test -n "$verstring" && func_echo_all "-set_version $verstrin=
g"` -update_registry ${output_objdir}/so_locations -o $lib'
>         archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_fl=
ags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $v=
erstring"` -update_registry ${output_objdir}/so_locations -exports_file $ex=
port_symbols -o $lib'
> -@@ -9141,7 +9733,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9181,7 +9772,7 @@ rm -f core conftest.err conftest.$ac_objext \
>       osf4* | osf5*)    # as osf3* with the addition of -msym flag
>         if test "$GCC" =3D yes; then
>         allow_undefined_flag=3D' ${wl}-expect_unresolved ${wl}\*'
> @@ -5071,7 +5054,7 @@ index 789d1b38b33..7ac563a13ad 100755
>         hardcode_libdir_flag_spec=3D'${wl}-rpath ${wl}$libdir'
>         else
>         allow_undefined_flag=3D' -expect_unresolved \*'
> -@@ -9160,9 +9752,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9200,9 +9791,9 @@ rm -f core conftest.err conftest.$ac_objext \
>         no_undefined_flag=3D' -z defs'
>         if test "$GCC" =3D yes; then
>         wlarc=3D'${wl}'
> @@ -5083,7 +5066,7 @@ index 789d1b38b33..7ac563a13ad 100755
>         else
>         case `$CC -V 2>&1` in
>         *"Compilers 5.0"*)
> -@@ -9738,8 +10330,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -9778,8 +10369,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=3Dno
>     need_lib_prefix=3Dno
>
> @@ -5095,7 +5078,7 @@ index 789d1b38b33..7ac563a13ad 100755
>       library_names_spec=3D'$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds=3D'base_file=3D`basename \${file}`~
> -@@ -9772,13 +10365,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -9812,13 +10404,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec=3D'`echo ${libname} | sed -e 's/^lib/pw/'``ech=
o ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -5168,25 +5151,16 @@ index 789d1b38b33..7ac563a13ad 100755
>     # FIXME: first we should search . and the directory the executable is=
 in
>     shlibpath_var=3DPATH
>     ;;
> -@@ -9860,7 +10511,7 @@ haiku*)
> -   soname_spec=3D'${libname}${release}${shared_ext}$major'
> -   shlibpath_var=3DLIBRARY_PATH
> -   shlibpath_overrides_runpath=3Dyes
> --  sys_lib_dlsearch_path_spec=3D'/boot/home/config/lib /boot/common/lib =
/boot/beos/system/lib'
> -+  sys_lib_dlsearch_path_spec=3D'/boot/home/config/lib /boot/common/lib =
/boot/system/lib'
> -   hardcode_into_libs=3Dyes
> -   ;;
> -
> -@@ -10656,7 +11307,7 @@ else
> +@@ -10696,7 +11346,7 @@ else
>     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
>     lt_status=3D$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 10659 "configure"
> +-#line 10699 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>
>   #if HAVE_DLFCN_H
> -@@ -10700,10 +11351,10 @@ else
> +@@ -10740,10 +11390,10 @@ else
>   /* When -fvisbility=3Dhidden is used, assume the code has been annotate=
d
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=3D =
3)) || (__GNUC__ > 3))
> @@ -5199,16 +5173,16 @@ index 789d1b38b33..7ac563a13ad 100755
>   int main ()
>   {
>     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -10762,7 +11413,7 @@ else
> +@@ -10802,7 +11452,7 @@ else
>     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
>     lt_status=3D$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 10765 "configure"
> +-#line 10805 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>
>   #if HAVE_DLFCN_H
> -@@ -10806,10 +11457,10 @@ else
> +@@ -10846,10 +11496,10 @@ else
>   /* When -fvisbility=3Dhidden is used, assume the code has been annotate=
d
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=3D =
3)) || (__GNUC__ > 3))
> @@ -5221,7 +5195,7 @@ index 789d1b38b33..7ac563a13ad 100755
>   int main ()
>   {
>     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -14785,13 +15436,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_sing=
le_quote_subst"`'
> +@@ -14832,13 +15482,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_sing=
le_quote_subst"`'
>   lt_unset=3D'`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL=3D'`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP=3D'`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -5242,7 +5216,7 @@ index 789d1b38b33..7ac563a13ad 100755
>   STRIP=3D'`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB=3D'`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds=3D'`$ECHO "$old_postinstall_cmds" | $SED "$delay_s=
ingle_quote_subst"`'
> -@@ -14806,14 +15464,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_cv=
_sys_global_symbol_pipe" | $SED "$de
> +@@ -14853,14 +15510,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_cv=
_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl=3D'`$ECHO "$lt_cv_sys_global_symbol_to=
_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address=3D'`$ECHO "$lt_cv_sys_global_=
symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'`$ECHO "$lt_cv_=
sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote=
_subst"`'
> @@ -5261,7 +5235,7 @@ index 789d1b38b33..7ac563a13ad 100755
>   DSYMUTIL=3D'`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT=3D'`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO=3D'`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -14846,12 +15507,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_sh=
libpath_var" | $SED "$delay_single_q
> +@@ -14893,12 +15553,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_sh=
libpath_var" | $SED "$delay_single_q
>   hardcode_automatic=3D'`$ECHO "$hardcode_automatic" | $SED "$delay_singl=
e_quote_subst"`'
>   inherit_rpath=3D'`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_su=
bst"`'
>   link_all_deplibs=3D'`$ECHO "$link_all_deplibs" | $SED "$delay_single_qu=
ote_subst"`'
> @@ -5275,7 +5249,7 @@ index 789d1b38b33..7ac563a13ad 100755
>   file_list_spec=3D'`$ECHO "$file_list_spec" | $SED "$delay_single_quote_=
subst"`'
>   variables_saved_for_relink=3D'`$ECHO "$variables_saved_for_relink" | $S=
ED "$delay_single_quote_subst"`'
>   need_lib_prefix=3D'`$ECHO "$need_lib_prefix" | $SED "$delay_single_quot=
e_subst"`'
> -@@ -14906,8 +15567,13 @@ reload_flag \
> +@@ -14953,8 +15613,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -5289,7 +5263,7 @@ index 789d1b38b33..7ac563a13ad 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -14917,12 +15583,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -14964,12 +15629,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -5305,7 +5279,7 @@ index 789d1b38b33..7ac563a13ad 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -14938,7 +15606,6 @@ no_undefined_flag \
> +@@ -14985,7 +15652,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -5313,7 +5287,7 @@ index 789d1b38b33..7ac563a13ad 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -14974,6 +15641,7 @@ module_cmds \
> +@@ -15021,6 +15687,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -5321,7 +5295,7 @@ index 789d1b38b33..7ac563a13ad 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -15747,7 +16415,8 @@ $as_echo X"$file" |
> +@@ -15793,7 +16460,8 @@ $as_echo X"$file" |
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -5331,7 +5305,7 @@ index 789d1b38b33..7ac563a13ad 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -15850,19 +16519,42 @@ SP2NL=3D$lt_lt_SP2NL
> +@@ -15896,19 +16564,42 @@ SP2NL=3D$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=3D$lt_lt_NL2SP
>
> @@ -5375,7 +5349,7 @@ index 789d1b38b33..7ac563a13ad 100755
>   # A symbol stripping program.
>   STRIP=3D$lt_STRIP
>
> -@@ -15892,6 +16584,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_sys=
_global_symbol_to_c_name_address
> +@@ -15938,6 +16629,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_sys=
_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix i=
s needed.
>   global_symbol_to_c_name_address_lib_prefix=3D$lt_lt_cv_sys_global_symbo=
l_to_c_name_address_lib_prefix
>
> @@ -5388,7 +5362,7 @@ index 789d1b38b33..7ac563a13ad 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=3D$objdir
>
> -@@ -15901,6 +16599,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> +@@ -15947,6 +16644,9 @@ MAGIC_CMD=3D$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=3D$lt_need_locks
>
> @@ -5398,7 +5372,7 @@ index 789d1b38b33..7ac563a13ad 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=3D$lt_DSYMUTIL
>
> -@@ -16015,12 +16716,12 @@ with_gcc=3D$GCC
> +@@ -16061,12 +16761,12 @@ with_gcc=3D$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag
>
> @@ -5414,7 +5388,7 @@ index 789d1b38b33..7ac563a13ad 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=3D$lt_lt_prog_compiler_static
>
> -@@ -16107,9 +16808,6 @@ inherit_rpath=3D$inherit_rpath
> +@@ -16153,9 +16853,6 @@ inherit_rpath=3D$inherit_rpath
>   # Whether libtool must link a program against all its dependency librar=
ies.
>   link_all_deplibs=3D$link_all_deplibs
>
> @@ -5424,7 +5398,7 @@ index 789d1b38b33..7ac563a13ad 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=3D$always_export_symbols
>
> -@@ -16125,6 +16823,9 @@ include_expsyms=3D$lt_include_expsyms
> +@@ -16171,6 +16868,9 @@ include_expsyms=3D$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with temp=
lates.
>   prelink_cmds=3D$lt_prelink_cmds
>
> @@ -5434,7 +5408,7 @@ index 789d1b38b33..7ac563a13ad 100755
>   # Specify filename containing input files.
>   file_list_spec=3D$lt_file_list_spec
>
> -@@ -16157,210 +16858,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> +@@ -16203,210 +16903,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> @@ -5809,7 +5783,7 @@ index 789d1b38b33..7ac563a13ad 100755
>     chmod +x "$ofile"
>
>  diff --git a/gprof/configure b/gprof/configure
> -index 5703bba4462..e1ac86ec797 100755
> +index a7f788f0411..e7703613024 100755
>  --- a/gprof/configure
>  +++ b/gprof/configure
>  @@ -663,8 +663,11 @@ OTOOL
> @@ -5841,7 +5815,7 @@ index 5703bba4462..e1ac86ec797 100755
>
>   Some influential environment variables:
>     CC          C compiler command
> -@@ -4471,8 +4477,8 @@ esac
> +@@ -4510,8 +4516,8 @@ esac
>
>
>
> @@ -5852,7 +5826,7 @@ index 5703bba4462..e1ac86ec797 100755
>
>
>
> -@@ -4512,7 +4518,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -4551,7 +4557,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings"=
 >&5
>   $as_echo_n "checking how to print strings... " >&6; }
>   # Test print first, because it will be a builtin if present.
> @@ -5861,7 +5835,7 @@ index 5703bba4462..e1ac86ec797 100755
>      test "X`print -r -- $ECHO 2>/dev/null`" =3D "X$ECHO"; then
>     ECHO=3D'print -r --'
>   elif test "X`printf %s $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> -@@ -5198,8 +5204,8 @@ $as_echo_n "checking whether the shell understands=
 some XSI constructs... " >&6;
> +@@ -5238,8 +5244,8 @@ $as_echo_n "checking whether the shell understands=
 some XSI constructs... " >&6;
>   # Try some XSI features
>   xsi_shell=3Dno
>   ( _lt_dummy=3D"a/b/c"
> @@ -5872,7 +5846,7 @@ index 5703bba4462..e1ac86ec797 100755
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=3Dyes
> -@@ -5248,6 +5254,80 @@ esac
> +@@ -5288,6 +5294,80 @@ esac
>
>
>
> @@ -5953,7 +5927,7 @@ index 5703bba4462..e1ac86ec797 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to rel=
oad object files" >&5
>   $as_echo_n "checking for $LD option to reload object files... " >&6; }
>   if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -5264,6 +5344,11 @@ case $reload_flag in
> +@@ -5304,6 +5384,11 @@ case $reload_flag in
>   esac
>   reload_cmds=3D'$LD$reload_flag -o $output$reload_objs'
>   case $host_os in
> @@ -5965,7 +5939,7 @@ index 5703bba4462..e1ac86ec797 100755
>     darwin*)
>       if test "$GCC" =3D yes; then
>         reload_cmds=3D'$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reloa=
d_objs'
> -@@ -5432,7 +5517,8 @@ mingw* | pw32*)
> +@@ -5472,7 +5557,8 @@ mingw* | pw32*)
>       lt_cv_deplibs_check_method=3D'file_magic ^x86 archive import|^x86 D=
LL'
>       lt_cv_file_magic_cmd=3D'func_win32_libid'
>     else
> @@ -5975,7 +5949,7 @@ index 5703bba4462..e1ac86ec797 100755
>       lt_cv_file_magic_cmd=3D'$OBJDUMP -f'
>     fi
>     ;;
> -@@ -5586,6 +5672,21 @@ esac
> +@@ -5626,6 +5712,21 @@ esac
>   fi
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_m=
ethod" >&5
>   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -5997,7 +5971,7 @@ index 5703bba4462..e1ac86ec797 100755
>   file_magic_cmd=3D$lt_cv_file_magic_cmd
>   deplibs_check_method=3D$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=3Dunknown
> -@@ -5601,6 +5702,157 @@ test -z "$deplibs_check_method" && deplibs_check=
_method=3Dunknown
> +@@ -5641,6 +5742,157 @@ test -z "$deplibs_check_method" && deplibs_check=
_method=3Dunknown
>
>
>
> @@ -6155,7 +6129,7 @@ index 5703bba4462..e1ac86ec797 100755
>   plugin_option=3D
>   plugin_names=3D"liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dl=
l"
>   for plugin in $plugin_names; do
> -@@ -5615,8 +5867,10 @@ for plugin in $plugin_names; do
> +@@ -5655,8 +5907,10 @@ for plugin in $plugin_names; do
>   done
>
>   if test -n "$ac_tool_prefix"; then
> @@ -6168,7 +6142,7 @@ index 5703bba4462..e1ac86ec797 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_AR+:} false; then :
> -@@ -5632,7 +5886,7 @@ do
> +@@ -5672,7 +5926,7 @@ do
>     test -z "$as_dir" && as_dir=3D.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -6177,7 +6151,7 @@ index 5703bba4462..e1ac86ec797 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_ex=
ec_ext" >&5
>       break 2
>     fi
> -@@ -5652,11 +5906,15 @@ $as_echo "no" >&6; }
> +@@ -5692,11 +5946,15 @@ $as_echo "no" >&6; }
>   fi
>
>
> @@ -6196,7 +6170,7 @@ index 5703bba4462..e1ac86ec797 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -5672,7 +5930,7 @@ do
> +@@ -5712,7 +5970,7 @@ do
>     test -z "$as_dir" && as_dir=3D.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -6205,7 +6179,7 @@ index 5703bba4462..e1ac86ec797 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_ex=
ec_ext" >&5
>       break 2
>     fi
> -@@ -5691,6 +5949,10 @@ else
> +@@ -5731,6 +5989,10 @@ else
>   $as_echo "no" >&6; }
>   fi
>
> @@ -6216,7 +6190,7 @@ index 5703bba4462..e1ac86ec797 100755
>     if test "x$ac_ct_AR" =3D x; then
>       AR=3D"false"
>     else
> -@@ -5702,25 +5964,19 @@ ac_tool_warned=3Dyes ;;
> +@@ -5742,25 +6004,19 @@ ac_tool_warned=3Dyes ;;
>   esac
>       AR=3D$ac_ct_AR
>     fi
> @@ -6251,7 +6225,7 @@ index 5703bba4462..e1ac86ec797 100755
>
>
>
> -@@ -5732,6 +5988,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=3Dcru
> +@@ -5772,6 +6028,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=3Dcru
>
>
>
> @@ -6316,7 +6290,7 @@ index 5703bba4462..e1ac86ec797 100755
>   if test -n "$ac_tool_prefix"; then
>     # Extract the first word of "${ac_tool_prefix}strip", so it can be a =
program name with args.
>   set dummy ${ac_tool_prefix}strip; ac_word=3D$2
> -@@ -6071,8 +6385,8 @@ esac
> +@@ -6111,8 +6425,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl=3D"sed -n -e 's/^T .* \(.*\)$/extern i=
nt \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>
>   # Transform an extracted symbol line into symbol name and symbol addres=
s
> @@ -6327,7 +6301,7 @@ index 5703bba4462..e1ac86ec797 100755
>
>   # Handle CRLF in mingw tool chain
>   opt_cr=3D
> -@@ -6108,6 +6422,7 @@ for ac_symprfx in "" "_"; do
> +@@ -6148,6 +6462,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe=3D"sed -n -e 's/^.*[    ]\($symcode$sy=
mcode*\)[         ][      ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -6335,7 +6309,7 @@ index 5703bba4462..e1ac86ec797 100755
>
>     # Check to see that the pipe works correctly.
>     pipe_works=3Dno
> -@@ -6149,6 +6464,18 @@ _LT_EOF
> +@@ -6189,6 +6504,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>         if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>           cat <<_LT_EOF > conftest.$ac_ext
> @@ -6354,7 +6328,7 @@ index 5703bba4462..e1ac86ec797 100755
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -6160,7 +6487,7 @@ _LT_EOF
> +@@ -6200,7 +6527,7 @@ _LT_EOF
>           cat <<_LT_EOF >> conftest.$ac_ext
>
>   /* The mapping between symbol names and symbols.  */
> @@ -6363,7 +6337,7 @@ index 5703bba4462..e1ac86ec797 100755
>     const char *name;
>     void       *address;
>   }
> -@@ -6186,8 +6513,8 @@ static const void *lt_preloaded_setup() {
> +@@ -6226,8 +6553,8 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>           # Now try linking the two files.
>           mv conftest.$ac_objext conftstm.$ac_objext
> @@ -6374,7 +6348,7 @@ index 5703bba4462..e1ac86ec797 100755
>           LIBS=3D"conftstm.$ac_objext"
>           CFLAGS=3D"$CFLAGS$lt_prog_compiler_no_builtin_flag"
>           if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\=
""; } >&5
> -@@ -6197,8 +6524,8 @@ _LT_EOF
> +@@ -6237,8 +6564,8 @@ _LT_EOF
>     test $ac_status =3D 0; } && test -s conftest${ac_exeext}; then
>             pipe_works=3Dyes
>           fi
> @@ -6385,7 +6359,7 @@ index 5703bba4462..e1ac86ec797 100755
>         else
>           echo "cannot find nm_test_func in $nlist" >&5
>         fi
> -@@ -6235,6 +6562,18 @@ else
> +@@ -6275,6 +6602,18 @@ else
>   $as_echo "ok" >&6; }
>   fi
>
> @@ -6404,7 +6378,7 @@ index 5703bba4462..e1ac86ec797 100755
>
>
>
> -@@ -6251,6 +6590,43 @@ fi
> +@@ -6291,6 +6630,43 @@ fi
>
>
>
> @@ -6448,7 +6422,7 @@ index 5703bba4462..e1ac86ec797 100755
>
>
>
> -@@ -6462,6 +6838,123 @@ esac
> +@@ -6502,6 +6878,123 @@ esac
>
>   need_locks=3D"$enable_libtool_lock"
>
> @@ -6572,7 +6546,7 @@ index 5703bba4462..e1ac86ec797 100755
>
>     case $host_os in
>       rhapsody* | darwin*)
> -@@ -7025,6 +7518,8 @@ _LT_EOF
> +@@ -7065,6 +7558,8 @@ _LT_EOF
>         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>         echo "$AR cru libconftest.a conftest.o" >&5
>         $AR cru libconftest.a conftest.o 2>&5
> @@ -6581,7 +6555,7 @@ index 5703bba4462..e1ac86ec797 100755
>         cat > conftest.c << _LT_EOF
>   int main() { return 0;}
>   _LT_EOF
> -@@ -7607,8 +8103,6 @@ fi
> +@@ -7647,8 +8142,6 @@ fi
>   lt_prog_compiler_pic=3D
>   lt_prog_compiler_static=3D
>
> @@ -6590,7 +6564,7 @@ index 5703bba4462..e1ac86ec797 100755
>
>     if test "$GCC" =3D yes; then
>       lt_prog_compiler_wl=3D'-Wl,'
> -@@ -7774,6 +8268,12 @@ $as_echo_n "checking for $compiler option to prod=
uce PIC... " >&6; }
> +@@ -7814,6 +8307,12 @@ $as_echo_n "checking for $compiler option to prod=
uce PIC... " >&6; }
>         lt_prog_compiler_pic=3D'--shared'
>         lt_prog_compiler_static=3D'--static'
>         ;;
> @@ -6603,7 +6577,7 @@ index 5703bba4462..e1ac86ec797 100755
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>         # which looks to be a dead project)
> -@@ -7836,7 +8336,7 @@ $as_echo_n "checking for $compiler option to produ=
ce PIC... " >&6; }
> +@@ -7876,7 +8375,7 @@ $as_echo_n "checking for $compiler option to produ=
ce PIC... " >&6; }
>         lt_prog_compiler_pic=3D'-KPIC'
>         lt_prog_compiler_static=3D'-Bstatic'
>         case $cc_basename in
> @@ -6612,7 +6586,7 @@ index 5703bba4462..e1ac86ec797 100755
>         lt_prog_compiler_wl=3D'-Qoption ld ';;
>         *)
>         lt_prog_compiler_wl=3D'-Wl,';;
> -@@ -7893,13 +8393,17 @@ case $host_os in
> +@@ -7933,13 +8432,17 @@ case $host_os in
>       lt_prog_compiler_pic=3D"$lt_prog_compiler_pic -DPIC"
>       ;;
>   esac
> @@ -6636,7 +6610,7 @@ index 5703bba4462..e1ac86ec797 100755
>
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -7960,6 +8464,11 @@ fi
> +@@ -8000,6 +8503,11 @@ fi
>
>
>
> @@ -6648,7 +6622,7 @@ index 5703bba4462..e1ac86ec797 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -8310,7 +8819,8 @@ _LT_EOF
> +@@ -8350,7 +8858,8 @@ _LT_EOF
>         allow_undefined_flag=3Dunsupported
>         always_export_symbols=3Dno
>         enable_shared_with_static_runtimes=3Dyes
> @@ -6658,7 +6632,7 @@ index 5703bba4462..e1ac86ec797 100755
>
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags -=
o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-impli=
b -Xlinker $lib'
> -@@ -8409,12 +8919,12 @@ _LT_EOF
> +@@ -8449,12 +8958,12 @@ _LT_EOF
>           whole_archive_flag_spec=3D'--whole-archive$convenience --no-who=
le-archive'
>           hardcode_libdir_flag_spec=3D
>           hardcode_libdir_flag_spec_ld=3D'-rpath $libdir'
> @@ -6673,7 +6647,7 @@ index 5703bba4462..e1ac86ec797 100755
>           fi
>           ;;
>         esac
> -@@ -8428,8 +8938,8 @@ _LT_EOF
> +@@ -8468,8 +8977,8 @@ _LT_EOF
>         archive_cmds=3D'$LD -Bshareable $libobjs $deplibs $linker_flags -=
o $lib'
>         wlarc=3D
>         else
> @@ -6684,7 +6658,7 @@ index 5703bba4462..e1ac86ec797 100755
>         fi
>         ;;
>
> -@@ -8447,8 +8957,8 @@ _LT_EOF
> +@@ -8487,8 +8996,8 @@ _LT_EOF
>
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/=
null; then
> @@ -6695,7 +6669,7 @@ index 5703bba4462..e1ac86ec797 100755
>         else
>         ld_shlibs=3Dno
>         fi
> -@@ -8494,8 +9004,8 @@ _LT_EOF
> +@@ -8534,8 +9043,8 @@ _LT_EOF
>
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/nu=
ll; then
> @@ -6706,7 +6680,7 @@ index 5703bba4462..e1ac86ec797 100755
>         else
>         ld_shlibs=3Dno
>         fi
> -@@ -8625,7 +9135,13 @@ _LT_EOF
> +@@ -8665,7 +9174,13 @@ _LT_EOF
>         allow_undefined_flag=3D'-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -6721,7 +6695,7 @@ index 5703bba4462..e1ac86ec797 100755
>   /* end confdefs.h.  */
>
>   int
> -@@ -8638,22 +9154,29 @@ main ()
> +@@ -8678,22 +9193,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>
> @@ -6764,7 +6738,7 @@ index 5703bba4462..e1ac86ec797 100755
>
>           hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libp=
ath"
>           archive_expsym_cmds=3D'$CC -o $output_objdir/$soname $libobjs $=
deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefin=
ed_flag}" !=3D "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else=
 :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -8665,7 +9188,13 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/u=
sr/lib:/lib"; fi
> +@@ -8705,7 +9227,13 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/u=
sr/lib:/lib"; fi
>         else
>          # Determine the default libpath from the value encoded in an
>          # empty executable.
> @@ -6779,7 +6753,7 @@ index 5703bba4462..e1ac86ec797 100755
>   /* end confdefs.h.  */
>
>   int
> -@@ -8678,22 +9207,29 @@ main ()
> +@@ -8718,22 +9246,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>
> @@ -6822,7 +6796,7 @@ index 5703bba4462..e1ac86ec797 100755
>
>          hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libpa=
th"
>           # Warning - without using the other run time loading flags,
> -@@ -8738,20 +9274,63 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
> +@@ -8778,20 +9313,63 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
>         # no search path for DLLs.
> @@ -6900,7 +6874,7 @@ index 5703bba4462..e1ac86ec797 100755
>         ;;
>
>       darwin* | rhapsody*)
> -@@ -8812,7 +9391,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
> +@@ -8852,7 +9430,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
>
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -6909,7 +6883,7 @@ index 5703bba4462..e1ac86ec797 100755
>         hardcode_libdir_flag_spec=3D'-R$libdir'
>         hardcode_direct=3Dyes
>         hardcode_shlibpath_var=3Dno
> -@@ -8820,7 +9399,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
> +@@ -8860,7 +9438,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
>
>       hpux9*)
>         if test "$GCC" =3D yes; then
> @@ -6918,7 +6892,7 @@ index 5703bba4462..e1ac86ec797 100755
>         else
>         archive_cmds=3D'$RM $output_objdir/$soname~$LD -b +b $install_lib=
dir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_=
objdir/$soname =3D $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -8836,7 +9415,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
> +@@ -8876,7 +9454,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
>
>       hpux10*)
>         if test "$GCC" =3D yes && test "$with_gnu_ld" =3D no; then
> @@ -6927,7 +6901,7 @@ index 5703bba4462..e1ac86ec797 100755
>         else
>         archive_cmds=3D'$LD -b +h $soname +b $install_libdir -o $lib $lib=
objs $deplibs $linker_flags'
>         fi
> -@@ -8860,10 +9439,10 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
> +@@ -8900,10 +9478,10 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
>           archive_cmds=3D'$CC -shared ${wl}+h ${wl}$soname -o $lib $libob=
js $deplibs $compiler_flags'
>           ;;
>         ia64*)
> @@ -6940,7 +6914,7 @@ index 5703bba4462..e1ac86ec797 100755
>           ;;
>         esac
>         else
> -@@ -8942,23 +9521,36 @@ fi
> +@@ -8982,23 +9560,36 @@ fi
>
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" =3D yes; then
> @@ -6985,7 +6959,7 @@ index 5703bba4462..e1ac86ec797 100755
>         else
>         archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags -so=
name $soname `test -n "$verstring" && func_echo_all "-set_version $verstrin=
g"` -update_registry ${output_objdir}/so_locations -o $lib'
>         archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_fl=
ags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $v=
erstring"` -update_registry ${output_objdir}/so_locations -exports_file $ex=
port_symbols -o $lib'
> -@@ -9043,7 +9635,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9083,7 +9674,7 @@ rm -f core conftest.err conftest.$ac_objext \
>       osf4* | osf5*)    # as osf3* with the addition of -msym flag
>         if test "$GCC" =3D yes; then
>         allow_undefined_flag=3D' ${wl}-expect_unresolved ${wl}\*'
> @@ -6994,7 +6968,7 @@ index 5703bba4462..e1ac86ec797 100755
>         hardcode_libdir_flag_spec=3D'${wl}-rpath ${wl}$libdir'
>         else
>         allow_undefined_flag=3D' -expect_unresolved \*'
> -@@ -9062,9 +9654,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9102,9 +9693,9 @@ rm -f core conftest.err conftest.$ac_objext \
>         no_undefined_flag=3D' -z defs'
>         if test "$GCC" =3D yes; then
>         wlarc=3D'${wl}'
> @@ -7006,7 +6980,7 @@ index 5703bba4462..e1ac86ec797 100755
>         else
>         case `$CC -V 2>&1` in
>         *"Compilers 5.0"*)
> -@@ -9640,8 +10232,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -9680,8 +10271,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=3Dno
>     need_lib_prefix=3Dno
>
> @@ -7018,7 +6992,7 @@ index 5703bba4462..e1ac86ec797 100755
>       library_names_spec=3D'$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds=3D'base_file=3D`basename \${file}`~
> -@@ -9674,13 +10267,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -9714,13 +10306,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec=3D'`echo ${libname} | sed -e 's/^lib/pw/'``ech=
o ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -7091,25 +7065,16 @@ index 5703bba4462..e1ac86ec797 100755
>     # FIXME: first we should search . and the directory the executable is=
 in
>     shlibpath_var=3DPATH
>     ;;
> -@@ -9762,7 +10413,7 @@ haiku*)
> -   soname_spec=3D'${libname}${release}${shared_ext}$major'
> -   shlibpath_var=3DLIBRARY_PATH
> -   shlibpath_overrides_runpath=3Dyes
> --  sys_lib_dlsearch_path_spec=3D'/boot/home/config/lib /boot/common/lib =
/boot/beos/system/lib'
> -+  sys_lib_dlsearch_path_spec=3D'/boot/home/config/lib /boot/common/lib =
/boot/system/lib'
> -   hardcode_into_libs=3Dyes
> -   ;;
> -
> -@@ -10558,7 +11209,7 @@ else
> +@@ -10598,7 +11248,7 @@ else
>     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
>     lt_status=3D$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 10561 "configure"
> +-#line 10601 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>
>   #if HAVE_DLFCN_H
> -@@ -10602,10 +11253,10 @@ else
> +@@ -10642,10 +11292,10 @@ else
>   /* When -fvisbility=3Dhidden is used, assume the code has been annotate=
d
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=3D =
3)) || (__GNUC__ > 3))
> @@ -7122,16 +7087,16 @@ index 5703bba4462..e1ac86ec797 100755
>   int main ()
>   {
>     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -10664,7 +11315,7 @@ else
> +@@ -10704,7 +11354,7 @@ else
>     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
>     lt_status=3D$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 10667 "configure"
> +-#line 10707 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>
>   #if HAVE_DLFCN_H
> -@@ -10708,10 +11359,10 @@ else
> +@@ -10748,10 +11398,10 @@ else
>   /* When -fvisbility=3Dhidden is used, assume the code has been annotate=
d
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=3D =
3)) || (__GNUC__ > 3))
> @@ -7144,7 +7109,7 @@ index 5703bba4462..e1ac86ec797 100755
>   int main ()
>   {
>     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -12731,13 +13382,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_sing=
le_quote_subst"`'
> +@@ -12771,13 +13421,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_sing=
le_quote_subst"`'
>   lt_unset=3D'`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL=3D'`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP=3D'`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -7165,7 +7130,7 @@ index 5703bba4462..e1ac86ec797 100755
>   STRIP=3D'`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB=3D'`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds=3D'`$ECHO "$old_postinstall_cmds" | $SED "$delay_s=
ingle_quote_subst"`'
> -@@ -12752,14 +13410,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_cv=
_sys_global_symbol_pipe" | $SED "$de
> +@@ -12792,14 +13449,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_cv=
_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl=3D'`$ECHO "$lt_cv_sys_global_symbol_to=
_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address=3D'`$ECHO "$lt_cv_sys_global_=
symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'`$ECHO "$lt_cv_=
sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote=
_subst"`'
> @@ -7184,7 +7149,7 @@ index 5703bba4462..e1ac86ec797 100755
>   DSYMUTIL=3D'`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT=3D'`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO=3D'`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -12792,12 +13453,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_sh=
libpath_var" | $SED "$delay_single_q
> +@@ -12832,12 +13492,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_sh=
libpath_var" | $SED "$delay_single_q
>   hardcode_automatic=3D'`$ECHO "$hardcode_automatic" | $SED "$delay_singl=
e_quote_subst"`'
>   inherit_rpath=3D'`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_su=
bst"`'
>   link_all_deplibs=3D'`$ECHO "$link_all_deplibs" | $SED "$delay_single_qu=
ote_subst"`'
> @@ -7198,7 +7163,7 @@ index 5703bba4462..e1ac86ec797 100755
>   file_list_spec=3D'`$ECHO "$file_list_spec" | $SED "$delay_single_quote_=
subst"`'
>   variables_saved_for_relink=3D'`$ECHO "$variables_saved_for_relink" | $S=
ED "$delay_single_quote_subst"`'
>   need_lib_prefix=3D'`$ECHO "$need_lib_prefix" | $SED "$delay_single_quot=
e_subst"`'
> -@@ -12852,8 +13513,13 @@ reload_flag \
> +@@ -12892,8 +13552,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -7212,7 +7177,7 @@ index 5703bba4462..e1ac86ec797 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -12863,12 +13529,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -12903,12 +13568,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -7228,7 +7193,7 @@ index 5703bba4462..e1ac86ec797 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -12884,7 +13552,6 @@ no_undefined_flag \
> +@@ -12924,7 +13591,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -7236,7 +7201,7 @@ index 5703bba4462..e1ac86ec797 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -12920,6 +13587,7 @@ module_cmds \
> +@@ -12960,6 +13626,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -7244,7 +7209,7 @@ index 5703bba4462..e1ac86ec797 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -13685,7 +14353,8 @@ $as_echo X"$file" |
> +@@ -13725,7 +14392,8 @@ $as_echo X"$file" |
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -7254,7 +7219,7 @@ index 5703bba4462..e1ac86ec797 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -13788,19 +14457,42 @@ SP2NL=3D$lt_lt_SP2NL
> +@@ -13828,19 +14496,42 @@ SP2NL=3D$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=3D$lt_lt_NL2SP
>
> @@ -7298,7 +7263,7 @@ index 5703bba4462..e1ac86ec797 100755
>   # A symbol stripping program.
>   STRIP=3D$lt_STRIP
>
> -@@ -13830,6 +14522,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_sys=
_global_symbol_to_c_name_address
> +@@ -13870,6 +14561,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_sys=
_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix i=
s needed.
>   global_symbol_to_c_name_address_lib_prefix=3D$lt_lt_cv_sys_global_symbo=
l_to_c_name_address_lib_prefix
>
> @@ -7311,7 +7276,7 @@ index 5703bba4462..e1ac86ec797 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=3D$objdir
>
> -@@ -13839,6 +14537,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> +@@ -13879,6 +14576,9 @@ MAGIC_CMD=3D$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=3D$lt_need_locks
>
> @@ -7321,7 +7286,7 @@ index 5703bba4462..e1ac86ec797 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=3D$lt_DSYMUTIL
>
> -@@ -13953,12 +14654,12 @@ with_gcc=3D$GCC
> +@@ -13993,12 +14693,12 @@ with_gcc=3D$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag
>
> @@ -7337,7 +7302,7 @@ index 5703bba4462..e1ac86ec797 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=3D$lt_lt_prog_compiler_static
>
> -@@ -14045,9 +14746,6 @@ inherit_rpath=3D$inherit_rpath
> +@@ -14085,9 +14785,6 @@ inherit_rpath=3D$inherit_rpath
>   # Whether libtool must link a program against all its dependency librar=
ies.
>   link_all_deplibs=3D$link_all_deplibs
>
> @@ -7347,7 +7312,7 @@ index 5703bba4462..e1ac86ec797 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=3D$always_export_symbols
>
> -@@ -14063,6 +14761,9 @@ include_expsyms=3D$lt_include_expsyms
> +@@ -14103,6 +14800,9 @@ include_expsyms=3D$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with temp=
lates.
>   prelink_cmds=3D$lt_prelink_cmds
>
> @@ -7357,7 +7322,7 @@ index 5703bba4462..e1ac86ec797 100755
>   # Specify filename containing input files.
>   file_list_spec=3D$lt_file_list_spec
>
> -@@ -14095,210 +14796,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> +@@ -14135,210 +14835,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> @@ -7732,10 +7697,10 @@ index 5703bba4462..e1ac86ec797 100755
>     chmod +x "$ofile"
>
>  diff --git a/ld/configure b/ld/configure
> -index 2aeb3317b65..5ef46d31558 100755
> +index 1f9ec8ec580..4a35108ce7c 100755
>  --- a/ld/configure
>  +++ b/ld/configure
> -@@ -693,8 +693,11 @@ OTOOL
> +@@ -695,8 +695,11 @@ OTOOL
>   LIPO
>   NMEDIT
>   DSYMUTIL
> @@ -7747,7 +7712,7 @@ index 2aeb3317b65..5ef46d31558 100755
>   OBJDUMP
>   LN_S
>   NM
> -@@ -821,6 +824,7 @@ enable_static
> +@@ -823,6 +826,7 @@ enable_static
>   with_pic
>   enable_fast_install
>   with_gnu_ld
> @@ -7755,7 +7720,7 @@ index 2aeb3317b65..5ef46d31558 100755
>   enable_libtool_lock
>   enable_plugins
>   enable_largefile
> -@@ -1528,6 +1532,8 @@ Optional Packages:
> +@@ -1530,6 +1534,8 @@ Optional Packages:
>     --with-pic              try to use only PIC/non-PIC objects [default=
=3Duse
>                             both]
>     --with-gnu-ld           assume the C compiler uses GNU ld [default=3D=
no]
> @@ -7764,7 +7729,7 @@ index 2aeb3317b65..5ef46d31558 100755
>     --with-lib-path=3Ddir1:dir2...  set default LIB_PATH
>     --with-sysroot=3DDIR Search for usr/lib et al within DIR.
>     --with-system-zlib      use installed libz
> -@@ -5327,8 +5333,8 @@ esac
> +@@ -5368,8 +5374,8 @@ esac
>
>
>
> @@ -7775,7 +7740,7 @@ index 2aeb3317b65..5ef46d31558 100755
>
>
>
> -@@ -5368,7 +5374,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -5409,7 +5415,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings"=
 >&5
>   $as_echo_n "checking how to print strings... " >&6; }
>   # Test print first, because it will be a builtin if present.
> @@ -7784,7 +7749,7 @@ index 2aeb3317b65..5ef46d31558 100755
>      test "X`print -r -- $ECHO 2>/dev/null`" =3D "X$ECHO"; then
>     ECHO=3D'print -r --'
>   elif test "X`printf %s $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> -@@ -6054,8 +6060,8 @@ $as_echo_n "checking whether the shell understands=
 some XSI constructs... " >&6;
> +@@ -6096,8 +6102,8 @@ $as_echo_n "checking whether the shell understands=
 some XSI constructs... " >&6;
>   # Try some XSI features
>   xsi_shell=3Dno
>   ( _lt_dummy=3D"a/b/c"
> @@ -7795,7 +7760,7 @@ index 2aeb3317b65..5ef46d31558 100755
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=3Dyes
> -@@ -6104,6 +6110,80 @@ esac
> +@@ -6146,6 +6152,80 @@ esac
>
>
>
> @@ -7876,7 +7841,7 @@ index 2aeb3317b65..5ef46d31558 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to rel=
oad object files" >&5
>   $as_echo_n "checking for $LD option to reload object files... " >&6; }
>   if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -6120,6 +6200,11 @@ case $reload_flag in
> +@@ -6162,6 +6242,11 @@ case $reload_flag in
>   esac
>   reload_cmds=3D'$LD$reload_flag -o $output$reload_objs'
>   case $host_os in
> @@ -7888,7 +7853,7 @@ index 2aeb3317b65..5ef46d31558 100755
>     darwin*)
>       if test "$GCC" =3D yes; then
>         reload_cmds=3D'$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reloa=
d_objs'
> -@@ -6288,7 +6373,8 @@ mingw* | pw32*)
> +@@ -6330,7 +6415,8 @@ mingw* | pw32*)
>       lt_cv_deplibs_check_method=3D'file_magic ^x86 archive import|^x86 D=
LL'
>       lt_cv_file_magic_cmd=3D'func_win32_libid'
>     else
> @@ -7898,7 +7863,7 @@ index 2aeb3317b65..5ef46d31558 100755
>       lt_cv_file_magic_cmd=3D'$OBJDUMP -f'
>     fi
>     ;;
> -@@ -6442,6 +6528,21 @@ esac
> +@@ -6484,6 +6570,21 @@ esac
>   fi
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_m=
ethod" >&5
>   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -7920,7 +7885,7 @@ index 2aeb3317b65..5ef46d31558 100755
>   file_magic_cmd=3D$lt_cv_file_magic_cmd
>   deplibs_check_method=3D$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=3Dunknown
> -@@ -6457,6 +6558,157 @@ test -z "$deplibs_check_method" && deplibs_check=
_method=3Dunknown
> +@@ -6499,6 +6600,157 @@ test -z "$deplibs_check_method" && deplibs_check=
_method=3Dunknown
>
>
>
> @@ -8078,7 +8043,7 @@ index 2aeb3317b65..5ef46d31558 100755
>   plugin_option=3D
>   plugin_names=3D"liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dl=
l"
>   for plugin in $plugin_names; do
> -@@ -6471,8 +6723,10 @@ for plugin in $plugin_names; do
> +@@ -6513,8 +6765,10 @@ for plugin in $plugin_names; do
>   done
>
>   if test -n "$ac_tool_prefix"; then
> @@ -8091,7 +8056,7 @@ index 2aeb3317b65..5ef46d31558 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_AR+:} false; then :
> -@@ -6488,7 +6742,7 @@ do
> +@@ -6530,7 +6784,7 @@ do
>     test -z "$as_dir" && as_dir=3D.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -8100,7 +8065,7 @@ index 2aeb3317b65..5ef46d31558 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_ex=
ec_ext" >&5
>       break 2
>     fi
> -@@ -6508,11 +6762,15 @@ $as_echo "no" >&6; }
> +@@ -6550,11 +6804,15 @@ $as_echo "no" >&6; }
>   fi
>
>
> @@ -8119,7 +8084,7 @@ index 2aeb3317b65..5ef46d31558 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -6528,7 +6786,7 @@ do
> +@@ -6570,7 +6828,7 @@ do
>     test -z "$as_dir" && as_dir=3D.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -8128,7 +8093,7 @@ index 2aeb3317b65..5ef46d31558 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_ex=
ec_ext" >&5
>       break 2
>     fi
> -@@ -6547,6 +6805,10 @@ else
> +@@ -6589,6 +6847,10 @@ else
>   $as_echo "no" >&6; }
>   fi
>
> @@ -8139,7 +8104,7 @@ index 2aeb3317b65..5ef46d31558 100755
>     if test "x$ac_ct_AR" =3D x; then
>       AR=3D"false"
>     else
> -@@ -6558,25 +6820,19 @@ ac_tool_warned=3Dyes ;;
> +@@ -6600,25 +6862,19 @@ ac_tool_warned=3Dyes ;;
>   esac
>       AR=3D$ac_ct_AR
>     fi
> @@ -8174,7 +8139,7 @@ index 2aeb3317b65..5ef46d31558 100755
>
>
>
> -@@ -6588,6 +6844,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=3Dcru
> +@@ -6630,6 +6886,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=3Dcru
>
>
>
> @@ -8239,7 +8204,7 @@ index 2aeb3317b65..5ef46d31558 100755
>   if test -n "$ac_tool_prefix"; then
>     # Extract the first word of "${ac_tool_prefix}strip", so it can be a =
program name with args.
>   set dummy ${ac_tool_prefix}strip; ac_word=3D$2
> -@@ -6927,8 +7241,8 @@ esac
> +@@ -6969,8 +7283,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl=3D"sed -n -e 's/^T .* \(.*\)$/extern i=
nt \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>
>   # Transform an extracted symbol line into symbol name and symbol addres=
s
> @@ -8250,7 +8215,7 @@ index 2aeb3317b65..5ef46d31558 100755
>
>   # Handle CRLF in mingw tool chain
>   opt_cr=3D
> -@@ -6964,6 +7278,7 @@ for ac_symprfx in "" "_"; do
> +@@ -7006,6 +7320,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe=3D"sed -n -e 's/^.*[    ]\($symcode$sy=
mcode*\)[         ][      ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -8258,7 +8223,7 @@ index 2aeb3317b65..5ef46d31558 100755
>
>     # Check to see that the pipe works correctly.
>     pipe_works=3Dno
> -@@ -7005,6 +7320,18 @@ _LT_EOF
> +@@ -7047,6 +7362,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>         if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>           cat <<_LT_EOF > conftest.$ac_ext
> @@ -8277,7 +8242,7 @@ index 2aeb3317b65..5ef46d31558 100755
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -7016,7 +7343,7 @@ _LT_EOF
> +@@ -7058,7 +7385,7 @@ _LT_EOF
>           cat <<_LT_EOF >> conftest.$ac_ext
>
>   /* The mapping between symbol names and symbols.  */
> @@ -8286,7 +8251,7 @@ index 2aeb3317b65..5ef46d31558 100755
>     const char *name;
>     void       *address;
>   }
> -@@ -7042,8 +7369,8 @@ static const void *lt_preloaded_setup() {
> +@@ -7084,8 +7411,8 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>           # Now try linking the two files.
>           mv conftest.$ac_objext conftstm.$ac_objext
> @@ -8297,7 +8262,7 @@ index 2aeb3317b65..5ef46d31558 100755
>           LIBS=3D"conftstm.$ac_objext"
>           CFLAGS=3D"$CFLAGS$lt_prog_compiler_no_builtin_flag"
>           if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\=
""; } >&5
> -@@ -7053,8 +7380,8 @@ _LT_EOF
> +@@ -7095,8 +7422,8 @@ _LT_EOF
>     test $ac_status =3D 0; } && test -s conftest${ac_exeext}; then
>             pipe_works=3Dyes
>           fi
> @@ -8308,7 +8273,7 @@ index 2aeb3317b65..5ef46d31558 100755
>         else
>           echo "cannot find nm_test_func in $nlist" >&5
>         fi
> -@@ -7091,6 +7418,17 @@ else
> +@@ -7133,6 +7460,17 @@ else
>   $as_echo "ok" >&6; }
>   fi
>
> @@ -8326,7 +8291,7 @@ index 2aeb3317b65..5ef46d31558 100755
>
>
>
> -@@ -7107,6 +7445,44 @@ fi
> +@@ -7149,6 +7487,44 @@ fi
>
>
>
> @@ -8371,7 +8336,7 @@ index 2aeb3317b65..5ef46d31558 100755
>
>
>
> -@@ -7318,6 +7694,123 @@ esac
> +@@ -7360,6 +7736,123 @@ esac
>
>   need_locks=3D"$enable_libtool_lock"
>
> @@ -8495,7 +8460,7 @@ index 2aeb3317b65..5ef46d31558 100755
>
>     case $host_os in
>       rhapsody* | darwin*)
> -@@ -7881,6 +8374,8 @@ _LT_EOF
> +@@ -7923,6 +8416,8 @@ _LT_EOF
>         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>         echo "$AR cru libconftest.a conftest.o" >&5
>         $AR cru libconftest.a conftest.o 2>&5
> @@ -8504,7 +8469,7 @@ index 2aeb3317b65..5ef46d31558 100755
>         cat > conftest.c << _LT_EOF
>   int main() { return 0;}
>   _LT_EOF
> -@@ -7949,6 +8444,16 @@ done
> +@@ -7991,6 +8486,16 @@ done
>
>
>
> @@ -8521,7 +8486,7 @@ index 2aeb3317b65..5ef46d31558 100755
>
>
>   # Set options
> -@@ -8464,8 +8970,6 @@ fi
> +@@ -8506,8 +9011,6 @@ fi
>   lt_prog_compiler_pic=3D
>   lt_prog_compiler_static=3D
>
> @@ -8530,7 +8495,7 @@ index 2aeb3317b65..5ef46d31558 100755
>
>     if test "$GCC" =3D yes; then
>       lt_prog_compiler_wl=3D'-Wl,'
> -@@ -8631,6 +9135,12 @@ $as_echo_n "checking for $compiler option to prod=
uce PIC... " >&6; }
> +@@ -8673,6 +9176,12 @@ $as_echo_n "checking for $compiler option to prod=
uce PIC... " >&6; }
>         lt_prog_compiler_pic=3D'--shared'
>         lt_prog_compiler_static=3D'--static'
>         ;;
> @@ -8543,7 +8508,7 @@ index 2aeb3317b65..5ef46d31558 100755
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>         # which looks to be a dead project)
> -@@ -8693,7 +9203,7 @@ $as_echo_n "checking for $compiler option to produ=
ce PIC... " >&6; }
> +@@ -8735,7 +9244,7 @@ $as_echo_n "checking for $compiler option to produ=
ce PIC... " >&6; }
>         lt_prog_compiler_pic=3D'-KPIC'
>         lt_prog_compiler_static=3D'-Bstatic'
>         case $cc_basename in
> @@ -8552,7 +8517,7 @@ index 2aeb3317b65..5ef46d31558 100755
>         lt_prog_compiler_wl=3D'-Qoption ld ';;
>         *)
>         lt_prog_compiler_wl=3D'-Wl,';;
> -@@ -8750,13 +9260,17 @@ case $host_os in
> +@@ -8792,13 +9301,17 @@ case $host_os in
>       lt_prog_compiler_pic=3D"$lt_prog_compiler_pic -DPIC"
>       ;;
>   esac
> @@ -8576,7 +8541,7 @@ index 2aeb3317b65..5ef46d31558 100755
>
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -8817,6 +9331,11 @@ fi
> +@@ -8859,6 +9372,11 @@ fi
>
>
>
> @@ -8588,7 +8553,7 @@ index 2aeb3317b65..5ef46d31558 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -9167,7 +9686,8 @@ _LT_EOF
> +@@ -9209,7 +9727,8 @@ _LT_EOF
>         allow_undefined_flag=3Dunsupported
>         always_export_symbols=3Dno
>         enable_shared_with_static_runtimes=3Dyes
> @@ -8598,7 +8563,7 @@ index 2aeb3317b65..5ef46d31558 100755
>
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags -=
o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-impli=
b -Xlinker $lib'
> -@@ -9266,12 +9786,12 @@ _LT_EOF
> +@@ -9308,12 +9827,12 @@ _LT_EOF
>           whole_archive_flag_spec=3D'--whole-archive$convenience --no-who=
le-archive'
>           hardcode_libdir_flag_spec=3D
>           hardcode_libdir_flag_spec_ld=3D'-rpath $libdir'
> @@ -8613,7 +8578,7 @@ index 2aeb3317b65..5ef46d31558 100755
>           fi
>           ;;
>         esac
> -@@ -9285,8 +9805,8 @@ _LT_EOF
> +@@ -9327,8 +9846,8 @@ _LT_EOF
>         archive_cmds=3D'$LD -Bshareable $libobjs $deplibs $linker_flags -=
o $lib'
>         wlarc=3D
>         else
> @@ -8624,7 +8589,7 @@ index 2aeb3317b65..5ef46d31558 100755
>         fi
>         ;;
>
> -@@ -9304,8 +9824,8 @@ _LT_EOF
> +@@ -9346,8 +9865,8 @@ _LT_EOF
>
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/=
null; then
> @@ -8635,7 +8600,7 @@ index 2aeb3317b65..5ef46d31558 100755
>         else
>         ld_shlibs=3Dno
>         fi
> -@@ -9351,8 +9871,8 @@ _LT_EOF
> +@@ -9393,8 +9912,8 @@ _LT_EOF
>
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/nu=
ll; then
> @@ -8646,7 +8611,7 @@ index 2aeb3317b65..5ef46d31558 100755
>         else
>         ld_shlibs=3Dno
>         fi
> -@@ -9482,7 +10002,13 @@ _LT_EOF
> +@@ -9524,7 +10043,13 @@ _LT_EOF
>         allow_undefined_flag=3D'-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -8661,7 +8626,7 @@ index 2aeb3317b65..5ef46d31558 100755
>   /* end confdefs.h.  */
>
>   int
> -@@ -9495,22 +10021,29 @@ main ()
> +@@ -9537,22 +10062,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>
> @@ -8704,7 +8669,7 @@ index 2aeb3317b65..5ef46d31558 100755
>
>           hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libp=
ath"
>           archive_expsym_cmds=3D'$CC -o $output_objdir/$soname $libobjs $=
deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefin=
ed_flag}" !=3D "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else=
 :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -9522,7 +10055,13 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
> +@@ -9564,7 +10096,13 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
>         else
>          # Determine the default libpath from the value encoded in an
>          # empty executable.
> @@ -8719,7 +8684,7 @@ index 2aeb3317b65..5ef46d31558 100755
>   /* end confdefs.h.  */
>
>   int
> -@@ -9535,22 +10074,29 @@ main ()
> +@@ -9577,22 +10115,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>
> @@ -8762,7 +8727,7 @@ index 2aeb3317b65..5ef46d31558 100755
>
>          hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libpa=
th"
>           # Warning - without using the other run time loading flags,
> -@@ -9594,21 +10140,64 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
> +@@ -9636,21 +10181,64 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
>         # When not using gcc, we currently assume that we are using
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
> @@ -8842,7 +8807,7 @@ index 2aeb3317b65..5ef46d31558 100755
>         ;;
>
>       darwin* | rhapsody*)
> -@@ -9669,7 +10258,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/u=
sr/lib:/lib"; fi
> +@@ -9711,7 +10299,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/u=
sr/lib:/lib"; fi
>
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -8851,7 +8816,7 @@ index 2aeb3317b65..5ef46d31558 100755
>         hardcode_libdir_flag_spec=3D'-R$libdir'
>         hardcode_direct=3Dyes
>         hardcode_shlibpath_var=3Dno
> -@@ -9677,7 +10266,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/u=
sr/lib:/lib"; fi
> +@@ -9719,7 +10307,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/u=
sr/lib:/lib"; fi
>
>       hpux9*)
>         if test "$GCC" =3D yes; then
> @@ -8860,7 +8825,7 @@ index 2aeb3317b65..5ef46d31558 100755
>         else
>         archive_cmds=3D'$RM $output_objdir/$soname~$LD -b +b $install_lib=
dir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_=
objdir/$soname =3D $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -9693,7 +10282,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/u=
sr/lib:/lib"; fi
> +@@ -9735,7 +10323,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/u=
sr/lib:/lib"; fi
>
>       hpux10*)
>         if test "$GCC" =3D yes && test "$with_gnu_ld" =3D no; then
> @@ -8869,7 +8834,7 @@ index 2aeb3317b65..5ef46d31558 100755
>         else
>         archive_cmds=3D'$LD -b +h $soname +b $install_libdir -o $lib $lib=
objs $deplibs $linker_flags'
>         fi
> -@@ -9717,10 +10306,10 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
> +@@ -9759,10 +10347,10 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
>           archive_cmds=3D'$CC -shared ${wl}+h ${wl}$soname -o $lib $libob=
js $deplibs $compiler_flags'
>           ;;
>         ia64*)
> @@ -8882,7 +8847,7 @@ index 2aeb3317b65..5ef46d31558 100755
>           ;;
>         esac
>         else
> -@@ -9799,23 +10388,36 @@ fi
> +@@ -9841,23 +10429,36 @@ fi
>
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" =3D yes; then
> @@ -8927,7 +8892,7 @@ index 2aeb3317b65..5ef46d31558 100755
>         else
>         archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags -so=
name $soname `test -n "$verstring" && func_echo_all "-set_version $verstrin=
g"` -update_registry ${output_objdir}/so_locations -o $lib'
>         archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_fl=
ags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $v=
erstring"` -update_registry ${output_objdir}/so_locations -exports_file $ex=
port_symbols -o $lib'
> -@@ -9900,7 +10502,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9942,7 +10543,7 @@ rm -f core conftest.err conftest.$ac_objext \
>       osf4* | osf5*)    # as osf3* with the addition of -msym flag
>         if test "$GCC" =3D yes; then
>         allow_undefined_flag=3D' ${wl}-expect_unresolved ${wl}\*'
> @@ -8936,7 +8901,7 @@ index 2aeb3317b65..5ef46d31558 100755
>         hardcode_libdir_flag_spec=3D'${wl}-rpath ${wl}$libdir'
>         else
>         allow_undefined_flag=3D' -expect_unresolved \*'
> -@@ -9919,9 +10521,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9961,9 +10562,9 @@ rm -f core conftest.err conftest.$ac_objext \
>         no_undefined_flag=3D' -z defs'
>         if test "$GCC" =3D yes; then
>         wlarc=3D'${wl}'
> @@ -8948,7 +8913,7 @@ index 2aeb3317b65..5ef46d31558 100755
>         else
>         case `$CC -V 2>&1` in
>         *"Compilers 5.0"*)
> -@@ -10497,8 +11099,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10539,8 +11140,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=3Dno
>     need_lib_prefix=3Dno
>
> @@ -8960,7 +8925,7 @@ index 2aeb3317b65..5ef46d31558 100755
>       library_names_spec=3D'$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds=3D'base_file=3D`basename \${file}`~
> -@@ -10531,13 +11134,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10573,13 +11175,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec=3D'`echo ${libname} | sed -e 's/^lib/pw/'``ech=
o ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -9033,25 +8998,16 @@ index 2aeb3317b65..5ef46d31558 100755
>     # FIXME: first we should search . and the directory the executable is=
 in
>     shlibpath_var=3DPATH
>     ;;
> -@@ -10619,7 +11280,7 @@ haiku*)
> -   soname_spec=3D'${libname}${release}${shared_ext}$major'
> -   shlibpath_var=3DLIBRARY_PATH
> -   shlibpath_overrides_runpath=3Dyes
> --  sys_lib_dlsearch_path_spec=3D'/boot/home/config/lib /boot/common/lib =
/boot/beos/system/lib'
> -+  sys_lib_dlsearch_path_spec=3D'/boot/home/config/lib /boot/common/lib =
/boot/system/lib'
> -   hardcode_into_libs=3Dyes
> -   ;;
> -
> -@@ -11415,7 +12076,7 @@ else
> +@@ -11457,7 +12117,7 @@ else
>     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
>     lt_status=3D$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11415 "configure"
> +-#line 11457 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>
>   #if HAVE_DLFCN_H
> -@@ -11459,10 +12120,10 @@ else
> +@@ -11501,10 +12161,10 @@ else
>   /* When -fvisbility=3Dhidden is used, assume the code has been annotate=
d
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=3D =
3)) || (__GNUC__ > 3))
> @@ -9064,16 +9020,16 @@ index 2aeb3317b65..5ef46d31558 100755
>   int main ()
>   {
>     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -11521,7 +12182,7 @@ else
> +@@ -11563,7 +12223,7 @@ else
>     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
>     lt_status=3D$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11521 "configure"
> +-#line 11563 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>
>   #if HAVE_DLFCN_H
> -@@ -11565,10 +12226,10 @@ else
> +@@ -11607,10 +12267,10 @@ else
>   /* When -fvisbility=3Dhidden is used, assume the code has been annotate=
d
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=3D =
3)) || (__GNUC__ > 3))
> @@ -9086,7 +9042,7 @@ index 2aeb3317b65..5ef46d31558 100755
>   int main ()
>   {
>     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -11960,6 +12621,7 @@ $RM -r conftest*
> +@@ -12002,6 +12662,7 @@ $RM -r conftest*
>
>     # Allow CC to be a program name with arguments.
>     lt_save_CC=3D$CC
> @@ -9094,7 +9050,7 @@ index 2aeb3317b65..5ef46d31558 100755
>     lt_save_LD=3D$LD
>     lt_save_GCC=3D$GCC
>     GCC=3D$GXX
> -@@ -11977,6 +12639,7 @@ $RM -r conftest*
> +@@ -12019,6 +12680,7 @@ $RM -r conftest*
>     fi
>     test -z "${LDCXX+set}" || LD=3D$LDCXX
>     CC=3D${CXX-"c++"}
> @@ -9102,7 +9058,7 @@ index 2aeb3317b65..5ef46d31558 100755
>     compiler=3D$CC
>     compiler_CXX=3D$CC
>     for cc_temp in $compiler""; do
> -@@ -12259,7 +12922,13 @@ $as_echo_n "checking whether the $compiler link=
er ($LD) supports shared librarie
> +@@ -12301,7 +12963,13 @@ $as_echo_n "checking whether the $compiler link=
er ($LD) supports shared librarie
>             allow_undefined_flag_CXX=3D'-berok'
>             # Determine the default libpath from the value encoded in an =
empty
>             # executable.
> @@ -9117,7 +9073,7 @@ index 2aeb3317b65..5ef46d31558 100755
>   /* end confdefs.h.  */
>
>   int
> -@@ -12272,22 +12941,29 @@ main ()
> +@@ -12314,22 +12982,29 @@ main ()
>   _ACEOF
>   if ac_fn_cxx_try_link "$LINENO"; then :
>
> @@ -9160,7 +9116,7 @@ index 2aeb3317b65..5ef46d31558 100755
>
>             hardcode_libdir_flag_spec_CXX=3D'${wl}-blibpath:$libdir:'"$ai=
x_libpath"
>
> -@@ -12300,7 +12976,13 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
> +@@ -12342,7 +13017,13 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
>             else
>             # Determine the default libpath from the value encoded in an
>             # empty executable.
> @@ -9175,7 +9131,7 @@ index 2aeb3317b65..5ef46d31558 100755
>   /* end confdefs.h.  */
>
>   int
> -@@ -12313,22 +12995,29 @@ main ()
> +@@ -12355,22 +13036,29 @@ main ()
>   _ACEOF
>   if ac_fn_cxx_try_link "$LINENO"; then :
>
> @@ -9218,7 +9174,7 @@ index 2aeb3317b65..5ef46d31558 100755
>
>             hardcode_libdir_flag_spec_CXX=3D'${wl}-blibpath:$libdir:'"$ai=
x_libpath"
>             # Warning - without using the other run time loading flags,
> -@@ -12371,29 +13060,75 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> +@@ -12413,29 +13101,75 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
>           ;;
>
>         cygwin* | mingw* | pw32* | cegcc*)
> @@ -9317,7 +9273,7 @@ index 2aeb3317b65..5ef46d31558 100755
>         darwin* | rhapsody*)
>
>
> -@@ -12499,7 +13234,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
> +@@ -12541,7 +13275,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
>               ;;
>             *)
>               if test "$GXX" =3D yes; then
> @@ -9326,7 +9282,7 @@ index 2aeb3317b65..5ef46d31558 100755
>               else
>                 # FIXME: insert proper C++ library support
>                 ld_shlibs_CXX=3Dno
> -@@ -12570,10 +13305,10 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> +@@ -12612,10 +13346,10 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
>                     archive_cmds_CXX=3D'$CC -shared -nostdlib -fPIC ${wl}=
+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects =
$compiler_flags'
>                     ;;
>                   ia64*)
> @@ -9339,7 +9295,7 @@ index 2aeb3317b65..5ef46d31558 100755
>                     ;;
>                 esac
>               fi
> -@@ -12614,9 +13349,9 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
> +@@ -12656,9 +13390,9 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
>             *)
>             if test "$GXX" =3D yes; then
>               if test "$with_gnu_ld" =3D no; then
> @@ -9351,7 +9307,7 @@ index 2aeb3317b65..5ef46d31558 100755
>               fi
>             fi
>             link_all_deplibs_CXX=3Dyes
> -@@ -12686,20 +13421,20 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> +@@ -12728,20 +13462,20 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
>               prelink_cmds_CXX=3D'tpldir=3DTemplate.dir~
>                 rm -rf $tpldir~
>                 $CC --prelink_objects --instantiation_dir $tpldir $objs $=
libobjs $compile_deplibs~
> @@ -9376,7 +9332,7 @@ index 2aeb3317b65..5ef46d31558 100755
>               ;;
>             *) # Version 6 and above use weak symbols
>               archive_cmds_CXX=3D'$CC -shared $pic_flag $predep_objects $=
libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname=
 -o $lib'
> -@@ -12894,7 +13629,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
> +@@ -12936,7 +13670,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
>                   archive_cmds_CXX=3D'$CC -shared -nostdlib ${allow_undef=
ined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_fla=
gs ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-=
set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/s=
o_locations -o $lib'
>                   ;;
>                 *)
> @@ -9385,7 +9341,7 @@ index 2aeb3317b65..5ef46d31558 100755
>                   ;;
>               esac
>
> -@@ -12940,7 +13675,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
> +@@ -12982,7 +13716,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
>
>         solaris*)
>           case $cc_basename in
> @@ -9394,7 +9350,7 @@ index 2aeb3317b65..5ef46d31558 100755
>             # Sun C++ 4.2, 5.x and Centerline C++
>               archive_cmds_need_lc_CXX=3Dyes
>             no_undefined_flag_CXX=3D' -zdefs'
> -@@ -12981,9 +13716,9 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
> +@@ -13023,9 +13757,9 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
>             if test "$GXX" =3D yes && test "$with_gnu_ld" =3D no; then
>               no_undefined_flag_CXX=3D' ${wl}-z ${wl}defs'
>               if $CC --version | $GREP -v '^2\.7' > /dev/null; then
> @@ -9406,7 +9362,7 @@ index 2aeb3317b65..5ef46d31558 100755
>
>                 # Commands to make compiler produce verbose output that l=
ists
>                 # what "hidden" libraries, object files and flags are use=
d when
> -@@ -13118,6 +13853,13 @@ private:
> +@@ -13160,6 +13894,13 @@ private:
>   };
>   _LT_EOF
>
> @@ -9420,7 +9376,7 @@ index 2aeb3317b65..5ef46d31558 100755
>   if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; }=
 >&5
>     (eval $ac_compile) 2>&5
>     ac_status=3D$?
> -@@ -13131,7 +13873,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINEN=
O}: \"$ac_compile\""; } >&5
> +@@ -13173,7 +13914,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINEN=
O}: \"$ac_compile\""; } >&5
>     pre_test_object_deps_done=3Dno
>
>     for p in `eval "$output_verbose_link_cmd"`; do
> @@ -9429,7 +9385,7 @@ index 2aeb3317b65..5ef46d31558 100755
>
>       -L* | -R* | -l*)
>          # Some compilers place space between "-{L,R}" and the path.
> -@@ -13140,13 +13882,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LIN=
ENO}: \"$ac_compile\""; } >&5
> +@@ -13182,13 +13923,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LIN=
ENO}: \"$ac_compile\""; } >&5
>             test $p =3D "-R"; then
>          prev=3D$p
>          continue
> @@ -9456,7 +9412,7 @@ index 2aeb3317b65..5ef46d31558 100755
>            # Internal compiler library paths should come after those
>            # provided the user.  The postdeps already come after the
>            # user supplied libs so there is no need to process them.
> -@@ -13166,8 +13917,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINE=
NO}: \"$ac_compile\""; } >&5
> +@@ -13208,8 +13958,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINE=
NO}: \"$ac_compile\""; } >&5
>            postdeps_CXX=3D"${postdeps_CXX} ${prev}${p}"
>          fi
>          fi
> @@ -9467,7 +9423,7 @@ index 2aeb3317b65..5ef46d31558 100755
>       *.$objext)
>          # This assumes that the test object file only shows up
>          # once in the compiler output.
> -@@ -13203,6 +13956,7 @@ else
> +@@ -13245,6 +13997,7 @@ else
>   fi
>
>   $RM -f confest.$objext
> @@ -9475,7 +9431,7 @@ index 2aeb3317b65..5ef46d31558 100755
>
>   # PORTME: override above test on systems where it is broken
>   case $host_os in
> -@@ -13238,7 +13992,7 @@ linux*)
> +@@ -13280,7 +14033,7 @@ linux*)
>
>   solaris*)
>     case $cc_basename in
> @@ -9484,7 +9440,7 @@ index 2aeb3317b65..5ef46d31558 100755
>       # The more standards-conforming stlport4 library is
>       # incompatible with the Cstd library. Avoid specifying
>       # it if it's in CXXFLAGS. Ignore libCrun as
> -@@ -13303,8 +14057,6 @@ fi
> +@@ -13345,8 +14098,6 @@ fi
>   lt_prog_compiler_pic_CXX=3D
>   lt_prog_compiler_static_CXX=3D
>
> @@ -9493,7 +9449,7 @@ index 2aeb3317b65..5ef46d31558 100755
>
>     # C++ specific cases for pic, static, wl, etc.
>     if test "$GXX" =3D yes; then
> -@@ -13409,6 +14161,11 @@ $as_echo_n "checking for $compiler option to pr=
oduce PIC... " >&6; }
> +@@ -13451,6 +14202,11 @@ $as_echo_n "checking for $compiler option to pr=
oduce PIC... " >&6; }
>           ;;
>         esac
>         ;;
> @@ -9505,7 +9461,7 @@ index 2aeb3317b65..5ef46d31558 100755
>         dgux*)
>         case $cc_basename in
>           ec++*)
> -@@ -13561,7 +14318,7 @@ $as_echo_n "checking for $compiler option to pro=
duce PIC... " >&6; }
> +@@ -13603,7 +14359,7 @@ $as_echo_n "checking for $compiler option to pro=
duce PIC... " >&6; }
>         ;;
>         solaris*)
>         case $cc_basename in
> @@ -9514,7 +9470,7 @@ index 2aeb3317b65..5ef46d31558 100755
>             # Sun C++ 4.2, 5.x and Centerline C++
>             lt_prog_compiler_pic_CXX=3D'-KPIC'
>             lt_prog_compiler_static_CXX=3D'-Bstatic'
> -@@ -13626,10 +14383,17 @@ case $host_os in
> +@@ -13668,10 +14424,17 @@ case $host_os in
>       lt_prog_compiler_pic_CXX=3D"$lt_prog_compiler_pic_CXX -DPIC"
>       ;;
>   esac
> @@ -9527,58 +9483,2266 @@ index 2aeb3317b65..5ef46d31558 100755
>  +if ${lt_cv_prog_compiler_pic_CXX+:} false; then :
>  +  $as_echo_n "(cached) " >&6
>  +else
> -+  lt_cv_prog_compiler_pic_CXX=3D$lt_prog_compiler_pic_CXX
> ++  lt_cv_prog_compiler_pic_CXX=3D$lt_prog_compiler_pic_CXX
> ++fi
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_prog_compiler_p=
ic_CXX" >&5
> ++$as_echo "$lt_cv_prog_compiler_pic_CXX" >&6; }
> ++lt_prog_compiler_pic_CXX=3D$lt_cv_prog_compiler_pic_CXX
> +
> + #
> + # Check to make sure the PIC flag actually works.
> +@@ -13729,6 +14492,8 @@ fi
> +
> +
> +
> ++
> ++
> + #
> + # Check to make sure the static flag actually works.
> + #
> +@@ -13906,6 +14671,7 @@ fi
> + $as_echo_n "checking whether the $compiler linker ($LD) supports shared=
 libraries... " >&6; }
> +
> +   export_symbols_cmds_CXX=3D'$NM $libobjs $convenience | $global_symbol=
_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
> ++  exclude_expsyms_CXX=3D'_GLOBAL_OFFSET_TABLE_|_GLOBAL__F[ID]_.*'
> +   case $host_os in
> +   aix[4-9]*)
> +     # If we're using GNU nm, then we don't want the "-C" option.
> +@@ -13920,15 +14686,20 @@ $as_echo_n "checking whether the $compiler lin=
ker ($LD) supports shared librarie
> +     ;;
> +   pw32*)
> +     export_symbols_cmds_CXX=3D"$ltdll_cmds"
> +-  ;;
> ++    ;;
> +   cygwin* | mingw* | cegcc*)
> +-    export_symbols_cmds_CXX=3D'$NM $libobjs $convenience | $global_symb=
ol_pipe | $SED -e '\''/^[BCDGRS][ ]/s/.*[ ]\([^ ]*\)/\1 DATA/;/^.*[ ]__nm__=
/s/^.*[ ]__nm__\([^ ]*\)[ ][^ ]*/\1 DATA/;/^I[ ]/d;/^[AITW][ ]/s/.* //'\'' =
| sort | uniq > $export_symbols'
> +-  ;;
> ++    case $cc_basename in
> ++    cl*) ;;
> ++    *)
> ++      export_symbols_cmds_CXX=3D'$NM $libobjs $convenience | $global_sy=
mbol_pipe | $SED -e '\''/^[BCDGRS][ ]/s/.*[ ]\([^ ]*\)/\1 DATA/;s/^.*[ ]__n=
m__\([^ ]*\)[ ][^ ]*/\1 DATA/;/^I[ ]/d;/^[AITW][ ]/s/.* //'\'' | sort | uni=
q > $export_symbols'
> ++      exclude_expsyms_CXX=3D'[_]+GLOBAL_OFFSET_TABLE_|[_]+GLOBAL__[FID]=
_.*|[_]+head_[A-Za-z0-9_]+_dll|[A-Za-z0-9_]+_dll_iname'
> ++      ;;
> ++    esac
> ++    ;;
> +   *)
> +     export_symbols_cmds_CXX=3D'$NM $libobjs $convenience | $global_symb=
ol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
> +-  ;;
> ++    ;;
> +   esac
> +-  exclude_expsyms_CXX=3D'_GLOBAL_OFFSET_TABLE_|_GLOBAL__F[ID]_.*'
> +
> + { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ld_shlibs_CXX" >&5
> + $as_echo "$ld_shlibs_CXX" >&6; }
> +@@ -14191,8 +14962,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +   need_version=3Dno
> +   need_lib_prefix=3Dno
> +
> +-  case $GCC,$host_os in
> +-  yes,cygwin* | yes,mingw* | yes,pw32* | yes,cegcc*)
> ++  case $GCC,$cc_basename in
> ++  yes,*)
> ++    # gcc
> +     library_names_spec=3D'$libname.dll.a'
> +     # DLL is installed to $(libdir)/../bin by postinstall_cmds
> +     postinstall_cmds=3D'base_file=3D`basename \${file}`~
> +@@ -14224,13 +14996,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +       library_names_spec=3D'`echo ${libname} | sed -e 's/^lib/pw/'``ech=
o ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
> +       ;;
> +     esac
> ++    dynamic_linker=3D'Win32 ld.exe'
> ++    ;;
> ++
> ++  *,cl*)
> ++    # Native MSVC
> ++    libname_spec=3D'$name'
> ++    soname_spec=3D'${libname}`echo ${release} | $SED -e 's/[.]/-/g'`${v=
ersuffix}${shared_ext}'
> ++    library_names_spec=3D'${libname}.dll.lib'
> ++
> ++    case $build_os in
> ++    mingw*)
> ++      sys_lib_search_path_spec=3D
> ++      lt_save_ifs=3D$IFS
> ++      IFS=3D';'
> ++      for lt_path in $LIB
> ++      do
> ++        IFS=3D$lt_save_ifs
> ++        # Let DOS variable expansion print the short 8.3 style file nam=
e.
> ++        lt_path=3D`cd "$lt_path" 2>/dev/null && cmd //C "for %i in ("."=
) do @echo %~si"`
> ++        sys_lib_search_path_spec=3D"$sys_lib_search_path_spec $lt_path"
> ++      done
> ++      IFS=3D$lt_save_ifs
> ++      # Convert to MSYS style.
> ++      sys_lib_search_path_spec=3D`$ECHO "$sys_lib_search_path_spec" | s=
ed -e 's|\\\\|/|g' -e 's| \\([a-zA-Z]\\):| /\\1|g' -e 's|^ ||'`
> ++      ;;
> ++    cygwin*)
> ++      # Convert to unix form, then to dos form, then back to unix form
> ++      # but this time dos style (no spaces!) so that the unix form look=
s
> ++      # like /cygdrive/c/PROGRA~1:/cygdr...
> ++      sys_lib_search_path_spec=3D`cygpath --path --unix "$LIB"`
> ++      sys_lib_search_path_spec=3D`cygpath --path --dos "$sys_lib_search=
_path_spec" 2>/dev/null`
> ++      sys_lib_search_path_spec=3D`cygpath --path --unix "$sys_lib_searc=
h_path_spec" | $SED -e "s/$PATH_SEPARATOR/ /g"`
> ++      ;;
> ++    *)
> ++      sys_lib_search_path_spec=3D"$LIB"
> ++      if $ECHO "$sys_lib_search_path_spec" | $GREP ';[c-zC-Z]:/' >/dev/=
null; then
> ++        # It is most probably a Windows format PATH.
> ++        sys_lib_search_path_spec=3D`$ECHO "$sys_lib_search_path_spec" |=
 $SED -e 's/;/ /g'`
> ++      else
> ++        sys_lib_search_path_spec=3D`$ECHO "$sys_lib_search_path_spec" |=
 $SED -e "s/$PATH_SEPARATOR/ /g"`
> ++      fi
> ++      # FIXME: find the short name or the path components, as spaces ar=
e
> ++      # common. (e.g. "Program Files" -> "PROGRA~1")
> ++      ;;
> ++    esac
> ++
> ++    # DLL is installed to $(libdir)/../bin by postinstall_cmds
> ++    postinstall_cmds=3D'base_file=3D`basename \${file}`~
> ++      dlpath=3D`$SHELL 2>&1 -c '\''. $dir/'\''\${base_file}'\''i; echo =
\$dlname'\''`~
> ++      dldir=3D$destdir/`dirname \$dlpath`~
> ++      test -d \$dldir || mkdir -p \$dldir~
> ++      $install_prog $dir/$dlname \$dldir/$dlname'
> ++    postuninstall_cmds=3D'dldll=3D`$SHELL 2>&1 -c '\''. $file; echo \$d=
lname'\''`~
> ++      dlpath=3D$dir/\$dldll~
> ++       $RM \$dlpath'
> ++    shlibpath_overrides_runpath=3Dyes
> ++    dynamic_linker=3D'Win32 link.exe'
> +     ;;
> +
> +   *)
> ++    # Assume MSVC wrapper
> +     library_names_spec=3D'${libname}`echo ${release} | $SED -e 's/[.]/-=
/g'`${versuffix}${shared_ext} $libname.lib'
> ++    dynamic_linker=3D'Win32 ld.exe'
> +     ;;
> +   esac
> +-  dynamic_linker=3D'Win32 ld.exe'
> +   # FIXME: first we should search . and the directory the executable is=
 in
> +   shlibpath_var=3DPATH
> +   ;;
> +@@ -14770,6 +15600,7 @@ fi
> +   fi # test -n "$compiler"
> +
> +   CC=3D$lt_save_CC
> ++  CFLAGS=3D$lt_save_CFLAGS
> +   LDCXX=3D$LD
> +   LD=3D$lt_save_LD
> +   GCC=3D$lt_save_GCC
> +@@ -17830,13 +18661,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_sing=
le_quote_subst"`'
> + lt_unset=3D'`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
> + lt_SP2NL=3D'`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
> + lt_NL2SP=3D'`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> ++lt_cv_to_host_file_cmd=3D'`$ECHO "$lt_cv_to_host_file_cmd" | $SED "$del=
ay_single_quote_subst"`'
> ++lt_cv_to_tool_file_cmd=3D'`$ECHO "$lt_cv_to_tool_file_cmd" | $SED "$del=
ay_single_quote_subst"`'
> + reload_flag=3D'`$ECHO "$reload_flag" | $SED "$delay_single_quote_subst"=
`'
> + reload_cmds=3D'`$ECHO "$reload_cmds" | $SED "$delay_single_quote_subst"=
`'
> + OBJDUMP=3D'`$ECHO "$OBJDUMP" | $SED "$delay_single_quote_subst"`'
> + deplibs_check_method=3D'`$ECHO "$deplibs_check_method" | $SED "$delay_s=
ingle_quote_subst"`'
> + file_magic_cmd=3D'`$ECHO "$file_magic_cmd" | $SED "$delay_single_quote_=
subst"`'
> ++file_magic_glob=3D'`$ECHO "$file_magic_glob" | $SED "$delay_single_quot=
e_subst"`'
> ++want_nocaseglob=3D'`$ECHO "$want_nocaseglob" | $SED "$delay_single_quot=
e_subst"`'
> ++DLLTOOL=3D'`$ECHO "$DLLTOOL" | $SED "$delay_single_quote_subst"`'
> ++sharedlib_from_linklib_cmd=3D'`$ECHO "$sharedlib_from_linklib_cmd" | $S=
ED "$delay_single_quote_subst"`'
> + AR=3D'`$ECHO "$AR" | $SED "$delay_single_quote_subst"`'
> + AR_FLAGS=3D'`$ECHO "$AR_FLAGS" | $SED "$delay_single_quote_subst"`'
> ++archiver_list_spec=3D'`$ECHO "$archiver_list_spec" | $SED "$delay_singl=
e_quote_subst"`'
> + STRIP=3D'`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
> + RANLIB=3D'`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
> + old_postinstall_cmds=3D'`$ECHO "$old_postinstall_cmds" | $SED "$delay_s=
ingle_quote_subst"`'
> +@@ -17851,14 +18689,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_cv=
_sys_global_symbol_pipe" | $SED "$de
> + lt_cv_sys_global_symbol_to_cdecl=3D'`$ECHO "$lt_cv_sys_global_symbol_to=
_cdecl" | $SED "$delay_single_quote_subst"`'
> + lt_cv_sys_global_symbol_to_c_name_address=3D'`$ECHO "$lt_cv_sys_global_=
symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
> + lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'`$ECHO "$lt_cv_=
sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote=
_subst"`'
> ++nm_file_list_spec=3D'`$ECHO "$nm_file_list_spec" | $SED "$delay_single_=
quote_subst"`'
> ++lt_sysroot=3D'`$ECHO "$lt_sysroot" | $SED "$delay_single_quote_subst"`'
> + objdir=3D'`$ECHO "$objdir" | $SED "$delay_single_quote_subst"`'
> + MAGIC_CMD=3D'`$ECHO "$MAGIC_CMD" | $SED "$delay_single_quote_subst"`'
> + lt_prog_compiler_no_builtin_flag=3D'`$ECHO "$lt_prog_compiler_no_builti=
n_flag" | $SED "$delay_single_quote_subst"`'
> +-lt_prog_compiler_wl=3D'`$ECHO "$lt_prog_compiler_wl" | $SED "$delay_sin=
gle_quote_subst"`'
> + lt_prog_compiler_pic=3D'`$ECHO "$lt_prog_compiler_pic" | $SED "$delay_s=
ingle_quote_subst"`'
> ++lt_prog_compiler_wl=3D'`$ECHO "$lt_prog_compiler_wl" | $SED "$delay_sin=
gle_quote_subst"`'
> + lt_prog_compiler_static=3D'`$ECHO "$lt_prog_compiler_static" | $SED "$d=
elay_single_quote_subst"`'
> + lt_cv_prog_compiler_c_o=3D'`$ECHO "$lt_cv_prog_compiler_c_o" | $SED "$d=
elay_single_quote_subst"`'
> + need_locks=3D'`$ECHO "$need_locks" | $SED "$delay_single_quote_subst"`'
> ++MANIFEST_TOOL=3D'`$ECHO "$MANIFEST_TOOL" | $SED "$delay_single_quote_su=
bst"`'
> + DSYMUTIL=3D'`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
> + NMEDIT=3D'`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
> + LIPO=3D'`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> +@@ -17891,12 +18732,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_sh=
libpath_var" | $SED "$delay_single_q
> + hardcode_automatic=3D'`$ECHO "$hardcode_automatic" | $SED "$delay_singl=
e_quote_subst"`'
> + inherit_rpath=3D'`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_su=
bst"`'
> + link_all_deplibs=3D'`$ECHO "$link_all_deplibs" | $SED "$delay_single_qu=
ote_subst"`'
> +-fix_srcfile_path=3D'`$ECHO "$fix_srcfile_path" | $SED "$delay_single_qu=
ote_subst"`'
> + always_export_symbols=3D'`$ECHO "$always_export_symbols" | $SED "$delay=
_single_quote_subst"`'
> + export_symbols_cmds=3D'`$ECHO "$export_symbols_cmds" | $SED "$delay_sin=
gle_quote_subst"`'
> + exclude_expsyms=3D'`$ECHO "$exclude_expsyms" | $SED "$delay_single_quot=
e_subst"`'
> + include_expsyms=3D'`$ECHO "$include_expsyms" | $SED "$delay_single_quot=
e_subst"`'
> + prelink_cmds=3D'`$ECHO "$prelink_cmds" | $SED "$delay_single_quote_subs=
t"`'
> ++postlink_cmds=3D'`$ECHO "$postlink_cmds" | $SED "$delay_single_quote_su=
bst"`'
> + file_list_spec=3D'`$ECHO "$file_list_spec" | $SED "$delay_single_quote_=
subst"`'
> + variables_saved_for_relink=3D'`$ECHO "$variables_saved_for_relink" | $S=
ED "$delay_single_quote_subst"`'
> + need_lib_prefix=3D'`$ECHO "$need_lib_prefix" | $SED "$delay_single_quot=
e_subst"`'
> +@@ -17935,8 +18776,8 @@ old_archive_cmds_CXX=3D'`$ECHO "$old_archive_cmd=
s_CXX" | $SED "$delay_single_quote
> + compiler_CXX=3D'`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_subs=
t"`'
> + GCC_CXX=3D'`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
> + lt_prog_compiler_no_builtin_flag_CXX=3D'`$ECHO "$lt_prog_compiler_no_bu=
iltin_flag_CXX" | $SED "$delay_single_quote_subst"`'
> +-lt_prog_compiler_wl_CXX=3D'`$ECHO "$lt_prog_compiler_wl_CXX" | $SED "$d=
elay_single_quote_subst"`'
> + lt_prog_compiler_pic_CXX=3D'`$ECHO "$lt_prog_compiler_pic_CXX" | $SED "=
$delay_single_quote_subst"`'
> ++lt_prog_compiler_wl_CXX=3D'`$ECHO "$lt_prog_compiler_wl_CXX" | $SED "$d=
elay_single_quote_subst"`'
> + lt_prog_compiler_static_CXX=3D'`$ECHO "$lt_prog_compiler_static_CXX" | =
$SED "$delay_single_quote_subst"`'
> + lt_cv_prog_compiler_c_o_CXX=3D'`$ECHO "$lt_cv_prog_compiler_c_o_CXX" | =
$SED "$delay_single_quote_subst"`'
> + archive_cmds_need_lc_CXX=3D'`$ECHO "$archive_cmds_need_lc_CXX" | $SED "=
$delay_single_quote_subst"`'
> +@@ -17963,12 +18804,12 @@ hardcode_shlibpath_var_CXX=3D'`$ECHO "$hardcod=
e_shlibpath_var_CXX" | $SED "$delay_
> + hardcode_automatic_CXX=3D'`$ECHO "$hardcode_automatic_CXX" | $SED "$del=
ay_single_quote_subst"`'
> + inherit_rpath_CXX=3D'`$ECHO "$inherit_rpath_CXX" | $SED "$delay_single_=
quote_subst"`'
> + link_all_deplibs_CXX=3D'`$ECHO "$link_all_deplibs_CXX" | $SED "$delay_s=
ingle_quote_subst"`'
> +-fix_srcfile_path_CXX=3D'`$ECHO "$fix_srcfile_path_CXX" | $SED "$delay_s=
ingle_quote_subst"`'
> + always_export_symbols_CXX=3D'`$ECHO "$always_export_symbols_CXX" | $SED=
 "$delay_single_quote_subst"`'
> + export_symbols_cmds_CXX=3D'`$ECHO "$export_symbols_cmds_CXX" | $SED "$d=
elay_single_quote_subst"`'
> + exclude_expsyms_CXX=3D'`$ECHO "$exclude_expsyms_CXX" | $SED "$delay_sin=
gle_quote_subst"`'
> + include_expsyms_CXX=3D'`$ECHO "$include_expsyms_CXX" | $SED "$delay_sin=
gle_quote_subst"`'
> + prelink_cmds_CXX=3D'`$ECHO "$prelink_cmds_CXX" | $SED "$delay_single_qu=
ote_subst"`'
> ++postlink_cmds_CXX=3D'`$ECHO "$postlink_cmds_CXX" | $SED "$delay_single_=
quote_subst"`'
> + file_list_spec_CXX=3D'`$ECHO "$file_list_spec_CXX" | $SED "$delay_singl=
e_quote_subst"`'
> + hardcode_action_CXX=3D'`$ECHO "$hardcode_action_CXX" | $SED "$delay_sin=
gle_quote_subst"`'
> + compiler_lib_search_dirs_CXX=3D'`$ECHO "$compiler_lib_search_dirs_CXX" =
| $SED "$delay_single_quote_subst"`'
> +@@ -18006,8 +18847,13 @@ reload_flag \
> + OBJDUMP \
> + deplibs_check_method \
> + file_magic_cmd \
> ++file_magic_glob \
> ++want_nocaseglob \
> ++DLLTOOL \
> ++sharedlib_from_linklib_cmd \
> + AR \
> + AR_FLAGS \
> ++archiver_list_spec \
> + STRIP \
> + RANLIB \
> + CC \
> +@@ -18017,12 +18863,14 @@ lt_cv_sys_global_symbol_pipe \
> + lt_cv_sys_global_symbol_to_cdecl \
> + lt_cv_sys_global_symbol_to_c_name_address \
> + lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> ++nm_file_list_spec \
> + lt_prog_compiler_no_builtin_flag \
> +-lt_prog_compiler_wl \
> + lt_prog_compiler_pic \
> ++lt_prog_compiler_wl \
> + lt_prog_compiler_static \
> + lt_cv_prog_compiler_c_o \
> + need_locks \
> ++MANIFEST_TOOL \
> + DSYMUTIL \
> + NMEDIT \
> + LIPO \
> +@@ -18038,7 +18886,6 @@ no_undefined_flag \
> + hardcode_libdir_flag_spec \
> + hardcode_libdir_flag_spec_ld \
> + hardcode_libdir_separator \
> +-fix_srcfile_path \
> + exclude_expsyms \
> + include_expsyms \
> + file_list_spec \
> +@@ -18060,8 +18907,8 @@ LD_CXX \
> + reload_flag_CXX \
> + compiler_CXX \
> + lt_prog_compiler_no_builtin_flag_CXX \
> +-lt_prog_compiler_wl_CXX \
> + lt_prog_compiler_pic_CXX \
> ++lt_prog_compiler_wl_CXX \
> + lt_prog_compiler_static_CXX \
> + lt_cv_prog_compiler_c_o_CXX \
> + export_dynamic_flag_spec_CXX \
> +@@ -18073,7 +18920,6 @@ no_undefined_flag_CXX \
> + hardcode_libdir_flag_spec_CXX \
> + hardcode_libdir_flag_spec_ld_CXX \
> + hardcode_libdir_separator_CXX \
> +-fix_srcfile_path_CXX \
> + exclude_expsyms_CXX \
> + include_expsyms_CXX \
> + file_list_spec_CXX \
> +@@ -18107,6 +18953,7 @@ module_cmds \
> + module_expsym_cmds \
> + export_symbols_cmds \
> + prelink_cmds \
> ++postlink_cmds \
> + postinstall_cmds \
> + postuninstall_cmds \
> + finish_cmds \
> +@@ -18121,7 +18968,8 @@ archive_expsym_cmds_CXX \
> + module_cmds_CXX \
> + module_expsym_cmds_CXX \
> + export_symbols_cmds_CXX \
> +-prelink_cmds_CXX; do
> ++prelink_cmds_CXX \
> ++postlink_cmds_CXX; do
> +     case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
> +     *[\\\\\\\`\\"\\\$]*)
> +       eval "lt_\$var=3D\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED -e=
 \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$delay_=
variable_subst\\"\\\`\\\\\\""
> +@@ -18886,7 +19734,8 @@ $as_echo X"$file" |
> + # NOTE: Changes made to this file will be lost: look at ltmain.sh.
> + #
> + #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> +-#                 2006, 2007, 2008, 2009 Free Software Foundation, Inc.
> ++#                 2006, 2007, 2008, 2009, 2010 Free Software Foundation=
,
> ++#                 Inc.
> + #   Written by Gordon Matzigkeit, 1996
> + #
> + #   This file is part of GNU Libtool.
> +@@ -18989,19 +19838,42 @@ SP2NL=3D$lt_lt_SP2NL
> + # turn newlines into spaces.
> + NL2SP=3D$lt_lt_NL2SP
> +
> ++# convert \$build file names to \$host format.
> ++to_host_file_cmd=3D$lt_cv_to_host_file_cmd
> ++
> ++# convert \$build files to toolchain format.
> ++to_tool_file_cmd=3D$lt_cv_to_tool_file_cmd
> ++
> + # An object symbol dumper.
> + OBJDUMP=3D$lt_OBJDUMP
> +
> + # Method to check whether dependent libraries are shared objects.
> + deplibs_check_method=3D$lt_deplibs_check_method
> +
> +-# Command to use when deplibs_check_method =3D=3D "file_magic".
> ++# Command to use when deplibs_check_method =3D "file_magic".
> + file_magic_cmd=3D$lt_file_magic_cmd
> +
> ++# How to find potential files when deplibs_check_method =3D "file_magic=
".
> ++file_magic_glob=3D$lt_file_magic_glob
> ++
> ++# Find potential files using nocaseglob when deplibs_check_method =3D "=
file_magic".
> ++want_nocaseglob=3D$lt_want_nocaseglob
> ++
> ++# DLL creation program.
> ++DLLTOOL=3D$lt_DLLTOOL
> ++
> ++# Command to associate shared and link libraries.
> ++sharedlib_from_linklib_cmd=3D$lt_sharedlib_from_linklib_cmd
> ++
> + # The archiver.
> + AR=3D$lt_AR
> ++
> ++# Flags to create an archive.
> + AR_FLAGS=3D$lt_AR_FLAGS
> +
> ++# How to feed a file listing to the archiver.
> ++archiver_list_spec=3D$lt_archiver_list_spec
> ++
> + # A symbol stripping program.
> + STRIP=3D$lt_STRIP
> +
> +@@ -19031,6 +19903,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_sys=
_global_symbol_to_c_name_address
> + # Transform the output of nm in a C name address pair when lib prefix i=
s needed.
> + global_symbol_to_c_name_address_lib_prefix=3D$lt_lt_cv_sys_global_symbo=
l_to_c_name_address_lib_prefix
> +
> ++# Specify filename containing input files for \$NM.
> ++nm_file_list_spec=3D$lt_nm_file_list_spec
> ++
> ++# The root where to search for dependent libraries,and in which our lib=
raries should be installed.
> ++lt_sysroot=3D$lt_sysroot
> ++
> + # The name of the directory that contains temporary libtool files.
> + objdir=3D$objdir
> +
> +@@ -19040,6 +19918,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> + # Must we lock files when doing compilation?
> + need_locks=3D$lt_need_locks
> +
> ++# Manifest tool.
> ++MANIFEST_TOOL=3D$lt_MANIFEST_TOOL
> ++
> + # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
> + DSYMUTIL=3D$lt_DSYMUTIL
> +
> +@@ -19154,12 +20035,12 @@ with_gcc=3D$GCC
> + # Compiler flag to turn off builtin functions.
> + no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag
> +
> +-# How to pass a linker flag through the compiler.
> +-wl=3D$lt_lt_prog_compiler_wl
> +-
> + # Additional compiler flags for building library objects.
> + pic_flag=3D$lt_lt_prog_compiler_pic
> +
> ++# How to pass a linker flag through the compiler.
> ++wl=3D$lt_lt_prog_compiler_wl
> ++
> + # Compiler flag to prevent dynamic linking.
> + link_static_flag=3D$lt_lt_prog_compiler_static
> +
> +@@ -19246,9 +20127,6 @@ inherit_rpath=3D$inherit_rpath
> + # Whether libtool must link a program against all its dependency librar=
ies.
> + link_all_deplibs=3D$link_all_deplibs
> +
> +-# Fix the shell variable \$srcfile for the compiler.
> +-fix_srcfile_path=3D$lt_fix_srcfile_path
> +-
> + # Set to "yes" if exported symbols are required.
> + always_export_symbols=3D$always_export_symbols
> +
> +@@ -19264,6 +20142,9 @@ include_expsyms=3D$lt_include_expsyms
> + # Commands necessary for linking programs (against libraries) with temp=
lates.
> + prelink_cmds=3D$lt_prelink_cmds
> +
> ++# Commands necessary for finishing linking programs.
> ++postlink_cmds=3D$lt_postlink_cmds
> ++
> + # Specify filename containing input files.
> + file_list_spec=3D$lt_file_list_spec
> +
> +@@ -19310,210 +20191,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> +   # if finds mixed CR/LF and LF-only lines.  Since sed operates in
> +   # text mode, it properly converts lines to CR/LF.  This bash problem
> +   # is reportedly fixed, but why not run on old versions too?
> +-  sed '/^# Generated shell functions inserted here/q' "$ltmain" >> "$cf=
gfile" \
> +-    || (rm -f "$cfgfile"; exit 1)
> +-
> +-  case $xsi_shell in
> +-  yes)
> +-    cat << \_LT_EOF >> "$cfgfile"
> +-
> +-# func_dirname file append nondir_replacement
> +-# Compute the dirname of FILE.  If nonempty, add APPEND to the result,
> +-# otherwise set result to NONDIR_REPLACEMENT.
> +-func_dirname ()
> +-{
> +-  case ${1} in
> +-    */*) func_dirname_result=3D"${1%/*}${2}" ;;
> +-    *  ) func_dirname_result=3D"${3}" ;;
> +-  esac
> +-}
> +-
> +-# func_basename file
> +-func_basename ()
> +-{
> +-  func_basename_result=3D"${1##*/}"
> +-}
> +-
> +-# func_dirname_and_basename file append nondir_replacement
> +-# perform func_basename and func_dirname in a single function
> +-# call:
> +-#   dirname:  Compute the dirname of FILE.  If nonempty,
> +-#             add APPEND to the result, otherwise set result
> +-#             to NONDIR_REPLACEMENT.
> +-#             value returned in "$func_dirname_result"
> +-#   basename: Compute filename of FILE.
> +-#             value retuned in "$func_basename_result"
> +-# Implementation must be kept synchronized with func_dirname
> +-# and func_basename. For efficiency, we do not delegate to
> +-# those functions but instead duplicate the functionality here.
> +-func_dirname_and_basename ()
> +-{
> +-  case ${1} in
> +-    */*) func_dirname_result=3D"${1%/*}${2}" ;;
> +-    *  ) func_dirname_result=3D"${3}" ;;
> +-  esac
> +-  func_basename_result=3D"${1##*/}"
> +-}
> +-
> +-# func_stripname prefix suffix name
> +-# strip PREFIX and SUFFIX off of NAME.
> +-# PREFIX and SUFFIX must not contain globbing or regex special
> +-# characters, hashes, percent signs, but SUFFIX may contain a leading
> +-# dot (in which case that matches only a dot).
> +-func_stripname ()
> +-{
> +-  # pdksh 5.2.14 does not do ${X%$Y} correctly if both X and Y are
> +-  # positional parameters, so assign one to ordinary parameter first.
> +-  func_stripname_result=3D${3}
> +-  func_stripname_result=3D${func_stripname_result#"${1}"}
> +-  func_stripname_result=3D${func_stripname_result%"${2}"}
> +-}
> +-
> +-# func_opt_split
> +-func_opt_split ()
> +-{
> +-  func_opt_split_opt=3D${1%%=3D*}
> +-  func_opt_split_arg=3D${1#*=3D}
> +-}
> +-
> +-# func_lo2o object
> +-func_lo2o ()
> +-{
> +-  case ${1} in
> +-    *.lo) func_lo2o_result=3D${1%.lo}.${objext} ;;
> +-    *)    func_lo2o_result=3D${1} ;;
> +-  esac
> +-}
> +-
> +-# func_xform libobj-or-source
> +-func_xform ()
> +-{
> +-  func_xform_result=3D${1%.*}.lo
> +-}
> +-
> +-# func_arith arithmetic-term...
> +-func_arith ()
> +-{
> +-  func_arith_result=3D$(( $* ))
> +-}
> +-
> +-# func_len string
> +-# STRING may not start with a hyphen.
> +-func_len ()
> +-{
> +-  func_len_result=3D${#1}
> +-}
> +-
> +-_LT_EOF
> +-    ;;
> +-  *) # Bourne compatible functions.
> +-    cat << \_LT_EOF >> "$cfgfile"
> +-
> +-# func_dirname file append nondir_replacement
> +-# Compute the dirname of FILE.  If nonempty, add APPEND to the result,
> +-# otherwise set result to NONDIR_REPLACEMENT.
> +-func_dirname ()
> +-{
> +-  # Extract subdirectory from the argument.
> +-  func_dirname_result=3D`$ECHO "${1}" | $SED "$dirname"`
> +-  if test "X$func_dirname_result" =3D "X${1}"; then
> +-    func_dirname_result=3D"${3}"
> +-  else
> +-    func_dirname_result=3D"$func_dirname_result${2}"
> +-  fi
> +-}
> +-
> +-# func_basename file
> +-func_basename ()
> +-{
> +-  func_basename_result=3D`$ECHO "${1}" | $SED "$basename"`
> +-}
> +-
> +-
> +-# func_stripname prefix suffix name
> +-# strip PREFIX and SUFFIX off of NAME.
> +-# PREFIX and SUFFIX must not contain globbing or regex special
> +-# characters, hashes, percent signs, but SUFFIX may contain a leading
> +-# dot (in which case that matches only a dot).
> +-# func_strip_suffix prefix name
> +-func_stripname ()
> +-{
> +-  case ${2} in
> +-    .*) func_stripname_result=3D`$ECHO "${3}" | $SED "s%^${1}%%; s%\\\\=
${2}\$%%"`;;
> +-    *)  func_stripname_result=3D`$ECHO "${3}" | $SED "s%^${1}%%; s%${2}=
\$%%"`;;
> +-  esac
> +-}
> +-
> +-# sed scripts:
> +-my_sed_long_opt=3D'1s/^\(-[^=3D]*\)=3D.*/\1/;q'
> +-my_sed_long_arg=3D'1s/^-[^=3D]*=3D//'
> +-
> +-# func_opt_split
> +-func_opt_split ()
> +-{
> +-  func_opt_split_opt=3D`$ECHO "${1}" | $SED "$my_sed_long_opt"`
> +-  func_opt_split_arg=3D`$ECHO "${1}" | $SED "$my_sed_long_arg"`
> +-}
> +-
> +-# func_lo2o object
> +-func_lo2o ()
> +-{
> +-  func_lo2o_result=3D`$ECHO "${1}" | $SED "$lo2o"`
> +-}
> +-
> +-# func_xform libobj-or-source
> +-func_xform ()
> +-{
> +-  func_xform_result=3D`$ECHO "${1}" | $SED 's/\.[^.]*$/.lo/'`
> +-}
> +-
> +-# func_arith arithmetic-term...
> +-func_arith ()
> +-{
> +-  func_arith_result=3D`expr "$@"`
> +-}
> +-
> +-# func_len string
> +-# STRING may not start with a hyphen.
> +-func_len ()
> +-{
> +-  func_len_result=3D`expr "$1" : ".*" 2>/dev/null || echo $max_cmd_len`
> +-}
> +-
> +-_LT_EOF
> +-esac
> +-
> +-case $lt_shell_append in
> +-  yes)
> +-    cat << \_LT_EOF >> "$cfgfile"
> +-
> +-# func_append var value
> +-# Append VALUE to the end of shell variable VAR.
> +-func_append ()
> +-{
> +-  eval "$1+=3D\$2"
> +-}
> +-_LT_EOF
> +-    ;;
> +-  *)
> +-    cat << \_LT_EOF >> "$cfgfile"
> +-
> +-# func_append var value
> +-# Append VALUE to the end of shell variable VAR.
> +-func_append ()
> +-{
> +-  eval "$1=3D\$$1\$2"
> +-}
> +-
> +-_LT_EOF
> +-    ;;
> +-  esac
> +-
> +-
> +-  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" >>=
 "$cfgfile" \
> +-    || (rm -f "$cfgfile"; exit 1)
> +-
> +-  mv -f "$cfgfile" "$ofile" ||
> ++  sed '$q' "$ltmain" >> "$cfgfile" \
> ++     || (rm -f "$cfgfile"; exit 1)
> ++
> ++  if test x"$xsi_shell" =3D xyes; then
> ++  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
> ++func_dirname ()\
> ++{\
> ++\    case ${1} in\
> ++\      */*) func_dirname_result=3D"${1%/*}${2}" ;;\
> ++\      *  ) func_dirname_result=3D"${3}" ;;\
> ++\    esac\
> ++} # Extended-shell func_dirname implementation' "$cfgfile" > $cfgfile.t=
mp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfg=
file.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=3D:
> ++
> ++
> ++  sed -e '/^func_basename ()$/,/^} # func_basename /c\
> ++func_basename ()\
> ++{\
> ++\    func_basename_result=3D"${1##*/}"\
> ++} # Extended-shell func_basename implementation' "$cfgfile" > $cfgfile.=
tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfg=
file.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=3D:
> ++
> ++
> ++  sed -e '/^func_dirname_and_basename ()$/,/^} # func_dirname_and_basen=
ame /c\
> ++func_dirname_and_basename ()\
> ++{\
> ++\    case ${1} in\
> ++\      */*) func_dirname_result=3D"${1%/*}${2}" ;;\
> ++\      *  ) func_dirname_result=3D"${3}" ;;\
> ++\    esac\
> ++\    func_basename_result=3D"${1##*/}"\
> ++} # Extended-shell func_dirname_and_basename implementation' "$cfgfile"=
 > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfg=
file.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=3D:
> ++
> ++
> ++  sed -e '/^func_stripname ()$/,/^} # func_stripname /c\
> ++func_stripname ()\
> ++{\
> ++\    # pdksh 5.2.14 does not do ${X%$Y} correctly if both X and Y are\
> ++\    # positional parameters, so assign one to ordinary parameter first=
.\
> ++\    func_stripname_result=3D${3}\
> ++\    func_stripname_result=3D${func_stripname_result#"${1}"}\
> ++\    func_stripname_result=3D${func_stripname_result%"${2}"}\
> ++} # Extended-shell func_stripname implementation' "$cfgfile" > $cfgfile=
.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfg=
file.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=3D:
> ++
> ++
> ++  sed -e '/^func_split_long_opt ()$/,/^} # func_split_long_opt /c\
> ++func_split_long_opt ()\
> ++{\
> ++\    func_split_long_opt_name=3D${1%%=3D*}\
> ++\    func_split_long_opt_arg=3D${1#*=3D}\
> ++} # Extended-shell func_split_long_opt implementation' "$cfgfile" > $cf=
gfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfg=
file.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=3D:
> ++
> ++
> ++  sed -e '/^func_split_short_opt ()$/,/^} # func_split_short_opt /c\
> ++func_split_short_opt ()\
> ++{\
> ++\    func_split_short_opt_arg=3D${1#??}\
> ++\    func_split_short_opt_name=3D${1%"$func_split_short_opt_arg"}\
> ++} # Extended-shell func_split_short_opt implementation' "$cfgfile" > $c=
fgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfg=
file.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=3D:
> ++
> ++
> ++  sed -e '/^func_lo2o ()$/,/^} # func_lo2o /c\
> ++func_lo2o ()\
> ++{\
> ++\    case ${1} in\
> ++\      *.lo) func_lo2o_result=3D${1%.lo}.${objext} ;;\
> ++\      *)    func_lo2o_result=3D${1} ;;\
> ++\    esac\
> ++} # Extended-shell func_lo2o implementation' "$cfgfile" > $cfgfile.tmp =
\
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfg=
file.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=3D:
> ++
> ++
> ++  sed -e '/^func_xform ()$/,/^} # func_xform /c\
> ++func_xform ()\
> ++{\
> ++    func_xform_result=3D${1%.*}.lo\
> ++} # Extended-shell func_xform implementation' "$cfgfile" > $cfgfile.tmp=
 \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfg=
file.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=3D:
> ++
> ++
> ++  sed -e '/^func_arith ()$/,/^} # func_arith /c\
> ++func_arith ()\
> ++{\
> ++    func_arith_result=3D$(( $* ))\
> ++} # Extended-shell func_arith implementation' "$cfgfile" > $cfgfile.tmp=
 \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfg=
file.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=3D:
> ++
> ++
> ++  sed -e '/^func_len ()$/,/^} # func_len /c\
> ++func_len ()\
> ++{\
> ++    func_len_result=3D${#1}\
> ++} # Extended-shell func_len implementation' "$cfgfile" > $cfgfile.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfg=
file.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=3D:
> ++
> ++fi
> ++
> ++if test x"$lt_shell_append" =3D xyes; then
> ++  sed -e '/^func_append ()$/,/^} # func_append /c\
> ++func_append ()\
> ++{\
> ++    eval "${1}+=3D\\${2}"\
> ++} # Extended-shell func_append implementation' "$cfgfile" > $cfgfile.tm=
p \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfg=
file.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=3D:
> ++
> ++
> ++  sed -e '/^func_append_quoted ()$/,/^} # func_append_quoted /c\
> ++func_append_quoted ()\
> ++{\
> ++\    func_quote_for_eval "${2}"\
> ++\    eval "${1}+=3D\\\\ \\$func_quote_for_eval_result"\
> ++} # Extended-shell func_append_quoted implementation' "$cfgfile" > $cfg=
file.tmp \
> ++  && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$cfg=
file.tmp")
> ++test 0 -eq $? || _lt_function_replace_fail=3D:
> ++
> ++
> ++  # Save a `func_append' function call where possible by direct use of =
'+=3D'
> ++  sed -e 's%func_append \([a-zA-Z_]\{1,\}\) "%\1+=3D"%g' $cfgfile > $cf=
gfile.tmp \
> ++    && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++      || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$c=
fgfile.tmp")
> ++  test 0 -eq $? || _lt_function_replace_fail=3D:
> ++else
> ++  # Save a `func_append' function call even when '+=3D' is not availabl=
e
> ++  sed -e 's%func_append \([a-zA-Z_]\{1,\}\) "%\1=3D"$\1%g' $cfgfile > $=
cfgfile.tmp \
> ++    && mv -f "$cfgfile.tmp" "$cfgfile" \
> ++      || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$c=
fgfile.tmp")
> ++  test 0 -eq $? || _lt_function_replace_fail=3D:
> ++fi
> ++
> ++if test x"$_lt_function_replace_fail" =3D x":"; then
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substitut=
e extended shell functions in $ofile" >&5
> ++$as_echo "$as_me: WARNING: Unable to substitute extended shell function=
s in $ofile" >&2;}
> ++fi
> ++
> ++
> ++   mv -f "$cfgfile" "$ofile" ||
> +     (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
> +   chmod +x "$ofile"
> +
> +@@ -19541,12 +20381,12 @@ with_gcc=3D$GCC_CXX
> + # Compiler flag to turn off builtin functions.
> + no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag_CXX
> +
> +-# How to pass a linker flag through the compiler.
> +-wl=3D$lt_lt_prog_compiler_wl_CXX
> +-
> + # Additional compiler flags for building library objects.
> + pic_flag=3D$lt_lt_prog_compiler_pic_CXX
> +
> ++# How to pass a linker flag through the compiler.
> ++wl=3D$lt_lt_prog_compiler_wl_CXX
> ++
> + # Compiler flag to prevent dynamic linking.
> + link_static_flag=3D$lt_lt_prog_compiler_static_CXX
> +
> +@@ -19633,9 +20473,6 @@ inherit_rpath=3D$inherit_rpath_CXX
> + # Whether libtool must link a program against all its dependency librar=
ies.
> + link_all_deplibs=3D$link_all_deplibs_CXX
> +
> +-# Fix the shell variable \$srcfile for the compiler.
> +-fix_srcfile_path=3D$lt_fix_srcfile_path_CXX
> +-
> + # Set to "yes" if exported symbols are required.
> + always_export_symbols=3D$always_export_symbols_CXX
> +
> +@@ -19651,6 +20488,9 @@ include_expsyms=3D$lt_include_expsyms_CXX
> + # Commands necessary for linking programs (against libraries) with temp=
lates.
> + prelink_cmds=3D$lt_prelink_cmds_CXX
> +
> ++# Commands necessary for finishing linking programs.
> ++postlink_cmds=3D$lt_postlink_cmds_CXX
> ++
> + # Specify filename containing input files.
> + file_list_spec=3D$lt_file_list_spec_CXX
> +
> +diff --git a/libbacktrace/configure b/libbacktrace/configure
> +index a2f33c0f35d..90667680701 100755
> +--- a/libbacktrace/configure
> ++++ b/libbacktrace/configure
> +@@ -680,7 +680,10 @@ OTOOL
> + LIPO
> + NMEDIT
> + DSYMUTIL
> ++MANIFEST_TOOL
> ++ac_ct_AR
> + AR
> ++DLLTOOL
> + OBJDUMP
> + LN_S
> + NM
> +@@ -798,6 +801,7 @@ enable_static
> + with_pic
> + enable_fast_install
> + with_gnu_ld
> ++with_libtool_sysroot
> + enable_libtool_lock
> + enable_largefile
> + enable_cet
> +@@ -1458,6 +1462,8 @@ Optional Packages:
> +   --with-pic              try to use only PIC/non-PIC objects [default=
=3Duse
> +                           both]
> +   --with-gnu-ld           assume the C compiler uses GNU ld [default=3D=
no]
> ++  --with-libtool-sysroot=3DDIR Search for dependent libraries within DI=
R
> ++                        (or the compiler's sysroot if not specified).
> +   --with-system-libunwind use installed libunwind
> +
> + Some influential environment variables:
> +@@ -5446,8 +5452,8 @@ esac
> +
> +
> +
> +-macro_version=3D'2.2.7a'
> +-macro_revision=3D'1.3134'
> ++macro_version=3D'2.4'
> ++macro_revision=3D'1.3293'
> +
> +
> +
> +@@ -5487,7 +5493,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> + { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings"=
 >&5
> + $as_echo_n "checking how to print strings... " >&6; }
> + # Test print first, because it will be a builtin if present.
> +-if test "X`print -r -- -n 2>/dev/null`" =3D X-n && \
> ++if test "X`( print -r -- -n ) 2>/dev/null`" =3D X-n && \
> +    test "X`print -r -- $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> +   ECHO=3D'print -r --'
> + elif test "X`printf %s $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> +@@ -5818,48 +5824,49 @@ if ${lt_cv_path_NM+:} false; then :
> +   $as_echo_n "(cached) " >&6
> + else
> +   if test -n "$NM"; then
> +-  # Let the user override the test.
> +-  lt_cv_path_NM=3D"$NM"
> +-else
> +-  lt_nm_to_check=3D"${ac_tool_prefix}nm"
> +-  if test -n "$ac_tool_prefix" && test "$build" =3D "$host"; then
> +-    lt_nm_to_check=3D"$lt_nm_to_check nm"
> +-  fi
> +-  for lt_tmp_nm in $lt_nm_to_check; do
> +-    lt_save_ifs=3D"$IFS"; IFS=3D$PATH_SEPARATOR
> +-    for ac_dir in $PATH /usr/ccs/bin/elf /usr/ccs/bin /usr/ucb /bin; do
> +-      IFS=3D"$lt_save_ifs"
> +-      test -z "$ac_dir" && ac_dir=3D.
> +-      tmp_nm=3D"$ac_dir/$lt_tmp_nm"
> +-      if test -f "$tmp_nm" || test -f "$tmp_nm$ac_exeext" ; then
> +-      # Check to see if the nm accepts a BSD-compat flag.
> +-      # Adding the `sed 1q' prevents false positives on HP-UX, which sa=
ys:
> +-      #   nm: unknown option "B" ignored
> +-      # Tru64's nm complains that /dev/null is an invalid object file
> +-      case `"$tmp_nm" -B /dev/null 2>&1 | sed '1q'` in
> +-      */dev/null* | *'Invalid file or object type'*)
> +-        lt_cv_path_NM=3D"$tmp_nm -B"
> +-        break
> +-        ;;
> +-      *)
> +-        case `"$tmp_nm" -p /dev/null 2>&1 | sed '1q'` in
> +-        */dev/null*)
> +-          lt_cv_path_NM=3D"$tmp_nm -p"
> +-          break
> +-          ;;
> +-        *)
> +-          lt_cv_path_NM=3D${lt_cv_path_NM=3D"$tmp_nm"} # keep the first=
 match, but
> +-          continue # so that we can try to find one that supports BSD f=
lags
> +-          ;;
> +-        esac
> +-        ;;
> +-      esac
> +-      fi
> +-    done
> +-    IFS=3D"$lt_save_ifs"
> +-  done
> +-  : ${lt_cv_path_NM=3Dno}
> +-fi
> ++   # Let the user override the nm to test.
> ++   lt_nm_to_check=3D"$NM"
> ++ else
> ++   lt_nm_to_check=3D"${ac_tool_prefix}nm"
> ++   if test -n "$ac_tool_prefix" && test "$build" =3D "$host"; then
> ++     lt_nm_to_check=3D"$lt_nm_to_check nm"
> ++   fi
> ++ fi
> ++ for lt_tmp_nm in $lt_nm_to_check; do
> ++   lt_save_ifs=3D"$IFS"; IFS=3D$PATH_SEPARATOR
> ++   for ac_dir in $PATH /usr/ccs/bin/elf /usr/ccs/bin /usr/ucb /bin; do
> ++     IFS=3D"$lt_save_ifs"
> ++     test -z "$ac_dir" && ac_dir=3D.
> ++     case "$lt_tmp_nm" in
> ++     */*|*\\*) tmp_nm=3D"$lt_tmp_nm";;
> ++     *) tmp_nm=3D"$ac_dir/$lt_tmp_nm";;
> ++     esac
> ++     if test -f "$tmp_nm" || test -f "$tmp_nm$ac_exeext" ; then
> ++       # Check to see if the nm accepts a BSD-compat flag.
> ++       # Adding the `sed 1q' prevents false positives on HP-UX, which s=
ays:
> ++       #   nm: unknown option "B" ignored
> ++       case `"$tmp_nm" -B "$tmp_nm" 2>&1 | grep -v '^ *$' | sed '1q'` i=
n
> ++       *$tmp_nm*) lt_cv_path_NM=3D"$tmp_nm -B"
> ++       break
> ++       ;;
> ++       *)
> ++       case `"$tmp_nm" -p "$tmp_nm" 2>&1 | grep -v '^ *$' | sed '1q'` i=
n
> ++       *$tmp_nm*)
> ++         lt_cv_path_NM=3D"$tmp_nm -p"
> ++         break
> ++         ;;
> ++       *)
> ++         lt_cv_path_NM=3D${lt_cv_path_NM=3D"$tmp_nm"} # keep the first =
match, but
> ++         continue # so that we can try to find one that supports BSD fl=
ags
> ++         ;;
> ++       esac
> ++       ;;
> ++       esac
> ++     fi
> ++   done
> ++   IFS=3D"$lt_save_ifs"
> ++ done
> ++ : ${lt_cv_path_NM=3Dno}
> + fi
> + { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_path_NM" >&5
> + $as_echo "$lt_cv_path_NM" >&6; }
> +@@ -6173,8 +6180,8 @@ $as_echo_n "checking whether the shell understands=
 some XSI constructs... " >&6;
> + # Try some XSI features
> + xsi_shell=3Dno
> + ( _lt_dummy=3D"a/b/c"
> +-  test "${_lt_dummy##*/},${_lt_dummy%/*},"${_lt_dummy%"$_lt_dummy"}, \
> +-      =3D c,a/b,, \
> ++  test "${_lt_dummy##*/},${_lt_dummy%/*},${_lt_dummy#??}"${_lt_dummy%"$=
_lt_dummy"}, \
> ++      =3D c,a/b,b/c, \
> +     && eval 'test $(( 1 + 1 )) -eq 2 \
> +     && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
> +   && xsi_shell=3Dyes
> +@@ -6223,6 +6230,80 @@ esac
> +
> +
> +
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $build=
 file names to $host format" >&5
> ++$as_echo_n "checking how to convert $build file names to $host format..=
. " >&6; }
> ++if ${lt_cv_to_host_file_cmd+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  case $host in
> ++  *-*-mingw* )
> ++    case $build in
> ++      *-*-mingw* ) # actually msys
> ++        lt_cv_to_host_file_cmd=3Dfunc_convert_file_msys_to_w32
> ++        ;;
> ++      *-*-cygwin* )
> ++        lt_cv_to_host_file_cmd=3Dfunc_convert_file_cygwin_to_w32
> ++        ;;
> ++      * ) # otherwise, assume *nix
> ++        lt_cv_to_host_file_cmd=3Dfunc_convert_file_nix_to_w32
> ++        ;;
> ++    esac
> ++    ;;
> ++  *-*-cygwin* )
> ++    case $build in
> ++      *-*-mingw* ) # actually msys
> ++        lt_cv_to_host_file_cmd=3Dfunc_convert_file_msys_to_cygwin
> ++        ;;
> ++      *-*-cygwin* )
> ++        lt_cv_to_host_file_cmd=3Dfunc_convert_file_noop
> ++        ;;
> ++      * ) # otherwise, assume *nix
> ++        lt_cv_to_host_file_cmd=3Dfunc_convert_file_nix_to_cygwin
> ++        ;;
> ++    esac
> ++    ;;
> ++  * ) # unhandled hosts (and "normal" native builds)
> ++    lt_cv_to_host_file_cmd=3Dfunc_convert_file_noop
> ++    ;;
> ++esac
> ++
> ++fi
> ++
> ++to_host_file_cmd=3D$lt_cv_to_host_file_cmd
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_to_host_file_cm=
d" >&5
> ++$as_echo "$lt_cv_to_host_file_cmd" >&6; }
> ++
> ++
> ++
> ++
> ++
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $build=
 file names to toolchain format" >&5
> ++$as_echo_n "checking how to convert $build file names to toolchain form=
at... " >&6; }
> ++if ${lt_cv_to_tool_file_cmd+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  #assume ordinary cross tools, or native build.
> ++lt_cv_to_tool_file_cmd=3Dfunc_convert_file_noop
> ++case $host in
> ++  *-*-mingw* )
> ++    case $build in
> ++      *-*-mingw* ) # actually msys
> ++        lt_cv_to_tool_file_cmd=3Dfunc_convert_file_msys_to_w32
> ++        ;;
> ++    esac
> ++    ;;
> ++esac
> ++
> ++fi
> ++
> ++to_tool_file_cmd=3D$lt_cv_to_tool_file_cmd
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_to_tool_file_cm=
d" >&5
> ++$as_echo "$lt_cv_to_tool_file_cmd" >&6; }
> ++
> ++
> ++
> ++
> ++
> + { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to rel=
oad object files" >&5
> + $as_echo_n "checking for $LD option to reload object files... " >&6; }
> + if ${lt_cv_ld_reload_flag+:} false; then :
> +@@ -6239,6 +6320,11 @@ case $reload_flag in
> + esac
> + reload_cmds=3D'$LD$reload_flag -o $output$reload_objs'
> + case $host_os in
> ++  cygwin* | mingw* | pw32* | cegcc*)
> ++    if test "$GCC" !=3D yes; then
> ++      reload_cmds=3Dfalse
> ++    fi
> ++    ;;
> +   darwin*)
> +     if test "$GCC" =3D yes; then
> +       reload_cmds=3D'$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reloa=
d_objs'
> +@@ -6407,7 +6493,8 @@ mingw* | pw32*)
> +     lt_cv_deplibs_check_method=3D'file_magic ^x86 archive import|^x86 D=
LL'
> +     lt_cv_file_magic_cmd=3D'func_win32_libid'
> +   else
> +-    lt_cv_deplibs_check_method=3D'file_magic file format pei*-i386(.*ar=
chitecture: i386)?'
> ++    # Keep this pattern in sync with the one in func_win32_libid.
> ++    lt_cv_deplibs_check_method=3D'file_magic file format (pei*-i386(.*a=
rchitecture: i386)?|pe-arm-wince|pe-x86-64)'
> +     lt_cv_file_magic_cmd=3D'$OBJDUMP -f'
> +   fi
> +   ;;
> +@@ -6480,7 +6567,7 @@ irix5* | irix6* | nonstopux*)
> +   ;;
> +
> + # This must be Linux ELF.
> +-linux* | k*bsd*-gnu | kopensolaris*-gnu | uclinuxfdpiceabi)
> ++linux* | k*bsd*-gnu | kopensolaris*-gnu)
> +   lt_cv_deplibs_check_method=3Dpass_all
> +   ;;
> +
> +@@ -6561,6 +6648,21 @@ esac
> + fi
> + { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_m=
ethod" >&5
> + $as_echo "$lt_cv_deplibs_check_method" >&6; }
> ++
> ++file_magic_glob=3D
> ++want_nocaseglob=3Dno
> ++if test "$build" =3D "$host"; then
> ++  case $host_os in
> ++  mingw* | pw32*)
> ++    if ( shopt | grep nocaseglob ) >/dev/null 2>&1; then
> ++      want_nocaseglob=3Dyes
> ++    else
> ++      file_magic_glob=3D`echo aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTu=
UvVwWxXyYzZ | $SED -e "s/\(..\)/s\/[\1]\/[\1]\/g;/g"`
> ++    fi
> ++    ;;
> ++  esac
> ++fi
> ++
> + file_magic_cmd=3D$lt_cv_file_magic_cmd
> + deplibs_check_method=3D$lt_cv_deplibs_check_method
> + test -z "$deplibs_check_method" && deplibs_check_method=3Dunknown
> +@@ -6574,11 +6676,177 @@ test -z "$deplibs_check_method" && deplibs_chec=
k_method=3Dunknown
> +
> +
> +
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> +
> +
> + if test -n "$ac_tool_prefix"; then
> +-  # Extract the first word of "${ac_tool_prefix}ar", so it can be a pro=
gram name with args.
> +-set dummy ${ac_tool_prefix}ar; ac_word=3D$2
> ++  # Extract the first word of "${ac_tool_prefix}dlltool", so it can be =
a program name with args.
> ++set dummy ${ac_tool_prefix}dlltool; ac_word=3D$2
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> ++$as_echo_n "checking for $ac_word... " >&6; }
> ++if ${ac_cv_prog_DLLTOOL+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  if test -n "$DLLTOOL"; then
> ++  ac_cv_prog_DLLTOOL=3D"$DLLTOOL" # Let the user override the test.
> ++else
> ++as_save_IFS=3D$IFS; IFS=3D$PATH_SEPARATOR
> ++for as_dir in $PATH
> ++do
> ++  IFS=3D$as_save_IFS
> ++  test -z "$as_dir" && as_dir=3D.
> ++    for ac_exec_ext in '' $ac_executable_extensions; do
> ++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> ++    ac_cv_prog_DLLTOOL=3D"${ac_tool_prefix}dlltool"
> ++    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_ex=
ec_ext" >&5
> ++    break 2
> ++  fi
> ++done
> ++  done
> ++IFS=3D$as_save_IFS
> ++
> ++fi
> ++fi
> ++DLLTOOL=3D$ac_cv_prog_DLLTOOL
> ++if test -n "$DLLTOOL"; then
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $DLLTOOL" >&5
> ++$as_echo "$DLLTOOL" >&6; }
> ++else
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> ++$as_echo "no" >&6; }
> ++fi
> ++
> ++
> ++fi
> ++if test -z "$ac_cv_prog_DLLTOOL"; then
> ++  ac_ct_DLLTOOL=3D$DLLTOOL
> ++  # Extract the first word of "dlltool", so it can be a program name wi=
th args.
> ++set dummy dlltool; ac_word=3D$2
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> ++$as_echo_n "checking for $ac_word... " >&6; }
> ++if ${ac_cv_prog_ac_ct_DLLTOOL+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  if test -n "$ac_ct_DLLTOOL"; then
> ++  ac_cv_prog_ac_ct_DLLTOOL=3D"$ac_ct_DLLTOOL" # Let the user override t=
he test.
> ++else
> ++as_save_IFS=3D$IFS; IFS=3D$PATH_SEPARATOR
> ++for as_dir in $PATH
> ++do
> ++  IFS=3D$as_save_IFS
> ++  test -z "$as_dir" && as_dir=3D.
> ++    for ac_exec_ext in '' $ac_executable_extensions; do
> ++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> ++    ac_cv_prog_ac_ct_DLLTOOL=3D"dlltool"
> ++    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_ex=
ec_ext" >&5
> ++    break 2
> ++  fi
> ++done
> ++  done
> ++IFS=3D$as_save_IFS
> ++
> ++fi
> ++fi
> ++ac_ct_DLLTOOL=3D$ac_cv_prog_ac_ct_DLLTOOL
> ++if test -n "$ac_ct_DLLTOOL"; then
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_DLLTOOL" >&5
> ++$as_echo "$ac_ct_DLLTOOL" >&6; }
> ++else
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> ++$as_echo "no" >&6; }
> ++fi
> ++
> ++  if test "x$ac_ct_DLLTOOL" =3D x; then
> ++    DLLTOOL=3D"false"
> ++  else
> ++    case $cross_compiling:$ac_tool_warned in
> ++yes:)
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not=
 prefixed with host triplet" >&5
> ++$as_echo "$as_me: WARNING: using cross tools not prefixed with host tri=
plet" >&2;}
> ++ac_tool_warned=3Dyes ;;
> ++esac
> ++    DLLTOOL=3D$ac_ct_DLLTOOL
> ++  fi
> ++else
> ++  DLLTOOL=3D"$ac_cv_prog_DLLTOOL"
> ++fi
> ++
> ++test -z "$DLLTOOL" && DLLTOOL=3Ddlltool
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to associate runt=
ime and link libraries" >&5
> ++$as_echo_n "checking how to associate runtime and link libraries... " >=
&6; }
> ++if ${lt_cv_sharedlib_from_linklib_cmd+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  lt_cv_sharedlib_from_linklib_cmd=3D'unknown'
> ++
> ++case $host_os in
> ++cygwin* | mingw* | pw32* | cegcc*)
> ++  # two different shell functions defined in ltmain.sh
> ++  # decide which to use based on capabilities of $DLLTOOL
> ++  case `$DLLTOOL --help 2>&1` in
> ++  *--identify-strict*)
> ++    lt_cv_sharedlib_from_linklib_cmd=3Dfunc_cygming_dll_for_implib
> ++    ;;
> ++  *)
> ++    lt_cv_sharedlib_from_linklib_cmd=3Dfunc_cygming_dll_for_implib_fall=
back
> ++    ;;
> ++  esac
> ++  ;;
> ++*)
> ++  # fallback: assume linklib IS sharedlib
> ++  lt_cv_sharedlib_from_linklib_cmd=3D"$ECHO"
> ++  ;;
> ++esac
> ++
> ++fi
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_sharedlib_from_=
linklib_cmd" >&5
> ++$as_echo "$lt_cv_sharedlib_from_linklib_cmd" >&6; }
> ++sharedlib_from_linklib_cmd=3D$lt_cv_sharedlib_from_linklib_cmd
> ++test -z "$sharedlib_from_linklib_cmd" && sharedlib_from_linklib_cmd=3D$=
ECHO
> ++
> ++
> ++
> ++
> ++
> ++
> ++
> ++plugin_option=3D
> ++plugin_names=3D"liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dl=
l"
> ++for plugin in $plugin_names; do
> ++  plugin_so=3D`${CC} ${CFLAGS} --print-prog-name $plugin`
> ++  if test x$plugin_so =3D x$plugin; then
> ++    plugin_so=3D`${CC} ${CFLAGS} --print-file-name $plugin`
> ++  fi
> ++  if test x$plugin_so !=3D x$plugin; then
> ++    plugin_option=3D"--plugin $plugin_so"
> ++    break
> ++  fi
> ++done
> ++
> ++if test -n "$ac_tool_prefix"; then
> ++  for ac_prog in ar
> ++  do
> ++    # Extract the first word of "$ac_tool_prefix$ac_prog", so it can be=
 a program name with args.
> ++set dummy $ac_tool_prefix$ac_prog; ac_word=3D$2
> + { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> + $as_echo_n "checking for $ac_word... " >&6; }
> + if ${ac_cv_prog_AR+:} false; then :
> +@@ -6594,7 +6862,7 @@ do
> +   test -z "$as_dir" && as_dir=3D.
> +     for ac_exec_ext in '' $ac_executable_extensions; do
> +   if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> +-    ac_cv_prog_AR=3D"${ac_tool_prefix}ar"
> ++    ac_cv_prog_AR=3D"$ac_tool_prefix$ac_prog"
> +     $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_ex=
ec_ext" >&5
> +     break 2
> +   fi
> +@@ -6614,11 +6882,15 @@ $as_echo "no" >&6; }
> + fi
> +
> +
> ++    test -n "$AR" && break
> ++  done
> + fi
> +-if test -z "$ac_cv_prog_AR"; then
> ++if test -z "$AR"; then
> +   ac_ct_AR=3D$AR
> +-  # Extract the first word of "ar", so it can be a program name with ar=
gs.
> +-set dummy ar; ac_word=3D$2
> ++  for ac_prog in ar
> ++do
> ++  # Extract the first word of "$ac_prog", so it can be a program name w=
ith args.
> ++set dummy $ac_prog; ac_word=3D$2
> + { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> + $as_echo_n "checking for $ac_word... " >&6; }
> + if ${ac_cv_prog_ac_ct_AR+:} false; then :
> +@@ -6634,7 +6906,7 @@ do
> +   test -z "$as_dir" && as_dir=3D.
> +     for ac_exec_ext in '' $ac_executable_extensions; do
> +   if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> +-    ac_cv_prog_ac_ct_AR=3D"ar"
> ++    ac_cv_prog_ac_ct_AR=3D"$ac_prog"
> +     $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_ex=
ec_ext" >&5
> +     break 2
> +   fi
> +@@ -6653,6 +6925,10 @@ else
> + $as_echo "no" >&6; }
> + fi
> +
> ++
> ++  test -n "$ac_ct_AR" && break
> ++done
> ++
> +   if test "x$ac_ct_AR" =3D x; then
> +     AR=3D"false"
> +   else
> +@@ -6664,12 +6940,21 @@ ac_tool_warned=3Dyes ;;
> + esac
> +     AR=3D$ac_ct_AR
> +   fi
> +-else
> +-  AR=3D"$ac_cv_prog_AR"
> + fi
> +
> +-test -z "$AR" && AR=3Dar
> +-test -z "$AR_FLAGS" && AR_FLAGS=3Dcru
> ++  touch conftest.c
> ++  $AR $plugin_option rc conftest.a conftest.c
> ++  if test "$?" !=3D 0; then
> ++    { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Failed: $AR $plug=
in_option rc" >&5
> ++$as_echo "$as_me: WARNING: Failed: $AR $plugin_option rc" >&2;}
> ++  else
> ++    AR=3D"$AR $plugin_option"
> ++  fi
> ++  rm -f conftest.*
> ++: ${AR=3Dar}
> ++: ${AR_FLAGS=3Dcru}
> ++
> ++
> +
> +
> +
> +@@ -6679,6 +6964,62 @@ test -z "$AR_FLAGS" && AR_FLAGS=3Dcru
> +
> +
> +
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE su=
pport" >&5
> ++$as_echo_n "checking for archiver @FILE support... " >&6; }
> ++if ${lt_cv_ar_at_file+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  lt_cv_ar_at_file=3Dno
> ++   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> ++/* end confdefs.h.  */
> ++
> ++int
> ++main ()
> ++{
> ++
> ++  ;
> ++  return 0;
> ++}
> ++_ACEOF
> ++if ac_fn_c_try_compile "$LINENO"; then :
> ++  echo conftest.$ac_objext > conftest.lst
> ++      lt_ar_try=3D'$AR $AR_FLAGS libconftest.a @conftest.lst >&5'
> ++      { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$lt_ar_try\"";=
 } >&5
> ++  (eval $lt_ar_try) 2>&5
> ++  ac_status=3D$?
> ++  $as_echo "$as_me:${as_lineno-$LINENO}: \$? =3D $ac_status" >&5
> ++  test $ac_status =3D 0; }
> ++      if test "$ac_status" -eq 0; then
> ++      # Ensure the archiver fails upon bogus file names.
> ++      rm -f conftest.$ac_objext libconftest.a
> ++      { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$lt_ar_try\"";=
 } >&5
> ++  (eval $lt_ar_try) 2>&5
> ++  ac_status=3D$?
> ++  $as_echo "$as_me:${as_lineno-$LINENO}: \$? =3D $ac_status" >&5
> ++  test $ac_status =3D 0; }
> ++      if test "$ac_status" -ne 0; then
> ++          lt_cv_ar_at_file=3D@
> ++        fi
> ++      fi
> ++      rm -f conftest.* libconftest.a
> ++
> ++fi
> ++rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
> ++
> ++fi
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_ar_at_file" >&5
> ++$as_echo "$lt_cv_ar_at_file" >&6; }
> ++
> ++if test "x$lt_cv_ar_at_file" =3D xno; then
> ++  archiver_list_spec=3D
> ++else
> ++  archiver_list_spec=3D$lt_cv_ar_at_file
> ++fi
> ++
> ++
> ++
> ++
> ++
> +
> +
> + if test -n "$ac_tool_prefix"; then
> +@@ -6873,6 +7214,11 @@ else
> + fi
> +
> + test -z "$RANLIB" && RANLIB=3D:
> ++if test -n "$plugin_option" && test "$RANLIB" !=3D ":"; then
> ++  if $RANLIB --help 2>&1 | grep -q "\--plugin"; then
> ++    RANLIB=3D"$RANLIB $plugin_option"
> ++  fi
> ++fi
> +
> +
> +
> +@@ -6987,7 +7333,7 @@ osf*)
> +   symcode=3D'[BCDEGQRST]'
> +   ;;
> + solaris*)
> +-  symcode=3D'[BDRT]'
> ++  symcode=3D'[BCDRT]'
> +   ;;
> + sco3.2v5*)
> +   symcode=3D'[DT]'
> +@@ -7015,8 +7361,8 @@ esac
> + lt_cv_sys_global_symbol_to_cdecl=3D"sed -n -e 's/^T .* \(.*\)$/extern i=
nt \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
> +
> + # Transform an extracted symbol line into symbol name and symbol addres=
s
> +-lt_cv_sys_global_symbol_to_c_name_address=3D"sed -n -e 's/^: \([^ ]*\) =
$/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([^ ]*\) \([^ ]*\)$/  {\=
"\2\", (void *) \&\2},/p'"
> +-lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D"sed -n -e 's/^:=
 \([^ ]*\) $/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([^ ]*\) \(li=
b[^ ]*\)$/  {\"\2\", (void *) \&\2},/p' -e 's/^$symcode* \([^ ]*\) \([^ ]*\=
)$/  {\"lib\2\", (void *) \&\2},/p'"
> ++lt_cv_sys_global_symbol_to_c_name_address=3D"sed -n -e 's/^: \([^ ]*\)[=
 ]*$/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([^ ]*\) \([^ ]*\)$/ =
 {\"\2\", (void *) \&\2},/p'"
> ++lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D"sed -n -e 's/^:=
 \([^ ]*\)[ ]*$/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([^ ]*\) \=
(lib[^ ]*\)$/  {\"\2\", (void *) \&\2},/p' -e 's/^$symcode* \([^ ]*\) \([^ =
]*\)$/  {\"lib\2\", (void *) \&\2},/p'"
> +
> + # Handle CRLF in mingw tool chain
> + opt_cr=3D
> +@@ -7052,6 +7398,7 @@ for ac_symprfx in "" "_"; do
> +   else
> +     lt_cv_sys_global_symbol_pipe=3D"sed -n -e 's/^.*[    ]\($symcode$sy=
mcode*\)[         ][      ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
> +   fi
> ++  lt_cv_sys_global_symbol_pipe=3D"$lt_cv_sys_global_symbol_pipe | sed '=
/ __gnu_lto/d'"
> +
> +   # Check to see that the pipe works correctly.
> +   pipe_works=3Dno
> +@@ -7093,6 +7440,18 @@ _LT_EOF
> +       if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
> +       if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
> +         cat <<_LT_EOF > conftest.$ac_ext
> ++/* Keep this code in sync between libtool.m4, ltmain, lt_system.h, and =
tests.  */
> ++#if defined(_WIN32) || defined(__CYGWIN__) || defined(_WIN32_WCE)
> ++/* DATA imports from DLLs on WIN32 con't be const, because runtime
> ++   relocations are performed -- see ld's documentation on pseudo-relocs=
.  */
> ++# define LT_DLSYM_CONST
> ++#elif defined(__osf__)
> ++/* This system does not cope well with relocations in const data.  */
> ++# define LT_DLSYM_CONST
> ++#else
> ++# define LT_DLSYM_CONST const
> ++#endif
> ++
> + #ifdef __cplusplus
> + extern "C" {
> + #endif
> +@@ -7104,7 +7463,7 @@ _LT_EOF
> +         cat <<_LT_EOF >> conftest.$ac_ext
> +
> + /* The mapping between symbol names and symbols.  */
> +-const struct {
> ++LT_DLSYM_CONST struct {
> +   const char *name;
> +   void       *address;
> + }
> +@@ -7130,8 +7489,8 @@ static const void *lt_preloaded_setup() {
> + _LT_EOF
> +         # Now try linking the two files.
> +         mv conftest.$ac_objext conftstm.$ac_objext
> +-        lt_save_LIBS=3D"$LIBS"
> +-        lt_save_CFLAGS=3D"$CFLAGS"
> ++        lt_globsym_save_LIBS=3D$LIBS
> ++        lt_globsym_save_CFLAGS=3D$CFLAGS
> +         LIBS=3D"conftstm.$ac_objext"
> +         CFLAGS=3D"$CFLAGS$lt_prog_compiler_no_builtin_flag"
> +         if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\=
""; } >&5
> +@@ -7141,8 +7500,8 @@ _LT_EOF
> +   test $ac_status =3D 0; } && test -s conftest${ac_exeext}; then
> +           pipe_works=3Dyes
> +         fi
> +-        LIBS=3D"$lt_save_LIBS"
> +-        CFLAGS=3D"$lt_save_CFLAGS"
> ++        LIBS=3D$lt_globsym_save_LIBS
> ++        CFLAGS=3D$lt_globsym_save_CFLAGS
> +       else
> +         echo "cannot find nm_test_func in $nlist" >&5
> +       fi
> +@@ -7179,6 +7538,17 @@ else
> + $as_echo "ok" >&6; }
> + fi
> +
> ++# Response file support.
> ++if test "$lt_cv_nm_interface" =3D "MS dumpbin"; then
> ++  nm_file_list_spec=3D'@'
> ++elif $NM --help 2>/dev/null | grep '[@]FILE' >/dev/null; then
> ++  nm_file_list_spec=3D'@'
> ++fi
> ++
> ++
> ++
> ++
> ++
> +
> +
> +
> +@@ -7195,6 +7565,44 @@ fi
> +
> +
> +
> ++
> ++
> ++
> ++
> ++
> ++
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
> ++$as_echo_n "checking for sysroot... " >&6; }
> ++
> ++# Check whether --with-libtool-sysroot was given.
> ++if test "${with_libtool_sysroot+set}" =3D set; then :
> ++  withval=3D$with_libtool_sysroot;
> ++else
> ++  with_libtool_sysroot=3Dno
> ++fi
> ++
> ++
> ++lt_sysroot=3D
> ++case ${with_libtool_sysroot} in #(
> ++ yes)
> ++   if test "$GCC" =3D yes; then
> ++     lt_sysroot=3D`$CC --print-sysroot 2>/dev/null`
> ++   fi
> ++   ;; #(
> ++ /*)
> ++   lt_sysroot=3D`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subs=
t"`
> ++   ;; #(
> ++ no|'')
> ++   ;; #(
> ++ *)
> ++   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_sysr=
oot}" >&5
> ++$as_echo "${with_libtool_sysroot}" >&6; }
> ++   as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
> ++   ;;
> ++esac
> ++
> ++ { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&=
5
> ++$as_echo "${lt_sysroot:-no}" >&6; }
> +
> +
> +
> +@@ -7372,39 +7780,156 @@ ac_link=3D'$CC -o conftest$ac_exeext $CFLAGS $C=
PPFLAGS $LDFLAGS conftest.$ac_ext $
> + ac_compiler_gnu=3D$ac_cv_c_compiler_gnu
> +
> + fi
> +-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_cc_needs_belf" =
>&5
> +-$as_echo "$lt_cv_cc_needs_belf" >&6; }
> +-  if test x"$lt_cv_cc_needs_belf" !=3D x"yes"; then
> +-    # this is probably gcc 2.8.0, egcs 1.0 or newer; no need for -belf
> +-    CFLAGS=3D"$SAVE_CFLAGS"
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_cc_needs_belf" =
>&5
> ++$as_echo "$lt_cv_cc_needs_belf" >&6; }
> ++  if test x"$lt_cv_cc_needs_belf" !=3D x"yes"; then
> ++    # this is probably gcc 2.8.0, egcs 1.0 or newer; no need for -belf
> ++    CFLAGS=3D"$SAVE_CFLAGS"
> ++  fi
> ++  ;;
> ++sparc*-*solaris*)
> ++  # Find out which ABI we are using.
> ++  echo 'int i;' > conftest.$ac_ext
> ++  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\"";=
 } >&5
> ++  (eval $ac_compile) 2>&5
> ++  ac_status=3D$?
> ++  $as_echo "$as_me:${as_lineno-$LINENO}: \$? =3D $ac_status" >&5
> ++  test $ac_status =3D 0; }; then
> ++    case `/usr/bin/file conftest.o` in
> ++    *64-bit*)
> ++      case $lt_cv_prog_gnu_ld in
> ++      yes*) LD=3D"${LD-ld} -m elf64_sparc" ;;
> ++      *)
> ++      if ${LD-ld} -64 -r -o conftest2.o conftest.o >/dev/null 2>&1; the=
n
> ++        LD=3D"${LD-ld} -64"
> ++      fi
> ++      ;;
> ++      esac
> ++      ;;
> ++    esac
> ++  fi
> ++  rm -rf conftest*
> ++  ;;
> ++esac
> ++
> ++need_locks=3D"$enable_libtool_lock"
> ++
> ++if test -n "$ac_tool_prefix"; then
> ++  # Extract the first word of "${ac_tool_prefix}mt", so it can be a pro=
gram name with args.
> ++set dummy ${ac_tool_prefix}mt; ac_word=3D$2
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> ++$as_echo_n "checking for $ac_word... " >&6; }
> ++if ${ac_cv_prog_MANIFEST_TOOL+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  if test -n "$MANIFEST_TOOL"; then
> ++  ac_cv_prog_MANIFEST_TOOL=3D"$MANIFEST_TOOL" # Let the user override t=
he test.
> ++else
> ++as_save_IFS=3D$IFS; IFS=3D$PATH_SEPARATOR
> ++for as_dir in $PATH
> ++do
> ++  IFS=3D$as_save_IFS
> ++  test -z "$as_dir" && as_dir=3D.
> ++    for ac_exec_ext in '' $ac_executable_extensions; do
> ++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> ++    ac_cv_prog_MANIFEST_TOOL=3D"${ac_tool_prefix}mt"
> ++    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_ex=
ec_ext" >&5
> ++    break 2
> ++  fi
> ++done
> ++  done
> ++IFS=3D$as_save_IFS
> ++
> ++fi
> ++fi
> ++MANIFEST_TOOL=3D$ac_cv_prog_MANIFEST_TOOL
> ++if test -n "$MANIFEST_TOOL"; then
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $MANIFEST_TOOL" >&5
> ++$as_echo "$MANIFEST_TOOL" >&6; }
> ++else
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> ++$as_echo "no" >&6; }
> ++fi
> ++
> ++
> ++fi
> ++if test -z "$ac_cv_prog_MANIFEST_TOOL"; then
> ++  ac_ct_MANIFEST_TOOL=3D$MANIFEST_TOOL
> ++  # Extract the first word of "mt", so it can be a program name with ar=
gs.
> ++set dummy mt; ac_word=3D$2
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> ++$as_echo_n "checking for $ac_word... " >&6; }
> ++if ${ac_cv_prog_ac_ct_MANIFEST_TOOL+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  if test -n "$ac_ct_MANIFEST_TOOL"; then
> ++  ac_cv_prog_ac_ct_MANIFEST_TOOL=3D"$ac_ct_MANIFEST_TOOL" # Let the use=
r override the test.
> ++else
> ++as_save_IFS=3D$IFS; IFS=3D$PATH_SEPARATOR
> ++for as_dir in $PATH
> ++do
> ++  IFS=3D$as_save_IFS
> ++  test -z "$as_dir" && as_dir=3D.
> ++    for ac_exec_ext in '' $ac_executable_extensions; do
> ++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> ++    ac_cv_prog_ac_ct_MANIFEST_TOOL=3D"mt"
> ++    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_ex=
ec_ext" >&5
> ++    break 2
> ++  fi
> ++done
> ++  done
> ++IFS=3D$as_save_IFS
> ++
> ++fi
> ++fi
> ++ac_ct_MANIFEST_TOOL=3D$ac_cv_prog_ac_ct_MANIFEST_TOOL
> ++if test -n "$ac_ct_MANIFEST_TOOL"; then
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_MANIFEST_TOOL=
" >&5
> ++$as_echo "$ac_ct_MANIFEST_TOOL" >&6; }
> ++else
> ++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> ++$as_echo "no" >&6; }
> ++fi
> ++
> ++  if test "x$ac_ct_MANIFEST_TOOL" =3D x; then
> ++    MANIFEST_TOOL=3D":"
> ++  else
> ++    case $cross_compiling:$ac_tool_warned in
> ++yes:)
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not=
 prefixed with host triplet" >&5
> ++$as_echo "$as_me: WARNING: using cross tools not prefixed with host tri=
plet" >&2;}
> ++ac_tool_warned=3Dyes ;;
> ++esac
> ++    MANIFEST_TOOL=3D$ac_ct_MANIFEST_TOOL
> +   fi
> +-  ;;
> +-sparc*-*solaris*)
> +-  # Find out which ABI we are using.
> +-  echo 'int i;' > conftest.$ac_ext
> +-  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\"";=
 } >&5
> +-  (eval $ac_compile) 2>&5
> +-  ac_status=3D$?
> +-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? =3D $ac_status" >&5
> +-  test $ac_status =3D 0; }; then
> +-    case `/usr/bin/file conftest.o` in
> +-    *64-bit*)
> +-      case $lt_cv_prog_gnu_ld in
> +-      yes*) LD=3D"${LD-ld} -m elf64_sparc" ;;
> +-      *)
> +-      if ${LD-ld} -64 -r -o conftest2.o conftest.o >/dev/null 2>&1; the=
n
> +-        LD=3D"${LD-ld} -64"
> +-      fi
> +-      ;;
> +-      esac
> +-      ;;
> +-    esac
> ++else
> ++  MANIFEST_TOOL=3D"$ac_cv_prog_MANIFEST_TOOL"
> ++fi
> ++
> ++test -z "$MANIFEST_TOOL" && MANIFEST_TOOL=3Dmt
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking if $MANIFEST_TOOL is =
a manifest tool" >&5
> ++$as_echo_n "checking if $MANIFEST_TOOL is a manifest tool... " >&6; }
> ++if ${lt_cv_path_mainfest_tool+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  lt_cv_path_mainfest_tool=3Dno
> ++  echo "$as_me:$LINENO: $MANIFEST_TOOL '-?'" >&5
> ++  $MANIFEST_TOOL '-?' 2>conftest.err > conftest.out
> ++  cat conftest.err >&5
> ++  if $GREP 'Manifest Tool' conftest.out > /dev/null; then
> ++    lt_cv_path_mainfest_tool=3Dyes
> +   fi
> +-  rm -rf conftest*
> +-  ;;
> +-esac
> ++  rm -f conftest*
> ++fi
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_path_mainfest_t=
ool" >&5
> ++$as_echo "$lt_cv_path_mainfest_tool" >&6; }
> ++if test "x$lt_cv_path_mainfest_tool" !=3D xyes; then
> ++  MANIFEST_TOOL=3D:
> ++fi
> ++
> ++
> ++
> +
> +-need_locks=3D"$enable_libtool_lock"
> +
> +
> +   case $host_os in
> +@@ -7969,6 +8494,8 @@ _LT_EOF
> +       $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
> +       echo "$AR cru libconftest.a conftest.o" >&5
> +       $AR cru libconftest.a conftest.o 2>&5
> ++      echo "$RANLIB libconftest.a" >&5
> ++      $RANLIB libconftest.a 2>&5
> +       cat > conftest.c << _LT_EOF
> + int main() { return 0;}
> + _LT_EOF
> +@@ -7986,25 +8513,23 @@ _LT_EOF
> + fi
> + { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_ld_force_load" =
>&5
> + $as_echo "$lt_cv_ld_force_load" >&6; }
> +-    # Allow for Darwin 4-7 (macOS 10.0-10.3) although these are not exp=
ect to
> +-    # build without first building modern cctools / linker.
> +-    case $host_cpu-$host_os in
> +-    *-rhapsody* | *-darwin1.[012])
> ++    case $host_os in
> ++    rhapsody* | darwin1.[012])
> +       _lt_dar_allow_undefined=3D'${wl}-undefined ${wl}suppress' ;;
> +-    *-darwin1.*)
> ++    darwin1.*)
> +       _lt_dar_allow_undefined=3D'${wl}-flat_namespace ${wl}-undefined $=
{wl}suppress' ;;
> +-    *-darwin*)
> +-      # darwin 5.x (macOS 10.1) onwards we only need to adjust when the
> +-      # deployment target is forced to an earlier version.
> +-      case ${MACOSX_DEPLOYMENT_TARGET-UNSET},$host in
> +-      UNSET,*-darwin[89]*|UNSET,*-darwin[12][0123456789]*)
> +-        ;;
> ++    darwin*) # darwin 5.x on
> ++      # if running on 10.5 or later, the deployment target defaults
> ++      # to the OS version, if on x86, and 10.4, the deployment
> ++      # target defaults to 10.4. Don't you love it?
> ++      case ${MACOSX_DEPLOYMENT_TARGET-10.0},$host in
> ++      10.0,*86*-darwin8*|10.0,*-darwin[91]*)
> ++        _lt_dar_allow_undefined=3D'${wl}-undefined ${wl}dynamic_lookup'=
 ;;
> +       10.[012][,.]*)
> +-        _lt_dar_allow_undefined=3D'${wl}-flat_namespace ${wl}-undefined=
 ${wl}suppress'
> +-        ;;
> +-      *)
> +-        ;;
> +-     esac
> ++        _lt_dar_allow_undefined=3D'${wl}-flat_namespace ${wl}-undefined=
 ${wl}suppress' ;;
> ++      10.*)
> ++        _lt_dar_allow_undefined=3D'${wl}-undefined ${wl}dynamic_lookup'=
 ;;
> ++      esac
> +     ;;
> +   esac
> +     if test "$lt_cv_apple_cc_single_mod" =3D "yes"; then
> +@@ -8553,8 +9078,6 @@ fi
> + lt_prog_compiler_pic=3D
> + lt_prog_compiler_static=3D
> +
> +-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $compiler option =
to produce PIC" >&5
> +-$as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> +
> +   if test "$GCC" =3D yes; then
> +     lt_prog_compiler_wl=3D'-Wl,'
> +@@ -8720,6 +9243,12 @@ $as_echo_n "checking for $compiler option to prod=
uce PIC... " >&6; }
> +       lt_prog_compiler_pic=3D'--shared'
> +       lt_prog_compiler_static=3D'--static'
> +       ;;
> ++      nagfor*)
> ++      # NAG Fortran compiler
> ++      lt_prog_compiler_wl=3D'-Wl,-Wl,,'
> ++      lt_prog_compiler_pic=3D'-PIC'
> ++      lt_prog_compiler_static=3D'-Bstatic'
> ++      ;;
> +       pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
> +         # Portland Group compilers (*not* the Pentium gcc compiler,
> +       # which looks to be a dead project)
> +@@ -8782,7 +9311,7 @@ $as_echo_n "checking for $compiler option to produ=
ce PIC... " >&6; }
> +       lt_prog_compiler_pic=3D'-KPIC'
> +       lt_prog_compiler_static=3D'-Bstatic'
> +       case $cc_basename in
> +-      f77* | f90* | f95*)
> ++      f77* | f90* | f95* | sunf77* | sunf90* | sunf95*)
> +       lt_prog_compiler_wl=3D'-Qoption ld ';;
> +       *)
> +       lt_prog_compiler_wl=3D'-Wl,';;
> +@@ -8839,13 +9368,17 @@ case $host_os in
> +     lt_prog_compiler_pic=3D"$lt_prog_compiler_pic -DPIC"
> +     ;;
> + esac
> +-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_prog_compiler_pic"=
 >&5
> +-$as_echo "$lt_prog_compiler_pic" >&6; }
> +-
> +-
> +-
> +-
> +
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $compiler option =
to produce PIC" >&5
> ++$as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> ++if ${lt_cv_prog_compiler_pic+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  lt_cv_prog_compiler_pic=3D$lt_prog_compiler_pic
> ++fi
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_prog_compiler_p=
ic" >&5
> ++$as_echo "$lt_cv_prog_compiler_pic" >&6; }
> ++lt_prog_compiler_pic=3D$lt_cv_prog_compiler_pic
> +
> + #
> + # Check to make sure the PIC flag actually works.
> +@@ -8906,6 +9439,11 @@ fi
> +
> +
> +
> ++
> ++
> ++
> ++
> ++
> + #
> + # Check to make sure the static flag actually works.
> + #
> +@@ -9256,7 +9794,8 @@ _LT_EOF
> +       allow_undefined_flag=3Dunsupported
> +       always_export_symbols=3Dno
> +       enable_shared_with_static_runtimes=3Dyes
> +-      export_symbols_cmds=3D'$NM $libobjs $convenience | $global_symbol=
_pipe | $SED -e '\''/^[BCDGRS][ ]/s/.*[ ]\([^ ]*\)/\1 DATA/'\'' | $SED -e '=
\''/^[AITW][ ]/s/.*[ ]//'\'' | sort | uniq > $export_symbols'
> ++      export_symbols_cmds=3D'$NM $libobjs $convenience | $global_symbol=
_pipe | $SED -e '\''/^[BCDGRS][ ]/s/.*[ ]\([^ ]*\)/\1 DATA/;s/^.*[ ]__nm__\=
([^ ]*\)[ ][^ ]*/\1 DATA/;/^I[ ]/d;/^[AITW][ ]/s/.* //'\'' | sort | uniq > =
$export_symbols'
> ++      exclude_expsyms=3D'[_]+GLOBAL_OFFSET_TABLE_|[_]+GLOBAL__[FID]_.*|=
[_]+head_[A-Za-z0-9_]+_dll|[A-Za-z0-9_]+_dll_iname'
> +
> +       if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
> +         archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags -=
o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-impli=
b -Xlinker $lib'
> +@@ -9294,7 +9833,7 @@ _LT_EOF
> +       archive_expsym_cmds=3D'sed "s,^,_," $export_symbols >$output_objd=
ir/$soname.expsym~$CC -shared $pic_flag $libobjs $deplibs $compiler_flags $=
{wl}-h,$soname ${wl}--retain-symbols-file,$output_objdir/$soname.expsym ${w=
l}--image-base,`expr ${RANDOM-$$} % 4096 / 2 \* 262144 + 1342177280` -o $li=
b'
> +       ;;
> +
> +-    gnu* | linux* | tpf* | k*bsd*-gnu | kopensolaris*-gnu | uclinuxfdpi=
ceabi)
> ++    gnu* | linux* | tpf* | k*bsd*-gnu | kopensolaris*-gnu)
> +       tmp_diet=3Dno
> +       if test "$host_os" =3D linux-dietlibc; then
> +       case $cc_basename in
> +@@ -9355,12 +9894,12 @@ _LT_EOF
> +         whole_archive_flag_spec=3D'--whole-archive$convenience --no-who=
le-archive'
> +         hardcode_libdir_flag_spec=3D
> +         hardcode_libdir_flag_spec_ld=3D'-rpath $libdir'
> +-        archive_cmds=3D'$LD -shared $libobjs $deplibs $compiler_flags -=
soname $soname -o $lib'
> ++        archive_cmds=3D'$LD -shared $libobjs $deplibs $linker_flags -so=
name $soname -o $lib'
> +         if test "x$supports_anon_versioning" =3D xyes; then
> +           archive_expsym_cmds=3D'echo "{ global:" > $output_objdir/$lib=
name.ver~
> +             cat $export_symbols | sed -e "s/\(.*\)/\1;/" >> $output_obj=
dir/$libname.ver~
> +             echo "local: *; };" >> $output_objdir/$libname.ver~
> +-            $LD -shared $libobjs $deplibs $compiler_flags -soname $sona=
me -version-script $output_objdir/$libname.ver -o $lib'
> ++            $LD -shared $libobjs $deplibs $linker_flags -soname $soname=
 -version-script $output_objdir/$libname.ver -o $lib'
> +         fi
> +         ;;
> +       esac
> +@@ -9374,8 +9913,8 @@ _LT_EOF
> +       archive_cmds=3D'$LD -Bshareable $libobjs $deplibs $linker_flags -=
o $lib'
> +       wlarc=3D
> +       else
> +-      archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags ${w=
l}-soname $wl$soname -o $lib'
> +-      archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_fl=
ags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o=
 $lib'
> ++      archive_cmds=3D'$CC -shared $pic_flag $libobjs $deplibs $compiler=
_flags ${wl}-soname $wl$soname -o $lib'
> ++      archive_expsym_cmds=3D'$CC -shared $pic_flag $libobjs $deplibs $c=
ompiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_=
symbols -o $lib'
> +       fi
> +       ;;
> +
> +@@ -9393,8 +9932,8 @@ _LT_EOF
> +
> + _LT_EOF
> +       elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/=
null; then
> +-      archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags ${w=
l}-soname $wl$soname -o $lib'
> +-      archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_fl=
ags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o=
 $lib'
> ++      archive_cmds=3D'$CC -shared $pic_flag $libobjs $deplibs $compiler=
_flags ${wl}-soname $wl$soname -o $lib'
> ++      archive_expsym_cmds=3D'$CC -shared $pic_flag $libobjs $deplibs $c=
ompiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_=
symbols -o $lib'
> +       else
> +       ld_shlibs=3Dno
> +       fi
> +@@ -9440,8 +9979,8 @@ _LT_EOF
> +
> +     *)
> +       if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/nu=
ll; then
> +-      archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags ${w=
l}-soname $wl$soname -o $lib'
> +-      archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_fl=
ags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o=
 $lib'
> ++      archive_cmds=3D'$CC -shared $pic_flag $libobjs $deplibs $compiler=
_flags ${wl}-soname $wl$soname -o $lib'
> ++      archive_expsym_cmds=3D'$CC -shared $pic_flag $libobjs $deplibs $c=
ompiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_=
symbols -o $lib'
> +       else
> +       ld_shlibs=3Dno
> +       fi
> +@@ -9571,7 +10110,13 @@ _LT_EOF
> +       allow_undefined_flag=3D'-berok'
> +         # Determine the default libpath from the value encoded in an
> +         # empty executable.
> +-        cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> ++        if test "${lt_cv_aix_libpath+set}" =3D set; then
> ++  aix_libpath=3D$lt_cv_aix_libpath
> ++else
> ++  if ${lt_cv_aix_libpath_+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> + /* end confdefs.h.  */
> +
> + int
> +@@ -9584,22 +10129,29 @@ main ()
> + _ACEOF
> + if ac_fn_c_try_link "$LINENO"; then :
> +
> +-lt_aix_libpath_sed=3D'
> +-    /Import File Strings/,/^$/ {
> +-      /^0/ {
> +-          s/^0  *\(.*\)$/\1/
> +-          p
> +-      }
> +-    }'
> +-aix_libpath=3D`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt=
_aix_libpath_sed"`
> +-# Check for a 64-bit object if we didn't find anything.
> +-if test -z "$aix_libpath"; then
> +-  aix_libpath=3D`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n -e=
 "$lt_aix_libpath_sed"`
> +-fi
> ++  lt_aix_libpath_sed=3D'
> ++      /Import File Strings/,/^$/ {
> ++        /^0/ {
> ++            s/^0  *\([^ ]*\) *$/\1/
> ++            p
> ++        }
> ++      }'
> ++  lt_cv_aix_libpath_=3D`dump -H conftest$ac_exeext 2>/dev/null | $SED -=
n -e "$lt_aix_libpath_sed"`
> ++  # Check for a 64-bit object if we didn't find anything.
> ++  if test -z "$lt_cv_aix_libpath_"; then
> ++    lt_cv_aix_libpath_=3D`dump -HX64 conftest$ac_exeext 2>/dev/null | $=
SED -n -e "$lt_aix_libpath_sed"`
> ++  fi
> + fi
> + rm -f core conftest.err conftest.$ac_objext \
> +     conftest$ac_exeext conftest.$ac_ext
> +-if test -z "$aix_libpath"; then aix_libpath=3D"/usr/lib:/lib"; fi
> ++  if test -z "$lt_cv_aix_libpath_"; then
> ++    lt_cv_aix_libpath_=3D"/usr/lib:/lib"
> ++  fi
> ++
> ++fi
> ++
> ++  aix_libpath=3D$lt_cv_aix_libpath_
> ++fi
> +
> +         hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libp=
ath"
> +         archive_expsym_cmds=3D'$CC -o $output_objdir/$soname $libobjs $=
deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefin=
ed_flag}" !=3D "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else=
 :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> +@@ -9611,7 +10163,13 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
> +       else
> +        # Determine the default libpath from the value encoded in an
> +        # empty executable.
> +-       cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> ++       if test "${lt_cv_aix_libpath+set}" =3D set; then
> ++  aix_libpath=3D$lt_cv_aix_libpath
> ++else
> ++  if ${lt_cv_aix_libpath_+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> + /* end confdefs.h.  */
> +
> + int
> +@@ -9624,22 +10182,29 @@ main ()
> + _ACEOF
> + if ac_fn_c_try_link "$LINENO"; then :
> +
> +-lt_aix_libpath_sed=3D'
> +-    /Import File Strings/,/^$/ {
> +-      /^0/ {
> +-          s/^0  *\(.*\)$/\1/
> +-          p
> +-      }
> +-    }'
> +-aix_libpath=3D`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$lt=
_aix_libpath_sed"`
> +-# Check for a 64-bit object if we didn't find anything.
> +-if test -z "$aix_libpath"; then
> +-  aix_libpath=3D`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n -e=
 "$lt_aix_libpath_sed"`
> +-fi
> ++  lt_aix_libpath_sed=3D'
> ++      /Import File Strings/,/^$/ {
> ++        /^0/ {
> ++            s/^0  *\([^ ]*\) *$/\1/
> ++            p
> ++        }
> ++      }'
> ++  lt_cv_aix_libpath_=3D`dump -H conftest$ac_exeext 2>/dev/null | $SED -=
n -e "$lt_aix_libpath_sed"`
> ++  # Check for a 64-bit object if we didn't find anything.
> ++  if test -z "$lt_cv_aix_libpath_"; then
> ++    lt_cv_aix_libpath_=3D`dump -HX64 conftest$ac_exeext 2>/dev/null | $=
SED -n -e "$lt_aix_libpath_sed"`
> ++  fi
> + fi
> + rm -f core conftest.err conftest.$ac_objext \
> +     conftest$ac_exeext conftest.$ac_ext
> +-if test -z "$aix_libpath"; then aix_libpath=3D"/usr/lib:/lib"; fi
> ++  if test -z "$lt_cv_aix_libpath_"; then
> ++    lt_cv_aix_libpath_=3D"/usr/lib:/lib"
> ++  fi
> ++
> ++fi
> ++
> ++  aix_libpath=3D$lt_cv_aix_libpath_
> ++fi
> +
> +        hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libpa=
th"
> +         # Warning - without using the other run time loading flags,
> +@@ -9684,20 +10249,63 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
> +       # Microsoft Visual C++.
> +       # hardcode_libdir_flag_spec is actually meaningless, as there is
> +       # no search path for DLLs.
> +-      hardcode_libdir_flag_spec=3D' '
> +-      allow_undefined_flag=3Dunsupported
> +-      # Tell ltmain to make .lib files, not .a files.
> +-      libext=3Dlib
> +-      # Tell ltmain to make .dll files, not .so files.
> +-      shrext_cmds=3D".dll"
> +-      # FIXME: Setting linknames here is a bad hack.
> +-      archive_cmds=3D'$CC -o $lib $libobjs $compiler_flags `func_echo_a=
ll "$deplibs" | $SED '\''s/ -lc$//'\''` -link -dll~linknames=3D'
> +-      # The linker will automatically build a .lib file if we build a D=
LL.
> +-      old_archive_from_new_cmds=3D'true'
> +-      # FIXME: Should let the user specify the lib program.
> +-      old_archive_cmds=3D'lib -OUT:$oldlib$oldobjs$old_deplibs'
> +-      fix_srcfile_path=3D'`cygpath -w "$srcfile"`'
> +-      enable_shared_with_static_runtimes=3Dyes
> ++      case $cc_basename in
> ++      cl*)
> ++      # Native MSVC
> ++      hardcode_libdir_flag_spec=3D' '
> ++      allow_undefined_flag=3Dunsupported
> ++      always_export_symbols=3Dyes
> ++      file_list_spec=3D'@'
> ++      # Tell ltmain to make .lib files, not .a files.
> ++      libext=3Dlib
> ++      # Tell ltmain to make .dll files, not .so files.
> ++      shrext_cmds=3D".dll"
> ++      # FIXME: Setting linknames here is a bad hack.
> ++      archive_cmds=3D'$CC -o $output_objdir/$soname $libobjs $compiler_=
flags $deplibs -Wl,-dll~linknames=3D'
> ++      archive_expsym_cmds=3D'if test "x`$SED 1q $export_symbols`" =3D x=
EXPORTS; then
> ++          sed -n -e 's/\\\\\\\(.*\\\\\\\)/-link\\\ -EXPORT:\\\\\\\1/' -=
e '1\\\!p' < $export_symbols > $output_objdir/$soname.exp;
> ++        else
> ++          sed -e 's/\\\\\\\(.*\\\\\\\)/-link\\\ -EXPORT:\\\\\\\1/' < $e=
xport_symbols > $output_objdir/$soname.exp;
> ++        fi~
> ++        $CC -o $tool_output_objdir$soname $libobjs $compiler_flags $dep=
libs "@$tool_output_objdir$soname.exp" -Wl,-DLL,-IMPLIB:"$tool_output_objdi=
r$libname.dll.lib"~
> ++        linknames=3D'
> ++      # The linker will not automatically build a static lib if we buil=
d a DLL.
> ++      # _LT_TAGVAR(old_archive_from_new_cmds, )=3D'true'
> ++      enable_shared_with_static_runtimes=3Dyes
> ++      export_symbols_cmds=3D'$NM $libobjs $convenience | $global_symbol=
_pipe | $SED -e '\''/^[BCDGRS][ ]/s/.*[ ]\([^ ]*\)/\1,DATA/'\'' | $SED -e '=
\''/^[AITW][ ]/s/.*[ ]//'\'' | sort | uniq > $export_symbols'
> ++      # Don't use ranlib
> ++      old_postinstall_cmds=3D'chmod 644 $oldlib'
> ++      postlink_cmds=3D'lt_outputfile=3D"@OUTPUT@"~
> ++        lt_tool_outputfile=3D"@TOOL_OUTPUT@"~
> ++        case $lt_outputfile in
> ++          *.exe|*.EXE) ;;
> ++          *)
> ++            lt_outputfile=3D"$lt_outputfile.exe"
> ++            lt_tool_outputfile=3D"$lt_tool_outputfile.exe"
> ++            ;;
> ++        esac~
> ++        if test "$MANIFEST_TOOL" !=3D ":" && test -f "$lt_outputfile.ma=
nifest"; then
> ++          $MANIFEST_TOOL -manifest "$lt_tool_outputfile.manifest" -outp=
utresource:"$lt_tool_outputfile" || exit 1;
> ++          $RM "$lt_outputfile.manifest";
> ++        fi'
> ++      ;;
> ++      *)
> ++      # Assume MSVC wrapper
> ++      hardcode_libdir_flag_spec=3D' '
> ++      allow_undefined_flag=3Dunsupported
> ++      # Tell ltmain to make .lib files, not .a files.
> ++      libext=3Dlib
> ++      # Tell ltmain to make .dll files, not .so files.
> ++      shrext_cmds=3D".dll"
> ++      # FIXME: Setting linknames here is a bad hack.
> ++      archive_cmds=3D'$CC -o $lib $libobjs $compiler_flags `func_echo_a=
ll "$deplibs" | $SED '\''s/ -lc$//'\''` -link -dll~linknames=3D'
> ++      # The linker will automatically build a .lib file if we build a D=
LL.
> ++      old_archive_from_new_cmds=3D'true'
> ++      # FIXME: Should let the user specify the lib program.
> ++      old_archive_cmds=3D'lib -OUT:$oldlib$oldobjs$old_deplibs'
> ++      enable_shared_with_static_runtimes=3Dyes
> ++      ;;
> ++      esac
> +       ;;
> +
> +     darwin* | rhapsody*)
> +@@ -9758,7 +10366,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/u=
sr/lib:/lib"; fi
> +
> +     # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
> +     freebsd* | dragonfly*)
> +-      archive_cmds=3D'$CC -shared -o $lib $libobjs $deplibs $compiler_f=
lags'
> ++      archive_cmds=3D'$CC -shared $pic_flag -o $lib $libobjs $deplibs $=
compiler_flags'
> +       hardcode_libdir_flag_spec=3D'-R$libdir'
> +       hardcode_direct=3Dyes
> +       hardcode_shlibpath_var=3Dno
> +@@ -9766,7 +10374,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/u=
sr/lib:/lib"; fi
> +
> +     hpux9*)
> +       if test "$GCC" =3D yes; then
> +-      archive_cmds=3D'$RM $output_objdir/$soname~$CC -shared -fPIC ${wl=
}+b ${wl}$install_libdir -o $output_objdir/$soname $libobjs $deplibs $compi=
ler_flags~test $output_objdir/$soname =3D $lib || mv $output_objdir/$soname=
 $lib'
> ++      archive_cmds=3D'$RM $output_objdir/$soname~$CC -shared $pic_flag =
${wl}+b ${wl}$install_libdir -o $output_objdir/$soname $libobjs $deplibs $c=
ompiler_flags~test $output_objdir/$soname =3D $lib || mv $output_objdir/$so=
name $lib'
> +       else
> +       archive_cmds=3D'$RM $output_objdir/$soname~$LD -b +b $install_lib=
dir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_=
objdir/$soname =3D $lib || mv $output_objdir/$soname $lib'
> +       fi
> +@@ -9782,7 +10390,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/u=
sr/lib:/lib"; fi
> +
> +     hpux10*)
> +       if test "$GCC" =3D yes && test "$with_gnu_ld" =3D no; then
> +-      archive_cmds=3D'$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+b ${=
wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
> ++      archive_cmds=3D'$CC -shared $pic_flag ${wl}+h ${wl}$soname ${wl}+=
b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
> +       else
> +       archive_cmds=3D'$LD -b +h $soname +b $install_libdir -o $lib $lib=
objs $deplibs $linker_flags'
> +       fi
> +@@ -9803,19 +10411,19 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
> +       if test "$GCC" =3D yes && test "$with_gnu_ld" =3D no; then
> +       case $host_cpu in
> +       hppa*64*)
> +-        archive_cmds=3D'$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaul=
trpath -o $lib $libobjs $deplibs $compiler_flags'
> ++        archive_cmds=3D'$CC -shared ${wl}+h ${wl}$soname -o $lib $libob=
js $deplibs $compiler_flags'
> +         ;;
> +       ia64*)
> +-        archive_cmds=3D'$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+no=
defaultrpath -o $lib $libobjs $deplibs $compiler_flags'
> ++        archive_cmds=3D'$CC -shared $pic_flag ${wl}+h ${wl}$soname ${wl=
}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
> +         ;;
> +       *)
> +-        archive_cmds=3D'$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+b =
${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
> ++        archive_cmds=3D'$CC -shared $pic_flag ${wl}+h ${wl}$soname ${wl=
}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
> +         ;;
> +       esac
> +       else
> +       case $host_cpu in
> +       hppa*64*)
> +-        archive_cmds=3D'$CC -b ${wl}+h ${wl}$soname ${wl}+nodefaultrpat=
h -o $lib $libobjs $deplibs $compiler_flags'
> ++        archive_cmds=3D'$CC -b ${wl}+h ${wl}$soname -o $lib $libobjs $d=
eplibs $compiler_flags'
> +         ;;
> +       ia64*)
> +         archive_cmds=3D'$CC -b ${wl}+h ${wl}$soname ${wl}+nodefaultrpat=
h -o $lib $libobjs $deplibs $compiler_flags'
> +@@ -9888,23 +10496,36 @@ fi
> +
> +     irix5* | irix6* | nonstopux*)
> +       if test "$GCC" =3D yes; then
> +-      archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags ${w=
l}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_ve=
rsion ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_loca=
tions -o $lib'
> ++      archive_cmds=3D'$CC -shared $pic_flag $libobjs $deplibs $compiler=
_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${=
wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdi=
r}/so_locations -o $lib'
> +       # Try to use the -exported_symbol ld option, if it does not
> +       # work, assume that -exports_file does not work either and
> +       # implicitly export all symbols.
> +-        save_LDFLAGS=3D"$LDFLAGS"
> +-        LDFLAGS=3D"$LDFLAGS -shared ${wl}-exported_symbol ${wl}foo ${wl=
}-update_registry ${wl}/dev/null"
> +-        cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> ++      # This should be the same for all languages, so no per-tag cache =
variable.
> ++      { $as_echo "$as_me:${as_lineno-$LINENO}: checking whether the $ho=
st_os linker accepts -exported_symbol" >&5
> ++$as_echo_n "checking whether the $host_os linker accepts -exported_symb=
ol... " >&6; }
> ++if ${lt_cv_irix_exported_symbol+:} false; then :
> ++  $as_echo_n "(cached) " >&6
> ++else
> ++  save_LDFLAGS=3D"$LDFLAGS"
> ++         LDFLAGS=3D"$LDFLAGS -shared ${wl}-exported_symbol ${wl}foo ${w=
l}-update_registry ${wl}/dev/null"
> ++         cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> + /* end confdefs.h.  */
> +-int foo(void) {}
> ++int foo (void) { return 0; }
> + _ACEOF
> + if ac_fn_c_try_link "$LINENO"; then :
> +-  archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags =
${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set=
_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_l=
ocations ${wl}-exports_file ${wl}$export_symbols -o $lib'
> +-
> ++  lt_cv_irix_exported_symbol=3Dyes
> ++else
> ++  lt_cv_irix_exported_symbol=3Dno
> + fi
> + rm -f core conftest.err conftest.$ac_objext \
> +     conftest$ac_exeext conftest.$ac_ext
> +-        LDFLAGS=3D"$save_LDFLAGS"
> ++           LDFLAGS=3D"$save_LDFLAGS"
>  +fi
> -+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_prog_compiler_p=
ic_CXX" >&5
> -+$as_echo "$lt_cv_prog_compiler_pic_CXX" >&6; }
> -+lt_prog_compiler_pic_CXX=3D$lt_cv_prog_compiler_pic_CXX
> -
> - #
> - # Check to make sure the PIC flag actually works.
> -@@ -13687,6 +14451,8 @@ fi
> -
> -
> -
> -+
> -+
> - #
> - # Check to make sure the static flag actually works.
> - #
> -@@ -13864,6 +14630,7 @@ fi
> - $as_echo_n "checking whether the $compiler linker ($LD) supports shared=
 libraries... " >&6; }
> -
> -   export_symbols_cmds_CXX=3D'$NM $libobjs $convenience | $global_symbol=
_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
> -+  exclude_expsyms_CXX=3D'_GLOBAL_OFFSET_TABLE_|_GLOBAL__F[ID]_.*'
> -   case $host_os in
> -   aix[4-9]*)
> -     # If we're using GNU nm, then we don't want the "-C" option.
> -@@ -13878,15 +14645,20 @@ $as_echo_n "checking whether the $compiler lin=
ker ($LD) supports shared librarie
> -     ;;
> -   pw32*)
> -     export_symbols_cmds_CXX=3D"$ltdll_cmds"
> --  ;;
> -+    ;;
> -   cygwin* | mingw* | cegcc*)
> --    export_symbols_cmds_CXX=3D'$NM $libobjs $convenience | $global_symb=
ol_pipe | $SED -e '\''/^[BCDGRS][ ]/s/.*[ ]\([^ ]*\)/\1 DATA/;/^.*[ ]__nm__=
/s/^.*[ ]__nm__\([^ ]*\)[ ][^ ]*/\1 DATA/;/^I[ ]/d;/^[AITW][ ]/s/.* //'\'' =
| sort | uniq > $export_symbols'
> --  ;;
> -+    case $cc_basename in
> -+    cl*) ;;
> -+    *)
> -+      export_symbols_cmds_CXX=3D'$NM $libobjs $convenience | $global_sy=
mbol_pipe | $SED -e '\''/^[BCDGRS][ ]/s/.*[ ]\([^ ]*\)/\1 DATA/;s/^.*[ ]__n=
m__\([^ ]*\)[ ][^ ]*/\1 DATA/;/^I[ ]/d;/^[AITW][ ]/s/.* //'\'' | sort | uni=
q > $export_symbols'
> -+      exclude_expsyms_CXX=3D'[_]+GLOBAL_OFFSET_TABLE_|[_]+GLOBAL__[FID]=
_.*|[_]+head_[A-Za-z0-9_]+_dll|[A-Za-z0-9_]+_dll_iname'
> -+      ;;
> -+    esac
> -+    ;;
> -   *)
> -     export_symbols_cmds_CXX=3D'$NM $libobjs $convenience | $global_symb=
ol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
> --  ;;
> -+    ;;
> -   esac
> --  exclude_expsyms_CXX=3D'_GLOBAL_OFFSET_TABLE_|_GLOBAL__F[ID]_.*'
> -
> - { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ld_shlibs_CXX" >&5
> - $as_echo "$ld_shlibs_CXX" >&6; }
> -@@ -14149,8 +14921,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_irix_exported_s=
ymbol" >&5
> ++$as_echo "$lt_cv_irix_exported_symbol" >&6; }
> ++      if test "$lt_cv_irix_exported_symbol" =3D yes; then
> ++          archive_expsym_cmds=3D'$CC -shared $pic_flag $libobjs $deplib=
s $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_e=
cho_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${o=
utput_objdir}/so_locations ${wl}-exports_file ${wl}$export_symbols -o $lib'
> ++      fi
> +       else
> +       archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags -so=
name $soname `test -n "$verstring" && func_echo_all "-set_version $verstrin=
g"` -update_registry ${output_objdir}/so_locations -o $lib'
> +       archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_fl=
ags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $v=
erstring"` -update_registry ${output_objdir}/so_locations -exports_file $ex=
port_symbols -o $lib'
> +@@ -9989,7 +10610,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +     osf4* | osf5*)    # as osf3* with the addition of -msym flag
> +       if test "$GCC" =3D yes; then
> +       allow_undefined_flag=3D' ${wl}-expect_unresolved ${wl}\*'
> +-      archive_cmds=3D'$CC -shared${allow_undefined_flag} $libobjs $depl=
ibs $compiler_flags ${wl}-msym ${wl}-soname ${wl}$soname `test -n "$verstri=
ng" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_regi=
stry ${wl}${output_objdir}/so_locations -o $lib'
> ++      archive_cmds=3D'$CC -shared${allow_undefined_flag} $pic_flag $lib=
objs $deplibs $compiler_flags ${wl}-msym ${wl}-soname ${wl}$soname `test -n=
 "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-u=
pdate_registry ${wl}${output_objdir}/so_locations -o $lib'
> +       hardcode_libdir_flag_spec=3D'${wl}-rpath ${wl}$libdir'
> +       else
> +       allow_undefined_flag=3D' -expect_unresolved \*'
> +@@ -10008,9 +10629,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +       no_undefined_flag=3D' -z defs'
> +       if test "$GCC" =3D yes; then
> +       wlarc=3D'${wl}'
> +-      archive_cmds=3D'$CC -shared ${wl}-z ${wl}text ${wl}-h ${wl}$sonam=
e -o $lib $libobjs $deplibs $compiler_flags'
> ++      archive_cmds=3D'$CC -shared $pic_flag ${wl}-z ${wl}text ${wl}-h $=
{wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
> +       archive_expsym_cmds=3D'echo "{ global:" > $lib.exp~cat $export_sy=
mbols | $SED -e "s/\(.*\)/\1;/" >> $lib.exp~echo "local: *; };" >> $lib.exp=
~
> +-        $CC -shared ${wl}-z ${wl}text ${wl}-M ${wl}$lib.exp ${wl}-h ${w=
l}$soname -o $lib $libobjs $deplibs $compiler_flags~$RM $lib.exp'
> ++        $CC -shared $pic_flag ${wl}-z ${wl}text ${wl}-M ${wl}$lib.exp $=
{wl}-h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags~$RM $lib.exp'
> +       else
> +       case `$CC -V 2>&1` in
> +       *"Compilers 5.0"*)
> +@@ -10586,8 +11207,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=3Dno
>     need_lib_prefix=3Dno
>
> @@ -9590,7 +11754,7 @@ index 2aeb3317b65..5ef46d31558 100755
>       library_names_spec=3D'$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds=3D'base_file=3D`basename \${file}`~
> -@@ -14182,13 +14955,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10620,13 +11242,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec=3D'`echo ${libname} | sed -e 's/^lib/pw/'``ech=
o ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -9663,7 +11827,7 @@ index 2aeb3317b65..5ef46d31558 100755
>     # FIXME: first we should search . and the directory the executable is=
 in
>     shlibpath_var=3DPATH
>     ;;
> -@@ -14269,7 +15100,7 @@ haiku*)
> +@@ -10708,7 +11388,7 @@ haiku*)
>     soname_spec=3D'${libname}${release}${shared_ext}$major'
>     shlibpath_var=3DLIBRARY_PATH
>     shlibpath_overrides_runpath=3Dyes
> @@ -9672,15 +11836,65 @@ index 2aeb3317b65..5ef46d31558 100755
>     hardcode_into_libs=3Dyes
>     ;;
>
> -@@ -14728,6 +15559,7 @@ fi
> -   fi # test -n "$compiler"
> +@@ -10815,12 +11495,7 @@ linux*oldld* | linux*aout* | linux*coff*)
> +   ;;
>
> -   CC=3D$lt_save_CC
> -+  CFLAGS=3D$lt_save_CFLAGS
> -   LDCXX=3D$LD
> -   LD=3D$lt_save_LD
> -   GCC=3D$lt_save_GCC
> -@@ -17770,13 +18602,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_sing=
le_quote_subst"`'
> + # This must be Linux ELF.
> +-
> +-# uclinux* changes (here and below) have been submitted to the libtool
> +-# project, but have not yet been accepted: they are GCC-local changes
> +-# for the time being.  (See
> +-# https://lists.gnu.org/archive/html/libtool-patches/2018-05/msg00000.h=
tml)
> +-linux* | k*bsd*-gnu | kopensolaris*-gnu | gnu* | uclinuxfdpiceabi)
> ++linux* | k*bsd*-gnu | kopensolaris*-gnu | gnu*)
> +   version_type=3Dlinux
> +   need_lib_prefix=3Dno
> +   need_version=3Dno
> +@@ -11509,7 +12184,7 @@ else
> +   lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> +   lt_status=3D$lt_dlunknown
> +   cat > conftest.$ac_ext <<_LT_EOF
> +-#line 11512 "configure"
> ++#line $LINENO "configure"
> + #include "confdefs.h"
> +
> + #if HAVE_DLFCN_H
> +@@ -11553,10 +12228,10 @@ else
> + /* When -fvisbility=3Dhidden is used, assume the code has been annotate=
d
> +    correspondingly for the symbols needed.  */
> + #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=3D =
3)) || (__GNUC__ > 3))
> +-void fnord () __attribute__((visibility("default")));
> ++int fnord () __attribute__((visibility("default")));
> + #endif
> +
> +-void fnord () { int i=3D42; }
> ++int fnord () { return 42; }
> + int main ()
> + {
> +   void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> +@@ -11615,7 +12290,7 @@ else
> +   lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> +   lt_status=3D$lt_dlunknown
> +   cat > conftest.$ac_ext <<_LT_EOF
> +-#line 11618 "configure"
> ++#line $LINENO "configure"
> + #include "confdefs.h"
> +
> + #if HAVE_DLFCN_H
> +@@ -11659,10 +12334,10 @@ else
> + /* When -fvisbility=3Dhidden is used, assume the code has been annotate=
d
> +    correspondingly for the symbols needed.  */
> + #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=3D =
3)) || (__GNUC__ > 3))
> +-void fnord () __attribute__((visibility("default")));
> ++int fnord () __attribute__((visibility("default")));
> + #endif
> +
> +-void fnord () { int i=3D42; }
> ++int fnord () { return 42; }
> + int main ()
> + {
> +   void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> +@@ -14948,13 +15623,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_sing=
le_quote_subst"`'
>   lt_unset=3D'`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL=3D'`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP=3D'`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -9701,7 +11915,7 @@ index 2aeb3317b65..5ef46d31558 100755
>   STRIP=3D'`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB=3D'`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds=3D'`$ECHO "$old_postinstall_cmds" | $SED "$delay_s=
ingle_quote_subst"`'
> -@@ -17791,14 +18630,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_cv=
_sys_global_symbol_pipe" | $SED "$de
> +@@ -14969,14 +15651,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_cv=
_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl=3D'`$ECHO "$lt_cv_sys_global_symbol_to=
_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address=3D'`$ECHO "$lt_cv_sys_global_=
symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'`$ECHO "$lt_cv_=
sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote=
_subst"`'
> @@ -9720,7 +11934,7 @@ index 2aeb3317b65..5ef46d31558 100755
>   DSYMUTIL=3D'`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT=3D'`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO=3D'`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -17831,12 +18673,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_sh=
libpath_var" | $SED "$delay_single_q
> +@@ -15009,12 +15694,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_sh=
libpath_var" | $SED "$delay_single_q
>   hardcode_automatic=3D'`$ECHO "$hardcode_automatic" | $SED "$delay_singl=
e_quote_subst"`'
>   inherit_rpath=3D'`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_su=
bst"`'
>   link_all_deplibs=3D'`$ECHO "$link_all_deplibs" | $SED "$delay_single_qu=
ote_subst"`'
> @@ -9734,31 +11948,7 @@ index 2aeb3317b65..5ef46d31558 100755
>   file_list_spec=3D'`$ECHO "$file_list_spec" | $SED "$delay_single_quote_=
subst"`'
>   variables_saved_for_relink=3D'`$ECHO "$variables_saved_for_relink" | $S=
ED "$delay_single_quote_subst"`'
>   need_lib_prefix=3D'`$ECHO "$need_lib_prefix" | $SED "$delay_single_quot=
e_subst"`'
> -@@ -17875,8 +18717,8 @@ old_archive_cmds_CXX=3D'`$ECHO "$old_archive_cmd=
s_CXX" | $SED "$delay_single_quote
> - compiler_CXX=3D'`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_subs=
t"`'
> - GCC_CXX=3D'`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
> - lt_prog_compiler_no_builtin_flag_CXX=3D'`$ECHO "$lt_prog_compiler_no_bu=
iltin_flag_CXX" | $SED "$delay_single_quote_subst"`'
> --lt_prog_compiler_wl_CXX=3D'`$ECHO "$lt_prog_compiler_wl_CXX" | $SED "$d=
elay_single_quote_subst"`'
> - lt_prog_compiler_pic_CXX=3D'`$ECHO "$lt_prog_compiler_pic_CXX" | $SED "=
$delay_single_quote_subst"`'
> -+lt_prog_compiler_wl_CXX=3D'`$ECHO "$lt_prog_compiler_wl_CXX" | $SED "$d=
elay_single_quote_subst"`'
> - lt_prog_compiler_static_CXX=3D'`$ECHO "$lt_prog_compiler_static_CXX" | =
$SED "$delay_single_quote_subst"`'
> - lt_cv_prog_compiler_c_o_CXX=3D'`$ECHO "$lt_cv_prog_compiler_c_o_CXX" | =
$SED "$delay_single_quote_subst"`'
> - archive_cmds_need_lc_CXX=3D'`$ECHO "$archive_cmds_need_lc_CXX" | $SED "=
$delay_single_quote_subst"`'
> -@@ -17903,12 +18745,12 @@ hardcode_shlibpath_var_CXX=3D'`$ECHO "$hardcod=
e_shlibpath_var_CXX" | $SED "$delay_
> - hardcode_automatic_CXX=3D'`$ECHO "$hardcode_automatic_CXX" | $SED "$del=
ay_single_quote_subst"`'
> - inherit_rpath_CXX=3D'`$ECHO "$inherit_rpath_CXX" | $SED "$delay_single_=
quote_subst"`'
> - link_all_deplibs_CXX=3D'`$ECHO "$link_all_deplibs_CXX" | $SED "$delay_s=
ingle_quote_subst"`'
> --fix_srcfile_path_CXX=3D'`$ECHO "$fix_srcfile_path_CXX" | $SED "$delay_s=
ingle_quote_subst"`'
> - always_export_symbols_CXX=3D'`$ECHO "$always_export_symbols_CXX" | $SED=
 "$delay_single_quote_subst"`'
> - export_symbols_cmds_CXX=3D'`$ECHO "$export_symbols_cmds_CXX" | $SED "$d=
elay_single_quote_subst"`'
> - exclude_expsyms_CXX=3D'`$ECHO "$exclude_expsyms_CXX" | $SED "$delay_sin=
gle_quote_subst"`'
> - include_expsyms_CXX=3D'`$ECHO "$include_expsyms_CXX" | $SED "$delay_sin=
gle_quote_subst"`'
> - prelink_cmds_CXX=3D'`$ECHO "$prelink_cmds_CXX" | $SED "$delay_single_qu=
ote_subst"`'
> -+postlink_cmds_CXX=3D'`$ECHO "$postlink_cmds_CXX" | $SED "$delay_single_=
quote_subst"`'
> - file_list_spec_CXX=3D'`$ECHO "$file_list_spec_CXX" | $SED "$delay_singl=
e_quote_subst"`'
> - hardcode_action_CXX=3D'`$ECHO "$hardcode_action_CXX" | $SED "$delay_sin=
gle_quote_subst"`'
> - compiler_lib_search_dirs_CXX=3D'`$ECHO "$compiler_lib_search_dirs_CXX" =
| $SED "$delay_single_quote_subst"`'
> -@@ -17946,8 +18788,13 @@ reload_flag \
> +@@ -15069,8 +15754,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -9772,7 +11962,7 @@ index 2aeb3317b65..5ef46d31558 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -17957,12 +18804,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -15080,12 +15770,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -9788,7 +11978,7 @@ index 2aeb3317b65..5ef46d31558 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -17978,7 +18827,6 @@ no_undefined_flag \
> +@@ -15101,7 +15793,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -9796,25 +11986,7 @@ index 2aeb3317b65..5ef46d31558 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -18000,8 +18848,8 @@ LD_CXX \
> - reload_flag_CXX \
> - compiler_CXX \
> - lt_prog_compiler_no_builtin_flag_CXX \
> --lt_prog_compiler_wl_CXX \
> - lt_prog_compiler_pic_CXX \
> -+lt_prog_compiler_wl_CXX \
> - lt_prog_compiler_static_CXX \
> - lt_cv_prog_compiler_c_o_CXX \
> - export_dynamic_flag_spec_CXX \
> -@@ -18013,7 +18861,6 @@ no_undefined_flag_CXX \
> - hardcode_libdir_flag_spec_CXX \
> - hardcode_libdir_flag_spec_ld_CXX \
> - hardcode_libdir_separator_CXX \
> --fix_srcfile_path_CXX \
> - exclude_expsyms_CXX \
> - include_expsyms_CXX \
> - file_list_spec_CXX \
> -@@ -18047,6 +18894,7 @@ module_cmds \
> +@@ -15137,6 +15828,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -9822,17 +11994,7 @@ index 2aeb3317b65..5ef46d31558 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -18061,7 +18909,8 @@ archive_expsym_cmds_CXX \
> - module_cmds_CXX \
> - module_expsym_cmds_CXX \
> - export_symbols_cmds_CXX \
> --prelink_cmds_CXX; do
> -+prelink_cmds_CXX \
> -+postlink_cmds_CXX; do
> -     case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
> -     *[\\\\\\\`\\"\\\$]*)
> -       eval "lt_\$var=3D\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED -e=
 \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$delay_=
variable_subst\\"\\\`\\\\\\""
> -@@ -18826,7 +19675,8 @@ $as_echo X"$file" |
> +@@ -15835,7 +16527,8 @@ esac ;;
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -9842,7 +12004,7 @@ index 2aeb3317b65..5ef46d31558 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -18929,19 +19779,42 @@ SP2NL=3D$lt_lt_SP2NL
> +@@ -15938,19 +16631,42 @@ SP2NL=3D$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=3D$lt_lt_NL2SP
>
> @@ -9886,7 +12048,7 @@ index 2aeb3317b65..5ef46d31558 100755
>   # A symbol stripping program.
>   STRIP=3D$lt_STRIP
>
> -@@ -18971,6 +19844,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_sys=
_global_symbol_to_c_name_address
> +@@ -15980,6 +16696,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_sys=
_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix i=
s needed.
>   global_symbol_to_c_name_address_lib_prefix=3D$lt_lt_cv_sys_global_symbo=
l_to_c_name_address_lib_prefix
>
> @@ -9899,7 +12061,7 @@ index 2aeb3317b65..5ef46d31558 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=3D$objdir
>
> -@@ -18980,6 +19859,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> +@@ -15989,6 +16711,9 @@ MAGIC_CMD=3D$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=3D$lt_need_locks
>
> @@ -9909,7 +12071,7 @@ index 2aeb3317b65..5ef46d31558 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=3D$lt_DSYMUTIL
>
> -@@ -19094,12 +19976,12 @@ with_gcc=3D$GCC
> +@@ -16103,12 +16828,12 @@ with_gcc=3D$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag
>
> @@ -9925,7 +12087,7 @@ index 2aeb3317b65..5ef46d31558 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=3D$lt_lt_prog_compiler_static
>
> -@@ -19186,9 +20068,6 @@ inherit_rpath=3D$inherit_rpath
> +@@ -16195,9 +16920,6 @@ inherit_rpath=3D$inherit_rpath
>   # Whether libtool must link a program against all its dependency librar=
ies.
>   link_all_deplibs=3D$link_all_deplibs
>
> @@ -9935,7 +12097,7 @@ index 2aeb3317b65..5ef46d31558 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=3D$always_export_symbols
>
> -@@ -19204,6 +20083,9 @@ include_expsyms=3D$lt_include_expsyms
> +@@ -16213,6 +16935,9 @@ include_expsyms=3D$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with temp=
lates.
>   prelink_cmds=3D$lt_prelink_cmds
>
> @@ -9945,7 +12107,7 @@ index 2aeb3317b65..5ef46d31558 100755
>   # Specify filename containing input files.
>   file_list_spec=3D$lt_file_list_spec
>
> -@@ -19250,210 +20132,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> +@@ -16245,210 +16970,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> @@ -10319,47 +12481,11 @@ index 2aeb3317b65..5ef46d31558 100755
>       (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
>     chmod +x "$ofile"
>
> -@@ -19481,12 +20322,12 @@ with_gcc=3D$GCC_CXX
> - # Compiler flag to turn off builtin functions.
> - no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag_CXX
> -
> --# How to pass a linker flag through the compiler.
> --wl=3D$lt_lt_prog_compiler_wl_CXX
> --
> - # Additional compiler flags for building library objects.
> - pic_flag=3D$lt_lt_prog_compiler_pic_CXX
> -
> -+# How to pass a linker flag through the compiler.
> -+wl=3D$lt_lt_prog_compiler_wl_CXX
> -+
> - # Compiler flag to prevent dynamic linking.
> - link_static_flag=3D$lt_lt_prog_compiler_static_CXX
> -
> -@@ -19573,9 +20414,6 @@ inherit_rpath=3D$inherit_rpath_CXX
> - # Whether libtool must link a program against all its dependency librar=
ies.
> - link_all_deplibs=3D$link_all_deplibs_CXX
> -
> --# Fix the shell variable \$srcfile for the compiler.
> --fix_srcfile_path=3D$lt_fix_srcfile_path_CXX
> --
> - # Set to "yes" if exported symbols are required.
> - always_export_symbols=3D$always_export_symbols_CXX
> -
> -@@ -19591,6 +20429,9 @@ include_expsyms=3D$lt_include_expsyms_CXX
> - # Commands necessary for linking programs (against libraries) with temp=
lates.
> - prelink_cmds=3D$lt_prelink_cmds_CXX
> -
> -+# Commands necessary for finishing linking programs.
> -+postlink_cmds=3D$lt_postlink_cmds_CXX
> -+
> - # Specify filename containing input files.
> - file_list_spec=3D$lt_file_list_spec_CXX
> -
>  diff --git a/libctf/configure b/libctf/configure
> -index 82bcf13a606..a7fb723a145 100755
> +index de10fef84a1..1b0ee0d32c6 100755
>  --- a/libctf/configure
>  +++ b/libctf/configure
> -@@ -666,6 +666,8 @@ OTOOL
> +@@ -669,6 +669,8 @@ OTOOL
>   LIPO
>   NMEDIT
>   DSYMUTIL
> @@ -10368,7 +12494,7 @@ index 82bcf13a606..a7fb723a145 100755
>   OBJDUMP
>   LN_S
>   NM
> -@@ -797,6 +799,7 @@ enable_static
> +@@ -801,6 +803,7 @@ enable_static
>   with_pic
>   enable_fast_install
>   with_gnu_ld
> @@ -10376,7 +12502,7 @@ index 82bcf13a606..a7fb723a145 100755
>   enable_libtool_lock
>   enable_largefile
>   enable_werror_always
> -@@ -1460,6 +1463,8 @@ Optional Packages:
> +@@ -1475,6 +1478,8 @@ Optional Packages:
>     --with-pic              try to use only PIC/non-PIC objects [default=
=3Duse
>                             both]
>     --with-gnu-ld           assume the C compiler uses GNU ld [default=3D=
no]
> @@ -10385,7 +12511,7 @@ index 82bcf13a606..a7fb723a145 100755
>     --with-system-zlib      use installed libz
>
>   Some influential environment variables:
> -@@ -5529,8 +5534,8 @@ esac
> +@@ -5583,8 +5588,8 @@ esac
>
>
>
> @@ -10396,7 +12522,7 @@ index 82bcf13a606..a7fb723a145 100755
>
>
>
> -@@ -5570,7 +5575,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -5624,7 +5629,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings"=
 >&5
>   $as_echo_n "checking how to print strings... " >&6; }
>   # Test print first, because it will be a builtin if present.
> @@ -10405,7 +12531,7 @@ index 82bcf13a606..a7fb723a145 100755
>      test "X`print -r -- $ECHO 2>/dev/null`" =3D "X$ECHO"; then
>     ECHO=3D'print -r --'
>   elif test "X`printf %s $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> -@@ -6256,8 +6261,8 @@ $as_echo_n "checking whether the shell understands=
 some XSI constructs... " >&6;
> +@@ -6311,8 +6316,8 @@ $as_echo_n "checking whether the shell understands=
 some XSI constructs... " >&6;
>   # Try some XSI features
>   xsi_shell=3Dno
>   ( _lt_dummy=3D"a/b/c"
> @@ -10416,7 +12542,7 @@ index 82bcf13a606..a7fb723a145 100755
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=3Dyes
> -@@ -6306,6 +6311,80 @@ esac
> +@@ -6361,6 +6366,80 @@ esac
>
>
>
> @@ -10497,7 +12623,7 @@ index 82bcf13a606..a7fb723a145 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to rel=
oad object files" >&5
>   $as_echo_n "checking for $LD option to reload object files... " >&6; }
>   if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -6322,6 +6401,11 @@ case $reload_flag in
> +@@ -6377,6 +6456,11 @@ case $reload_flag in
>   esac
>   reload_cmds=3D'$LD$reload_flag -o $output$reload_objs'
>   case $host_os in
> @@ -10509,7 +12635,7 @@ index 82bcf13a606..a7fb723a145 100755
>     darwin*)
>       if test "$GCC" =3D yes; then
>         reload_cmds=3D'$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reloa=
d_objs'
> -@@ -6490,7 +6574,8 @@ mingw* | pw32*)
> +@@ -6545,7 +6629,8 @@ mingw* | pw32*)
>       lt_cv_deplibs_check_method=3D'file_magic ^x86 archive import|^x86 D=
LL'
>       lt_cv_file_magic_cmd=3D'func_win32_libid'
>     else
> @@ -10519,7 +12645,7 @@ index 82bcf13a606..a7fb723a145 100755
>       lt_cv_file_magic_cmd=3D'$OBJDUMP -f'
>     fi
>     ;;
> -@@ -6644,6 +6729,21 @@ esac
> +@@ -6699,6 +6784,21 @@ esac
>   fi
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_m=
ethod" >&5
>   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -10541,7 +12667,7 @@ index 82bcf13a606..a7fb723a145 100755
>   file_magic_cmd=3D$lt_cv_file_magic_cmd
>   deplibs_check_method=3D$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=3Dunknown
> -@@ -6659,6 +6759,157 @@ test -z "$deplibs_check_method" && deplibs_check=
_method=3Dunknown
> +@@ -6714,6 +6814,157 @@ test -z "$deplibs_check_method" && deplibs_check=
_method=3Dunknown
>
>
>
> @@ -10699,7 +12825,7 @@ index 82bcf13a606..a7fb723a145 100755
>   plugin_option=3D
>   plugin_names=3D"liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dl=
l"
>   for plugin in $plugin_names; do
> -@@ -6673,8 +6924,10 @@ for plugin in $plugin_names; do
> +@@ -6728,8 +6979,10 @@ for plugin in $plugin_names; do
>   done
>
>   if test -n "$ac_tool_prefix"; then
> @@ -10712,7 +12838,7 @@ index 82bcf13a606..a7fb723a145 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_AR+:} false; then :
> -@@ -6690,7 +6943,7 @@ do
> +@@ -6745,7 +6998,7 @@ do
>     test -z "$as_dir" && as_dir=3D.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -10721,7 +12847,7 @@ index 82bcf13a606..a7fb723a145 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_ex=
ec_ext" >&5
>       break 2
>     fi
> -@@ -6710,11 +6963,15 @@ $as_echo "no" >&6; }
> +@@ -6765,11 +7018,15 @@ $as_echo "no" >&6; }
>   fi
>
>
> @@ -10740,7 +12866,7 @@ index 82bcf13a606..a7fb723a145 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -6730,7 +6987,7 @@ do
> +@@ -6785,7 +7042,7 @@ do
>     test -z "$as_dir" && as_dir=3D.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -10749,7 +12875,7 @@ index 82bcf13a606..a7fb723a145 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_ex=
ec_ext" >&5
>       break 2
>     fi
> -@@ -6749,6 +7006,10 @@ else
> +@@ -6804,6 +7061,10 @@ else
>   $as_echo "no" >&6; }
>   fi
>
> @@ -10760,7 +12886,7 @@ index 82bcf13a606..a7fb723a145 100755
>     if test "x$ac_ct_AR" =3D x; then
>       AR=3D"false"
>     else
> -@@ -6760,25 +7021,19 @@ ac_tool_warned=3Dyes ;;
> +@@ -6815,25 +7076,19 @@ ac_tool_warned=3Dyes ;;
>   esac
>       AR=3D$ac_ct_AR
>     fi
> @@ -10795,7 +12921,7 @@ index 82bcf13a606..a7fb723a145 100755
>
>
>
> -@@ -6790,6 +7045,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=3Dcru
> +@@ -6845,6 +7100,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=3Dcru
>
>
>
> @@ -10860,7 +12986,7 @@ index 82bcf13a606..a7fb723a145 100755
>   if test -n "$ac_tool_prefix"; then
>     # Extract the first word of "${ac_tool_prefix}strip", so it can be a =
program name with args.
>   set dummy ${ac_tool_prefix}strip; ac_word=3D$2
> -@@ -7129,8 +7442,8 @@ esac
> +@@ -7184,8 +7497,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl=3D"sed -n -e 's/^T .* \(.*\)$/extern i=
nt \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>
>   # Transform an extracted symbol line into symbol name and symbol addres=
s
> @@ -10871,7 +12997,7 @@ index 82bcf13a606..a7fb723a145 100755
>
>   # Handle CRLF in mingw tool chain
>   opt_cr=3D
> -@@ -7166,6 +7479,7 @@ for ac_symprfx in "" "_"; do
> +@@ -7221,6 +7534,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe=3D"sed -n -e 's/^.*[    ]\($symcode$sy=
mcode*\)[         ][      ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -10879,7 +13005,7 @@ index 82bcf13a606..a7fb723a145 100755
>
>     # Check to see that the pipe works correctly.
>     pipe_works=3Dno
> -@@ -7207,6 +7521,18 @@ _LT_EOF
> +@@ -7262,6 +7576,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>         if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>           cat <<_LT_EOF > conftest.$ac_ext
> @@ -10898,7 +13024,7 @@ index 82bcf13a606..a7fb723a145 100755
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -7218,7 +7544,7 @@ _LT_EOF
> +@@ -7273,7 +7599,7 @@ _LT_EOF
>           cat <<_LT_EOF >> conftest.$ac_ext
>
>   /* The mapping between symbol names and symbols.  */
> @@ -10907,7 +13033,7 @@ index 82bcf13a606..a7fb723a145 100755
>     const char *name;
>     void       *address;
>   }
> -@@ -7244,8 +7570,8 @@ static const void *lt_preloaded_setup() {
> +@@ -7299,8 +7625,8 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>           # Now try linking the two files.
>           mv conftest.$ac_objext conftstm.$ac_objext
> @@ -10918,7 +13044,7 @@ index 82bcf13a606..a7fb723a145 100755
>           LIBS=3D"conftstm.$ac_objext"
>           CFLAGS=3D"$CFLAGS$lt_prog_compiler_no_builtin_flag"
>           if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\=
""; } >&5
> -@@ -7255,8 +7581,8 @@ _LT_EOF
> +@@ -7310,8 +7636,8 @@ _LT_EOF
>     test $ac_status =3D 0; } && test -s conftest${ac_exeext}; then
>             pipe_works=3Dyes
>           fi
> @@ -10929,7 +13055,7 @@ index 82bcf13a606..a7fb723a145 100755
>         else
>           echo "cannot find nm_test_func in $nlist" >&5
>         fi
> -@@ -7293,6 +7619,14 @@ else
> +@@ -7348,6 +7674,14 @@ else
>   $as_echo "ok" >&6; }
>   fi
>
> @@ -10944,7 +13070,7 @@ index 82bcf13a606..a7fb723a145 100755
>
>
>
> -@@ -7311,6 +7645,47 @@ fi
> +@@ -7366,6 +7700,47 @@ fi
>
>
>
> @@ -10992,7 +13118,7 @@ index 82bcf13a606..a7fb723a145 100755
>
>
>
> -@@ -7520,6 +7895,123 @@ esac
> +@@ -7575,6 +7950,123 @@ esac
>
>   need_locks=3D"$enable_libtool_lock"
>
> @@ -11116,7 +13242,7 @@ index 82bcf13a606..a7fb723a145 100755
>
>     case $host_os in
>       rhapsody* | darwin*)
> -@@ -8083,6 +8575,8 @@ _LT_EOF
> +@@ -8138,6 +8630,8 @@ _LT_EOF
>         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>         echo "$AR cru libconftest.a conftest.o" >&5
>         $AR cru libconftest.a conftest.o 2>&5
> @@ -11125,7 +13251,7 @@ index 82bcf13a606..a7fb723a145 100755
>         cat > conftest.c << _LT_EOF
>   int main() { return 0;}
>   _LT_EOF
> -@@ -8635,8 +9130,6 @@ fi
> +@@ -8690,8 +9184,6 @@ fi
>   lt_prog_compiler_pic=3D
>   lt_prog_compiler_static=3D
>
> @@ -11134,7 +13260,7 @@ index 82bcf13a606..a7fb723a145 100755
>
>     if test "$GCC" =3D yes; then
>       lt_prog_compiler_wl=3D'-Wl,'
> -@@ -8802,6 +9295,12 @@ $as_echo_n "checking for $compiler option to prod=
uce PIC... " >&6; }
> +@@ -8857,6 +9349,12 @@ $as_echo_n "checking for $compiler option to prod=
uce PIC... " >&6; }
>         lt_prog_compiler_pic=3D'--shared'
>         lt_prog_compiler_static=3D'--static'
>         ;;
> @@ -11147,7 +13273,7 @@ index 82bcf13a606..a7fb723a145 100755
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>         # which looks to be a dead project)
> -@@ -8864,7 +9363,7 @@ $as_echo_n "checking for $compiler option to produ=
ce PIC... " >&6; }
> +@@ -8919,7 +9417,7 @@ $as_echo_n "checking for $compiler option to produ=
ce PIC... " >&6; }
>         lt_prog_compiler_pic=3D'-KPIC'
>         lt_prog_compiler_static=3D'-Bstatic'
>         case $cc_basename in
> @@ -11156,7 +13282,7 @@ index 82bcf13a606..a7fb723a145 100755
>         lt_prog_compiler_wl=3D'-Qoption ld ';;
>         *)
>         lt_prog_compiler_wl=3D'-Wl,';;
> -@@ -8921,13 +9420,17 @@ case $host_os in
> +@@ -8976,13 +9474,17 @@ case $host_os in
>       lt_prog_compiler_pic=3D"$lt_prog_compiler_pic -DPIC"
>       ;;
>   esac
> @@ -11180,7 +13306,7 @@ index 82bcf13a606..a7fb723a145 100755
>
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -8988,6 +9491,11 @@ fi
> +@@ -9043,6 +9545,11 @@ fi
>
>
>
> @@ -11192,7 +13318,7 @@ index 82bcf13a606..a7fb723a145 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -9338,7 +9846,8 @@ _LT_EOF
> +@@ -9393,7 +9900,8 @@ _LT_EOF
>         allow_undefined_flag=3Dunsupported
>         always_export_symbols=3Dno
>         enable_shared_with_static_runtimes=3Dyes
> @@ -11202,7 +13328,7 @@ index 82bcf13a606..a7fb723a145 100755
>
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags -=
o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-impli=
b -Xlinker $lib'
> -@@ -9437,12 +9946,12 @@ _LT_EOF
> +@@ -9492,12 +10000,12 @@ _LT_EOF
>           whole_archive_flag_spec=3D'--whole-archive$convenience --no-who=
le-archive'
>           hardcode_libdir_flag_spec=3D
>           hardcode_libdir_flag_spec_ld=3D'-rpath $libdir'
> @@ -11217,7 +13343,7 @@ index 82bcf13a606..a7fb723a145 100755
>           fi
>           ;;
>         esac
> -@@ -9456,8 +9965,8 @@ _LT_EOF
> +@@ -9511,8 +10019,8 @@ _LT_EOF
>         archive_cmds=3D'$LD -Bshareable $libobjs $deplibs $linker_flags -=
o $lib'
>         wlarc=3D
>         else
> @@ -11228,7 +13354,7 @@ index 82bcf13a606..a7fb723a145 100755
>         fi
>         ;;
>
> -@@ -9475,8 +9984,8 @@ _LT_EOF
> +@@ -9530,8 +10038,8 @@ _LT_EOF
>
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/=
null; then
> @@ -11239,7 +13365,7 @@ index 82bcf13a606..a7fb723a145 100755
>         else
>         ld_shlibs=3Dno
>         fi
> -@@ -9522,8 +10031,8 @@ _LT_EOF
> +@@ -9577,8 +10085,8 @@ _LT_EOF
>
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/nu=
ll; then
> @@ -11250,7 +13376,7 @@ index 82bcf13a606..a7fb723a145 100755
>         else
>         ld_shlibs=3Dno
>         fi
> -@@ -9653,7 +10162,13 @@ _LT_EOF
> +@@ -9708,7 +10216,13 @@ _LT_EOF
>         allow_undefined_flag=3D'-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -11265,7 +13391,7 @@ index 82bcf13a606..a7fb723a145 100755
>   /* end confdefs.h.  */
>
>   int
> -@@ -9666,22 +10181,29 @@ main ()
> +@@ -9721,22 +10235,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>
> @@ -11308,7 +13434,7 @@ index 82bcf13a606..a7fb723a145 100755
>
>           hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libp=
ath"
>           archive_expsym_cmds=3D'$CC -o $output_objdir/$soname $libobjs $=
deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefin=
ed_flag}" !=3D "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else=
 :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -9693,7 +10215,13 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
> +@@ -9748,7 +10269,13 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
>         else
>          # Determine the default libpath from the value encoded in an
>          # empty executable.
> @@ -11323,7 +13449,7 @@ index 82bcf13a606..a7fb723a145 100755
>   /* end confdefs.h.  */
>
>   int
> -@@ -9706,22 +10234,29 @@ main ()
> +@@ -9761,22 +10288,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>
> @@ -11366,7 +13492,7 @@ index 82bcf13a606..a7fb723a145 100755
>
>          hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libpa=
th"
>           # Warning - without using the other run time loading flags,
> -@@ -9766,20 +10301,63 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
> +@@ -9821,20 +10355,63 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
>         # no search path for DLLs.
> @@ -11444,7 +13570,7 @@ index 82bcf13a606..a7fb723a145 100755
>         ;;
>
>       darwin* | rhapsody*)
> -@@ -9840,7 +10418,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/u=
sr/lib:/lib"; fi
> +@@ -9895,7 +10472,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/u=
sr/lib:/lib"; fi
>
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -11453,7 +13579,7 @@ index 82bcf13a606..a7fb723a145 100755
>         hardcode_libdir_flag_spec=3D'-R$libdir'
>         hardcode_direct=3Dyes
>         hardcode_shlibpath_var=3Dno
> -@@ -9848,7 +10426,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/u=
sr/lib:/lib"; fi
> +@@ -9903,7 +10480,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/u=
sr/lib:/lib"; fi
>
>       hpux9*)
>         if test "$GCC" =3D yes; then
> @@ -11462,7 +13588,7 @@ index 82bcf13a606..a7fb723a145 100755
>         else
>         archive_cmds=3D'$RM $output_objdir/$soname~$LD -b +b $install_lib=
dir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_=
objdir/$soname =3D $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -9864,7 +10442,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/u=
sr/lib:/lib"; fi
> +@@ -9919,7 +10496,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/u=
sr/lib:/lib"; fi
>
>       hpux10*)
>         if test "$GCC" =3D yes && test "$with_gnu_ld" =3D no; then
> @@ -11471,7 +13597,7 @@ index 82bcf13a606..a7fb723a145 100755
>         else
>         archive_cmds=3D'$LD -b +h $soname +b $install_libdir -o $lib $lib=
objs $deplibs $linker_flags'
>         fi
> -@@ -9888,10 +10466,10 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
> +@@ -9943,10 +10520,10 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
>           archive_cmds=3D'$CC -shared ${wl}+h ${wl}$soname -o $lib $libob=
js $deplibs $compiler_flags'
>           ;;
>         ia64*)
> @@ -11484,7 +13610,7 @@ index 82bcf13a606..a7fb723a145 100755
>           ;;
>         esac
>         else
> -@@ -9970,23 +10548,36 @@ fi
> +@@ -10025,23 +10602,36 @@ fi
>
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" =3D yes; then
> @@ -11529,7 +13655,7 @@ index 82bcf13a606..a7fb723a145 100755
>         else
>         archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags -so=
name $soname `test -n "$verstring" && func_echo_all "-set_version $verstrin=
g"` -update_registry ${output_objdir}/so_locations -o $lib'
>         archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_fl=
ags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $v=
erstring"` -update_registry ${output_objdir}/so_locations -exports_file $ex=
port_symbols -o $lib'
> -@@ -10071,7 +10662,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -10126,7 +10716,7 @@ rm -f core conftest.err conftest.$ac_objext \
>       osf4* | osf5*)    # as osf3* with the addition of -msym flag
>         if test "$GCC" =3D yes; then
>         allow_undefined_flag=3D' ${wl}-expect_unresolved ${wl}\*'
> @@ -11538,7 +13664,7 @@ index 82bcf13a606..a7fb723a145 100755
>         hardcode_libdir_flag_spec=3D'${wl}-rpath ${wl}$libdir'
>         else
>         allow_undefined_flag=3D' -expect_unresolved \*'
> -@@ -10090,9 +10681,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -10145,9 +10735,9 @@ rm -f core conftest.err conftest.$ac_objext \
>         no_undefined_flag=3D' -z defs'
>         if test "$GCC" =3D yes; then
>         wlarc=3D'${wl}'
> @@ -11550,7 +13676,7 @@ index 82bcf13a606..a7fb723a145 100755
>         else
>         case `$CC -V 2>&1` in
>         *"Compilers 5.0"*)
> -@@ -10668,8 +11259,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10723,8 +11313,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=3Dno
>     need_lib_prefix=3Dno
>
> @@ -11562,7 +13688,7 @@ index 82bcf13a606..a7fb723a145 100755
>       library_names_spec=3D'$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds=3D'base_file=3D`basename \${file}`~
> -@@ -10702,13 +11294,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10757,13 +11348,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec=3D'`echo ${libname} | sed -e 's/^lib/pw/'``ech=
o ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -11635,25 +13761,16 @@ index 82bcf13a606..a7fb723a145 100755
>     # FIXME: first we should search . and the directory the executable is=
 in
>     shlibpath_var=3DPATH
>     ;;
> -@@ -10790,7 +11440,7 @@ haiku*)
> -   soname_spec=3D'${libname}${release}${shared_ext}$major'
> -   shlibpath_var=3DLIBRARY_PATH
> -   shlibpath_overrides_runpath=3Dyes
> --  sys_lib_dlsearch_path_spec=3D'/boot/home/config/lib /boot/common/lib =
/boot/beos/system/lib'
> -+  sys_lib_dlsearch_path_spec=3D'/boot/home/config/lib /boot/common/lib =
/boot/system/lib'
> -   hardcode_into_libs=3Dyes
> -   ;;
> -
> -@@ -11586,7 +12236,7 @@ else
> +@@ -11641,7 +12290,7 @@ else
>     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
>     lt_status=3D$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11589 "configure"
> +-#line 11644 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>
>   #if HAVE_DLFCN_H
> -@@ -11630,10 +12280,10 @@ else
> +@@ -11685,10 +12334,10 @@ else
>   /* When -fvisbility=3Dhidden is used, assume the code has been annotate=
d
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=3D =
3)) || (__GNUC__ > 3))
> @@ -11666,16 +13783,16 @@ index 82bcf13a606..a7fb723a145 100755
>   int main ()
>   {
>     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -11692,7 +12342,7 @@ else
> +@@ -11747,7 +12396,7 @@ else
>     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
>     lt_status=3D$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 11695 "configure"
> +-#line 11750 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>
>   #if HAVE_DLFCN_H
> -@@ -11736,10 +12386,10 @@ else
> +@@ -11791,10 +12440,10 @@ else
>   /* When -fvisbility=3Dhidden is used, assume the code has been annotate=
d
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=3D =
3)) || (__GNUC__ > 3))
> @@ -11688,7 +13805,7 @@ index 82bcf13a606..a7fb723a145 100755
>   int main ()
>   {
>     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -14286,13 +14936,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_sing=
le_quote_subst"`'
> +@@ -14479,13 +15128,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_sing=
le_quote_subst"`'
>   lt_unset=3D'`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL=3D'`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP=3D'`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -11709,7 +13826,7 @@ index 82bcf13a606..a7fb723a145 100755
>   STRIP=3D'`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB=3D'`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds=3D'`$ECHO "$old_postinstall_cmds" | $SED "$delay_s=
ingle_quote_subst"`'
> -@@ -14307,14 +14964,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_cv=
_sys_global_symbol_pipe" | $SED "$de
> +@@ -14500,14 +15156,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_cv=
_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl=3D'`$ECHO "$lt_cv_sys_global_symbol_to=
_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address=3D'`$ECHO "$lt_cv_sys_global_=
symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'`$ECHO "$lt_cv_=
sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote=
_subst"`'
> @@ -11728,7 +13845,7 @@ index 82bcf13a606..a7fb723a145 100755
>   DSYMUTIL=3D'`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT=3D'`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO=3D'`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -14347,12 +15007,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_sh=
libpath_var" | $SED "$delay_single_q
> +@@ -14540,12 +15199,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_sh=
libpath_var" | $SED "$delay_single_q
>   hardcode_automatic=3D'`$ECHO "$hardcode_automatic" | $SED "$delay_singl=
e_quote_subst"`'
>   inherit_rpath=3D'`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_su=
bst"`'
>   link_all_deplibs=3D'`$ECHO "$link_all_deplibs" | $SED "$delay_single_qu=
ote_subst"`'
> @@ -11742,7 +13859,7 @@ index 82bcf13a606..a7fb723a145 100755
>   file_list_spec=3D'`$ECHO "$file_list_spec" | $SED "$delay_single_quote_=
subst"`'
>   variables_saved_for_relink=3D'`$ECHO "$variables_saved_for_relink" | $S=
ED "$delay_single_quote_subst"`'
>   need_lib_prefix=3D'`$ECHO "$need_lib_prefix" | $SED "$delay_single_quot=
e_subst"`'
> -@@ -14407,8 +15067,13 @@ reload_flag \
> +@@ -14600,8 +15259,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -11756,7 +13873,7 @@ index 82bcf13a606..a7fb723a145 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -14418,12 +15083,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -14611,12 +15275,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -11772,7 +13889,7 @@ index 82bcf13a606..a7fb723a145 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -14439,7 +15106,6 @@ no_undefined_flag \
> +@@ -14632,7 +15298,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -11780,7 +13897,7 @@ index 82bcf13a606..a7fb723a145 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -14475,6 +15141,7 @@ module_cmds \
> +@@ -14668,6 +15333,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -11788,7 +13905,7 @@ index 82bcf13a606..a7fb723a145 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -15231,7 +15898,8 @@ $as_echo X"$file" |
> +@@ -15424,7 +16090,8 @@ $as_echo X"$file" |
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -11798,7 +13915,7 @@ index 82bcf13a606..a7fb723a145 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -15334,19 +16002,42 @@ SP2NL=3D$lt_lt_SP2NL
> +@@ -15527,19 +16194,42 @@ SP2NL=3D$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=3D$lt_lt_NL2SP
>
> @@ -11842,7 +13959,7 @@ index 82bcf13a606..a7fb723a145 100755
>   # A symbol stripping program.
>   STRIP=3D$lt_STRIP
>
> -@@ -15376,6 +16067,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_sys=
_global_symbol_to_c_name_address
> +@@ -15569,6 +16259,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_sys=
_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix i=
s needed.
>   global_symbol_to_c_name_address_lib_prefix=3D$lt_lt_cv_sys_global_symbo=
l_to_c_name_address_lib_prefix
>
> @@ -11855,7 +13972,7 @@ index 82bcf13a606..a7fb723a145 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=3D$objdir
>
> -@@ -15385,6 +16082,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> +@@ -15578,6 +16274,9 @@ MAGIC_CMD=3D$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=3D$lt_need_locks
>
> @@ -11865,7 +13982,7 @@ index 82bcf13a606..a7fb723a145 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=3D$lt_DSYMUTIL
>
> -@@ -15499,12 +16199,12 @@ with_gcc=3D$GCC
> +@@ -15692,12 +16391,12 @@ with_gcc=3D$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag
>
> @@ -11881,7 +13998,7 @@ index 82bcf13a606..a7fb723a145 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=3D$lt_lt_prog_compiler_static
>
> -@@ -15591,9 +16291,6 @@ inherit_rpath=3D$inherit_rpath
> +@@ -15784,9 +16483,6 @@ inherit_rpath=3D$inherit_rpath
>   # Whether libtool must link a program against all its dependency librar=
ies.
>   link_all_deplibs=3D$link_all_deplibs
>
> @@ -11891,7 +14008,7 @@ index 82bcf13a606..a7fb723a145 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=3D$always_export_symbols
>
> -@@ -15609,6 +16306,9 @@ include_expsyms=3D$lt_include_expsyms
> +@@ -15802,6 +16498,9 @@ include_expsyms=3D$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with temp=
lates.
>   prelink_cmds=3D$lt_prelink_cmds
>
> @@ -11901,7 +14018,7 @@ index 82bcf13a606..a7fb723a145 100755
>   # Specify filename containing input files.
>   file_list_spec=3D$lt_file_list_spec
>
> -@@ -15641,210 +16341,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> +@@ -15834,210 +16533,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> @@ -12276,7 +14393,7 @@ index 82bcf13a606..a7fb723a145 100755
>     chmod +x "$ofile"
>
>  diff --git a/libtool.m4 b/libtool.m4
> -index 9a13f3b117a..5be47564443 100644
> +index a216bb14e99..e37c45ac0b1 100644
>  --- a/libtool.m4
>  +++ b/libtool.m4
>  @@ -1,7 +1,8 @@
> @@ -12308,7 +14425,7 @@ index 9a13f3b117a..5be47564443 100644
>
>
>   # LT_PREREQ(VERSION)
> -@@ -166,10 +169,13 @@ _LT_DECL([], [exeext], [0], [Executable file suffi=
x (normally "")])dnl
> +@@ -166,10 +168,13 @@ _LT_DECL([], [exeext], [0], [Executable file suffi=
x (normally "")])dnl
>   dnl
>   m4_require([_LT_FILEUTILS_DEFAULTS])dnl
>   m4_require([_LT_CHECK_SHELL_FEATURES])dnl
> @@ -12322,7 +14439,7 @@ index 9a13f3b117a..5be47564443 100644
>
>   _LT_CONFIG_LIBTOOL_INIT([
>   # See if we are running on zsh, and set the options which allow our
> -@@ -632,7 +638,7 @@ m4_ifset([AC_PACKAGE_NAME], [AC_PACKAGE_NAME ])confi=
g.lt[]dnl
> +@@ -632,7 +637,7 @@ m4_ifset([AC_PACKAGE_NAME], [AC_PACKAGE_NAME ])confi=
g.lt[]dnl
>   m4_ifset([AC_PACKAGE_VERSION], [ AC_PACKAGE_VERSION])
>   configured by $[0], generated by m4_PACKAGE_STRING.
>
> @@ -12331,7 +14448,7 @@ index 9a13f3b117a..5be47564443 100644
>   This config.lt script is free software; the Free Software Foundation
>   gives unlimited permision to copy, distribute and modify it."
>
> -@@ -746,15 +752,12 @@ _LT_EOF
> +@@ -746,15 +751,12 @@ _LT_EOF
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> @@ -12351,7 +14468,7 @@ index 9a13f3b117a..5be47564443 100644
>       (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
>     chmod +x "$ofile"
>   ],
> -@@ -980,6 +983,8 @@ _LT_EOF
> +@@ -980,6 +982,8 @@ _LT_EOF
>         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&AS_MESSAGE_LOG_FD
>         echo "$AR cru libconftest.a conftest.o" >&AS_MESSAGE_LOG_FD
>         $AR cru libconftest.a conftest.o 2>&AS_MESSAGE_LOG_FD
> @@ -12360,7 +14477,7 @@ index 9a13f3b117a..5be47564443 100644
>         cat > conftest.c << _LT_EOF
>   int main() { return 0;}
>   _LT_EOF
> -@@ -1069,30 +1074,41 @@ m4_defun([_LT_DARWIN_LINKER_FEATURES],
> +@@ -1069,30 +1073,41 @@ m4_defun([_LT_DARWIN_LINKER_FEATURES],
>     fi
>   ])
>
> @@ -12418,7 +14535,7 @@ index 9a13f3b117a..5be47564443 100644
>   ])# _LT_SYS_MODULE_PATH_AIX
>
>
> -@@ -1117,7 +1133,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -1117,7 +1132,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>
>   AC_MSG_CHECKING([how to print strings])
>   # Test print first, because it will be a builtin if present.
> @@ -12427,7 +14544,7 @@ index 9a13f3b117a..5be47564443 100644
>      test "X`print -r -- $ECHO 2>/dev/null`" =3D "X$ECHO"; then
>     ECHO=3D'print -r --'
>   elif test "X`printf %s $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> -@@ -1161,6 +1177,39 @@ _LT_DECL([], [ECHO], [1], [An echo program that p=
rotects backslashes])
> +@@ -1161,6 +1176,39 @@ _LT_DECL([], [ECHO], [1], [An echo program that p=
rotects backslashes])
>   ])# _LT_PROG_ECHO_BACKSLASH
>
>
> @@ -12467,7 +14584,7 @@ index 9a13f3b117a..5be47564443 100644
>   # _LT_ENABLE_LOCK
>   # ---------------
>   m4_defun([_LT_ENABLE_LOCK],
> -@@ -1320,6 +1369,51 @@ need_locks=3D"$enable_libtool_lock"
> +@@ -1320,6 +1368,51 @@ need_locks=3D"$enable_libtool_lock"
>   ])# _LT_ENABLE_LOCK
>
>
> @@ -12519,7 +14636,7 @@ index 9a13f3b117a..5be47564443 100644
>   # _LT_CMD_OLD_ARCHIVE
>   # -------------------
>   m4_defun([_LT_CMD_OLD_ARCHIVE],
> -@@ -1336,23 +1430,7 @@ for plugin in $plugin_names; do
> +@@ -1336,23 +1429,7 @@ for plugin in $plugin_names; do
>     fi
>   done
>
> @@ -12544,7 +14661,7 @@ index 9a13f3b117a..5be47564443 100644
>
>   AC_CHECK_TOOL(STRIP, strip, :)
>   test -z "$STRIP" && STRIP=3D:
> -@@ -1653,7 +1731,7 @@ else
> +@@ -1653,7 +1730,7 @@ else
>     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
>     lt_status=3D$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> @@ -12553,7 +14670,7 @@ index 9a13f3b117a..5be47564443 100644
>   #include "confdefs.h"
>
>   #if HAVE_DLFCN_H
> -@@ -1697,10 +1775,10 @@ else
> +@@ -1697,10 +1774,10 @@ else
>   /* When -fvisbility=3Dhidden is used, assume the code has been annotate=
d
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=3D =
3)) || (__GNUC__ > 3))
> @@ -12566,7 +14683,7 @@ index 9a13f3b117a..5be47564443 100644
>   int main ()
>   {
>     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -2240,8 +2318,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -2240,8 +2317,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=3Dno
>     need_lib_prefix=3Dno
>
> @@ -12578,7 +14695,7 @@ index 9a13f3b117a..5be47564443 100644
>       library_names_spec=3D'$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds=3D'base_file=3D`basename \${file}`~
> -@@ -2274,13 +2353,71 @@ m4_if([$1], [],[
> +@@ -2274,13 +2352,71 @@ m4_if([$1], [],[
>         library_names_spec=3D'`echo ${libname} | sed -e 's/^lib/pw/'``ech=
o ${release} | $SED -e 's/[[.]]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -12651,16 +14768,7 @@ index 9a13f3b117a..5be47564443 100644
>     # FIXME: first we should search . and the directory the executable is=
 in
>     shlibpath_var=3DPATH
>     ;;
> -@@ -2362,7 +2499,7 @@ haiku*)
> -   soname_spec=3D'${libname}${release}${shared_ext}$major'
> -   shlibpath_var=3DLIBRARY_PATH
> -   shlibpath_overrides_runpath=3Dyes
> --  sys_lib_dlsearch_path_spec=3D'/boot/home/config/lib /boot/common/lib =
/boot/beos/system/lib'
> -+  sys_lib_dlsearch_path_spec=3D'/boot/home/config/lib /boot/common/lib =
/boot/system/lib'
> -   hardcode_into_libs=3Dyes
> -   ;;
> -
> -@@ -2970,6 +3107,11 @@ case $reload_flag in
> +@@ -2970,6 +3106,11 @@ case $reload_flag in
>   esac
>   reload_cmds=3D'$LD$reload_flag -o $output$reload_objs'
>   case $host_os in
> @@ -12672,7 +14780,7 @@ index 9a13f3b117a..5be47564443 100644
>     darwin*)
>       if test "$GCC" =3D yes; then
>         reload_cmds=3D'$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reloa=
d_objs'
> -@@ -3036,7 +3178,8 @@ mingw* | pw32*)
> +@@ -3036,7 +3177,8 @@ mingw* | pw32*)
>       lt_cv_deplibs_check_method=3D'file_magic ^x86 archive import|^x86 D=
LL'
>       lt_cv_file_magic_cmd=3D'func_win32_libid'
>     else
> @@ -12682,7 +14790,7 @@ index 9a13f3b117a..5be47564443 100644
>       lt_cv_file_magic_cmd=3D'$OBJDUMP -f'
>     fi
>     ;;
> -@@ -3187,6 +3330,21 @@ tpf*)
> +@@ -3187,6 +3329,21 @@ tpf*)
>     ;;
>   esac
>   ])
> @@ -12704,7 +14812,7 @@ index 9a13f3b117a..5be47564443 100644
>   file_magic_cmd=3D$lt_cv_file_magic_cmd
>   deplibs_check_method=3D$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=3Dunknown
> -@@ -3194,7 +3352,11 @@ test -z "$deplibs_check_method" && deplibs_check_=
method=3Dunknown
> +@@ -3194,7 +3351,11 @@ test -z "$deplibs_check_method" && deplibs_check_=
method=3Dunknown
>   _LT_DECL([], [deplibs_check_method], [1],
>       [Method to check whether dependent libraries are shared objects])
>   _LT_DECL([], [file_magic_cmd], [1],
> @@ -12717,7 +14825,7 @@ index 9a13f3b117a..5be47564443 100644
>   ])# _LT_CHECK_MAGIC_METHOD
>
>
> -@@ -3297,6 +3459,67 @@ dnl aclocal-1.4 backwards compatibility:
> +@@ -3299,6 +3460,67 @@ dnl aclocal-1.4 backwards compatibility:
>   dnl AC_DEFUN([AM_PROG_NM], [])
>   dnl AC_DEFUN([AC_PROG_NM], [])
>
> @@ -12785,7 +14893,7 @@ index 9a13f3b117a..5be47564443 100644
>
>   # LT_LIB_M
>   # --------
> -@@ -3423,8 +3646,8 @@ esac
> +@@ -3425,8 +3647,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl=3D"sed -n -e 's/^T .* \(.*\)$/extern i=
nt \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>
>   # Transform an extracted symbol line into symbol name and symbol addres=
s
> @@ -12796,7 +14904,7 @@ index 9a13f3b117a..5be47564443 100644
>
>   # Handle CRLF in mingw tool chain
>   opt_cr=3D
> -@@ -3460,6 +3683,7 @@ for ac_symprfx in "" "_"; do
> +@@ -3462,6 +3684,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe=3D"sed -n -e 's/^.*[[   ]]\($symcode$s=
ymcode*\)[[       ]][[    ]]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -12804,7 +14912,7 @@ index 9a13f3b117a..5be47564443 100644
>
>     # Check to see that the pipe works correctly.
>     pipe_works=3Dno
> -@@ -3493,6 +3717,18 @@ _LT_EOF
> +@@ -3495,6 +3718,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>         if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>           cat <<_LT_EOF > conftest.$ac_ext
> @@ -12823,7 +14931,7 @@ index 9a13f3b117a..5be47564443 100644
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -3504,7 +3740,7 @@ _LT_EOF
> +@@ -3506,7 +3741,7 @@ _LT_EOF
>           cat <<_LT_EOF >> conftest.$ac_ext
>
>   /* The mapping between symbol names and symbols.  */
> @@ -12832,7 +14940,7 @@ index 9a13f3b117a..5be47564443 100644
>     const char *name;
>     void       *address;
>   }
> -@@ -3530,15 +3766,15 @@ static const void *lt_preloaded_setup() {
> +@@ -3532,15 +3767,15 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>           # Now try linking the two files.
>           mv conftest.$ac_objext conftstm.$ac_objext
> @@ -12852,7 +14960,7 @@ index 9a13f3b117a..5be47564443 100644
>         else
>           echo "cannot find nm_test_func in $nlist" >&AS_MESSAGE_LOG_FD
>         fi
> -@@ -3571,6 +3807,13 @@ else
> +@@ -3573,6 +3808,13 @@ else
>     AC_MSG_RESULT(ok)
>   fi
>
> @@ -12866,7 +14974,7 @@ index 9a13f3b117a..5be47564443 100644
>   _LT_DECL([global_symbol_pipe], [lt_cv_sys_global_symbol_pipe], [1],
>       [Take the output of nm and produce a listing of raw symbols and C n=
ames])
>   _LT_DECL([global_symbol_to_cdecl], [lt_cv_sys_global_symbol_to_cdecl], =
[1],
> -@@ -3581,6 +3824,8 @@ _LT_DECL([global_symbol_to_c_name_address],
> +@@ -3583,6 +3825,8 @@ _LT_DECL([global_symbol_to_c_name_address],
>   _LT_DECL([global_symbol_to_c_name_address_lib_prefix],
>       [lt_cv_sys_global_symbol_to_c_name_address_lib_prefix], [1],
>       [Transform the output of nm in a C name address pair when lib prefi=
x is needed])
> @@ -12875,7 +14983,7 @@ index 9a13f3b117a..5be47564443 100644
>   ]) # _LT_CMD_GLOBAL_SYMBOLS
>
>
> -@@ -3592,7 +3837,6 @@ _LT_TAGVAR(lt_prog_compiler_wl, $1)=3D
> +@@ -3594,7 +3838,6 @@ _LT_TAGVAR(lt_prog_compiler_wl, $1)=3D
>   _LT_TAGVAR(lt_prog_compiler_pic, $1)=3D
>   _LT_TAGVAR(lt_prog_compiler_static, $1)=3D
>
> @@ -12883,7 +14991,7 @@ index 9a13f3b117a..5be47564443 100644
>   m4_if([$1], [CXX], [
>     # C++ specific cases for pic, static, wl, etc.
>     if test "$GXX" =3D yes; then
> -@@ -3698,6 +3942,12 @@ m4_if([$1], [CXX], [
> +@@ -3700,6 +3943,12 @@ m4_if([$1], [CXX], [
>           ;;
>         esac
>         ;;
> @@ -12896,7 +15004,7 @@ index 9a13f3b117a..5be47564443 100644
>         dgux*)
>         case $cc_basename in
>           ec++*)
> -@@ -3850,7 +4100,7 @@ m4_if([$1], [CXX], [
> +@@ -3852,7 +4101,7 @@ m4_if([$1], [CXX], [
>         ;;
>         solaris*)
>         case $cc_basename in
> @@ -12905,7 +15013,7 @@ index 9a13f3b117a..5be47564443 100644
>             # Sun C++ 4.2, 5.x and Centerline C++
>             _LT_TAGVAR(lt_prog_compiler_pic, $1)=3D'-KPIC'
>             _LT_TAGVAR(lt_prog_compiler_static, $1)=3D'-Bstatic'
> -@@ -4073,6 +4323,12 @@ m4_if([$1], [CXX], [
> +@@ -4075,6 +4324,12 @@ m4_if([$1], [CXX], [
>         _LT_TAGVAR(lt_prog_compiler_pic, $1)=3D'--shared'
>         _LT_TAGVAR(lt_prog_compiler_static, $1)=3D'--static'
>         ;;
> @@ -12918,7 +15026,7 @@ index 9a13f3b117a..5be47564443 100644
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>         # which looks to be a dead project)
> -@@ -4135,7 +4391,7 @@ m4_if([$1], [CXX], [
> +@@ -4137,7 +4392,7 @@ m4_if([$1], [CXX], [
>         _LT_TAGVAR(lt_prog_compiler_pic, $1)=3D'-KPIC'
>         _LT_TAGVAR(lt_prog_compiler_static, $1)=3D'-Bstatic'
>         case $cc_basename in
> @@ -12927,7 +15035,7 @@ index 9a13f3b117a..5be47564443 100644
>         _LT_TAGVAR(lt_prog_compiler_wl, $1)=3D'-Qoption ld ';;
>         *)
>         _LT_TAGVAR(lt_prog_compiler_wl, $1)=3D'-Wl,';;
> -@@ -4192,9 +4448,11 @@ case $host_os in
> +@@ -4194,9 +4449,11 @@ case $host_os in
>       _LT_TAGVAR(lt_prog_compiler_pic, $1)=3D"$_LT_TAGVAR(lt_prog_compile=
r_pic, $1)@&t@m4_if([$1],[],[ -DPIC],[m4_if([$1],[CXX],[ -DPIC],[])])"
>       ;;
>   esac
> @@ -12942,7 +15050,7 @@ index 9a13f3b117a..5be47564443 100644
>
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -4213,6 +4471,8 @@ fi
> +@@ -4215,6 +4472,8 @@ fi
>   _LT_TAGDECL([pic_flag], [lt_prog_compiler_pic], [1],
>         [Additional compiler flags for building library objects])
>
> @@ -12951,7 +15059,7 @@ index 9a13f3b117a..5be47564443 100644
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -4233,6 +4493,7 @@ _LT_TAGDECL([link_static_flag], [lt_prog_compiler_=
static], [1],
> +@@ -4235,6 +4494,7 @@ _LT_TAGDECL([link_static_flag], [lt_prog_compiler_=
static], [1],
>   m4_defun([_LT_LINKER_SHLIBS],
>   [AC_REQUIRE([LT_PATH_LD])dnl
>   AC_REQUIRE([LT_PATH_NM])dnl
> @@ -12959,7 +15067,7 @@ index 9a13f3b117a..5be47564443 100644
>   m4_require([_LT_FILEUTILS_DEFAULTS])dnl
>   m4_require([_LT_DECL_EGREP])dnl
>   m4_require([_LT_DECL_SED])dnl
> -@@ -4241,6 +4502,7 @@ m4_require([_LT_TAG_COMPILER])dnl
> +@@ -4243,6 +4503,7 @@ m4_require([_LT_TAG_COMPILER])dnl
>   AC_MSG_CHECKING([whether the $compiler linker ($LD) supports shared lib=
raries])
>   m4_if([$1], [CXX], [
>     _LT_TAGVAR(export_symbols_cmds, $1)=3D'$NM $libobjs $convenience | $g=
lobal_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
> @@ -12967,7 +15075,7 @@ index 9a13f3b117a..5be47564443 100644
>     case $host_os in
>     aix[[4-9]]*)
>       # If we're using GNU nm, then we don't want the "-C" option.
> -@@ -4255,15 +4517,20 @@ m4_if([$1], [CXX], [
> +@@ -4257,15 +4518,20 @@ m4_if([$1], [CXX], [
>       ;;
>     pw32*)
>       _LT_TAGVAR(export_symbols_cmds, $1)=3D"$ltdll_cmds"
> @@ -12993,7 +15101,7 @@ index 9a13f3b117a..5be47564443 100644
>   ], [
>     runpath_var=3D
>     _LT_TAGVAR(allow_undefined_flag, $1)=3D
> -@@ -4431,7 +4698,8 @@ _LT_EOF
> +@@ -4433,7 +4699,8 @@ _LT_EOF
>         _LT_TAGVAR(allow_undefined_flag, $1)=3Dunsupported
>         _LT_TAGVAR(always_export_symbols, $1)=3Dno
>         _LT_TAGVAR(enable_shared_with_static_runtimes, $1)=3Dyes
> @@ -13003,7 +15111,7 @@ index 9a13f3b117a..5be47564443 100644
>
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           _LT_TAGVAR(archive_cmds, $1)=3D'$CC -shared $libobjs $deplibs $=
compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xli=
nker --out-implib -Xlinker $lib'
> -@@ -4530,12 +4798,12 @@ _LT_EOF
> +@@ -4532,12 +4799,12 @@ _LT_EOF
>           _LT_TAGVAR(whole_archive_flag_spec, $1)=3D'--whole-archive$conv=
enience --no-whole-archive'
>           _LT_TAGVAR(hardcode_libdir_flag_spec, $1)=3D
>           _LT_TAGVAR(hardcode_libdir_flag_spec_ld, $1)=3D'-rpath $libdir'
> @@ -13018,7 +15126,7 @@ index 9a13f3b117a..5be47564443 100644
>           fi
>           ;;
>         esac
> -@@ -4549,8 +4817,8 @@ _LT_EOF
> +@@ -4551,8 +4818,8 @@ _LT_EOF
>         _LT_TAGVAR(archive_cmds, $1)=3D'$LD -Bshareable $libobjs $deplibs=
 $linker_flags -o $lib'
>         wlarc=3D
>         else
> @@ -13029,7 +15137,7 @@ index 9a13f3b117a..5be47564443 100644
>         fi
>         ;;
>
> -@@ -4568,8 +4836,8 @@ _LT_EOF
> +@@ -4570,8 +4837,8 @@ _LT_EOF
>
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/=
null; then
> @@ -13040,7 +15148,7 @@ index 9a13f3b117a..5be47564443 100644
>         else
>         _LT_TAGVAR(ld_shlibs, $1)=3Dno
>         fi
> -@@ -4615,8 +4883,8 @@ _LT_EOF
> +@@ -4617,8 +4884,8 @@ _LT_EOF
>
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/nu=
ll; then
> @@ -13051,7 +15159,7 @@ index 9a13f3b117a..5be47564443 100644
>         else
>         _LT_TAGVAR(ld_shlibs, $1)=3Dno
>         fi
> -@@ -4746,7 +5014,7 @@ _LT_EOF
> +@@ -4748,7 +5015,7 @@ _LT_EOF
>         _LT_TAGVAR(allow_undefined_flag, $1)=3D'-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -13060,7 +15168,7 @@ index 9a13f3b117a..5be47564443 100644
>           _LT_TAGVAR(hardcode_libdir_flag_spec, $1)=3D'${wl}-blibpath:$li=
bdir:'"$aix_libpath"
>           _LT_TAGVAR(archive_expsym_cmds, $1)=3D'$CC -o $output_objdir/$s=
oname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "=
x${allow_undefined_flag}" !=3D "x"; then func_echo_all "${wl}${allow_undefi=
ned_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag=
"
>         else
> -@@ -4757,7 +5025,7 @@ _LT_EOF
> +@@ -4759,7 +5026,7 @@ _LT_EOF
>         else
>          # Determine the default libpath from the value encoded in an
>          # empty executable.
> @@ -13069,7 +15177,7 @@ index 9a13f3b117a..5be47564443 100644
>          _LT_TAGVAR(hardcode_libdir_flag_spec, $1)=3D'${wl}-blibpath:$lib=
dir:'"$aix_libpath"
>           # Warning - without using the other run time loading flags,
>           # -berok will link without error, but may produce a broken libr=
ary.
> -@@ -4801,20 +5069,63 @@ _LT_EOF
> +@@ -4803,20 +5070,63 @@ _LT_EOF
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
>         # no search path for DLLs.
> @@ -13147,7 +15255,7 @@ index 9a13f3b117a..5be47564443 100644
>         ;;
>
>       darwin* | rhapsody*)
> -@@ -4848,7 +5159,7 @@ _LT_EOF
> +@@ -4850,7 +5160,7 @@ _LT_EOF
>
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -13156,7 +15264,7 @@ index 9a13f3b117a..5be47564443 100644
>         _LT_TAGVAR(hardcode_libdir_flag_spec, $1)=3D'-R$libdir'
>         _LT_TAGVAR(hardcode_direct, $1)=3Dyes
>         _LT_TAGVAR(hardcode_shlibpath_var, $1)=3Dno
> -@@ -4856,7 +5167,7 @@ _LT_EOF
> +@@ -4858,7 +5168,7 @@ _LT_EOF
>
>       hpux9*)
>         if test "$GCC" =3D yes; then
> @@ -13165,7 +15273,7 @@ index 9a13f3b117a..5be47564443 100644
>         else
>         _LT_TAGVAR(archive_cmds, $1)=3D'$RM $output_objdir/$soname~$LD -b=
 +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_fla=
gs~test $output_objdir/$soname =3D $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -4872,7 +5183,7 @@ _LT_EOF
> +@@ -4874,7 +5184,7 @@ _LT_EOF
>
>       hpux10*)
>         if test "$GCC" =3D yes && test "$with_gnu_ld" =3D no; then
> @@ -13174,7 +15282,7 @@ index 9a13f3b117a..5be47564443 100644
>         else
>         _LT_TAGVAR(archive_cmds, $1)=3D'$LD -b +h $soname +b $install_lib=
dir -o $lib $libobjs $deplibs $linker_flags'
>         fi
> -@@ -4896,10 +5207,10 @@ _LT_EOF
> +@@ -4898,10 +5208,10 @@ _LT_EOF
>           _LT_TAGVAR(archive_cmds, $1)=3D'$CC -shared ${wl}+h ${wl}$sonam=
e -o $lib $libobjs $deplibs $compiler_flags'
>           ;;
>         ia64*)
> @@ -13187,7 +15295,7 @@ index 9a13f3b117a..5be47564443 100644
>           ;;
>         esac
>         else
> -@@ -4946,16 +5257,31 @@ _LT_EOF
> +@@ -4948,16 +5258,31 @@ _LT_EOF
>
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" =3D yes; then
> @@ -13226,7 +15334,7 @@ index 9a13f3b117a..5be47564443 100644
>         else
>         _LT_TAGVAR(archive_cmds, $1)=3D'$CC -shared $libobjs $deplibs $co=
mpiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_v=
ersion $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
>         _LT_TAGVAR(archive_expsym_cmds, $1)=3D'$CC -shared $libobjs $depl=
ibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all =
"-set_version $verstring"` -update_registry ${output_objdir}/so_locations -=
exports_file $export_symbols -o $lib'
> -@@ -5040,7 +5366,7 @@ _LT_EOF
> +@@ -5042,7 +5367,7 @@ _LT_EOF
>       osf4* | osf5*)    # as osf3* with the addition of -msym flag
>         if test "$GCC" =3D yes; then
>         _LT_TAGVAR(allow_undefined_flag, $1)=3D' ${wl}-expect_unresolved =
${wl}\*'
> @@ -13235,7 +15343,7 @@ index 9a13f3b117a..5be47564443 100644
>         _LT_TAGVAR(hardcode_libdir_flag_spec, $1)=3D'${wl}-rpath ${wl}$li=
bdir'
>         else
>         _LT_TAGVAR(allow_undefined_flag, $1)=3D' -expect_unresolved \*'
> -@@ -5059,9 +5385,9 @@ _LT_EOF
> +@@ -5061,9 +5386,9 @@ _LT_EOF
>         _LT_TAGVAR(no_undefined_flag, $1)=3D' -z defs'
>         if test "$GCC" =3D yes; then
>         wlarc=3D'${wl}'
> @@ -13247,7 +15355,7 @@ index 9a13f3b117a..5be47564443 100644
>         else
>         case `$CC -V 2>&1` in
>         *"Compilers 5.0"*)
> -@@ -5333,8 +5659,6 @@ _LT_TAGDECL([], [inherit_rpath], [0],
> +@@ -5335,8 +5660,6 @@ _LT_TAGDECL([], [inherit_rpath], [0],
>       to runtime path list])
>   _LT_TAGDECL([], [link_all_deplibs], [0],
>       [Whether libtool must link a program against all its dependency lib=
raries])
> @@ -13256,7 +15364,7 @@ index 9a13f3b117a..5be47564443 100644
>   _LT_TAGDECL([], [always_export_symbols], [0],
>       [Set to "yes" if exported symbols are required])
>   _LT_TAGDECL([], [export_symbols_cmds], [2],
> -@@ -5345,6 +5669,8 @@ _LT_TAGDECL([], [include_expsyms], [1],
> +@@ -5347,6 +5670,8 @@ _LT_TAGDECL([], [include_expsyms], [1],
>       [Symbols that must always be exported])
>   _LT_TAGDECL([], [prelink_cmds], [2],
>       [Commands necessary for linking programs (against libraries) with t=
emplates])
> @@ -13265,7 +15373,7 @@ index 9a13f3b117a..5be47564443 100644
>   _LT_TAGDECL([], [file_list_spec], [1],
>       [Specify filename containing input files])
>   dnl FIXME: Not yet implemented
> -@@ -5446,6 +5772,7 @@ CC=3D"$lt_save_CC"
> +@@ -5448,6 +5773,7 @@ CC=3D"$lt_save_CC"
>   m4_defun([_LT_LANG_CXX_CONFIG],
>   [m4_require([_LT_FILEUTILS_DEFAULTS])dnl
>   m4_require([_LT_DECL_EGREP])dnl
> @@ -13273,7 +15381,7 @@ index 9a13f3b117a..5be47564443 100644
>   if test -n "$CXX" && ( test "X$CXX" !=3D "Xno" &&
>       ( (test "X$CXX" =3D "Xg++" && `g++ -v >/dev/null 2>&1` ) ||
>       (test "X$CXX" !=3D "Xg++"))) ; then
> -@@ -5507,6 +5834,7 @@ if test "$_lt_caught_CXX_error" !=3D yes; then
> +@@ -5509,6 +5835,7 @@ if test "$_lt_caught_CXX_error" !=3D yes; then
>
>     # Allow CC to be a program name with arguments.
>     lt_save_CC=3D$CC
> @@ -13281,7 +15389,7 @@ index 9a13f3b117a..5be47564443 100644
>     lt_save_LD=3D$LD
>     lt_save_GCC=3D$GCC
>     GCC=3D$GXX
> -@@ -5524,6 +5852,7 @@ if test "$_lt_caught_CXX_error" !=3D yes; then
> +@@ -5526,6 +5853,7 @@ if test "$_lt_caught_CXX_error" !=3D yes; then
>     fi
>     test -z "${LDCXX+set}" || LD=3D$LDCXX
>     CC=3D${CXX-"c++"}
> @@ -13289,7 +15397,7 @@ index 9a13f3b117a..5be47564443 100644
>     compiler=3D$CC
>     _LT_TAGVAR(compiler, $1)=3D$CC
>     _LT_CC_BASENAME([$compiler])
> -@@ -5687,7 +6016,7 @@ if test "$_lt_caught_CXX_error" !=3D yes; then
> +@@ -5689,7 +6017,7 @@ if test "$_lt_caught_CXX_error" !=3D yes; then
>             _LT_TAGVAR(allow_undefined_flag, $1)=3D'-berok'
>             # Determine the default libpath from the value encoded in an =
empty
>             # executable.
> @@ -13298,7 +15406,7 @@ index 9a13f3b117a..5be47564443 100644
>             _LT_TAGVAR(hardcode_libdir_flag_spec, $1)=3D'${wl}-blibpath:$=
libdir:'"$aix_libpath"
>
>             _LT_TAGVAR(archive_expsym_cmds, $1)=3D'$CC -o $output_objdir/=
$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test=
 "x${allow_undefined_flag}" !=3D "x"; then func_echo_all "${wl}${allow_unde=
fined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_fl=
ag"
> -@@ -5699,7 +6028,7 @@ if test "$_lt_caught_CXX_error" !=3D yes; then
> +@@ -5701,7 +6029,7 @@ if test "$_lt_caught_CXX_error" !=3D yes; then
>             else
>             # Determine the default libpath from the value encoded in an
>             # empty executable.
> @@ -13307,7 +15415,7 @@ index 9a13f3b117a..5be47564443 100644
>             _LT_TAGVAR(hardcode_libdir_flag_spec, $1)=3D'${wl}-blibpath:$=
libdir:'"$aix_libpath"
>             # Warning - without using the other run time loading flags,
>             # -berok will link without error, but may produce a broken li=
brary.
> -@@ -5741,29 +6070,75 @@ if test "$_lt_caught_CXX_error" !=3D yes; then
> +@@ -5743,29 +6071,75 @@ if test "$_lt_caught_CXX_error" !=3D yes; then
>           ;;
>
>         cygwin* | mingw* | pw32* | cegcc*)
> @@ -13406,7 +15514,7 @@ index 9a13f3b117a..5be47564443 100644
>         darwin* | rhapsody*)
>           _LT_DARWIN_LINKER_FEATURES($1)
>         ;;
> -@@ -5838,7 +6213,7 @@ if test "$_lt_caught_CXX_error" !=3D yes; then
> +@@ -5840,7 +6214,7 @@ if test "$_lt_caught_CXX_error" !=3D yes; then
>               ;;
>             *)
>               if test "$GXX" =3D yes; then
> @@ -13415,7 +15523,7 @@ index 9a13f3b117a..5be47564443 100644
>               else
>                 # FIXME: insert proper C++ library support
>                 _LT_TAGVAR(ld_shlibs, $1)=3Dno
> -@@ -5909,10 +6284,10 @@ if test "$_lt_caught_CXX_error" !=3D yes; then
> +@@ -5911,10 +6285,10 @@ if test "$_lt_caught_CXX_error" !=3D yes; then
>                     _LT_TAGVAR(archive_cmds, $1)=3D'$CC -shared -nostdlib=
 -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $post=
dep_objects $compiler_flags'
>                     ;;
>                   ia64*)
> @@ -13428,7 +15536,7 @@ index 9a13f3b117a..5be47564443 100644
>                     ;;
>                 esac
>               fi
> -@@ -5953,9 +6328,9 @@ if test "$_lt_caught_CXX_error" !=3D yes; then
> +@@ -5955,9 +6329,9 @@ if test "$_lt_caught_CXX_error" !=3D yes; then
>             *)
>             if test "$GXX" =3D yes; then
>               if test "$with_gnu_ld" =3D no; then
> @@ -13440,7 +15548,7 @@ index 9a13f3b117a..5be47564443 100644
>               fi
>             fi
>             _LT_TAGVAR(link_all_deplibs, $1)=3Dyes
> -@@ -6025,20 +6400,20 @@ if test "$_lt_caught_CXX_error" !=3D yes; then
> +@@ -6027,20 +6401,20 @@ if test "$_lt_caught_CXX_error" !=3D yes; then
>               _LT_TAGVAR(prelink_cmds, $1)=3D'tpldir=3DTemplate.dir~
>                 rm -rf $tpldir~
>                 $CC --prelink_objects --instantiation_dir $tpldir $objs $=
libobjs $compile_deplibs~
> @@ -13465,7 +15573,7 @@ index 9a13f3b117a..5be47564443 100644
>               ;;
>             *) # Version 6 and above use weak symbols
>               _LT_TAGVAR(archive_cmds, $1)=3D'$CC -shared $pic_flag $pred=
ep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname =
${wl}$soname -o $lib'
> -@@ -6233,7 +6608,7 @@ if test "$_lt_caught_CXX_error" !=3D yes; then
> +@@ -6235,7 +6609,7 @@ if test "$_lt_caught_CXX_error" !=3D yes; then
>                   _LT_TAGVAR(archive_cmds, $1)=3D'$CC -shared -nostdlib $=
{allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $=
compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo=
_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${outp=
ut_objdir}/so_locations -o $lib'
>                   ;;
>                 *)
> @@ -13474,7 +15582,7 @@ index 9a13f3b117a..5be47564443 100644
>                   ;;
>               esac
>
> -@@ -6279,7 +6654,7 @@ if test "$_lt_caught_CXX_error" !=3D yes; then
> +@@ -6281,7 +6655,7 @@ if test "$_lt_caught_CXX_error" !=3D yes; then
>
>         solaris*)
>           case $cc_basename in
> @@ -13483,7 +15591,7 @@ index 9a13f3b117a..5be47564443 100644
>             # Sun C++ 4.2, 5.x and Centerline C++
>               _LT_TAGVAR(archive_cmds_need_lc,$1)=3Dyes
>             _LT_TAGVAR(no_undefined_flag, $1)=3D' -zdefs'
> -@@ -6320,9 +6695,9 @@ if test "$_lt_caught_CXX_error" !=3D yes; then
> +@@ -6322,9 +6696,9 @@ if test "$_lt_caught_CXX_error" !=3D yes; then
>             if test "$GXX" =3D yes && test "$with_gnu_ld" =3D no; then
>               _LT_TAGVAR(no_undefined_flag, $1)=3D' ${wl}-z ${wl}defs'
>               if $CC --version | $GREP -v '^2\.7' > /dev/null; then
> @@ -13495,7 +15603,7 @@ index 9a13f3b117a..5be47564443 100644
>
>                 # Commands to make compiler produce verbose output that l=
ists
>                 # what "hidden" libraries, object files and flags are use=
d when
> -@@ -6451,6 +6826,7 @@ if test "$_lt_caught_CXX_error" !=3D yes; then
> +@@ -6453,6 +6827,7 @@ if test "$_lt_caught_CXX_error" !=3D yes; then
>     fi # test -n "$compiler"
>
>     CC=3D$lt_save_CC
> @@ -13503,7 +15611,7 @@ index 9a13f3b117a..5be47564443 100644
>     LDCXX=3D$LD
>     LD=3D$lt_save_LD
>     GCC=3D$lt_save_GCC
> -@@ -6465,6 +6841,29 @@ AC_LANG_POP
> +@@ -6467,6 +6842,29 @@ AC_LANG_POP
>   ])# _LT_LANG_CXX_CONFIG
>
>
> @@ -13533,7 +15641,7 @@ index 9a13f3b117a..5be47564443 100644
>   # _LT_SYS_HIDDEN_LIBDEPS([TAGNAME])
>   # ---------------------------------
>   # Figure out "hidden" library dependencies from verbose
> -@@ -6473,6 +6872,7 @@ AC_LANG_POP
> +@@ -6475,6 +6873,7 @@ AC_LANG_POP
>   # objects, libraries and library flags.
>   m4_defun([_LT_SYS_HIDDEN_LIBDEPS],
>   [m4_require([_LT_FILEUTILS_DEFAULTS])dnl
> @@ -13541,7 +15649,7 @@ index 9a13f3b117a..5be47564443 100644
>   # Dependencies to place before and after the object being linked:
>   _LT_TAGVAR(predep_objects, $1)=3D
>   _LT_TAGVAR(postdep_objects, $1)=3D
> -@@ -6523,6 +6923,13 @@ public class foo {
> +@@ -6525,6 +6924,13 @@ public class foo {
>   };
>   _LT_EOF
>   ])
> @@ -13555,7 +15663,7 @@ index 9a13f3b117a..5be47564443 100644
>   dnl Parse the compiler output and extract the necessary
>   dnl objects, libraries and library flags.
>   if AC_TRY_EVAL(ac_compile); then
> -@@ -6534,7 +6941,7 @@ if AC_TRY_EVAL(ac_compile); then
> +@@ -6536,7 +6942,7 @@ if AC_TRY_EVAL(ac_compile); then
>     pre_test_object_deps_done=3Dno
>
>     for p in `eval "$output_verbose_link_cmd"`; do
> @@ -13564,7 +15672,7 @@ index 9a13f3b117a..5be47564443 100644
>
>       -L* | -R* | -l*)
>          # Some compilers place space between "-{L,R}" and the path.
> -@@ -6543,13 +6950,22 @@ if AC_TRY_EVAL(ac_compile); then
> +@@ -6545,13 +6951,22 @@ if AC_TRY_EVAL(ac_compile); then
>             test $p =3D "-R"; then
>          prev=3D$p
>          continue
> @@ -13591,7 +15699,7 @@ index 9a13f3b117a..5be47564443 100644
>            # Internal compiler library paths should come after those
>            # provided the user.  The postdeps already come after the
>            # user supplied libs so there is no need to process them.
> -@@ -6569,8 +6985,10 @@ if AC_TRY_EVAL(ac_compile); then
> +@@ -6571,8 +6986,10 @@ if AC_TRY_EVAL(ac_compile); then
>            _LT_TAGVAR(postdeps, $1)=3D"${_LT_TAGVAR(postdeps, $1)} ${prev=
}${p}"
>          fi
>          fi
> @@ -13602,7 +15710,7 @@ index 9a13f3b117a..5be47564443 100644
>       *.$objext)
>          # This assumes that the test object file only shows up
>          # once in the compiler output.
> -@@ -6606,6 +7024,7 @@ else
> +@@ -6608,6 +7025,7 @@ else
>   fi
>
>   $RM -f confest.$objext
> @@ -13610,7 +15718,7 @@ index 9a13f3b117a..5be47564443 100644
>
>   # PORTME: override above test on systems where it is broken
>   m4_if([$1], [CXX],
> -@@ -6642,7 +7061,7 @@ linux*)
> +@@ -6644,7 +7062,7 @@ linux*)
>
>   solaris*)
>     case $cc_basename in
> @@ -13619,7 +15727,7 @@ index 9a13f3b117a..5be47564443 100644
>       # The more standards-conforming stlport4 library is
>       # incompatible with the Cstd library. Avoid specifying
>       # it if it's in CXXFLAGS. Ignore libCrun as
> -@@ -6755,7 +7174,9 @@ if test "$_lt_disable_F77" !=3D yes; then
> +@@ -6757,7 +7175,9 @@ if test "$_lt_disable_F77" !=3D yes; then
>     # Allow CC to be a program name with arguments.
>     lt_save_CC=3D"$CC"
>     lt_save_GCC=3D$GCC
> @@ -13629,7 +15737,7 @@ index 9a13f3b117a..5be47564443 100644
>     compiler=3D$CC
>     _LT_TAGVAR(compiler, $1)=3D$CC
>     _LT_CC_BASENAME([$compiler])
> -@@ -6809,6 +7230,7 @@ if test "$_lt_disable_F77" !=3D yes; then
> +@@ -6811,6 +7231,7 @@ if test "$_lt_disable_F77" !=3D yes; then
>
>     GCC=3D$lt_save_GCC
>     CC=3D"$lt_save_CC"
> @@ -13637,7 +15745,7 @@ index 9a13f3b117a..5be47564443 100644
>   fi # test "$_lt_disable_F77" !=3D yes
>
>   AC_LANG_POP
> -@@ -6885,7 +7307,9 @@ if test "$_lt_disable_FC" !=3D yes; then
> +@@ -6887,7 +7308,9 @@ if test "$_lt_disable_FC" !=3D yes; then
>     # Allow CC to be a program name with arguments.
>     lt_save_CC=3D"$CC"
>     lt_save_GCC=3D$GCC
> @@ -13647,7 +15755,7 @@ index 9a13f3b117a..5be47564443 100644
>     compiler=3D$CC
>     GCC=3D$ac_cv_fc_compiler_gnu
>
> -@@ -6941,7 +7365,8 @@ if test "$_lt_disable_FC" !=3D yes; then
> +@@ -6943,7 +7366,8 @@ if test "$_lt_disable_FC" !=3D yes; then
>     fi # test -n "$compiler"
>
>     GCC=3D$lt_save_GCC
> @@ -13657,7 +15765,7 @@ index 9a13f3b117a..5be47564443 100644
>   fi # test "$_lt_disable_FC" !=3D yes
>
>   AC_LANG_POP
> -@@ -6978,10 +7403,12 @@ _LT_COMPILER_BOILERPLATE
> +@@ -6980,10 +7404,12 @@ _LT_COMPILER_BOILERPLATE
>   _LT_LINKER_BOILERPLATE
>
>   # Allow CC to be a program name with arguments.
> @@ -13671,7 +15779,7 @@ index 9a13f3b117a..5be47564443 100644
>   compiler=3D$CC
>   _LT_TAGVAR(compiler, $1)=3D$CC
>   _LT_TAGVAR(LD, $1)=3D"$LD"
> -@@ -7012,7 +7439,8 @@ fi
> +@@ -7014,7 +7440,8 @@ fi
>   AC_LANG_RESTORE
>
>   GCC=3D$lt_save_GCC
> @@ -13681,7 +15789,7 @@ index 9a13f3b117a..5be47564443 100644
>   ])# _LT_LANG_GCJ_CONFIG
>
>
> -@@ -7047,9 +7475,11 @@ _LT_LINKER_BOILERPLATE
> +@@ -7049,9 +7476,11 @@ _LT_LINKER_BOILERPLATE
>
>   # Allow CC to be a program name with arguments.
>   lt_save_CC=3D"$CC"
> @@ -13693,7 +15801,7 @@ index 9a13f3b117a..5be47564443 100644
>   compiler=3D$CC
>   _LT_TAGVAR(compiler, $1)=3D$CC
>   _LT_CC_BASENAME([$compiler])
> -@@ -7062,7 +7492,8 @@ fi
> +@@ -7064,7 +7493,8 @@ fi
>
>   GCC=3D$lt_save_GCC
>   AC_LANG_RESTORE
> @@ -13703,7 +15811,7 @@ index 9a13f3b117a..5be47564443 100644
>   ])# _LT_LANG_RC_CONFIG
>
>
> -@@ -7121,6 +7552,15 @@ _LT_DECL([], [OBJDUMP], [1], [An object symbol du=
mper])
> +@@ -7123,6 +7553,15 @@ _LT_DECL([], [OBJDUMP], [1], [An object symbol du=
mper])
>   AC_SUBST([OBJDUMP])
>   ])
>
> @@ -13719,7 +15827,7 @@ index 9a13f3b117a..5be47564443 100644
>
>   # _LT_DECL_SED
>   # ------------
> -@@ -7214,8 +7654,8 @@ m4_defun([_LT_CHECK_SHELL_FEATURES],
> +@@ -7216,8 +7655,8 @@ m4_defun([_LT_CHECK_SHELL_FEATURES],
>   # Try some XSI features
>   xsi_shell=3Dno
>   ( _lt_dummy=3D"a/b/c"
> @@ -13730,7 +15838,7 @@ index 9a13f3b117a..5be47564443 100644
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=3Dyes
> -@@ -7254,206 +7694,162 @@ _LT_DECL([NL2SP], [lt_NL2SP], [1], [turn newli=
nes into spaces])dnl
> +@@ -7256,206 +7695,162 @@ _LT_DECL([NL2SP], [lt_NL2SP], [1], [turn newli=
nes into spaces])dnl
>   ])# _LT_CHECK_SHELL_FEATURES
>
>
> @@ -19364,10 +21472,10 @@ index bf92b5e0790..c573da90c5c 100644
>   # These exist entirely to fool aclocal when bootstrapping libtool.
>   #
>  diff --git a/opcodes/configure b/opcodes/configure
> -index 3513e408ce1..133948631e9 100755
> +index 6690a502b2f..badcc0776df 100755
>  --- a/opcodes/configure
>  +++ b/opcodes/configure
> -@@ -680,6 +680,9 @@ OTOOL
> +@@ -682,6 +682,9 @@ OTOOL
>   LIPO
>   NMEDIT
>   DSYMUTIL
> @@ -19377,7 +21485,7 @@ index 3513e408ce1..133948631e9 100755
>   OBJDUMP
>   LN_S
>   NM
> -@@ -798,6 +801,7 @@ enable_static
> +@@ -800,6 +803,7 @@ enable_static
>   with_pic
>   enable_fast_install
>   with_gnu_ld
> @@ -19385,7 +21493,7 @@ index 3513e408ce1..133948631e9 100755
>   enable_libtool_lock
>   enable_checking
>   enable_targets
> -@@ -1464,6 +1468,8 @@ Optional Packages:
> +@@ -1468,6 +1472,8 @@ Optional Packages:
>     --with-pic              try to use only PIC/non-PIC objects [default=
=3Duse
>                             both]
>     --with-gnu-ld           assume the C compiler uses GNU ld [default=3D=
no]
> @@ -19394,7 +21502,7 @@ index 3513e408ce1..133948631e9 100755
>
>   Some influential environment variables:
>     CC          C compiler command
> -@@ -4751,8 +4757,8 @@ esac
> +@@ -4977,8 +4983,8 @@ esac
>
>
>
> @@ -19405,7 +21513,7 @@ index 3513e408ce1..133948631e9 100755
>
>
>
> -@@ -4792,7 +4798,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -5018,7 +5024,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings"=
 >&5
>   $as_echo_n "checking how to print strings... " >&6; }
>   # Test print first, because it will be a builtin if present.
> @@ -19414,7 +21522,7 @@ index 3513e408ce1..133948631e9 100755
>      test "X`print -r -- $ECHO 2>/dev/null`" =3D "X$ECHO"; then
>     ECHO=3D'print -r --'
>   elif test "X`printf %s $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> -@@ -5478,8 +5484,8 @@ $as_echo_n "checking whether the shell understands=
 some XSI constructs... " >&6;
> +@@ -5705,8 +5711,8 @@ $as_echo_n "checking whether the shell understands=
 some XSI constructs... " >&6;
>   # Try some XSI features
>   xsi_shell=3Dno
>   ( _lt_dummy=3D"a/b/c"
> @@ -19425,7 +21533,7 @@ index 3513e408ce1..133948631e9 100755
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=3Dyes
> -@@ -5528,6 +5534,80 @@ esac
> +@@ -5755,6 +5761,80 @@ esac
>
>
>
> @@ -19506,7 +21614,7 @@ index 3513e408ce1..133948631e9 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to rel=
oad object files" >&5
>   $as_echo_n "checking for $LD option to reload object files... " >&6; }
>   if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -5544,6 +5624,11 @@ case $reload_flag in
> +@@ -5771,6 +5851,11 @@ case $reload_flag in
>   esac
>   reload_cmds=3D'$LD$reload_flag -o $output$reload_objs'
>   case $host_os in
> @@ -19518,7 +21626,7 @@ index 3513e408ce1..133948631e9 100755
>     darwin*)
>       if test "$GCC" =3D yes; then
>         reload_cmds=3D'$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reloa=
d_objs'
> -@@ -5712,7 +5797,8 @@ mingw* | pw32*)
> +@@ -5939,7 +6024,8 @@ mingw* | pw32*)
>       lt_cv_deplibs_check_method=3D'file_magic ^x86 archive import|^x86 D=
LL'
>       lt_cv_file_magic_cmd=3D'func_win32_libid'
>     else
> @@ -19528,7 +21636,7 @@ index 3513e408ce1..133948631e9 100755
>       lt_cv_file_magic_cmd=3D'$OBJDUMP -f'
>     fi
>     ;;
> -@@ -5866,6 +5952,21 @@ esac
> +@@ -6093,6 +6179,21 @@ esac
>   fi
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_m=
ethod" >&5
>   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -19550,7 +21658,7 @@ index 3513e408ce1..133948631e9 100755
>   file_magic_cmd=3D$lt_cv_file_magic_cmd
>   deplibs_check_method=3D$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=3Dunknown
> -@@ -5881,6 +5982,157 @@ test -z "$deplibs_check_method" && deplibs_check=
_method=3Dunknown
> +@@ -6108,6 +6209,157 @@ test -z "$deplibs_check_method" && deplibs_check=
_method=3Dunknown
>
>
>
> @@ -19708,7 +21816,7 @@ index 3513e408ce1..133948631e9 100755
>   plugin_option=3D
>   plugin_names=3D"liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dl=
l"
>   for plugin in $plugin_names; do
> -@@ -5895,8 +6147,10 @@ for plugin in $plugin_names; do
> +@@ -6122,8 +6374,10 @@ for plugin in $plugin_names; do
>   done
>
>   if test -n "$ac_tool_prefix"; then
> @@ -19721,7 +21829,7 @@ index 3513e408ce1..133948631e9 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_AR+:} false; then :
> -@@ -5912,7 +6166,7 @@ do
> +@@ -6139,7 +6393,7 @@ do
>     test -z "$as_dir" && as_dir=3D.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -19730,7 +21838,7 @@ index 3513e408ce1..133948631e9 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_ex=
ec_ext" >&5
>       break 2
>     fi
> -@@ -5932,11 +6186,15 @@ $as_echo "no" >&6; }
> +@@ -6159,11 +6413,15 @@ $as_echo "no" >&6; }
>   fi
>
>
> @@ -19749,7 +21857,7 @@ index 3513e408ce1..133948631e9 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -5952,7 +6210,7 @@ do
> +@@ -6179,7 +6437,7 @@ do
>     test -z "$as_dir" && as_dir=3D.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -19758,7 +21866,7 @@ index 3513e408ce1..133948631e9 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_ex=
ec_ext" >&5
>       break 2
>     fi
> -@@ -5971,6 +6229,10 @@ else
> +@@ -6198,6 +6456,10 @@ else
>   $as_echo "no" >&6; }
>   fi
>
> @@ -19769,7 +21877,7 @@ index 3513e408ce1..133948631e9 100755
>     if test "x$ac_ct_AR" =3D x; then
>       AR=3D"false"
>     else
> -@@ -5982,25 +6244,20 @@ ac_tool_warned=3Dyes ;;
> +@@ -6209,25 +6471,20 @@ ac_tool_warned=3Dyes ;;
>   esac
>       AR=3D$ac_ct_AR
>     fi
> @@ -19805,7 +21913,7 @@ index 3513e408ce1..133948631e9 100755
>
>
>
> -@@ -6011,6 +6268,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=3Dcru
> +@@ -6238,6 +6495,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=3Dcru
>
>
>
> @@ -19869,7 +21977,7 @@ index 3513e408ce1..133948631e9 100755
>
>   if test -n "$ac_tool_prefix"; then
>     # Extract the first word of "${ac_tool_prefix}strip", so it can be a =
program name with args.
> -@@ -6351,8 +6665,8 @@ esac
> +@@ -6578,8 +6892,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl=3D"sed -n -e 's/^T .* \(.*\)$/extern i=
nt \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>
>   # Transform an extracted symbol line into symbol name and symbol addres=
s
> @@ -19880,7 +21988,7 @@ index 3513e408ce1..133948631e9 100755
>
>   # Handle CRLF in mingw tool chain
>   opt_cr=3D
> -@@ -6388,6 +6702,7 @@ for ac_symprfx in "" "_"; do
> +@@ -6615,6 +6929,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe=3D"sed -n -e 's/^.*[    ]\($symcode$sy=
mcode*\)[         ][      ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -19888,7 +21996,7 @@ index 3513e408ce1..133948631e9 100755
>
>     # Check to see that the pipe works correctly.
>     pipe_works=3Dno
> -@@ -6429,6 +6744,18 @@ _LT_EOF
> +@@ -6656,6 +6971,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>         if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>           cat <<_LT_EOF > conftest.$ac_ext
> @@ -19907,7 +22015,7 @@ index 3513e408ce1..133948631e9 100755
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -6440,7 +6767,7 @@ _LT_EOF
> +@@ -6667,7 +6994,7 @@ _LT_EOF
>           cat <<_LT_EOF >> conftest.$ac_ext
>
>   /* The mapping between symbol names and symbols.  */
> @@ -19916,7 +22024,7 @@ index 3513e408ce1..133948631e9 100755
>     const char *name;
>     void       *address;
>   }
> -@@ -6466,8 +6793,8 @@ static const void *lt_preloaded_setup() {
> +@@ -6693,8 +7020,8 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>           # Now try linking the two files.
>           mv conftest.$ac_objext conftstm.$ac_objext
> @@ -19927,7 +22035,7 @@ index 3513e408ce1..133948631e9 100755
>           LIBS=3D"conftstm.$ac_objext"
>           CFLAGS=3D"$CFLAGS$lt_prog_compiler_no_builtin_flag"
>           if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\=
""; } >&5
> -@@ -6477,8 +6804,8 @@ _LT_EOF
> +@@ -6704,8 +7031,8 @@ _LT_EOF
>     test $ac_status =3D 0; } && test -s conftest${ac_exeext}; then
>             pipe_works=3Dyes
>           fi
> @@ -19938,7 +22046,7 @@ index 3513e408ce1..133948631e9 100755
>         else
>           echo "cannot find nm_test_func in $nlist" >&5
>         fi
> -@@ -6515,6 +6842,14 @@ else
> +@@ -6742,6 +7069,14 @@ else
>   $as_echo "ok" >&6; }
>   fi
>
> @@ -19953,7 +22061,7 @@ index 3513e408ce1..133948631e9 100755
>
>
>
> -@@ -6533,6 +6868,47 @@ fi
> +@@ -6760,6 +7095,47 @@ fi
>
>
>
> @@ -20001,7 +22109,7 @@ index 3513e408ce1..133948631e9 100755
>
>
>
> -@@ -6742,6 +7118,123 @@ esac
> +@@ -6969,6 +7345,123 @@ esac
>
>   need_locks=3D"$enable_libtool_lock"
>
> @@ -20125,7 +22233,7 @@ index 3513e408ce1..133948631e9 100755
>
>     case $host_os in
>       rhapsody* | darwin*)
> -@@ -7305,6 +7798,8 @@ _LT_EOF
> +@@ -7532,6 +8025,8 @@ _LT_EOF
>         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>         echo "$AR cru libconftest.a conftest.o" >&5
>         $AR cru libconftest.a conftest.o 2>&5
> @@ -20134,7 +22242,7 @@ index 3513e408ce1..133948631e9 100755
>         cat > conftest.c << _LT_EOF
>   int main() { return 0;}
>   _LT_EOF
> -@@ -7857,8 +8353,6 @@ fi
> +@@ -8084,8 +8579,6 @@ fi
>   lt_prog_compiler_pic=3D
>   lt_prog_compiler_static=3D
>
> @@ -20143,7 +22251,7 @@ index 3513e408ce1..133948631e9 100755
>
>     if test "$GCC" =3D yes; then
>       lt_prog_compiler_wl=3D'-Wl,'
> -@@ -8024,6 +8518,12 @@ $as_echo_n "checking for $compiler option to prod=
uce PIC... " >&6; }
> +@@ -8251,6 +8744,12 @@ $as_echo_n "checking for $compiler option to prod=
uce PIC... " >&6; }
>         lt_prog_compiler_pic=3D'--shared'
>         lt_prog_compiler_static=3D'--static'
>         ;;
> @@ -20156,7 +22264,7 @@ index 3513e408ce1..133948631e9 100755
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>         # which looks to be a dead project)
> -@@ -8086,7 +8586,7 @@ $as_echo_n "checking for $compiler option to produ=
ce PIC... " >&6; }
> +@@ -8313,7 +8812,7 @@ $as_echo_n "checking for $compiler option to produ=
ce PIC... " >&6; }
>         lt_prog_compiler_pic=3D'-KPIC'
>         lt_prog_compiler_static=3D'-Bstatic'
>         case $cc_basename in
> @@ -20165,7 +22273,7 @@ index 3513e408ce1..133948631e9 100755
>         lt_prog_compiler_wl=3D'-Qoption ld ';;
>         *)
>         lt_prog_compiler_wl=3D'-Wl,';;
> -@@ -8143,13 +8643,17 @@ case $host_os in
> +@@ -8370,13 +8869,17 @@ case $host_os in
>       lt_prog_compiler_pic=3D"$lt_prog_compiler_pic -DPIC"
>       ;;
>   esac
> @@ -20189,7 +22297,7 @@ index 3513e408ce1..133948631e9 100755
>
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -8210,6 +8714,11 @@ fi
> +@@ -8437,6 +8940,11 @@ fi
>
>
>
> @@ -20201,7 +22309,7 @@ index 3513e408ce1..133948631e9 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -8560,7 +9069,8 @@ _LT_EOF
> +@@ -8787,7 +9295,8 @@ _LT_EOF
>         allow_undefined_flag=3Dunsupported
>         always_export_symbols=3Dno
>         enable_shared_with_static_runtimes=3Dyes
> @@ -20211,7 +22319,7 @@ index 3513e408ce1..133948631e9 100755
>
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags -=
o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-impli=
b -Xlinker $lib'
> -@@ -8659,12 +9169,12 @@ _LT_EOF
> +@@ -8886,12 +9395,12 @@ _LT_EOF
>           whole_archive_flag_spec=3D'--whole-archive$convenience --no-who=
le-archive'
>           hardcode_libdir_flag_spec=3D
>           hardcode_libdir_flag_spec_ld=3D'-rpath $libdir'
> @@ -20226,7 +22334,7 @@ index 3513e408ce1..133948631e9 100755
>           fi
>           ;;
>         esac
> -@@ -8678,8 +9188,8 @@ _LT_EOF
> +@@ -8905,8 +9414,8 @@ _LT_EOF
>         archive_cmds=3D'$LD -Bshareable $libobjs $deplibs $linker_flags -=
o $lib'
>         wlarc=3D
>         else
> @@ -20237,7 +22345,7 @@ index 3513e408ce1..133948631e9 100755
>         fi
>         ;;
>
> -@@ -8697,8 +9207,8 @@ _LT_EOF
> +@@ -8924,8 +9433,8 @@ _LT_EOF
>
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/=
null; then
> @@ -20248,7 +22356,7 @@ index 3513e408ce1..133948631e9 100755
>         else
>         ld_shlibs=3Dno
>         fi
> -@@ -8744,8 +9254,8 @@ _LT_EOF
> +@@ -8971,8 +9480,8 @@ _LT_EOF
>
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/nu=
ll; then
> @@ -20259,7 +22367,7 @@ index 3513e408ce1..133948631e9 100755
>         else
>         ld_shlibs=3Dno
>         fi
> -@@ -8875,7 +9385,13 @@ _LT_EOF
> +@@ -9102,7 +9611,13 @@ _LT_EOF
>         allow_undefined_flag=3D'-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -20274,7 +22382,7 @@ index 3513e408ce1..133948631e9 100755
>   /* end confdefs.h.  */
>
>   int
> -@@ -8888,22 +9404,29 @@ main ()
> +@@ -9115,22 +9630,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>
> @@ -20317,7 +22425,7 @@ index 3513e408ce1..133948631e9 100755
>
>           hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libp=
ath"
>           archive_expsym_cmds=3D'$CC -o $output_objdir/$soname $libobjs $=
deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefin=
ed_flag}" !=3D "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else=
 :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -8915,7 +9438,13 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/u=
sr/lib:/lib"; fi
> +@@ -9142,7 +9664,13 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/u=
sr/lib:/lib"; fi
>         else
>          # Determine the default libpath from the value encoded in an
>          # empty executable.
> @@ -20332,7 +22440,7 @@ index 3513e408ce1..133948631e9 100755
>   /* end confdefs.h.  */
>
>   int
> -@@ -8928,22 +9457,29 @@ main ()
> +@@ -9155,22 +9683,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>
> @@ -20375,7 +22483,7 @@ index 3513e408ce1..133948631e9 100755
>
>          hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libpa=
th"
>           # Warning - without using the other run time loading flags,
> -@@ -8988,20 +9524,63 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
> +@@ -9215,20 +9750,63 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
>         # no search path for DLLs.
> @@ -20453,7 +22561,7 @@ index 3513e408ce1..133948631e9 100755
>         ;;
>
>       darwin* | rhapsody*)
> -@@ -9062,7 +9641,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
> +@@ -9289,7 +9867,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
>
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -20462,7 +22570,7 @@ index 3513e408ce1..133948631e9 100755
>         hardcode_libdir_flag_spec=3D'-R$libdir'
>         hardcode_direct=3Dyes
>         hardcode_shlibpath_var=3Dno
> -@@ -9070,7 +9649,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
> +@@ -9297,7 +9875,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
>
>       hpux9*)
>         if test "$GCC" =3D yes; then
> @@ -20471,7 +22579,7 @@ index 3513e408ce1..133948631e9 100755
>         else
>         archive_cmds=3D'$RM $output_objdir/$soname~$LD -b +b $install_lib=
dir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_=
objdir/$soname =3D $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -9086,7 +9665,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
> +@@ -9313,7 +9891,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
>
>       hpux10*)
>         if test "$GCC" =3D yes && test "$with_gnu_ld" =3D no; then
> @@ -20480,7 +22588,7 @@ index 3513e408ce1..133948631e9 100755
>         else
>         archive_cmds=3D'$LD -b +h $soname +b $install_libdir -o $lib $lib=
objs $deplibs $linker_flags'
>         fi
> -@@ -9110,10 +9689,10 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
> +@@ -9337,10 +9915,10 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
>           archive_cmds=3D'$CC -shared ${wl}+h ${wl}$soname -o $lib $libob=
js $deplibs $compiler_flags'
>           ;;
>         ia64*)
> @@ -20493,7 +22601,7 @@ index 3513e408ce1..133948631e9 100755
>           ;;
>         esac
>         else
> -@@ -9192,23 +9771,36 @@ fi
> +@@ -9419,23 +9997,36 @@ fi
>
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" =3D yes; then
> @@ -20538,7 +22646,7 @@ index 3513e408ce1..133948631e9 100755
>         else
>         archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags -so=
name $soname `test -n "$verstring" && func_echo_all "-set_version $verstrin=
g"` -update_registry ${output_objdir}/so_locations -o $lib'
>         archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_fl=
ags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $v=
erstring"` -update_registry ${output_objdir}/so_locations -exports_file $ex=
port_symbols -o $lib'
> -@@ -9293,7 +9885,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9520,7 +10111,7 @@ rm -f core conftest.err conftest.$ac_objext \
>       osf4* | osf5*)    # as osf3* with the addition of -msym flag
>         if test "$GCC" =3D yes; then
>         allow_undefined_flag=3D' ${wl}-expect_unresolved ${wl}\*'
> @@ -20547,7 +22655,7 @@ index 3513e408ce1..133948631e9 100755
>         hardcode_libdir_flag_spec=3D'${wl}-rpath ${wl}$libdir'
>         else
>         allow_undefined_flag=3D' -expect_unresolved \*'
> -@@ -9312,9 +9904,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9539,9 +10130,9 @@ rm -f core conftest.err conftest.$ac_objext \
>         no_undefined_flag=3D' -z defs'
>         if test "$GCC" =3D yes; then
>         wlarc=3D'${wl}'
> @@ -20559,7 +22667,7 @@ index 3513e408ce1..133948631e9 100755
>         else
>         case `$CC -V 2>&1` in
>         *"Compilers 5.0"*)
> -@@ -9890,8 +10482,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10117,8 +10708,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=3Dno
>     need_lib_prefix=3Dno
>
> @@ -20571,7 +22679,7 @@ index 3513e408ce1..133948631e9 100755
>       library_names_spec=3D'$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds=3D'base_file=3D`basename \${file}`~
> -@@ -9924,13 +10517,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -10151,13 +10743,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec=3D'`echo ${libname} | sed -e 's/^lib/pw/'``ech=
o ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -20644,25 +22752,16 @@ index 3513e408ce1..133948631e9 100755
>     # FIXME: first we should search . and the directory the executable is=
 in
>     shlibpath_var=3DPATH
>     ;;
> -@@ -10012,7 +10663,7 @@ haiku*)
> -   soname_spec=3D'${libname}${release}${shared_ext}$major'
> -   shlibpath_var=3DLIBRARY_PATH
> -   shlibpath_overrides_runpath=3Dyes
> --  sys_lib_dlsearch_path_spec=3D'/boot/home/config/lib /boot/common/lib =
/boot/beos/system/lib'
> -+  sys_lib_dlsearch_path_spec=3D'/boot/home/config/lib /boot/common/lib =
/boot/system/lib'
> -   hardcode_into_libs=3Dyes
> -   ;;
> -
> -@@ -10808,7 +11459,7 @@ else
> +@@ -11035,7 +11685,7 @@ else
>     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
>     lt_status=3D$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 10811 "configure"
> +-#line 11038 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>
>   #if HAVE_DLFCN_H
> -@@ -10852,10 +11503,10 @@ else
> +@@ -11079,10 +11729,10 @@ else
>   /* When -fvisbility=3Dhidden is used, assume the code has been annotate=
d
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=3D =
3)) || (__GNUC__ > 3))
> @@ -20675,16 +22774,16 @@ index 3513e408ce1..133948631e9 100755
>   int main ()
>   {
>     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -10914,7 +11565,7 @@ else
> +@@ -11141,7 +11791,7 @@ else
>     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
>     lt_status=3D$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 10917 "configure"
> +-#line 11144 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>
>   #if HAVE_DLFCN_H
> -@@ -10958,10 +11609,10 @@ else
> +@@ -11185,10 +11835,10 @@ else
>   /* When -fvisbility=3Dhidden is used, assume the code has been annotate=
d
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=3D =
3)) || (__GNUC__ > 3))
> @@ -20697,7 +22796,7 @@ index 3513e408ce1..133948631e9 100755
>   int main ()
>   {
>     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -13101,13 +13752,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_sing=
le_quote_subst"`'
> +@@ -13390,13 +14040,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_sing=
le_quote_subst"`'
>   lt_unset=3D'`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL=3D'`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP=3D'`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -20718,7 +22817,7 @@ index 3513e408ce1..133948631e9 100755
>   STRIP=3D'`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB=3D'`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds=3D'`$ECHO "$old_postinstall_cmds" | $SED "$delay_s=
ingle_quote_subst"`'
> -@@ -13122,14 +13780,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_cv=
_sys_global_symbol_pipe" | $SED "$de
> +@@ -13411,14 +14068,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_cv=
_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl=3D'`$ECHO "$lt_cv_sys_global_symbol_to=
_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address=3D'`$ECHO "$lt_cv_sys_global_=
symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'`$ECHO "$lt_cv_=
sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote=
_subst"`'
> @@ -20737,7 +22836,7 @@ index 3513e408ce1..133948631e9 100755
>   DSYMUTIL=3D'`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT=3D'`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO=3D'`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -13162,12 +13823,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_sh=
libpath_var" | $SED "$delay_single_q
> +@@ -13451,12 +14111,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_sh=
libpath_var" | $SED "$delay_single_q
>   hardcode_automatic=3D'`$ECHO "$hardcode_automatic" | $SED "$delay_singl=
e_quote_subst"`'
>   inherit_rpath=3D'`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_su=
bst"`'
>   link_all_deplibs=3D'`$ECHO "$link_all_deplibs" | $SED "$delay_single_qu=
ote_subst"`'
> @@ -20751,7 +22850,7 @@ index 3513e408ce1..133948631e9 100755
>   file_list_spec=3D'`$ECHO "$file_list_spec" | $SED "$delay_single_quote_=
subst"`'
>   variables_saved_for_relink=3D'`$ECHO "$variables_saved_for_relink" | $S=
ED "$delay_single_quote_subst"`'
>   need_lib_prefix=3D'`$ECHO "$need_lib_prefix" | $SED "$delay_single_quot=
e_subst"`'
> -@@ -13222,8 +13883,13 @@ reload_flag \
> +@@ -13511,8 +14171,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -20765,7 +22864,7 @@ index 3513e408ce1..133948631e9 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -13233,12 +13899,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -13522,12 +14187,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -20781,7 +22880,7 @@ index 3513e408ce1..133948631e9 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -13254,7 +13922,6 @@ no_undefined_flag \
> +@@ -13543,7 +14210,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -20789,7 +22888,7 @@ index 3513e408ce1..133948631e9 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -13290,6 +13957,7 @@ module_cmds \
> +@@ -13579,6 +14245,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -20797,7 +22896,7 @@ index 3513e408ce1..133948631e9 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -14055,7 +14723,8 @@ $as_echo X"$file" |
> +@@ -14344,7 +15011,8 @@ $as_echo X"$file" |
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -20807,7 +22906,7 @@ index 3513e408ce1..133948631e9 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -14158,19 +14827,42 @@ SP2NL=3D$lt_lt_SP2NL
> +@@ -14447,19 +15115,42 @@ SP2NL=3D$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=3D$lt_lt_NL2SP
>
> @@ -20851,7 +22950,7 @@ index 3513e408ce1..133948631e9 100755
>   # A symbol stripping program.
>   STRIP=3D$lt_STRIP
>
> -@@ -14200,6 +14892,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_sys=
_global_symbol_to_c_name_address
> +@@ -14489,6 +15180,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_sys=
_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix i=
s needed.
>   global_symbol_to_c_name_address_lib_prefix=3D$lt_lt_cv_sys_global_symbo=
l_to_c_name_address_lib_prefix
>
> @@ -20864,7 +22963,7 @@ index 3513e408ce1..133948631e9 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=3D$objdir
>
> -@@ -14209,6 +14907,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> +@@ -14498,6 +15195,9 @@ MAGIC_CMD=3D$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=3D$lt_need_locks
>
> @@ -20874,7 +22973,7 @@ index 3513e408ce1..133948631e9 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=3D$lt_DSYMUTIL
>
> -@@ -14323,12 +15024,12 @@ with_gcc=3D$GCC
> +@@ -14612,12 +15312,12 @@ with_gcc=3D$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag
>
> @@ -20890,7 +22989,7 @@ index 3513e408ce1..133948631e9 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=3D$lt_lt_prog_compiler_static
>
> -@@ -14415,9 +15116,6 @@ inherit_rpath=3D$inherit_rpath
> +@@ -14704,9 +15404,6 @@ inherit_rpath=3D$inherit_rpath
>   # Whether libtool must link a program against all its dependency librar=
ies.
>   link_all_deplibs=3D$link_all_deplibs
>
> @@ -20900,7 +22999,7 @@ index 3513e408ce1..133948631e9 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=3D$always_export_symbols
>
> -@@ -14433,6 +15131,9 @@ include_expsyms=3D$lt_include_expsyms
> +@@ -14722,6 +15419,9 @@ include_expsyms=3D$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with temp=
lates.
>   prelink_cmds=3D$lt_prelink_cmds
>
> @@ -20910,7 +23009,7 @@ index 3513e408ce1..133948631e9 100755
>   # Specify filename containing input files.
>   file_list_spec=3D$lt_file_list_spec
>
> -@@ -14465,210 +15166,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> +@@ -14754,210 +15454,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> @@ -21285,7 +23384,7 @@ index 3513e408ce1..133948631e9 100755
>     chmod +x "$ofile"
>
>  diff --git a/zlib/configure b/zlib/configure
> -index 695819cd54b..14b5f28013a 100755
> +index db7845c5d42..cd59daa39b5 100755
>  --- a/zlib/configure
>  +++ b/zlib/configure
>  @@ -646,8 +646,11 @@ OTOOL
> @@ -21317,7 +23416,7 @@ index 695819cd54b..14b5f28013a 100755
>
>   Some influential environment variables:
>     CC          C compiler command
> -@@ -4147,8 +4153,8 @@ esac
> +@@ -4186,8 +4192,8 @@ esac
>
>
>
> @@ -21328,7 +23427,7 @@ index 695819cd54b..14b5f28013a 100755
>
>
>
> -@@ -4188,7 +4194,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> +@@ -4227,7 +4233,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings"=
 >&5
>   $as_echo_n "checking how to print strings... " >&6; }
>   # Test print first, because it will be a builtin if present.
> @@ -21337,7 +23436,7 @@ index 695819cd54b..14b5f28013a 100755
>      test "X`print -r -- $ECHO 2>/dev/null`" =3D "X$ECHO"; then
>     ECHO=3D'print -r --'
>   elif test "X`printf %s $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> -@@ -5004,8 +5010,8 @@ $as_echo_n "checking whether the shell understands=
 some XSI constructs... " >&6;
> +@@ -5044,8 +5050,8 @@ $as_echo_n "checking whether the shell understands=
 some XSI constructs... " >&6;
>   # Try some XSI features
>   xsi_shell=3Dno
>   ( _lt_dummy=3D"a/b/c"
> @@ -21348,7 +23447,7 @@ index 695819cd54b..14b5f28013a 100755
>       && eval 'test $(( 1 + 1 )) -eq 2 \
>       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
>     && xsi_shell=3Dyes
> -@@ -5054,6 +5060,80 @@ esac
> +@@ -5094,6 +5100,80 @@ esac
>
>
>
> @@ -21429,7 +23528,7 @@ index 695819cd54b..14b5f28013a 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to rel=
oad object files" >&5
>   $as_echo_n "checking for $LD option to reload object files... " >&6; }
>   if ${lt_cv_ld_reload_flag+:} false; then :
> -@@ -5070,6 +5150,11 @@ case $reload_flag in
> +@@ -5110,6 +5190,11 @@ case $reload_flag in
>   esac
>   reload_cmds=3D'$LD$reload_flag -o $output$reload_objs'
>   case $host_os in
> @@ -21441,7 +23540,7 @@ index 695819cd54b..14b5f28013a 100755
>     darwin*)
>       if test "$GCC" =3D yes; then
>         reload_cmds=3D'$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reloa=
d_objs'
> -@@ -5238,7 +5323,8 @@ mingw* | pw32*)
> +@@ -5278,7 +5363,8 @@ mingw* | pw32*)
>       lt_cv_deplibs_check_method=3D'file_magic ^x86 archive import|^x86 D=
LL'
>       lt_cv_file_magic_cmd=3D'func_win32_libid'
>     else
> @@ -21451,7 +23550,7 @@ index 695819cd54b..14b5f28013a 100755
>       lt_cv_file_magic_cmd=3D'$OBJDUMP -f'
>     fi
>     ;;
> -@@ -5392,6 +5478,21 @@ esac
> +@@ -5432,6 +5518,21 @@ esac
>   fi
>   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_m=
ethod" >&5
>   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> @@ -21473,7 +23572,7 @@ index 695819cd54b..14b5f28013a 100755
>   file_magic_cmd=3D$lt_cv_file_magic_cmd
>   deplibs_check_method=3D$lt_cv_deplibs_check_method
>   test -z "$deplibs_check_method" && deplibs_check_method=3Dunknown
> -@@ -5407,6 +5508,158 @@ test -z "$deplibs_check_method" && deplibs_check=
_method=3Dunknown
> +@@ -5447,6 +5548,158 @@ test -z "$deplibs_check_method" && deplibs_check=
_method=3Dunknown
>
>
>
> @@ -21632,7 +23731,7 @@ index 695819cd54b..14b5f28013a 100755
>   plugin_option=3D
>   plugin_names=3D"liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dl=
l"
>   for plugin in $plugin_names; do
> -@@ -5421,8 +5674,10 @@ for plugin in $plugin_names; do
> +@@ -5461,8 +5714,10 @@ for plugin in $plugin_names; do
>   done
>
>   if test -n "$ac_tool_prefix"; then
> @@ -21645,7 +23744,7 @@ index 695819cd54b..14b5f28013a 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_AR+:} false; then :
> -@@ -5438,7 +5693,7 @@ do
> +@@ -5478,7 +5733,7 @@ do
>     test -z "$as_dir" && as_dir=3D.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -21654,7 +23753,7 @@ index 695819cd54b..14b5f28013a 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_ex=
ec_ext" >&5
>       break 2
>     fi
> -@@ -5458,11 +5713,15 @@ $as_echo "no" >&6; }
> +@@ -5498,11 +5753,15 @@ $as_echo "no" >&6; }
>   fi
>
>
> @@ -21673,7 +23772,7 @@ index 695819cd54b..14b5f28013a 100755
>   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
>   $as_echo_n "checking for $ac_word... " >&6; }
>   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> -@@ -5478,7 +5737,7 @@ do
> +@@ -5518,7 +5777,7 @@ do
>     test -z "$as_dir" && as_dir=3D.
>       for ac_exec_ext in '' $ac_executable_extensions; do
>     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> @@ -21682,7 +23781,7 @@ index 695819cd54b..14b5f28013a 100755
>       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_ex=
ec_ext" >&5
>       break 2
>     fi
> -@@ -5497,6 +5756,10 @@ else
> +@@ -5537,6 +5796,10 @@ else
>   $as_echo "no" >&6; }
>   fi
>
> @@ -21693,7 +23792,7 @@ index 695819cd54b..14b5f28013a 100755
>     if test "x$ac_ct_AR" =3D x; then
>       AR=3D"false"
>     else
> -@@ -5508,25 +5771,19 @@ ac_tool_warned=3Dyes ;;
> +@@ -5548,25 +5811,19 @@ ac_tool_warned=3Dyes ;;
>   esac
>       AR=3D$ac_ct_AR
>     fi
> @@ -21728,7 +23827,7 @@ index 695819cd54b..14b5f28013a 100755
>
>
>
> -@@ -5538,6 +5795,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=3Dcru
> +@@ -5578,6 +5835,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=3Dcru
>
>
>
> @@ -21793,7 +23892,7 @@ index 695819cd54b..14b5f28013a 100755
>   if test -n "$ac_tool_prefix"; then
>     # Extract the first word of "${ac_tool_prefix}strip", so it can be a =
program name with args.
>   set dummy ${ac_tool_prefix}strip; ac_word=3D$2
> -@@ -5877,8 +6192,8 @@ esac
> +@@ -5917,8 +6232,8 @@ esac
>   lt_cv_sys_global_symbol_to_cdecl=3D"sed -n -e 's/^T .* \(.*\)$/extern i=
nt \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
>
>   # Transform an extracted symbol line into symbol name and symbol addres=
s
> @@ -21804,7 +23903,7 @@ index 695819cd54b..14b5f28013a 100755
>
>   # Handle CRLF in mingw tool chain
>   opt_cr=3D
> -@@ -5914,6 +6229,7 @@ for ac_symprfx in "" "_"; do
> +@@ -5954,6 +6269,7 @@ for ac_symprfx in "" "_"; do
>     else
>       lt_cv_sys_global_symbol_pipe=3D"sed -n -e 's/^.*[    ]\($symcode$sy=
mcode*\)[         ][      ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
>     fi
> @@ -21812,7 +23911,7 @@ index 695819cd54b..14b5f28013a 100755
>
>     # Check to see that the pipe works correctly.
>     pipe_works=3Dno
> -@@ -5955,6 +6271,18 @@ _LT_EOF
> +@@ -5995,6 +6311,18 @@ _LT_EOF
>         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
>         if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
>           cat <<_LT_EOF > conftest.$ac_ext
> @@ -21831,7 +23930,7 @@ index 695819cd54b..14b5f28013a 100755
>   #ifdef __cplusplus
>   extern "C" {
>   #endif
> -@@ -5966,7 +6294,7 @@ _LT_EOF
> +@@ -6006,7 +6334,7 @@ _LT_EOF
>           cat <<_LT_EOF >> conftest.$ac_ext
>
>   /* The mapping between symbol names and symbols.  */
> @@ -21840,7 +23939,7 @@ index 695819cd54b..14b5f28013a 100755
>     const char *name;
>     void       *address;
>   }
> -@@ -5992,8 +6320,8 @@ static const void *lt_preloaded_setup() {
> +@@ -6032,8 +6360,8 @@ static const void *lt_preloaded_setup() {
>   _LT_EOF
>           # Now try linking the two files.
>           mv conftest.$ac_objext conftstm.$ac_objext
> @@ -21851,7 +23950,7 @@ index 695819cd54b..14b5f28013a 100755
>           LIBS=3D"conftstm.$ac_objext"
>           CFLAGS=3D"$CFLAGS$lt_prog_compiler_no_builtin_flag"
>           if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\=
""; } >&5
> -@@ -6003,8 +6331,8 @@ _LT_EOF
> +@@ -6043,8 +6371,8 @@ _LT_EOF
>     test $ac_status =3D 0; } && test -s conftest${ac_exeext}; then
>             pipe_works=3Dyes
>           fi
> @@ -21862,7 +23961,7 @@ index 695819cd54b..14b5f28013a 100755
>         else
>           echo "cannot find nm_test_func in $nlist" >&5
>         fi
> -@@ -6041,6 +6369,17 @@ else
> +@@ -6081,6 +6409,17 @@ else
>   $as_echo "ok" >&6; }
>   fi
>
> @@ -21880,7 +23979,7 @@ index 695819cd54b..14b5f28013a 100755
>
>
>
> -@@ -6058,6 +6397,43 @@ fi
> +@@ -6098,6 +6437,43 @@ fi
>
>
>
> @@ -21924,7 +24023,7 @@ index 695819cd54b..14b5f28013a 100755
>
>
>
> -@@ -6272,6 +6648,123 @@ esac
> +@@ -6312,6 +6688,123 @@ esac
>
>   need_locks=3D"$enable_libtool_lock"
>
> @@ -22048,7 +24147,7 @@ index 695819cd54b..14b5f28013a 100755
>
>     case $host_os in
>       rhapsody* | darwin*)
> -@@ -6838,6 +7331,8 @@ _LT_EOF
> +@@ -6878,6 +7371,8 @@ _LT_EOF
>         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
>         echo "$AR cru libconftest.a conftest.o" >&5
>         $AR cru libconftest.a conftest.o 2>&5
> @@ -22057,7 +24156,7 @@ index 695819cd54b..14b5f28013a 100755
>         cat > conftest.c << _LT_EOF
>   int main() { return 0;}
>   _LT_EOF
> -@@ -7687,8 +8183,6 @@ fi
> +@@ -7727,8 +8222,6 @@ fi
>   lt_prog_compiler_pic=3D
>   lt_prog_compiler_static=3D
>
> @@ -22066,7 +24165,7 @@ index 695819cd54b..14b5f28013a 100755
>
>     if test "$GCC" =3D yes; then
>       lt_prog_compiler_wl=3D'-Wl,'
> -@@ -7854,6 +8348,12 @@ $as_echo_n "checking for $compiler option to prod=
uce PIC... " >&6; }
> +@@ -7894,6 +8387,12 @@ $as_echo_n "checking for $compiler option to prod=
uce PIC... " >&6; }
>         lt_prog_compiler_pic=3D'--shared'
>         lt_prog_compiler_static=3D'--static'
>         ;;
> @@ -22079,7 +24178,7 @@ index 695819cd54b..14b5f28013a 100755
>         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
>           # Portland Group compilers (*not* the Pentium gcc compiler,
>         # which looks to be a dead project)
> -@@ -7916,7 +8416,7 @@ $as_echo_n "checking for $compiler option to produ=
ce PIC... " >&6; }
> +@@ -7956,7 +8455,7 @@ $as_echo_n "checking for $compiler option to produ=
ce PIC... " >&6; }
>         lt_prog_compiler_pic=3D'-KPIC'
>         lt_prog_compiler_static=3D'-Bstatic'
>         case $cc_basename in
> @@ -22088,7 +24187,7 @@ index 695819cd54b..14b5f28013a 100755
>         lt_prog_compiler_wl=3D'-Qoption ld ';;
>         *)
>         lt_prog_compiler_wl=3D'-Wl,';;
> -@@ -7973,13 +8473,17 @@ case $host_os in
> +@@ -8013,13 +8512,17 @@ case $host_os in
>       lt_prog_compiler_pic=3D"$lt_prog_compiler_pic -DPIC"
>       ;;
>   esac
> @@ -22112,7 +24211,7 @@ index 695819cd54b..14b5f28013a 100755
>
>   #
>   # Check to make sure the PIC flag actually works.
> -@@ -8040,6 +8544,11 @@ fi
> +@@ -8080,6 +8583,11 @@ fi
>
>
>
> @@ -22124,7 +24223,7 @@ index 695819cd54b..14b5f28013a 100755
>   #
>   # Check to make sure the static flag actually works.
>   #
> -@@ -8390,7 +8899,8 @@ _LT_EOF
> +@@ -8430,7 +8938,8 @@ _LT_EOF
>         allow_undefined_flag=3Dunsupported
>         always_export_symbols=3Dno
>         enable_shared_with_static_runtimes=3Dyes
> @@ -22134,7 +24233,7 @@ index 695819cd54b..14b5f28013a 100755
>
>         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
>           archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags -=
o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-impli=
b -Xlinker $lib'
> -@@ -8489,12 +8999,12 @@ _LT_EOF
> +@@ -8529,12 +9038,12 @@ _LT_EOF
>           whole_archive_flag_spec=3D'--whole-archive$convenience --no-who=
le-archive'
>           hardcode_libdir_flag_spec=3D
>           hardcode_libdir_flag_spec_ld=3D'-rpath $libdir'
> @@ -22149,7 +24248,7 @@ index 695819cd54b..14b5f28013a 100755
>           fi
>           ;;
>         esac
> -@@ -8508,8 +9018,8 @@ _LT_EOF
> +@@ -8548,8 +9057,8 @@ _LT_EOF
>         archive_cmds=3D'$LD -Bshareable $libobjs $deplibs $linker_flags -=
o $lib'
>         wlarc=3D
>         else
> @@ -22160,7 +24259,7 @@ index 695819cd54b..14b5f28013a 100755
>         fi
>         ;;
>
> -@@ -8527,8 +9037,8 @@ _LT_EOF
> +@@ -8567,8 +9076,8 @@ _LT_EOF
>
>   _LT_EOF
>         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/=
null; then
> @@ -22171,7 +24270,7 @@ index 695819cd54b..14b5f28013a 100755
>         else
>         ld_shlibs=3Dno
>         fi
> -@@ -8574,8 +9084,8 @@ _LT_EOF
> +@@ -8614,8 +9123,8 @@ _LT_EOF
>
>       *)
>         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/nu=
ll; then
> @@ -22182,7 +24281,7 @@ index 695819cd54b..14b5f28013a 100755
>         else
>         ld_shlibs=3Dno
>         fi
> -@@ -8705,7 +9215,13 @@ _LT_EOF
> +@@ -8745,7 +9254,13 @@ _LT_EOF
>         allow_undefined_flag=3D'-berok'
>           # Determine the default libpath from the value encoded in an
>           # empty executable.
> @@ -22197,7 +24296,7 @@ index 695819cd54b..14b5f28013a 100755
>     as_fn_error $? "Link tests are not allowed after GCC_NO_EXECUTABLES."=
 "$LINENO" 5
>   fi
>   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> -@@ -8721,22 +9237,29 @@ main ()
> +@@ -8761,22 +9276,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>
> @@ -22240,7 +24339,7 @@ index 695819cd54b..14b5f28013a 100755
>
>           hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libp=
ath"
>           archive_expsym_cmds=3D'$CC -o $output_objdir/$soname $libobjs $=
deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefin=
ed_flag}" !=3D "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else=
 :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> -@@ -8748,7 +9271,13 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/u=
sr/lib:/lib"; fi
> +@@ -8788,7 +9310,13 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/u=
sr/lib:/lib"; fi
>         else
>          # Determine the default libpath from the value encoded in an
>          # empty executable.
> @@ -22255,7 +24354,7 @@ index 695819cd54b..14b5f28013a 100755
>     as_fn_error $? "Link tests are not allowed after GCC_NO_EXECUTABLES."=
 "$LINENO" 5
>   fi
>   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> -@@ -8764,22 +9293,29 @@ main ()
> +@@ -8804,22 +9332,29 @@ main ()
>   _ACEOF
>   if ac_fn_c_try_link "$LINENO"; then :
>
> @@ -22298,7 +24397,7 @@ index 695819cd54b..14b5f28013a 100755
>
>          hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libpa=
th"
>           # Warning - without using the other run time loading flags,
> -@@ -8824,20 +9360,63 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
> +@@ -8864,20 +9399,63 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
>         # Microsoft Visual C++.
>         # hardcode_libdir_flag_spec is actually meaningless, as there is
>         # no search path for DLLs.
> @@ -22376,7 +24475,7 @@ index 695819cd54b..14b5f28013a 100755
>         ;;
>
>       darwin* | rhapsody*)
> -@@ -8898,7 +9477,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
> +@@ -8938,7 +9516,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
>
>       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
>       freebsd* | dragonfly*)
> @@ -22385,7 +24484,7 @@ index 695819cd54b..14b5f28013a 100755
>         hardcode_libdir_flag_spec=3D'-R$libdir'
>         hardcode_direct=3Dyes
>         hardcode_shlibpath_var=3Dno
> -@@ -8906,7 +9485,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
> +@@ -8946,7 +9524,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
>
>       hpux9*)
>         if test "$GCC" =3D yes; then
> @@ -22394,7 +24493,7 @@ index 695819cd54b..14b5f28013a 100755
>         else
>         archive_cmds=3D'$RM $output_objdir/$soname~$LD -b +b $install_lib=
dir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_=
objdir/$soname =3D $lib || mv $output_objdir/$soname $lib'
>         fi
> -@@ -8922,7 +9501,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
> +@@ -8962,7 +9540,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/us=
r/lib:/lib"; fi
>
>       hpux10*)
>         if test "$GCC" =3D yes && test "$with_gnu_ld" =3D no; then
> @@ -22403,7 +24502,7 @@ index 695819cd54b..14b5f28013a 100755
>         else
>         archive_cmds=3D'$LD -b +h $soname +b $install_libdir -o $lib $lib=
objs $deplibs $linker_flags'
>         fi
> -@@ -8946,10 +9525,10 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
> +@@ -8986,10 +9564,10 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
>           archive_cmds=3D'$CC -shared ${wl}+h ${wl}$soname -o $lib $libob=
js $deplibs $compiler_flags'
>           ;;
>         ia64*)
> @@ -22416,7 +24515,7 @@ index 695819cd54b..14b5f28013a 100755
>           ;;
>         esac
>         else
> -@@ -9028,26 +9607,39 @@ fi
> +@@ -9068,26 +9646,39 @@ fi
>
>       irix5* | irix6* | nonstopux*)
>         if test "$GCC" =3D yes; then
> @@ -22464,7 +24563,7 @@ index 695819cd54b..14b5f28013a 100755
>         else
>         archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags -so=
name $soname `test -n "$verstring" && func_echo_all "-set_version $verstrin=
g"` -update_registry ${output_objdir}/so_locations -o $lib'
>         archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_fl=
ags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $v=
erstring"` -update_registry ${output_objdir}/so_locations -exports_file $ex=
port_symbols -o $lib'
> -@@ -9132,7 +9724,7 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9172,7 +9763,7 @@ rm -f core conftest.err conftest.$ac_objext \
>       osf4* | osf5*)    # as osf3* with the addition of -msym flag
>         if test "$GCC" =3D yes; then
>         allow_undefined_flag=3D' ${wl}-expect_unresolved ${wl}\*'
> @@ -22473,7 +24572,7 @@ index 695819cd54b..14b5f28013a 100755
>         hardcode_libdir_flag_spec=3D'${wl}-rpath ${wl}$libdir'
>         else
>         allow_undefined_flag=3D' -expect_unresolved \*'
> -@@ -9151,9 +9743,9 @@ rm -f core conftest.err conftest.$ac_objext \
> +@@ -9191,9 +9782,9 @@ rm -f core conftest.err conftest.$ac_objext \
>         no_undefined_flag=3D' -z defs'
>         if test "$GCC" =3D yes; then
>         wlarc=3D'${wl}'
> @@ -22485,7 +24584,7 @@ index 695819cd54b..14b5f28013a 100755
>         else
>         case `$CC -V 2>&1` in
>         *"Compilers 5.0"*)
> -@@ -9729,8 +10321,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -9769,8 +10360,9 @@ cygwin* | mingw* | pw32* | cegcc*)
>     need_version=3Dno
>     need_lib_prefix=3Dno
>
> @@ -22497,7 +24596,7 @@ index 695819cd54b..14b5f28013a 100755
>       library_names_spec=3D'$libname.dll.a'
>       # DLL is installed to $(libdir)/../bin by postinstall_cmds
>       postinstall_cmds=3D'base_file=3D`basename \${file}`~
> -@@ -9763,13 +10356,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> +@@ -9803,13 +10395,71 @@ cygwin* | mingw* | pw32* | cegcc*)
>         library_names_spec=3D'`echo ${libname} | sed -e 's/^lib/pw/'``ech=
o ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
>         ;;
>       esac
> @@ -22570,25 +24669,16 @@ index 695819cd54b..14b5f28013a 100755
>     # FIXME: first we should search . and the directory the executable is=
 in
>     shlibpath_var=3DPATH
>     ;;
> -@@ -9851,7 +10502,7 @@ haiku*)
> -   soname_spec=3D'${libname}${release}${shared_ext}$major'
> -   shlibpath_var=3DLIBRARY_PATH
> -   shlibpath_overrides_runpath=3Dyes
> --  sys_lib_dlsearch_path_spec=3D'/boot/home/config/lib /boot/common/lib =
/boot/beos/system/lib'
> -+  sys_lib_dlsearch_path_spec=3D'/boot/home/config/lib /boot/common/lib =
/boot/system/lib'
> -   hardcode_into_libs=3Dyes
> -   ;;
> -
> -@@ -10665,7 +11316,7 @@ else
> +@@ -10705,7 +11355,7 @@ else
>     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
>     lt_status=3D$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 10668 "configure"
> +-#line 10708 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>
>   #if HAVE_DLFCN_H
> -@@ -10709,10 +11360,10 @@ else
> +@@ -10749,10 +11399,10 @@ else
>   /* When -fvisbility=3Dhidden is used, assume the code has been annotate=
d
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=3D =
3)) || (__GNUC__ > 3))
> @@ -22601,16 +24691,16 @@ index 695819cd54b..14b5f28013a 100755
>   int main ()
>   {
>     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -10771,7 +11422,7 @@ else
> +@@ -10811,7 +11461,7 @@ else
>     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
>     lt_status=3D$lt_dlunknown
>     cat > conftest.$ac_ext <<_LT_EOF
> --#line 10774 "configure"
> +-#line 10814 "configure"
>  +#line $LINENO "configure"
>   #include "confdefs.h"
>
>   #if HAVE_DLFCN_H
> -@@ -10815,10 +11466,10 @@ else
> +@@ -10855,10 +11505,10 @@ else
>   /* When -fvisbility=3Dhidden is used, assume the code has been annotate=
d
>      correspondingly for the symbols needed.  */
>   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=3D =
3)) || (__GNUC__ > 3))
> @@ -22623,7 +24713,7 @@ index 695819cd54b..14b5f28013a 100755
>   int main ()
>   {
>     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> -@@ -12288,13 +12939,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_sing=
le_quote_subst"`'
> +@@ -12328,13 +12978,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_sing=
le_quote_subst"`'
>   lt_unset=3D'`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
>   lt_SP2NL=3D'`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
>   lt_NL2SP=3D'`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> @@ -22644,7 +24734,7 @@ index 695819cd54b..14b5f28013a 100755
>   STRIP=3D'`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
>   RANLIB=3D'`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
>   old_postinstall_cmds=3D'`$ECHO "$old_postinstall_cmds" | $SED "$delay_s=
ingle_quote_subst"`'
> -@@ -12309,14 +12967,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_cv=
_sys_global_symbol_pipe" | $SED "$de
> +@@ -12349,14 +13006,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_cv=
_sys_global_symbol_pipe" | $SED "$de
>   lt_cv_sys_global_symbol_to_cdecl=3D'`$ECHO "$lt_cv_sys_global_symbol_to=
_cdecl" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address=3D'`$ECHO "$lt_cv_sys_global_=
symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'`$ECHO "$lt_cv_=
sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote=
_subst"`'
> @@ -22663,7 +24753,7 @@ index 695819cd54b..14b5f28013a 100755
>   DSYMUTIL=3D'`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
>   NMEDIT=3D'`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
>   LIPO=3D'`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> -@@ -12349,12 +13010,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_sh=
libpath_var" | $SED "$delay_single_q
> +@@ -12389,12 +13049,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_sh=
libpath_var" | $SED "$delay_single_q
>   hardcode_automatic=3D'`$ECHO "$hardcode_automatic" | $SED "$delay_singl=
e_quote_subst"`'
>   inherit_rpath=3D'`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_su=
bst"`'
>   link_all_deplibs=3D'`$ECHO "$link_all_deplibs" | $SED "$delay_single_qu=
ote_subst"`'
> @@ -22677,7 +24767,7 @@ index 695819cd54b..14b5f28013a 100755
>   file_list_spec=3D'`$ECHO "$file_list_spec" | $SED "$delay_single_quote_=
subst"`'
>   variables_saved_for_relink=3D'`$ECHO "$variables_saved_for_relink" | $S=
ED "$delay_single_quote_subst"`'
>   need_lib_prefix=3D'`$ECHO "$need_lib_prefix" | $SED "$delay_single_quot=
e_subst"`'
> -@@ -12409,8 +13070,13 @@ reload_flag \
> +@@ -12449,8 +13109,13 @@ reload_flag \
>   OBJDUMP \
>   deplibs_check_method \
>   file_magic_cmd \
> @@ -22691,7 +24781,7 @@ index 695819cd54b..14b5f28013a 100755
>   STRIP \
>   RANLIB \
>   CC \
> -@@ -12420,12 +13086,14 @@ lt_cv_sys_global_symbol_pipe \
> +@@ -12460,12 +13125,14 @@ lt_cv_sys_global_symbol_pipe \
>   lt_cv_sys_global_symbol_to_cdecl \
>   lt_cv_sys_global_symbol_to_c_name_address \
>   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> @@ -22707,7 +24797,7 @@ index 695819cd54b..14b5f28013a 100755
>   DSYMUTIL \
>   NMEDIT \
>   LIPO \
> -@@ -12441,7 +13109,6 @@ no_undefined_flag \
> +@@ -12481,7 +13148,6 @@ no_undefined_flag \
>   hardcode_libdir_flag_spec \
>   hardcode_libdir_flag_spec_ld \
>   hardcode_libdir_separator \
> @@ -22715,7 +24805,7 @@ index 695819cd54b..14b5f28013a 100755
>   exclude_expsyms \
>   include_expsyms \
>   file_list_spec \
> -@@ -12477,6 +13144,7 @@ module_cmds \
> +@@ -12517,6 +13183,7 @@ module_cmds \
>   module_expsym_cmds \
>   export_symbols_cmds \
>   prelink_cmds \
> @@ -22723,7 +24813,7 @@ index 695819cd54b..14b5f28013a 100755
>   postinstall_cmds \
>   postuninstall_cmds \
>   finish_cmds \
> -@@ -13075,7 +13743,8 @@ $as_echo X"$file" |
> +@@ -13115,7 +13782,8 @@ $as_echo X"$file" |
>   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
>   #
>   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
> @@ -22733,7 +24823,7 @@ index 695819cd54b..14b5f28013a 100755
>   #   Written by Gordon Matzigkeit, 1996
>   #
>   #   This file is part of GNU Libtool.
> -@@ -13178,19 +13847,42 @@ SP2NL=3D$lt_lt_SP2NL
> +@@ -13218,19 +13886,42 @@ SP2NL=3D$lt_lt_SP2NL
>   # turn newlines into spaces.
>   NL2SP=3D$lt_lt_NL2SP
>
> @@ -22777,7 +24867,7 @@ index 695819cd54b..14b5f28013a 100755
>   # A symbol stripping program.
>   STRIP=3D$lt_STRIP
>
> -@@ -13220,6 +13912,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_sys=
_global_symbol_to_c_name_address
> +@@ -13260,6 +13951,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_sys=
_global_symbol_to_c_name_address
>   # Transform the output of nm in a C name address pair when lib prefix i=
s needed.
>   global_symbol_to_c_name_address_lib_prefix=3D$lt_lt_cv_sys_global_symbo=
l_to_c_name_address_lib_prefix
>
> @@ -22790,7 +24880,7 @@ index 695819cd54b..14b5f28013a 100755
>   # The name of the directory that contains temporary libtool files.
>   objdir=3D$objdir
>
> -@@ -13229,6 +13927,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> +@@ -13269,6 +13966,9 @@ MAGIC_CMD=3D$MAGIC_CMD
>   # Must we lock files when doing compilation?
>   need_locks=3D$lt_need_locks
>
> @@ -22800,7 +24890,7 @@ index 695819cd54b..14b5f28013a 100755
>   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
>   DSYMUTIL=3D$lt_DSYMUTIL
>
> -@@ -13343,12 +14044,12 @@ with_gcc=3D$GCC
> +@@ -13383,12 +14083,12 @@ with_gcc=3D$GCC
>   # Compiler flag to turn off builtin functions.
>   no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag
>
> @@ -22816,7 +24906,7 @@ index 695819cd54b..14b5f28013a 100755
>   # Compiler flag to prevent dynamic linking.
>   link_static_flag=3D$lt_lt_prog_compiler_static
>
> -@@ -13435,9 +14136,6 @@ inherit_rpath=3D$inherit_rpath
> +@@ -13475,9 +14175,6 @@ inherit_rpath=3D$inherit_rpath
>   # Whether libtool must link a program against all its dependency librar=
ies.
>   link_all_deplibs=3D$link_all_deplibs
>
> @@ -22826,7 +24916,7 @@ index 695819cd54b..14b5f28013a 100755
>   # Set to "yes" if exported symbols are required.
>   always_export_symbols=3D$always_export_symbols
>
> -@@ -13453,6 +14151,9 @@ include_expsyms=3D$lt_include_expsyms
> +@@ -13493,6 +14190,9 @@ include_expsyms=3D$lt_include_expsyms
>   # Commands necessary for linking programs (against libraries) with temp=
lates.
>   prelink_cmds=3D$lt_prelink_cmds
>
> @@ -22836,7 +24926,7 @@ index 695819cd54b..14b5f28013a 100755
>   # Specify filename containing input files.
>   file_list_spec=3D$lt_file_list_spec
>
> -@@ -13485,210 +14186,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> +@@ -13525,210 +14225,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
>     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
>     # text mode, it properly converts lines to CR/LF.  This bash problem
>     # is reportedly fixed, but why not run on old versions too?
> diff --git a/meta/recipes-devtools/binutils/binutils/0014-Fix-rpath-in-li=
btool-when-sysroot-is-enabled.patch b/meta/recipes-devtools/binutils/binuti=
ls/0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
> similarity index 96%
> rename from meta/recipes-devtools/binutils/binutils/0014-Fix-rpath-in-lib=
tool-when-sysroot-is-enabled.patch
> rename to meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libto=
ol-when-sysroot-is-enabled.patch
> index 0e4790577ad..217ba5df85d 100644
> --- a/meta/recipes-devtools/binutils/binutils/0014-Fix-rpath-in-libtool-w=
hen-sysroot-is-enabled.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0010-Fix-rpath-in-libtool-w=
hen-sysroot-is-enabled.patch
> @@ -1,4 +1,4 @@
> -From ff256618bf85acca889920a1fb63ddea64cc98bc Mon Sep 17 00:00:00 2001
> +From 1c4581a059afe2799bb825b388ae92f8fa6f19a3 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 2 Mar 2015 01:42:38 +0000
>  Subject: [PATCH] Fix rpath in libtool when sysroot is enabled
> diff --git a/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-li=
btool-changes.patch b/meta/recipes-devtools/binutils/binutils/0011-sync-wit=
h-OE-libtool-changes.patch
> similarity index 97%
> rename from meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-lib=
tool-changes.patch
> rename to meta/recipes-devtools/binutils/binutils/0011-sync-with-OE-libto=
ol-changes.patch
> index 6afd37aafcb..3607e36ef46 100644
> --- a/meta/recipes-devtools/binutils/binutils/0015-sync-with-OE-libtool-c=
hanges.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0011-sync-with-OE-libtool-c=
hanges.patch
> @@ -1,4 +1,4 @@
> -From 4b612f902c596838ab260194f840a466f8291618 Mon Sep 17 00:00:00 2001
> +From d71c715554a054c534954b0aa357ca699ed68430 Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@intel.com>
>  Date: Mon, 6 Mar 2017 23:33:27 -0800
>  Subject: [PATCH] sync with OE libtool changes
> diff --git a/meta/recipes-devtools/binutils/binutils/0016-Check-for-clang=
-before-checking-gcc-version.patch b/meta/recipes-devtools/binutils/binutil=
s/0012-Check-for-clang-before-checking-gcc-version.patch
> similarity index 87%
> rename from meta/recipes-devtools/binutils/binutils/0016-Check-for-clang-=
before-checking-gcc-version.patch
> rename to meta/recipes-devtools/binutils/binutils/0012-Check-for-clang-be=
fore-checking-gcc-version.patch
> index 135cd0f9adc..8848c05ae0b 100644
> --- a/meta/recipes-devtools/binutils/binutils/0016-Check-for-clang-before=
-checking-gcc-version.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0012-Check-for-clang-before=
-checking-gcc-version.patch
> @@ -1,4 +1,4 @@
> -From 707a5d49ecaa4fd722176d764251360a44fc5655 Mon Sep 17 00:00:00 2001
> +From 787d7cd71d7886d3193c0fd747101c54ad7c3cd8 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 15 Apr 2020 14:17:20 -0700
>  Subject: [PATCH] Check for clang before checking gcc version
> @@ -18,10 +18,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/configure b/configure
> -index e8ba1a1d3de..e00d4764583 100755
> +index 6a1da1665d8..916656dc233 100755
>  --- a/configure
>  +++ b/configure
> -@@ -5275,7 +5275,7 @@ ac_compiler_gnu=3D$ac_cv_cxx_compiler_gnu
> +@@ -5287,7 +5287,7 @@ ac_compiler_gnu=3D$ac_cv_cxx_compiler_gnu
>   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
>   /* end confdefs.h.  */
>
> @@ -31,7 +31,7 @@ index e8ba1a1d3de..e00d4764583 100755
>   #endif
>   int main() {}
>  diff --git a/configure.ac b/configure.ac
> -index 3a8a3ae1f3b..c7f08b802d0 100644
> +index 2b10e9a1b02..677a0196c2b 100644
>  --- a/configure.ac
>  +++ b/configure.ac
>  @@ -1309,7 +1309,7 @@ if test "$GCC" =3D yes; then
> diff --git a/meta/recipes-devtools/binutils/binutils/0017-bfd-Close-the-f=
ile-descriptor-if-there-is-no-archive.patch b/meta/recipes-devtools/binutil=
s/binutils/0017-bfd-Close-the-file-descriptor-if-there-is-no-archive.patch
> deleted file mode 100644
> index 924980b4e83..00000000000
> --- a/meta/recipes-devtools/binutils/binutils/0017-bfd-Close-the-file-des=
criptor-if-there-is-no-archive.patch
> +++ /dev/null
> @@ -1,234 +0,0 @@
> -From 1c611b40e6bfc8029bff7696814330b5bc0ee5c0 Mon Sep 17 00:00:00 2001
> -From: "H.J. Lu" <hjl.tools@gmail.com>
> -Date: Mon, 26 Jul 2021 05:59:55 -0700
> -Subject: [PATCH] bfd: Close the file descriptor if there is no archive f=
d
> -
> -Close the file descriptor if there is no archive plugin file descriptor
> -to avoid running out of file descriptors on thin archives with many
> -archive members.
> -
> -bfd/
> -
> -       PR ld/28138
> -       * plugin.c (bfd_plugin_close_file_descriptor): Close the file
> -       descriptor there is no archive plugin file descriptor.
> -
> -ld/
> -
> -       PR ld/28138
> -       * testsuite/ld-plugin/lto.exp: Run tmpdir/pr28138 only for
> -       native build.
> -
> -       PR ld/28138
> -       * testsuite/ld-plugin/lto.exp: Run ld/28138 tests.
> -       * testsuite/ld-plugin/pr28138.c: New file.
> -       * testsuite/ld-plugin/pr28138-1.c: Likewise.
> -       * testsuite/ld-plugin/pr28138-2.c: Likewise.
> -       * testsuite/ld-plugin/pr28138-3.c: Likewise.
> -       * testsuite/ld-plugin/pr28138-4.c: Likewise.
> -       * testsuite/ld-plugin/pr28138-5.c: Likewise.
> -       * testsuite/ld-plugin/pr28138-6.c: Likewise.
> -       * testsuite/ld-plugin/pr28138-7.c: Likewise.
> -
> -(cherry picked from commit 5a98fb7513b559e20dfebdbaa2a471afda3b4742)
> -(cherry picked from commit 7dc37e1e1209c80e0bab784df6b6bac335e836f2)
> -
> -Upstream-Status: Accepted [https://sourceware.org/git/?p=3Dbinutils-gdb.=
git;a=3Dcommit;h=3D1c611b40e6bfc8029bff7696814330b5bc0ee5c0]
> ----
> - bfd/plugin.c                       |  8 +++++++
> - ld/testsuite/ld-plugin/lto.exp     | 34 ++++++++++++++++++++++++++++++
> - ld/testsuite/ld-plugin/pr28138-1.c |  6 ++++++
> - ld/testsuite/ld-plugin/pr28138-2.c |  6 ++++++
> - ld/testsuite/ld-plugin/pr28138-3.c |  6 ++++++
> - ld/testsuite/ld-plugin/pr28138-4.c |  6 ++++++
> - ld/testsuite/ld-plugin/pr28138-5.c |  6 ++++++
> - ld/testsuite/ld-plugin/pr28138-6.c |  6 ++++++
> - ld/testsuite/ld-plugin/pr28138-7.c |  6 ++++++
> - ld/testsuite/ld-plugin/pr28138.c   | 20 ++++++++++++++++++
> - 10 files changed, 104 insertions(+)
> - create mode 100644 ld/testsuite/ld-plugin/pr28138-1.c
> - create mode 100644 ld/testsuite/ld-plugin/pr28138-2.c
> - create mode 100644 ld/testsuite/ld-plugin/pr28138-3.c
> - create mode 100644 ld/testsuite/ld-plugin/pr28138-4.c
> - create mode 100644 ld/testsuite/ld-plugin/pr28138-5.c
> - create mode 100644 ld/testsuite/ld-plugin/pr28138-6.c
> - create mode 100644 ld/testsuite/ld-plugin/pr28138-7.c
> - create mode 100644 ld/testsuite/ld-plugin/pr28138.c
> -
> -diff --git a/bfd/plugin.c b/bfd/plugin.c
> -index 6cfa2b66470..3bab8febe88 100644
> ---- a/bfd/plugin.c
> -+++ b/bfd/plugin.c
> -@@ -291,6 +291,14 @@ bfd_plugin_close_file_descriptor (bfd *abfd, int fd=
)
> -            && !bfd_is_thin_archive (abfd->my_archive))
> -       abfd =3D abfd->my_archive;
> -
> -+      /* Close the file descriptor if there is no archive plugin file
> -+       descriptor.  */
> -+      if (abfd->archive_plugin_fd =3D=3D -1)
> -+      {
> -+        close (fd);
> -+        return;
> -+      }
> -+
> -       abfd->archive_plugin_fd_open_count--;
> -       /* Dup the archive plugin file descriptor for later use, which
> -        will be closed by _bfd_archive_close_and_cleanup.  */
> -diff --git a/ld/testsuite/ld-plugin/lto.exp b/ld/testsuite/ld-plugin/lto=
.exp
> -index def69e43ab3..999d911ce6a 100644
> ---- a/ld/testsuite/ld-plugin/lto.exp
> -+++ b/ld/testsuite/ld-plugin/lto.exp
> -@@ -687,6 +687,40 @@ if { [is_elf_format] && [check_lto_shared_available=
] } {
> -     }
> - }
> -
> -+run_cc_link_tests [list \
> -+    [list \
> -+      "Build pr28138.a" \
> -+      "-T" "" \
> -+      {pr28138-1.c pr28138-2.c pr28138-3.c pr28138-4.c pr28138-5.c \
> -+       pr28138-6.c pr28138-7.c} {} "pr28138.a" \
> -+    ] \
> -+    [list \
> -+      "Build pr28138.o" \
> -+      "" "" \
> -+      {pr28138.c} {} \
> -+    ] \
> -+]
> -+
> -+set exec_output [run_host_cmd "sh" \
> -+                            "-c \"ulimit -n 20; \
> -+                            $CC -Btmpdir/ld -o tmpdir/pr28138 \
> -+                            tmpdir/pr28138.o tmpdir/pr28138.a\""]
> -+set exec_output [prune_warnings $exec_output]
> -+if [string match "" $exec_output] then {
> -+    if { [isnative] } {
> -+      set exec_output [run_host_cmd "tmpdir/pr28138" ""]
> -+      if [string match "PASS" $exec_output] then {
> -+          pass "PR ld/28138"
> -+      } else {
> -+          fail "PR ld/28138"
> -+      }
> -+    } else {
> -+      pass "PR ld/28138"
> -+    }
> -+} else {
> -+    fail "PR ld/28138"
> -+}
> -+
> - set testname "Build liblto-11.a"
> - remote_file host delete "tmpdir/liblto-11.a"
> - set catch_output [run_host_cmd "$ar" "rc $plug_opt tmpdir/liblto-11.a t=
mpdir/lto-11a.o tmpdir/lto-11b.o tmpdir/lto-11c.o"]
> -diff --git a/ld/testsuite/ld-plugin/pr28138-1.c b/ld/testsuite/ld-plugin=
/pr28138-1.c
> -new file mode 100644
> -index 00000000000..51d119e1642
> ---- /dev/null
> -+++ b/ld/testsuite/ld-plugin/pr28138-1.c
> -@@ -0,0 +1,6 @@
> -+extern int a0(void);
> -+int
> -+a1(void)
> -+{
> -+  return 1 + a0();
> -+}
> -diff --git a/ld/testsuite/ld-plugin/pr28138-2.c b/ld/testsuite/ld-plugin=
/pr28138-2.c
> -new file mode 100644
> -index 00000000000..1120cd797e9
> ---- /dev/null
> -+++ b/ld/testsuite/ld-plugin/pr28138-2.c
> -@@ -0,0 +1,6 @@
> -+extern int a1(void);
> -+int
> -+a2(void)
> -+{
> -+  return 1 + a1();
> -+}
> -diff --git a/ld/testsuite/ld-plugin/pr28138-3.c b/ld/testsuite/ld-plugin=
/pr28138-3.c
> -new file mode 100644
> -index 00000000000..ec464947ee6
> ---- /dev/null
> -+++ b/ld/testsuite/ld-plugin/pr28138-3.c
> -@@ -0,0 +1,6 @@
> -+extern int a2(void);
> -+int
> -+a3(void)
> -+{
> -+  return 1 + a2();
> -+}
> -diff --git a/ld/testsuite/ld-plugin/pr28138-4.c b/ld/testsuite/ld-plugin=
/pr28138-4.c
> -new file mode 100644
> -index 00000000000..475701b2c5c
> ---- /dev/null
> -+++ b/ld/testsuite/ld-plugin/pr28138-4.c
> -@@ -0,0 +1,6 @@
> -+extern int a3(void);
> -+int
> -+a4(void)
> -+{
> -+  return 1 + a3();
> -+}
> -diff --git a/ld/testsuite/ld-plugin/pr28138-5.c b/ld/testsuite/ld-plugin=
/pr28138-5.c
> -new file mode 100644
> -index 00000000000..e24f86c363e
> ---- /dev/null
> -+++ b/ld/testsuite/ld-plugin/pr28138-5.c
> -@@ -0,0 +1,6 @@
> -+extern int a4(void);
> -+int
> -+a5(void)
> -+{
> -+  return 1 + a4();
> -+}
> -diff --git a/ld/testsuite/ld-plugin/pr28138-6.c b/ld/testsuite/ld-plugin=
/pr28138-6.c
> -new file mode 100644
> -index 00000000000..b5b938bdb21
> ---- /dev/null
> -+++ b/ld/testsuite/ld-plugin/pr28138-6.c
> -@@ -0,0 +1,6 @@
> -+extern int a5(void);
> -+int
> -+a6(void)
> -+{
> -+  return 1 + a5();
> -+}
> -diff --git a/ld/testsuite/ld-plugin/pr28138-7.c b/ld/testsuite/ld-plugin=
/pr28138-7.c
> -new file mode 100644
> -index 00000000000..4ef75bf0f0c
> ---- /dev/null
> -+++ b/ld/testsuite/ld-plugin/pr28138-7.c
> -@@ -0,0 +1,6 @@
> -+extern int a6(void);
> -+int
> -+a7(void)
> -+{
> -+  return 1 + a6();
> -+}
> -diff --git a/ld/testsuite/ld-plugin/pr28138.c b/ld/testsuite/ld-plugin/p=
r28138.c
> -new file mode 100644
> -index 00000000000..68252c9f382
> ---- /dev/null
> -+++ b/ld/testsuite/ld-plugin/pr28138.c
> -@@ -0,0 +1,20 @@
> -+#include <stdio.h>
> -+
> -+extern int a7(void);
> -+
> -+int
> -+a0(void)
> -+{
> -+  return 0;
> -+}
> -+
> -+int
> -+main()
> -+{
> -+  if (a7() =3D=3D 7)
> -+    {
> -+      printf ("PASS\n");
> -+      return 0;
> -+    }
> -+  return 1;
> -+}
> ---
> -2.31.1
> -
> diff --git a/meta/recipes-devtools/binutils/binutils/161e87d12167b1e36193=
385485c1f6ce92f74f02.patch b/meta/recipes-devtools/binutils/binutils/161e87=
d12167b1e36193385485c1f6ce92f74f02.patch
> deleted file mode 100644
> index 8a655af06c7..00000000000
> --- a/meta/recipes-devtools/binutils/binutils/161e87d12167b1e36193385485c=
1f6ce92f74f02.patch
> +++ /dev/null
> @@ -1,247 +0,0 @@
> -From: Alan Modra <amodra@gmail.com>
> -Date: Wed, 15 Dec 2021 01:18:42 +0000 (+1030)
> -Subject: PR28694, Out-of-bounds write in stab_xcoff_builtin_type
> -CVE: CVE-2021-45078
> -
> -Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.=
git;a=3Dcommitdiff_plain;h=3D161e87d12167b1e36193385485c1f6ce92f74f02]
> -
> -PR28694, Out-of-bounds write in stab_xcoff_builtin_type
> -
> -       PR 28694
> -       * stabs.c (stab_xcoff_builtin_type): Make typenum unsigned.
> -       Negate typenum earlier, simplifying bounds checking.  Correct
> -       off-by-one indexing.  Adjust switch cases.
> ----
> -
> -diff --git a/binutils/stabs.c b/binutils/stabs.c
> -index 274bfb0e7fa..83ee3ea5fa4 100644
> ---- a/binutils/stabs.c
> -+++ b/binutils/stabs.c
> -@@ -202,7 +202,7 @@ static debug_type stab_find_type (void *, struct sta=
b_handle *, const int *);
> - static bool stab_record_type
> -   (void *, struct stab_handle *, const int *, debug_type);
> - static debug_type stab_xcoff_builtin_type
> --  (void *, struct stab_handle *, int);
> -+  (void *, struct stab_handle *, unsigned int);
> - static debug_type stab_find_tagged_type
> -   (void *, struct stab_handle *, const char *, int, enum debug_type_kin=
d);
> - static debug_type *stab_demangle_argtypes
> -@@ -3496,166 +3496,167 @@ stab_record_type (void *dhandle ATTRIBUTE_UNUS=
ED, struct stab_handle *info,
> -
> - static debug_type
> - stab_xcoff_builtin_type (void *dhandle, struct stab_handle *info,
> --                       int typenum)
> -+                       unsigned int typenum)
> - {
> -   debug_type rettype;
> -   const char *name;
> -
> --  if (typenum >=3D 0 || typenum < -XCOFF_TYPE_COUNT)
> -+  typenum =3D -typenum - 1;
> -+  if (typenum >=3D XCOFF_TYPE_COUNT)
> -     {
> --      fprintf (stderr, _("Unrecognized XCOFF type %d\n"), typenum);
> -+      fprintf (stderr, _("Unrecognized XCOFF type %d\n"), -typenum - 1)=
;
> -       return DEBUG_TYPE_NULL;
> -     }
> --  if (info->xcoff_types[-typenum] !=3D NULL)
> --    return info->xcoff_types[-typenum];
> -+  if (info->xcoff_types[typenum] !=3D NULL)
> -+    return info->xcoff_types[typenum];
> -
> --  switch (-typenum)
> -+  switch (typenum)
> -     {
> --    case 1:
> -+    case 0:
> -       /* The size of this and all the other types are fixed, defined
> -        by the debugging format.  */
> -       name =3D "int";
> -       rettype =3D debug_make_int_type (dhandle, 4, false);
> -       break;
> --    case 2:
> -+    case 1:
> -       name =3D "char";
> -       rettype =3D debug_make_int_type (dhandle, 1, false);
> -       break;
> --    case 3:
> -+    case 2:
> -       name =3D "short";
> -       rettype =3D debug_make_int_type (dhandle, 2, false);
> -       break;
> --    case 4:
> -+    case 3:
> -       name =3D "long";
> -       rettype =3D debug_make_int_type (dhandle, 4, false);
> -       break;
> --    case 5:
> -+    case 4:
> -       name =3D "unsigned char";
> -       rettype =3D debug_make_int_type (dhandle, 1, true);
> -       break;
> --    case 6:
> -+    case 5:
> -       name =3D "signed char";
> -       rettype =3D debug_make_int_type (dhandle, 1, false);
> -       break;
> --    case 7:
> -+    case 6:
> -       name =3D "unsigned short";
> -       rettype =3D debug_make_int_type (dhandle, 2, true);
> -       break;
> --    case 8:
> -+    case 7:
> -       name =3D "unsigned int";
> -       rettype =3D debug_make_int_type (dhandle, 4, true);
> -       break;
> --    case 9:
> -+    case 8:
> -       name =3D "unsigned";
> -       rettype =3D debug_make_int_type (dhandle, 4, true);
> -       break;
> --    case 10:
> -+    case 9:
> -       name =3D "unsigned long";
> -       rettype =3D debug_make_int_type (dhandle, 4, true);
> -       break;
> --    case 11:
> -+    case 10:
> -       name =3D "void";
> -       rettype =3D debug_make_void_type (dhandle);
> -       break;
> --    case 12:
> -+    case 11:
> -       /* IEEE single precision (32 bit).  */
> -       name =3D "float";
> -       rettype =3D debug_make_float_type (dhandle, 4);
> -       break;
> --    case 13:
> -+    case 12:
> -       /* IEEE double precision (64 bit).  */
> -       name =3D "double";
> -       rettype =3D debug_make_float_type (dhandle, 8);
> -       break;
> --    case 14:
> -+    case 13:
> -       /* This is an IEEE double on the RS/6000, and different machines
> -        with different sizes for "long double" should use different
> -        negative type numbers.  See stabs.texinfo.  */
> -       name =3D "long double";
> -       rettype =3D debug_make_float_type (dhandle, 8);
> -       break;
> --    case 15:
> -+    case 14:
> -       name =3D "integer";
> -       rettype =3D debug_make_int_type (dhandle, 4, false);
> -       break;
> --    case 16:
> -+    case 15:
> -       name =3D "boolean";
> -       rettype =3D debug_make_bool_type (dhandle, 4);
> -       break;
> --    case 17:
> -+    case 16:
> -       name =3D "short real";
> -       rettype =3D debug_make_float_type (dhandle, 4);
> -       break;
> --    case 18:
> -+    case 17:
> -       name =3D "real";
> -       rettype =3D debug_make_float_type (dhandle, 8);
> -       break;
> --    case 19:
> -+    case 18:
> -       /* FIXME */
> -       name =3D "stringptr";
> -       rettype =3D NULL;
> -       break;
> --    case 20:
> -+    case 19:
> -       /* FIXME */
> -       name =3D "character";
> -       rettype =3D debug_make_int_type (dhandle, 1, true);
> -       break;
> --    case 21:
> -+    case 20:
> -       name =3D "logical*1";
> -       rettype =3D debug_make_bool_type (dhandle, 1);
> -       break;
> --    case 22:
> -+    case 21:
> -       name =3D "logical*2";
> -       rettype =3D debug_make_bool_type (dhandle, 2);
> -       break;
> --    case 23:
> -+    case 22:
> -       name =3D "logical*4";
> -       rettype =3D debug_make_bool_type (dhandle, 4);
> -       break;
> --    case 24:
> -+    case 23:
> -       name =3D "logical";
> -       rettype =3D debug_make_bool_type (dhandle, 4);
> -       break;
> --    case 25:
> -+    case 24:
> -       /* Complex type consisting of two IEEE single precision values.  =
*/
> -       name =3D "complex";
> -       rettype =3D debug_make_complex_type (dhandle, 8);
> -       break;
> --    case 26:
> -+    case 25:
> -       /* Complex type consisting of two IEEE double precision values.  =
*/
> -       name =3D "double complex";
> -       rettype =3D debug_make_complex_type (dhandle, 16);
> -       break;
> --    case 27:
> -+    case 26:
> -       name =3D "integer*1";
> -       rettype =3D debug_make_int_type (dhandle, 1, false);
> -       break;
> --    case 28:
> -+    case 27:
> -       name =3D "integer*2";
> -       rettype =3D debug_make_int_type (dhandle, 2, false);
> -       break;
> --    case 29:
> -+    case 28:
> -       name =3D "integer*4";
> -       rettype =3D debug_make_int_type (dhandle, 4, false);
> -       break;
> --    case 30:
> -+    case 29:
> -       /* FIXME */
> -       name =3D "wchar";
> -       rettype =3D debug_make_int_type (dhandle, 2, false);
> -       break;
> --    case 31:
> -+    case 30:
> -       name =3D "long long";
> -       rettype =3D debug_make_int_type (dhandle, 8, false);
> -       break;
> --    case 32:
> -+    case 31:
> -       name =3D "unsigned long long";
> -       rettype =3D debug_make_int_type (dhandle, 8, true);
> -       break;
> --    case 33:
> -+    case 32:
> -       name =3D "logical*8";
> -       rettype =3D debug_make_bool_type (dhandle, 8);
> -       break;
> --    case 34:
> -+    case 33:
> -       name =3D "integer*8";
> -       rettype =3D debug_make_int_type (dhandle, 8, false);
> -       break;
> -@@ -3664,9 +3665,7 @@ stab_xcoff_builtin_type (void *dhandle, struct sta=
b_handle *info,
> -     }
> -
> -   rettype =3D debug_name_type (dhandle, name, rettype);
> --
> --  info->xcoff_types[-typenum] =3D rettype;
> --
> -+  info->xcoff_types[typenum] =3D rettype;
> -   return rettype;
> - }
> -
> diff --git a/meta/recipes-devtools/binutils/binutils_2.37.bb b/meta/recip=
es-devtools/binutils/binutils_2.38.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils_2.37.bb
> rename to meta/recipes-devtools/binutils/binutils_2.38.bb
> --
> 2.35.1
>

