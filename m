Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.776.1631896047795046083
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Sep 2021 09:27:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=fW4nmJH5;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.44, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f44.google.com with SMTP id u15so16093533wru.6
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Sep 2021 09:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kSPQajhaBop19O577rozFJnlzyxdPJDyf5u3d6eOdT0=;
        b=fW4nmJH5ep7M1BL7Egd3zBh3UZAIcSLfVZETldetCoC27x5rG2JitUCJzEJSFXprEH
         potAj03c7sDKZSds5Pwl7GNz1kcY0UKaEhLXNIT0qtjnAqBT06dXzZF0TU7E3zeJASPp
         jlEoGWt5I++Yjmm9No3q+EW1L1zD9es8VdAK2fWvJFZavHmbaKJ+Ulz/hk2K/Dyzw/IC
         QYafcr2XAHUS13MLYms0kwg0p/oF1N8HX0MFoW0FGj6bvJv/mS+vD0DY4ZR9cKYi+TX7
         0pQVlDDutLltJu8Rf5w0aP0zGvUmzzvp5wUBsX2JNV4GsGjjnGanPdubOLzZZRHKt+d+
         lq+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kSPQajhaBop19O577rozFJnlzyxdPJDyf5u3d6eOdT0=;
        b=JZzsneHYfyhL+keJq0YfnhbwNPYl6wP33hr1mE7BbG1uwqQdpBbCDr/58OJ/FiWgiU
         fJIeaC/LtpDbXIV01gcxAk/Zv69LbHb7opoOuqFi6qMdMCX7MlwpCQ6ym9+1mYENS+s3
         qNkiGPiHVr5DPoi8LGRubKEhuYih6NE9eYhG70VS2o92Ak/uIUwpazaTmk5S5E3u8aaO
         cvN5SN6d+qtYvRO5//vbB6H3GM/5tuIV3FPo6sCYEr5R/zGv4zMhME7lRm1aP8GG+2Vi
         kDOJ54U/jxDcBnZtnh71wPwSK3kv32KLjjD35nBDH0EFHfZnABIC/WQ+95S+ml2y9hbJ
         kLkQ==
X-Gm-Message-State: AOAM533oK7+wNbiQuqXCgH3bRNY4Nm23jlXAXHe8D1/gVeMfrncFzoIB
	O0XVp2UyJQ8UCZITN177C0/PehM8/c4+eVT/34NO7Q==
X-Google-Smtp-Source: ABdhPJyTaalQSGWWwZLCE5BD1IVEzyyST6Dhz6GmlKnDxtovOGwd3LsA9b4COg0vkt1qHkEL1D5+v711KVouJbjoe3k=
X-Received: by 2002:adf:e390:: with SMTP id e16mr13045044wrm.217.1631896045622;
 Fri, 17 Sep 2021 09:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210914094526.30291-1-purushottam.Choudhary@kpit.com> <20210914094526.30291-2-purushottam.Choudhary@kpit.com>
In-Reply-To: <20210914094526.30291-2-purushottam.Choudhary@kpit.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 17 Sep 2021 06:27:13 -1000
Message-ID: <CAOSpxda0kkrSHUXCT8dzNpDUKrgLb-2gAY7pZj7U5nTUOH+HJQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH 2/2] assimp: Fix path for _IMPORT_CHECK_FILES_FOR_assimp
To: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Mikko Rapeli <mikko.rapeli@bmw.de>, Nisha Parrakat <nisha.parrakat@kpit.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 13, 2021 at 11:45 PM Purushottam Choudhary
<purushottamchoudhary29@gmail.com> wrote:
>
> From: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
>
> Fix path for _IMPORT_CHECK_FILES_FOR_assimp
> As it is giving configuration error during validation of path
> when used by 3rd party component to configure itself
> using assimp::assimp target.
> Compute the installation prefix relative to file.

I'm getting errors in the build of vulkan-demos with these two patches:

ERROR: vulkan-demos-git-r0 do_configure: Build of do_configure failed
ERROR: vulkan-demos-git-r0 do_configure: Traceback (most recent call last):
  File "/home/steve/builds/poky-contrib/bitbake/lib/bb/build.py", line
584, in _exec_task
    exec_func(task, localdata)
  File "/home/steve/builds/poky-contrib/bitbake/lib/bb/build.py", line
251, in exec_func
    exec_func_shell(func, d, runfile, cwd=adir)
  File "/home/steve/builds/poky-contrib/bitbake/lib/bb/build.py", line
