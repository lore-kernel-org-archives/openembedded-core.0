Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id C0565795E5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 16:19:52 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id 130-v6so1746557qkd.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 09:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=o7K+dKpsHy9/dG0+8tjOHwgwH4kySbbkDp2sBCOPIMw=;
	b=FaFxPv/0oredX10b7TlYveZ2mhMCOV/+KRlcQKXikU3tuSXWHbOAVtj79EKm1lQPns
	v60M5a8k/kTafSQ1KERC2sfCJLDxih0wv6x+jBDDJ0knXFHwAdtRFD+a0Yzbu491Y5iH
	/l77zRt9/dkENgMrWXNDGE5knm6KO9vhmAJFfngapJ/GhIKmmG3RDBeNS/H1UVfRZkLD
	sTHxwXkkqt8eALU89mSKD51D5NM7y6JwdkybxQOjd0TSHdLSruqwHx3xEYfikVaWYJKL
	zevpv8yRRwoFlB5wWC9LZF7cG70InnRSSHA+NG2Ok6jNPNrMXY2Om+vG/at5L6IjJ4zg
	cmbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=o7K+dKpsHy9/dG0+8tjOHwgwH4kySbbkDp2sBCOPIMw=;
	b=JcQy7AX4Fx1wQtMmFOpciZNAAWYFIbuG5DTW2PYIr1hXjJ5rgEjkVf/obFRbM1z2D3
	94tpcnaYY4LSiX3WZZv8biAb5BA5b4oYwSSmq8PwhfLnqFfrB4jGuDzitLfuey5xfj48
	qHBh5K0NR2n3vRaQe1j5GBP2NSBWLeZwNvw4JzreAHmf8iAKKf3CuRI/0O9oiUKWDLWY
	qOFJz3zuLwTgzLaVPnTg9Vph193CxB7M46AM3gzFfmCpmZSseExOXIoJseGqEh7PIRlq
	7woSMyH8wnWsZ3hjDuhaPaPlJ5Mgw9zjarEfDBmlL5Ny+PEqAFSTT0i4V3pE9wgpAF/M
	mupA==
X-Gm-Message-State: APzg51CZn2r0Yg9/fxqItL1d7pb7hJljRYOj7I4VmQvEaNnJ4Au75Ev9
	UzVwO1HbTXzC+Vi6Eb9D/y++wtHK4Wvwsqq6I/I=
X-Google-Smtp-Source: ANB0VdYFD1VLZebM9ViIIhp05W9x4OvuUjl/ChdLry5bFPGPd2UvEq/Z5U/7Jbghmz900m81XLUnuypDVXR7EIkEdOU=
X-Received: by 2002:a37:9904:: with SMTP id
	b4-v6mr16191337qke.102.1535732393385; 
	Fri, 31 Aug 2018 09:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <20180830232604.10850-1-otavio@ossystems.com.br>
In-Reply-To: <20180830232604.10850-1-otavio@ossystems.com.br>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Aug 2018 09:19:27 -0700
Message-ID: <CAMKF1sozB+uN8h3YcEXSnRvuQOWdYYzRC2iOrr54h-5VYnQUMA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: Update 3.11.4 -> 3.12.1
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
X-List-Received-Date: Fri, 31 Aug 2018 16:19:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 30, 2018 at 4:26 PM Otavio Salvador <otavio@ossystems.com.br> wrote:
>
> This updates CMake to the 3.12.1 stable release. All patches were
> rebase on top of the new source file and all them applied without
> changes.
>
> The number of patches has changed as all them were applied on the Git
> tree and re-exported, to avoid any fuzzy warnings.
>

This is a major version update and cmake is quite deep in foundation of build
there are large packages outside OE-Core which depend on it. Can you give
some details on testing to make us feel comfortable ?

