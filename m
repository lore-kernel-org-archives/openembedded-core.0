Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F504C47258
	for <webhook@archiver.kernel.org>; Sun, 28 Jan 2024 16:54:21 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.41120.1706460851255689994
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jan 2024 08:54:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gCzXoTSa;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6e1226b30ffso163346a34.0
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jan 2024 08:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706460850; x=1707065650; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6AQw9xhGqxO39sb4rSDhsE7KHpXZcA8hly0wV5csW0=;
        b=gCzXoTSaU5t2OePAUuhyGuAlKINlHQ0jeBE2Waz4pb3TNkVITuQUw71DbpvHLYlewy
         cftQL2fuvPqOhjGiY877h72crNre2NT0VBJPdgYGbVYJYrP7gpeLhS2IRcZARNd8gmBS
         8W8+RCrZ8dXoIxmg+dsHLs4SCuwavyuJBU/daPJtHIyYR35DL7LgMUXorhkH+JItVCHi
         guNlYI1PtJY4KrsBHui7e1+Df3vRe9dIIyUAPHjU4+uX0efCgIu4Q3wazOEO1rCuBZUk
         TM51W1OdD6eQUrBU9lLw5ojYcwpzsj8XIHLFeV+/XDDZWVXcFWhbwo8WPHaDLV/RBxKh
         LuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706460850; x=1707065650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6AQw9xhGqxO39sb4rSDhsE7KHpXZcA8hly0wV5csW0=;
        b=DK5ucfBNvMqLw6pqvvfhao9cpeIlbrW774eWgm6uzoIYOt+D+5ZGYyUnBbbFlbZpd9
         92VOcT/FyvzMYGhr1DUmcThKHtMiEMCBZ+EshAa+IXyaDHWxOEZlTdvPVTb95Bdj9Gcj
         /aO4B/1E+DlMx/47rlXkQsox22Qfxe5sm/OI+P548fLGf0sVGK2ez98njundkM+WJAZS
         7sh5RlBnE1hePqWHO7dBkZqAI628xDJB/Nd5heaSi6dC73dzNHa858dOktNQLmlxT5nJ
         KFlpM/ihR7wJPGc0+4fQfSfAJCZsRVTuBlWTawV2l30mgin9p+4zfXB2dDdxbq2VMYJR
         2kLw==
X-Gm-Message-State: AOJu0Yxcb7YFUD+4YoGne7vr7dXqlr8E/E68W8e2kXvFnRt1YCxcqIbO
	kQ6osmk4uI0HaQ6S/SQ6PsJ1tCdMSQqs59AYRxkc4OAoSUWIs6MSTiYTAUjBht153fV6c90kEsG
	hFRUFS3gH+7IGbFASR+t34yrWxFcBYz1adoCHCQ==
X-Google-Smtp-Source: AGHT+IHwtGeodYUQe02117Mbi7HapgOomV1qjgOT0QoOJk8oyy+Hl6grrx9brT/RbwVkUCDeFGKdWDVBTe5xG7QB1VU=
X-Received: by 2002:a05:6871:5b1a:b0:206:6db:dff9 with SMTP id
 op26-20020a0568715b1a00b0020606dbdff9mr1660087oac.58.1706460850022; Sun, 28
 Jan 2024 08:54:10 -0800 (PST)
MIME-Version: 1.0
References: <20240126133455.2609378-1-alex@linutronix.de> <20240126133455.2609378-8-alex@linutronix.de>
In-Reply-To: <20240126133455.2609378-8-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 28 Jan 2024 08:53:43 -0800
Message-ID: <CAMKF1sqYkSORQc+o3pfDzbuFKeVHcsG2i0904ppXMpSU8jm_TQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 8/8] rpm: update 4.18.1 -> 4.19.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jan 2024 16:54:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194443

I am seeing some failures in meta-oe ( especially nodejs ) which I
suspect are due to rpm upgrade and patches around it.

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3566/step=
s/15/logs/stdio

On Fri, Jan 26, 2024 at 5:35=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Upstream has replaced autoconf with cmake, which necessitates a rewrite o=
f the
> recipe and available options, and a rebase to cmake of
> 0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
>
> Correct a mistake in 0001-Do-not-read-config-files-from-HOME.patch :
> the patch was removing the NULL marker at the end of function arguments,
> and 0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch
> was restoring it (in addition to the actual change the patch was making).
> Now both patches preserve the NULL terminator.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...olor-setting-for-mips64_n32-binaries.patch | 12 +--
>  ...ook-for-lua-with-pkg-config-rather-t.patch | 28 +++++++
>  ...estore-readline-support-as-an-explic.patch | 42 +++++++++++
>  ...satisfiable-dependency-when-building.patch | 12 +--
>  ...lib-rpm-as-the-installation-path-for.patch | 52 +++++--------
>  ...1-Do-not-read-config-files-from-HOME.patch | 19 ++---
>  ...-PATH-environment-variable-before-ru.patch | 12 +--
>  ...lename-before-passing-it-to-basename.patch | 40 ----------
>  ...ix-missing-basename-include-on-macOS.patch | 26 -------
>  ...l-dependency-on-non-POSIX-GLOB_ONLYD.patch | 56 ++++++++++++++
>  ...lling-execute-package-scriptlets-wit.patch | 24 ++----
>  ...not-insert-payloadflags-into-.rpm-me.patch | 13 ++--
>  ...-linux-gnux32-variant-to-triplet-han.patch | 28 -------
>  ....c-fix-file-conflicts-for-MIPS64-N32.patch | 13 ++--
>  .../files/0001-perl-disable-auto-reqs.patch   | 26 ++++---
>  ...y_hash_t-instead-of-long-in-hdr_hash.patch | 35 ---------
>  ...prefixing-etc-from-RPM_ETCCONFIGDIR-.patch | 31 ++++----
>  ...txt-do-not-install-non-existent-docs.patch | 26 +++++++
>  ...avoid-using-GLOB_BRACE-if-undefined-.patch | 34 +++++++++
>  ...ge-logging-level-around-scriptlets-t.patch | 19 ++---
>  ...87cfcf9cac87e5bc5e7db79b0338da9e355e.patch | 51 -------------
>  .../rpm/files/fix-declaration.patch           | 39 ----------
>  .../rpm/{rpm_4.18.1.bb =3D> rpm_4.19.1.bb}      | 73 ++++++++-----------
>  23 files changed, 328 insertions(+), 383 deletions(-)
>  create mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-l=
ook-for-lua-with-pkg-config-rather-t.patch
>  create mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-r=
estore-readline-support-as-an-explic.patch
>  delete mode 100644 meta/recipes-devtools/rpm/files/0001-Duplicate-filena=
me-before-passing-it-to-basename.patch
>  delete mode 100644 meta/recipes-devtools/rpm/files/0001-Fix-missing-base=
name-include-on-macOS.patch
>  create mode 100644 meta/recipes-devtools/rpm/files/0001-Fix-unconditiona=
l-dependency-on-non-POSIX-GLOB_ONLYD.patch
>  delete mode 100644 meta/recipes-devtools/rpm/files/0001-configure.ac-add=
-linux-gnux32-variant-to-triplet-han.patch
>  delete mode 100644 meta/recipes-devtools/rpm/files/0001-python-Use-Py_ha=
sh_t-instead-of-long-in-hdr_hash.patch
>  create mode 100644 meta/recipes-devtools/rpm/files/0002-docs-CMakeLists.=
txt-do-not-install-non-existent-docs.patch
>  create mode 100644 meta/recipes-devtools/rpm/files/0002-rpmio-rpmglob.c-=
avoid-using-GLOB_BRACE-if-undefined-.patch
>  delete mode 100644 meta/recipes-devtools/rpm/files/ea3187cfcf9cac87e5bc5=
e7db79b0338da9e355e.patch
>  delete mode 100644 meta/recipes-devtools/rpm/files/fix-declaration.patch
>  rename meta/recipes-devtools/rpm/{rpm_4.18.1.bb =3D> rpm_4.19.1.bb} (72%=
)
>
> diff --git a/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for=
-mips64_n32-binaries.patch b/meta/recipes-devtools/rpm/files/0001-Add-a-col=
or-setting-for-mips64_n32-binaries.patch
> index 9fa486dfd3c..96fe57dfeb8 100644
> --- a/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64=
_n32-binaries.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64=
_n32-binaries.patch
> @@ -1,4 +1,4 @@
> -From 93f219df68f3741ff63a294a16bcbe8deba1112f Mon Sep 17 00:00:00 2001
> +From ecc45e3ae837ab50603088dcc8fd2f8e67a7ece6 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Thu, 9 Mar 2017 18:54:02 +0200
>  Subject: [PATCH] Add a color setting for mips64_n32 binaries
> @@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.=
com>
>   2 files changed, 6 insertions(+)
>
>  diff --git a/build/rpmfc.c b/build/rpmfc.c
> -index 26606378f..a16e3f4e9 100644
> +index 4b67a9bae..ed7e4e623 100644
>  --- a/build/rpmfc.c
>  +++ b/build/rpmfc.c
> -@@ -646,6 +646,7 @@ exit:
> +@@ -660,6 +660,7 @@ exit:
>   static const struct rpmfcTokens_s rpmfcTokens[] =3D {
>     { "directory",              RPMFC_INCLUDE },
>
> @@ -23,7 +23,7 @@ index 26606378f..a16e3f4e9 100644
>     { "ELF 32-bit",             RPMFC_ELF32|RPMFC_INCLUDE },
>     { "ELF 64-bit",             RPMFC_ELF64|RPMFC_INCLUDE },
>
> -@@ -1151,6 +1152,9 @@ static uint32_t getElfColor(const char *fn)
> +@@ -1158,6 +1159,9 @@ static uint32_t getElfColor(const char *fn)
>                 color =3D RPMFC_ELF32;
>                 break;
>             }
> @@ -34,10 +34,10 @@ index 26606378f..a16e3f4e9 100644
>         if (elf)
>             elf_end(elf);
>  diff --git a/rpmrc.in b/rpmrc.in
> -index 2975a3a0e..c7232b48b 100644
> +index 8646a966b..7349fdfd3 100644
>  --- a/rpmrc.in
>  +++ b/rpmrc.in
> -@@ -139,6 +139,8 @@ archcolor: mipsr6el 1
> +@@ -142,6 +142,8 @@ archcolor: mipsr6el 1
>   archcolor: mips64r6 2
>   archcolor: mips64r6el 2
>
> diff --git a/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-look-for=
-lua-with-pkg-config-rather-t.patch b/meta/recipes-devtools/rpm/files/0001-=
CMakeLists.txt-look-for-lua-with-pkg-config-rather-t.patch
> new file mode 100644
> index 00000000000..5053caae33f
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-look-for-lua-wi=
th-pkg-config-rather-t.patch
> @@ -0,0 +1,28 @@
> +From ca4655f36c3c7883eb50381902890b23f0e8aaab Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex@linutronix.de>
> +Date: Wed, 29 Nov 2023 14:06:15 +0100
> +Subject: [PATCH] CMakeLists.txt: look for lua with pkg-config rather tha=
n
> + cmake modules
> +
> +Otherwise cmake will try to find libm, badly, and fail.
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +
> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 7f0630453..d0ea565f3 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -187,7 +187,7 @@ set(REQFUNCS
> + )
> +
> + find_package(PkgConfig REQUIRED)
> +-find_package(Lua 5.2 REQUIRED)
> ++pkg_check_modules(LUA REQUIRED IMPORTED_TARGET lua>=3D5.2)
> + find_package(ZLIB REQUIRED)
> + find_package(BZip2)
> + find_package(Iconv)
> diff --git a/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-restore-=
readline-support-as-an-explic.patch b/meta/recipes-devtools/rpm/files/0001-=
CMakeLists.txt-restore-readline-support-as-an-explic.patch
> new file mode 100644
> index 00000000000..db83b176b41
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-restore-readlin=
e-support-as-an-explic.patch
> @@ -0,0 +1,42 @@
> +From 3c2e529c6cc1bae4bc94cbed7358c6e0cdd2de02 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex@linutronix.de>
> +Date: Tue, 16 Jan 2024 13:43:36 +0100
> +Subject: [PATCH] CMakeLists.txt: restore readline support as an explicit
> + option
> +
> +This was lost in autotools -> cmake transition. The particular
> +reason to make it explicit is that readline is gpl version 3
> +licensed, and in some builds components under that license
> +need to be excluded.
> +
> +Upstream-Status: Submitted [https://github.com/rpm-software-management/r=
pm/pull/2852]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + CMakeLists.txt | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 0a474106e..89e27417f 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -31,6 +31,7 @@ option(WITH_AUDIT "Build with audit support" ON)
> + option(WITH_FSVERITY "Build with fsverity support" OFF)
> + option(WITH_IMAEVM "Build with IMA support" OFF)
> + option(WITH_FAPOLICYD "Build with fapolicyd support" ON)
> ++option(WITH_READLINE "Build with readline support" ON)
> +
> + set(RPM_CONFIGDIR "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/rpm"=
 CACHE PATH "rpm home")