452, in exec_func_shell
    bb.process.run(cmd, shell=False, stdin=stdin, log=logfile,
extrafiles=[(fifo,readfifo)])
  File "/home/steve/builds/poky-contrib/bitbake/lib/bb/process.py",
line 182, in run
    raise ExecutionError(cmd, pipe.returncode, stdout, stderr)
bb.process.ExecutionError: Execution of
'/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/vulkan-demos/git-r0/temp/run.do_configure.3192682'
failed with exit code 1:
-- The C compiler identification is GNU 9.3.0
-- The CXX compiler identification is GNU 9.3.0
-- Check for working C compiler:
/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/vulkan-demos/git-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc
-- Check for working C compiler:
/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/vulkan-demos/git-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc
-- works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Detecting C compile features
-- Detecting C compile features - done
-- Check for working CXX compiler:
/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/vulkan-demos/git-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++
-- Check for working CXX compiler:
/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/vulkan-demos/git-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++
-- works
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Using module to find Vulkan
-- Found Vulkan:
/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/vulkan-demos/git-r0/recipe-sysroot/usr/lib64/libvulkan.so
CMake Error at /home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/vulkan-demos/git-r0/recipe-sysroot/usr/lib64/cmake/assimp-5.0/assimpTargets.cmake:84
(message):
  The imported target "assimp::assimp" references the file

     "/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/vulkan-demos/git-r0/recipe-sysroot/usr/lib/libassimp.so.5"

  but this file does not exist.  Possible reasons include:

  * The file was deleted, renamed, or moved to another location.

  * An install or uninstall procedure did not complete successfully.

  * The installation package was faulty and contained

     "/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/vulkan-demos/git-r0/recipe-sysroot/usr/lib64/cmake/assimp-5.0/assimpTargets.cmake"

  but not all the files it references.

Steve

