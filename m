Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AAE8C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 19:32:31 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web12.16200.1639078349650250935
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 11:32:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B6zVMX2p;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id f186so16193120ybg.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 11:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n/CrCwgkw1J0Lm+sj+GH8hItaz88Q7xOQxsfgW9+r4k=;
        b=B6zVMX2poQ7CrfyjxRrj0MFMg7DwdI5E2Rf9h1k0O57CJWNNLvF/LyR5bOh8inGMID
         NG/djuKT1FRCq9oCycLy1BTeLT40nKpj91wxKcGdOU/Hml7AKrg7tLRL+PHZKl2JSYdK
         hOyIQSIDi7XiyzBUkCw5BbYRs48SPl0of1TF2QCx4lCRJNSyrkWUJYDrv2hWd4594/7i
         d4y/+clHOU95mlSkAUedC8Q4sjDA/LLMwEFHV7FDI9x0n3qgDon7CW/15tFEGxvBh8TC
         V6Tm8ngw4zs56Bh04efQfwDiyxQkRDfUmnpZ4PYYxhs534+vYWrRjblRTWCZMhtBi+wK
         UoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n/CrCwgkw1J0Lm+sj+GH8hItaz88Q7xOQxsfgW9+r4k=;
        b=NbH5KxJWg7R8QiYkVk9k+HURy+Dpl+Xnw7k3q71+OF8lzI9LqNiO25Cpl0aaSjKp9f
         Wc3nBg0sKDghr92Zw3Hs3xYjBbJV4VPxby1KLNeFc6Hdq3r5o5sJEXr4TO8RehNUz/LA
         tUQrq+W6p3ECGK+d5qlZNcK+vzX6EU6IiWXtBfxUAmJp6aIlu7hf+vJfHACGeAQa3F8y
         nR3gH/ex3zUu4kmSZBgT3dtgfB0Ly1bBoHdGrZelF+BqDNTi5+Zqxi69xE8Nq9HuhaKS
         /LKswUpCIKjsmJ+xBETkkYrJOfQWsS+hsA6hX+ag8gejtnv2NdQSzPoE8dbe2ifc5AV+
         MYQw==
X-Gm-Message-State: AOAM530bI+P971ZJKy7V2uxxSMBDeObqLL4FjcH1XES7rZSJn1ROZ2y/
	EfRGcprRl0jSrusRjCuU/Zc07alSJVTz0IVLZ2c=
X-Google-Smtp-Source: 
 ABdhPJwyviVU9CUQ2uS4OIw4mFf74phPfGzp5L1DHUyuHKm3FEwWcA+ldHYk1+f2VgMDm/5AALsrwTLbJ8ME5u4o3LY=
X-Received: by 2002:a25:9bc9:: with SMTP id w9mr8557383ybo.398.1639078348742;
 Thu, 09 Dec 2021 11:32:28 -0800 (PST)
MIME-Version: 1.0
References: <cover.1638555254.git.steve@sakoman.com>
 <80ab29b962cea17a4f2486ad25577bc830cdd8d9.1638555254.git.steve@sakoman.com>
 <929bdc2257cb8de09bec15e256db812bd83df309.camel@iris-sensing.com>
In-Reply-To: <929bdc2257cb8de09bec15e256db812bd83df309.camel@iris-sensing.com>
From: Steve Sakoman <sakoman@gmail.com>
Date: Thu, 9 Dec 2021 09:32:17 -1000
Message-ID: 
 <CAGDS+n=ouuL=LkeunPriDR8PfR6zRPCvfxQ3pwrvEXtfh46R+Q@mail.gmail.com>
Subject: Re: [OE-core][dunfell 16/18] cmake: FindGTest: Add target for gmock
 library
To: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	"eero.aaltonen@vaisala.com" <eero.aaltonen@vaisala.com>,
 "martin@mko.dev" <martin@mko.dev>,
	Daniel Baumgart <Daniel.Baumgart@iris-sensing.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 19:32:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159475