> + set(RPM_VENDOR "vendor" CACHE STRING "rpm vendor string")
> +@@ -193,7 +194,11 @@ find_package(BZip2)
> + find_package(Iconv)
> +
> + pkg_check_modules(POPT REQUIRED IMPORTED_TARGET popt)
> +-pkg_check_modules(READLINE IMPORTED_TARGET readline)
> ++
> ++if (WITH_READLINE)
> ++    pkg_check_modules(READLINE REQUIRED IMPORTED_TARGET readline)
> ++endif()
> ++
> + pkg_check_modules(ZSTD IMPORTED_TARGET libzstd>=3D1.3.8)
> + pkg_check_modules(LIBELF IMPORTED_TARGET libelf)
> + pkg_check_modules(LIBDW IMPORTED_TARGET libdw)
> diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfi=
able-dependency-when-building.patch b/meta/recipes-devtools/rpm/files/0001-=
Do-not-add-an-unsatisfiable-dependency-when-building.patch
> index 8440c3516d6..df5543873c1 100644
> --- a/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-de=
pendency-when-building.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-de=
pendency-when-building.patch
> @@ -1,4 +1,4 @@
> -From f39c28eb52f12ae6e82db360ffd5a903ac8faca5 Mon Sep 17 00:00:00 2001
> +From d77429bf20d138ec8ce577c0080cae1f1bc2aa6f Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Mon, 9 Jan 2017 18:52:11 +0200
>  Subject: [PATCH] Do not add an unsatisfiable dependency when building rp=
ms in
> @@ -14,11 +14,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.=
com>
>   build/pack.c | 4 ----
>   1 file changed, 4 deletions(-)
>
> -Index: git/build/pack.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/build/pack.c
> -+++ git/build/pack.c
> -@@ -709,10 +709,6 @@ static rpmRC packageBinary(rpmSpec spec,
> +diff --git a/build/pack.c b/build/pack.c
> +index f7dac6d9a..f382c7da0 100644
> +--- a/build/pack.c
> ++++ b/build/pack.c
> +@@ -711,10 +711,6 @@ static rpmRC packageBinary(rpmSpec spec, Package pk=
g, const char *cookie, int ch
>         headerPutBin(pkg->header, RPMTAG_SOURCEPKGID, spec->sourcePkgId,1=
6);
>       }
>
> diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm=
-as-the-installation-path-for.patch b/meta/recipes-devtools/rpm/files/0001-=
Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
> index 8fdc5edb10b..b056d19741a 100644
> --- a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the=
-installation-path-for.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the=
-installation-path-for.patch
> @@ -1,4 +1,4 @@
> -From 5fc560aaf1184d35d161f7d50dbb6323c90cc02d Mon Sep 17 00:00:00 2001
> +From 7948f21e08bc7552b281ed0098a9c8099d2370cb Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Mon, 27 Feb 2017 09:43:30 +0200
>  Subject: [PATCH] Do not hardcode "lib/rpm" as the installation path for
> @@ -8,29 +8,28 @@ Upstream-Status: Denied [https://github.com/rpm-softwar=
e-management/rpm/pull/263
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>
>  ---
> - configure.ac | 2 +-
> - macros.in    | 2 +-
> - rpm.am       | 4 ++--
> - 3 files changed, 4 insertions(+), 4 deletions(-)
> + CMakeLists.txt | 2 +-
> + macros.in      | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
>
> -diff --git a/configure.ac b/configure.ac
> -index e6676c581..ec28db9b6 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -942,7 +942,7 @@ else
> -     usrprefix=3D$prefix
> - fi
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 2767915fb..7f0630453 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -32,7 +32,7 @@ option(WITH_FSVERITY "Build with fsverity support" OFF=
)
> + option(WITH_IMAEVM "Build with IMA support" OFF)
> + option(WITH_FAPOLICYD "Build with fapolicyd support" ON)
>
> --RPMCONFIGDIR=3D"`echo ${usrprefix}/lib/rpm`"
> -+RPMCONFIGDIR=3D"`echo ${libdir}/rpm`"
> - AC_SUBST(RPMCONFIGDIR)
> +-set(RPM_CONFIGDIR "${CMAKE_INSTALL_PREFIX}/lib/rpm" CACHE PATH "rpm hom=
e")
> ++set(RPM_CONFIGDIR "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/rpm"=
 CACHE PATH "rpm home")
> + set(RPM_VENDOR "vendor" CACHE STRING "rpm vendor string")
>
> - AC_SUBST(OBJDUMP)
> + # Emulate libtool versioning. Before a public release:
>  diff --git a/macros.in b/macros.in
> -index a2411d784..735b74d99 100644
> +index b49ffaad4..3acbe78f6 100644
>  --- a/macros.in
>  +++ b/macros.in
> -@@ -930,7 +930,7 @@ package or when debugging this package.\
> +@@ -969,7 +969,7 @@ Supplements:   (%{name} =3D %{version}-%{release} an=
d langpacks-%{1})\
>   %_sharedstatedir      %{_prefix}/com
>   %_localstatedir               %{_prefix}/var
>   %_lib                 lib
> @@ -39,20 +38,3 @@ index a2411d784..735b74d99 100644
>   %_includedir          %{_prefix}/include
>   %_infodir             %{_datadir}/info
>   %_mandir              %{_datadir}/man
> -diff --git a/rpm.am b/rpm.am
> -index 55b5b3935..5a51f102b 100644
> ---- a/rpm.am
> -+++ b/rpm.am
> -@@ -1,10 +1,10 @@
> - # Internal binaries
> - ## HACK: It probably should be $(libexecdir)/rpm or $(libdir)/rpm
> --rpmlibexecdir =3D $(prefix)/lib/rpm
> -+rpmlibexecdir =3D $(libdir)/rpm
> -
> - # Host independent config files
> - ## HACK: it probably should be $(datadir)/rpm
> --rpmconfigdir =3D $(prefix)/lib/rpm
> -+rpmconfigdir =3D $(libdir)/rpm
> -
> - # Libtool version (current-revision-age) for all our libraries
> - rpm_version_info =3D 13:0:4
> diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-file=
s-from-HOME.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-read-config=
-files-from-HOME.patch
> index fda64eefe01..6a18679da2f 100644
> --- a/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-=
HOME.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-=
HOME.patch
> @@ -1,35 +1,36 @@
> -From 35381b6cd6c1b571bf7e6b0640de0f54dbf94386 Mon Sep 17 00:00:00 2001
> +From 4f34994d9ad38d96976578a9d1a006f72e5aca50 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Tue, 10 Jan 2017 14:11:30 +0200
>  Subject: [PATCH] Do not read config files from $HOME
>
>  Upstream-Status: Inappropriate [oe-core specific]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
>   lib/rpmrc.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> -Index: git/lib/rpmrc.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/lib/rpmrc.c
> -+++ git/lib/rpmrc.c
> +diff --git a/lib/rpmrc.c b/lib/rpmrc.c
> +index 269d490ac..f39dcfc11 100644
> +--- a/lib/rpmrc.c
> ++++ b/lib/rpmrc.c
>  @@ -458,8 +458,7 @@ static void setDefaults(void)
>       if (!defrcfiles) {
>         defrcfiles =3D rstrscat(NULL, confdir, "/rpmrc", ":",
> -                               confdir, "/" RPMCANONVENDOR "/rpmrc", ":"=
,
> +                               confdir, "/" RPM_VENDOR "/rpmrc", ":",
>  -                              SYSCONFDIR "/rpmrc", ":",
>  -                              "~/.rpmrc", NULL);
> -+                              SYSCONFDIR "/rpmrc", ":");
> ++                              SYSCONFDIR "/rpmrc", NULL);
>       }
>
>   #ifndef MACROFILES
>  @@ -471,8 +470,7 @@ static void setDefaults(void)
> -                               confdir, "/" RPMCANONVENDOR "/macros", ":=
",
> +                               confdir, "/" RPM_VENDOR "/macros", ":",
>                                 SYSCONFDIR "/rpm/macros.*", ":",
>                                 SYSCONFDIR "/rpm/macros", ":",
>  -                              SYSCONFDIR "/rpm/%{_target}/macros", ":",
>  -                              "~/.rpmmacros", NULL);
> -+                              SYSCONFDIR "/rpm/%{_target}/macros", ":")=
;
> ++                              SYSCONFDIR "/rpm/%{_target}/macros", NULL=
);
>       }
>   #else
>       macrofiles =3D MACROFILES;
> diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-e=
nvironment-variable-before-ru.patch b/meta/recipes-devtools/rpm/files/0001-=
Do-not-reset-the-PATH-environment-variable-before-ru.patch
> index ae24b663aae..318f65ed375 100644
> --- a/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environm=
ent-variable-before-ru.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environm=
ent-variable-before-ru.patch
> @@ -1,4 +1,4 @@
> -From a674b9cc7af448d7c6748bc163bf37dc14a57f09 Mon Sep 17 00:00:00 2001
> +From 25beba1efc31901a3bb0b1b6f0604d6583dc0513 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Fri, 20 Jan 2017 13:32:06 +0200
>  Subject: [PATCH] Do not reset the PATH environment variable before runni=
ng
> @@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.=
com>
>   lib/rpmscript.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> -Index: git/lib/rpmscript.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/lib/rpmscript.c
> -+++ git/lib/rpmscript.c
> -@@ -231,7 +231,7 @@ static void doScriptExec(ARGV_const_t ar
> +diff --git a/lib/rpmscript.c b/lib/rpmscript.c
> +index 36e37cf77..37ada014c 100644
> +--- a/lib/rpmscript.c
> ++++ b/lib/rpmscript.c
> +@@ -252,7 +252,7 @@ static void doScriptExec(ARGV_const_t argv, ARGV_con=
st_t prefixes,
>         if (ipath && ipath[5] !=3D '%')
>             path =3D ipath;
>
> diff --git a/meta/recipes-devtools/rpm/files/0001-Duplicate-filename-befo=
re-passing-it-to-basename.patch b/meta/recipes-devtools/rpm/files/0001-Dupl=
icate-filename-before-passing-it-to-basename.patch
> deleted file mode 100644
> index f9b809d1676..00000000000
> --- a/meta/recipes-devtools/rpm/files/0001-Duplicate-filename-before-pass=
ing-it-to-basename.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From 3fa2ae78db9b31edb4c22f3b5cd36c6c972947f1 Mon Sep 17 00:00:00 2001
> -From: Florian Festi <ffesti@redhat.com>
> -Date: Wed, 26 Jul 2023 15:01:35 +0200
> -Subject: [PATCH] Duplicate filename before passing it to basename
> -
> -basename is allowed change the string passed to it. While we don't need
> -the filename after that just casting away the const seems a bit too
> -hacky.
> -
> -Upstream-Status: Backport [https://github.com/rpm-software-management/rp=
m/commit/3fa2ae78db9b31edb4c22f3b5cd36c6c972947f1]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - tools/rpmuncompress.c | 4 +++-
> - 1 file changed, 3 insertions(+), 1 deletion(-)
> -
> -diff --git a/tools/rpmuncompress.c b/tools/rpmuncompress.c
> -index 58ddf5683..e13cc6a66 100644
> ---- a/tools/rpmuncompress.c
> -+++ b/tools/rpmuncompress.c
> -@@ -98,7 +98,8 @@ static char *doUntar(const char *fn)
> -       if (needtar) {
> -           rasprintf(&buf, "%s '%s' | %s %s -", zipper, fn, tar, taropts=
);
> -       } else if (at->compressed =3D=3D COMPRESSED_GEM) {
> --          const char *bn =3D basename(fn);
> -+          char *tmp =3D xstrdup(fn);
> -+          const char *bn =3D basename(tmp);
> -           size_t nvlen =3D strlen(bn) - 3;
> -           char *gem =3D rpmGetPath("%{__gem}", NULL);
> -           char *gemspec =3D NULL;
> -@@ -112,6 +113,7 @@ static char *doUntar(const char *fn)
> -
> -           free(gemspec);
> -           free(gem);
> -+          free(tmp);
> -       } else {
> -           rasprintf(&buf, "%s '%s'", zipper, fn);
> -       }
> ---
> -2.43.0
> -
> diff --git a/meta/recipes-devtools/rpm/files/0001-Fix-missing-basename-in=
clude-on-macOS.patch b/meta/recipes-devtools/rpm/files/0001-Fix-missing-bas=
ename-include-on-macOS.patch
> deleted file mode 100644
> index a93597a8352..00000000000
> --- a/meta/recipes-devtools/rpm/files/0001-Fix-missing-basename-include-o=
n-macOS.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From b2e67642fd8cb64d8cb1cca9e759396c1c10807d Mon Sep 17 00:00:00 2001
> -From: Calvin Buckley <calvin@cmpct.info>
> -Date: Tue, 11 Jul 2023 19:22:41 -0300
> -Subject: [PATCH] Fix missing basename include on macOS
> -
> -Upstream-Status: Backport [https://github.com/rpm-software-management/rp=
m/commit/b2e67642fd8cb64d8cb1cca9e759396c1c10807d]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - tools/rpmuncompress.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/tools/rpmuncompress.c b/tools/rpmuncompress.c
> -index bd4146d54..58ddf5683 100644
> ---- a/tools/rpmuncompress.c
> -+++ b/tools/rpmuncompress.c
> -@@ -1,6 +1,7 @@
> - #include "system.h"
> -
> - #include <popt.h>
> -+#include <libgen.h>
> - #include <errno.h>
> - #include <stdio.h>
> - #include <string.h>
> ---
> -2.43.0
> -
> diff --git a/meta/recipes-devtools/rpm/files/0001-Fix-unconditional-depen=
dency-on-non-POSIX-GLOB_ONLYD.patch b/meta/recipes-devtools/rpm/files/0001-=
Fix-unconditional-dependency-on-non-POSIX-GLOB_ONLYD.patch
> new file mode 100644
> index 00000000000..8e73e077049
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/0001-Fix-unconditional-dependency-o=
n-non-POSIX-GLOB_ONLYD.patch
> @@ -0,0 +1,56 @@
> +From 1b3a182f38895de5ea8dda5a77867345845fb967 Mon Sep 17 00:00:00 2001
> +From: Panu Matilainen <pmatilai@redhat.com>
> +Date: Mon, 18 Dec 2023 12:25:04 +0200
> +Subject: [PATCH] Fix unconditional dependency on non-POSIX GLOB_ONLYDIR =
flag
> +
> +This regressed when we axed our internal glob copy in commit
> +66fa46c006bae0f28d93238b8f7f1c923645eee5. Luckily GLOB_ONLYDIR is only
> +an optimization so we can just skip it if not available.
> +
> +Upstream-Status: Backport [https://github.com/rpm-software-management/rp=
m/commit/57f3711846f44da0f37cbc5dd66e8fba80a3bee1]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + CMakeLists.txt  | 1 +
> + config.h.in     | 1 +
> + rpmio/rpmglob.c | 2 ++
> + 3 files changed, 4 insertions(+)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index d0ea565f3..0a474106e 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -351,6 +351,7 @@ if (LIBDW_FOUND)
> +       set(HAVE_LIBDW 1)
> + endif()
> +
> ++check_symbol_exists(GLOB_ONLYDIR "glob.h" HAVE_GLOB_ONLYDIR)
> + check_symbol_exists(major "sys/sysmacros.h" MAJOR_IN_SYSMACROS)
> + if (NOT MAJOR_IN_SYSMACROS)
> +       check_symbol_exists(major "sys/mkdev.h" MAJOR_IN_MKDEV)
> +diff --git a/config.h.in b/config.h.in
> +index cb97827d0..ab1757a9a 100644
> +--- a/config.h.in
> ++++ b/config.h.in
> +@@ -100,6 +100,7 @@
> + #cmakedefine HAVE_ZSTD @HAVE_ZSTD@
> + #cmakedefine HAVE___PROGNAME @HAVE___PROGNAME@
> + #cmakedefine HAVE___SECURE_GETENV @HAVE___SECURE_GETENV@
> ++#cmakedefine HAVE_GLOB_ONLYDIR @HAVE_GLOB_ONLYDIR@
> + #cmakedefine MAJOR_IN_MKDEV @MAJOR_IN_MKDEV@
> + #cmakedefine MAJOR_IN_SYSMACROS @MAJOR_IN_SYSMACROS@
> + #cmakedefine RUNDIR @rundir@
> +diff --git a/rpmio/rpmglob.c b/rpmio/rpmglob.c
> +index 8276eddb4..243568766 100644
> +--- a/rpmio/rpmglob.c
> ++++ b/rpmio/rpmglob.c
> +@@ -84,8 +84,10 @@ int rpmGlobPath(const char * pattern, rpmglobFlags fl=
ags,
> +     gflags |=3D GLOB_BRACE;
> +     if (home !=3D NULL && strlen(home) > 0)
> +       gflags |=3D GLOB_TILDE;
> ++#if HAVE_GLOB_ONLYDIR
> +     if (dir_only)
> +       gflags |=3D GLOB_ONLYDIR;
> ++#endif
> +     if (flags & RPMGLOB_NOCHECK)
> +       gflags |=3D GLOB_NOCHECK;
> +
> diff --git a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-e=
xecute-package-scriptlets-wit.patch b/meta/recipes-devtools/rpm/files/0001-=
When-cross-installing-execute-package-scriptlets-wit.patch
> index bd3314a90f8..fc89b44132b 100644
> --- a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-=
package-scriptlets-wit.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-=
package-scriptlets-wit.patch
> @@ -1,4 +1,4 @@
> -From a89daa75ac970d8e247edc762d1181e9a5b0c5d0 Mon Sep 17 00:00:00 2001
> +From 82e6d1ad126df88c58120a31fc025691039db7f3 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Tue, 17 Jan 2017 14:07:17 +0200
>  Subject: [PATCH] When cross-installing, execute package scriptlets witho=
ut
> @@ -24,24 +24,16 @@ Amended 2018-07-03 by Olof Johansson <olofjn@axis.com=
>:
>
>  Upstream-Status: Inappropriate [oe-core specific]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
>   lib/rpmscript.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
>
> -Index: git/lib/rpmscript.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/lib/rpmscript.c
> -+++ git/lib/rpmscript.c
> -@@ -18,7 +18,7 @@
> - #include "rpmio/rpmio_internal.h"
> -
> - #include "lib/rpmplugins.h"     /* rpm plugins hooks */
> --
> -+#include "lib/rpmchroot.h"      /* rpmChrootOut */
> - #include "debug.h"
> -
> - struct scriptNextFileFunc_s {
> -@@ -427,8 +427,7 @@ exit:
> +diff --git a/lib/rpmscript.c b/lib/rpmscript.c
> +index b18f851a3..36e37cf77 100644
> +--- a/lib/rpmscript.c
> ++++ b/lib/rpmscript.c
> +@@ -448,8 +448,7 @@ exit:
>         Fclose(out);    /* XXX dup'd STDOUT_FILENO */
>
>       if (fn) {
> @@ -51,7 +43,7 @@ Index: git/lib/rpmscript.c
>         free(fn);
>       }
>       free(mline);
> -@@ -462,7 +461,13 @@ rpmRC rpmScriptRun(rpmScript script, int
> +@@ -483,7 +482,13 @@ rpmRC rpmScriptRun(rpmScript script, int arg1, int =
arg2, FD_t scriptFd,
>
>       if (rc !=3D RPMRC_FAIL) {
>         if (script_type & RPMSCRIPTLET_EXEC) {
> diff --git a/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-ins=
ert-payloadflags-into-.rpm-me.patch b/meta/recipes-devtools/rpm/files/0001-=
build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch
> index 64433abb6a1..5820b2e7e5b 100644
> --- a/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-pay=
loadflags-into-.rpm-me.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-pay=
loadflags-into-.rpm-me.patch
> @@ -1,4 +1,4 @@
> -From 2d351c666f09cc1b9e368422653fb42ac8b86249 Mon Sep 17 00:00:00 2001
> +From ebe65b0e8622c37463697dcec779a42290c33810 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex@linutronix.de>
>  Date: Tue, 31 Aug 2021 10:37:05 +0200
>  Subject: [PATCH] build/pack.c: do not insert payloadflags into .rpm meta=
data
> @@ -9,15 +9,16 @@ host to the next and breaks reproducibility for .rpm).
>
>  Upstream-Status: Inappropriate [oe-core specific]
>  Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +
>  ---
>   build/pack.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> -Index: git/build/pack.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/build/pack.c
> -+++ git/build/pack.c
> -@@ -328,7 +328,7 @@ static char *getIOFlags(Package pkg)
> +diff --git a/build/pack.c b/build/pack.c
> +index f382c7da0..0889dd993 100644
> +--- a/build/pack.c
> ++++ b/build/pack.c
> +@@ -330,7 +330,7 @@ static char *getIOFlags(Package pkg)
>             headerPutString(pkg->header, RPMTAG_PAYLOADCOMPRESSOR, compr)=
;
>         buf =3D xstrdup(rpmio_flags);
>         buf[s - rpmio_flags] =3D '\0';
> diff --git a/meta/recipes-devtools/rpm/files/0001-configure.ac-add-linux-=
gnux32-variant-to-triplet-han.patch b/meta/recipes-devtools/rpm/files/0001-=
configure.ac-add-linux-gnux32-variant-to-triplet-han.patch
> deleted file mode 100644
> index 29b6686a940..00000000000
> --- a/meta/recipes-devtools/rpm/files/0001-configure.ac-add-linux-gnux32-=
variant-to-triplet-han.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 8f51462d41d8fe942d5d0a06f08d47f625141995 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex@linutronix.de>
> -Date: Thu, 4 Aug 2022 12:15:08 +0200
> -Subject: [PATCH] configure.ac: add linux-gnux32 variant to triplet handl=
ing
> -
> -x32 is a 64 bit x86 ABI with 32 bit pointers.
> -
> -Upstream-Status: Submitted [https://github.com/rpm-software-management/r=
pm/pull/2143]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----
> - configure.ac | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -Index: git/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/configure.ac
> -+++ git/configure.ac
> -@@ -903,6 +903,10 @@ if echo "$host_os" | grep '.*-gnux32$' >
> -       host_os=3D`echo "${host_os}" | sed 's/-gnux32$//'`
> -       host_os_gnu=3D-gnux32
> - fi
> -+if echo "$host_os" | grep '.*-gnux32$' > /dev/null ; then
> -+      host_os=3D`echo "${host_os}" | sed 's/-gnux32$//'`
> -+      host_os_gnu=3D-gnux32
> -+fi
> - if echo "$host_os" | grep '.*-gnu$' > /dev/null ; then
> -       host_os=3D`echo "${host_os}" | sed 's/-gnu$//'`
> - fi
> diff --git a/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-f=
ile-conflicts-for-MIPS64-N32.patch b/meta/recipes-devtools/rpm/files/0001-l=
ib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch
> index 82e6567dc74..8b9f1f72944 100644
> --- a/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-con=
flicts-for-MIPS64-N32.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-con=
flicts-for-MIPS64-N32.patch
> @@ -1,4 +1,4 @@
> -From 1ed066fc6fa7d7afffe3545c4e3ea937529e6c49 Mon Sep 17 00:00:00 2001
> +From bfceae7386b5fec108f98ad59ad96e57aecb08d3 Mon Sep 17 00:00:00 2001
>  From: Changqing Li <changqing.li@windriver.com>
>  Date: Thu, 7 May 2020 17:40:58 +0800
>  Subject: [PATCH] lib/transaction.c: fix file conflicts for MIPS64 N32
> @@ -27,15 +27,16 @@ Fixed by performing a 'last-in-wins' resolution when =
"neither is preferred".
>  Upstream-Status: Submitted <https://github.com/rpm-software-management/r=
pm/issues/193>
>
>  Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +
>  ---
>   lib/transaction.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
>
> -Index: git/lib/transaction.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/lib/transaction.c
> -+++ git/lib/transaction.c
> -@@ -402,7 +402,18 @@ static int handleColorConflict(rpmts ts,
> +diff --git a/lib/transaction.c b/lib/transaction.c
> +index 70d2587ac..b89b30060 100644
> +--- a/lib/transaction.c
> ++++ b/lib/transaction.c
> +@@ -400,7 +400,18 @@ static int handleColorConflict(rpmts ts,
>                     rpmfsSetAction(ofs, ofx, FA_CREATE);
>                 rpmfsSetAction(fs, fx, FA_SKIPCOLOR);
>                 rConflicts =3D 0;
> diff --git a/meta/recipes-devtools/rpm/files/0001-perl-disable-auto-reqs.=
patch b/meta/recipes-devtools/rpm/files/0001-perl-disable-auto-reqs.patch
> index a6c58699d36..388694d234f 100644
> --- a/meta/recipes-devtools/rpm/files/0001-perl-disable-auto-reqs.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-perl-disable-auto-reqs.patch
> @@ -1,4 +1,7 @@
> -perl: disable auto requires
> +From 7894b508a61bb87f05f7eb0a1e912a2422f4fcd2 Mon Sep 17 00:00:00 2001
> +From: Mark Hatle <mark.hatle@windriver.com>
> +Date: Tue, 15 Aug 2017 16:41:57 -0500
> +Subject: [PATCH] perl: disable auto requires
>
>  When generating automatic requirements, it's possible for perl scripts t=
o
>  declare 'optional' dependencies.  These seem to often be incorrect and w=
ill
> @@ -10,19 +13,24 @@ Upstream-Status: Inappropriate [OE specific configura=
tion]
>
>  Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>
> -Index: git/fileattrs/perl.attr
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/fileattrs/perl.attr
> -+++ git/fileattrs/perl.attr
> +---
> + fileattrs/perl.attr    | 2 +-
> + fileattrs/perllib.attr | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/fileattrs/perl.attr b/fileattrs/perl.attr
> +index 0daef58d5..81ddf5305 100644
> +--- a/fileattrs/perl.attr
> ++++ b/fileattrs/perl.attr
>  @@ -1,3 +1,3 @@
>  -%__perl_requires      %{_rpmconfigdir}/perl.req
>  +#__perl_requires      %{_rpmconfigdir}/perl.req
>   %__perl_magic         ^.*[Pp]erl .*$
>   %__perl_flags         exeonly
> -Index: git/fileattrs/perllib.attr
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/fileattrs/perllib.attr
> -+++ git/fileattrs/perllib.attr
> +diff --git a/fileattrs/perllib.attr b/fileattrs/perllib.attr
> +index fcad48099..495a28927 100644
> +--- a/fileattrs/perllib.attr
> ++++ b/fileattrs/perllib.attr
>  @@ -1,5 +1,5 @@
>   %__perllib_provides   %{_rpmconfigdir}/perl.prov
>  -%__perllib_requires   %{_rpmconfigdir}/perl.req
> diff --git a/meta/recipes-devtools/rpm/files/0001-python-Use-Py_hash_t-in=
stead-of-long-in-hdr_hash.patch b/meta/recipes-devtools/rpm/files/0001-pyth=
on-Use-Py_hash_t-instead-of-long-in-hdr_hash.patch
> deleted file mode 100644
> index d0e637191a8..00000000000
> --- a/meta/recipes-devtools/rpm/files/0001-python-Use-Py_hash_t-instead-o=
f-long-in-hdr_hash.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 6ef189c45b763aedac5ef57ed6a5fc125fa95b41 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 3 Mar 2023 09:54:48 -0800
> -Subject: [PATCH] python: Use Py_hash_t instead of long in hdr_hash
> -
> -Fixes
> -python/header-py.c:744:2: error: incompatible function pointer types ini=
tializing 'hashfunc' (aka 'int (*)(struct _object *)') with an expression o=
f type 'long (PyObject *)' (aka 'long (struct _object *)') [-Wincompatible-=
function-pointer-types]
> -|         hdr_hash,                       /* tp_hash */
> -|         ^~~~~~~~
> -
> -Upstream-Status: Submitted [https://github.com/rpm-software-management/r=
pm/pull/2409]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - python/header-py.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/python/header-py.c b/python/header-py.c
> -index 0aed0c9267..c15503f359 100644
> ---- a/python/header-py.c
> -+++ b/python/header-py.c
> -@@ -316,9 +316,9 @@ static PyObject * hdr_dsOfHeader(PyObject * s)
> -                                  "(Oi)", s, RPMTAG_NEVR);
> - }
> -
> --static long hdr_hash(PyObject * h)
> -+static Py_hash_t hdr_hash(PyObject * h)
> - {
> --    return (long) h;
> -+    return (Py_hash_t) h;
> - }
> -
> - static PyObject * hdr_reduce(hdrObject *s)
> ---
> -2.39.2
> -
> diff --git a/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixi=
ng-etc-from-RPM_ETCCONFIGDIR-.patch b/meta/recipes-devtools/rpm/files/0002-=
Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch
> index 2fe96a839c3..89c23f81975 100644
> --- a/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-=
from-RPM_ETCCONFIGDIR-.patch
> +++ b/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-=
from-RPM_ETCCONFIGDIR-.patch
> @@ -1,7 +1,7 @@
> -From 383c0b097b7eba16801a9e3c4b8e36a4b6de74ab Mon Sep 17 00:00:00 2001
> +From e53c0e2586bc6f4677db3c6898a6428283a6b785 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Fri, 20 Jan 2017 13:33:05 +0200
> -Subject: [PATCH 2/2] Add support for prefixing /etc from RPM_ETCCONFIGDI=
R
> +Subject: [PATCH] Add support for prefixing /etc from RPM_ETCCONFIGDIR
>   environment variable
>
>  This is needed so that rpm can pick up target-specific configuration
> @@ -9,15 +9,16 @@ from target rootfs instead of its own native sysroot.
>
>  Upstream-Status: Inappropriate [oe-core specific]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
>   lib/rpmrc.c | 19 ++++++++++++++-----
>   1 file changed, 14 insertions(+), 5 deletions(-)
>
> -Index: git/lib/rpmrc.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/lib/rpmrc.c
> -+++ git/lib/rpmrc.c
> -@@ -455,10 +455,14 @@ const char * lookupInDefaultTable(const
> +diff --git a/lib/rpmrc.c b/lib/rpmrc.c
> +index f39dcfc11..f27f88753 100644
> +--- a/lib/rpmrc.c
> ++++ b/lib/rpmrc.c
> +@@ -455,10 +455,14 @@ const char * lookupInDefaultTable(const char * nam=
e,
>   static void setDefaults(void)
>   {
>       const char *confdir =3D rpmConfigDir();
> @@ -27,26 +28,26 @@ Index: git/lib/rpmrc.c
>  +
>       if (!defrcfiles) {
>         defrcfiles =3D rstrscat(NULL, confdir, "/rpmrc", ":",
> -                               confdir, "/" RPMCANONVENDOR "/rpmrc", ":"=
,
> --                              SYSCONFDIR "/rpmrc", ":");
> -+                              etcconfdir, SYSCONFDIR "/rpmrc", ":", NUL=
L);
> +                               confdir, "/" RPM_VENDOR "/rpmrc", ":",
> +-                              SYSCONFDIR "/rpmrc", NULL);
> ++                              etcconfdir, SYSCONFDIR "/rpmrc", NULL);
>       }
>
>   #ifndef MACROFILES
>  @@ -468,9 +472,9 @@ static void setDefaults(void)
>                                 confdir, "/platform/%{_target}/macros", "=
:",
>                                 confdir, "/fileattrs/*.attr", ":",
> -                               confdir, "/" RPMCANONVENDOR "/macros", ":=
",
> +                               confdir, "/" RPM_VENDOR "/macros", ":",
>  -                              SYSCONFDIR "/rpm/macros.*", ":",
>  -                              SYSCONFDIR "/rpm/macros", ":",
> --                              SYSCONFDIR "/rpm/%{_target}/macros", ":")=
;
> +-                              SYSCONFDIR "/rpm/%{_target}/macros", NULL=
);
>  +                              etcconfdir, SYSCONFDIR "/rpm/macros.*", "=
:",
>  +                              etcconfdir, SYSCONFDIR "/rpm/macros", ":"=
,
> -+                              etcconfdir, SYSCONFDIR "/rpm/%{_target}/m=
acros", ":", NULL);
> ++                              etcconfdir, SYSCONFDIR "/rpm/%{_target}/m=
acros", NULL);
>       }
>   #else
>       macrofiles =3D MACROFILES;
> -@@ -997,7 +1001,11 @@ static void read_auxv(void)
> +@@ -1114,7 +1118,11 @@ static void read_auxv(void)
>    */
>   static void defaultMachine(rpmrcCtx ctx, const char ** arch, const char=
 ** os)
>   {
> @@ -59,7 +60,7 @@ Index: git/lib/rpmrc.c
>       static struct utsname un;
>       char * chptr;
>       canonEntry canon;
> -@@ -1307,6 +1315,7 @@ static void defaultMachine(rpmrcCtx ctx,
> +@@ -1434,6 +1442,7 @@ static void defaultMachine(rpmrcCtx ctx, const cha=
r ** arch, const char ** os)
>
>       if (arch) *arch =3D un.machine;
>       if (os) *os =3D un.sysname;
> diff --git a/meta/recipes-devtools/rpm/files/0002-docs-CMakeLists.txt-do-=
not-install-non-existent-docs.patch b/meta/recipes-devtools/rpm/files/0002-=
docs-CMakeLists.txt-do-not-install-non-existent-docs.patch
> new file mode 100644
> index 00000000000..e7f0adc70c9
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/0002-docs-CMakeLists.txt-do-not-ins=
tall-non-existent-docs.patch
> @@ -0,0 +1,26 @@
> +From 4e388caabf0906f09d697b8d08623a022f7270b2 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex@linutronix.de>
> +Date: Wed, 29 Nov 2023 14:09:06 +0100
> +Subject: [PATCH] docs/CMakeLists.txt: do not install non-existent docs/h=
tml
> +
> +Building html would require doxygen-native.
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +
> +---
> + docs/CMakeLists.txt | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/docs/CMakeLists.txt b/docs/CMakeLists.txt
> +index 52dce7b4e..c01ff7757 100644
> +--- a/docs/CMakeLists.txt
> ++++ b/docs/CMakeLists.txt
> +@@ -18,7 +18,6 @@ if (DOXYGEN_FOUND)
> + elseif (EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/html/index.html)
> +       set(doxsrc ${CMAKE_CURRENT_SOURCE_DIR})
> + endif()
> +-install(DIRECTORY ${doxsrc}/html/ DESTINATION ${CMAKE_INSTALL_DOCDIR}/A=
PI)
> +
> + install(FILES
> +       README.md
> diff --git a/meta/recipes-devtools/rpm/files/0002-rpmio-rpmglob.c-avoid-u=
sing-GLOB_BRACE-if-undefined-.patch b/meta/recipes-devtools/rpm/files/0002-=
rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch
> new file mode 100644
> index 00000000000..3d4b09bedb6
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/0002-rpmio-rpmglob.c-avoid-using-GL=
OB_BRACE-if-undefined-.patch
> @@ -0,0 +1,34 @@
> +From f78e05544fb5ae9ef688963f19666f1af34c3d5c Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex@linutronix.de>
> +Date: Tue, 16 Jan 2024 09:59:26 +0100
> +Subject: [PATCH] rpmio/rpmglob.c: avoid using GLOB_BRACE if undefined by=
 C
> + library
> +
> +This addresses musl failures; if there is code out there relying on
> +those braces, it needs to be fixed when used on musl.
> +
> +This is unlikely to be trivially fixable upstream.
> +
> +Upstream-Status: Inappropriate [reported at https://github.com/rpm-softw=
are-management/rpm/issues/2844]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + rpmio/rpmglob.c | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/rpmio/rpmglob.c b/rpmio/rpmglob.c
> +index 243568766..43c27074a 100644
> +--- a/rpmio/rpmglob.c
> ++++ b/rpmio/rpmglob.c
> +@@ -33,6 +33,12 @@
> +
> + #include "debug.h"
> +
> ++/* Don't fail if the standard C library
> +++ * doesn't provide brace expansion */
> ++#ifndef GLOB_BRACE
> ++#define GLOB_BRACE 0
> ++#endif
> ++
> + /* Return 1 if pattern contains a magic char, see glob(7) for a list */
> + static int ismagic(const char *pattern)
> + {
> diff --git a/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logg=
ing-level-around-scriptlets-t.patch b/meta/recipes-devtools/rpm/files/0016-=
rpmscript.c-change-logging-level-around-scriptlets-t.patch
> index 9dbe7125ded..b3d57cc8703 100644
> --- a/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-lev=
el-around-scriptlets-t.patch
> +++ b/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-lev=
el-around-scriptlets-t.patch
> @@ -1,4 +1,4 @@
> -From 989e425d416474c191b020d0825895e3df4bd033 Mon Sep 17 00:00:00 2001
> +From 0005ab544230020e854e9709b2bc0501702c2968 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Thu, 10 Jan 2019 18:14:18 +0100
>  Subject: [PATCH] rpmscript.c: change logging level around scriptlets to =
INFO
> @@ -9,15 +9,16 @@ irrelevant noise to rootfs logs.
>
>  Upstream-Status: Inappropriate [oe-core specific]
>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
>  ---
>   lib/rpmscript.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> -Index: git/lib/rpmscript.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/lib/rpmscript.c
> -+++ git/lib/rpmscript.c
> -@@ -270,7 +270,7 @@ static char * writeScript(const char *cm
> +diff --git a/lib/rpmscript.c b/lib/rpmscript.c
> +index 37ada014c..bab0c97a6 100644
> +--- a/lib/rpmscript.c
> ++++ b/lib/rpmscript.c
> +@@ -291,7 +291,7 @@ static char * writeScript(const char *cmd, const cha=
r *script)
>       if (Ferror(fd))
>         goto exit;
>
> @@ -26,7 +27,7 @@ Index: git/lib/rpmscript.c
>         static const char set_x[] =3D "set -x\n";
>         /* Assume failures will be caught by the write below */
>         Fwrite(set_x, sizeof(set_x[0]), sizeof(set_x)-1, fd);
> -@@ -302,7 +302,7 @@ static rpmRC runExtScript(rpmPlugins plu
> +@@ -323,7 +323,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARGV_c=
onst_t prefixes,
>       char *mline =3D NULL;
>       rpmRC rc =3D RPMRC_FAIL;
>
> @@ -35,7 +36,7 @@ Index: git/lib/rpmscript.c
>
>       if (script) {
>         fn =3D writeScript(*argvp[0], script);
> -@@ -354,7 +354,7 @@ static rpmRC runExtScript(rpmPlugins plu
> +@@ -375,7 +375,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARGV_c=
onst_t prefixes,
>                 sname, strerror(errno));
>         goto exit;
>       } else if (pid =3D=3D 0) {/* Child */
> @@ -44,7 +45,7 @@ Index: git/lib/rpmscript.c
>                sname, *argvp[0], (unsigned)getpid());
>
>         fclose(in);
> -@@ -397,7 +397,7 @@ static rpmRC runExtScript(rpmPlugins plu
> +@@ -418,7 +418,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARGV_c=
onst_t prefixes,
>         reaped =3D waitpid(pid, &status, 0);
>       } while (reaped =3D=3D -1 && errno =3D=3D EINTR);
>
> diff --git a/meta/recipes-devtools/rpm/files/ea3187cfcf9cac87e5bc5e7db79b=
0338da9e355e.patch b/meta/recipes-devtools/rpm/files/ea3187cfcf9cac87e5bc5e=
7db79b0338da9e355e.patch
> deleted file mode 100644
> index 470dda1dcfb..00000000000
> --- a/meta/recipes-devtools/rpm/files/ea3187cfcf9cac87e5bc5e7db79b0338da9=
e355e.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -From ea3187cfcf9cac87e5bc5e7db79b0338da9e355e Mon Sep 17 00:00:00 2001
> -From: Panu Matilainen <pmatilai@redhat.com>
> -Date: Mon, 26 Jun 2023 12:45:09 +0300
> -Subject: [PATCH] Don't muck with per-process global sqlite configuration=
 from
> - the db backend
> -
> -sqlite3_config() affects all in-process uses of sqlite. librpm being a
> -low-level library, it has no business whatsoever making such decisions
> -for the applications running on top of it. Besides that, the callback ca=
n
> -easily end up pointing to an already closed database, causing an
> -innocent API user to crash in librpm on an entirely unrelated error on
> -some other database. "Oops."
> -
> -The sqlite API doesn't seem to provide any per-db or non-global context
> -for logging errors, thus we can only remove the call and let sqlite outp=
ut
> -errors the way it pleases (print through stderr, presumably).
> -
> -Thanks to Jan Palus for spotting and reporting!
> -
> -Upstream-Status: Backport [https://github.com/rpm-software-management/rp=
m/commit/ea3187cfcf9cac87e5bc5e7db79b0338da9e355e]
> -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ----
> - lib/backend/sqlite.c | 8 --------
> - 1 file changed, 8 deletions(-)
> -
> -diff --git a/lib/backend/sqlite.c b/lib/backend/sqlite.c
> -index 5a029d575a..b612732267 100644
> ---- a/lib/backend/sqlite.c
> -+++ b/lib/backend/sqlite.c
> -@@ -44,13 +44,6 @@ static void rpm_match3(sqlite3_context *sctx, int arg=
c, sqlite3_value **argv)
> -     sqlite3_result_int(sctx, match);
> - }
> -
> --static void errCb(void *data, int err, const char *msg)
> --{
> --    rpmdb rdb =3D data;
> --    rpmlog(RPMLOG_WARNING, "%s: %s: %s\n",
> --              rdb->db_descr, sqlite3_errstr(err), msg);
> --}
> --
> - static int dbiCursorReset(dbiCursor dbc)
> - {
> -     if (dbc->stmt) {
> -@@ -170,7 +163,6 @@ static int sqlite_init(rpmdb rdb, const char * dbhom=
e)
> -        * the "database is locked" errors at every cost
> -        */
> -       sqlite3_busy_timeout(sdb, 10000);
> --      sqlite3_config(SQLITE_CONFIG_LOG, errCb, rdb);
> -
> -       sqlexec(sdb, "PRAGMA secure_delete =3D OFF");
> -       sqlexec(sdb, "PRAGMA case_sensitive_like =3D ON");
> diff --git a/meta/recipes-devtools/rpm/files/fix-declaration.patch b/meta=
/recipes-devtools/rpm/files/fix-declaration.patch
> deleted file mode 100644
> index e5c84ebd498..00000000000
> --- a/meta/recipes-devtools/rpm/files/fix-declaration.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From b960c0b43a080287a7c13533eeb2d9f288db1414 Mon Sep 17 00:00:00 2001
> -From: Florian Festi <ffesti@redhat.com>
> -Date: Thu, 16 Mar 2023 19:05:04 +0100
> -Subject: [PATCH] Fix compiler error on clang
> -
> -Turns out variable declarations are not allowed after a label, even in
> -C99. And while some compilers don't seem to care others do.
> -
> -Moving the declaration of mayopen to the start of the function to avoid
> -this problem.
> -
> -Resolves: #2435
> -Upstream-Status: Backport [https://github.com/rpm-software-management/rp=
m/commit/b960c0b43a080287a7c13533eeb2d9f288db1414]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----
> - lib/fsm.c | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/lib/fsm.c b/lib/fsm.c
> -index 5671ac642d..183293edb0 100644
> ---- a/lib/fsm.c
> -+++ b/lib/fsm.c
> -@@ -879,6 +879,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, rpmfi=
les files,
> -     int nodigest =3D (rpmtsFlags(ts) & RPMTRANS_FLAG_NOFILEDIGEST) ? 1 =
: 0;
> -     int nofcaps =3D (rpmtsFlags(ts) & RPMTRANS_FLAG_NOCAPS) ? 1 : 0;
> -     int firstlinkfile =3D -1;
> -+    int mayopen =3D 0;
> -     char *tid =3D NULL;
> -     struct filedata_s *fdata =3D xcalloc(fc, sizeof(*fdata));
> -     struct filedata_s *firstlink =3D NULL;
> -@@ -1016,7 +1017,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, rpm=
files files,
> -
> - setmeta:
> -           /* Special files require path-based ops */
> --          int mayopen =3D S_ISREG(fp->sb.st_mode) || S_ISDIR(fp->sb.st_=
mode);
> -+          mayopen =3D S_ISREG(fp->sb.st_mode) || S_ISDIR(fp->sb.st_mode=
);
> -           if (!rc && fd =3D=3D -1 && mayopen) {
> -               int flags =3D O_RDONLY;
> -               /* Only follow safe symlinks, and never on temporary file=
s */
> diff --git a/meta/recipes-devtools/rpm/rpm_4.18.1.bb b/meta/recipes-devto=
ols/rpm/rpm_4.19.1.bb
> similarity index 72%
> rename from meta/recipes-devtools/rpm/rpm_4.18.1.bb
> rename to meta/recipes-devtools/rpm/rpm_4.19.1.bb
> index 3e85cbb8efe..af11dec5ef3 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.18.1.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.19.1.bb
> @@ -24,7 +24,7 @@ HOMEPAGE =3D "http://www.rpm.org"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc4eec0c20c6034b9407a09945b48a=
43f"
>
> -SRC_URI =3D "git://github.com/rpm-software-management/rpm;branch=3Drpm-4=
.18.x;protocol=3Dhttps \
> +SRC_URI =3D "git://github.com/rpm-software-management/rpm;branch=3Drpm-4=
.19.x;protocol=3Dhttps \
>             file://0001-Do-not-add-an-unsatisfiable-dependency-when-build=
ing.patch \
>             file://0001-Do-not-read-config-files-from-HOME.patch \
>             file://0001-When-cross-installing-execute-package-scriptlets-=
wit.patch \
> @@ -36,58 +36,51 @@ SRC_URI =3D "git://github.com/rpm-software-management=
/rpm;branch=3Drpm-4.18.x;protoc
>             file://0016-rpmscript.c-change-logging-level-around-scriptlet=
s-t.patch \
>             file://0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N=
32.patch \
>             file://0001-build-pack.c-do-not-insert-payloadflags-into-.rpm=
-me.patch \
> -           file://0001-configure.ac-add-linux-gnux32-variant-to-triplet-=
han.patch \
> -           file://0001-python-Use-Py_hash_t-instead-of-long-in-hdr_hash.=
patch \
> -           file://fix-declaration.patch \
> -           file://ea3187cfcf9cac87e5bc5e7db79b0338da9e355e.patch \
> -           file://0001-Duplicate-filename-before-passing-it-to-basename.=
patch \
> -           file://0001-Fix-missing-basename-include-on-macOS.patch \
> +           file://0001-CMakeLists.txt-look-for-lua-with-pkg-config-rathe=
r-t.patch \
> +           file://0002-docs-CMakeLists.txt-do-not-install-non-existent-d=
ocs.patch \
> +           file://0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefin=
ed-.patch \
> +           file://0001-Fix-unconditional-dependency-on-non-POSIX-GLOB_ON=
LYD.patch \
> +           file://0001-CMakeLists.txt-restore-readline-support-as-an-exp=
lic.patch \
>             "
>
>  PE =3D "1"
> -SRCREV =3D "4588bc3f994338502d2770ad24cbfcdaa6c335ec"
> +SRCREV =3D "98b301ebb44fb5cabb56fc24bc3aaa437c47c038"
>
>  S =3D "${WORKDIR}/git"
>
> -DEPENDS =3D "lua libgcrypt file popt xz bzip2 elfutils python3"
> +DEPENDS =3D "lua libgcrypt file popt xz bzip2 elfutils python3 sqlite3 z=
std"
>  DEPENDS:append:class-native =3D " file-replacement-native bzip2-replacem=
ent-native"
>
> -inherit autotools gettext pkgconfig python3native
> -export PYTHON_ABI
> -
> -AUTOTOOLS_AUXDIR =3D "${S}/build-aux"
> -
> -# OE-core patches autoreconf to additionally run gnu-configize, which fa=
ils with this recipe
> -EXTRA_AUTORECONF:append =3D " --exclude=3Dgnu-configize"
> -
> -# Vendor is detected differently on x86 and aarch64 hosts and can feed i=
nto target packages
> -EXTRA_OECONF:append =3D " --enable-python --with-crypto=3Dlibgcrypt --wi=
th-vendor=3Dpc"
> -EXTRA_OECONF:append:libc-musl =3D " --disable-nls --disable-openmp"
> +EXTRA_OECMAKE:append:libc-musl =3D " -DENABLE_NLS=3DOFF -DENABLE_OPENMP=
=3DOFF"
>
>  # --sysconfdir prevents rpm from attempting to access machine-specific c=
onfiguration in sysroot/etc; we need to have it in rootfs
>  # --localstatedir prevents rpm from writing its database to native sysro=
ot when building images
> -# Forcibly disable plugins for native/nativesdk, as the inhibit and prio=
reset
> -# plugins both behave badly inside builds.
> -EXTRA_OECONF:append:class-native =3D " --sysconfdir=3D/etc --localstated=
ir=3D/var --disable-plugins"
> -EXTRA_OECONF:append:class-nativesdk =3D " --sysconfdir=3D/etc --disable-=
plugins"
> +EXTRA_OECMAKE:append:class-native =3D " -DCMAKE_INSTALL_SYSCONFDIR:PATH=
=3D/etc -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=3D/var"
> +EXTRA_OECMAKE:append:class-nativesdk =3D " -DCMAKE_INSTALL_FULL_SYSCONFD=
IR=3D/etc"
> +
> +inherit cmake gettext pkgconfig python3targetconfig
> +OECMAKE_GENERATOR =3D "Unix Makefiles"
>
>  BBCLASSEXTEND =3D "native nativesdk"
>
> -PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
'inhibit', '', d)} sqlite zstd"
> -# The inhibit plugin serves no purpose outside of the target
> -PACKAGECONFIG:remove:class-native =3D "inhibit"
> -PACKAGECONFIG:remove:class-nativesdk =3D "inhibit"
> +PACKAGECONFIG ??=3D "internal-openpgp"
>
> -PACKAGECONFIG[imaevm] =3D "--with-imaevm,,ima-evm-utils"
> -PACKAGECONFIG[inhibit] =3D "--enable-inhibit-plugin,--disable-inhibit-pl=
ugin,dbus"
> -PACKAGECONFIG[rpm2archive] =3D "--with-archive,--without-archive,libarch=
ive"
> -PACKAGECONFIG[sqlite] =3D "--enable-sqlite=3Dyes,--enable-sqlite=3Dno,sq=
lite3"
> -PACKAGECONFIG[readline] =3D "--with-readline,--without-readline,readline=
"
> -PACKAGECONFIG[ndb] =3D "--enable-ndb,--disable-ndb"
> -PACKAGECONFIG[bdb-ro] =3D "--enable-bdb-ro,--disable-bdb-ro"
> -PACKAGECONFIG[zstd] =3D "--enable-zstd=3Dyes,--enable-zstd=3Dno,zstd"
> +PACKAGECONFIG[plugins] =3D "-DENABLE_PLUGINS=3DON,-DENABLE_PLUGINS=3DOFF=
"
> +PACKAGECONFIG[testsuite] =3D "-DENABLE_TESTSUITE=3DON,-DENABLE_TESTSUITE=
=3DOFF"
>
> -ASNEEDED =3D ""
> +# Deprecated! https://fedoraproject.org/wiki/Changes/RpmSequoia
> +PACKAGECONFIG[internal-openpgp] =3D "-DWITH_INTERNAL_OPENPGP=3DON,-DWITH=
_INTERNAL_OPENPGP=3DOFF"
> +
> +PACKAGECONFIG[cap] =3D "-DWITH_CAP=3DON,-DWITH_CAP=3DOFF"
> +PACKAGECONFIG[acl] =3D "-DWITH_ACL=3DON,-DWITH_ACL=3DOFF"
> +PACKAGECONFIG[archive] =3D "-DWITH_ARCHIVE=3DON,-DWITH_ARCHIVE=3DOFF,lib=
archive"
> +PACKAGECONFIG[selinux] =3D "-DWITH_SELINUX=3DON,-DWITH_SELINUX=3DOFF"
> +PACKAGECONFIG[dbus] =3D "-DWITH_DBUS=3DON,-DWITH_DBUS=3DOFF"
> +PACKAGECONFIG[audit] =3D "-DWITH_AUDIT=3DON,-DWITH_AUDIT=3DOFF"
> +PACKAGECONFIG[fsverity] =3D "-DWITH_FSVERITY=3DON,-DWITH_FSVERITY=3DOFF"
> +PACKAGECONFIG[imaevm] =3D "-DWITH_IMAEVM=3DON,-DWITH_IMAEVM=3DOFF"
> +PACKAGECONFIG[fapolicyd] =3D "-DWITH_FAPOLICYD=3DON,-DWITH_FAPOLICYD=3DO=
FF"
> +PACKAGECONFIG[readline] =3D "-DWITH_READLINE=3DON,-DWITH_READLINE=3DOFF,=
readline"
>
>  # Direct rpm-native to read configuration from our sysroot, not the one =
it was compiled in
>  # libmagic also has sysroot path contamination, so override it
> @@ -105,10 +98,6 @@ WRAPPER_TOOLS =3D " \
>     ${libdir}/rpm/rpmdeps \
>  "
>
> -do_configure:prepend() {
> -        mkdir -p ${S}/build-aux
> -}
> -
>  do_install:append:class-native() {
>          for tool in ${WRAPPER_TOOLS}; do
>                  test -x ${D}$tool && create_wrapper ${D}$tool \
> @@ -143,6 +132,7 @@ do_install:append:class-nativesdk() {
>
>  do_install:append () {
>         sed -i -e 's:${HOSTTOOLS_DIR}/::g' \
> +            -e 's:${STAGING_DIR_NATIVE}/::g' \
>             ${D}/${libdir}/rpm/macros
>
>  }
> @@ -166,6 +156,7 @@ FILES:${PN}-build =3D "\
>      ${libdir}/rpm/check-* \
>      ${libdir}/rpm/sepdebugcrcfix \
>      ${libdir}/rpm/find-lang.sh \
> +    ${libdir}/rpm/sysusers.sh \
>      ${libdir}/rpm/*provides* \
>      ${libdir}/rpm/*requires* \
>      ${libdir}/rpm/*deps* \
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194368): https://lists.openembedded.org/g/openembedde=
d-core/message/194368
> Mute This Topic: https://lists.openembedded.org/mt/103975822/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