> Signed-off-by: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
> ---
>  ...h-for-_IMPORT_CHECK_FILES_FOR_assimp.patch | 93 +++++++++++++++++++
>  ...hared-lib-from-_IMPORT_CHECK_TARGETS.patch | 32 -------
>  meta/recipes-graphics/vulkan/assimp_5.0.1.bb  |  2 +-
>  3 files changed, 94 insertions(+), 33 deletions(-)
>  create mode 100644 meta/recipes-graphics/vulkan/assimp/0001-Fix-path-for-_IMPORT_CHECK_FILES_FOR_assimp.patch
>  delete mode 100644 meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch
>
> diff --git a/meta/recipes-graphics/vulkan/assimp/0001-Fix-path-for-_IMPORT_CHECK_FILES_FOR_assimp.patch b/meta/recipes-graphics/vulkan/assimp/0001-Fix-path-for-_IMPORT_CHECK_FILES_FOR_assimp.patch
> new file mode 100644
> index 0000000000..61c40a33c8
> --- /dev/null
> +++ b/meta/recipes-graphics/vulkan/assimp/0001-Fix-path-for-_IMPORT_CHECK_FILES_FOR_assimp.patch
> @@ -0,0 +1,93 @@
> +From 330914fed75cde09f48553cae92bed89925d98d8 Mon Sep 17 00:00:00 2001
> +From: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
> +Date: Mon, 6 Sep 2021 16:30:38 +0530
> +Subject: [PATCH] Fix path for _IMPORT_CHECK_FILES_FOR_assimp
> +
> +Fix path for _IMPORT_CHECK_FILES_FOR_assimp
> +As it is giving configuration error during validation of path
> +when used by 3rd party component to configure itself
> +using assimp::assimp target.
> +Compute the installation prefix relative to file.
> +
> +Upstream-Status: Submitted [https://github.com/assimp/assimp/pull/4071]
> +
> +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> +Signed-off-by: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
> +---
> + assimpTargets-release.cmake.in | 10 +++++-----
> + assimpTargets.cmake.in         | 12 ++++++++++++
> + 2 files changed, 17 insertions(+), 5 deletions(-)
> +
> +diff --git a/assimpTargets-release.cmake.in b/assimpTargets-release.cmake.in
> +index a416e8899..cd91e1277 100644
> +--- a/assimpTargets-release.cmake.in
> ++++ b/assimpTargets-release.cmake.in
> +@@ -46,8 +46,8 @@ if(MSVC)
> +       IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_BINDIR@/${sharedLibraryName}"
> +     )
> +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "@CMAKE_INSTALL_FULL_LIBDIR@/${importLibraryName}")
> +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "@CMAKE_INSTALL_FULL_BINDIR@/${sharedLibraryName}" )
> ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFIX}/lib/${importLibraryName}")
> ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFIX}/bin/${sharedLibraryName}")
> +   else()
> +     set(staticLibraryName "assimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
> +
> +@@ -57,7 +57,7 @@ if(MSVC)
> +       IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
> +     )
> +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}")
> ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFIX}/lib/${staticLibraryName}")
> +   endif()
> +
> + else()
> +@@ -73,14 +73,14 @@ else()
> +       IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}"
> +     )
> +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}" )
> ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFIX}/lib/${sharedLibraryName}" )
> +   else()
> +     set(staticLibraryName "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
> +     set_target_properties(assimp::assimp PROPERTIES
> +       IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}"
> +     )
> +     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> +-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}" )
> ++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFIX}/lib/${staticLibraryName}" )
> +   endif()
> + endif()
> +
> +diff --git a/assimpTargets.cmake.in b/assimpTargets.cmake.in
> +index ef90c834a..140386660 100644
> +--- a/assimpTargets.cmake.in
> ++++ b/assimpTargets.cmake.in
> +@@ -40,6 +40,15 @@ unset(_targetsDefined)
> + unset(_targetsNotDefined)
> + unset(_expectedTargets)
> +
> ++# Compute the installation prefix relative to this file.
> ++get_filename_component(_IMPORT_PREFIX "${CMAKE_CURRENT_LIST_FILE}" PATH)
> ++get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
> ++get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
> ++get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
> ++if(_IMPORT_PREFIX STREQUAL "/")
> ++  set(_IMPORT_PREFIX "")
> ++endif()
> ++
> + # Create imported target assimp::assimp
> + if(@BUILD_SHARED_LIBS@)
> +   add_library(assimp::assimp SHARED IMPORTED)
> +@@ -65,6 +74,9 @@ foreach(f ${CONFIG_FILES})
> +   include(${f})
> + endforeach()
> +
> ++# Cleanup temporary variables.
> ++set(_IMPORT_PREFIX)
> ++
> + # Loop over all imported files and verify that they actually exist
> + foreach(target ${_IMPORT_CHECK_TARGETS} )
> +   foreach(file ${_IMPORT_CHECK_FILES_FOR_${target}} )
> +--
> +2.17.1
> diff --git a/meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch b/meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch
> deleted file mode 100644
> index 1078148d6b..0000000000
> --- a/meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> -Date: Fri, 13 Aug 2021 16:42:48 +0530
> -Subject: [PATCH] assimp: remove shared lib from _IMPORT_CHECK_TARGETS
> -
> -In the target assimp::assimp shared library verification removed
> -as it is giving configuration error when used by 3rd part component to
> -configure itself using assimp::assimp target
> -
> -Upstream-Status: Inappropriate [oe specific]
> -
> -Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> ----
> - assimpTargets-release.cmake.in | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/assimpTargets-release.cmake.in b/assimpTargets-release.cmake.in
> -index cd2fac7e0..52edc7990 100644
> ---- a/assimpTargets-release.cmake.in
> -+++ b/assimpTargets-release.cmake.in
> -@@ -72,8 +72,8 @@ else()
> -       IMPORTED_SONAME_RELEASE "${sharedLibraryName}"
> -       IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}"
> -     )
> --    list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> --    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}" )
> -+    #list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
> -+    #list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}" )
> -   else()
> -     set(staticLibraryName "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
> -     set_target_properties(assimp::assimp PROPERTIES
> ---
> -2.17.1
> diff --git a/meta/recipes-graphics/vulkan/assimp_5.0.1.bb b/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
> index a81be08481..154d17d26b 100644
> --- a/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
> +++ b/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
> @@ -11,7 +11,7 @@ DEPENDS = "zlib"
>  SRC_URI = "git://github.com/assimp/assimp.git;branch=assimp_5.0_release \
>             file://0001-closes-https-github.com-assimp-assimp-issues-2733-up.patch \
>             file://use-GNUInstallDirs-where-possible.patch \
> -           file://0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch \
> +           file://0001-Fix-path-for-_IMPORT_CHECK_FILES_FOR_assimp.patch \
>             "
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
>
> --
> 2.17.1
>
>
> 
>
