Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 727CC756F0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 10:18:22 +0000 (UTC)
Received: by qgg60 with SMTP id 60so56880162qgg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jun 2015 03:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=prIiawn48hNbRLSdnu0Zih9CRUw31qPaan+Uw/RA9i4=;
	b=ALCOxouetwf3oS95joWJX9qcbuPDSscu1dy7sjpWeS6FKKIcMDWYQJgxGXHiNZcDeU
	yMou/MetHTc3tu/VbYZTS3V2aT/RF8Qv8dcI1aLK8KMefPC7jnzT+LkV+nCXUgh6O8Wd
	zE3yy/yxjOL2ls3k6wjvTd3hArqh7XIuqfT6r2WXw/F4dkgQUAFrdcg+p9mjk9U/kuDB
	n4JP0D16hzhQrZoCmkr8VouZ+PX0DhvRzpph+sUNQPs582lGf9Yx5TVG5o6LkZOJYc+U
	fu1CmR+MCCftcU5KvjBHemRHI4nY7goXI4zzRqNW/ENGJwCPIdIrjTl4Up6ceVsS8bbU
	UXPA==
X-Gm-Message-State: ALoCoQmRhJRzxQMxWSI7kSvmpd6QYegpng+l3jCBKqO33oKVYPUJhSU+I5bMgV7I11QqsHoeY0JO
X-Received: by 10.229.96.138 with SMTP id h10mr28971919qcn.5.1433240303031;
	Tue, 02 Jun 2015 03:18:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 2 Jun 2015 03:18:02 -0700 (PDT)
In-Reply-To: <6b3f1d643cd1ae133c15b5c27b675983cf32f4a4.1433231155.git.kai.kang@windriver.com>
References: <cover.1433231155.git.kai.kang@windriver.com>
	<6b3f1d643cd1ae133c15b5c27b675983cf32f4a4.1433231155.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Jun 2015 11:18:02 +0100
Message-ID: <CAJTo0LaAwbP0MafJ9kzUQeUiF_Jh8zh506ZxGjqC9dK2xsTv9Q@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] qt4: upgrade to 4.8.7
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
X-List-Received-Date: Tue, 02 Jun 2015 10:18:26 -0000
Content-Type: multipart/alternative; boundary=001a1133dd7423f060051786432a

--001a1133dd7423f060051786432a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Kai,

This doesn't apply against master since the GStreamer 0.10 removal patches
landed, can you rebase?

Ross

On 2 June 2015 at 08:52, Kai Kang <kai.kang@windriver.com> wrote:

> Upgrade qt4 packages from version 4.8.6 to 4.8.7.
>
> * remove arm64 related patches which are merged
> * remove 0034-Fix-a-division-by-zero-when-processing-malformed-BMP.patch
>   which is backported.
> * update 0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch
>   and 0013-configure-add-crossarch-option.patch for new version
> * remove useless variable INC_PR
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-qt/qt4/nativesdk-qt4-tools.inc        |   2 -
>  ...tools_4.8.6.bb =3D> nativesdk-qt4-tools_4.8.7.bb} |   4 +-
>  .../0029-aarch64_arm64_fix_arch_detection.patch    |  53 ---
>  .../0030-aarch64_arm64_qatomic_support.patch       | 491
> ---------------------
>  .../qt4/qt4-4.8.6/0031-aarch64_arm64_mkspecs.patch | 124 ------
>  .../qt4/qt4-4.8.6/0032-aarch64_add_header.patch    |  18 -
>  ...ion-by-zero-when-processing-malformed-BMP.patch |  44 --
>  .../qt4/{qt4-4.8.6.inc =3D> qt4-4.8.7.inc}           |   9 +-
>  ...o-allow-to-set-qt.conf-from-the-outside-u.patch |   0
>  ...tty_qws-fix-build-with-old-kernel-headers.patch |   0
>  ...003-webkit2-set-OUTPUT_DIR-value-if-empty.patch |   0
>  ...make-is-already-built-in-qt4-tools-native.patch |   0
>  ...e-set-LFLAGS-to-pick-up-zlib-from-staging.patch |   0
>  ...se-OE_QMAKE_-values-to-specify-Qt-utility.patch |   0
>  ...-const-usage-that-causes-compile-failure-.patch |   0
>  ...llow-building-a-separate-qmake-for-the-ta.patch |   0
>  ...e-fix-source-file-references-in-qmake.pri.patch |   0
>  ...ack-to-not-use-the-pg_config-of-the-host-.patch |  20 +-
>  .../0011-freetype-host-includes.patch              |   0
>  .../0012-Add-2bpp-support.patch                    |   0
>  .../0013-configure-add-crossarch-option.patch      |  22 +-
>  ...tions-fix-phony-translation-linking-error.patch |   0
>  ...-configure-add-nostrip-for-debug-packages.patch |   0
>  .../0016-configure-eval-QMAKE_CXX.patch            |   0
>  ...nsure-we-identify-the-compiler-as-g-in-co.patch |   0
>  ...ure-make-pulseaudio-a-configurable-option.patch |   0
>  ...xes-for-gcc-4.7.0-particularly-on-qemux86.patch |   0
>  ...ake-qt4-native-work-with-long-building-pa.patch |   0
>  ...ls.pro-disable-qmeegographicssystemhelper.patch |   0
>  .../0028-Don-t-crash-on-broken-GIF-images.patch    |   0
>  ...figure-support-c-0x-standard-for-directfd.patch |   0
>  .../Fix-QWSLock-invalid-argument-logs.patch        |   0
>  .../add_check_for_aarch64_32.patch                 |   0
>  .../qt4/{qt4-4.8.6 =3D> qt4-4.8.7}/g++.conf          |   0
>  .../qt4/{qt4-4.8.6 =3D> qt4-4.8.7}/linux.conf        |   0
>  .../recipes-qt/qt4/{qt4-4.8.6 =3D> qt4-4.8.7}/qte.sh |   0
>  meta/recipes-qt/qt4/qt4-embedded.inc               |   1 -
>  ...qt4-embedded_4.8.6.bb =3D> qt4-embedded_4.8.7.bb} |   0
>  meta/recipes-qt/qt4/qt4-native.inc                 |   6 -
>  meta/recipes-qt/qt4/qt4-native_4.8.6.bb            |   6 -
>  meta/recipes-qt/qt4/qt4-native_4.8.7.bb            |   6 +
>  meta/recipes-qt/qt4/qt4-x11-free.inc               |   2 -
>  ...qt4-x11-free_4.8.6.bb =3D> qt4-x11-free_4.8.7.bb} |   0
>  43 files changed, 35 insertions(+), 773 deletions(-)
>  rename meta/recipes-qt/qt4/{nativesdk-qt4-tools_4.8.6.bb =3D>
> nativesdk-qt4-tools_4.8.7.bb} (44%)
>  delete mode 100644
> meta/recipes-qt/qt4/qt4-4.8.6/0029-aarch64_arm64_fix_arch_detection.patch
>  delete mode 100644
> meta/recipes-qt/qt4/qt4-4.8.6/0030-aarch64_arm64_qatomic_support.patch
>  delete mode 100644
> meta/recipes-qt/qt4/qt4-4.8.6/0031-aarch64_arm64_mkspecs.patch
>  delete mode 100644
> meta/recipes-qt/qt4/qt4-4.8.6/0032-aarch64_add_header.patch
>  delete mode 100644
> meta/recipes-qt/qt4/qt4-4.8.6/0034-Fix-a-division-by-zero-when-processing=
-malformed-BMP.patch
>  rename meta/recipes-qt/qt4/{qt4-4.8.6.inc =3D> qt4-4.8.7.inc} (87%)
>  rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D>
> qt4-4.8.7}/0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patc=
h
> (100%)
>  rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D>
> qt4-4.8.7}/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch (100%=
)
>  rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D>
> qt4-4.8.7}/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch (100%)
>  rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D>
> qt4-4.8.7}/0004-configure-qmake-is-already-built-in-qt4-tools-native.patc=
h
> (100%)
>  rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D>
> qt4-4.8.7}/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch
> (100%)
>  rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D>
> qt4-4.8.7}/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patc=
h
> (100%)
>  rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D>
> qt4-4.8.7}/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patc=
h
> (100%)
>  rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D>
> qt4-4.8.7}/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patc=
h
> (100%)
>  rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D>
> qt4-4.8.7}/0009-qmake-fix-source-file-references-in-qmake.pri.patch (100%=
)
>  rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D>
> qt4-4.8.7}/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patc=
h
> (65%)
>  rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D>
> qt4-4.8.7}/0011-freetype-host-includes.patch (100%)
>  rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D>
> qt4-4.8.7}/0012-Add-2bpp-support.patch (100%)
>  rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D>
> qt4-4.8.7}/0013-configure-add-crossarch-option.patch (76%)
>  rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D>
> qt4-4.8.7}/0014-translations-fix-phony-translation-linking-error.patch
> (100%)
>  rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D>
> qt4-4.8.7}/0015-configure-add-nostrip-for-debug-packages.patch (100%)
>  rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D>
> qt4-4.8.7}/0016-configure-eval-QMAKE_CXX.patch (100%)
>  rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D>
> qt4-4.8.7}/0017-configure-ensure-we-identify-the-compiler-as-g-in-co.patc=
h
> (100%)
>  rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D>
> qt4-4.8.7}/0018-configure-make-pulseaudio-a-configurable-option.patch (10=
0%)
>  rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D>
> qt4-4.8.7}/0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch (100%)
>  rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D>
> qt4-4.8.7}/0021-configure-make-qt4-native-work-with-long-building-pa.patc=
h
> (100%)
>  rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D>
> qt4-4.8.7}/0027-tools.pro-disable-qmeegographicssystemhelper.patch (100%)
>  rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D>
> qt4-4.8.7}/0028-Don-t-crash-on-broken-GIF-images.patch (100%)
>  rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D>
> qt4-4.8.7}/0033-configure-support-c-0x-standard-for-directfd.patch (100%)
>  rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D>
> qt4-4.8.7}/Fix-QWSLock-invalid-argument-logs.patch (100%)
>  rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D>
> qt4-4.8.7}/add_check_for_aarch64_32.patch (100%)
>  rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D> qt4-4.8.7}/g++.conf (100%)
>  rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D> qt4-4.8.7}/linux.conf (100%)
>  rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D> qt4-4.8.7}/qte.sh (100%)
>  rename meta/recipes-qt/qt4/{qt4-embedded_4.8.6.bb =3D>
> qt4-embedded_4.8.7.bb} (100%)
>  delete mode 100644 meta/recipes-qt/qt4/qt4-native_4.8.6.bb
>  create mode 100644 meta/recipes-qt/qt4/qt4-native_4.8.7.bb
>  rename meta/recipes-qt/qt4/{qt4-x11-free_4.8.6.bb =3D>
> qt4-x11-free_4.8.7.bb} (100%)
>
> diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
> b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
> index 1c9ee2e..aa84e3d 100644
> --- a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
> +++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
> @@ -4,8 +4,6 @@ SECTION =3D "libs"
>  HOMEPAGE =3D "http://qt-project.org/"
>  LICENSE =3D "LGPLv2.1 | GPLv3"
>
> -INC_PR =3D "r13"
> -
>  FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/qt4-${PV}:"
>
>  inherit nativesdk qmake2
> diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.6.bb
> b/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.7.bb
> similarity index 44%
> rename from meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.6.bb
> rename to meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.7.bb
> index 00526b8..90ba07c 100644
> --- a/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.6.bb
> +++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.7.bb
> @@ -2,5 +2,5 @@ require nativesdk-qt4-tools.inc
>
>  SRC_URI +=3D
> "file://0009-qmake-fix-source-file-references-in-qmake.pri.patch"
>
> -SRC_URI[md5sum] =3D "2edbe4d6c2eff33ef91732602f3518eb"
> -SRC_URI[sha256sum] =3D
> "8b14dd91b52862e09b8e6a963507b74bc2580787d171feda197badfa7034032c"
> +SRC_URI[md5sum] =3D "d990ee66bf7ab0c785589776f35ba6ad"
> +SRC_URI[sha256sum] =3D
> "e2882295097e47fe089f8ac741a95fef47e0a73a3f3cdf21b56990638f626ea0"
> diff --git
> a/meta/recipes-qt/qt4/qt4-4.8.6/0029-aarch64_arm64_fix_arch_detection.pat=
ch
> b/meta/recipes-qt/qt4/qt4-4.8.6/0029-aarch64_arm64_fix_arch_detection.pat=
ch
> deleted file mode 100644
> index fbd32b1..0000000
> ---
> a/meta/recipes-qt/qt4/qt4-4.8.6/0029-aarch64_arm64_fix_arch_detection.pat=
ch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -From 800abbba658203fc8e746e3fc780a297cd4110cf Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Lisandro=3D20Dami=3DC3=3DA1n=3D20Nicanor=3D20P=3DC3=3D=
A9rez=3D20Meyer?=3D
> - <perezmeyer@gmail.com>
> -Date: Wed, 20 Aug 2014 17:52:49 -0300
> -Subject: [PATCH] Fix AArch64/arm64 detection.
> -
> -The detection needs to go before arm, else the system will detect
> AArch64/arm64
> -as arm.
> -
> -This patch comes from Wookey, he has agreed to put it under BSD or Expat
> -to allow it's inclusion in here:
> -<https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D735488#255>
> -
> -Change-Id: Ic2171c03fca8bb871347940fa3a2bc467776f797
> -
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> - configure | 12 ++++++------
> - 1 file changed, 6 insertions(+), 6 deletions(-)
> -
> -diff --git a/configure b/configure
> -index a9ba7c8..eb88b72 100755
> ---- a/configure
> -+++ b/configure
> -@@ -3241,17 +3241,17 @@ if [ -z "${CFG_HOST_ARCH}" ]; then
> -       fi
> -       CFG_HOST_ARCH=3Ds390
> -       ;;
> --    *:*:arm*)
> -+    *:*:aarch64*|*:*:arm64*)
> -         if [ "$OPT_VERBOSE" =3D "yes" ]; then
> --            echo "    ARM (arm)"
> -+            echo "    AArch64 (aarch64)"
> -         fi
> --        CFG_HOST_ARCH=3Darm
> -+        CFG_HOST_ARCH=3Daarch64
> -         ;;
> --    *:*:aarch64*)
> -+    *:*:arm*)
> -         if [ "$OPT_VERBOSE" =3D "yes" ]; then
> --            echo "    AArch64 (aarch64)"
> -+            echo "    ARM (arm)"
> -         fi
> --        CFG_HOST_ARCH=3Daarch64
> -+        CFG_HOST_ARCH=3Darm
> -         ;;
> -     Linux:*:sparc*)
> -         if [ "$OPT_VERBOSE" =3D "yes" ]; then
> ---
> -2.1.0
> diff --git
> a/meta/recipes-qt/qt4/qt4-4.8.6/0030-aarch64_arm64_qatomic_support.patch
> b/meta/recipes-qt/qt4/qt4-4.8.6/0030-aarch64_arm64_qatomic_support.patch
> deleted file mode 100644
> index ba4c2a6..0000000
> ---
> a/meta/recipes-qt/qt4/qt4-4.8.6/0030-aarch64_arm64_qatomic_support.patch
> +++ /dev/null
> @@ -1,491 +0,0 @@
> -From 294010b562c9846bb2bc4ee9c63ff78adc7c1f4f Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Lisandro=3D20Dami=3DC3=3DA1n=3D20Nicanor=3D20P=3DC3=3D=
A9rez=3D20Meyer?=3D
> - <perezmeyer@gmail.com>
> -Date: Sat, 15 Mar 2014 15:40:49 -0300
> -Subject: [PATCH] Add qatomic support for AArch64 (aka arm64).
> -
> -Patch by Mark Salter <msalter@redhat.com>
> -licensed under BSD:
> -
> -<https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D735488#195>
> -
> -This patch is known to not be the most correct way
> -to implement them, as it seems to be possible to do it in a faster way,
> -but should work non the less until we can provide something better.
> -
> -Change-Id: Ib392b27dc54691fd4c2ea9896240ad71fb8128cc
> -
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> -
> ----
> - src/corelib/arch/aarch64/arch.pri            |   4 +
> - src/corelib/arch/aarch64/qatomic_aarch64.cpp |  70 ++++++
> - src/corelib/arch/arch.pri                    |   4 +-
> - src/corelib/arch/qatomic_aarch64.h           | 335
> +++++++++++++++++++++++++++
> - src/corelib/arch/qatomic_arch.h              |   2 +
> - 5 files changed, 414 insertions(+), 1 deletion(-)
> - create mode 100644 src/corelib/arch/aarch64/arch.pri
> - create mode 100644 src/corelib/arch/aarch64/qatomic_aarch64.cpp
> - create mode 100644 src/corelib/arch/qatomic_aarch64.h
> -
> -diff --git a/src/corelib/arch/aarch64/arch.pri
> b/src/corelib/arch/aarch64/arch.pri
> -new file mode 100644
> -index 0000000..63523d9
> ---- /dev/null
> -+++ b/src/corelib/arch/aarch64/arch.pri
> -@@ -0,0 +1,4 @@
> -+#
> -+# AArch64 architecture
> -+#
> -+SOURCES +=3D $$QT_ARCH_CPP/qatomic_aarch64.cpp
> -diff --git a/src/corelib/arch/aarch64/qatomic_aarch64.cpp
> b/src/corelib/arch/aarch64/qatomic_aarch64.cpp
> -new file mode 100644
> -index 0000000..fc851b9
> ---- /dev/null
> -+++ b/src/corelib/arch/aarch64/qatomic_aarch64.cpp
> -@@ -0,0 +1,70 @@
>
> -+/**********************************************************************=
******
> -+**
> -+** Copyright (C) 2012, 2013 Digia Plc and/or its subsidiary(-ies).
> -+** Contact: http://www.qt-project.org/legal
> -+**
> -+** This file is part of the QtCore module of the Qt Toolkit.
> -+**
> -+** $QT_BEGIN_LICENSE:LGPL$
> -+** Commercial License Usage
> -+** Licensees holding valid commercial Qt licenses may use this file in
> -+** accordance with the commercial license agreement provided with the
> -+** Software or, alternatively, in accordance with the terms contained i=
n
> -+** a written agreement between you and Digia.  For licensing terms and
> -+** conditions see http://qt.digia.com/licensing.  For further
> information
> -+** use the contact form at http://qt.digia.com/contact-us.
> -+**
> -+** GNU Lesser General Public License Usage
> -+** Alternatively, this file may be used under the terms of the GNU Less=
er
> -+** General Public License version 2.1 as published by the Free Software
> -+** Foundation and appearing in the file LICENSE.LGPL included in the
> -+** packaging of this file.  Please review the following information to
> -+** ensure the GNU Lesser General Public License version 2.1 requirement=
s
> -+** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
> -+**
> -+** In addition, as a special exception, Digia gives you certain
> additional
> -+** rights.  These rights are described in the Digia Qt LGPL Exception
> -+** version 1.1, included in the file LGPL_EXCEPTION.txt in this package=
.
> -+**
> -+** GNU General Public License Usage
> -+** Alternatively, this file may be used under the terms of the GNU
> -+** General Public License version 3.0 as published by the Free Software
> -+** Foundation and appearing in the file LICENSE.GPL included in the
> -+** packaging of this file.  Please review the following information to
> -+** ensure the GNU General Public License version 3.0 requirements will =
be
> -+** met: http://www.gnu.org/copyleft/gpl.html.
> -+**
> -+**
> -+** $QT_END_LICENSE$
> -+**
>
> -+***********************************************************************=
*****/
> -+
> -+#include <QtCore/qglobal.h>
> -+
> -+#include <unistd.h>
> -+#ifdef _POSIX_PRIORITY_SCHEDULING
> -+# include <sched.h>
> -+#endif
> -+#include <time.h>
> -+
> -+QT_BEGIN_NAMESPACE
> -+
> -+QT_USE_NAMESPACE
> -+
> -+Q_CORE_EXPORT void qt_atomic_yield(int *count)
> -+{
> -+#ifdef _POSIX_PRIORITY_SCHEDULING
> -+    if ((*count)++ < 50) {
> -+        sched_yield();
> -+    } else
> -+#endif
> -+    {
> -+        struct timespec tm;
> -+        tm.tv_sec =3D 0;
> -+        tm.tv_nsec =3D 2000001;
> -+        nanosleep(&tm, NULL);
> -+        *count =3D 0;
> -+    }
> -+}
> -+
> -+QT_END_NAMESPACE
> -diff --git a/src/corelib/arch/arch.pri b/src/corelib/arch/arch.pri
> -index cd23e5e..f50fca7 100644
> ---- a/src/corelib/arch/arch.pri
> -+++ b/src/corelib/arch/arch.pri
> -@@ -31,7 +31,9 @@ integrity:HEADERS +=3D arch/qatomic_integrity.h
> -                        arch/qatomic_s390.h \
> -                        arch/qatomic_x86_64.h \
> -                        arch/qatomic_sh.h \
> --                       arch/qatomic_sh4a.h
> -+                       arch/qatomic_sh4a.h \
> -+                       arch/qatomic_aarch64.h \
> -+
> -
> - QT_ARCH_CPP =3D $$QT_SOURCE_TREE/src/corelib/arch/$$QT_ARCH
> - DEPENDPATH +=3D $$QT_ARCH_CPP
> -diff --git a/src/corelib/arch/qatomic_aarch64.h
> b/src/corelib/arch/qatomic_aarch64.h
> -new file mode 100644
> -index 0000000..de61ca8
> ---- /dev/null
> -+++ b/src/corelib/arch/qatomic_aarch64.h
> -@@ -0,0 +1,335 @@
>
> -+/**********************************************************************=
******
> -+**
> -+** Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
> -+** Contact: http://www.qt-project.org/legal
> -+**
> -+** This file is part of the QtCore module of the Qt Toolkit.
> -+**
> -+** $QT_BEGIN_LICENSE:LGPL$
> -+** Commercial License Usage
> -+** Licensees holding valid commercial Qt licenses may use this file in
> -+** accordance with the commercial license agreement provided with the
> -+** Software or, alternatively, in accordance with the terms contained i=
n
> -+** a written agreement between you and Digia.  For licensing terms and
> -+** conditions see http://qt.digia.com/licensing.  For further
> information
> -+** use the contact form at http://qt.digia.com/contact-us.
> -+**
> -+** GNU Lesser General Public License Usage
> -+** Alternatively, this file may be used under the terms of the GNU Less=
er
> -+** General Public License version 2.1 as published by the Free Software
> -+** Foundation and appearing in the file LICENSE.LGPL included in the
> -+** packaging of this file.  Please review the following information to
> -+** ensure the GNU Lesser General Public License version 2.1 requirement=
s
> -+** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
> -+**
> -+** In addition, as a special exception, Digia gives you certain
> additional
> -+** rights.  These rights are described in the Digia Qt LGPL Exception
> -+** version 1.1, included in the file LGPL_EXCEPTION.txt in this package=
.
> -+**
> -+** GNU General Public License Usage
> -+** Alternatively, this file may be used under the terms of the GNU
> -+** General Public License version 3.0 as published by the Free Software
> -+** Foundation and appearing in the file LICENSE.GPL included in the
> -+** packaging of this file.  Please review the following information to
> -+** ensure the GNU General Public License version 3.0 requirements will =
be
> -+** met: http://www.gnu.org/copyleft/gpl.html.
> -+**
> -+**
> -+** $QT_END_LICENSE$
> -+**
>
> -+***********************************************************************=
*****/
> -+
> -+#ifndef QATOMIC_AARCH64_H
> -+#define QATOMIC_AARCH64_H
> -+
> -+QT_BEGIN_HEADER
> -+
> -+QT_BEGIN_NAMESPACE
> -+
> -+#define Q_ATOMIC_INT_REFERENCE_COUNTING_IS_ALWAYS_NATIVE
> -+
> -+inline bool QBasicAtomicInt::isReferenceCountingNative()
> -+{ return true; }
> -+inline bool QBasicAtomicInt::isReferenceCountingWaitFree()
> -+{ return false; }
> -+
> -+#define Q_ATOMIC_INT_TEST_AND_SET_IS_ALWAYS_NATIVE
> -+
> -+inline bool QBasicAtomicInt::isTestAndSetNative()
> -+{ return true; }
> -+inline bool QBasicAtomicInt::isTestAndSetWaitFree()
> -+{ return false; }
> -+
> -+#define Q_ATOMIC_INT_FETCH_AND_STORE_IS_ALWAYS_NATIVE
> -+
> -+inline bool QBasicAtomicInt::isFetchAndStoreNative()
> -+{ return true; }
> -+inline bool QBasicAtomicInt::isFetchAndStoreWaitFree()
> -+{ return false; }
> -+
> -+#define Q_ATOMIC_INT_FETCH_AND_ADD_IS_ALWAYS_NATIVE
> -+
> -+inline bool QBasicAtomicInt::isFetchAndAddNative()
> -+{ return true; }
> -+inline bool QBasicAtomicInt::isFetchAndAddWaitFree()
> -+{ return false; }
> -+
> -+#define Q_ATOMIC_POINTER_TEST_AND_SET_IS_ALWAYS_NATIVE
> -+
> -+template <typename T>
> -+Q_INLINE_TEMPLATE bool QBasicAtomicPointer<T>::isTestAndSetNative()
> -+{ return true; }
> -+template <typename T>
> -+Q_INLINE_TEMPLATE bool QBasicAtomicPointer<T>::isTestAndSetWaitFree()
> -+{ return false; }
> -+
> -+#define Q_ATOMIC_POINTER_FETCH_AND_STORE_IS_ALWAYS_NATIVE
> -+
> -+template <typename T>
> -+Q_INLINE_TEMPLATE bool QBasicAtomicPointer<T>::isFetchAndStoreNative()
> -+{ return true; }
> -+template <typename T>
> -+Q_INLINE_TEMPLATE bool QBasicAtomicPointer<T>::isFetchAndStoreWaitFree(=
)
> -+{ return false; }
> -+
> -+#define Q_ATOMIC_POINTER_FETCH_AND_ADD_IS_ALWAYS_NATIVE
> -+
> -+template <typename T>
> -+Q_INLINE_TEMPLATE bool QBasicAtomicPointer<T>::isFetchAndAddNative()
> -+{ return true; }
> -+template <typename T>
> -+Q_INLINE_TEMPLATE bool QBasicAtomicPointer<T>::isFetchAndAddWaitFree()
> -+{ return false; }
> -+
> -+#ifndef Q_DATA_MEMORY_BARRIER
> -+# define Q_DATA_MEMORY_BARRIER asm volatile("dmb sy\n":::"memory")
> -+#endif
> -+#ifndef Q_COMPILER_MEMORY_BARRIER
> -+# define Q_COMPILER_MEMORY_BARRIER asm volatile("":::"memory")
> -+#endif
> -+
> -+inline bool QBasicAtomicInt::ref()
> -+{
> -+    int newValue;
> -+
> -+    Q_COMPILER_MEMORY_BARRIER;
> -+    newValue =3D __atomic_add_fetch(&_q_value, 1, __ATOMIC_ACQ_REL);
> -+    Q_COMPILER_MEMORY_BARRIER;
> -+
> -+    return newValue !=3D 0;
> -+}
> -+
> -+inline bool QBasicAtomicInt::deref()
> -+{
> -+    int newValue;
> -+
> -+    Q_COMPILER_MEMORY_BARRIER;
> -+    newValue =3D __atomic_sub_fetch(&_q_value, 1, __ATOMIC_ACQ_REL);
> -+    Q_COMPILER_MEMORY_BARRIER;
> -+
> -+    return newValue !=3D 0;
> -+}
> -+
> -+inline bool QBasicAtomicInt::testAndSetRelaxed(int expectedValue, int
> newValue)
> -+{
> -+    bool val;
> -+
> -+    Q_COMPILER_MEMORY_BARRIER;
> -+    val =3D  __atomic_compare_exchange_n (&_q_value, &expectedValue,
> newValue,
> -+                                        false, __ATOMIC_RELAXED,
> __ATOMIC_RELAXED);
> -+    Q_COMPILER_MEMORY_BARRIER;
> -+    return val;
> -+}
> -+
> -+inline int QBasicAtomicInt::fetchAndStoreRelaxed(int newValue)
> -+{
> -+    int val;
> -+    Q_COMPILER_MEMORY_BARRIER;
> -+    val =3D __atomic_exchange_n(&_q_value, newValue, __ATOMIC_RELAXED);
> -+    Q_COMPILER_MEMORY_BARRIER;
> -+    return val;
> -+}
> -+
> -+inline int QBasicAtomicInt::fetchAndAddRelaxed(int valueToAdd)
> -+{
> -+    int val;
> -+    Q_COMPILER_MEMORY_BARRIER;
> -+    val =3D __atomic_fetch_add(&_q_value, valueToAdd, __ATOMIC_RELAXED)=
;
> -+    Q_COMPILER_MEMORY_BARRIER;
> -+    return val;
> -+}
> -+
> -+template <typename T>
> -+Q_INLINE_TEMPLATE bool QBasicAtomicPointer<T>::testAndSetRelaxed(T
> *expectedValue, T *newValue)
> -+{
> -+    bool val;
> -+    Q_COMPILER_MEMORY_BARRIER;
> -+    val =3D  __atomic_compare_exchange_n (&_q_value, &expectedValue,
> newValue,
> -+                                        false, __ATOMIC_RELAXED,
> __ATOMIC_RELAXED);
> -+    Q_COMPILER_MEMORY_BARRIER;
> -+    return val;
> -+}
> -+
> -+template <typename T>
> -+Q_INLINE_TEMPLATE T *QBasicAtomicPointer<T>::fetchAndStoreRelaxed(T
> *newValue)
> -+{
> -+    T *val;
> -+    Q_COMPILER_MEMORY_BARRIER;
> -+    val =3D __atomic_exchange_n(&_q_value, newValue, __ATOMIC_RELAXED);
> -+    Q_COMPILER_MEMORY_BARRIER;
> -+    return val;
> -+}
> -+
> -+template <typename T>
> -+Q_INLINE_TEMPLATE T *QBasicAtomicPointer<T>::fetchAndAddRelaxed(qptrdif=
f
> valueToAdd)
> -+{
> -+    T *val;
> -+    Q_COMPILER_MEMORY_BARRIER;
> -+    val =3D __atomic_fetch_add(&_q_value, valueToAdd, __ATOMIC_RELAXED)=
;
> -+    Q_COMPILER_MEMORY_BARRIER;
> -+    return val;
> -+}
> -+
> -+inline bool QBasicAtomicInt::testAndSetAcquire(int expectedValue, int
> newValue)
> -+{
> -+    bool returnValue =3D testAndSetRelaxed(expectedValue, newValue);
> -+    Q_DATA_MEMORY_BARRIER;
> -+    return returnValue;
> -+}
> -+
> -+inline bool QBasicAtomicInt::testAndSetRelease(int expectedValue, int
> newValue)
> -+{
> -+    Q_DATA_MEMORY_BARRIER;
> -+    return testAndSetRelaxed(expectedValue, newValue);
> -+}
> -+
> -+inline bool QBasicAtomicInt::testAndSetOrdered(int expectedValue, int
> newValue)
> -+{
> -+    Q_DATA_MEMORY_BARRIER;
> -+    bool returnValue =3D testAndSetRelaxed(expectedValue, newValue);
> -+    Q_COMPILER_MEMORY_BARRIER;
> -+    return returnValue;
> -+}
> -+
> -+inline int QBasicAtomicInt::fetchAndStoreAcquire(int newValue)
> -+{
> -+    int returnValue =3D fetchAndStoreRelaxed(newValue);
> -+    Q_DATA_MEMORY_BARRIER;
> -+    return returnValue;
> -+}
> -+
> -+inline int QBasicAtomicInt::fetchAndStoreRelease(int newValue)
> -+{
> -+    Q_DATA_MEMORY_BARRIER;
> -+    return fetchAndStoreRelaxed(newValue);
> -+}
> -+
> -+inline int QBasicAtomicInt::fetchAndStoreOrdered(int newValue)
> -+{
> -+    Q_DATA_MEMORY_BARRIER;
> -+    int returnValue =3D fetchAndStoreRelaxed(newValue);
> -+    Q_COMPILER_MEMORY_BARRIER;
> -+    return returnValue;
> -+}
> -+
> -+inline int QBasicAtomicInt::fetchAndAddAcquire(int valueToAdd)
> -+{
> -+    int returnValue =3D fetchAndAddRelaxed(valueToAdd);
> -+    Q_DATA_MEMORY_BARRIER;
> -+    return returnValue;
> -+}
> -+
> -+inline int QBasicAtomicInt::fetchAndAddRelease(int valueToAdd)
> -+{
> -+    Q_DATA_MEMORY_BARRIER;
> -+    return fetchAndAddRelaxed(valueToAdd);
> -+}
> -+
> -+inline int QBasicAtomicInt::fetchAndAddOrdered(int valueToAdd)
> -+{
> -+    Q_DATA_MEMORY_BARRIER;
> -+    int returnValue =3D fetchAndAddRelaxed(valueToAdd);
> -+    Q_COMPILER_MEMORY_BARRIER;
> -+    return returnValue;
> -+}
> -+
> -+template <typename T>
> -+Q_INLINE_TEMPLATE bool QBasicAtomicPointer<T>::testAndSetAcquire(T
> *expectedValue, T *newValue)
> -+{
> -+    bool returnValue =3D testAndSetRelaxed(expectedValue, newValue);
> -+    Q_DATA_MEMORY_BARRIER;
> -+    return returnValue;
> -+}
> -+
> -+template <typename T>
> -+Q_INLINE_TEMPLATE bool QBasicAtomicPointer<T>::testAndSetRelease(T
> *expectedValue, T *newValue)
> -+{
> -+    Q_DATA_MEMORY_BARRIER;
> -+    return testAndSetRelaxed(expectedValue, newValue);
> -+}
> -+
> -+template <typename T>
> -+Q_INLINE_TEMPLATE bool QBasicAtomicPointer<T>::testAndSetOrdered(T
> *expectedValue, T *newValue)
> -+{
> -+    Q_DATA_MEMORY_BARRIER;
> -+    bool returnValue =3D testAndSetAcquire(expectedValue, newValue);
> -+    Q_COMPILER_MEMORY_BARRIER;
> -+    return returnValue;
> -+}
> -+
> -+template <typename T>
> -+Q_INLINE_TEMPLATE T *QBasicAtomicPointer<T>::fetchAndStoreAcquire(T
> *newValue)
> -+{
> -+    T *returnValue =3D fetchAndStoreRelaxed(newValue);
> -+    Q_DATA_MEMORY_BARRIER;
> -+    return returnValue;
> -+}
> -+
> -+template <typename T>
> -+Q_INLINE_TEMPLATE T *QBasicAtomicPointer<T>::fetchAndStoreRelease(T
> *newValue)
> -+{
> -+    Q_DATA_MEMORY_BARRIER;
> -+    return fetchAndStoreRelaxed(newValue);
> -+}
> -+
> -+template <typename T>
> -+Q_INLINE_TEMPLATE T *QBasicAtomicPointer<T>::fetchAndStoreOrdered(T
> *newValue)
> -+{
> -+    Q_DATA_MEMORY_BARRIER;
> -+    T *returnValue =3D fetchAndStoreRelaxed(newValue);
> -+    Q_COMPILER_MEMORY_BARRIER;
> -+    return returnValue;
> -+}
> -+
> -+template <typename T>
> -+Q_INLINE_TEMPLATE T *QBasicAtomicPointer<T>::fetchAndAddAcquire(qptrdif=
f
> valueToAdd)
> -+{
> -+    T *returnValue =3D fetchAndAddRelaxed(valueToAdd);
> -+    Q_DATA_MEMORY_BARRIER;
> -+    return returnValue;
> -+}
> -+
> -+template <typename T>
> -+Q_INLINE_TEMPLATE T *QBasicAtomicPointer<T>::fetchAndAddRelease(qptrdif=
f
> valueToAdd)
> -+{
> -+    Q_DATA_MEMORY_BARRIER;
> -+    return fetchAndAddRelaxed(valueToAdd);
> -+}
> -+
> -+template <typename T>
> -+Q_INLINE_TEMPLATE T *QBasicAtomicPointer<T>::fetchAndAddOrdered(qptrdif=
f
> valueToAdd)
> -+{
> -+    Q_DATA_MEMORY_BARRIER;
> -+    T *returnValue =3D fetchAndAddRelaxed(valueToAdd);
> -+    Q_COMPILER_MEMORY_BARRIER;
> -+    return returnValue;
> -+}
> -+
> -+#undef Q_DATA_MEMORY_BARRIER
> -+#undef Q_COMPILER_MEMORY_BARRIER
> -+
> -+QT_END_NAMESPACE
> -+
> -+QT_END_HEADER
> -+
> -+#endif // QATOMIC_AARCH64_H
> -diff --git a/src/corelib/arch/qatomic_arch.h
> b/src/corelib/arch/qatomic_arch.h
> -index 141726c..3e96926 100644
> ---- a/src/corelib/arch/qatomic_arch.h
> -+++ b/src/corelib/arch/qatomic_arch.h
> -@@ -94,6 +94,8 @@ QT_BEGIN_HEADER
> - #  include "QtCore/qatomic_sh4a.h"
> - #elif defined(QT_ARCH_NACL)
> - #  include "QtCore/qatomic_generic.h"
> -+#elif defined(QT_ARCH_AARCH64)
> -+#  include "QtCore/qatomic_aarch64.h"
> - #else
> - #  error "Qt has not been ported to this architecture"
> - #endif
> ---
> -2.1.0
> -
> diff --git
> a/meta/recipes-qt/qt4/qt4-4.8.6/0031-aarch64_arm64_mkspecs.patch
> b/meta/recipes-qt/qt4/qt4-4.8.6/0031-aarch64_arm64_mkspecs.patch
> deleted file mode 100644
> index a01e7ad..0000000
> --- a/meta/recipes-qt/qt4/qt4-4.8.6/0031-aarch64_arm64_mkspecs.patch
> +++ /dev/null
> @@ -1,124 +0,0 @@
> -From 7090fc80ff630712a90de92403190f647dd38a39 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Lisandro=3D20Dami=3DC3=3DA1n=3D20Nicanor=3D20P=3DC3=3D=
A9rez=3D20Meyer?=3D
> - <perezmeyer@gmail.com>
> -Date: Sat, 15 Mar 2014 15:35:00 -0300
> -Subject: [PATCH] mkspecs for AArch64 (aka arm64).
> -
> -Patch by Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> -licensed under either Public Domain or BSD:
> -
> -<https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D735488#179>
> -
> -Change-Id: I21f17953234cfb176bac023e52ecdc927fc5c1a9
> -
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> -
> ----
> - configure                                 |  3 +++
> - mkspecs/linux-g++-aarch64/qmake.conf      | 27 ++++++++++++++++++++
> - mkspecs/linux-g++-aarch64/qplatformdefs.h | 42
> +++++++++++++++++++++++++++++++
> - 3 files changed, 72 insertions(+)
> - create mode 100644 mkspecs/linux-g++-aarch64/qmake.conf
> - create mode 100644 mkspecs/linux-g++-aarch64/qplatformdefs.h
> -
> -diff --git a/configure b/configure
> -index a9ba7c8..e57d053 100755
> ---- a/configure
> -+++ b/configure
> -@@ -2808,6 +2808,9 @@ if [ "$CFG_EMBEDDED" !=3D "no" ]; then
> -             *86_64)
> -                 PLATFORM=3Dqws/linux-x86_64-g++
> -                 ;;
> -+            aarch64)
> -+                PLATFORM=3Dlinux-aarch64-g++
> -+                ;;
> -             *)
> -                 PLATFORM=3Dqws/linux-generic-g++
> -                 ;;
> -diff --git a/mkspecs/linux-g++-aarch64/qmake.conf
> b/mkspecs/linux-g++-aarch64/qmake.conf
> -new file mode 100644
> -index 0000000..ebc0a92
> ---- /dev/null
> -+++ b/mkspecs/linux-g++-aarch64/qmake.conf
> -@@ -0,0 +1,27 @@
> -+#
> -+# qmake configuration for linux-g++
> -+#
> -+# Written for GNU/Linux platforms that have both lib and lib64
> directories,
> -+# like the AMD Opteron.
> -+#
> -+
> -+MAKEFILE_GENERATOR    =3D UNIX
> -+TARGET_PLATFORM       =3D unix
> -+TEMPLATE              =3D app
> -+CONFIG               +=3D qt warn_on release incremental link_prl
> gdb_dwarf_index
> -+QT                   +=3D core gui
> -+QMAKE_INCREMENTAL_STYLE =3D sublib
> -+
> -+QMAKE_CFLAGS     =3D
> -+QMAKE_LFLAGS     =3D
> -+
> -+QMAKE_CFLAGS_RELEASE   +=3D -O2
> -+
> -+include(../common/linux.conf)
> -+include(../common/gcc-base-unix.conf)
> -+include(../common/g++-unix.conf)
> -+
> -+QMAKE_LIBDIR_X11      =3D /usr/X11R6/lib64
> -+QMAKE_LIBDIR_OPENGL   =3D /usr/X11R6/lib64
> -+
> -+load(qt_config)
> -diff --git a/mkspecs/linux-g++-aarch64/qplatformdefs.h
> b/mkspecs/linux-g++-aarch64/qplatformdefs.h
> -new file mode 100644
> -index 0000000..562128b
> ---- /dev/null
> -+++ b/mkspecs/linux-g++-aarch64/qplatformdefs.h
> -@@ -0,0 +1,42 @@
>
> -+/**********************************************************************=
******
> -+**
> -+** Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
> -+** Contact: http://www.qt-project.org/legal
> -+**
> -+** This file is part of the qmake spec of the Qt Toolkit.
> -+**
> -+** $QT_BEGIN_LICENSE:LGPL$
> -+** Commercial License Usage
> -+** Licensees holding valid commercial Qt licenses may use this file in
> -+** accordance with the commercial license agreement provided with the
> -+** Software or, alternatively, in accordance with the terms contained i=
n
> -+** a written agreement between you and Digia.  For licensing terms and
> -+** conditions see http://qt.digia.com/licensing.  For further
> information
> -+** use the contact form at http://qt.digia.com/contact-us.
> -+**
> -+** GNU Lesser General Public License Usage
> -+** Alternatively, this file may be used under the terms of the GNU Less=
er
> -+** General Public License version 2.1 as published by the Free Software
> -+** Foundation and appearing in the file LICENSE.LGPL included in the
> -+** packaging of this file.  Please review the following information to
> -+** ensure the GNU Lesser General Public License version 2.1 requirement=
s
> -+** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
> -+**
> -+** In addition, as a special exception, Digia gives you certain
> additional
> -+** rights.  These rights are described in the Digia Qt LGPL Exception
> -+** version 1.1, included in the file LGPL_EXCEPTION.txt in this package=
.
> -+**
> -+** GNU General Public License Usage
> -+** Alternatively, this file may be used under the terms of the GNU
> -+** General Public License version 3.0 as published by the Free Software
> -+** Foundation and appearing in the file LICENSE.GPL included in the
> -+** packaging of this file.  Please review the following information to
> -+** ensure the GNU General Public License version 3.0 requirements will =
be
> -+** met: http://www.gnu.org/copyleft/gpl.html.
> -+**
> -+**
> -+** $QT_END_LICENSE$
> -+**
>
> -+***********************************************************************=
*****/
> -+
> -+#include "../linux-g++/qplatformdefs.h"
> ---
> -2.1.0
> -
> diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0032-aarch64_add_header.patch
> b/meta/recipes-qt/qt4/qt4-4.8.6/0032-aarch64_add_header.patch
> deleted file mode 100644
> index 7132224..0000000
> --- a/meta/recipes-qt/qt4/qt4-4.8.6/0032-aarch64_add_header.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -Add missing header for aarch64. And install
> ../corelib/arch/qatomic_aarch64.h.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> -diff -Nru
> qt-everywhere-opensource-src-4.8.6.orig/include/QtCore/qatomic_aarch64.h
> qt-everywhere-opensource-src-4.8.6/include/QtCore/qatomic_aarch64.h
> ----
> qt-everywhere-opensource-src-4.8.6.orig/include/QtCore/qatomic_aarch64.h
>  1970-01-01 08:30:00.000000000 +0830
> -+++ qt-everywhere-opensource-src-4.8.6/include/QtCore/qatomic_aarch64.h
>       2014-09-09 17:18:03.768352551 +0800
> -@@ -0,0 +1 @@
> -+#include "../../src/corelib/arch/qatomic_aarch64.h"
> ---- qt-everywhere-opensource-src-4.8.6/include/QtCore/headers.pri.orig
> 2014-09-09 18:05:37.100430311 +0800
> -+++ qt-everywhere-opensource-src-4.8.6/include/QtCore/headers.pri
> 2014-09-09 18:05:59.112430911 +0800
> -@@ -1,3 +1,3 @@
> --SYNCQT.HEADER_FILES =3D ../corelib/statemachine/qabstractstate.h
> ../corelib/statemachine/qabstracttransition.h
> ../corelib/statemachine/qeventtransition.h
> ../corelib/statemachine/qfinalstate.h
> ../corelib/statemachine/qhistorystate.h
> ../corelib/statemachine/qsignaltransition.h
> ../corelib/statemachine/qstate.h ../corelib/statemachine/qstatemachine.h
> ../corelib/arch/qatomic_alpha.h ../corelib/arch/qatomic_arch.h
> ../corelib/arch/qatomic_arm.h ../corelib/arch/qatomic_armv5.h
> ../corelib/arch/qatomic_armv6.h ../corelib/arch/qatomic_armv7.h
> ../corelib/arch/qatomic_avr32.h ../corelib/arch/qatomic_bfin.h
> ../corelib/arch/qatomic_bootstrap.h ../corelib/arch/qatomic_generic.h
> ../corelib/arch/qatomic_i386.h ../corelib/arch/qatomic_ia64.h
> ../corelib/arch/qatomic_integrity.h ../corelib/arch/qatomic_m68k.h
> ../corelib/arch/qatomic_macosx.h ../corelib/arch/qatomic_mips.h
> ../corelib/arch/qatomic_parisc.h ../corelib/arch/qatomic_powerpc.h
> ../corelib/arch/qatomic_s390.h ../corelib/arch/qatomic_sh.h
>   ../corelib/arch/qatomic_sh4a.h ../corelib/arch/qatomic_sparc.h
> ../corelib/arch/qatomic_symbian.h ../corelib/arch/qatomic_vxworks.h
> ../corelib/arch/qatomic_windows.h ../corelib/arch/qatomic_windowsce.h
> ../corelib/arch/qatomic_x86_64.h ../corelib/thread/qatomic.h
> ../corelib/thread/qbasicatomic.h ../corelib/thread/qmutex.h
> ../corelib/thread/qreadwritelock.h ../corelib/thread/qsemaphore.h
> ../corelib/thread/qthread.h ../corelib/thread/qthreadstorage.h
> ../corelib/thread/qwaitcondition.h ../corelib/xml/qxmlstream.h
> ../corelib/concurrent/qfuture.h ../corelib/concurrent/qfutureinterface.h
> ../corelib/concurrent/qfuturesynchronizer.h
> ../corelib/concurrent/qfuturewatcher.h ../corelib/concurrent/qrunnable.h
> ../corelib/concurrent/qtconcurrentcompilertest.h
> ../corelib/concurrent/qtconcurrentexception.h
> ../corelib/concurrent/qtconcurrentfilter.h
> ../corelib/concurrent/qtconcurrentfilterkernel.h
> ../corelib/concurrent/qtconcurrentfunctionwrappers.h
> ../corelib/concurrent/qtconcurrentiterateker
>  nel.h ../corelib/concurrent/qtconcurrentmap.h
> ../corelib/concurrent/qtconcurrentmapkernel.h
> ../corelib/concurrent/qtconcurrentmedian.h
> ../corelib/concurrent/qtconcurrentreducekernel.h
> ../corelib/concurrent/qtconcurrentresultstore.h
> ../corelib/concurrent/qtconcurrentrun.h
> ../corelib/concurrent/qtconcurrentrunbase.h
> ../corelib/concurrent/qtconcurrentstoredfunctioncall.h
> ../corelib/concurrent/qtconcurrentthreadengine.h
> ../corelib/concurrent/qthreadpool.h
> ../corelib/kernel/qabstracteventdispatcher.h
> ../corelib/kernel/qabstractitemmodel.h ../corelib/kernel/qbasictimer.h
> ../corelib/kernel/qcoreapplication.h ../corelib/kernel/qcoreevent.h
> ../corelib/kernel/qeventloop.h ../corelib/kernel/qfunctions_nacl.h
> ../corelib/kernel/qfunctions_vxworks.h ../corelib/kernel/qfunctions_wince=
.h
> ../corelib/kernel/qmath.h ../corelib/kernel/qmetaobject.h
> ../corelib/kernel/qmetatype.h ../corelib/kernel/qmimedata.h
> ../corelib/kernel/qobject.h ../corelib/kernel/qobjectcleanuphandler.h
> ../corelib/kernel/
>  qobjectdefs.h ../corelib/kernel/qpointer.h
> ../corelib/kernel/qsharedmemory.h ../corelib/kernel/qsignalmapper.h
> ../corelib/kernel/qsocketnotifier.h ../corelib/kernel/qsystemsemaphore.h
> ../corelib/kernel/qtimer.h ../corelib/kernel/qtranslator.h
> ../corelib/kernel/qvariant.h ../corelib/plugin/qfactoryinterface.h
> ../corelib/plugin/qlibrary.h ../corelib/plugin/qplugin.h
> ../corelib/plugin/qpluginloader.h ../corelib/plugin/quuid.h
> ../corelib/global/qconfig-dist.h ../corelib/global/qconfig-large.h
> ../corelib/global/qconfig-medium.h ../corelib/global/qconfig-minimal.h
> ../corelib/global/qconfig-nacl.h ../corelib/global/qconfig-small.h
> ../corelib/global/qendian.h ../corelib/global/qfeatures.h
> ../corelib/global/qglobal.h ../corelib/global/qlibraryinfo.h
> ../corelib/global/qnamespace.h ../corelib/global/qnumeric.h
> ../corelib/global/qt_windows.h ../corelib/global/qconfig.h
> ../corelib/codecs/qtextcodec.h ../corelib/codecs/qtextcodecplugin.h
> ../corelib/io/qabstractfileengine.h ../corelib/io/q
>  buffer.h ../corelib/io/qdatastream.h ../corelib/io/qdebug.h
> ../corelib/io/qdir.h ../corelib/io/qdiriterator.h ../corelib/io/qfile.h
> ../corelib/io/qfileinfo.h ../corelib/io/qfilesystemwatcher.h
> ../corelib/io/qfsfileengine.h ../corelib/io/qiodevice.h
> ../corelib/io/qprocess.h ../corelib/io/qresource.h
> ../corelib/io/qsettings.h ../corelib/io/qtemporaryfile.h
> ../corelib/io/qtextstream.h ../corelib/io/qurl.h
> ../corelib/animation/qabstractanimation.h
> ../corelib/animation/qanimationgroup.h
> ../corelib/animation/qparallelanimationgroup.h
> ../corelib/animation/qpauseanimation.h
> ../corelib/animation/qpropertyanimation.h
> ../corelib/animation/qsequentialanimationgroup.h
> ../corelib/animation/qvariantanimation.h ../corelib/tools/qalgorithms.h
> ../corelib/tools/qbitarray.h ../corelib/tools/qbytearray.h
> ../corelib/tools/qbytearraymatcher.h ../corelib/tools/qcache.h
> ../corelib/tools/qchar.h ../corelib/tools/qcontainerfwd.h
> ../corelib/tools/qcontiguouscache.h ../corelib/tools/qcryptographichash.h
>   ../corelib/tools/qdatetime.h ../corelib/tools/qeasingcurve.h
> ../corelib/tools/qelapsedtimer.h ../corelib/tools/qhash.h
> ../corelib/tools/qiterator.h ../corelib/tools/qline.h
> ../corelib/tools/qlinkedlist.h ../corelib/tools/qlist.h
> ../corelib/tools/qlocale.h ../corelib/tools/qlocale_blackberry.h
> ../corelib/tools/qmap.h ../corelib/tools/qmargins.h
> ../corelib/tools/qpair.h ../corelib/tools/qpoint.h
> ../corelib/tools/qqueue.h ../corelib/tools/qrect.h
> ../corelib/tools/qregexp.h ../corelib/tools/qscopedpointer.h
> ../corelib/tools/qscopedvaluerollback.h ../corelib/tools/qset.h
> ../corelib/tools/qshareddata.h ../corelib/tools/qsharedpointer.h
> ../corelib/tools/qsharedpointer_impl.h ../corelib/tools/qsize.h
> ../corelib/tools/qstack.h ../corelib/tools/qstring.h
> ../corelib/tools/qstringbuilder.h ../corelib/tools/qstringlist.h
> ../corelib/tools/qstringmatcher.h ../corelib/tools/qtextboundaryfinder.h
> ../corelib/tools/qtimeline.h ../corelib/tools/qvarlengtharray.h
> ../corelib/tools/qvector.h ../.
>  ./include/QtCore/QtCore
> -+SYNCQT.HEADER_FILES =3D ../corelib/statemachine/qabstractstate.h
> ../corelib/statemachine/qabstracttransition.h
> ../corelib/statemachine/qeventtransition.h
> ../corelib/statemachine/qfinalstate.h
> ../corelib/statemachine/qhistorystate.h
> ../corelib/statemachine/qsignaltransition.h
> ../corelib/statemachine/qstate.h ../corelib/statemachine/qstatemachine.h
> ../corelib/arch/qatomic_alpha.h ../corelib/arch/qatomic_arch.h
> ../corelib/arch/qatomic_arm.h ../corelib/arch/qatomic_armv5.h
> ../corelib/arch/qatomic_armv6.h ../corelib/arch/qatomic_armv7.h
> ../corelib/arch/qatomic_aarch64.h ../corelib/arch/qatomic_avr32.h
> ../corelib/arch/qatomic_bfin.h ../corelib/arch/qatomic_bootstrap.h
> ../corelib/arch/qatomic_generic.h ../corelib/arch/qatomic_i386.h
> ../corelib/arch/qatomic_ia64.h ../corelib/arch/qatomic_integrity.h
> ../corelib/arch/qatomic_m68k.h ../corelib/arch/qatomic_macosx.h
> ../corelib/arch/qatomic_mips.h ../corelib/arch/qatomic_parisc.h
> ../corelib/arch/qatomic_powerpc.h ../corelib/arch/qatomic_s
>  390.h ../corelib/arch/qatomic_sh.h ../corelib/arch/qatomic_sh4a.h
> ../corelib/arch/qatomic_sparc.h ../corelib/arch/qatomic_symbian.h
> ../corelib/arch/qatomic_vxworks.h ../corelib/arch/qatomic_windows.h
> ../corelib/arch/qatomic_windowsce.h ../corelib/arch/qatomic_x86_64.h
> ../corelib/thread/qatomic.h ../corelib/thread/qbasicatomic.h
> ../corelib/thread/qmutex.h ../corelib/thread/qreadwritelock.h
> ../corelib/thread/qsemaphore.h ../corelib/thread/qthread.h
> ../corelib/thread/qthreadstorage.h ../corelib/thread/qwaitcondition.h
> ../corelib/xml/qxmlstream.h ../corelib/concurrent/qfuture.h
> ../corelib/concurrent/qfutureinterface.h
> ../corelib/concurrent/qfuturesynchronizer.h
> ../corelib/concurrent/qfuturewatcher.h ../corelib/concurrent/qrunnable.h
> ../corelib/concurrent/qtconcurrentcompilertest.h
> ../corelib/concurrent/qtconcurrentexception.h
> ../corelib/concurrent/qtconcurrentfilter.h
> ../corelib/concurrent/qtconcurrentfilterkernel.h
> ../corelib/concurrent/qtconcurrentfunctionwrappers.h ../corelib
>  /concurrent/qtconcurrentiteratekernel.h
> ../corelib/concurrent/qtconcurrentmap.h
> ../corelib/concurrent/qtconcurrentmapkernel.h
> ../corelib/concurrent/qtconcurrentmedian.h
> ../corelib/concurrent/qtconcurrentreducekernel.h
> ../corelib/concurrent/qtconcurrentresultstore.h
> ../corelib/concurrent/qtconcurrentrun.h
> ../corelib/concurrent/qtconcurrentrunbase.h
> ../corelib/concurrent/qtconcurrentstoredfunctioncall.h
> ../corelib/concurrent/qtconcurrentthreadengine.h
> ../corelib/concurrent/qthreadpool.h
> ../corelib/kernel/qabstracteventdispatcher.h
> ../corelib/kernel/qabstractitemmodel.h ../corelib/kernel/qbasictimer.h
> ../corelib/kernel/qcoreapplication.h ../corelib/kernel/qcoreevent.h
> ../corelib/kernel/qeventloop.h ../corelib/kernel/qfunctions_nacl.h
> ../corelib/kernel/qfunctions_vxworks.h ../corelib/kernel/qfunctions_wince=
.h
> ../corelib/kernel/qmath.h ../corelib/kernel/qmetaobject.h
> ../corelib/kernel/qmetatype.h ../corelib/kernel/qmimedata.h
> ../corelib/kernel/qobject.h ../corelib/kernel/qobjectc
>  leanuphandler.h ../corelib/kernel/qobjectdefs.h
> ../corelib/kernel/qpointer.h ../corelib/kernel/qsharedmemory.h
> ../corelib/kernel/qsignalmapper.h ../corelib/kernel/qsocketnotifier.h
> ../corelib/kernel/qsystemsemaphore.h ../corelib/kernel/qtimer.h
> ../corelib/kernel/qtranslator.h ../corelib/kernel/qvariant.h
> ../corelib/plugin/qfactoryinterface.h ../corelib/plugin/qlibrary.h
> ../corelib/plugin/qplugin.h ../corelib/plugin/qpluginloader.h
> ../corelib/plugin/quuid.h ../corelib/global/qconfig-dist.h
> ../corelib/global/qconfig-large.h ../corelib/global/qconfig-medium.h
> ../corelib/global/qconfig-minimal.h ../corelib/global/qconfig-nacl.h
> ../corelib/global/qconfig-small.h ../corelib/global/qendian.h
> ../corelib/global/qfeatures.h ../corelib/global/qglobal.h
> ../corelib/global/qlibraryinfo.h ../corelib/global/qnamespace.h
> ../corelib/global/qnumeric.h ../corelib/global/qt_windows.h
> ../corelib/global/qconfig.h ../corelib/codecs/qtextcodec.h
> ../corelib/codecs/qtextcodecplugin.h ../corelib/io/qab
>  stractfileengine.h ../corelib/io/qbuffer.h ../corelib/io/qdatastream.h
> ../corelib/io/qdebug.h ../corelib/io/qdir.h ../corelib/io/qdiriterator.h
> ../corelib/io/qfile.h ../corelib/io/qfileinfo.h
> ../corelib/io/qfilesystemwatcher.h ../corelib/io/qfsfileengine.h
> ../corelib/io/qiodevice.h ../corelib/io/qprocess.h
> ../corelib/io/qresource.h ../corelib/io/qsettings.h
> ../corelib/io/qtemporaryfile.h ../corelib/io/qtextstream.h
> ../corelib/io/qurl.h ../corelib/animation/qabstractanimation.h
> ../corelib/animation/qanimationgroup.h
> ../corelib/animation/qparallelanimationgroup.h
> ../corelib/animation/qpauseanimation.h
> ../corelib/animation/qpropertyanimation.h
> ../corelib/animation/qsequentialanimationgroup.h
> ../corelib/animation/qvariantanimation.h ../corelib/tools/qalgorithms.h
> ../corelib/tools/qbitarray.h ../corelib/tools/qbytearray.h
> ../corelib/tools/qbytearraymatcher.h ../corelib/tools/qcache.h
> ../corelib/tools/qchar.h ../corelib/tools/qcontainerfwd.h
> ../corelib/tools/qcontiguouscache.h ../
>  corelib/tools/qcryptographichash.h ../corelib/tools/qdatetime.h
> ../corelib/tools/qeasingcurve.h ../corelib/tools/qelapsedtimer.h
> ../corelib/tools/qhash.h ../corelib/tools/qiterator.h
> ../corelib/tools/qline.h ../corelib/tools/qlinkedlist.h
> ../corelib/tools/qlist.h ../corelib/tools/qlocale.h
> ../corelib/tools/qlocale_blackberry.h ../corelib/tools/qmap.h
> ../corelib/tools/qmargins.h ../corelib/tools/qpair.h
> ../corelib/tools/qpoint.h ../corelib/tools/qqueue.h
> ../corelib/tools/qrect.h ../corelib/tools/qregexp.h
> ../corelib/tools/qscopedpointer.h ../corelib/tools/qscopedvaluerollback.h
> ../corelib/tools/qset.h ../corelib/tools/qshareddata.h
> ../corelib/tools/qsharedpointer.h ../corelib/tools/qsharedpointer_impl.h
> ../corelib/tools/qsize.h ../corelib/tools/qstack.h
> ../corelib/tools/qstring.h ../corelib/tools/qstringbuilder.h
> ../corelib/tools/qstringlist.h ../corelib/tools/qstringmatcher.h
> ../corelib/tools/qtextboundaryfinder.h ../corelib/tools/qtimeline.h
> ../corelib/tools/qvarlengtharray
>  .h ../corelib/tools/qvector.h ../../include/QtCore/QtCore
> - SYNCQT.HEADER_CLASSES =3D ../../include/QtCore/QAbstractState
> ../../include/QtCore/QAbstractTransition
> ../../include/QtCore/QEventTransition ../../include/QtCore/QFinalState
> ../../include/QtCore/QHistoryState ../../include/QtCore/QSignalTransition
> ../../include/QtCore/QState ../../include/QtCore/QStateMachine
> ../../include/QtCore/QAtomicInt ../../include/QtCore/QAtomicPointer
> ../../include/QtCore/QBasicAtomicInt
> ../../include/QtCore/QBasicAtomicPointer ../../include/QtCore/QMutex
> ../../include/QtCore/QMutexLocker ../../include/QtCore/QMutexData
> ../../include/QtCore/QReadWriteLock ../../include/QtCore/QReadLocker
> ../../include/QtCore/QWriteLocker ../../include/QtCore/QSemaphore
> ../../include/QtCore/QThread ../../include/QtCore/QThreadStorageData
> ../../include/QtCore/QThreadStorage ../../include/QtCore/QWaitCondition
> ../../include/QtCore/QXmlStreamStringRef
> ../../include/QtCore/QXmlStreamAttribute
> ../../include/QtCore/QXmlStreamAttributes
> ../../include/QtCore/QXmlStreamNamespac
>  eDeclaration ../../include/QtCore/QXmlStreamNamespaceDeclarations
> ../../include/QtCore/QXmlStreamNotationDeclaration
> ../../include/QtCore/QXmlStreamNotationDeclarations
> ../../include/QtCore/QXmlStreamEntityDeclaration
> ../../include/QtCore/QXmlStreamEntityDeclarations
> ../../include/QtCore/QXmlStreamEntityResolver
> ../../include/QtCore/QXmlStreamReader ../../include/QtCore/QXmlStreamWrit=
er
> ../../include/QtCore/QFuture ../../include/QtCore/QFutureIterator
> ../../include/QtCore/QMutableFutureIterator
> ../../include/QtCore/QFutureInterfaceBase
> ../../include/QtCore/QFutureInterface
> ../../include/QtCore/QFutureSynchronizer
> ../../include/QtCore/QFutureWatcherBase ../../include/QtCore/QFutureWatch=
er
> ../../include/QtCore/QRunnable ../../include/QtCore/QtConcurrentFilter
> ../../include/QtCore/QtConcurrentMap ../../include/QtCore/QtConcurrentRun
> ../../include/QtCore/QThreadPool
> ../../include/QtCore/QAbstractEventDispatcher
> ../../include/QtCore/QModelIndex ../../include/QtCore/QPersistentMod
>  elIndex ../../include/QtCore/QModelIndexList
> ../../include/QtCore/QAbstractItemModel
> ../../include/QtCore/QAbstractTableModel
> ../../include/QtCore/QAbstractListModel ../../include/QtCore/QBasicTimer
> ../../include/QtCore/QCoreApplication
> ../../include/QtCore/QtCleanUpFunction ../../include/QtCore/QEvent
> ../../include/QtCore/QTimerEvent ../../include/QtCore/QChildEvent
> ../../include/QtCore/QCustomEvent
> ../../include/QtCore/QDynamicPropertyChangeEvent
> ../../include/QtCore/QEventLoop ../../include/QtCore/QMetaMethod
> ../../include/QtCore/QMetaEnum ../../include/QtCore/QMetaProperty
> ../../include/QtCore/QMetaClassInfo ../../include/QtCore/QMetaType
> ../../include/QtCore/QMetaTypeId ../../include/QtCore/QMetaTypeId2
> ../../include/QtCore/QMimeData ../../include/QtCore/QObjectList
> ../../include/QtCore/QObjectData ../../include/QtCore/QObject
> ../../include/QtCore/QObjectUserData
> ../../include/QtCore/QObjectCleanupHandler
> ../../include/QtCore/QGenericArgument ../../include/QtCore/QGener
>  icReturnArgument ../../include/QtCore/QArgument
> ../../include/QtCore/QReturnArgument ../../include/QtCore/QMetaObject
> ../../include/QtCore/QMetaObjectAccessor
> ../../include/QtCore/QMetaObjectExtraData ../../include/QtCore/QPointer
> ../../include/QtCore/QSharedMemory ../../include/QtCore/QSignalMapper
> ../../include/QtCore/QSocketNotifier ../../include/QtCore/QSystemSemaphor=
e
> ../../include/QtCore/QTimer ../../include/QtCore/QTranslator
> ../../include/QtCore/QVariant ../../include/QtCore/QVariantList
> ../../include/QtCore/QVariantMap ../../include/QtCore/QVariantHash
> ../../include/QtCore/QVariantComparisonHelper
> ../../include/QtCore/QFactoryInterface ../../include/QtCore/QLibrary
> ../../include/QtCore/QtPlugin ../../include/QtCore/QtPluginInstanceFuncti=
on
> ../../include/QtCore/QPluginLoader ../../include/QtCore/QUuid
> ../../include/QtCore/QtEndian ../../include/QtCore/QtGlobal
> ../../include/QtCore/QIntegerForSize
> ../../include/QtCore/QNoImplicitBoolCast ../../include/QtCore/Q_INT8 ..
>  /../include/QtCore/Q_UINT8 ../../include/QtCore/Q_INT16
> ../../include/QtCore/Q_UINT16 ../../include/QtCore/Q_INT32
> ../../include/QtCore/Q_UINT32 ../../include/QtCore/Q_INT64
> ../../include/QtCore/Q_UINT64 ../../include/QtCore/Q_LLONG
> ../../include/QtCore/Q_ULLONG ../../include/QtCore/Q_LONG
> ../../include/QtCore/Q_ULONG ../../include/QtCore/QSysInfo
> ../../include/QtCore/QtMsgHandler ../../include/QtCore/QGlobalStatic
> ../../include/QtCore/QGlobalStaticDeleter ../../include/QtCore/QBool
> ../../include/QtCore/QTypeInfo ../../include/QtCore/QFlag
> ../../include/QtCore/QIncompatibleFlag ../../include/QtCore/QFlags
> ../../include/QtCore/QForeachContainer
> ../../include/QtCore/QForeachContainerBase
> ../../include/QtCore/QLibraryInfo ../../include/QtCore/Qt
> ../../include/QtCore/QInternal ../../include/QtCore/QCOORD
> ../../include/QtCore/QtConfig ../../include/QtCore/QTextCodec
> ../../include/QtCore/QTextEncoder ../../include/QtCore/QTextDecoder
> ../../include/QtCore/QTextCodecFactoryInterface
>   ../../include/QtCore/QTextCodecPlugin
> ../../include/QtCore/QAbstractFileEngine
> ../../include/QtCore/QAbstractFileEngineHandler
> ../../include/QtCore/QAbstractFileEngineIterator
> ../../include/QtCore/QBuffer ../../include/QtCore/QDataStream
> ../../include/QtCore/QtDebug ../../include/QtCore/QDebug
> ../../include/QtCore/QNoDebug ../../include/QtCore/QDir
> ../../include/QtCore/QDirIterator ../../include/QtCore/QFile
> ../../include/QtCore/QFileInfo ../../include/QtCore/QFileInfoList
> ../../include/QtCore/QFileInfoListIterator
> ../../include/QtCore/QFileSystemWatcher ../../include/QtCore/QFSFileEngin=
e
> ../../include/QtCore/QIODevice ../../include/QtCore/Q_PID
> ../../include/QtCore/QProcessEnvironment ../../include/QtCore/QProcess
> ../../include/QtCore/QResource ../../include/QtCore/QSettings
> ../../include/QtCore/QTemporaryFile ../../include/QtCore/QTextStream
> ../../include/QtCore/QTextStreamFunction
> ../../include/QtCore/QTextStreamManipulator ../../include/QtCore/QTS
> ../../include/QtCore/Q
>  TextIStream ../../include/QtCore/QTextOStream ../../include/QtCore/QUrl
> ../../include/QtCore/QAbstractAnimation
> ../../include/QtCore/QAnimationDriver ../../include/QtCore/QAnimationGrou=
p
> ../../include/QtCore/QParallelAnimationGroup
> ../../include/QtCore/QPauseAnimation
> ../../include/QtCore/QPropertyAnimation
> ../../include/QtCore/QSequentialAnimationGroup
> ../../include/QtCore/QVariantAnimation ../../include/QtCore/QtAlgorithms
> ../../include/QtCore/QBitArray ../../include/QtCore/QBitRef
> ../../include/QtCore/QByteArray ../../include/QtCore/QByteRef
> ../../include/QtCore/QByteArrayMatcher ../../include/QtCore/QCache
> ../../include/QtCore/QLatin1Char ../../include/QtCore/QChar
> ../../include/QtCore/QtContainerFwd
> ../../include/QtCore/QContiguousCacheData
> ../../include/QtCore/QContiguousCacheTypedData
> ../../include/QtCore/QContiguousCache
> ../../include/QtCore/QCryptographicHash ../../include/QtCore/QDate
> ../../include/QtCore/QTime ../../include/QtCore/QDateTime
> ../../include/QtCore/QE
>  asingCurve ../../include/QtCore/QElapsedTimer
> ../../include/QtCore/QHashData ../../include/QtCore/QHashDummyValue
> ../../include/QtCore/QHashDummyNode ../../include/QtCore/QHashNode
> ../../include/QtCore/QHash ../../include/QtCore/QMultiHash
> ../../include/QtCore/QHashIterator
> ../../include/QtCore/QMutableHashIterator ../../include/QtCore/QLine
> ../../include/QtCore/QLineF ../../include/QtCore/QLinkedListData
> ../../include/QtCore/QLinkedListNode ../../include/QtCore/QLinkedList
> ../../include/QtCore/QLinkedListIterator
> ../../include/QtCore/QMutableLinkedListIterator
> ../../include/QtCore/QListData ../../include/QtCore/QList
> ../../include/QtCore/QListIterator
> ../../include/QtCore/QMutableListIterator
> ../../include/QtCore/QSystemLocale ../../include/QtCore/QLocale
> ../../include/QtCore/QBBSystemLocaleData ../../include/QtCore/QMapData
> ../../include/QtCore/QMapNode ../../include/QtCore/QMapPayloadNode
> ../../include/QtCore/QMap ../../include/QtCore/QMultiMap
> ../../include/QtCore/QMapIt
>  erator ../../include/QtCore/QMutableMapIterator
> ../../include/QtCore/QMargins ../../include/QtCore/QPair
> ../../include/QtCore/QPoint ../../include/QtCore/QPointF
> ../../include/QtCore/QQueue ../../include/QtCore/QRect
> ../../include/QtCore/QRectF ../../include/QtCore/QRegExp
> ../../include/QtCore/QScopedPointerDeleter
> ../../include/QtCore/QScopedPointerArrayDeleter
> ../../include/QtCore/QScopedPointerPodDeleter
> ../../include/QtCore/QScopedPointer
> ../../include/QtCore/QScopedArrayPointer
> ../../include/QtCore/QScopedValueRollback ../../include/QtCore/QSet
> ../../include/QtCore/QSetIterator ../../include/QtCore/QMutableSetIterato=
r
> ../../include/QtCore/QSharedData ../../include/QtCore/QSharedDataPointer
> ../../include/QtCore/QExplicitlySharedDataPointer
> ../../include/QtCore/QSharedPointer ../../include/QtCore/QWeakPointer
> ../../include/QtCore/QSize ../../include/QtCore/QSizeF
> ../../include/QtCore/QStack ../../include/QtCore/QStdWString
> ../../include/QtCore/QString ../../include/QtCore
>  /QLatin1String ../../include/QtCore/QCharRef
> ../../include/QtCore/QConstString ../../include/QtCore/QStringRef
> ../../include/QtCore/QLatin1Literal
> ../../include/QtCore/QAbstractConcatenable
> ../../include/QtCore/QConcatenable ../../include/QtCore/QStringBuilder
> ../../include/QtCore/QStringListIterator
> ../../include/QtCore/QMutableStringListIterator
> ../../include/QtCore/QStringList ../../include/QtCore/QStringMatcher
> ../../include/QtCore/QTextBoundaryFinder ../../include/QtCore/QTimeLine
> ../../include/QtCore/QVarLengthArray ../../include/QtCore/QVectorData
> ../../include/QtCore/QVectorTypedData ../../include/QtCore/QVector
> ../../include/QtCore/QVectorIterator
> ../../include/QtCore/QMutableVectorIterator
> - SYNCQT.PRIVATE_HEADER_FILES =3D ../corelib/statemachine/qabstractstate_=
p.h
> ../corelib/statemachine/qabstracttransition_p.h
> ../corelib/statemachine/qeventtransition_p.h
> ../corelib/statemachine/qhistorystate_p.h
> ../corelib/statemachine/qsignaleventgenerator_p.h
> ../corelib/statemachine/qsignaltransition_p.h
> ../corelib/statemachine/qstate_p.h
> ../corelib/statemachine/qstatemachine_p.h ../corelib/thread/qmutex_p.h
> ../corelib/thread/qmutexpool_p.h ../corelib/thread/qorderedmutexlocker_p.=
h
> ../corelib/thread/qreadwritelock_p.h ../corelib/thread/qthread_p.h
> ../corelib/xml/qxmlstream_p.h ../corelib/xml/qxmlutils_p.h
> ../corelib/concurrent/qfutureinterface_p.h
> ../corelib/concurrent/qfuturewatcher_p.h
> ../corelib/concurrent/qthreadpool_p.h
> ../corelib/kernel/qabstracteventdispatcher_p.h
> ../corelib/kernel/qabstractitemmodel_p.h ../corelib/kernel/qcore_mac_p.h
> ../corelib/kernel/qcore_symbian_p.h ../corelib/kernel/qcore_unix_p.h
> ../corelib/kernel/qcoreapplication_p.h ../corelib/kernel/qcorecmdl
>  ineargs_p.h ../corelib/kernel/qcoreglobaldata_p.h
> ../corelib/kernel/qcrashhandler_p.h
> ../corelib/kernel/qeventdispatcher_blackberry_p.h
> ../corelib/kernel/qeventdispatcher_glib_p.h
> ../corelib/kernel/qeventdispatcher_symbian_p.h
> ../corelib/kernel/qeventdispatcher_unix_p.h
> ../corelib/kernel/qeventdispatcher_win_p.h ../corelib/kernel/qfunctions_p=
.h
> ../corelib/kernel/qmetaobject_p.h ../corelib/kernel/qobject_p.h
> ../corelib/kernel/qsharedmemory_p.h ../corelib/kernel/qsystemerror_p.h
> ../corelib/kernel/qsystemsemaphore_p.h ../corelib/kernel/qtranslator_p.h
> ../corelib/kernel/qvariant_p.h ../corelib/kernel/qwineventnotifier_p.h
> ../corelib/plugin/qelfparser_p.h ../corelib/plugin/qfactoryloader_p.h
> ../corelib/plugin/qlibrary_p.h ../corelib/plugin/qsystemlibrary_p.h
> ../corelib/global/qnumeric_p.h ../corelib/global/qt_pch.h
> ../corelib/codecs/qfontlaocodec_p.h ../corelib/codecs/qiconvcodec_p.h
> ../corelib/codecs/qisciicodec_p.h ../corelib/codecs/qlatincodec_p.h
> ../corelib/codecs/qsimplecode
>  c_p.h ../corelib/codecs/qtextcodec_p.h ../corelib/codecs/qtsciicodec_p.h
> ../corelib/codecs/qutfcodec_p.h ../corelib/io/qabstractfileengine_p.h
> ../corelib/io/qdatastream_p.h ../corelib/io/qdataurl_p.h
> ../corelib/io/qdir_p.h ../corelib/io/qfile_p.h ../corelib/io/qfileinfo_p.=
h
> ../corelib/io/qfilesystemengine_p.h ../corelib/io/qfilesystementry_p.h
> ../corelib/io/qfilesystemiterator_p.h ../corelib/io/qfilesystemmetadata_p=
.h
> ../corelib/io/qfilesystemwatcher_dnotify_p.h
> ../corelib/io/qfilesystemwatcher_fsevents_p.h
> ../corelib/io/qfilesystemwatcher_inotify_p.h
> ../corelib/io/qfilesystemwatcher_kqueue_p.h
> ../corelib/io/qfilesystemwatcher_p.h
> ../corelib/io/qfilesystemwatcher_symbian_p.h
> ../corelib/io/qfilesystemwatcher_win_p.h
> ../corelib/io/qfsfileengine_iterator_p.h ../corelib/io/qfsfileengine_p.h
> ../corelib/io/qiodevice_p.h ../corelib/io/qnoncontiguousbytedevice_p.h
> ../corelib/io/qprocess_p.h ../corelib/io/qresource_iterator_p.h
> ../corelib/io/qresource_p.h ../corelib/io/qsettings_p.h
>  ../corelib/io/qtldurl_p.h ../corelib/io/qurltlds_p.h
> ../corelib/io/qwindowspipewriter_p.h
> ../corelib/animation/qabstractanimation_p.h
> ../corelib/animation/qanimationgroup_p.h
> ../corelib/animation/qparallelanimationgroup_p.h
> ../corelib/animation/qpropertyanimation_p.h
> ../corelib/animation/qsequentialanimationgroup_p.h
> ../corelib/animation/qvariantanimation_p.h ../corelib/tools/qbytedata_p.h
> ../corelib/tools/qdatetime_p.h ../corelib/tools/qharfbuzz_p.h
> ../corelib/tools/qlocale_data_p.h ../corelib/tools/qlocale_p.h
> ../corelib/tools/qlocale_tools_p.h ../corelib/tools/qpodlist_p.h
> ../corelib/tools/qringbuffer_p.h ../corelib/tools/qscopedpointer_p.h
> ../corelib/tools/qsimd_p.h ../corelib/tools/qtools_p.h
> ../corelib/tools/qunicodetables_p.h
> diff --git
> a/meta/recipes-qt/qt4/qt4-4.8.6/0034-Fix-a-division-by-zero-when-processi=
ng-malformed-BMP.patch
> b/meta/recipes-qt/qt4/qt4-4.8.6/0034-Fix-a-division-by-zero-when-processi=
ng-malformed-BMP.patch
> deleted file mode 100644
> index 8ff4ad5..0000000
> ---
> a/meta/recipes-qt/qt4/qt4-4.8.6/0034-Fix-a-division-by-zero-when-processi=
ng-malformed-BMP.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From e50aa2252cdd5cb53eef7d8c4503c7edff634f68 Mon Sep 17 00:00:00 2001
> -From: "Richard J. Moore" <rich@kde.org>
> -Date: Tue, 24 Feb 2015 19:02:35 +0000
> -Subject: [PATCH] Fix a division by zero when processing malformed BMP
> files.
> -
> -This fixes a division by 0 when processing a maliciously crafted BMP
> -file. No impact beyond DoS.
> -
> -Backport of 661f6bfd032dacc62841037732816a583640e187
> -
> -Upstream-Status: Backport
> -
> -Task-number: QTBUG-44547
> -Change-Id: I43f06e752b11cb50669101460902a82b885ae618
> -Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
> -Signed-off-by: Jonathan Liu <net147@gmail.com>
> ----
> - src/gui/image/qbmphandler.cpp | 6 ++++++
> - 1 file changed, 6 insertions(+)
> -
> -diff --git a/src/gui/image/qbmphandler.cpp b/src/gui/image/qbmphandler.c=
pp
> -index b22e842..30fa9e0 100644
> ---- a/src/gui/image/qbmphandler.cpp
> -+++ b/src/gui/image/qbmphandler.cpp
> -@@ -319,10 +319,16 @@ static bool read_dib_body(QDataStream &s, const
> BMP_INFOHDR &bi, int offset, int
> -         }
> -     } else if (comp =3D=3D BMP_BITFIELDS && (nbits =3D=3D 16 || nbits =
=3D=3D 32)) {
> -         red_shift =3D calc_shift(red_mask);
> -+        if (((red_mask >> red_shift) + 1) =3D=3D 0)
> -+            return false;
> -         red_scale =3D 256 / ((red_mask >> red_shift) + 1);
> -         green_shift =3D calc_shift(green_mask);
> -+        if (((green_mask >> green_shift) + 1) =3D=3D 0)
> -+            return false;
> -         green_scale =3D 256 / ((green_mask >> green_shift) + 1);
> -         blue_shift =3D calc_shift(blue_mask);
> -+        if (((blue_mask >> blue_shift) + 1) =3D=3D 0)
> -+            return false;
> -         blue_scale =3D 256 / ((blue_mask >> blue_shift) + 1);
> -     } else if (comp =3D=3D BMP_RGB && (nbits =3D=3D 24 || nbits =3D=3D =
32)) {
> -         blue_mask =3D 0x000000ff;
> ---
> -2.3.1
> -
> diff --git a/meta/recipes-qt/qt4/qt4-4.8.6.inc
> b/meta/recipes-qt/qt4/qt4-4.8.7.inc
> similarity index 87%
> rename from meta/recipes-qt/qt4/qt4-4.8.6.inc
> rename to meta/recipes-qt/qt4/qt4-4.8.7.inc
> index 0cb7f80..2f580cc 100644
> --- a/meta/recipes-qt/qt4/qt4-4.8.6.inc
> +++ b/meta/recipes-qt/qt4/qt4-4.8.7.inc
> @@ -22,19 +22,14 @@ SRC_URI =3D "
> http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever
>             file://0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch=
 \
>             file://0027-tools.pro-disable-qmeegographicssystemhelper.patc=
h
> \
>             file://0028-Don-t-crash-on-broken-GIF-images.patch \
> -           file://0029-aarch64_arm64_fix_arch_detection.patch \
> -           file://0030-aarch64_arm64_qatomic_support.patch \
> -           file://0031-aarch64_arm64_mkspecs.patch \
> -           file://0032-aarch64_add_header.patch \
> -
>  file://0034-Fix-a-division-by-zero-when-processing-malformed-BMP.patch \
>             file://Fix-QWSLock-invalid-argument-logs.patch \
>             file://add_check_for_aarch64_32.patch \
>             file://g++.conf \
>             file://linux.conf \
>             "
>
> -SRC_URI[md5sum] =3D "2edbe4d6c2eff33ef91732602f3518eb"
> -SRC_URI[sha256sum] =3D
> "8b14dd91b52862e09b8e6a963507b74bc2580787d171feda197badfa7034032c"
> +SRC_URI[md5sum] =3D "d990ee66bf7ab0c785589776f35ba6ad"
> +SRC_URI[sha256sum] =3D
> "e2882295097e47fe089f8ac741a95fef47e0a73a3f3cdf21b56990638f626ea0"
>
>  S =3D "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
>
> diff --git
> a/meta/recipes-qt/qt4/qt4-4.8.6/0001-qlibraryinfo-allow-to-set-qt.conf-fr=
om-the-outside-u.patch
> b/meta/recipes-qt/qt4/qt4-4.8.7/0001-qlibraryinfo-allow-to-set-qt.conf-fr=
om-the-outside-u.patch
> similarity index 100%
> rename from
> meta/recipes-qt/qt4/qt4-4.8.6/0001-qlibraryinfo-allow-to-set-qt.conf-from=
-the-outside-u.patch
> rename to
> meta/recipes-qt/qt4/qt4-4.8.7/0001-qlibraryinfo-allow-to-set-qt.conf-from=
-the-outside-u.patch
> diff --git
> a/meta/recipes-qt/qt4/qt4-4.8.6/0002-qkbdtty_qws-fix-build-with-old-kerne=
l-headers.patch
> b/meta/recipes-qt/qt4/qt4-4.8.7/0002-qkbdtty_qws-fix-build-with-old-kerne=
l-headers.patch
> similarity index 100%
> rename from
> meta/recipes-qt/qt4/qt4-4.8.6/0002-qkbdtty_qws-fix-build-with-old-kernel-=
headers.patch
> rename to
> meta/recipes-qt/qt4/qt4-4.8.7/0002-qkbdtty_qws-fix-build-with-old-kernel-=
headers.patch
> diff --git
> a/meta/recipes-qt/qt4/qt4-4.8.6/0003-webkit2-set-OUTPUT_DIR-value-if-empt=
y.patch
> b/meta/recipes-qt/qt4/qt4-4.8.7/0003-webkit2-set-OUTPUT_DIR-value-if-empt=
y.patch
> similarity index 100%
> rename from
> meta/recipes-qt/qt4/qt4-4.8.6/0003-webkit2-set-OUTPUT_DIR-value-if-empty.=
patch
> rename to
> meta/recipes-qt/qt4/qt4-4.8.7/0003-webkit2-set-OUTPUT_DIR-value-if-empty.=
patch
> diff --git
> a/meta/recipes-qt/qt4/qt4-4.8.6/0004-configure-qmake-is-already-built-in-=
qt4-tools-native.patch
> b/meta/recipes-qt/qt4/qt4-4.8.7/0004-configure-qmake-is-already-built-in-=
qt4-tools-native.patch
> similarity index 100%
> rename from
> meta/recipes-qt/qt4/qt4-4.8.6/0004-configure-qmake-is-already-built-in-qt=
4-tools-native.patch
> rename to
> meta/recipes-qt/qt4/qt4-4.8.7/0004-configure-qmake-is-already-built-in-qt=
4-tools-native.patch
> diff --git
> a/meta/recipes-qt/qt4/qt4-4.8.6/0005-configure-set-LFLAGS-to-pick-up-zlib=
-from-staging.patch
> b/meta/recipes-qt/qt4/qt4-4.8.7/0005-configure-set-LFLAGS-to-pick-up-zlib=
-from-staging.patch
> similarity index 100%
> rename from
> meta/recipes-qt/qt4/qt4-4.8.6/0005-configure-set-LFLAGS-to-pick-up-zlib-f=
rom-staging.patch
> rename to
> meta/recipes-qt/qt4/qt4-4.8.7/0005-configure-set-LFLAGS-to-pick-up-zlib-f=
rom-staging.patch
> diff --git
> a/meta/recipes-qt/qt4/qt4-4.8.6/0006-configure-Use-OE_QMAKE_-values-to-sp=
ecify-Qt-utility.patch
> b/meta/recipes-qt/qt4/qt4-4.8.7/0006-configure-Use-OE_QMAKE_-values-to-sp=
ecify-Qt-utility.patch
> similarity index 100%
> rename from
> meta/recipes-qt/qt4/qt4-4.8.6/0006-configure-Use-OE_QMAKE_-values-to-spec=
ify-Qt-utility.patch
> rename to
> meta/recipes-qt/qt4/qt4-4.8.7/0006-configure-Use-OE_QMAKE_-values-to-spec=
ify-Qt-utility.patch
> diff --git
> a/meta/recipes-qt/qt4/qt4-4.8.6/0007-dbus-Remove-const-usage-that-causes-=
compile-failure-.patch
> b/meta/recipes-qt/qt4/qt4-4.8.7/0007-dbus-Remove-const-usage-that-causes-=
compile-failure-.patch
> similarity index 100%
> rename from
> meta/recipes-qt/qt4/qt4-4.8.6/0007-dbus-Remove-const-usage-that-causes-co=
mpile-failure-.patch
> rename to
> meta/recipes-qt/qt4/qt4-4.8.7/0007-dbus-Remove-const-usage-that-causes-co=
mpile-failure-.patch
> diff --git
> a/meta/recipes-qt/qt4/qt4-4.8.6/0008-qmake.pro-Allow-building-a-separate-=
qmake-for-the-ta.patch
> b/meta/recipes-qt/qt4/qt4-4.8.7/0008-qmake.pro-Allow-building-a-separate-=
qmake-for-the-ta.patch
> similarity index 100%
> rename from
> meta/recipes-qt/qt4/qt4-4.8.6/0008-qmake.pro-Allow-building-a-separate-qm=
ake-for-the-ta.patch
> rename to
> meta/recipes-qt/qt4/qt4-4.8.7/0008-qmake.pro-Allow-building-a-separate-qm=
ake-for-the-ta.patch
> diff --git
> a/meta/recipes-qt/qt4/qt4-4.8.6/0009-qmake-fix-source-file-references-in-=
qmake.pri.patch
> b/meta/recipes-qt/qt4/qt4-4.8.7/0009-qmake-fix-source-file-references-in-=
qmake.pri.patch
> similarity index 100%
> rename from
> meta/recipes-qt/qt4/qt4-4.8.6/0009-qmake-fix-source-file-references-in-qm=
ake.pri.patch
> rename to
> meta/recipes-qt/qt4/qt4-4.8.7/0009-qmake-fix-source-file-references-in-qm=
ake.pri.patch
> diff --git
> a/meta/recipes-qt/qt4/qt4-4.8.6/0010-configure-Hack-to-not-use-the-pg_con=
fig-of-the-host-.patch
> b/meta/recipes-qt/qt4/qt4-4.8.7/0010-configure-Hack-to-not-use-the-pg_con=
fig-of-the-host-.patch
> similarity index 65%
> rename from
> meta/recipes-qt/qt4/qt4-4.8.6/0010-configure-Hack-to-not-use-the-pg_confi=
g-of-the-host-.patch
> rename to
> meta/recipes-qt/qt4/qt4-4.8.7/0010-configure-Hack-to-not-use-the-pg_confi=
g-of-the-host-.patch
> index 1d2ddab..ca6a0b8 100644
> ---
> a/meta/recipes-qt/qt4/qt4-4.8.6/0010-configure-Hack-to-not-use-the-pg_con=
fig-of-the-host-.patch
> +++
> b/meta/recipes-qt/qt4/qt4-4.8.7/0010-configure-Hack-to-not-use-the-pg_con=
fig-of-the-host-.patch
> @@ -14,6 +14,10 @@ will pad.
>  Upstream-Status: Inappropriate [configuration]
>
>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +
> +Update for qt 4.8.7.
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>  ---
>   configure | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> @@ -22,17 +26,17 @@ diff --git a/configure b/configure
>  index db4d044..35a8fe7 100755
>  --- a/configure
>  +++ b/configure
> -@@ -5511,10 +5511,10 @@ for _SQLDR in $CFG_SQL_AVAILABLE; do
> -         psql)
> +@@ -5574,10 +5574,10 @@
>               if [ "$CFG_SQL_psql" !=3D "no" ]; then
> +                 [ -z "$CFG_PSQL_CONFIG" ] && CFG_PSQL_CONFIG=3D`"$WHICH=
"
> pg_config`
>                   # Be careful not to use native pg_config when cross
> building.
> --                if [ "$XPLATFORM_MINGW" !=3D "yes" ] && "$WHICH" pg_con=
fig
> >/dev/null 2>&1; then
> --                    QT_CFLAGS_PSQL=3D`pg_config --includedir 2>/dev/nul=
l`
> --                    QT_LFLAGS_PSQL=3D`pg_config --libdir 2>/dev/null`
> +-                if [ "$XPLATFORM_MINGW" !=3D "yes" ] && [ -x
> "$CFG_PSQL_CONFIG" ]; then
> +-                    QT_CFLAGS_PSQL=3D`$CFG_PSQL_CONFIG --includedir
> 2>/dev/null`
> +-                    QT_LFLAGS_PSQL=3D`$CFG_PSQL_CONFIG --libdir
> 2>/dev/null`
>  -                fi
> -+#                if [ "$XPLATFORM_MINGW" !=3D "yes" ] && "$WHICH"
> pg_config >/dev/null 2>&1; then
> -+#                    QT_CFLAGS_PSQL=3D`pg_config --includedir 2>/dev/nu=
ll`
> -+#                    QT_LFLAGS_PSQL=3D`pg_config --libdir 2>/dev/null`
> ++#                if [ "$XPLATFORM_MINGW" !=3D "yes" ] && [ -x
> "$CFG_PSQL_CONFIG" ]; then
> ++#                    QT_CFLAGS_PSQL=3D`$CFG_PSQL_CONFIG --includedir
> 2>/dev/null`
> ++#                    QT_LFLAGS_PSQL=3D`$CFG_PSQL_CONFIG --libdir
> 2>/dev/null`
>  +#                fi
>                   [ -z "$QT_CFLAGS_PSQL" ] ||
> QT_CFLAGS_PSQL=3D"-I$QT_CFLAGS_PSQL"
>                   [ -z "$QT_LFLAGS_PSQL" ] ||
> QT_LFLAGS_PSQL=3D"-L$QT_LFLAGS_PSQL"
> diff --git
> a/meta/recipes-qt/qt4/qt4-4.8.6/0011-freetype-host-includes.patch
> b/meta/recipes-qt/qt4/qt4-4.8.7/0011-freetype-host-includes.patch
> similarity index 100%
> rename from meta/recipes-qt/qt4/qt4-4.8.6/0011-freetype-host-includes.pat=
ch
> rename to meta/recipes-qt/qt4/qt4-4.8.7/0011-freetype-host-includes.patch
> diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0012-Add-2bpp-support.patch
> b/meta/recipes-qt/qt4/qt4-4.8.7/0012-Add-2bpp-support.patch
> similarity index 100%
> rename from meta/recipes-qt/qt4/qt4-4.8.6/0012-Add-2bpp-support.patch
> rename to meta/recipes-qt/qt4/qt4-4.8.7/0012-Add-2bpp-support.patch
> diff --git
> a/meta/recipes-qt/qt4/qt4-4.8.6/0013-configure-add-crossarch-option.patch
> b/meta/recipes-qt/qt4/qt4-4.8.7/0013-configure-add-crossarch-option.patch
> similarity index 76%
> rename from
> meta/recipes-qt/qt4/qt4-4.8.6/0013-configure-add-crossarch-option.patch
> rename to
> meta/recipes-qt/qt4/qt4-4.8.7/0013-configure-add-crossarch-option.patch
> index aa464fd..762cdaf 100644
> ---
> a/meta/recipes-qt/qt4/qt4-4.8.6/0013-configure-add-crossarch-option.patch
> +++
> b/meta/recipes-qt/qt4/qt4-4.8.7/0013-configure-add-crossarch-option.patch
> @@ -6,34 +6,38 @@ Subject: [PATCH 13/21] configure: add "-crossarch" opti=
on
>  Upstream-Status: Pending
>
>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +
> +Update for qt 4.8.7
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>  ---
>   configure | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
>  diff --git a/configure b/configure
> -index 79c1c7b..7983c3d 100755
> +index 4eb4a3d..a4dacec 100755
>  --- a/configure
>  +++ b/configure
> -@@ -1153,7 +1153,7 @@ while [ "$#" -gt 0 ]; do
> +@@ -1160,7 +1160,7 @@ while [ "$#" -gt 0 ]; do
>           shift
>           VAL=3D$1
>           ;;
> --
> -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-libdir|-bindir=
|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-nomake|-=
platform|-xplatform|-device-option|-buildkey|-sdk|-arch|-host-arch|-mysql_c=
onfig|-sysroot)
> -+
> -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-libdir|-bindir=
|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-nomake|-=
platform|-xplatform|-device-option|-buildkey|-sdk|-arch|-host-arch|-mysql_c=
onfig|-sysroot|-crossarch)
> +-
> -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-libdir|-bindir=
|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-nomake|-=
platform|-xplatform|-device-option|-buildkey|-sdk|-arch|-host-arch|-mysql_c=
onfig|-psql_config|-sysroot)
> ++
> -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-libdir|-bindir=
|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-nomake|-=
platform|-xplatform|-device-option|-buildkey|-sdk|-arch|-host-arch|-mysql_c=
onfig|-psql_config|-sysroot|-crossarch)
>           VAR=3D`echo $1 | sed "s,^-\(.*\),\1,"`
>           shift
>           VAL=3D"$1"
> -@@ -1709,6 +1709,9 @@ while [ "$#" -gt 0 ]; do
> +@@ -1719,6 +1719,9 @@ while [ "$#" -gt 0 ]; do
>           DEV_VAL=3D`echo $VAL | sed "s,^.*=3D\(.*\),\1,"`
>           DeviceVar set $DEV_VAR $DEV_VAL
>           ;;
> -+      crossarch)
> -+              CROSSARCH=3D"$VAL"
> -+              ;;
> ++    crossarch)
> ++        CROSSARCH=3D"$VAL"
> ++        ;;
>       debug-and-release)
>           if [ "$VAL" =3D "yes" ] || [ "$VAL" =3D "no" ]; then
>               CFG_DEBUG_RELEASE=3D"$VAL"
> -@@ -3324,6 +3327,8 @@ arm*)
> +@@ -3333,6 +3336,8 @@ arm*)
>       ;;
>   esac
>
> diff --git
> a/meta/recipes-qt/qt4/qt4-4.8.6/0014-translations-fix-phony-translation-l=
inking-error.patch
> b/meta/recipes-qt/qt4/qt4-4.8.7/0014-translations-fix-phony-translation-l=
inking-error.patch
> similarity index 100%
> rename from
> meta/recipes-qt/qt4/qt4-4.8.6/0014-translations-fix-phony-translation-lin=
king-error.patch
> rename to
> meta/recipes-qt/qt4/qt4-4.8.7/0014-translations-fix-phony-translation-lin=
king-error.patch
> diff --git
> a/meta/recipes-qt/qt4/qt4-4.8.6/0015-configure-add-nostrip-for-debug-pack=
ages.patch
> b/meta/recipes-qt/qt4/qt4-4.8.7/0015-configure-add-nostrip-for-debug-pack=
ages.patch
> similarity index 100%
> rename from
> meta/recipes-qt/qt4/qt4-4.8.6/0015-configure-add-nostrip-for-debug-packag=
es.patch
> rename to
> meta/recipes-qt/qt4/qt4-4.8.7/0015-configure-add-nostrip-for-debug-packag=
es.patch
> diff --git
> a/meta/recipes-qt/qt4/qt4-4.8.6/0016-configure-eval-QMAKE_CXX.patch
> b/meta/recipes-qt/qt4/qt4-4.8.7/0016-configure-eval-QMAKE_CXX.patch
> similarity index 100%
> rename from
> meta/recipes-qt/qt4/qt4-4.8.6/0016-configure-eval-QMAKE_CXX.patch
> rename to meta/recipes-qt/qt4/qt4-4.8.7/0016-configure-eval-QMAKE_CXX.pat=
ch
> diff --git
> a/meta/recipes-qt/qt4/qt4-4.8.6/0017-configure-ensure-we-identify-the-com=
piler-as-g-in-co.patch
> b/meta/recipes-qt/qt4/qt4-4.8.7/0017-configure-ensure-we-identify-the-com=
piler-as-g-in-co.patch
> similarity index 100%
> rename from
> meta/recipes-qt/qt4/qt4-4.8.6/0017-configure-ensure-we-identify-the-compi=
ler-as-g-in-co.patch
> rename to
> meta/recipes-qt/qt4/qt4-4.8.7/0017-configure-ensure-we-identify-the-compi=
ler-as-g-in-co.patch
> diff --git
> a/meta/recipes-qt/qt4/qt4-4.8.6/0018-configure-make-pulseaudio-a-configur=
able-option.patch
> b/meta/recipes-qt/qt4/qt4-4.8.7/0018-configure-make-pulseaudio-a-configur=
able-option.patch
> similarity index 100%
> rename from
> meta/recipes-qt/qt4/qt4-4.8.6/0018-configure-make-pulseaudio-a-configurab=
le-option.patch
> rename to
> meta/recipes-qt/qt4/qt4-4.8.7/0018-configure-make-pulseaudio-a-configurab=
le-option.patch
> diff --git
> a/meta/recipes-qt/qt4/qt4-4.8.6/0019-Fixes-for-gcc-4.7.0-particularly-on-=
qemux86.patch
> b/meta/recipes-qt/qt4/qt4-4.8.7/0019-Fixes-for-gcc-4.7.0-particularly-on-=
qemux86.patch
> similarity index 100%
> rename from
> meta/recipes-qt/qt4/qt4-4.8.6/0019-Fixes-for-gcc-4.7.0-particularly-on-qe=
mux86.patch
> rename to
> meta/recipes-qt/qt4/qt4-4.8.7/0019-Fixes-for-gcc-4.7.0-particularly-on-qe=
mux86.patch
> diff --git
> a/meta/recipes-qt/qt4/qt4-4.8.6/0021-configure-make-qt4-native-work-with-=
long-building-pa.patch
> b/meta/recipes-qt/qt4/qt4-4.8.7/0021-configure-make-qt4-native-work-with-=
long-building-pa.patch
> similarity index 100%
> rename from
> meta/recipes-qt/qt4/qt4-4.8.6/0021-configure-make-qt4-native-work-with-lo=
ng-building-pa.patch
> rename to
> meta/recipes-qt/qt4/qt4-4.8.7/0021-configure-make-qt4-native-work-with-lo=
ng-building-pa.patch
> diff --git
> a/meta/recipes-qt/qt4/qt4-4.8.6/0027-tools.pro-disable-qmeegographicssyst=
emhelper.patch
> b/meta/recipes-qt/qt4/qt4-4.8.7/0027-tools.pro-disable-qmeegographicssyst=
emhelper.patch
> similarity index 100%
> rename from
> meta/recipes-qt/qt4/qt4-4.8.6/0027-tools.pro-disable-qmeegographicssystem=
helper.patch
> rename to
> meta/recipes-qt/qt4/qt4-4.8.7/0027-tools.pro-disable-qmeegographicssystem=
helper.patch
> diff --git
> a/meta/recipes-qt/qt4/qt4-4.8.6/0028-Don-t-crash-on-broken-GIF-images.pat=
ch
> b/meta/recipes-qt/qt4/qt4-4.8.7/0028-Don-t-crash-on-broken-GIF-images.pat=
ch
> similarity index 100%
> rename from
> meta/recipes-qt/qt4/qt4-4.8.6/0028-Don-t-crash-on-broken-GIF-images.patch
> rename to
> meta/recipes-qt/qt4/qt4-4.8.7/0028-Don-t-crash-on-broken-GIF-images.patch
> diff --git
> a/meta/recipes-qt/qt4/qt4-4.8.6/0033-configure-support-c-0x-standard-for-=
directfd.patch
> b/meta/recipes-qt/qt4/qt4-4.8.7/0033-configure-support-c-0x-standard-for-=
directfd.patch
> similarity index 100%
> rename from
> meta/recipes-qt/qt4/qt4-4.8.6/0033-configure-support-c-0x-standard-for-di=
rectfd.patch
> rename to
> meta/recipes-qt/qt4/qt4-4.8.7/0033-configure-support-c-0x-standard-for-di=
rectfd.patch
> diff --git
> a/meta/recipes-qt/qt4/qt4-4.8.6/Fix-QWSLock-invalid-argument-logs.patch
> b/meta/recipes-qt/qt4/qt4-4.8.7/Fix-QWSLock-invalid-argument-logs.patch
> similarity index 100%
> rename from
> meta/recipes-qt/qt4/qt4-4.8.6/Fix-QWSLock-invalid-argument-logs.patch
> rename to
> meta/recipes-qt/qt4/qt4-4.8.7/Fix-QWSLock-invalid-argument-logs.patch
> diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/add_check_for_aarch64_32.patch
> b/meta/recipes-qt/qt4/qt4-4.8.7/add_check_for_aarch64_32.patch
> similarity index 100%
> rename from meta/recipes-qt/qt4/qt4-4.8.6/add_check_for_aarch64_32.patch
> rename to meta/recipes-qt/qt4/qt4-4.8.7/add_check_for_aarch64_32.patch
> diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/g++.conf
> b/meta/recipes-qt/qt4/qt4-4.8.7/g++.conf
> similarity index 100%
> rename from meta/recipes-qt/qt4/qt4-4.8.6/g++.conf
> rename to meta/recipes-qt/qt4/qt4-4.8.7/g++.conf
> diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/linux.conf
> b/meta/recipes-qt/qt4/qt4-4.8.7/linux.conf
> similarity index 100%
> rename from meta/recipes-qt/qt4/qt4-4.8.6/linux.conf
> rename to meta/recipes-qt/qt4/qt4-4.8.7/linux.conf
> diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/qte.sh
> b/meta/recipes-qt/qt4/qt4-4.8.7/qte.sh
> similarity index 100%
> rename from meta/recipes-qt/qt4/qt4-4.8.6/qte.sh
> rename to meta/recipes-qt/qt4/qt4-4.8.7/qte.sh
> diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc
> b/meta/recipes-qt/qt4/qt4-embedded.inc
> index ef5cf2c..a769065 100644
> --- a/meta/recipes-qt/qt4/qt4-embedded.inc
> +++ b/meta/recipes-qt/qt4/qt4-embedded.inc
> @@ -3,7 +3,6 @@ DESCRIPTION =3D "Qt is a versatile cross-platform
> application framework -- this is
>  SECTION =3D "libs"
>  HOMEPAGE =3D "http://qt-project.org/"
>  DEPENDS +=3D "directfb tslib"
> -INC_PR =3D "r52"
>
>  QT4EDEPENDS =3D ""
>  QT_BASE_LIB  ?=3D "libqt-embedded"
> diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.8.6.bb
> b/meta/recipes-qt/qt4/qt4-embedded_4.8.7.bb
> similarity index 100%
> rename from meta/recipes-qt/qt4/qt4-embedded_4.8.6.bb
> rename to meta/recipes-qt/qt4/qt4-embedded_4.8.7.bb
> diff --git a/meta/recipes-qt/qt4/qt4-native.inc
> b/meta/recipes-qt/qt4/qt4-native.inc
> index 70bda73..2a41f8a 100644
> --- a/meta/recipes-qt/qt4/qt4-native.inc
> +++ b/meta/recipes-qt/qt4/qt4-native.inc
> @@ -9,8 +9,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE.LGPL;md5=3Dfbc093901857fcd118f065f900982c24 \
>
>  file://LICENSE.GPL3;md5=3D6e1694ee338db410417517884918d4d2 \
>
>  file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c139dfb268fb6"
>
> -INC_PR =3D "r20"
> -
>  inherit native
>
>  SRC_URI =3D "
> http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-everywhe=
re-opensource-src-${PV}.tar.gz
> \
> @@ -18,10 +16,6 @@ SRC_URI =3D "
> http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever
>
> file://0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch \
>             file://0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch \
>
> file://0021-configure-make-qt4-native-work-with-long-building-pa.patch \
> -           file://0029-aarch64_arm64_fix_arch_detection.patch \
> -           file://0030-aarch64_arm64_qatomic_support.patch \
> -           file://0031-aarch64_arm64_mkspecs.patch \
> -           file://0032-aarch64_add_header.patch \
>             file://g++.conf \
>             file://linux.conf \
>         "
> diff --git a/meta/recipes-qt/qt4/qt4-native_4.8.6.bb
> b/meta/recipes-qt/qt4/qt4-native_4.8.6.bb
> deleted file mode 100644
> index d874d32..0000000
> --- a/meta/recipes-qt/qt4/qt4-native_4.8.6.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require qt4-native.inc
> -
> -TOBUILD :=3D "src/tools/bootstrap ${TOBUILD}"
> -
> -SRC_URI[md5sum] =3D "2edbe4d6c2eff33ef91732602f3518eb"
> -SRC_URI[sha256sum] =3D
> "8b14dd91b52862e09b8e6a963507b74bc2580787d171feda197badfa7034032c"
> diff --git a/meta/recipes-qt/qt4/qt4-native_4.8.7.bb
> b/meta/recipes-qt/qt4/qt4-native_4.8.7.bb
> new file mode 100644
> index 0000000..494d663
> --- /dev/null
> +++ b/meta/recipes-qt/qt4/qt4-native_4.8.7.bb
> @@ -0,0 +1,6 @@
> +require qt4-native.inc
> +
> +TOBUILD :=3D "src/tools/bootstrap ${TOBUILD}"
> +
> +SRC_URI[md5sum] =3D "d990ee66bf7ab0c785589776f35ba6ad"
> +SRC_URI[sha256sum] =3D
> "e2882295097e47fe089f8ac741a95fef47e0a73a3f3cdf21b56990638f626ea0"
> diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc
> b/meta/recipes-qt/qt4/qt4-x11-free.inc
> index 835fc96..f6a1737 100644
> --- a/meta/recipes-qt/qt4/qt4-x11-free.inc
> +++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
> @@ -9,8 +9,6 @@ DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES',
> 'opengl', 'virtual/libgl', '
>  PROVIDES +=3D "qt4-x11"
>  QT4DEPENDS =3D ""
>
> -INC_PR =3D "r50"
> -
>  QT_GLFLAGS ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
> '-opengl', '-no-opengl', d)} "
>  QT_GLFLAGS_qemux86 =3D "-opengl"
>  QT_GLFLAGS_qemuppc =3D "-opengl"
> diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.8.6.bb
> b/meta/recipes-qt/qt4/qt4-x11-free_4.8.7.bb
> similarity index 100%
> rename from meta/recipes-qt/qt4/qt4-x11-free_4.8.6.bb
> rename to meta/recipes-qt/qt4/qt4-x11-free_4.8.7.bb
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1133dd7423f060051786432a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Kai,<div><br></div><div>This doesn&#39;t apply against =
master since the GStreamer 0.10 removal patches landed, can you rebase?</di=
v><div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div c=
lass=3D"gmail_quote">On 2 June 2015 at 08:52, Kai Kang <span dir=3D"ltr">&l=
t;<a href=3D"mailto:kai.kang@windriver.com" target=3D"_blank">kai.kang@wind=
river.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Upgrade =
qt4 packages from version 4.8.6 to 4.8.7.<br>
<br>
* remove arm64 related patches which are merged<br>
* remove 0034-Fix-a-division-by-zero-when-processing-malformed-BMP.patch<br=
>
=C2=A0 which is backported.<br>
* update 0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch<br=
>
=C2=A0 and 0013-configure-add-crossarch-option.patch for new version<br>
* remove useless variable INC_PR<br>
<br>
Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.k=
ang@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-qt/qt4/nativesdk-qt4-tools.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 -<br>
=C2=A0...<a href=3D"http://tools_4.8.6.bb" target=3D"_blank">tools_4.8.6.bb=
</a> =3D&gt; <a href=3D"http://nativesdk-qt4-tools_4.8.7.bb" target=3D"_bla=
nk">nativesdk-qt4-tools_4.8.7.bb</a>} |=C2=A0 =C2=A04 +-<br>
=C2=A0.../0029-aarch64_arm64_fix_arch_detection.patch=C2=A0 =C2=A0 |=C2=A0 =
53 ---<br>
=C2=A0.../0030-aarch64_arm64_qatomic_support.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 491 ---------------------<br>
=C2=A0.../qt4/qt4-4.8.6/0031-aarch64_arm64_mkspecs.patch | 124 ------<br>
=C2=A0.../qt4/qt4-4.8.6/0032-aarch64_add_header.patch=C2=A0 =C2=A0 |=C2=A0 =
18 -<br>
=C2=A0...ion-by-zero-when-processing-malformed-BMP.patch |=C2=A0 44 --<br>
=C2=A0.../qt4/{qt4-4.8.6.inc =3D&gt; qt4-4.8.7.inc}=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A09 +-<br>
=C2=A0...o-allow-to-set-qt.conf-from-the-outside-u.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...tty_qws-fix-build-with-old-kernel-headers.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...003-webkit2-set-OUTPUT_DIR-value-if-empty.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...make-is-already-built-in-qt4-tools-native.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...e-set-LFLAGS-to-pick-up-zlib-from-staging.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...se-OE_QMAKE_-values-to-specify-Qt-utility.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...-const-usage-that-causes-compile-failure-.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...llow-building-a-separate-qmake-for-the-ta.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...e-fix-source-file-references-in-qmake.pri.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...ack-to-not-use-the-pg_config-of-the-host-.patch |=C2=A0 20 +-<br>
=C2=A0.../0011-freetype-host-includes.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A00<br>
=C2=A0.../0012-Add-2bpp-support.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A00<br>
=C2=A0.../0013-configure-add-crossarch-option.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 22 +-<br>
=C2=A0...tions-fix-phony-translation-linking-error.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...-configure-add-nostrip-for-debug-packages.patch |=C2=A0 =C2=A00<br=
>
=C2=A0.../0016-configure-eval-QMAKE_CXX.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A00<br>
=C2=A0...nsure-we-identify-the-compiler-as-g-in-co.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...ure-make-pulseaudio-a-configurable-option.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...xes-for-gcc-4.7.0-particularly-on-qemux86.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...ake-qt4-native-work-with-long-building-pa.patch |=C2=A0 =C2=A00<br=
>
=C2=A0...ls.pro-disable-qmeegographicssystemhelper.patch |=C2=A0 =C2=A00<br=
>
=C2=A0.../0028-Don-t-crash-on-broken-GIF-images.patch=C2=A0 =C2=A0 |=C2=A0 =
=C2=A00<br>
=C2=A0...figure-support-c-0x-standard-for-directfd.patch |=C2=A0 =C2=A00<br=
>
=C2=A0.../Fix-QWSLock-invalid-argument-logs.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A00<br>
=C2=A0.../add_check_for_aarch64_32.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
=C2=A0.../qt4/{qt4-4.8.6 =3D&gt; qt4-4.8.7}/g++.conf=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A00<br>
=C2=A0.../qt4/{qt4-4.8.6 =3D&gt; qt4-4.8.7}/linux.conf=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A00<br>
=C2=A0.../recipes-qt/qt4/{qt4-4.8.6 =3D&gt; qt4-4.8.7}/qte.sh |=C2=A0 =C2=
=A00<br>
=C2=A0meta/recipes-qt/qt4/qt4-embedded.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 -<br>
=C2=A0...<a href=3D"http://qt4-embedded_4.8.6.bb" target=3D"_blank">qt4-emb=
edded_4.8.6.bb</a> =3D&gt; <a href=3D"http://qt4-embedded_4.8.7.bb" target=
=3D"_blank">qt4-embedded_4.8.7.bb</a>} |=C2=A0 =C2=A00<br>
=C2=A0meta/recipes-qt/qt4/qt4-native.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 -<br>
=C2=A0meta/recipes-qt/qt4/<a href=3D"http://qt4-native_4.8.6.bb" target=3D"=
_blank">qt4-native_4.8.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A06 -<br>
=C2=A0meta/recipes-qt/qt4/<a href=3D"http://qt4-native_4.8.7.bb" target=3D"=
_blank">qt4-native_4.8.7.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A06 +<br>
=C2=A0meta/recipes-qt/qt4/qt4-x11-free.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 -<br>
=C2=A0...<a href=3D"http://qt4-x11-free_4.8.6.bb" target=3D"_blank">qt4-x11=
-free_4.8.6.bb</a> =3D&gt; <a href=3D"http://qt4-x11-free_4.8.7.bb" target=
=3D"_blank">qt4-x11-free_4.8.7.bb</a>} |=C2=A0 =C2=A00<br>
=C2=A043 files changed, 35 insertions(+), 773 deletions(-)<br>
=C2=A0rename meta/recipes-qt/qt4/{<a href=3D"http://nativesdk-qt4-tools_4.8=
.6.bb" target=3D"_blank">nativesdk-qt4-tools_4.8.6.bb</a> =3D&gt; <a href=
=3D"http://nativesdk-qt4-tools_4.8.7.bb" target=3D"_blank">nativesdk-qt4-to=
ols_4.8.7.bb</a>} (44%)<br>
=C2=A0delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0029-aarch64_arm64_f=
ix_arch_detection.patch<br>
=C2=A0delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0030-aarch64_arm64_q=
atomic_support.patch<br>
=C2=A0delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0031-aarch64_arm64_m=
kspecs.patch<br>
=C2=A0delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0032-aarch64_add_hea=
der.patch<br>
=C2=A0delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0034-Fix-a-division-=
by-zero-when-processing-malformed-BMP.patch<br>
=C2=A0rename meta/recipes-qt/qt4/{qt4-4.8.6.inc =3D&gt; qt4-4.8.7.inc} (87%=
)<br>
=C2=A0rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D&gt; qt4-4.8.7}/0001-qlibrar=
yinfo-allow-to-set-qt.conf-from-the-outside-u.patch (100%)<br>
=C2=A0rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D&gt; qt4-4.8.7}/0002-qkbdtty=
_qws-fix-build-with-old-kernel-headers.patch (100%)<br>
=C2=A0rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D&gt; qt4-4.8.7}/0003-webkit2=
-set-OUTPUT_DIR-value-if-empty.patch (100%)<br>
=C2=A0rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D&gt; qt4-4.8.7}/0004-configu=
re-qmake-is-already-built-in-qt4-tools-native.patch (100%)<br>
=C2=A0rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D&gt; qt4-4.8.7}/0005-configu=
re-set-LFLAGS-to-pick-up-zlib-from-staging.patch (100%)<br>
=C2=A0rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D&gt; qt4-4.8.7}/0006-configu=
re-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch (100%)<br>
=C2=A0rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D&gt; qt4-4.8.7}/0007-dbus-Re=
move-const-usage-that-causes-compile-failure-.patch (100%)<br>
=C2=A0rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D&gt; qt4-4.8.7}/0008-qmake.p=
ro-Allow-building-a-separate-qmake-for-the-ta.patch (100%)<br>
=C2=A0rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D&gt; qt4-4.8.7}/0009-qmake-f=
ix-source-file-references-in-qmake.pri.patch (100%)<br>
=C2=A0rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D&gt; qt4-4.8.7}/0010-configu=
re-Hack-to-not-use-the-pg_config-of-the-host-.patch (65%)<br>
=C2=A0rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D&gt; qt4-4.8.7}/0011-freetyp=
e-host-includes.patch (100%)<br>
=C2=A0rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D&gt; qt4-4.8.7}/0012-Add-2bp=
p-support.patch (100%)<br>
=C2=A0rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D&gt; qt4-4.8.7}/0013-configu=
re-add-crossarch-option.patch (76%)<br>
=C2=A0rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D&gt; qt4-4.8.7}/0014-transla=
tions-fix-phony-translation-linking-error.patch (100%)<br>
=C2=A0rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D&gt; qt4-4.8.7}/0015-configu=
re-add-nostrip-for-debug-packages.patch (100%)<br>
=C2=A0rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D&gt; qt4-4.8.7}/0016-configu=
re-eval-QMAKE_CXX.patch (100%)<br>
=C2=A0rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D&gt; qt4-4.8.7}/0017-configu=
re-ensure-we-identify-the-compiler-as-g-in-co.patch (100%)<br>
=C2=A0rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D&gt; qt4-4.8.7}/0018-configu=
re-make-pulseaudio-a-configurable-option.patch (100%)<br>
=C2=A0rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D&gt; qt4-4.8.7}/0019-Fixes-f=
or-gcc-4.7.0-particularly-on-qemux86.patch (100%)<br>
=C2=A0rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D&gt; qt4-4.8.7}/0021-configu=
re-make-qt4-native-work-with-long-building-pa.patch (100%)<br>
=C2=A0rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D&gt; qt4-4.8.7}/0027-tools.p=
ro-disable-qmeegographicssystemhelper.patch (100%)<br>
=C2=A0rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D&gt; qt4-4.8.7}/0028-Don-t-c=
rash-on-broken-GIF-images.patch (100%)<br>
=C2=A0rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D&gt; qt4-4.8.7}/0033-configu=
re-support-c-0x-standard-for-directfd.patch (100%)<br>
=C2=A0rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D&gt; qt4-4.8.7}/Fix-QWSLock-=
invalid-argument-logs.patch (100%)<br>
=C2=A0rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D&gt; qt4-4.8.7}/add_check_fo=
r_aarch64_32.patch (100%)<br>
=C2=A0rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D&gt; qt4-4.8.7}/g++.conf (10=
0%)<br>
=C2=A0rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D&gt; qt4-4.8.7}/linux.conf (=
100%)<br>
=C2=A0rename meta/recipes-qt/qt4/{qt4-4.8.6 =3D&gt; qt4-4.8.7}/qte.sh (100%=
)<br>
=C2=A0rename meta/recipes-qt/qt4/{<a href=3D"http://qt4-embedded_4.8.6.bb" =
target=3D"_blank">qt4-embedded_4.8.6.bb</a> =3D&gt; <a href=3D"http://qt4-e=
mbedded_4.8.7.bb" target=3D"_blank">qt4-embedded_4.8.7.bb</a>} (100%)<br>
=C2=A0delete mode 100644 meta/recipes-qt/qt4/<a href=3D"http://qt4-native_4=
.8.6.bb" target=3D"_blank">qt4-native_4.8.6.bb</a><br>
=C2=A0create mode 100644 meta/recipes-qt/qt4/<a href=3D"http://qt4-native_4=
.8.7.bb" target=3D"_blank">qt4-native_4.8.7.bb</a><br>
=C2=A0rename meta/recipes-qt/qt4/{<a href=3D"http://qt4-x11-free_4.8.6.bb" =
target=3D"_blank">qt4-x11-free_4.8.6.bb</a> =3D&gt; <a href=3D"http://qt4-x=
11-free_4.8.7.bb" target=3D"_blank">qt4-x11-free_4.8.7.bb</a>} (100%)<br>
<br>
diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc b/meta/recipes-qt/=
qt4/nativesdk-qt4-tools.inc<br>
index 1c9ee2e..aa84e3d 100644<br>
--- a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc<br>
+++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc<br>
@@ -4,8 +4,6 @@ SECTION =3D &quot;libs&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://qt-project.org/" target=3D"_blan=
k">http://qt-project.org/</a>&quot;<br>
=C2=A0LICENSE =3D &quot;LGPLv2.1 | GPLv3&quot;<br>
<br>
-INC_PR =3D &quot;r13&quot;<br>
-<br>
=C2=A0FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/qt4-${PV}:&quot;<br>
<br>
=C2=A0inherit nativesdk qmake2<br>
diff --git a/meta/recipes-qt/qt4/<a href=3D"http://nativesdk-qt4-tools_4.8.=
6.bb" target=3D"_blank">nativesdk-qt4-tools_4.8.6.bb</a> b/meta/recipes-qt/=
qt4/<a href=3D"http://nativesdk-qt4-tools_4.8.7.bb" target=3D"_blank">nativ=
esdk-qt4-tools_4.8.7.bb</a><br>
similarity index 44%<br>
rename from meta/recipes-qt/qt4/<a href=3D"http://nativesdk-qt4-tools_4.8.6=
.bb" target=3D"_blank">nativesdk-qt4-tools_4.8.6.bb</a><br>
rename to meta/recipes-qt/qt4/<a href=3D"http://nativesdk-qt4-tools_4.8.7.b=
b" target=3D"_blank">nativesdk-qt4-tools_4.8.7.bb</a><br>
index 00526b8..90ba07c 100644<br>
--- a/meta/recipes-qt/qt4/<a href=3D"http://nativesdk-qt4-tools_4.8.6.bb" t=
arget=3D"_blank">nativesdk-qt4-tools_4.8.6.bb</a><br>
+++ b/meta/recipes-qt/qt4/<a href=3D"http://nativesdk-qt4-tools_4.8.7.bb" t=
arget=3D"_blank">nativesdk-qt4-tools_4.8.7.bb</a><br>
@@ -2,5 +2,5 @@ require nativesdk-qt4-tools.inc<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://0009-qmake-fix-source-file-references-in-qm=
ake.pri.patch&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;2edbe4d6c2eff33ef91732602f3518eb&quot;<br>
-SRC_URI[sha256sum] =3D &quot;8b14dd91b52862e09b8e6a963507b74bc2580787d171f=
eda197badfa7034032c&quot;<br>
+SRC_URI[md5sum] =3D &quot;d990ee66bf7ab0c785589776f35ba6ad&quot;<br>
+SRC_URI[sha256sum] =3D &quot;e2882295097e47fe089f8ac741a95fef47e0a73a3f3cd=
f21b56990638f626ea0&quot;<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0029-aarch64_arm64_fix_arch_dete=
ction.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0029-aarch64_arm64_fix_arch_det=
ection.patch<br>
deleted file mode 100644<br>
index fbd32b1..0000000<br>
--- a/meta/recipes-qt/qt4/qt4-4.8.6/0029-aarch64_arm64_fix_arch_detection.p=
atch<br>
+++ /dev/null<br>
@@ -1,53 +0,0 @@<br>
-From 800abbba658203fc8e746e3fc780a297cd4110cf Mon Sep 17 00:00:00 2001<br>
-From: =3D?UTF-8?q?Lisandro=3D20Dami=3DC3=3DA1n=3D20Nicanor=3D20P=3DC3=3DA9=
rez=3D20Meyer?=3D<br>
- &lt;<a href=3D"mailto:perezmeyer@gmail.com">perezmeyer@gmail.com</a>&gt;<=
br>
-Date: Wed, 20 Aug 2014 17:52:49 -0300<br>
-Subject: [PATCH] Fix AArch64/arm64 detection.<br>
-<br>
-The detection needs to go before arm, else the system will detect AArch64/=
arm64<br>
-as arm.<br>
-<br>
-This patch comes from Wookey, he has agreed to put it under BSD or Expat<b=
r>
-to allow it&#39;s inclusion in here:<br>
-&lt;<a href=3D"https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D735488#=
255" target=3D"_blank">https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D=
735488#255</a>&gt;<br>
-<br>
-Change-Id: Ic2171c03fca8bb871347940fa3a2bc467776f797<br>
-<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.=
kang@windriver.com</a>&gt;<br>
----<br>
- configure | 12 ++++++------<br>
- 1 file changed, 6 insertions(+), 6 deletions(-)<br>
-<br>
-diff --git a/configure b/configure<br>
-index a9ba7c8..eb88b72 100755<br>
---- a/configure<br>
-+++ b/configure<br>
-@@ -3241,17 +3241,17 @@ if [ -z &quot;${CFG_HOST_ARCH}&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0CFG_HOST_ARCH=3Ds390<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
--=C2=A0 =C2=A0 *:*:arm*)<br>
-+=C2=A0 =C2=A0 *:*:aarch64*|*:*:arm64*)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$OPT_VERBOSE&quot; =3D &quot;=
yes&quot; ]; then<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;=C2=A0 =C2=A0 ARM (a=
rm)&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;=C2=A0 =C2=A0 AArch6=
4 (aarch64)&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 CFG_HOST_ARCH=3Darm<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CFG_HOST_ARCH=3Daarch64<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
--=C2=A0 =C2=A0 *:*:aarch64*)<br>
-+=C2=A0 =C2=A0 *:*:arm*)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$OPT_VERBOSE&quot; =3D &quot;=
yes&quot; ]; then<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;=C2=A0 =C2=A0 AArch6=
4 (aarch64)&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;=C2=A0 =C2=A0 ARM (a=
rm)&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 CFG_HOST_ARCH=3Daarch64<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CFG_HOST_ARCH=3Darm<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0Linux:*:sparc*)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$OPT_VERBOSE&quot; =3D &quot;=
yes&quot; ]; then<br>
---<br>
-2.1.0<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0030-aarch64_arm64_qatomic_suppo=
rt.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0030-aarch64_arm64_qatomic_support=
.patch<br>
deleted file mode 100644<br>
index ba4c2a6..0000000<br>
--- a/meta/recipes-qt/qt4/qt4-4.8.6/0030-aarch64_arm64_qatomic_support.patc=
h<br>
+++ /dev/null<br>
@@ -1,491 +0,0 @@<br>
-From 294010b562c9846bb2bc4ee9c63ff78adc7c1f4f Mon Sep 17 00:00:00 2001<br>
-From: =3D?UTF-8?q?Lisandro=3D20Dami=3DC3=3DA1n=3D20Nicanor=3D20P=3DC3=3DA9=
rez=3D20Meyer?=3D<br>
- &lt;<a href=3D"mailto:perezmeyer@gmail.com">perezmeyer@gmail.com</a>&gt;<=
br>
-Date: Sat, 15 Mar 2014 15:40:49 -0300<br>
-Subject: [PATCH] Add qatomic support for AArch64 (aka arm64).<br>
-<br>
-Patch by Mark Salter &lt;<a href=3D"mailto:msalter@redhat.com">msalter@red=
hat.com</a>&gt;<br>
-licensed under BSD:<br>
-<br>
-&lt;<a href=3D"https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D735488#=
195" target=3D"_blank">https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D=
735488#195</a>&gt;<br>
-<br>
-This patch is known to not be the most correct way<br>
-to implement them, as it seems to be possible to do it in a faster way,<br=
>
-but should work non the less until we can provide something better.<br>
-<br>
-Change-Id: Ib392b27dc54691fd4c2ea9896240ad71fb8128cc<br>
-<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.=
kang@windriver.com</a>&gt;<br>
-<br>
----<br>
- src/corelib/arch/aarch64/arch.pri=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A04 +<br>
- src/corelib/arch/aarch64/qatomic_aarch64.cpp |=C2=A0 70 ++++++<br>
- src/corelib/arch/arch.pri=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
- src/corelib/arch/qatomic_aarch64.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 335 +++++++++++++++++++++++++++<br>
- src/corelib/arch/qatomic_arch.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +<br>
- 5 files changed, 414 insertions(+), 1 deletion(-)<br>
- create mode 100644 src/corelib/arch/aarch64/arch.pri<br>
- create mode 100644 src/corelib/arch/aarch64/qatomic_aarch64.cpp<br>
- create mode 100644 src/corelib/arch/qatomic_aarch64.h<br>
-<br>
-diff --git a/src/corelib/arch/aarch64/arch.pri b/src/corelib/arch/aarch64/=
arch.pri<br>
-new file mode 100644<br>
-index 0000000..63523d9<br>
---- /dev/null<br>
-+++ b/src/corelib/arch/aarch64/arch.pri<br>
-@@ -0,0 +1,4 @@<br>
-+#<br>
-+# AArch64 architecture<br>
-+#<br>
-+SOURCES +=3D $$QT_ARCH_CPP/qatomic_aarch64.cpp<br>
-diff --git a/src/corelib/arch/aarch64/qatomic_aarch64.cpp b/src/corelib/ar=
ch/aarch64/qatomic_aarch64.cpp<br>
-new file mode 100644<br>
-index 0000000..fc851b9<br>
---- /dev/null<br>
-+++ b/src/corelib/arch/aarch64/qatomic_aarch64.cpp<br>
-@@ -0,0 +1,70 @@<br>
-+/************************************************************************=
****<br>
-+**<br>
-+** Copyright (C) 2012, 2013 Digia Plc and/or its subsidiary(-ies).<br>
-+** Contact: <a href=3D"http://www.qt-project.org/legal" target=3D"_blank"=
>http://www.qt-project.org/legal</a><br>
-+**<br>
-+** This file is part of the QtCore module of the Qt Toolkit.<br>
-+**<br>
-+** $QT_BEGIN_LICENSE:LGPL$<br>
-+** Commercial License Usage<br>
-+** Licensees holding valid commercial Qt licenses may use this file in<br=
>
-+** accordance with the commercial license agreement provided with the<br>
-+** Software or, alternatively, in accordance with the terms contained in<=
br>
-+** a written agreement between you and Digia.=C2=A0 For licensing terms a=
nd<br>
-+** conditions see <a href=3D"http://qt.digia.com/licensing" target=3D"_bl=
ank">http://qt.digia.com/licensing</a>.=C2=A0 For further information<br>
-+** use the contact form at <a href=3D"http://qt.digia.com/contact-us" tar=
get=3D"_blank">http://qt.digia.com/contact-us</a>.<br>
-+**<br>
-+** GNU Lesser General Public License Usage<br>
-+** Alternatively, this file may be used under the terms of the GNU Lesser=
<br>
-+** General Public License version 2.1 as published by the Free Software<b=
r>
-+** Foundation and appearing in the file LICENSE.LGPL included in the<br>
-+** packaging of this file.=C2=A0 Please review the following information =
to<br>
-+** ensure the GNU Lesser General Public License version 2.1 requirements<=
br>
-+** will be met: <a href=3D"http://www.gnu.org/licenses/old-licenses/lgpl-=
2.1.html" target=3D"_blank">http://www.gnu.org/licenses/old-licenses/lgpl-2=
.1.html</a>.<br>
-+**<br>
-+** In addition, as a special exception, Digia gives you certain additiona=
l<br>
-+** rights.=C2=A0 These rights are described in the Digia Qt LGPL Exceptio=
n<br>
-+** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.<=
br>
-+**<br>
-+** GNU General Public License Usage<br>
-+** Alternatively, this file may be used under the terms of the GNU<br>
-+** General Public License version 3.0 as published by the Free Software<b=
r>
-+** Foundation and appearing in the file LICENSE.GPL included in the<br>
-+** packaging of this file.=C2=A0 Please review the following information =
to<br>
-+** ensure the GNU General Public License version 3.0 requirements will be=
<br>
-+** met: <a href=3D"http://www.gnu.org/copyleft/gpl.html" target=3D"_blank=
">http://www.gnu.org/copyleft/gpl.html</a>.<br>
-+**<br>
-+**<br>
-+** $QT_END_LICENSE$<br>
-+**<br>
-+*************************************************************************=
***/<br>
-+<br>
-+#include &lt;QtCore/qglobal.h&gt;<br>
-+<br>
-+#include &lt;unistd.h&gt;<br>
-+#ifdef _POSIX_PRIORITY_SCHEDULING<br>
-+# include &lt;sched.h&gt;<br>
-+#endif<br>
-+#include &lt;time.h&gt;<br>
-+<br>
-+QT_BEGIN_NAMESPACE<br>
-+<br>
-+QT_USE_NAMESPACE<br>
-+<br>
-+Q_CORE_EXPORT void qt_atomic_yield(int *count)<br>
-+{<br>
-+#ifdef _POSIX_PRIORITY_SCHEDULING<br>
-+=C2=A0 =C2=A0 if ((*count)++ &lt; 50) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sched_yield();<br>
-+=C2=A0 =C2=A0 } else<br>
-+#endif<br>
-+=C2=A0 =C2=A0 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct timespec tm;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tm.tv_sec =3D 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tm.tv_nsec =3D 2000001;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 nanosleep(&amp;tm, NULL);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *count =3D 0;<br>
-+=C2=A0 =C2=A0 }<br>
-+}<br>
-+<br>
-+QT_END_NAMESPACE<br>
-diff --git a/src/corelib/arch/arch.pri b/src/corelib/arch/arch.pri<br>
-index cd23e5e..f50fca7 100644<br>
---- a/src/corelib/arch/arch.pri<br>
-+++ b/src/corelib/arch/arch.pri<br>
-@@ -31,7 +31,9 @@ integrity:HEADERS +=3D arch/qatomic_integrity.h<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 arch/qatomic_s390.h \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 arch/qatomic_x86_64.h \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 arch/qatomic_sh.h \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0arch/qatomic_sh4a.h<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0arch/qatomic_sh4a.h \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0arch/qatomic_aarch64.h \<br>
-+<br>
-<br>
- QT_ARCH_CPP =3D $$QT_SOURCE_TREE/src/corelib/arch/$$QT_ARCH<br>
- DEPENDPATH +=3D $$QT_ARCH_CPP<br>
-diff --git a/src/corelib/arch/qatomic_aarch64.h b/src/corelib/arch/qatomic=
_aarch64.h<br>
-new file mode 100644<br>
-index 0000000..de61ca8<br>
---- /dev/null<br>
-+++ b/src/corelib/arch/qatomic_aarch64.h<br>
-@@ -0,0 +1,335 @@<br>
-+/************************************************************************=
****<br>
-+**<br>
-+** Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).<br>
-+** Contact: <a href=3D"http://www.qt-project.org/legal" target=3D"_blank"=
>http://www.qt-project.org/legal</a><br>
-+**<br>
-+** This file is part of the QtCore module of the Qt Toolkit.<br>
-+**<br>
-+** $QT_BEGIN_LICENSE:LGPL$<br>
-+** Commercial License Usage<br>
-+** Licensees holding valid commercial Qt licenses may use this file in<br=
>
-+** accordance with the commercial license agreement provided with the<br>
-+** Software or, alternatively, in accordance with the terms contained in<=
br>
-+** a written agreement between you and Digia.=C2=A0 For licensing terms a=
nd<br>
-+** conditions see <a href=3D"http://qt.digia.com/licensing" target=3D"_bl=
ank">http://qt.digia.com/licensing</a>.=C2=A0 For further information<br>
-+** use the contact form at <a href=3D"http://qt.digia.com/contact-us" tar=
get=3D"_blank">http://qt.digia.com/contact-us</a>.<br>
-+**<br>
-+** GNU Lesser General Public License Usage<br>
-+** Alternatively, this file may be used under the terms of the GNU Lesser=
<br>
-+** General Public License version 2.1 as published by the Free Software<b=
r>
-+** Foundation and appearing in the file LICENSE.LGPL included in the<br>
-+** packaging of this file.=C2=A0 Please review the following information =
to<br>
-+** ensure the GNU Lesser General Public License version 2.1 requirements<=
br>
-+** will be met: <a href=3D"http://www.gnu.org/licenses/old-licenses/lgpl-=
2.1.html" target=3D"_blank">http://www.gnu.org/licenses/old-licenses/lgpl-2=
.1.html</a>.<br>
-+**<br>
-+** In addition, as a special exception, Digia gives you certain additiona=
l<br>
-+** rights.=C2=A0 These rights are described in the Digia Qt LGPL Exceptio=
n<br>
-+** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.<=
br>
-+**<br>
-+** GNU General Public License Usage<br>
-+** Alternatively, this file may be used under the terms of the GNU<br>
-+** General Public License version 3.0 as published by the Free Software<b=
r>
-+** Foundation and appearing in the file LICENSE.GPL included in the<br>
-+** packaging of this file.=C2=A0 Please review the following information =
to<br>
-+** ensure the GNU General Public License version 3.0 requirements will be=
<br>
-+** met: <a href=3D"http://www.gnu.org/copyleft/gpl.html" target=3D"_blank=
">http://www.gnu.org/copyleft/gpl.html</a>.<br>
-+**<br>
-+**<br>
-+** $QT_END_LICENSE$<br>
-+**<br>
-+*************************************************************************=
***/<br>
-+<br>
-+#ifndef QATOMIC_AARCH64_H<br>
-+#define QATOMIC_AARCH64_H<br>
-+<br>
-+QT_BEGIN_HEADER<br>
-+<br>
-+QT_BEGIN_NAMESPACE<br>
-+<br>
-+#define Q_ATOMIC_INT_REFERENCE_COUNTING_IS_ALWAYS_NATIVE<br>
-+<br>
-+inline bool QBasicAtomicInt::isReferenceCountingNative()<br>
-+{ return true; }<br>
-+inline bool QBasicAtomicInt::isReferenceCountingWaitFree()<br>
-+{ return false; }<br>
-+<br>
-+#define Q_ATOMIC_INT_TEST_AND_SET_IS_ALWAYS_NATIVE<br>
-+<br>
-+inline bool QBasicAtomicInt::isTestAndSetNative()<br>
-+{ return true; }<br>
-+inline bool QBasicAtomicInt::isTestAndSetWaitFree()<br>
-+{ return false; }<br>
-+<br>
-+#define Q_ATOMIC_INT_FETCH_AND_STORE_IS_ALWAYS_NATIVE<br>
-+<br>
-+inline bool QBasicAtomicInt::isFetchAndStoreNative()<br>
-+{ return true; }<br>
-+inline bool QBasicAtomicInt::isFetchAndStoreWaitFree()<br>
-+{ return false; }<br>
-+<br>
-+#define Q_ATOMIC_INT_FETCH_AND_ADD_IS_ALWAYS_NATIVE<br>
-+<br>
-+inline bool QBasicAtomicInt::isFetchAndAddNative()<br>
-+{ return true; }<br>
-+inline bool QBasicAtomicInt::isFetchAndAddWaitFree()<br>
-+{ return false; }<br>
-+<br>
-+#define Q_ATOMIC_POINTER_TEST_AND_SET_IS_ALWAYS_NATIVE<br>
-+<br>
-+template &lt;typename T&gt;<br>
-+Q_INLINE_TEMPLATE bool QBasicAtomicPointer&lt;T&gt;::isTestAndSetNative()=
<br>
-+{ return true; }<br>
-+template &lt;typename T&gt;<br>
-+Q_INLINE_TEMPLATE bool QBasicAtomicPointer&lt;T&gt;::isTestAndSetWaitFree=
()<br>
-+{ return false; }<br>
-+<br>
-+#define Q_ATOMIC_POINTER_FETCH_AND_STORE_IS_ALWAYS_NATIVE<br>
-+<br>
-+template &lt;typename T&gt;<br>
-+Q_INLINE_TEMPLATE bool QBasicAtomicPointer&lt;T&gt;::isFetchAndStoreNativ=
e()<br>
-+{ return true; }<br>
-+template &lt;typename T&gt;<br>
-+Q_INLINE_TEMPLATE bool QBasicAtomicPointer&lt;T&gt;::isFetchAndStoreWaitF=
ree()<br>
-+{ return false; }<br>
-+<br>
-+#define Q_ATOMIC_POINTER_FETCH_AND_ADD_IS_ALWAYS_NATIVE<br>
-+<br>
-+template &lt;typename T&gt;<br>
-+Q_INLINE_TEMPLATE bool QBasicAtomicPointer&lt;T&gt;::isFetchAndAddNative(=
)<br>
-+{ return true; }<br>
-+template &lt;typename T&gt;<br>
-+Q_INLINE_TEMPLATE bool QBasicAtomicPointer&lt;T&gt;::isFetchAndAddWaitFre=
e()<br>
-+{ return false; }<br>
-+<br>
-+#ifndef Q_DATA_MEMORY_BARRIER<br>
-+# define Q_DATA_MEMORY_BARRIER asm volatile(&quot;dmb sy\n&quot;:::&quot;=
memory&quot;)<br>
-+#endif<br>
-+#ifndef Q_COMPILER_MEMORY_BARRIER<br>
-+# define Q_COMPILER_MEMORY_BARRIER asm volatile(&quot;&quot;:::&quot;memo=
ry&quot;)<br>
-+#endif<br>
-+<br>
-+inline bool QBasicAtomicInt::ref()<br>
-+{<br>
-+=C2=A0 =C2=A0 int newValue;<br>
-+<br>
-+=C2=A0 =C2=A0 Q_COMPILER_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 newValue =3D __atomic_add_fetch(&amp;_q_value, 1, __ATOMIC_=
ACQ_REL);<br>
-+=C2=A0 =C2=A0 Q_COMPILER_MEMORY_BARRIER;<br>
-+<br>
-+=C2=A0 =C2=A0 return newValue !=3D 0;<br>
-+}<br>
-+<br>
-+inline bool QBasicAtomicInt::deref()<br>
-+{<br>
-+=C2=A0 =C2=A0 int newValue;<br>
-+<br>
-+=C2=A0 =C2=A0 Q_COMPILER_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 newValue =3D __atomic_sub_fetch(&amp;_q_value, 1, __ATOMIC_=
ACQ_REL);<br>
-+=C2=A0 =C2=A0 Q_COMPILER_MEMORY_BARRIER;<br>
-+<br>
-+=C2=A0 =C2=A0 return newValue !=3D 0;<br>
-+}<br>
-+<br>
-+inline bool QBasicAtomicInt::testAndSetRelaxed(int expectedValue, int new=
Value)<br>
-+{<br>
-+=C2=A0 =C2=A0 bool val;<br>
-+<br>
-+=C2=A0 =C2=A0 Q_COMPILER_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 val =3D=C2=A0 __atomic_compare_exchange_n (&amp;_q_value, &=
amp;expectedValue, newValue,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 false, _=
_ATOMIC_RELAXED, __ATOMIC_RELAXED);<br>
-+=C2=A0 =C2=A0 Q_COMPILER_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 return val;<br>
-+}<br>
-+<br>
-+inline int QBasicAtomicInt::fetchAndStoreRelaxed(int newValue)<br>
-+{<br>
-+=C2=A0 =C2=A0 int val;<br>
-+=C2=A0 =C2=A0 Q_COMPILER_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 val =3D __atomic_exchange_n(&amp;_q_value, newValue, __ATOM=
IC_RELAXED);<br>
-+=C2=A0 =C2=A0 Q_COMPILER_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 return val;<br>
-+}<br>
-+<br>
-+inline int QBasicAtomicInt::fetchAndAddRelaxed(int valueToAdd)<br>
-+{<br>
-+=C2=A0 =C2=A0 int val;<br>
-+=C2=A0 =C2=A0 Q_COMPILER_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 val =3D __atomic_fetch_add(&amp;_q_value, valueToAdd, __ATO=
MIC_RELAXED);<br>
-+=C2=A0 =C2=A0 Q_COMPILER_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 return val;<br>
-+}<br>
-+<br>
-+template &lt;typename T&gt;<br>
-+Q_INLINE_TEMPLATE bool QBasicAtomicPointer&lt;T&gt;::testAndSetRelaxed(T =
*expectedValue, T *newValue)<br>
-+{<br>
-+=C2=A0 =C2=A0 bool val;<br>
-+=C2=A0 =C2=A0 Q_COMPILER_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 val =3D=C2=A0 __atomic_compare_exchange_n (&amp;_q_value, &=
amp;expectedValue, newValue,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 false, _=
_ATOMIC_RELAXED, __ATOMIC_RELAXED);<br>
-+=C2=A0 =C2=A0 Q_COMPILER_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 return val;<br>
-+}<br>
-+<br>
-+template &lt;typename T&gt;<br>
-+Q_INLINE_TEMPLATE T *QBasicAtomicPointer&lt;T&gt;::fetchAndStoreRelaxed(T=
 *newValue)<br>
-+{<br>
-+=C2=A0 =C2=A0 T *val;<br>
-+=C2=A0 =C2=A0 Q_COMPILER_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 val =3D __atomic_exchange_n(&amp;_q_value, newValue, __ATOM=
IC_RELAXED);<br>
-+=C2=A0 =C2=A0 Q_COMPILER_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 return val;<br>
-+}<br>
-+<br>
-+template &lt;typename T&gt;<br>
-+Q_INLINE_TEMPLATE T *QBasicAtomicPointer&lt;T&gt;::fetchAndAddRelaxed(qpt=
rdiff valueToAdd)<br>
-+{<br>
-+=C2=A0 =C2=A0 T *val;<br>
-+=C2=A0 =C2=A0 Q_COMPILER_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 val =3D __atomic_fetch_add(&amp;_q_value, valueToAdd, __ATO=
MIC_RELAXED);<br>
-+=C2=A0 =C2=A0 Q_COMPILER_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 return val;<br>
-+}<br>
-+<br>
-+inline bool QBasicAtomicInt::testAndSetAcquire(int expectedValue, int new=
Value)<br>
-+{<br>
-+=C2=A0 =C2=A0 bool returnValue =3D testAndSetRelaxed(expectedValue, newVa=
lue);<br>
-+=C2=A0 =C2=A0 Q_DATA_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 return returnValue;<br>
-+}<br>
-+<br>
-+inline bool QBasicAtomicInt::testAndSetRelease(int expectedValue, int new=
Value)<br>
-+{<br>
-+=C2=A0 =C2=A0 Q_DATA_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 return testAndSetRelaxed(expectedValue, newValue);<br>
-+}<br>
-+<br>
-+inline bool QBasicAtomicInt::testAndSetOrdered(int expectedValue, int new=
Value)<br>
-+{<br>
-+=C2=A0 =C2=A0 Q_DATA_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 bool returnValue =3D testAndSetRelaxed(expectedValue, newVa=
lue);<br>
-+=C2=A0 =C2=A0 Q_COMPILER_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 return returnValue;<br>
-+}<br>
-+<br>
-+inline int QBasicAtomicInt::fetchAndStoreAcquire(int newValue)<br>
-+{<br>
-+=C2=A0 =C2=A0 int returnValue =3D fetchAndStoreRelaxed(newValue);<br>
-+=C2=A0 =C2=A0 Q_DATA_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 return returnValue;<br>
-+}<br>
-+<br>
-+inline int QBasicAtomicInt::fetchAndStoreRelease(int newValue)<br>
-+{<br>
-+=C2=A0 =C2=A0 Q_DATA_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 return fetchAndStoreRelaxed(newValue);<br>
-+}<br>
-+<br>
-+inline int QBasicAtomicInt::fetchAndStoreOrdered(int newValue)<br>
-+{<br>
-+=C2=A0 =C2=A0 Q_DATA_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 int returnValue =3D fetchAndStoreRelaxed(newValue);<br>
-+=C2=A0 =C2=A0 Q_COMPILER_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 return returnValue;<br>
-+}<br>
-+<br>
-+inline int QBasicAtomicInt::fetchAndAddAcquire(int valueToAdd)<br>
-+{<br>
-+=C2=A0 =C2=A0 int returnValue =3D fetchAndAddRelaxed(valueToAdd);<br>
-+=C2=A0 =C2=A0 Q_DATA_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 return returnValue;<br>
-+}<br>
-+<br>
-+inline int QBasicAtomicInt::fetchAndAddRelease(int valueToAdd)<br>
-+{<br>
-+=C2=A0 =C2=A0 Q_DATA_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 return fetchAndAddRelaxed(valueToAdd);<br>
-+}<br>
-+<br>
-+inline int QBasicAtomicInt::fetchAndAddOrdered(int valueToAdd)<br>
-+{<br>
-+=C2=A0 =C2=A0 Q_DATA_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 int returnValue =3D fetchAndAddRelaxed(valueToAdd);<br>
-+=C2=A0 =C2=A0 Q_COMPILER_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 return returnValue;<br>
-+}<br>
-+<br>
-+template &lt;typename T&gt;<br>
-+Q_INLINE_TEMPLATE bool QBasicAtomicPointer&lt;T&gt;::testAndSetAcquire(T =
*expectedValue, T *newValue)<br>
-+{<br>
-+=C2=A0 =C2=A0 bool returnValue =3D testAndSetRelaxed(expectedValue, newVa=
lue);<br>
-+=C2=A0 =C2=A0 Q_DATA_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 return returnValue;<br>
-+}<br>
-+<br>
-+template &lt;typename T&gt;<br>
-+Q_INLINE_TEMPLATE bool QBasicAtomicPointer&lt;T&gt;::testAndSetRelease(T =
*expectedValue, T *newValue)<br>
-+{<br>
-+=C2=A0 =C2=A0 Q_DATA_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 return testAndSetRelaxed(expectedValue, newValue);<br>
-+}<br>
-+<br>
-+template &lt;typename T&gt;<br>
-+Q_INLINE_TEMPLATE bool QBasicAtomicPointer&lt;T&gt;::testAndSetOrdered(T =
*expectedValue, T *newValue)<br>
-+{<br>
-+=C2=A0 =C2=A0 Q_DATA_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 bool returnValue =3D testAndSetAcquire(expectedValue, newVa=
lue);<br>
-+=C2=A0 =C2=A0 Q_COMPILER_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 return returnValue;<br>
-+}<br>
-+<br>
-+template &lt;typename T&gt;<br>
-+Q_INLINE_TEMPLATE T *QBasicAtomicPointer&lt;T&gt;::fetchAndStoreAcquire(T=
 *newValue)<br>
-+{<br>
-+=C2=A0 =C2=A0 T *returnValue =3D fetchAndStoreRelaxed(newValue);<br>
-+=C2=A0 =C2=A0 Q_DATA_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 return returnValue;<br>
-+}<br>
-+<br>
-+template &lt;typename T&gt;<br>
-+Q_INLINE_TEMPLATE T *QBasicAtomicPointer&lt;T&gt;::fetchAndStoreRelease(T=
 *newValue)<br>
-+{<br>
-+=C2=A0 =C2=A0 Q_DATA_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 return fetchAndStoreRelaxed(newValue);<br>
-+}<br>
-+<br>
-+template &lt;typename T&gt;<br>
-+Q_INLINE_TEMPLATE T *QBasicAtomicPointer&lt;T&gt;::fetchAndStoreOrdered(T=
 *newValue)<br>
-+{<br>
-+=C2=A0 =C2=A0 Q_DATA_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 T *returnValue =3D fetchAndStoreRelaxed(newValue);<br>
-+=C2=A0 =C2=A0 Q_COMPILER_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 return returnValue;<br>
-+}<br>
-+<br>
-+template &lt;typename T&gt;<br>
-+Q_INLINE_TEMPLATE T *QBasicAtomicPointer&lt;T&gt;::fetchAndAddAcquire(qpt=
rdiff valueToAdd)<br>
-+{<br>
-+=C2=A0 =C2=A0 T *returnValue =3D fetchAndAddRelaxed(valueToAdd);<br>
-+=C2=A0 =C2=A0 Q_DATA_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 return returnValue;<br>
-+}<br>
-+<br>
-+template &lt;typename T&gt;<br>
-+Q_INLINE_TEMPLATE T *QBasicAtomicPointer&lt;T&gt;::fetchAndAddRelease(qpt=
rdiff valueToAdd)<br>
-+{<br>
-+=C2=A0 =C2=A0 Q_DATA_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 return fetchAndAddRelaxed(valueToAdd);<br>
-+}<br>
-+<br>
-+template &lt;typename T&gt;<br>
-+Q_INLINE_TEMPLATE T *QBasicAtomicPointer&lt;T&gt;::fetchAndAddOrdered(qpt=
rdiff valueToAdd)<br>
-+{<br>
-+=C2=A0 =C2=A0 Q_DATA_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 T *returnValue =3D fetchAndAddRelaxed(valueToAdd);<br>
-+=C2=A0 =C2=A0 Q_COMPILER_MEMORY_BARRIER;<br>
-+=C2=A0 =C2=A0 return returnValue;<br>
-+}<br>
-+<br>
-+#undef Q_DATA_MEMORY_BARRIER<br>
-+#undef Q_COMPILER_MEMORY_BARRIER<br>
-+<br>
-+QT_END_NAMESPACE<br>
-+<br>
-+QT_END_HEADER<br>
-+<br>
-+#endif // QATOMIC_AARCH64_H<br>
-diff --git a/src/corelib/arch/qatomic_arch.h b/src/corelib/arch/qatomic_ar=
ch.h<br>
-index 141726c..3e96926 100644<br>
---- a/src/corelib/arch/qatomic_arch.h<br>
-+++ b/src/corelib/arch/qatomic_arch.h<br>
-@@ -94,6 +94,8 @@ QT_BEGIN_HEADER<br>
- #=C2=A0 include &quot;QtCore/qatomic_sh4a.h&quot;<br>
- #elif defined(QT_ARCH_NACL)<br>
- #=C2=A0 include &quot;QtCore/qatomic_generic.h&quot;<br>
-+#elif defined(QT_ARCH_AARCH64)<br>
-+#=C2=A0 include &quot;QtCore/qatomic_aarch64.h&quot;<br>
- #else<br>
- #=C2=A0 error &quot;Qt has not been ported to this architecture&quot;<br>
- #endif<br>
---<br>
-2.1.0<br>
-<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0031-aarch64_arm64_mkspecs.patch=
 b/meta/recipes-qt/qt4/qt4-4.8.6/0031-aarch64_arm64_mkspecs.patch<br>
deleted file mode 100644<br>
index a01e7ad..0000000<br>
--- a/meta/recipes-qt/qt4/qt4-4.8.6/0031-aarch64_arm64_mkspecs.patch<br>
+++ /dev/null<br>
@@ -1,124 +0,0 @@<br>
-From 7090fc80ff630712a90de92403190f647dd38a39 Mon Sep 17 00:00:00 2001<br>
-From: =3D?UTF-8?q?Lisandro=3D20Dami=3DC3=3DA1n=3D20Nicanor=3D20P=3DC3=3DA9=
rez=3D20Meyer?=3D<br>
- &lt;<a href=3D"mailto:perezmeyer@gmail.com">perezmeyer@gmail.com</a>&gt;<=
br>
-Date: Sat, 15 Mar 2014 15:35:00 -0300<br>
-Subject: [PATCH] mkspecs for AArch64 (aka arm64).<br>
-<br>
-Patch by Marcin Juszkiewicz &lt;<a href=3D"mailto:marcin@juszkiewicz.com.p=
l">marcin@juszkiewicz.com.pl</a>&gt;<br>
-licensed under either Public Domain or BSD:<br>
-<br>
-&lt;<a href=3D"https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D735488#=
179" target=3D"_blank">https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D=
735488#179</a>&gt;<br>
-<br>
-Change-Id: I21f17953234cfb176bac023e52ecdc927fc5c1a9<br>
-<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.=
kang@windriver.com</a>&gt;<br>
-<br>
----<br>
- configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +++<br>
- mkspecs/linux-g++-aarch64/qmake.conf=C2=A0 =C2=A0 =C2=A0 | 27 +++++++++++=
+++++++++<br>
- mkspecs/linux-g++-aarch64/qplatformdefs.h | 42 ++++++++++++++++++++++++++=
+++++<br>
- 3 files changed, 72 insertions(+)<br>
- create mode 100644 mkspecs/linux-g++-aarch64/qmake.conf<br>
- create mode 100644 mkspecs/linux-g++-aarch64/qplatformdefs.h<br>
-<br>
-diff --git a/configure b/configure<br>
-index a9ba7c8..e57d053 100755<br>
---- a/configure<br>
-+++ b/configure<br>
-@@ -2808,6 +2808,9 @@ if [ &quot;$CFG_EMBEDDED&quot; !=3D &quot;no&quot; ]=
; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*86_64)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PLATFORM=3Dq=
ws/linux-x86_64-g++<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aarch64)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PLATFORM=3Dlinux-=
aarch64-g++<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PLATFORM=3Dq=
ws/linux-generic-g++<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-diff --git a/mkspecs/linux-g++-aarch64/qmake.conf b/mkspecs/linux-g++-aarc=
h64/qmake.conf<br>
-new file mode 100644<br>
-index 0000000..ebc0a92<br>
---- /dev/null<br>
-+++ b/mkspecs/linux-g++-aarch64/qmake.conf<br>
-@@ -0,0 +1,27 @@<br>
-+#<br>
-+# qmake configuration for linux-g++<br>
-+#<br>
-+# Written for GNU/Linux platforms that have both lib and lib64 directorie=
s,<br>
-+# like the AMD Opteron.<br>
-+#<br>
-+<br>
-+MAKEFILE_GENERATOR=C2=A0 =C2=A0 =3D UNIX<br>
-+TARGET_PLATFORM=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D unix<br>
-+TEMPLATE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D app<br>
-+CONFIG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D qt warn=
_on release incremental link_prl gdb_dwarf_index<br>
-+QT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=
=3D core gui<br>
-+QMAKE_INCREMENTAL_STYLE =3D sublib<br>
-+<br>
-+QMAKE_CFLAGS=C2=A0 =C2=A0 =C2=A0=3D<br>
-+QMAKE_LFLAGS=C2=A0 =C2=A0 =C2=A0=3D<br>
-+<br>
-+QMAKE_CFLAGS_RELEASE=C2=A0 =C2=A0+=3D -O2<br>
-+<br>
-+include(../common/linux.conf)<br>
-+include(../common/gcc-base-unix.conf)<br>
-+include(../common/g++-unix.conf)<br>
-+<br>
-+QMAKE_LIBDIR_X11=C2=A0 =C2=A0 =C2=A0 =3D /usr/X11R6/lib64<br>
-+QMAKE_LIBDIR_OPENGL=C2=A0 =C2=A0=3D /usr/X11R6/lib64<br>
-+<br>
-+load(qt_config)<br>
-diff --git a/mkspecs/linux-g++-aarch64/qplatformdefs.h b/mkspecs/linux-g++=
-aarch64/qplatformdefs.h<br>
-new file mode 100644<br>
-index 0000000..562128b<br>
---- /dev/null<br>
-+++ b/mkspecs/linux-g++-aarch64/qplatformdefs.h<br>
-@@ -0,0 +1,42 @@<br>
-+/************************************************************************=
****<br>
-+**<br>
-+** Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).<br>
-+** Contact: <a href=3D"http://www.qt-project.org/legal" target=3D"_blank"=
>http://www.qt-project.org/legal</a><br>
-+**<br>
-+** This file is part of the qmake spec of the Qt Toolkit.<br>
-+**<br>
-+** $QT_BEGIN_LICENSE:LGPL$<br>
-+** Commercial License Usage<br>
-+** Licensees holding valid commercial Qt licenses may use this file in<br=
>
-+** accordance with the commercial license agreement provided with the<br>
-+** Software or, alternatively, in accordance with the terms contained in<=
br>
-+** a written agreement between you and Digia.=C2=A0 For licensing terms a=
nd<br>
-+** conditions see <a href=3D"http://qt.digia.com/licensing" target=3D"_bl=
ank">http://qt.digia.com/licensing</a>.=C2=A0 For further information<br>
-+** use the contact form at <a href=3D"http://qt.digia.com/contact-us" tar=
get=3D"_blank">http://qt.digia.com/contact-us</a>.<br>
-+**<br>
-+** GNU Lesser General Public License Usage<br>
-+** Alternatively, this file may be used under the terms of the GNU Lesser=
<br>
-+** General Public License version 2.1 as published by the Free Software<b=
r>
-+** Foundation and appearing in the file LICENSE.LGPL included in the<br>
-+** packaging of this file.=C2=A0 Please review the following information =
to<br>
-+** ensure the GNU Lesser General Public License version 2.1 requirements<=
br>
-+** will be met: <a href=3D"http://www.gnu.org/licenses/old-licenses/lgpl-=
2.1.html" target=3D"_blank">http://www.gnu.org/licenses/old-licenses/lgpl-2=
.1.html</a>.<br>
-+**<br>
-+** In addition, as a special exception, Digia gives you certain additiona=
l<br>
-+** rights.=C2=A0 These rights are described in the Digia Qt LGPL Exceptio=
n<br>
-+** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.<=
br>
-+**<br>
-+** GNU General Public License Usage<br>
-+** Alternatively, this file may be used under the terms of the GNU<br>
-+** General Public License version 3.0 as published by the Free Software<b=
r>
-+** Foundation and appearing in the file LICENSE.GPL included in the<br>
-+** packaging of this file.=C2=A0 Please review the following information =
to<br>
-+** ensure the GNU General Public License version 3.0 requirements will be=
<br>
-+** met: <a href=3D"http://www.gnu.org/copyleft/gpl.html" target=3D"_blank=
">http://www.gnu.org/copyleft/gpl.html</a>.<br>
-+**<br>
-+**<br>
-+** $QT_END_LICENSE$<br>
-+**<br>
-+*************************************************************************=
***/<br>
-+<br>
-+#include &quot;../linux-g++/qplatformdefs.h&quot;<br>
---<br>
-2.1.0<br>
-<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0032-aarch64_add_header.patch b/=
meta/recipes-qt/qt4/qt4-4.8.6/0032-aarch64_add_header.patch<br>
deleted file mode 100644<br>
index 7132224..0000000<br>
--- a/meta/recipes-qt/qt4/qt4-4.8.6/0032-aarch64_add_header.patch<br>
+++ /dev/null<br>
@@ -1,18 +0,0 @@<br>
-Add missing header for aarch64. And install ../corelib/arch/qatomic_aarch6=
4.h.<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.=
kang@windriver.com</a>&gt;<br>
----<br>
-diff -Nru qt-everywhere-opensource-src-4.8.6.orig/include/QtCore/qatomic_a=
arch64.h qt-everywhere-opensource-src-4.8.6/include/QtCore/qatomic_aarch64.=
h<br>
---- qt-everywhere-opensource-src-4.8.6.orig/include/QtCore/qatomic_aarch64=
.h=C2=A0 =C2=A01970-01-01 08:30:00.000000000 +0830<br>
-+++ qt-everywhere-opensource-src-4.8.6/include/QtCore/qatomic_aarch64.h=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 2014-09-09 17:18:03.768352551 +0800<br>
-@@ -0,0 +1 @@<br>
-+#include &quot;../../src/corelib/arch/qatomic_aarch64.h&quot;<br>
---- qt-everywhere-opensource-src-4.8.6/include/QtCore/headers.pri.orig 201=
4-09-09 18:05:37.100430311 +0800<br>
-+++ qt-everywhere-opensource-src-4.8.6/include/QtCore/headers.pri=C2=A0 =
=C2=A0 =C2=A0 2014-09-09 18:05:59.112430911 +0800<br>
-@@ -1,3 +1,3 @@<br>
--SYNCQT.HEADER_FILES =3D ../corelib/statemachine/qabstractstate.h ../corel=
ib/statemachine/qabstracttransition.h ../corelib/statemachine/qeventtransit=
ion.h ../corelib/statemachine/qfinalstate.h ../corelib/statemachine/qhistor=
ystate.h ../corelib/statemachine/qsignaltransition.h ../corelib/statemachin=
e/qstate.h ../corelib/statemachine/qstatemachine.h ../corelib/arch/qatomic_=
alpha.h ../corelib/arch/qatomic_arch.h ../corelib/arch/qatomic_arm.h ../cor=
elib/arch/qatomic_armv5.h ../corelib/arch/qatomic_armv6.h ../corelib/arch/q=
atomic_armv7.h ../corelib/arch/qatomic_avr32.h ../corelib/arch/qatomic_bfin=
.h ../corelib/arch/qatomic_bootstrap.h ../corelib/arch/qatomic_generic.h ..=
/corelib/arch/qatomic_i386.h ../corelib/arch/qatomic_ia64.h ../corelib/arch=
/qatomic_integrity.h ../corelib/arch/qatomic_m68k.h ../corelib/arch/qatomic=
_macosx.h ../corelib/arch/qatomic_mips.h ../corelib/arch/qatomic_parisc.h .=
./corelib/arch/qatomic_powerpc.h ../corelib/arch/qatomic_s390.h ../corelib/=
arch/qatomic_sh.h<br>
=C2=A0 ../corelib/arch/qatomic_sh4a.h ../corelib/arch/qatomic_sparc.h ../co=
relib/arch/qatomic_symbian.h ../corelib/arch/qatomic_vxworks.h ../corelib/a=
rch/qatomic_windows.h ../corelib/arch/qatomic_windowsce.h ../corelib/arch/q=
atomic_x86_64.h ../corelib/thread/qatomic.h ../corelib/thread/qbasicatomic.=
h ../corelib/thread/qmutex.h ../corelib/thread/qreadwritelock.h ../corelib/=
thread/qsemaphore.h ../corelib/thread/qthread.h ../corelib/thread/qthreadst=
orage.h ../corelib/thread/qwaitcondition.h ../corelib/xml/qxmlstream.h ../c=
orelib/concurrent/qfuture.h ../corelib/concurrent/qfutureinterface.h ../cor=
elib/concurrent/qfuturesynchronizer.h ../corelib/concurrent/qfuturewatcher.=
h ../corelib/concurrent/qrunnable.h ../corelib/concurrent/qtconcurrentcompi=
lertest.h ../corelib/concurrent/qtconcurrentexception.h ../corelib/concurre=
nt/qtconcurrentfilter.h ../corelib/concurrent/qtconcurrentfilterkernel.h ..=
/corelib/concurrent/qtconcurrentfunctionwrappers.h ../corelib/concurrent/qt=
concurrentiterateker<br>
=C2=A0nel.h ../corelib/concurrent/qtconcurrentmap.h ../corelib/concurrent/q=
tconcurrentmapkernel.h ../corelib/concurrent/qtconcurrentmedian.h ../coreli=
b/concurrent/qtconcurrentreducekernel.h ../corelib/concurrent/qtconcurrentr=
esultstore.h ../corelib/concurrent/qtconcurrentrun.h ../corelib/concurrent/=
qtconcurrentrunbase.h ../corelib/concurrent/qtconcurrentstoredfunctioncall.=
h ../corelib/concurrent/qtconcurrentthreadengine.h ../corelib/concurrent/qt=
hreadpool.h ../corelib/kernel/qabstracteventdispatcher.h ../corelib/kernel/=
qabstractitemmodel.h ../corelib/kernel/qbasictimer.h ../corelib/kernel/qcor=
eapplication.h ../corelib/kernel/qcoreevent.h ../corelib/kernel/qeventloop.=
h ../corelib/kernel/qfunctions_nacl.h ../corelib/kernel/qfunctions_vxworks.=
h ../corelib/kernel/qfunctions_wince.h ../corelib/kernel/qmath.h ../corelib=
/kernel/qmetaobject.h ../corelib/kernel/qmetatype.h ../corelib/kernel/qmime=
data.h ../corelib/kernel/qobject.h ../corelib/kernel/qobjectcleanuphandler.=
h ../corelib/kernel/<br>
=C2=A0qobjectdefs.h ../corelib/kernel/qpointer.h ../corelib/kernel/qsharedm=
emory.h ../corelib/kernel/qsignalmapper.h ../corelib/kernel/qsocketnotifier=
.h ../corelib/kernel/qsystemsemaphore.h ../corelib/kernel/qtimer.h ../corel=
ib/kernel/qtranslator.h ../corelib/kernel/qvariant.h ../corelib/plugin/qfac=
toryinterface.h ../corelib/plugin/qlibrary.h ../corelib/plugin/qplugin.h ..=
/corelib/plugin/qpluginloader.h ../corelib/plugin/quuid.h ../corelib/global=
/qconfig-dist.h ../corelib/global/qconfig-large.h ../corelib/global/qconfig=
-medium.h ../corelib/global/qconfig-minimal.h ../corelib/global/qconfig-nac=
l.h ../corelib/global/qconfig-small.h ../corelib/global/qendian.h ../coreli=
b/global/qfeatures.h ../corelib/global/qglobal.h ../corelib/global/qlibrary=
info.h ../corelib/global/qnamespace.h ../corelib/global/qnumeric.h ../corel=
ib/global/qt_windows.h ../corelib/global/qconfig.h ../corelib/codecs/qtextc=
odec.h ../corelib/codecs/qtextcodecplugin.h ../corelib/io/qabstractfileengi=
ne.h ../corelib/io/q<br>
=C2=A0buffer.h ../corelib/io/qdatastream.h ../corelib/io/qdebug.h ../coreli=
b/io/qdir.h ../corelib/io/qdiriterator.h ../corelib/io/qfile.h ../corelib/i=
o/qfileinfo.h ../corelib/io/qfilesystemwatcher.h ../corelib/io/qfsfileengin=
e.h ../corelib/io/qiodevice.h ../corelib/io/qprocess.h ../corelib/io/qresou=
rce.h ../corelib/io/qsettings.h ../corelib/io/qtemporaryfile.h ../corelib/i=
o/qtextstream.h ../corelib/io/qurl.h ../corelib/animation/qabstractanimatio=
n.h ../corelib/animation/qanimationgroup.h ../corelib/animation/qparallelan=
imationgroup.h ../corelib/animation/qpauseanimation.h ../corelib/animation/=
qpropertyanimation.h ../corelib/animation/qsequentialanimationgroup.h ../co=
relib/animation/qvariantanimation.h ../corelib/tools/qalgorithms.h ../corel=
ib/tools/qbitarray.h ../corelib/tools/qbytearray.h ../corelib/tools/qbytear=
raymatcher.h ../corelib/tools/qcache.h ../corelib/tools/qchar.h ../corelib/=
tools/qcontainerfwd.h ../corelib/tools/qcontiguouscache.h ../corelib/tools/=
qcryptographichash.h<br>
=C2=A0 ../corelib/tools/qdatetime.h ../corelib/tools/qeasingcurve.h ../core=
lib/tools/qelapsedtimer.h ../corelib/tools/qhash.h ../corelib/tools/qiterat=
or.h ../corelib/tools/qline.h ../corelib/tools/qlinkedlist.h ../corelib/too=
ls/qlist.h ../corelib/tools/qlocale.h ../corelib/tools/qlocale_blackberry.h=
 ../corelib/tools/qmap.h ../corelib/tools/qmargins.h ../corelib/tools/qpair=
.h ../corelib/tools/qpoint.h ../corelib/tools/qqueue.h ../corelib/tools/qre=
ct.h ../corelib/tools/qregexp.h ../corelib/tools/qscopedpointer.h ../coreli=
b/tools/qscopedvaluerollback.h ../corelib/tools/qset.h ../corelib/tools/qsh=
areddata.h ../corelib/tools/qsharedpointer.h ../corelib/tools/qsharedpointe=
r_impl.h ../corelib/tools/qsize.h ../corelib/tools/qstack.h ../corelib/tool=
s/qstring.h ../corelib/tools/qstringbuilder.h ../corelib/tools/qstringlist.=
h ../corelib/tools/qstringmatcher.h ../corelib/tools/qtextboundaryfinder.h =
../corelib/tools/qtimeline.h ../corelib/tools/qvarlengtharray.h ../corelib/=
tools/qvector.h ../.<br>
=C2=A0./include/QtCore/QtCore<br>
-+SYNCQT.HEADER_FILES =3D ../corelib/statemachine/qabstractstate.h ../corel=
ib/statemachine/qabstracttransition.h ../corelib/statemachine/qeventtransit=
ion.h ../corelib/statemachine/qfinalstate.h ../corelib/statemachine/qhistor=
ystate.h ../corelib/statemachine/qsignaltransition.h ../corelib/statemachin=
e/qstate.h ../corelib/statemachine/qstatemachine.h ../corelib/arch/qatomic_=
alpha.h ../corelib/arch/qatomic_arch.h ../corelib/arch/qatomic_arm.h ../cor=
elib/arch/qatomic_armv5.h ../corelib/arch/qatomic_armv6.h ../corelib/arch/q=
atomic_armv7.h ../corelib/arch/qatomic_aarch64.h ../corelib/arch/qatomic_av=
r32.h ../corelib/arch/qatomic_bfin.h ../corelib/arch/qatomic_bootstrap.h ..=
/corelib/arch/qatomic_generic.h ../corelib/arch/qatomic_i386.h ../corelib/a=
rch/qatomic_ia64.h ../corelib/arch/qatomic_integrity.h ../corelib/arch/qato=
mic_m68k.h ../corelib/arch/qatomic_macosx.h ../corelib/arch/qatomic_mips.h =
../corelib/arch/qatomic_parisc.h ../corelib/arch/qatomic_powerpc.h ../corel=
ib/arch/qatomic_s<br>
=C2=A0390.h ../corelib/arch/qatomic_sh.h ../corelib/arch/qatomic_sh4a.h ../=
corelib/arch/qatomic_sparc.h ../corelib/arch/qatomic_symbian.h ../corelib/a=
rch/qatomic_vxworks.h ../corelib/arch/qatomic_windows.h ../corelib/arch/qat=
omic_windowsce.h ../corelib/arch/qatomic_x86_64.h ../corelib/thread/qatomic=
.h ../corelib/thread/qbasicatomic.h ../corelib/thread/qmutex.h ../corelib/t=
hread/qreadwritelock.h ../corelib/thread/qsemaphore.h ../corelib/thread/qth=
read.h ../corelib/thread/qthreadstorage.h ../corelib/thread/qwaitcondition.=
h ../corelib/xml/qxmlstream.h ../corelib/concurrent/qfuture.h ../corelib/co=
ncurrent/qfutureinterface.h ../corelib/concurrent/qfuturesynchronizer.h ../=
corelib/concurrent/qfuturewatcher.h ../corelib/concurrent/qrunnable.h ../co=
relib/concurrent/qtconcurrentcompilertest.h ../corelib/concurrent/qtconcurr=
entexception.h ../corelib/concurrent/qtconcurrentfilter.h ../corelib/concur=
rent/qtconcurrentfilterkernel.h ../corelib/concurrent/qtconcurrentfunctionw=
rappers.h ../corelib<br>
=C2=A0/concurrent/qtconcurrentiteratekernel.h ../corelib/concurrent/qtconcu=
rrentmap.h ../corelib/concurrent/qtconcurrentmapkernel.h ../corelib/concurr=
ent/qtconcurrentmedian.h ../corelib/concurrent/qtconcurrentreducekernel.h .=
./corelib/concurrent/qtconcurrentresultstore.h ../corelib/concurrent/qtconc=
urrentrun.h ../corelib/concurrent/qtconcurrentrunbase.h ../corelib/concurre=
nt/qtconcurrentstoredfunctioncall.h ../corelib/concurrent/qtconcurrentthrea=
dengine.h ../corelib/concurrent/qthreadpool.h ../corelib/kernel/qabstractev=
entdispatcher.h ../corelib/kernel/qabstractitemmodel.h ../corelib/kernel/qb=
asictimer.h ../corelib/kernel/qcoreapplication.h ../corelib/kernel/qcoreeve=
nt.h ../corelib/kernel/qeventloop.h ../corelib/kernel/qfunctions_nacl.h ../=
corelib/kernel/qfunctions_vxworks.h ../corelib/kernel/qfunctions_wince.h ..=
/corelib/kernel/qmath.h ../corelib/kernel/qmetaobject.h ../corelib/kernel/q=
metatype.h ../corelib/kernel/qmimedata.h ../corelib/kernel/qobject.h ../cor=
elib/kernel/qobjectc<br>
=C2=A0leanuphandler.h ../corelib/kernel/qobjectdefs.h ../corelib/kernel/qpo=
inter.h ../corelib/kernel/qsharedmemory.h ../corelib/kernel/qsignalmapper.h=
 ../corelib/kernel/qsocketnotifier.h ../corelib/kernel/qsystemsemaphore.h .=
./corelib/kernel/qtimer.h ../corelib/kernel/qtranslator.h ../corelib/kernel=
/qvariant.h ../corelib/plugin/qfactoryinterface.h ../corelib/plugin/qlibrar=
y.h ../corelib/plugin/qplugin.h ../corelib/plugin/qpluginloader.h ../coreli=
b/plugin/quuid.h ../corelib/global/qconfig-dist.h ../corelib/global/qconfig=
-large.h ../corelib/global/qconfig-medium.h ../corelib/global/qconfig-minim=
al.h ../corelib/global/qconfig-nacl.h ../corelib/global/qconfig-small.h ../=
corelib/global/qendian.h ../corelib/global/qfeatures.h ../corelib/global/qg=
lobal.h ../corelib/global/qlibraryinfo.h ../corelib/global/qnamespace.h ../=
corelib/global/qnumeric.h ../corelib/global/qt_windows.h ../corelib/global/=
qconfig.h ../corelib/codecs/qtextcodec.h ../corelib/codecs/qtextcodecplugin=
.h ../corelib/io/qab<br>
=C2=A0stractfileengine.h ../corelib/io/qbuffer.h ../corelib/io/qdatastream.=
h ../corelib/io/qdebug.h ../corelib/io/qdir.h ../corelib/io/qdiriterator.h =
../corelib/io/qfile.h ../corelib/io/qfileinfo.h ../corelib/io/qfilesystemwa=
tcher.h ../corelib/io/qfsfileengine.h ../corelib/io/qiodevice.h ../corelib/=
io/qprocess.h ../corelib/io/qresource.h ../corelib/io/qsettings.h ../coreli=
b/io/qtemporaryfile.h ../corelib/io/qtextstream.h ../corelib/io/qurl.h ../c=
orelib/animation/qabstractanimation.h ../corelib/animation/qanimationgroup.=
h ../corelib/animation/qparallelanimationgroup.h ../corelib/animation/qpaus=
eanimation.h ../corelib/animation/qpropertyanimation.h ../corelib/animation=
/qsequentialanimationgroup.h ../corelib/animation/qvariantanimation.h ../co=
relib/tools/qalgorithms.h ../corelib/tools/qbitarray.h ../corelib/tools/qby=
tearray.h ../corelib/tools/qbytearraymatcher.h ../corelib/tools/qcache.h ..=
/corelib/tools/qchar.h ../corelib/tools/qcontainerfwd.h ../corelib/tools/qc=
ontiguouscache.h ../<br>
=C2=A0corelib/tools/qcryptographichash.h ../corelib/tools/qdatetime.h ../co=
relib/tools/qeasingcurve.h ../corelib/tools/qelapsedtimer.h ../corelib/tool=
s/qhash.h ../corelib/tools/qiterator.h ../corelib/tools/qline.h ../corelib/=
tools/qlinkedlist.h ../corelib/tools/qlist.h ../corelib/tools/qlocale.h ../=
corelib/tools/qlocale_blackberry.h ../corelib/tools/qmap.h ../corelib/tools=
/qmargins.h ../corelib/tools/qpair.h ../corelib/tools/qpoint.h ../corelib/t=
ools/qqueue.h ../corelib/tools/qrect.h ../corelib/tools/qregexp.h ../coreli=
b/tools/qscopedpointer.h ../corelib/tools/qscopedvaluerollback.h ../corelib=
/tools/qset.h ../corelib/tools/qshareddata.h ../corelib/tools/qsharedpointe=
r.h ../corelib/tools/qsharedpointer_impl.h ../corelib/tools/qsize.h ../core=
lib/tools/qstack.h ../corelib/tools/qstring.h ../corelib/tools/qstringbuild=
er.h ../corelib/tools/qstringlist.h ../corelib/tools/qstringmatcher.h ../co=
relib/tools/qtextboundaryfinder.h ../corelib/tools/qtimeline.h ../corelib/t=
ools/qvarlengtharray<br>
=C2=A0.h ../corelib/tools/qvector.h ../../include/QtCore/QtCore<br>
- SYNCQT.HEADER_CLASSES =3D ../../include/QtCore/QAbstractState ../../inclu=
de/QtCore/QAbstractTransition ../../include/QtCore/QEventTransition ../../i=
nclude/QtCore/QFinalState ../../include/QtCore/QHistoryState ../../include/=
QtCore/QSignalTransition ../../include/QtCore/QState ../../include/QtCore/Q=
StateMachine ../../include/QtCore/QAtomicInt ../../include/QtCore/QAtomicPo=
inter ../../include/QtCore/QBasicAtomicInt ../../include/QtCore/QBasicAtomi=
cPointer ../../include/QtCore/QMutex ../../include/QtCore/QMutexLocker ../.=
./include/QtCore/QMutexData ../../include/QtCore/QReadWriteLock ../../inclu=
de/QtCore/QReadLocker ../../include/QtCore/QWriteLocker ../../include/QtCor=
e/QSemaphore ../../include/QtCore/QThread ../../include/QtCore/QThreadStora=
geData ../../include/QtCore/QThreadStorage ../../include/QtCore/QWaitCondit=
ion ../../include/QtCore/QXmlStreamStringRef ../../include/QtCore/QXmlStrea=
mAttribute ../../include/QtCore/QXmlStreamAttributes ../../include/QtCore/Q=
XmlStreamNamespac<br>
=C2=A0eDeclaration ../../include/QtCore/QXmlStreamNamespaceDeclarations ../=
../include/QtCore/QXmlStreamNotationDeclaration ../../include/QtCore/QXmlSt=
reamNotationDeclarations ../../include/QtCore/QXmlStreamEntityDeclaration .=
./../include/QtCore/QXmlStreamEntityDeclarations ../../include/QtCore/QXmlS=
treamEntityResolver ../../include/QtCore/QXmlStreamReader ../../include/QtC=
ore/QXmlStreamWriter ../../include/QtCore/QFuture ../../include/QtCore/QFut=
ureIterator ../../include/QtCore/QMutableFutureIterator ../../include/QtCor=
e/QFutureInterfaceBase ../../include/QtCore/QFutureInterface ../../include/=
QtCore/QFutureSynchronizer ../../include/QtCore/QFutureWatcherBase ../../in=
clude/QtCore/QFutureWatcher ../../include/QtCore/QRunnable ../../include/Qt=
Core/QtConcurrentFilter ../../include/QtCore/QtConcurrentMap ../../include/=
QtCore/QtConcurrentRun ../../include/QtCore/QThreadPool ../../include/QtCor=
e/QAbstractEventDispatcher ../../include/QtCore/QModelIndex ../../include/Q=
tCore/QPersistentMod<br>
=C2=A0elIndex ../../include/QtCore/QModelIndexList ../../include/QtCore/QAb=
stractItemModel ../../include/QtCore/QAbstractTableModel ../../include/QtCo=
re/QAbstractListModel ../../include/QtCore/QBasicTimer ../../include/QtCore=
/QCoreApplication ../../include/QtCore/QtCleanUpFunction ../../include/QtCo=
re/QEvent ../../include/QtCore/QTimerEvent ../../include/QtCore/QChildEvent=
 ../../include/QtCore/QCustomEvent ../../include/QtCore/QDynamicPropertyCha=
ngeEvent ../../include/QtCore/QEventLoop ../../include/QtCore/QMetaMethod .=
./../include/QtCore/QMetaEnum ../../include/QtCore/QMetaProperty ../../incl=
ude/QtCore/QMetaClassInfo ../../include/QtCore/QMetaType ../../include/QtCo=
re/QMetaTypeId ../../include/QtCore/QMetaTypeId2 ../../include/QtCore/QMime=
Data ../../include/QtCore/QObjectList ../../include/QtCore/QObjectData ../.=
./include/QtCore/QObject ../../include/QtCore/QObjectUserData ../../include=
/QtCore/QObjectCleanupHandler ../../include/QtCore/QGenericArgument ../../i=
nclude/QtCore/QGener<br>
=C2=A0icReturnArgument ../../include/QtCore/QArgument ../../include/QtCore/=
QReturnArgument ../../include/QtCore/QMetaObject ../../include/QtCore/QMeta=
ObjectAccessor ../../include/QtCore/QMetaObjectExtraData ../../include/QtCo=
re/QPointer ../../include/QtCore/QSharedMemory ../../include/QtCore/QSignal=
Mapper ../../include/QtCore/QSocketNotifier ../../include/QtCore/QSystemSem=
aphore ../../include/QtCore/QTimer ../../include/QtCore/QTranslator ../../i=
nclude/QtCore/QVariant ../../include/QtCore/QVariantList ../../include/QtCo=
re/QVariantMap ../../include/QtCore/QVariantHash ../../include/QtCore/QVari=
antComparisonHelper ../../include/QtCore/QFactoryInterface ../../include/Qt=
Core/QLibrary ../../include/QtCore/QtPlugin ../../include/QtCore/QtPluginIn=
stanceFunction ../../include/QtCore/QPluginLoader ../../include/QtCore/QUui=
d ../../include/QtCore/QtEndian ../../include/QtCore/QtGlobal ../../include=
/QtCore/QIntegerForSize ../../include/QtCore/QNoImplicitBoolCast ../../incl=
ude/QtCore/Q_INT8 ..<br>
=C2=A0/../include/QtCore/Q_UINT8 ../../include/QtCore/Q_INT16 ../../include=
/QtCore/Q_UINT16 ../../include/QtCore/Q_INT32 ../../include/QtCore/Q_UINT32=
 ../../include/QtCore/Q_INT64 ../../include/QtCore/Q_UINT64 ../../include/Q=
tCore/Q_LLONG ../../include/QtCore/Q_ULLONG ../../include/QtCore/Q_LONG ../=
../include/QtCore/Q_ULONG ../../include/QtCore/QSysInfo ../../include/QtCor=
e/QtMsgHandler ../../include/QtCore/QGlobalStatic ../../include/QtCore/QGlo=
balStaticDeleter ../../include/QtCore/QBool ../../include/QtCore/QTypeInfo =
../../include/QtCore/QFlag ../../include/QtCore/QIncompatibleFlag ../../inc=
lude/QtCore/QFlags ../../include/QtCore/QForeachContainer ../../include/QtC=
ore/QForeachContainerBase ../../include/QtCore/QLibraryInfo ../../include/Q=
tCore/Qt ../../include/QtCore/QInternal ../../include/QtCore/QCOORD ../../i=
nclude/QtCore/QtConfig ../../include/QtCore/QTextCodec ../../include/QtCore=
/QTextEncoder ../../include/QtCore/QTextDecoder ../../include/QtCore/QTextC=
odecFactoryInterface<br>
=C2=A0 ../../include/QtCore/QTextCodecPlugin ../../include/QtCore/QAbstract=
FileEngine ../../include/QtCore/QAbstractFileEngineHandler ../../include/Qt=
Core/QAbstractFileEngineIterator ../../include/QtCore/QBuffer ../../include=
/QtCore/QDataStream ../../include/QtCore/QtDebug ../../include/QtCore/QDebu=
g ../../include/QtCore/QNoDebug ../../include/QtCore/QDir ../../include/QtC=
ore/QDirIterator ../../include/QtCore/QFile ../../include/QtCore/QFileInfo =
../../include/QtCore/QFileInfoList ../../include/QtCore/QFileInfoListIterat=
or ../../include/QtCore/QFileSystemWatcher ../../include/QtCore/QFSFileEngi=
ne ../../include/QtCore/QIODevice ../../include/QtCore/Q_PID ../../include/=
QtCore/QProcessEnvironment ../../include/QtCore/QProcess ../../include/QtCo=
re/QResource ../../include/QtCore/QSettings ../../include/QtCore/QTemporary=
File ../../include/QtCore/QTextStream ../../include/QtCore/QTextStreamFunct=
ion ../../include/QtCore/QTextStreamManipulator ../../include/QtCore/QTS ..=
/../include/QtCore/Q<br>
=C2=A0TextIStream ../../include/QtCore/QTextOStream ../../include/QtCore/QU=
rl ../../include/QtCore/QAbstractAnimation ../../include/QtCore/QAnimationD=
river ../../include/QtCore/QAnimationGroup ../../include/QtCore/QParallelAn=
imationGroup ../../include/QtCore/QPauseAnimation ../../include/QtCore/QPro=
pertyAnimation ../../include/QtCore/QSequentialAnimationGroup ../../include=
/QtCore/QVariantAnimation ../../include/QtCore/QtAlgorithms ../../include/Q=
tCore/QBitArray ../../include/QtCore/QBitRef ../../include/QtCore/QByteArra=
y ../../include/QtCore/QByteRef ../../include/QtCore/QByteArrayMatcher ../.=
./include/QtCore/QCache ../../include/QtCore/QLatin1Char ../../include/QtCo=
re/QChar ../../include/QtCore/QtContainerFwd ../../include/QtCore/QContiguo=
usCacheData ../../include/QtCore/QContiguousCacheTypedData ../../include/Qt=
Core/QContiguousCache ../../include/QtCore/QCryptographicHash ../../include=
/QtCore/QDate ../../include/QtCore/QTime ../../include/QtCore/QDateTime ../=
../include/QtCore/QE<br>
=C2=A0asingCurve ../../include/QtCore/QElapsedTimer ../../include/QtCore/QH=
ashData ../../include/QtCore/QHashDummyValue ../../include/QtCore/QHashDumm=
yNode ../../include/QtCore/QHashNode ../../include/QtCore/QHash ../../inclu=
de/QtCore/QMultiHash ../../include/QtCore/QHashIterator ../../include/QtCor=
e/QMutableHashIterator ../../include/QtCore/QLine ../../include/QtCore/QLin=
eF ../../include/QtCore/QLinkedListData ../../include/QtCore/QLinkedListNod=
e ../../include/QtCore/QLinkedList ../../include/QtCore/QLinkedListIterator=
 ../../include/QtCore/QMutableLinkedListIterator ../../include/QtCore/QList=
Data ../../include/QtCore/QList ../../include/QtCore/QListIterator ../../in=
clude/QtCore/QMutableListIterator ../../include/QtCore/QSystemLocale ../../=
include/QtCore/QLocale ../../include/QtCore/QBBSystemLocaleData ../../inclu=
de/QtCore/QMapData ../../include/QtCore/QMapNode ../../include/QtCore/QMapP=
ayloadNode ../../include/QtCore/QMap ../../include/QtCore/QMultiMap ../../i=
nclude/QtCore/QMapIt<br>
=C2=A0erator ../../include/QtCore/QMutableMapIterator ../../include/QtCore/=
QMargins ../../include/QtCore/QPair ../../include/QtCore/QPoint ../../inclu=
de/QtCore/QPointF ../../include/QtCore/QQueue ../../include/QtCore/QRect ..=
/../include/QtCore/QRectF ../../include/QtCore/QRegExp ../../include/QtCore=
/QScopedPointerDeleter ../../include/QtCore/QScopedPointerArrayDeleter ../.=
./include/QtCore/QScopedPointerPodDeleter ../../include/QtCore/QScopedPoint=
er ../../include/QtCore/QScopedArrayPointer ../../include/QtCore/QScopedVal=
ueRollback ../../include/QtCore/QSet ../../include/QtCore/QSetIterator ../.=
./include/QtCore/QMutableSetIterator ../../include/QtCore/QSharedData ../..=
/include/QtCore/QSharedDataPointer ../../include/QtCore/QExplicitlySharedDa=
taPointer ../../include/QtCore/QSharedPointer ../../include/QtCore/QWeakPoi=
nter ../../include/QtCore/QSize ../../include/QtCore/QSizeF ../../include/Q=
tCore/QStack ../../include/QtCore/QStdWString ../../include/QtCore/QString =
../../include/QtCore<br>
=C2=A0/QLatin1String ../../include/QtCore/QCharRef ../../include/QtCore/QCo=
nstString ../../include/QtCore/QStringRef ../../include/QtCore/QLatin1Liter=
al ../../include/QtCore/QAbstractConcatenable ../../include/QtCore/QConcate=
nable ../../include/QtCore/QStringBuilder ../../include/QtCore/QStringListI=
terator ../../include/QtCore/QMutableStringListIterator ../../include/QtCor=
e/QStringList ../../include/QtCore/QStringMatcher ../../include/QtCore/QTex=
tBoundaryFinder ../../include/QtCore/QTimeLine ../../include/QtCore/QVarLen=
gthArray ../../include/QtCore/QVectorData ../../include/QtCore/QVectorTyped=
Data ../../include/QtCore/QVector ../../include/QtCore/QVectorIterator ../.=
./include/QtCore/QMutableVectorIterator<br>
- SYNCQT.PRIVATE_HEADER_FILES =3D ../corelib/statemachine/qabstractstate_p.=
h ../corelib/statemachine/qabstracttransition_p.h ../corelib/statemachine/q=
eventtransition_p.h ../corelib/statemachine/qhistorystate_p.h ../corelib/st=
atemachine/qsignaleventgenerator_p.h ../corelib/statemachine/qsignaltransit=
ion_p.h ../corelib/statemachine/qstate_p.h ../corelib/statemachine/qstatema=
chine_p.h ../corelib/thread/qmutex_p.h ../corelib/thread/qmutexpool_p.h ../=
corelib/thread/qorderedmutexlocker_p.h ../corelib/thread/qreadwritelock_p.h=
 ../corelib/thread/qthread_p.h ../corelib/xml/qxmlstream_p.h ../corelib/xml=
/qxmlutils_p.h ../corelib/concurrent/qfutureinterface_p.h ../corelib/concur=
rent/qfuturewatcher_p.h ../corelib/concurrent/qthreadpool_p.h ../corelib/ke=
rnel/qabstracteventdispatcher_p.h ../corelib/kernel/qabstractitemmodel_p.h =
../corelib/kernel/qcore_mac_p.h ../corelib/kernel/qcore_symbian_p.h ../core=
lib/kernel/qcore_unix_p.h ../corelib/kernel/qcoreapplication_p.h ../corelib=
/kernel/qcorecmdl<br>
=C2=A0ineargs_p.h ../corelib/kernel/qcoreglobaldata_p.h ../corelib/kernel/q=
crashhandler_p.h ../corelib/kernel/qeventdispatcher_blackberry_p.h ../corel=
ib/kernel/qeventdispatcher_glib_p.h ../corelib/kernel/qeventdispatcher_symb=
ian_p.h ../corelib/kernel/qeventdispatcher_unix_p.h ../corelib/kernel/qeven=
tdispatcher_win_p.h ../corelib/kernel/qfunctions_p.h ../corelib/kernel/qmet=
aobject_p.h ../corelib/kernel/qobject_p.h ../corelib/kernel/qsharedmemory_p=
.h ../corelib/kernel/qsystemerror_p.h ../corelib/kernel/qsystemsemaphore_p.=
h ../corelib/kernel/qtranslator_p.h ../corelib/kernel/qvariant_p.h ../corel=
ib/kernel/qwineventnotifier_p.h ../corelib/plugin/qelfparser_p.h ../corelib=
/plugin/qfactoryloader_p.h ../corelib/plugin/qlibrary_p.h ../corelib/plugin=
/qsystemlibrary_p.h ../corelib/global/qnumeric_p.h ../corelib/global/qt_pch=
.h ../corelib/codecs/qfontlaocodec_p.h ../corelib/codecs/qiconvcodec_p.h ..=
/corelib/codecs/qisciicodec_p.h ../corelib/codecs/qlatincodec_p.h ../coreli=
b/codecs/qsimplecode<br>
=C2=A0c_p.h ../corelib/codecs/qtextcodec_p.h ../corelib/codecs/qtsciicodec_=
p.h ../corelib/codecs/qutfcodec_p.h ../corelib/io/qabstractfileengine_p.h .=
./corelib/io/qdatastream_p.h ../corelib/io/qdataurl_p.h ../corelib/io/qdir_=
p.h ../corelib/io/qfile_p.h ../corelib/io/qfileinfo_p.h ../corelib/io/qfile=
systemengine_p.h ../corelib/io/qfilesystementry_p.h ../corelib/io/qfilesyst=
emiterator_p.h ../corelib/io/qfilesystemmetadata_p.h ../corelib/io/qfilesys=
temwatcher_dnotify_p.h ../corelib/io/qfilesystemwatcher_fsevents_p.h ../cor=
elib/io/qfilesystemwatcher_inotify_p.h ../corelib/io/qfilesystemwatcher_kqu=
eue_p.h ../corelib/io/qfilesystemwatcher_p.h ../corelib/io/qfilesystemwatch=
er_symbian_p.h ../corelib/io/qfilesystemwatcher_win_p.h ../corelib/io/qfsfi=
leengine_iterator_p.h ../corelib/io/qfsfileengine_p.h ../corelib/io/qiodevi=
ce_p.h ../corelib/io/qnoncontiguousbytedevice_p.h ../corelib/io/qprocess_p.=
h ../corelib/io/qresource_iterator_p.h ../corelib/io/qresource_p.h ../corel=
ib/io/qsettings_p.h<br>
=C2=A0../corelib/io/qtldurl_p.h ../corelib/io/qurltlds_p.h ../corelib/io/qw=
indowspipewriter_p.h ../corelib/animation/qabstractanimation_p.h ../corelib=
/animation/qanimationgroup_p.h ../corelib/animation/qparallelanimationgroup=
_p.h ../corelib/animation/qpropertyanimation_p.h ../corelib/animation/qsequ=
entialanimationgroup_p.h ../corelib/animation/qvariantanimation_p.h ../core=
lib/tools/qbytedata_p.h ../corelib/tools/qdatetime_p.h ../corelib/tools/qha=
rfbuzz_p.h ../corelib/tools/qlocale_data_p.h ../corelib/tools/qlocale_p.h .=
./corelib/tools/qlocale_tools_p.h ../corelib/tools/qpodlist_p.h ../corelib/=
tools/qringbuffer_p.h ../corelib/tools/qscopedpointer_p.h ../corelib/tools/=
qsimd_p.h ../corelib/tools/qtools_p.h ../corelib/tools/qunicodetables_p.h<b=
r>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0034-Fix-a-division-by-zero-when=
-processing-malformed-BMP.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0034-Fix-a-=
division-by-zero-when-processing-malformed-BMP.patch<br>
deleted file mode 100644<br>
index 8ff4ad5..0000000<br>
--- a/meta/recipes-qt/qt4/qt4-4.8.6/0034-Fix-a-division-by-zero-when-proces=
sing-malformed-BMP.patch<br>
+++ /dev/null<br>
@@ -1,44 +0,0 @@<br>
-From e50aa2252cdd5cb53eef7d8c4503c7edff634f68 Mon Sep 17 00:00:00 2001<br>
-From: &quot;Richard J. Moore&quot; &lt;<a href=3D"mailto:rich@kde.org">ric=
h@kde.org</a>&gt;<br>
-Date: Tue, 24 Feb 2015 19:02:35 +0000<br>
-Subject: [PATCH] Fix a division by zero when processing malformed BMP file=
s.<br>
-<br>
-This fixes a division by 0 when processing a maliciously crafted BMP<br>
-file. No impact beyond DoS.<br>
-<br>
-Backport of 661f6bfd032dacc62841037732816a583640e187<br>
-<br>
-Upstream-Status: Backport<br>
-<br>
-Task-number: QTBUG-44547<br>
-Change-Id: I43f06e752b11cb50669101460902a82b885ae618<br>
-Reviewed-by: Thiago Macieira &lt;<a href=3D"mailto:thiago.macieira@intel.c=
om">thiago.macieira@intel.com</a>&gt;<br>
-Signed-off-by: Jonathan Liu &lt;<a href=3D"mailto:net147@gmail.com">net147=
@gmail.com</a>&gt;<br>
----<br>
- src/gui/image/qbmphandler.cpp | 6 ++++++<br>
- 1 file changed, 6 insertions(+)<br>
-<br>
-diff --git a/src/gui/image/qbmphandler.cpp b/src/gui/image/qbmphandler.cpp=
<br>
-index b22e842..30fa9e0 100644<br>
---- a/src/gui/image/qbmphandler.cpp<br>
-+++ b/src/gui/image/qbmphandler.cpp<br>
-@@ -319,10 +319,16 @@ static bool read_dib_body(QDataStream &amp;s, const =
BMP_INFOHDR &amp;bi, int offset, int<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0} else if (comp =3D=3D BMP_BITFIELDS &amp;&amp; (nbits=
 =3D=3D 16 || nbits =3D=3D 32)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0red_shift =3D calc_shift(red_mask);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (((red_mask &gt;&gt; red_shift) + 1) =3D=
=3D 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0red_scale =3D 256 / ((red_mask &gt;&gt; =
red_shift) + 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0green_shift =3D calc_shift(green_mask);<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (((green_mask &gt;&gt; green_shift) + 1) =
=3D=3D 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0green_scale =3D 256 / ((green_mask &gt;&=
gt; green_shift) + 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blue_shift =3D calc_shift(blue_mask);<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (((blue_mask &gt;&gt; blue_shift) + 1) =3D=
=3D 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blue_scale =3D 256 / ((blue_mask &gt;&gt=
; blue_shift) + 1);<br>
-=C2=A0 =C2=A0 =C2=A0} else if (comp =3D=3D BMP_RGB &amp;&amp; (nbits =3D=
=3D 24 || nbits =3D=3D 32)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blue_mask =3D 0x000000ff;<br>
---<br>
-2.3.1<br>
-<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6.inc b/meta/recipes-qt/qt4/qt4-4.=
8.7.inc<br>
similarity index 87%<br>
rename from meta/recipes-qt/qt4/qt4-4.8.6.inc<br>
rename to meta/recipes-qt/qt4/qt4-4.8.7.inc<br>
index 0cb7f80..2f580cc 100644<br>
--- a/meta/recipes-qt/qt4/qt4-4.8.6.inc<br>
+++ b/meta/recipes-qt/qt4/qt4-4.8.7.inc<br>
@@ -22,19 +22,14 @@ SRC_URI =3D &quot;<a href=3D"http://download.qt-project=
.org/official_releases/qt/4.8/${PV}/qt-ever" target=3D"_blank">http://downl=
oad.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0019-Fixes-for-gcc-4.7.0-p=
articularly-on-qemux86.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0027-tools.pro-disable-qme=
egographicssystemhelper.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0028-Don-t-crash-on-broken=
-GIF-images.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0029-aarch64_arm64_fix_arc=
h_detection.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0030-aarch64_arm64_qatomic=
_support.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0031-aarch64_arm64_mkspecs=
.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0032-aarch64_add_header.pa=
tch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0034-Fix-a-division-by-zer=
o-when-processing-malformed-BMP.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Fix-QWSLock-invalid-argume=
nt-logs.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://add_check_for_aarch64_32.p=
atch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://g++.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://linux.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;2edbe4d6c2eff33ef91732602f3518eb&quot;<br>
-SRC_URI[sha256sum] =3D &quot;8b14dd91b52862e09b8e6a963507b74bc2580787d171f=
eda197badfa7034032c&quot;<br>
+SRC_URI[md5sum] =3D &quot;d990ee66bf7ab0c785589776f35ba6ad&quot;<br>
+SRC_URI[sha256sum] =3D &quot;e2882295097e47fe089f8ac741a95fef47e0a73a3f3cd=
f21b56990638f626ea0&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/qt-everywhere-opensource-src-${PV}&quot;<br>
<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0001-qlibraryinfo-allow-to-set-q=
t.conf-from-the-outside-u.patch b/meta/recipes-qt/qt4/qt4-4.8.7/0001-qlibra=
ryinfo-allow-to-set-qt.conf-from-the-outside-u.patch<br>
similarity index 100%<br>
rename from meta/recipes-qt/qt4/qt4-4.8.6/0001-qlibraryinfo-allow-to-set-qt=
.conf-from-the-outside-u.patch<br>
rename to meta/recipes-qt/qt4/qt4-4.8.7/0001-qlibraryinfo-allow-to-set-qt.c=
onf-from-the-outside-u.patch<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0002-qkbdtty_qws-fix-build-with-=
old-kernel-headers.patch b/meta/recipes-qt/qt4/qt4-4.8.7/0002-qkbdtty_qws-f=
ix-build-with-old-kernel-headers.patch<br>
similarity index 100%<br>
rename from meta/recipes-qt/qt4/qt4-4.8.6/0002-qkbdtty_qws-fix-build-with-o=
ld-kernel-headers.patch<br>
rename to meta/recipes-qt/qt4/qt4-4.8.7/0002-qkbdtty_qws-fix-build-with-old=
-kernel-headers.patch<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0003-webkit2-set-OUTPUT_DIR-valu=
e-if-empty.patch b/meta/recipes-qt/qt4/qt4-4.8.7/0003-webkit2-set-OUTPUT_DI=
R-value-if-empty.patch<br>
similarity index 100%<br>
rename from meta/recipes-qt/qt4/qt4-4.8.6/0003-webkit2-set-OUTPUT_DIR-value=
-if-empty.patch<br>
rename to meta/recipes-qt/qt4/qt4-4.8.7/0003-webkit2-set-OUTPUT_DIR-value-i=
f-empty.patch<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0004-configure-qmake-is-already-=
built-in-qt4-tools-native.patch b/meta/recipes-qt/qt4/qt4-4.8.7/0004-config=
ure-qmake-is-already-built-in-qt4-tools-native.patch<br>
similarity index 100%<br>
rename from meta/recipes-qt/qt4/qt4-4.8.6/0004-configure-qmake-is-already-b=
uilt-in-qt4-tools-native.patch<br>
rename to meta/recipes-qt/qt4/qt4-4.8.7/0004-configure-qmake-is-already-bui=
lt-in-qt4-tools-native.patch<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0005-configure-set-LFLAGS-to-pic=
k-up-zlib-from-staging.patch b/meta/recipes-qt/qt4/qt4-4.8.7/0005-configure=
-set-LFLAGS-to-pick-up-zlib-from-staging.patch<br>
similarity index 100%<br>
rename from meta/recipes-qt/qt4/qt4-4.8.6/0005-configure-set-LFLAGS-to-pick=
-up-zlib-from-staging.patch<br>
rename to meta/recipes-qt/qt4/qt4-4.8.7/0005-configure-set-LFLAGS-to-pick-u=
p-zlib-from-staging.patch<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0006-configure-Use-OE_QMAKE_-val=
ues-to-specify-Qt-utility.patch b/meta/recipes-qt/qt4/qt4-4.8.7/0006-config=
ure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch<br>
similarity index 100%<br>
rename from meta/recipes-qt/qt4/qt4-4.8.6/0006-configure-Use-OE_QMAKE_-valu=
es-to-specify-Qt-utility.patch<br>
rename to meta/recipes-qt/qt4/qt4-4.8.7/0006-configure-Use-OE_QMAKE_-values=
-to-specify-Qt-utility.patch<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0007-dbus-Remove-const-usage-tha=
t-causes-compile-failure-.patch b/meta/recipes-qt/qt4/qt4-4.8.7/0007-dbus-R=
emove-const-usage-that-causes-compile-failure-.patch<br>
similarity index 100%<br>
rename from meta/recipes-qt/qt4/qt4-4.8.6/0007-dbus-Remove-const-usage-that=
-causes-compile-failure-.patch<br>
rename to meta/recipes-qt/qt4/qt4-4.8.7/0007-dbus-Remove-const-usage-that-c=
auses-compile-failure-.patch<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0008-qmake.pro-Allow-building-a-=
separate-qmake-for-the-ta.patch b/meta/recipes-qt/qt4/qt4-4.8.7/0008-qmake.=
pro-Allow-building-a-separate-qmake-for-the-ta.patch<br>
similarity index 100%<br>
rename from meta/recipes-qt/qt4/qt4-4.8.6/0008-qmake.pro-Allow-building-a-s=
eparate-qmake-for-the-ta.patch<br>
rename to meta/recipes-qt/qt4/qt4-4.8.7/0008-qmake.pro-Allow-building-a-sep=
arate-qmake-for-the-ta.patch<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0009-qmake-fix-source-file-refer=
ences-in-qmake.pri.patch b/meta/recipes-qt/qt4/qt4-4.8.7/0009-qmake-fix-sou=
rce-file-references-in-qmake.pri.patch<br>
similarity index 100%<br>
rename from meta/recipes-qt/qt4/qt4-4.8.6/0009-qmake-fix-source-file-refere=
nces-in-qmake.pri.patch<br>
rename to meta/recipes-qt/qt4/qt4-4.8.7/0009-qmake-fix-source-file-referenc=
es-in-qmake.pri.patch<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0010-configure-Hack-to-not-use-t=
he-pg_config-of-the-host-.patch b/meta/recipes-qt/qt4/qt4-4.8.7/0010-config=
ure-Hack-to-not-use-the-pg_config-of-the-host-.patch<br>
similarity index 65%<br>
rename from meta/recipes-qt/qt4/qt4-4.8.6/0010-configure-Hack-to-not-use-th=
e-pg_config-of-the-host-.patch<br>
rename to meta/recipes-qt/qt4/qt4-4.8.7/0010-configure-Hack-to-not-use-the-=
pg_config-of-the-host-.patch<br>
index 1d2ddab..ca6a0b8 100644<br>
--- a/meta/recipes-qt/qt4/qt4-4.8.6/0010-configure-Hack-to-not-use-the-pg_c=
onfig-of-the-host-.patch<br>
+++ b/meta/recipes-qt/qt4/qt4-4.8.7/0010-configure-Hack-to-not-use-the-pg_c=
onfig-of-the-host-.patch<br>
@@ -14,6 +14,10 @@ will pad.<br>
=C2=A0Upstream-Status: Inappropriate [configuration]<br>
<br>
=C2=A0Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.=
com">Martin.Jansa@gmail.com</a>&gt;<br>
+<br>
+Update for qt 4.8.7.<br>
+<br>
+Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.=
kang@windriver.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 configure | 8 ++++----<br>
=C2=A0 1 file changed, 4 insertions(+), 4 deletions(-)<br>
@@ -22,17 +26,17 @@ diff --git a/configure b/configure<br>
=C2=A0index db4d044..35a8fe7 100755<br>
=C2=A0--- a/configure<br>
=C2=A0+++ b/configure<br>
-@@ -5511,10 +5511,10 @@ for _SQLDR in $CFG_SQL_AVAILABLE; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0psql)<br>
+@@ -5574,10 +5574,10 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$CFG_SQL_psql&q=
uot; !=3D &quot;no&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ -z &quot;$=
CFG_PSQL_CONFIG&quot; ] &amp;&amp; CFG_PSQL_CONFIG=3D`&quot;$WHICH&quot; pg=
_config`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Be careful=
 not to use native pg_config when cross building.<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$XPLAT=
FORM_MINGW&quot; !=3D &quot;yes&quot; ] &amp;&amp; &quot;$WHICH&quot; pg_co=
nfig &gt;/dev/null 2&gt;&amp;1; then<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QT_=
CFLAGS_PSQL=3D`pg_config --includedir 2&gt;/dev/null`<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QT_=
LFLAGS_PSQL=3D`pg_config --libdir 2&gt;/dev/null`<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$XPLAT=
FORM_MINGW&quot; !=3D &quot;yes&quot; ] &amp;&amp; [ -x &quot;$CFG_PSQL_CON=
FIG&quot; ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QT_=
CFLAGS_PSQL=3D`$CFG_PSQL_CONFIG --includedir 2&gt;/dev/null`<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QT_=
LFLAGS_PSQL=3D`$CFG_PSQL_CONFIG --libdir 2&gt;/dev/null`<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$XPLA=
TFORM_MINGW&quot; !=3D &quot;yes&quot; ] &amp;&amp; &quot;$WHICH&quot; pg_c=
onfig &gt;/dev/null 2&gt;&amp;1; then<br>
-+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QT=
_CFLAGS_PSQL=3D`pg_config --includedir 2&gt;/dev/null`<br>
-+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QT=
_LFLAGS_PSQL=3D`pg_config --libdir 2&gt;/dev/null`<br>
++#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$XPLA=
TFORM_MINGW&quot; !=3D &quot;yes&quot; ] &amp;&amp; [ -x &quot;$CFG_PSQL_CO=
NFIG&quot; ]; then<br>
++#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QT=
_CFLAGS_PSQL=3D`$CFG_PSQL_CONFIG --includedir 2&gt;/dev/null`<br>
++#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QT=
_LFLAGS_PSQL=3D`$CFG_PSQL_CONFIG --libdir 2&gt;/dev/null`<br>
=C2=A0+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -z &quot;$=
QT_CFLAGS_PSQL&quot; ] || QT_CFLAGS_PSQL=3D&quot;-I$QT_CFLAGS_PSQL&quot;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -z &quot;$=
QT_LFLAGS_PSQL&quot; ] || QT_LFLAGS_PSQL=3D&quot;-L$QT_LFLAGS_PSQL&quot;<br=
>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0011-freetype-host-includes.patc=
h b/meta/recipes-qt/qt4/qt4-4.8.7/0011-freetype-host-includes.patch<br>
similarity index 100%<br>
rename from meta/recipes-qt/qt4/qt4-4.8.6/0011-freetype-host-includes.patch=
<br>
rename to meta/recipes-qt/qt4/qt4-4.8.7/0011-freetype-host-includes.patch<b=
r>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0012-Add-2bpp-support.patch b/me=
ta/recipes-qt/qt4/qt4-4.8.7/0012-Add-2bpp-support.patch<br>
similarity index 100%<br>
rename from meta/recipes-qt/qt4/qt4-4.8.6/0012-Add-2bpp-support.patch<br>
rename to meta/recipes-qt/qt4/qt4-4.8.7/0012-Add-2bpp-support.patch<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0013-configure-add-crossarch-opt=
ion.patch b/meta/recipes-qt/qt4/qt4-4.8.7/0013-configure-add-crossarch-opti=
on.patch<br>
similarity index 76%<br>
rename from meta/recipes-qt/qt4/qt4-4.8.6/0013-configure-add-crossarch-opti=
on.patch<br>
rename to meta/recipes-qt/qt4/qt4-4.8.7/0013-configure-add-crossarch-option=
.patch<br>
index aa464fd..762cdaf 100644<br>
--- a/meta/recipes-qt/qt4/qt4-4.8.6/0013-configure-add-crossarch-option.pat=
ch<br>
+++ b/meta/recipes-qt/qt4/qt4-4.8.7/0013-configure-add-crossarch-option.pat=
ch<br>
@@ -6,34 +6,38 @@ Subject: [PATCH 13/21] configure: add &quot;-crossarch&qu=
ot; option<br>
=C2=A0Upstream-Status: Pending<br>
<br>
=C2=A0Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.=
com">Martin.Jansa@gmail.com</a>&gt;<br>
+<br>
+Update for qt 4.8.7<br>
+<br>
+Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.=
kang@windriver.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 configure | 7 ++++++-<br>
=C2=A0 1 file changed, 6 insertions(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/configure b/configure<br>
-index 79c1c7b..7983c3d 100755<br>
+index 4eb4a3d..a4dacec 100755<br>
=C2=A0--- a/configure<br>
=C2=A0+++ b/configure<br>
-@@ -1153,7 +1153,7 @@ while [ &quot;$#&quot; -gt 0 ]; do<br>
+@@ -1160,7 +1160,7 @@ while [ &quot;$#&quot; -gt 0 ]; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shift<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VAL=3D$1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
--=C2=A0 =C2=A0 -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-=
libdir|-bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-=
make|-nomake|-platform|-xplatform|-device-option|-buildkey|-sdk|-arch|-host=
-arch|-mysql_config|-sysroot)<br>
-+=C2=A0 =C2=A0 -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-=
libdir|-bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-=
make|-nomake|-platform|-xplatform|-device-option|-buildkey|-sdk|-arch|-host=
-arch|-mysql_config|-sysroot|-crossarch)<br>
+-=C2=A0 =C2=A0 -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-=
libdir|-bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-=
make|-nomake|-platform|-xplatform|-device-option|-buildkey|-sdk|-arch|-host=
-arch|-mysql_config|-psql_config|-sysroot)<br>
++=C2=A0 =C2=A0 -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-=
libdir|-bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-=
make|-nomake|-platform|-xplatform|-device-option|-buildkey|-sdk|-arch|-host=
-arch|-mysql_config|-psql_config|-sysroot|-crossarch)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VAR=3D`echo $1 | sed &quot;s,^-\(.*\),\1=
,&quot;`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shift<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VAL=3D&quot;$1&quot;<br>
-@@ -1709,6 +1709,9 @@ while [ &quot;$#&quot; -gt 0 ]; do<br>
+@@ -1719,6 +1719,9 @@ while [ &quot;$#&quot; -gt 0 ]; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DEV_VAL=3D`echo $VAL | sed &quot;s,^.*=
=3D\(.*\),\1,&quot;`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DeviceVar set $DEV_VAR $DEV_VAL<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
-+=C2=A0 =C2=A0 =C2=A0 crossarch)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CROSSARCH=3D&quot;$VAL&q=
uot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
++=C2=A0 =C2=A0 crossarch)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 CROSSARCH=3D&quot;$VAL&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 debug-and-release)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$VAL&quot; =3D &quot;yes&quot=
; ] || [ &quot;$VAL&quot; =3D &quot;no&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CFG_DEBUG_RELEASE=3D&quot;=
$VAL&quot;<br>
-@@ -3324,6 +3327,8 @@ arm*)<br>
+@@ -3333,6 +3336,8 @@ arm*)<br>
=C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 esac<br>
<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0014-translations-fix-phony-tran=
slation-linking-error.patch b/meta/recipes-qt/qt4/qt4-4.8.7/0014-translatio=
ns-fix-phony-translation-linking-error.patch<br>
similarity index 100%<br>
rename from meta/recipes-qt/qt4/qt4-4.8.6/0014-translations-fix-phony-trans=
lation-linking-error.patch<br>
rename to meta/recipes-qt/qt4/qt4-4.8.7/0014-translations-fix-phony-transla=
tion-linking-error.patch<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0015-configure-add-nostrip-for-d=
ebug-packages.patch b/meta/recipes-qt/qt4/qt4-4.8.7/0015-configure-add-nost=
rip-for-debug-packages.patch<br>
similarity index 100%<br>
rename from meta/recipes-qt/qt4/qt4-4.8.6/0015-configure-add-nostrip-for-de=
bug-packages.patch<br>
rename to meta/recipes-qt/qt4/qt4-4.8.7/0015-configure-add-nostrip-for-debu=
g-packages.patch<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0016-configure-eval-QMAKE_CXX.pa=
tch b/meta/recipes-qt/qt4/qt4-4.8.7/0016-configure-eval-QMAKE_CXX.patch<br>
similarity index 100%<br>
rename from meta/recipes-qt/qt4/qt4-4.8.6/0016-configure-eval-QMAKE_CXX.pat=
ch<br>
rename to meta/recipes-qt/qt4/qt4-4.8.7/0016-configure-eval-QMAKE_CXX.patch=
<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0017-configure-ensure-we-identif=
y-the-compiler-as-g-in-co.patch b/meta/recipes-qt/qt4/qt4-4.8.7/0017-config=
ure-ensure-we-identify-the-compiler-as-g-in-co.patch<br>
similarity index 100%<br>
rename from meta/recipes-qt/qt4/qt4-4.8.6/0017-configure-ensure-we-identify=
-the-compiler-as-g-in-co.patch<br>
rename to meta/recipes-qt/qt4/qt4-4.8.7/0017-configure-ensure-we-identify-t=
he-compiler-as-g-in-co.patch<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0018-configure-make-pulseaudio-a=
-configurable-option.patch b/meta/recipes-qt/qt4/qt4-4.8.7/0018-configure-m=
ake-pulseaudio-a-configurable-option.patch<br>
similarity index 100%<br>
rename from meta/recipes-qt/qt4/qt4-4.8.6/0018-configure-make-pulseaudio-a-=
configurable-option.patch<br>
rename to meta/recipes-qt/qt4/qt4-4.8.7/0018-configure-make-pulseaudio-a-co=
nfigurable-option.patch<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0019-Fixes-for-gcc-4.7.0-particu=
larly-on-qemux86.patch b/meta/recipes-qt/qt4/qt4-4.8.7/0019-Fixes-for-gcc-4=
.7.0-particularly-on-qemux86.patch<br>
similarity index 100%<br>
rename from meta/recipes-qt/qt4/qt4-4.8.6/0019-Fixes-for-gcc-4.7.0-particul=
arly-on-qemux86.patch<br>
rename to meta/recipes-qt/qt4/qt4-4.8.7/0019-Fixes-for-gcc-4.7.0-particular=
ly-on-qemux86.patch<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0021-configure-make-qt4-native-w=
ork-with-long-building-pa.patch b/meta/recipes-qt/qt4/qt4-4.8.7/0021-config=
ure-make-qt4-native-work-with-long-building-pa.patch<br>
similarity index 100%<br>
rename from meta/recipes-qt/qt4/qt4-4.8.6/0021-configure-make-qt4-native-wo=
rk-with-long-building-pa.patch<br>
rename to meta/recipes-qt/qt4/qt4-4.8.7/0021-configure-make-qt4-native-work=
-with-long-building-pa.patch<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0027-tools.pro-disable-qmeegogra=
phicssystemhelper.patch b/meta/recipes-qt/qt4/qt4-4.8.7/0027-tools.pro-disa=
ble-qmeegographicssystemhelper.patch<br>
similarity index 100%<br>
rename from meta/recipes-qt/qt4/qt4-4.8.6/0027-tools.pro-disable-qmeegograp=
hicssystemhelper.patch<br>
rename to meta/recipes-qt/qt4/qt4-4.8.7/0027-tools.pro-disable-qmeegographi=
cssystemhelper.patch<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0028-Don-t-crash-on-broken-GIF-i=
mages.patch b/meta/recipes-qt/qt4/qt4-4.8.7/0028-Don-t-crash-on-broken-GIF-=
images.patch<br>
similarity index 100%<br>
rename from meta/recipes-qt/qt4/qt4-4.8.6/0028-Don-t-crash-on-broken-GIF-im=
ages.patch<br>
rename to meta/recipes-qt/qt4/qt4-4.8.7/0028-Don-t-crash-on-broken-GIF-imag=
es.patch<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0033-configure-support-c-0x-stan=
dard-for-directfd.patch b/meta/recipes-qt/qt4/qt4-4.8.7/0033-configure-supp=
ort-c-0x-standard-for-directfd.patch<br>
similarity index 100%<br>
rename from meta/recipes-qt/qt4/qt4-4.8.6/0033-configure-support-c-0x-stand=
ard-for-directfd.patch<br>
rename to meta/recipes-qt/qt4/qt4-4.8.7/0033-configure-support-c-0x-standar=
d-for-directfd.patch<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/Fix-QWSLock-invalid-argument-log=
s.patch b/meta/recipes-qt/qt4/qt4-4.8.7/Fix-QWSLock-invalid-argument-logs.p=
atch<br>
similarity index 100%<br>
rename from meta/recipes-qt/qt4/qt4-4.8.6/Fix-QWSLock-invalid-argument-logs=
.patch<br>
rename to meta/recipes-qt/qt4/qt4-4.8.7/Fix-QWSLock-invalid-argument-logs.p=
atch<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/add_check_for_aarch64_32.patch b=
/meta/recipes-qt/qt4/qt4-4.8.7/add_check_for_aarch64_32.patch<br>
similarity index 100%<br>
rename from meta/recipes-qt/qt4/qt4-4.8.6/add_check_for_aarch64_32.patch<br=
>
rename to meta/recipes-qt/qt4/qt4-4.8.7/add_check_for_aarch64_32.patch<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/g++.conf b/meta/recipes-qt/qt4/q=
t4-4.8.7/g++.conf<br>
similarity index 100%<br>
rename from meta/recipes-qt/qt4/qt4-4.8.6/g++.conf<br>
rename to meta/recipes-qt/qt4/qt4-4.8.7/g++.conf<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/linux.conf b/meta/recipes-qt/qt4=
/qt4-4.8.7/linux.conf<br>
similarity index 100%<br>
rename from meta/recipes-qt/qt4/qt4-4.8.6/linux.conf<br>
rename to meta/recipes-qt/qt4/qt4-4.8.7/linux.conf<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/qte.sh b/meta/recipes-qt/qt4/qt4=
-4.8.7/qte.sh<br>
similarity index 100%<br>
rename from meta/recipes-qt/qt4/qt4-4.8.6/qte.sh<br>
rename to meta/recipes-qt/qt4/qt4-4.8.7/qte.sh<br>
diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4=
-embedded.inc<br>
index ef5cf2c..a769065 100644<br>
--- a/meta/recipes-qt/qt4/qt4-embedded.inc<br>
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc<br>
@@ -3,7 +3,6 @@ DESCRIPTION =3D &quot;Qt is a versatile cross-platform appl=
ication framework -- this is<br>
=C2=A0SECTION =3D &quot;libs&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://qt-project.org/" target=3D"_blan=
k">http://qt-project.org/</a>&quot;<br>
=C2=A0DEPENDS +=3D &quot;directfb tslib&quot;<br>
-INC_PR =3D &quot;r52&quot;<br>
<br>
=C2=A0QT4EDEPENDS =3D &quot;&quot;<br>
=C2=A0QT_BASE_LIB=C2=A0 ?=3D &quot;libqt-embedded&quot;<br>
diff --git a/meta/recipes-qt/qt4/<a href=3D"http://qt4-embedded_4.8.6.bb" t=
arget=3D"_blank">qt4-embedded_4.8.6.bb</a> b/meta/recipes-qt/qt4/<a href=3D=
"http://qt4-embedded_4.8.7.bb" target=3D"_blank">qt4-embedded_4.8.7.bb</a><=
br>
similarity index 100%<br>
rename from meta/recipes-qt/qt4/<a href=3D"http://qt4-embedded_4.8.6.bb" ta=
rget=3D"_blank">qt4-embedded_4.8.6.bb</a><br>
rename to meta/recipes-qt/qt4/<a href=3D"http://qt4-embedded_4.8.7.bb" targ=
et=3D"_blank">qt4-embedded_4.8.7.bb</a><br>
diff --git a/meta/recipes-qt/qt4/qt4-native.inc b/meta/recipes-qt/qt4/qt4-n=
ative.inc<br>
index 70bda73..2a41f8a 100644<br>
--- a/meta/recipes-qt/qt4/qt4-native.inc<br>
+++ b/meta/recipes-qt/qt4/qt4-native.inc<br>
@@ -9,8 +9,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.LGPL;md5=3Dfbc093=
901857fcd118f065f900982c24 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://LICENSE.GPL3;md5=3D6e1694ee338db410417517884918d4d2 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c139dfb268fb6&quot;<b=
r>
<br>
-INC_PR =3D &quot;r20&quot;<br>
-<br>
=C2=A0inherit native<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://download.qt-project.org/official_=
releases/qt/4.8/${PV}/qt-everywhere-opensource-src-${PV}.tar.gz" target=3D"=
_blank">http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ev=
erywhere-opensource-src-${PV}.tar.gz</a> \<br>
@@ -18,10 +16,6 @@ SRC_URI =3D &quot;<a href=3D"http://download.qt-project.=
org/official_releases/qt/4.8/${PV}/qt-ever" target=3D"_blank">http://downlo=
ad.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-qkbdtty_qws-fix-build=
-with-old-kernel-headers.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-webkit2-set-OUTPUT_DI=
R-value-if-empty.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0021-configure-make-qt4-na=
tive-work-with-long-building-pa.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0029-aarch64_arm64_fix_arc=
h_detection.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0030-aarch64_arm64_qatomic=
_support.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0031-aarch64_arm64_mkspecs=
.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0032-aarch64_add_header.pa=
tch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://g++.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://linux.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
diff --git a/meta/recipes-qt/qt4/<a href=3D"http://qt4-native_4.8.6.bb" tar=
get=3D"_blank">qt4-native_4.8.6.bb</a> b/meta/recipes-qt/qt4/<a href=3D"htt=
p://qt4-native_4.8.6.bb" target=3D"_blank">qt4-native_4.8.6.bb</a><br>
deleted file mode 100644<br>
index d874d32..0000000<br>
--- a/meta/recipes-qt/qt4/<a href=3D"http://qt4-native_4.8.6.bb" target=3D"=
_blank">qt4-native_4.8.6.bb</a><br>
+++ /dev/null<br>
@@ -1,6 +0,0 @@<br>
-require qt4-native.inc<br>
-<br>
-TOBUILD :=3D &quot;src/tools/bootstrap ${TOBUILD}&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;2edbe4d6c2eff33ef91732602f3518eb&quot;<br>
-SRC_URI[sha256sum] =3D &quot;8b14dd91b52862e09b8e6a963507b74bc2580787d171f=
eda197badfa7034032c&quot;<br>
diff --git a/meta/recipes-qt/qt4/<a href=3D"http://qt4-native_4.8.7.bb" tar=
get=3D"_blank">qt4-native_4.8.7.bb</a> b/meta/recipes-qt/qt4/<a href=3D"htt=
p://qt4-native_4.8.7.bb" target=3D"_blank">qt4-native_4.8.7.bb</a><br>
new file mode 100644<br>
index 0000000..494d663<br>
--- /dev/null<br>
+++ b/meta/recipes-qt/qt4/<a href=3D"http://qt4-native_4.8.7.bb" target=3D"=
_blank">qt4-native_4.8.7.bb</a><br>
@@ -0,0 +1,6 @@<br>
+require qt4-native.inc<br>
+<br>
+TOBUILD :=3D &quot;src/tools/bootstrap ${TOBUILD}&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;d990ee66bf7ab0c785589776f35ba6ad&quot;<br>
+SRC_URI[sha256sum] =3D &quot;e2882295097e47fe089f8ac741a95fef47e0a73a3f3cd=
f21b56990638f626ea0&quot;<br>
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4=
-x11-free.inc<br>
index 835fc96..f6a1737 100644<br>
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc<br>
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc<br>
@@ -9,8 +9,6 @@ DEPENDS +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURE=
S&#39;, &#39;opengl&#39;, &#39;virtual/libgl&#39;, &#39;<br>
=C2=A0PROVIDES +=3D &quot;qt4-x11&quot;<br>
=C2=A0QT4DEPENDS =3D &quot;&quot;<br>
<br>
-INC_PR =3D &quot;r50&quot;<br>
-<br>
=C2=A0QT_GLFLAGS ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;,=
 &#39;opengl&#39;, &#39;-opengl&#39;, &#39;-no-opengl&#39;, d)} &quot;<br>
=C2=A0QT_GLFLAGS_qemux86 =3D &quot;-opengl&quot;<br>
=C2=A0QT_GLFLAGS_qemuppc =3D &quot;-opengl&quot;<br>
diff --git a/meta/recipes-qt/qt4/<a href=3D"http://qt4-x11-free_4.8.6.bb" t=
arget=3D"_blank">qt4-x11-free_4.8.6.bb</a> b/meta/recipes-qt/qt4/<a href=3D=
"http://qt4-x11-free_4.8.7.bb" target=3D"_blank">qt4-x11-free_4.8.7.bb</a><=
br>
similarity index 100%<br>
rename from meta/recipes-qt/qt4/<a href=3D"http://qt4-x11-free_4.8.6.bb" ta=
rget=3D"_blank">qt4-x11-free_4.8.6.bb</a><br>
rename to meta/recipes-qt/qt4/<a href=3D"http://qt4-x11-free_4.8.7.bb" targ=
et=3D"_blank">qt4-x11-free_4.8.7.bb</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br></div>

--001a1133dd7423f060051786432a--