> License-Update: new contributor added in Copyright.txt
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
>  ...ake-native_3.11.4.bb => cmake-native_3.12.1.bb} |  4 ++--
>  meta/recipes-devtools/cmake/cmake.inc              | 12 ++++++------
>  ...ineSystem-use-oe-environment-vars-to-load.patch | 14 ++++++++------
>  ... 0002-cmake-Prevent-the-detection-of-Qt5.patch} | 12 ++++++------
>  ...pport-OpenEmbedded-Qt4-tool-binary-names.patch} |  8 ++++----
>  ...ntly-if-system-Qt-installation-is-broken.patch} |  8 ++++----
>  ...of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch} |  4 ++--
>  .../cmake/{cmake_3.11.4.bb => cmake_3.12.1.bb}     |  0
>  8 files changed, 32 insertions(+), 30 deletions(-)
>  rename meta/recipes-devtools/cmake/{cmake-native_3.11.4.bb => cmake-native_3.12.1.bb} (93%)
>  rename meta/recipes-devtools/cmake/cmake/{0001-cmake-Prevent-the-detection-of-Qt5.patch => 0002-cmake-Prevent-the-detection-of-Qt5.patch} (93%)
>  rename meta/recipes-devtools/cmake/cmake/{0002-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch => 0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch} (92%)
>  rename meta/recipes-devtools/cmake/cmake/{0003-Fail-silently-if-system-Qt-installation-is-broken.patch => 0004-Fail-silently-if-system-Qt-installation-is-broken.patch} (92%)
>  rename meta/recipes-devtools/cmake/cmake/{0004-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch => 0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch} (91%)
>  rename meta/recipes-devtools/cmake/{cmake_3.11.4.bb => cmake_3.12.1.bb} (100%)
>
> diff --git a/meta/recipes-devtools/cmake/cmake-native_3.11.4.bb b/meta/recipes-devtools/cmake/cmake-native_3.12.1.bb
> similarity index 93%
> rename from meta/recipes-devtools/cmake/cmake-native_3.11.4.bb
> rename to meta/recipes-devtools/cmake/cmake-native_3.12.1.bb
> index f55c519c8c..9a1390f96d 100644
> --- a/meta/recipes-devtools/cmake/cmake-native_3.11.4.bb
> +++ b/meta/recipes-devtools/cmake/cmake-native_3.12.1.bb
> @@ -3,10 +3,10 @@ inherit native
>
>  DEPENDS += "bzip2-replacement-native expat-native xz-native zlib-native curl-native"
>
> -SRC_URI += "file://0004-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch \
> -            file://OEToolchainConfig.cmake \
> +SRC_URI += "file://OEToolchainConfig.cmake \
>              file://environment.d-cmake.sh \
>              file://0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch \
> +            file://0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch \
>              "
>
>
> diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
> index 436363e4e3..4c30162c19 100644
> --- a/meta/recipes-devtools/cmake/cmake.inc
> +++ b/meta/recipes-devtools/cmake/cmake.inc
> @@ -6,19 +6,19 @@ HOMEPAGE = "http://www.cmake.org/"
>  BUGTRACKER = "http://public.kitware.com/Bug/my_view_page.php"
>  SECTION = "console/utils"
>  LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://Copyright.txt;md5=891b81f415fb25fbad03e41f87fd5dfb \
> +LIC_FILES_CHKSUM = "file://Copyright.txt;md5=f61f5f859bc5ddba2b050eb10335e013 \
>                      file://Source/cmake.h;md5=4494dee184212fc89c469c3acd555a14;beginline=1;endline=3 \
>                      "
>
>  CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
>
>  SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
> -           file://0001-cmake-Prevent-the-detection-of-Qt5.patch \
> -           file://0002-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch \
> -           file://0003-Fail-silently-if-system-Qt-installation-is-broken.patch \
> +           file://0002-cmake-Prevent-the-detection-of-Qt5.patch \
> +           file://0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch \
> +           file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
>  "
>
> -SRC_URI[md5sum] = "72e168b3bad2f9c34dcebbad7af56ff0"
> -SRC_URI[sha256sum] = "8f864e9f78917de3e1483e256270daabc4a321741592c5b36af028e72bff87f5"
> +SRC_URI[md5sum] = "10109246a51102bfda45ff3935275fbf"
> +SRC_URI[sha256sum] = "c53d5c2ce81d7a957ee83e3e635c8cda5dfe20c9d501a4828ee28e1615e57ab2"
>
>  UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
> diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
> index a2332879cf..f690720870 100644
> --- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
> +++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
> @@ -1,8 +1,9 @@
> -From a42cfebcd6c684cccf8ad33e5bd5130f7cdba135 Mon Sep 17 00:00:00 2001
> +From 71085723f8028b3e1c4029fc1abe1243ac49ffc6 Mon Sep 17 00:00:00 2001
>  From: Cody P Schafer <dev@codyps.com>
>  Date: Thu, 27 Apr 2017 11:35:05 -0400
> -Subject: [PATCH] CMakeDetermineSystem: use oe environment vars to load default
> - toolchain file in sdk
> +Subject: [PATCH 1/5] CMakeDetermineSystem: use oe environment vars to load
> + default toolchain file in sdk
> +Organization: O.S. Systems Software LTDA.
>
>  Passing the toolchain by:
>
> @@ -18,15 +19,16 @@ because '-D' options are cache entries themselves.
>
>  Upstream-Status: Inappropriate [oe-core specific]
>  Signed-off-by: Cody P Schafer <dev@codyps.com>
> +Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>  ---
>   Modules/CMakeDetermineSystem.cmake | 7 +++++++
>   1 file changed, 7 insertions(+)
>
>  diff --git a/Modules/CMakeDetermineSystem.cmake b/Modules/CMakeDetermineSystem.cmake
> -index f34ec5d61..bcac3ef16 100644
> +index 600d5580e..32d7f1945 100644
>  --- a/Modules/CMakeDetermineSystem.cmake
>  +++ b/Modules/CMakeDetermineSystem.cmake
> -@@ -74,6 +74,13 @@ else()
> +@@ -82,6 +82,13 @@ else()
>     endif()
>   endif()
>
> @@ -41,5 +43,5 @@ index f34ec5d61..bcac3ef16 100644
>   # in this case read the toolchain file and keep the CMAKE_HOST_SYSTEM_*
>   # variables around so they can be used in CMakeLists.txt.
>  --
> -2.12.2
> +2.18.0
>
> diff --git a/meta/recipes-devtools/cmake/cmake/0001-cmake-Prevent-the-detection-of-Qt5.patch b/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch
> similarity index 93%
> rename from meta/recipes-devtools/cmake/cmake/0001-cmake-Prevent-the-detection-of-Qt5.patch
> rename to meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch
> index b4976e918b..6f788ada00 100644
> --- a/meta/recipes-devtools/cmake/cmake/0001-cmake-Prevent-the-detection-of-Qt5.patch
> +++ b/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch
> @@ -1,7 +1,7 @@
> -From 0f60f3922bc85994fcde5079ce5a52f9b51f6915 Mon Sep 17 00:00:00 2001
> +From 7a1f4e724f9c68498f401244c2938e784a2e6fbd Mon Sep 17 00:00:00 2001
>  From: Otavio Salvador <otavio@ossystems.com.br>
>  Date: Wed, 17 Jan 2018 10:02:14 -0200
> -Subject: [PATCH 1/4] cmake: Prevent the detection of Qt5
> +Subject: [PATCH 2/5] cmake: Prevent the detection of Qt5
>  Organization: O.S. Systems Software LTDA.
>
>  CMake doesn't have dependency on qt4/qt5, so these tests usually fail
> @@ -36,10 +36,10 @@ index 330b74729..e7709dee6 100644
>     include_directories(${Qt5Widgets_INCLUDE_DIRS})
>     add_definitions(${Qt5Widgets_DEFINITONS})
>  diff --git a/Tests/CMakeLists.txt b/Tests/CMakeLists.txt
> -index 08bfebe0e..dd4d7f4fb 100644
> +index b8b724ed8..63f6bb6d2 100644
>  --- a/Tests/CMakeLists.txt
>  +++ b/Tests/CMakeLists.txt
> -@@ -1260,7 +1260,7 @@ ${CMake_BINARY_DIR}/bin/cmake -DDIR=dev -P ${CMake_SOURCE_DIR}/Utilities/Release
> +@@ -1322,7 +1322,7 @@ ${CMake_BINARY_DIR}/bin/cmake -DDIR=dev -P ${CMake_SOURCE_DIR}/Utilities/Release
>       set(CMake_TEST_Qt5 1)
>     endif()
>     if(CMake_TEST_Qt5)
> @@ -93,10 +93,10 @@ index 26d201926..e48e1c8de 100644
>   set(CMAKE_CXX_STANDARD 11)
>   set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/output/bin)
>  diff --git a/Tests/RunCMake/CMakeLists.txt b/Tests/RunCMake/CMakeLists.txt
> -index c52f44ece..d39cd8828 100644
> +index 637c5c2cb..c0376effc 100644
>  --- a/Tests/RunCMake/CMakeLists.txt
>  +++ b/Tests/RunCMake/CMakeLists.txt
> -@@ -285,7 +285,7 @@ add_RunCMake_test(configure_file)
> +@@ -291,7 +291,7 @@ add_RunCMake_test(configure_file)
>   add_RunCMake_test(CTestTimeoutAfterMatch)
>
>   find_package(Qt4 QUIET)
> diff --git a/meta/recipes-devtools/cmake/cmake/0002-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch b/meta/recipes-devtools/cmake/cmake/0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch
> similarity index 92%
> rename from meta/recipes-devtools/cmake/cmake/0002-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch
> rename to meta/recipes-devtools/cmake/cmake/0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch
> index acbe961c64..55cf47188a 100644
> --- a/meta/recipes-devtools/cmake/cmake/0002-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch
> +++ b/meta/recipes-devtools/cmake/cmake/0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch
> @@ -1,7 +1,7 @@
> -From 5fc9c33a7d6781008877b19dfdf0a526a50524f2 Mon Sep 17 00:00:00 2001
> +From c783ceeef485c23e13c3d9f0418719cb0e0b86ee Mon Sep 17 00:00:00 2001
>  From: Otavio Salvador <otavio@ossystems.com.br>
>  Date: Thu, 12 May 2011 15:36:03 +0000
> -Subject: [PATCH 2/4] cmake: support OpenEmbedded Qt4 tool binary names
> +Subject: [PATCH 3/5] cmake: support OpenEmbedded Qt4 tool binary names
>  Organization: O.S. Systems Software LTDA.
>
>  The FindQt4 module looks for Qt4 binaries to be able to gather the
> @@ -25,7 +25,7 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
>  diff --git a/Modules/FindQt4.cmake b/Modules/FindQt4.cmake
> -index 5a7eadb96..d48a5bfd1 100644
> +index 847a798af..7ad981879 100644
>  --- a/Modules/FindQt4.cmake
>  +++ b/Modules/FindQt4.cmake
>  @@ -517,7 +517,7 @@ endfunction()
> @@ -37,7 +37,7 @@ index 5a7eadb96..d48a5bfd1 100644
>   _qt4_find_qmake("${_QT4_QMAKE_NAMES}" QT_QMAKE_EXECUTABLE QTVERSION)
>
>   if (QT_QMAKE_EXECUTABLE AND
> -@@ -1143,12 +1143,12 @@ if (QT_QMAKE_EXECUTABLE AND
> +@@ -1135,12 +1135,12 @@ if (QT_QMAKE_EXECUTABLE AND
>     _find_qt4_program(QT_MOC_EXECUTABLE Qt4::moc moc-qt4 moc4 moc)
>     _find_qt4_program(QT_UIC_EXECUTABLE Qt4::uic uic-qt4 uic4 uic)
>     _find_qt4_program(QT_UIC3_EXECUTABLE Qt4::uic3 uic3)
> diff --git a/meta/recipes-devtools/cmake/cmake/0003-Fail-silently-if-system-Qt-installation-is-broken.patch b/meta/recipes-devtools/cmake/cmake/0004-Fail-silently-if-system-Qt-installation-is-broken.patch
> similarity index 92%
> rename from meta/recipes-devtools/cmake/cmake/0003-Fail-silently-if-system-Qt-installation-is-broken.patch
> rename to meta/recipes-devtools/cmake/cmake/0004-Fail-silently-if-system-Qt-installation-is-broken.patch
> index 301da0221d..a59c680454 100644
> --- a/meta/recipes-devtools/cmake/cmake/0003-Fail-silently-if-system-Qt-installation-is-broken.patch
> +++ b/meta/recipes-devtools/cmake/cmake/0004-Fail-silently-if-system-Qt-installation-is-broken.patch
> @@ -1,7 +1,7 @@
> -From b30da754a32213b5a0b3698f88e1302e5b18518b Mon Sep 17 00:00:00 2001
> +From 9516fc4260f701c6d9db0c341bb36480362e1747 Mon Sep 17 00:00:00 2001
>  From: Otavio Salvador <otavio@ossystems.com.br>
>  Date: Thu, 5 Jul 2018 10:26:48 -0300
> -Subject: [PATCH 3/4] Fail silently if system Qt installation is broken
> +Subject: [PATCH 4/5] Fail silently if system Qt installation is broken
>  Organization: O.S. Systems Software LTDA.
>
>  Fixes a regression in behaviour from 2.8.10 to 2.8.11 resulting in the
> @@ -28,10 +28,10 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>   1 file changed, 20 insertions(+), 19 deletions(-)
>
>  diff --git a/Modules/FindQt4.cmake b/Modules/FindQt4.cmake
> -index d48a5bfd1..e6f22fe9b 100644
> +index 7ad981879..8b6f43cda 100644
>  --- a/Modules/FindQt4.cmake
>  +++ b/Modules/FindQt4.cmake
> -@@ -995,25 +995,26 @@ if (QT_QMAKE_EXECUTABLE AND
> +@@ -987,25 +987,26 @@ if (QT_QMAKE_EXECUTABLE AND
>       endif()
>     endmacro()
>
> diff --git a/meta/recipes-devtools/cmake/cmake/0004-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
> similarity index 91%
> rename from meta/recipes-devtools/cmake/cmake/0004-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
> rename to meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
> index 91dea4cbba..23ce8e9e4a 100644
> --- a/meta/recipes-devtools/cmake/cmake/0004-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
> +++ b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
> @@ -1,7 +1,7 @@
> -From d9aa3f7c075dbd0db386995a44a2240ecdbb2c56 Mon Sep 17 00:00:00 2001
> +From 0df8d46d14c371f21c327966a553c4c187a8acfe Mon Sep 17 00:00:00 2001
>  From: Otavio Salvador <otavio@ossystems.com.br>
>  Date: Thu, 5 Jul 2018 10:28:04 -0300
> -Subject: [PATCH 4/4] Disable use of ext2fs/ext2_fs.h by cmake's internal
> +Subject: [PATCH 5/5] Disable use of ext2fs/ext2_fs.h by cmake's internal
>   libarchive copy
>  Organization: O.S. Systems Software LTDA.
>
> diff --git a/meta/recipes-devtools/cmake/cmake_3.11.4.bb b/meta/recipes-devtools/cmake/cmake_3.12.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/cmake/cmake_3.11.4.bb
> rename to meta/recipes-devtools/cmake/cmake_3.12.1.bb
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