On Thu, Dec 9, 2021 at 7:38 AM Jasper Orschulko
<Jasper.Orschulko@iris-sensing.com> wrote:
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
>
> Hi,
>
> I can't provide any details yet, but I can say with certainty that this
> patch breaks our build (using the parent commit
>         746b301d37f9b7333f3d93e6fb7ea2808665df41 as refspec during the build worksasexpected):
>
> [...] undefined reference to `testing::*
>
> Can someone confirm this issue? Feel free to reach out for further
> details.

I've not seen any issues in either local or autobuilder testing, so I
think we need more details!

Steve

> On Fri, 2021-12-03 at 08:19 -1000, Steve Sakoman wrote:
> > From: Eero Aaltonen <eero.aaltonen@vaisala.com>
> >
> > `googlemock` has been absorbed into the
> > [googletest](https://github.com/google/googletest) project and is
> > built
> > and installed from the same source tree.
> >
> > `googletest` has provided a CMake Config-file Package starting with
> > GTest 1.8.1. `find_package(GTest ...)` by default dispatches first to
> > CMake Find Module. Starting with CMake commit
> > 2327b4330cce157d616ff8b611b3e77568d00351 in CMake v3.20.0 the module
> > dispatches onward to the Config-file Package so that the same targets
> > are available. In pre v3.20.0 versions of CMake however the Find
> > Module
> > masks the targets provided by the upstream `GTest` package.
> >
> > Update `Modules/FindGTest.cmake` to provide the same targets as the
> > CMake Config-file Package and backwards compatible targets and result
> > variables.
> >
> > Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  .../cmake/cmake-native_3.16.5.bb              |   1 +
> >  ...ndGTest-Add-target-for-gmock-library.patch | 255
> > ++++++++++++++++++
> >  2 files changed, 256 insertions(+)
> >  create mode 100644 meta/recipes-devtools/cmake/cmake/0006-cmake-
> > FindGTest-Add-target-for-gmock-library.patch
> >
> > diff --git a/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
> > b/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
> > index b2952ee5f5..96a7be6770 100644
> > --- a/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
> > +++ b/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
> > @@ -7,6 +7,7 @@ SRC_URI += "file://OEToolchainConfig.cmake \
> >              file://environment.d-cmake.sh \
> >
> > file://0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
> >  \
> >
> > file://0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
> >  \
> > +
> > file://0006-cmake-FindGTest-Add-target-for-gmock-library.patch \
> >              "
> >
> >
> > diff --git a/meta/recipes-devtools/cmake/cmake/0006-cmake-FindGTest-
> > Add-target-for-gmock-library.patch b/meta/recipes-
> > devtools/cmake/cmake/0006-cmake-FindGTest-Add-target-for-gmock-
> > library.patch
> > new file mode 100644
> > index 0000000000..267f586a71
> > --- /dev/null
> > +++ b/meta/recipes-devtools/cmake/cmake/0006-cmake-FindGTest-Add-
> > target-for-gmock-library.patch
> > @@ -0,0 +1,255 @@
> > +From 39eae0d6c1b398f18761abac7f55944f0290f8a1 Mon Sep 17 00:00:00
> > 2001
> > +From: Eero Aaltonen <eero.aaltonen@iki.fi>
> > +Date: Sun, 17 Oct 2021 17:13:07 +0300
> > +Subject: [PATCH] FindGTest: Add target for gmock library
> > +
> > +`googlemock` has been absorbed into the
> > +[googletest](https://github.com/google/googletest) project and is
> > built
> > +and installed from the same source tree.
> > +
> > +As GTest may be built with or without GMock, skip GMock if it is not
> > +present.
> > +
> > +Do not provide result variables for GMock.  They are not provided by
> > +upstream GTest's CMake Package Configuration File.
> > +
> > +Also update the test case to cover linking to `GTest::gmock`.
> > +
> > +The patch was imported from the Kitware git server
> > +(git@gitlab.kitware.com:cmake/cmake.git) as of commit id
> > +50bf457a0dd857cf976b22c5be7d333493233d1e
> > +
> > +Patch was modified to support upper case variable `GTEST_FOUND`.
> > +
> > +Upstream-Status: Accepted
> > [https://gitlab.kitware.com/cmake/cmake/-/merge_requests/6632]
> > +Milestone: 3.23.0
> > +
> > +Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
> > +---
> > + .../dev/FindGTest-target-for-gmock.rst        |   4 +
> > + Modules/FindGTest.cmake                       | 133
> > +++++++++++++++---
> > + Tests/FindGTest/Test/CMakeLists.txt           |   4 +
> > + 3 files changed, 121 insertions(+), 20 deletions(-)
> > + create mode 100644 Help/release/dev/FindGTest-target-for-gmock.rst
> > +
> > +diff --git a/Help/release/dev/FindGTest-target-for-gmock.rst
> > b/Help/release/dev/FindGTest-target-for-gmock.rst
> > +new file mode 100644
> > +index 0000000000..f78242c80e
> > +--- /dev/null
> > ++++ b/Help/release/dev/FindGTest-target-for-gmock.rst
> > +@@ -0,0 +1,4 @@
> > ++FindGTest-target-for-gmock
> > ++--------------------------
> > ++
> > ++* The :module:`FindGTest` module now provides a target for GMock,
> > if found.
> > +diff --git a/Modules/FindGTest.cmake b/Modules/FindGTest.cmake
> > +index e015a9840f..0331049594 100644
> > +--- a/Modules/FindGTest.cmake
> > ++++ b/Modules/FindGTest.cmake
> > +@@ -7,10 +7,23 @@ FindGTest
> > +
> > + Locate the Google C++ Testing Framework.
> > +
> > ++.. versionadded:: 3.20
> > ++  Upstream ``GTestConfig.cmake`` is used if possible.
> > ++
> > + Imported targets
> > + ^^^^^^^^^^^^^^^^
> > +
> > +-This module defines the following :prop_tgt:`IMPORTED` targets:
> > ++  This module defines the following :prop_tgt:`IMPORTED` targets:
> > ++
> > ++``GTest::gtest``
> > ++  The Google Test ``gtest`` library, if found; adds Thread::Thread
> > ++  automatically
> > ++``GTest::gtest_main``
> > ++  The Google Test ``gtest_main`` library, if found
> > ++
> > ++.. deprecated:: 3.20
> > ++  For backwards compatibility, this module defines additionally the
> > ++  following deprecated :prop_tgt:`IMPORTED` targets (available
> > since 3.5):
> > +
> > + ``GTest::GTest``
> > +   The Google Test ``gtest`` library, if found; adds Thread::Thread
> > +@@ -18,7 +31,6 @@ This module defines the following
> > :prop_tgt:`IMPORTED` targets:
> > + ``GTest::Main``
> > +   The Google Test ``gtest_main`` library, if found
> > +
> > +-
> > + Result variables
> > + ^^^^^^^^^^^^^^^^
> > +
> > +@@ -146,8 +158,42 @@ function(__gtest_import_library _target _var
> > _config)
> > +     endif()
> > + endfunction()
> > +
> > ++function(__gtest_define_backwards_compatible_library_targets)
> > ++    set(GTEST_BOTH_LIBRARIES ${GTEST_LIBRARIES}
> > ${GTEST_MAIN_LIBRARIES} PARENT_SCOPE)
> > ++
> > ++    # Add targets mapping the same library names as defined in
> > ++    # older versions of CMake's FindGTest
> > ++    if(NOT TARGET GTest::GTest)
> > ++        add_library(GTest::GTest INTERFACE IMPORTED)
> > ++        target_link_libraries(GTest::GTest INTERFACE GTest::gtest)
> > ++    endif()
> > ++    if(NOT TARGET GTest::Main)
> > ++        add_library(GTest::Main INTERFACE IMPORTED)
> > ++        target_link_libraries(GTest::Main INTERFACE
> > GTest::gtest_main)
> > ++    endif()
> > ++endfunction()
> > ++
> > + #
> > +
> > ++include(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cma
> > ke)
> > ++
> > ++# first specifically look for the CMake version of GTest
> > ++find_package(GTest QUIET NO_MODULE)
> > ++
> > ++# if we found the GTest cmake package then we are done, and
> > ++# can print what we found and return.
> > ++if(GTest_FOUND)
> > ++    set(GTEST_FOUND ${GTest_FOUND})
> > ++    FIND_PACKAGE_HANDLE_STANDARD_ARGS(GTest HANDLE_COMPONENTS
> > CONFIG_MODE)
> > ++
> > ++    set(GTEST_LIBRARIES      GTest::gtest)
> > ++    set(GTEST_MAIN_LIBRARIES GTest::gtest_main)
> > ++
> > ++    __gtest_define_backwards_compatible_library_targets()
> > ++
> > ++    return()
> > ++endif()
> > ++
> > + if(NOT DEFINED GTEST_MSVC_SEARCH)
> > +     set(GTEST_MSVC_SEARCH MD)
> > + endif()
> > +@@ -194,50 +240,97 @@ if(MSVC AND GTEST_MSVC_SEARCH STREQUAL "MD")
> > +     __gtest_find_library(GTEST_LIBRARY_DEBUG      gtest-mdd gtestd)
> > +     __gtest_find_library(GTEST_MAIN_LIBRARY       gtest_main-md
> > gtest_main)
> > +     __gtest_find_library(GTEST_MAIN_LIBRARY_DEBUG gtest_main-mdd
> > gtest_maind)
> > ++    __gtest_find_library(GMOCK_LIBRARY            gmock-md  gmock)
> > ++    __gtest_find_library(GMOCK_LIBRARY_DEBUG      gmock-mdd gmockd)
> > ++    __gtest_find_library(GMOCK_MAIN_LIBRARY       gmock_main-md
> > gmock_main)
> > ++    __gtest_find_library(GMOCK_MAIN_LIBRARY_DEBUG gmock_main-mdd
> > gmock_maind)
> > + else()
> > +     __gtest_find_library(GTEST_LIBRARY            gtest)
> > +     __gtest_find_library(GTEST_LIBRARY_DEBUG      gtestd)
> > +     __gtest_find_library(GTEST_MAIN_LIBRARY       gtest_main)
> > +     __gtest_find_library(GTEST_MAIN_LIBRARY_DEBUG gtest_maind)
> > ++    __gtest_find_library(GMOCK_LIBRARY            gmock)
> > ++    __gtest_find_library(GMOCK_LIBRARY_DEBUG      gmockd)
> > ++    __gtest_find_library(GMOCK_MAIN_LIBRARY       gmock_main)
> > ++    __gtest_find_library(GMOCK_MAIN_LIBRARY_DEBUG gmock_maind)
> > + endif()
> > +
> > +-
> > include(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake
> > )
> > + FIND_PACKAGE_HANDLE_STANDARD_ARGS(GTest DEFAULT_MSG GTEST_LIBRARY
> > GTEST_INCLUDE_DIR GTEST_MAIN_LIBRARY)
> > +
> > +-if(GTEST_FOUND)
> > ++if(GMOCK_LIBRARY AND GMOCK_MAIN_LIBRARY)
> > ++    set(GMock_FOUND True)
> > ++else()
> > ++    set(GMock_FOUND False)
> > ++endif()
> > ++
> > ++if(GTest_FOUND)
> > +     set(GTEST_INCLUDE_DIRS ${GTEST_INCLUDE_DIR})
> > +     __gtest_append_debugs(GTEST_LIBRARIES      GTEST_LIBRARY)
> > +     __gtest_append_debugs(GTEST_MAIN_LIBRARIES GTEST_MAIN_LIBRARY)
> > +-    set(GTEST_BOTH_LIBRARIES ${GTEST_LIBRARIES}
> > ${GTEST_MAIN_LIBRARIES})
> > +
> > +     find_package(Threads QUIET)
> > +
> > +-    if(NOT TARGET GTest::GTest)
> > ++    if(NOT TARGET GTest::gtest)
> > +         __gtest_determine_library_type(GTEST_LIBRARY)
> > +-        add_library(GTest::GTest ${GTEST_LIBRARY_TYPE} IMPORTED)
> > ++        add_library(GTest::gtest ${GTEST_LIBRARY_TYPE} IMPORTED)
> > +         if(TARGET Threads::Threads)
> > +-            set_target_properties(GTest::GTest PROPERTIES
> > ++            set_target_properties(GTest::gtest PROPERTIES
> > +                 INTERFACE_LINK_LIBRARIES Threads::Threads)
> > +         endif()
> > +         if(GTEST_LIBRARY_TYPE STREQUAL "SHARED")
> > +-            set_target_properties(GTest::GTest PROPERTIES
> > ++            set_target_properties(GTest::gtest PROPERTIES
> > +                 INTERFACE_COMPILE_DEFINITIONS
> > "GTEST_LINKED_AS_SHARED_LIBRARY=1")
> > +         endif()
> > +         if(GTEST_INCLUDE_DIRS)
> > +-            set_target_properties(GTest::GTest PROPERTIES
> > ++            set_target_properties(GTest::gtest PROPERTIES
> > +                 INTERFACE_INCLUDE_DIRECTORIES
> > "${GTEST_INCLUDE_DIRS}")
> > +         endif()
> > +-        __gtest_import_library(GTest::GTest GTEST_LIBRARY "")
> > +-        __gtest_import_library(GTest::GTest GTEST_LIBRARY
> > "RELEASE")
> > +-        __gtest_import_library(GTest::GTest GTEST_LIBRARY "DEBUG")
> > ++        __gtest_import_library(GTest::gtest GTEST_LIBRARY "")
> > ++        __gtest_import_library(GTest::gtest GTEST_LIBRARY
> > "RELEASE")
> > ++        __gtest_import_library(GTest::gtest GTEST_LIBRARY "DEBUG")
> > +     endif()
> > +-    if(NOT TARGET GTest::Main)
> > ++    if(NOT TARGET GTest::gtest_main)
> > +         __gtest_determine_library_type(GTEST_MAIN_LIBRARY)
> > +-        add_library(GTest::Main ${GTEST_MAIN_LIBRARY_TYPE}
> > IMPORTED)
> > +-        set_target_properties(GTest::Main PROPERTIES
> > +-            INTERFACE_LINK_LIBRARIES "GTest::GTest")
> > +-        __gtest_import_library(GTest::Main GTEST_MAIN_LIBRARY "")
> > +-        __gtest_import_library(GTest::Main GTEST_MAIN_LIBRARY
> > "RELEASE")
> > +-        __gtest_import_library(GTest::Main GTEST_MAIN_LIBRARY
> > "DEBUG")
> > ++        add_library(GTest::gtest_main ${GTEST_MAIN_LIBRARY_TYPE}
> > IMPORTED)
> > ++        set_target_properties(GTest::gtest_main PROPERTIES
> > ++            INTERFACE_LINK_LIBRARIES "GTest::gtest")
> > ++        __gtest_import_library(GTest::gtest_main GTEST_MAIN_LIBRARY
> > "")
> > ++        __gtest_import_library(GTest::gtest_main GTEST_MAIN_LIBRARY
> > "RELEASE")
> > ++        __gtest_import_library(GTest::gtest_main GTEST_MAIN_LIBRARY
> > "DEBUG")
> > ++    endif()
> > ++
> > ++    __gtest_define_backwards_compatible_library_targets()
> > ++endif()
> > ++
> > ++if(GMock_FOUND)
> > ++    if(NOT TARGET GTest::gmock)
> > ++        __gtest_determine_library_type(GMOCK_LIBRARY)
> > ++        add_library(GTest::gmock ${GMOCK_LIBRARY_TYPE} IMPORTED)
> > ++        set(_gmock_link_libraries "GTest::gtest")
> > ++        if(TARGET Threads::Threads)
> > ++            list(APPEND _gmock_link_libraries Threads::Threads)
> > ++        endif()
> > ++        set_target_properties(GTest::gmock PROPERTIES
> > ++            INTERFACE_LINK_LIBRARIES "${_gmock_link_libraries}")
> > ++        if(GMOCK_LIBRARY_TYPE STREQUAL "SHARED")
> > ++            set_target_properties(GTest::gmock PROPERTIES
> > ++                INTERFACE_COMPILE_DEFINITIONS
> > "GMOCK_LINKED_AS_SHARED_LIBRARY=1")
> > ++        endif()
> > ++        if(GTEST_INCLUDE_DIRS)
> > ++            set_target_properties(GTest::gmock PROPERTIES
> > ++                INTERFACE_INCLUDE_DIRECTORIES
> > "${GTEST_INCLUDE_DIRS}")
> > ++        endif()
> > ++        __gtest_import_library(GTest::gmock GMOCK_LIBRARY "")
> > ++        __gtest_import_library(GTest::gmock GMOCK_LIBRARY
> > "RELEASE")
> > ++        __gtest_import_library(GTest::gmock GMOCK_LIBRARY "DEBUG")
> > ++    endif()
> > ++    if(NOT TARGET GTest::gmock_main)
> > ++        __gtest_determine_library_type(GMOCK_MAIN_LIBRARY)
> > ++        add_library(GTest::gmock_main ${GMOCK_MAIN_LIBRARY_TYPE}
> > IMPORTED)
> > ++        set_target_properties(GTest::gmock_main PROPERTIES
> > ++            INTERFACE_LINK_LIBRARIES "GTest::gmock")
> > ++        __gtest_import_library(GTest::gmock_main GMOCK_MAIN_LIBRARY
> > "")
> > ++        __gtest_import_library(GTest::gmock_main GMOCK_MAIN_LIBRARY
> > "RELEASE")
> > ++        __gtest_import_library(GTest::gmock_main GMOCK_MAIN_LIBRARY
> > "DEBUG")
> > +     endif()
> > + endif()
> > +diff --git a/Tests/FindGTest/Test/CMakeLists.txt
> > b/Tests/FindGTest/Test/CMakeLists.txt
> > +index b65b9d28f6..7d3a378a65 100644
> > +--- a/Tests/FindGTest/Test/CMakeLists.txt
> > ++++ b/Tests/FindGTest/Test/CMakeLists.txt
> > +@@ -12,3 +12,7 @@ add_executable(test_gtest_var main.cxx)
> > + target_include_directories(test_gtest_var PRIVATE
> > ${GTEST_INCLUDE_DIRS})
> > + target_link_libraries(test_gtest_var PRIVATE
> > ${GTEST_BOTH_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})
> > + add_test(NAME test_gtest_var COMMAND test_gtest_var)
> > ++
> > ++add_executable(test_gmock_tgt main.cxx)
> > ++target_link_libraries(test_gmock_tgt GTest::gmock_main)
> > ++add_test(NAME test_gmock_tgt COMMAND test_gmock_tgt)
> > +--
> > +2.17.1
> > +
> -----BEGIN PGP SIGNATURE-----
>
> iQEzBAEBCAAdFiEE4WyPMIC5Ap4+Ooo1Ygqew07VMNUFAmGyPwAACgkQYgqew07V
> MNU+qwf/a6pDdacJlCGlNha+d2AbkAqiAlC/djP0i5h17mhRhvfZWwvm8DlyXUNL
> oYjhi7y6PvO2H7TTsACey7bBcGBwyikTrpBrloxaa+KDKkG1OIvpzJBlRNGA/PUT
> vZMmDtL6S4E3SuxwBT8P/ShH+RSijJDWVq+9UgNz6jyuNIx4lSVU9lVTACNpN4Mj
> PI5YXl3g6HZA364UnEZ+KFKwoc5Ihm5U71KkKKekNaOVNf4rzkcwy8bQFc0WyH42
> 4N/sPDByu/8INnabZm04ypqIOAMGOKsLjuZqvy2PeFiBoXCRsxJD9SF6iFFVeuuc
> /lP9iIFOIHxUFkeopGvLH7ol8YQtow==
> =72K+
> -----END PGP SIGNATURE-----
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159473): https://lists.openembedded.org/g/openembedded-core/message/159473
> Mute This Topic: https://lists.openembedded.org/mt/87483225/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sakoman@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

