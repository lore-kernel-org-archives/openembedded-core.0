Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id F13F275456
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 21:26:34 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id o13-v6so20417510wmf.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jun 2018 14:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8ef05TM3gMvQfp9MUgbKzYts/3mlf47LUCLLS4bvqHI=;
	b=EhphAAx1tpUO84pbHD0YrQE5W6lcXkQFMYNQbRA8TD6BRa6fpSd3P0FwYRhnM7ZspM
	k5NeY6bjul/EeES+xdHzJAptWM2hdw82ExYkiD+AAdliQA0lrfGr9br317fBThcBfiPy
	oqEWCpQj3ZGfG+1i5jeihNCCFmWSFZwVnIeUcwy76EqYgp7SaTEo2PB327XrH8NwcZpO
	WicpOamZlvliTDSUcV4056RQjQwgjEkUM4kdbyWp6eD8CW08J1jEzR7TqPva/GUwaIjh
	ENkHvVnAOQ9aQLaHp9BVYkUleEcKzLGZCyXQn2zq8xEIsLhfRseDqBlvFMzMdbj3tb0V
	ogEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8ef05TM3gMvQfp9MUgbKzYts/3mlf47LUCLLS4bvqHI=;
	b=Enp/KGSYsA8U1tV6+pzAWA9aPD0r72TzOSLcm33a/22Qo7ymb3grjr1fDhUy3drMk9
	e4i3m2LYe6C6eXubP4YckB2Fg44lcCikaj8HI5BjnNcMdpytiQsHKlf294Yr84BwyfaS
	IByVb13x1LQRoxxAl+1BkMMQfkBszT71eA7qjJGNSQa7N++/1YoRnPwoEZk/TOxq+6Vu
	jSh/nQE6aAHaywCNiV0DR4VPSFQ7Q39+oTGmy+NBiXOXZPV/rWuY1lJBKuOOD8LXYBCq
	3CO+iC3Fb8smDLpxy3++qXc50PzOIJIvkm5IsEUbO0DVS9okWv2XQBJxLF99xGEDtIJq
	/brw==
X-Gm-Message-State: APt69E0NwoUBIBSJ5K5qvrNavh+EJg7ChdBaept+SEH4IXoCUsqNTUgv
	Z7181I33uw0rVER5wfxNkPW9IfcGj0Irs7Wq6nIJwesp
X-Google-Smtp-Source: ADUXVKLFjs9ZqEJYczBhfsicINj+ICXxVx39bMDJ1FxQFrShm6sC+OOjsz5TlAdy6SYUiGZhBvI4WbcIhrXkBSniIXY=
X-Received: by 2002:a50:f310:: with SMTP id
	p16-v6mr4115303edm.183.1528406795349; 
	Thu, 07 Jun 2018 14:26:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a50:afe6:0:0:0:0:0 with HTTP;
	Thu, 7 Jun 2018 14:26:34 -0700 (PDT)
In-Reply-To: <1528064539-32128-2-git-send-email-akuster808@gmail.com>
References: <1528064539-32128-1-git-send-email-akuster808@gmail.com>
	<1528064539-32128-2-git-send-email-akuster808@gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Thu, 7 Jun 2018 23:26:34 +0200
Message-ID: <CAAQYJAvH0+mS8d=gKo6Ud+30MbN6a1j-90u0ucoeKH4OzGtfaw@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] cmake: fix build issue with boost 1.67.0
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
X-List-Received-Date: Thu, 07 Jun 2018 21:26:35 -0000
Content-Type: text/plain; charset="UTF-8"

Armin,

I pulled yesterday and all was okay.
After today's pull I see

| [ 43%] Building CXX object Source/CMakeFiles/CMakeLib.dir/cmDefinitions.cxx.o
| cd /tmp/build/tmp-musl/work/x86_64-linux/cmake-native/3.10.3-r0/build/Source
&& /tmp/build/tmp-musl/hosttools/g++  -DCMAKE_BUILD_WITH_CMAKE
-DLIBARCHIVE_STATIC
-I/tmp/build/tmp-musl/work/x86_64-linux/cmake-native/3.10.3-r0/build/Utilities
-I/tmp/build/tmp-musl/work/x86_64-linux/cmake-native/3.10.3-r0/cmake-3.10.3/Utilities
-I/tmp/build/tmp-musl/work/x86_64-linux/cmake-native/3.10.3-r0/build/Source
-I/tmp/build/tmp-musl/work/x86_64-linux/cmake-native/3.10.3-r0/cmake-3.10.3/Source
-I/tmp/build/tmp-musl/work/x86_64-linux/cmake-native/3.10.3-r0/cmake-3.10.3/Source/LexerParser
-I/tmp/build/tmp-musl/work/x86_64-linux/cmake-native/3.10.3-r0/recipe-sysroot-native/usr/include
-I/tmp/build/tmp-musl/work/x86_64-linux/cmake-native/3.10.3-r0/build/Utilities/cmcompress
-I/tmp/build/tmp-musl/work/x86_64-linux/cmake-native/3.10.3-r0/cmake-3.10.3/Source/CTest
-I/tmp/build/tmp-musl/work/x86_64-linux/cmake-native/3.10.3-r0/cmake-3.10.3/Source/CPack
-I/tmp/build/tmp-musl/work/x86_64-linux/cmake-native/3.10.3-r0/build/Source/kwsys
 -isystem/tmp/build/tmp-musl/work/x86_64-linux/cmake-native/3.10.3-r0/recipe-sysroot-native/usr/include
-O2 -pipe   -std=gnu++14 -o
CMakeFiles/CMakeLib.dir/cmDefinitions.cxx.o -c
/tmp/build/tmp-musl/work/x86_64-linux/cmake-native/3.10.3-r0/cmake-3.10.3/Source/cmDefinitions.cxx
| g++: internal compiler error: Killed (program cc1plus)
| Please submit a full bug report,
| with preprocessed source if appropriate.
| See <file:///usr/share/doc/gcc-5/README.Bugs> for instructions.
| Source/CMakeFiles/CMakeLib.dir/build.make:449: recipe for target
'Source/CMakeFiles/CMakeLib.dir/cmComputeLinkDepends.cxx.o' failed
| make[2]: *** [Source/CMakeFiles/CMakeLib.dir/cmComputeLinkDepends.cxx.o]
Error 4
| make[2]: *** Deleting file
'Source/CMakeFiles/CMakeLib.dir/cmComputeLinkDepends.cxx.o'
| make[2]: *** Waiting for unfinished jobs....
| make[2]: Leaving directory
'/tmp/build/tmp-musl/work/x86_64-linux/cmake-native/3.10.3-r0/build'
| CMakeFiles/Makefile2:1857: recipe for target
'Source/CMakeFiles/CMakeLib.dir/all' failed
| make[1]: *** [Source/CMakeFiles/CMakeLib.dir/all] Error 2
| make[1]: Leaving directory
'/tmp/build/tmp-musl/work/x86_64-linux/cmake-native/3.10.3-r0/build'
| ERROR: oe_runmake failed
| Makefile:165: recipe for target 'all' failed
| make: *** [all] Error 2
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at
/tmp/build/tmp-musl/work/x86_64-linux/cmake-native/3.10.3-r0/temp/log.do_compile.27255)
ERROR: Task (/oe/oe-core/meta/recipes-devtools/cmake/cmake-native_3.10.3.bb:do_compile)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 2162 tasks of which 1363 didn't need to
be rerun and 1 failed.

git revert 04f367e27e66105466611bee4d63abc78e0a4725
and cmake-native builds fine again.

To repeat this, I did restore with

git reset --hard HEAD^1

and surprise, it now builds with the patch applied.
Doh!

Andrea

On Mon, Jun 4, 2018 at 12:22 AM, Armin Kuster <akuster808@gmail.com> wrote:
> this fixes a build issue with boost 1.67.0
>
> [Yocto 12762]
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-devtools/cmake/cmake.inc              |   3 +
>  ...enerate-imported-targets-for-future-Boost.patch |  35 +++
>  ...005-FindBoost-support-OPTIONAL_COMPONENTS.patch |  42 +++
>  ...dd-support-for-Boost-1.67-with-Python-ver.patch | 296 +++++++++++++++++++++
>  4 files changed, 376 insertions(+)
>  create mode 100644 meta/recipes-devtools/cmake/cmake/0004-FindBoost-Generate-imported-targets-for-future-Boost.patch
>  create mode 100644 meta/recipes-devtools/cmake/cmake/0005-FindBoost-support-OPTIONAL_COMPONENTS.patch
>  create mode 100644 meta/recipes-devtools/cmake/cmake/0006-FindBoost-Add-support-for-Boost-1.67-with-Python-ver.patch
>
> diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
> index 394c9eb..533db6a 100644
> --- a/meta/recipes-devtools/cmake/cmake.inc
> +++ b/meta/recipes-devtools/cmake/cmake.inc
> @@ -20,6 +20,9 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
>             file://0001-FindBoost-Fix-incorrect-alphabetisation-of-headers-l.patch \
>             file://0002-FindBoost-Implement-Architecture-and-Address-Model-t.patch \
>             file://0003-FindBoost-Search-for-upstream-packaged-libs-next-to-.patch \
> +           file://0004-FindBoost-Generate-imported-targets-for-future-Boost.patch \
> +           file://0005-FindBoost-support-OPTIONAL_COMPONENTS.patch \
> +           file://0006-FindBoost-Add-support-for-Boost-1.67-with-Python-ver.patch \
>             "
>
>  SRC_URI[md5sum] = "1c38c67295ca696aeafd8c059d748b38"
> diff --git a/meta/recipes-devtools/cmake/cmake/0004-FindBoost-Generate-imported-targets-for-future-Boost.patch b/meta/recipes-devtools/cmake/cmake/0004-FindBoost-Generate-imported-targets-for-future-Boost.patch
> new file mode 100644
> index 0000000..bec04c4
> --- /dev/null
> +++ b/meta/recipes-devtools/cmake/cmake/0004-FindBoost-Generate-imported-targets-for-future-Boost.patch
> @@ -0,0 +1,35 @@
> +From 6297d6c7fd6f80dafe17c0aefeeb0439432aa4b0 Mon Sep 17 00:00:00 2001
> +From: "Paul \"TBBle\" Hampson" <Paul.Hampson@Pobox.com>
> +Date: Sat, 30 Dec 2017 16:00:29 +1100
> +Subject: [PATCH 4/6] FindBoost: Generate imported targets for future Boost
> + versions
> +
> +Per discussion on cmake/cmake#17575, this protection not particularly
> +valuable, as the dependency information which the imported targets wrap
> +is generated anyway.
> +
> +This removes a road-block for using `Boost_ADDITIONAL_VERSIONS` to
> +support newly-released Boost versions pending a new CMake release.
> +
> +Affects cmake < 3.11.0
> +
> +Upsteam-Status: Backport
> +[Yocto 12762]
> +Signed-off-by: Armin Kuster <akuster808@gmail.com>
> +
> +---
> + Modules/FindBoost.cmake | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +Index: cmake-3.10.3/Modules/FindBoost.cmake
> +===================================================================
> +--- cmake-3.10.3.orig/Modules/FindBoost.cmake
> ++++ cmake-3.10.3/Modules/FindBoost.cmake
> +@@ -799,7 +799,6 @@ function(_Boost_COMPONENT_DEPENDENCIES c
> +     endif()
> +     if(NOT Boost_VERSION VERSION_LESS 106700)
> +       message(WARNING "New Boost version may have incorrect or missing dependencies and imported targets")
> +-      set(_Boost_IMPORTED_TARGETS FALSE)
> +     endif()
> +   endif()
> +
> diff --git a/meta/recipes-devtools/cmake/cmake/0005-FindBoost-support-OPTIONAL_COMPONENTS.patch b/meta/recipes-devtools/cmake/cmake/0005-FindBoost-support-OPTIONAL_COMPONENTS.patch
> new file mode 100644
> index 0000000..37d69ba
> --- /dev/null
> +++ b/meta/recipes-devtools/cmake/cmake/0005-FindBoost-support-OPTIONAL_COMPONENTS.patch
> @@ -0,0 +1,42 @@
> +From 2557cad5ec5084f86d4bb56c82939a49fc9d3071 Mon Sep 17 00:00:00 2001
> +From: Sergiu Deitsch <sergiu.deitsch@gmail.com>
> +Date: Sun, 14 Jan 2018 11:42:48 +0100
> +Subject: [PATCH 5/6] FindBoost: support OPTIONAL_COMPONENTS
> +
> +Affects cmake < 3.11.0
> +
> +Upsteam-Status: Backport
> +[Yocto 12762]
> +Signed-off-by: Armin Kuster <akuster808@gmail.com>
> +
> +---
> + Modules/FindBoost.cmake | 8 +++++---
> + 1 file changed, 5 insertions(+), 3 deletions(-)
> +
> +Index: cmake-3.10.3/Modules/FindBoost.cmake
> +===================================================================
> +--- cmake-3.10.3.orig/Modules/FindBoost.cmake
> ++++ cmake-3.10.3/Modules/FindBoost.cmake
> +@@ -13,6 +13,9 @@
> + #     [version] [EXACT]      # Minimum or EXACT version e.g. 1.36.0
> + #     [REQUIRED]             # Fail with error if Boost is not found
> + #     [COMPONENTS <libs>...] # Boost libraries by their canonical name
> ++#                            # e.g. "date_time" for "libboost_date_time"
> ++#     [OPTIONAL_COMPONENTS <libs>...]
> ++#                            # Optional Boost libraries by their canonical name)
> + #     )                      # e.g. "date_time" for "libboost_date_time"
> + #
> + # This module finds headers and requested component libraries OR a CMake
> +@@ -1783,10 +1786,9 @@ if(Boost_FOUND)
> +   set(_boost_CHECKED_COMPONENT FALSE)
> +   set(_Boost_MISSING_COMPONENTS "")
> +   foreach(COMPONENT ${Boost_FIND_COMPONENTS})
> +-    string(TOUPPER ${COMPONENT} COMPONENT)
> ++    string(TOUPPER ${COMPONENT} UPPERCOMPONENT)
> +     set(_boost_CHECKED_COMPONENT TRUE)
> +-    if(NOT Boost_${COMPONENT}_FOUND)
> +-      string(TOLOWER ${COMPONENT} COMPONENT)
> ++    if(NOT Boost_${UPPERCOMPONENT}_FOUND AND Boost_FIND_REQUIRED_${COMPONENT})
> +       list(APPEND _Boost_MISSING_COMPONENTS ${COMPONENT})
> +     endif()
> +   endforeach()
> diff --git a/meta/recipes-devtools/cmake/cmake/0006-FindBoost-Add-support-for-Boost-1.67-with-Python-ver.patch b/meta/recipes-devtools/cmake/cmake/0006-FindBoost-Add-support-for-Boost-1.67-with-Python-ver.patch
> new file mode 100644
> index 0000000..d25cd35
> --- /dev/null
> +++ b/meta/recipes-devtools/cmake/cmake/0006-FindBoost-Add-support-for-Boost-1.67-with-Python-ver.patch
> @@ -0,0 +1,296 @@
> +From 1673923c303c6a4184904c4c5849911feddb87e7 Mon Sep 17 00:00:00 2001
> +From: Roger Leigh <rleigh@codelibre.net>
> +Date: Sun, 18 Mar 2018 13:05:35 +0000
> +Subject: [PATCH 6/6] FindBoost: Add support for Boost 1.67 with Python version
> + suffixes
> +
> +Fixes: #16612, #16335, #16391, #12955
> +
> +Affects cmake < 3.11.0
> +
> +Upsteam-Status: Backport
> +[Yocto 12762]
> +Signed-off-by: Armin Kuster <akuster808@gmail.com>
> +
> +---
> + Modules/FindBoost.cmake | 170 ++++++++++++++++++++++++++++++++++++------------
> + 1 file changed, 129 insertions(+), 41 deletions(-)
> +
> +Index: cmake-3.10.3/Modules/FindBoost.cmake
> +===================================================================
> +--- cmake-3.10.3.orig/Modules/FindBoost.cmake
> ++++ cmake-3.10.3/Modules/FindBoost.cmake
> +@@ -10,7 +10,7 @@
> + # Use this module by invoking find_package with the form::
> + #
> + #   find_package(Boost
> +-#     [version] [EXACT]      # Minimum or EXACT version e.g. 1.36.0
> ++#     [version] [EXACT]      # Minimum or EXACT version e.g. 1.67.0
> + #     [REQUIRED]             # Fail with error if Boost is not found
> + #     [COMPONENTS <libs>...] # Boost libraries by their canonical name
> + #                            # e.g. "date_time" for "libboost_date_time"
> +@@ -40,6 +40,15 @@
> + #                            information about Boost's automatic linking
> + #                            displayed during compilation
> + #
> ++# Note that Boost Python components require a Python version suffix
> ++# (Boost 1.67 and later), e.g. ``python36`` or ``python27`` for the
> ++# versions built against Python 3.6 and 2.7, respectively.  This also
> ++# applies to additional components using Python including
> ++# ``mpi_python`` and ``numpy``.  Earlier Boost releases may use
> ++# distribution-specific suffixes such as ``2``, ``3`` or ``2.7``.
> ++# These may also be used as suffixes, but note that they are not
> ++# portable.
> ++#
> + # This module reads hints about search locations from variables::
> + #
> + #   BOOST_ROOT             - Preferred installation prefix
> +@@ -156,7 +165,7 @@
> + #   Boost_REALPATH           - Set to ON to resolve symlinks for discovered
> + #                              libraries to assist with packaging.  For example,
> + #                              the "system" component library may be resolved to
> +-#                              "/usr/lib/libboost_system.so.1.42.0" instead of
> ++#                              "/usr/lib/libboost_system.so.1.67.0" instead of
> + #                              "/usr/lib/libboost_system.so".  This does not
> + #                              affect linking and should not be enabled unless
> + #                              the user needs this information.
> +@@ -190,6 +199,13 @@
> + #   target_link_libraries(foo Boost::date_time Boost::filesystem
> + #                             Boost::iostreams)
> + #
> ++# Example to find Boost Python 3.6 libraries and use imported targets::
> ++#
> ++#   find_package(Boost 1.67 REQUIRED COMPONENTS
> ++#                python36 numpy36)
> ++#   add_executable(foo foo.cc)
> ++#   target_link_libraries(foo Boost::python36 Boost::numpy36)
> ++#
> + # Example to find Boost headers and some *static* (release only) libraries::
> + #
> + #   set(Boost_USE_STATIC_LIBS        ON)  # only find static libs
> +@@ -197,7 +213,7 @@
> + #   set(Boost_USE_RELEASE_LIBS       ON)  # only find release libs
> + #   set(Boost_USE_MULTITHREADED      ON)
> + #   set(Boost_USE_STATIC_RUNTIME    OFF)
> +-#   find_package(Boost 1.36.0 COMPONENTS date_time filesystem system ...)
> ++#   find_package(Boost 1.66.0 COMPONENTS date_time filesystem system ...)
> + #   if(Boost_FOUND)
> + #     include_directories(${Boost_INCLUDE_DIRS})
> + #     add_executable(foo foo.cc)
> +@@ -565,6 +581,13 @@ function(_Boost_COMPONENT_DEPENDENCIES c
> +   # required only if the BoostScanDeps.cmake script logic is changed.
> +   # The addition of a new release should only require it to be run
> +   # against the new release.
> ++
> ++  # Handle Python version suffixes
> ++  if(component MATCHES "^(python|mpi_python|numpy)([0-9][0-9]?|[0-9]\\.[0-9])\$")
> ++    set(component "${CMAKE_MATCH_1}")
> ++    set(component_python_version "${CMAKE_MATCH_2}")
> ++  endif()
> ++
> +   set(_Boost_IMPORTED_TARGETS TRUE)
> +   if(Boost_VERSION VERSION_LESS 103300)
> +     message(WARNING "Imported targets and dependency information not available for Boost version ${Boost_VERSION} (all versions older than 1.33)")
> +@@ -782,8 +805,7 @@ function(_Boost_COMPONENT_DEPENDENCIES c
> +     set(_Boost_THREAD_DEPENDENCIES chrono system date_time atomic)
> +     set(_Boost_WAVE_DEPENDENCIES filesystem system serialization thread chrono date_time atomic)
> +     set(_Boost_WSERIALIZATION_DEPENDENCIES serialization)
> +-  else()
> +-    if(NOT Boost_VERSION VERSION_LESS 106500)
> ++  elseif(NOT Boost_VERSION VERSION_LESS 106500 AND Boost_VERSION VERSION_LESS 106700)
> +       set(_Boost_CHRONO_DEPENDENCIES system)
> +       set(_Boost_CONTEXT_DEPENDENCIES thread chrono system date_time)
> +       set(_Boost_COROUTINE_DEPENDENCIES context system)
> +@@ -797,10 +819,29 @@ function(_Boost_COMPONENT_DEPENDENCIES c
> +       set(_Boost_NUMPY_DEPENDENCIES python)
> +       set(_Boost_RANDOM_DEPENDENCIES system)
> +       set(_Boost_THREAD_DEPENDENCIES chrono system date_time atomic)
> ++      set(_Boost_TIMER_DEPENDENCIES chrono system)
> +       set(_Boost_WAVE_DEPENDENCIES filesystem system serialization thread chrono date_time atomic)
> +       set(_Boost_WSERIALIZATION_DEPENDENCIES serialization)
> +-    endif()
> ++  else()
> +     if(NOT Boost_VERSION VERSION_LESS 106700)
> ++      set(_Boost_CHRONO_DEPENDENCIES system)
> ++      set(_Boost_CONTEXT_DEPENDENCIES thread chrono system date_time)
> ++      set(_Boost_COROUTINE_DEPENDENCIES context system)
> ++      set(_Boost_FIBER_DEPENDENCIES context thread chrono system date_time)
> ++      set(_Boost_FILESYSTEM_DEPENDENCIES system)
> ++      set(_Boost_IOSTREAMS_DEPENDENCIES regex)
> ++      set(_Boost_LOG_DEPENDENCIES date_time log_setup system filesystem thread regex chrono atomic)
> ++      set(_Boost_MATH_DEPENDENCIES math_c99 math_c99f math_c99l math_tr1 math_tr1f math_tr1l atomic)
> ++      set(_Boost_MPI_DEPENDENCIES serialization)
> ++      set(_Boost_MPI_PYTHON_DEPENDENCIES python${component_python_version} mpi serialization)
> ++      set(_Boost_NUMPY_DEPENDENCIES python${component_python_version})
> ++      set(_Boost_RANDOM_DEPENDENCIES system)
> ++      set(_Boost_THREAD_DEPENDENCIES chrono system date_time atomic)
> ++      set(_Boost_TIMER_DEPENDENCIES chrono system)
> ++      set(_Boost_WAVE_DEPENDENCIES filesystem system serialization thread chrono date_time atomic)
> ++      set(_Boost_WSERIALIZATION_DEPENDENCIES serialization)
> ++    endif()
> ++    if(NOT Boost_VERSION VERSION_LESS 106800)
> +       message(WARNING "New Boost version may have incorrect or missing dependencies and imported targets")
> +     endif()
> +   endif()
> +@@ -826,6 +867,12 @@ endfunction()
> + # _hdrs
> + #
> + function(_Boost_COMPONENT_HEADERS component _hdrs)
> ++  # Handle Python version suffixes
> ++  if(component MATCHES "^(python|mpi_python|numpy)([0-9][0-9]?|[0-9]\\.[0-9])\$")
> ++    set(component "${CMAKE_MATCH_1}")
> ++    set(component_python_version "${CMAKE_MATCH_2}")
> ++  endif()
> ++
> +   # Note: new boost components will require adding here.  The header
> +   # must be present in all versions of Boost providing a library.
> +   set(_Boost_ATOMIC_HEADERS              "boost/atomic.hpp")
> +@@ -1040,7 +1087,7 @@ else()
> +   # _Boost_COMPONENT_HEADERS.  See the instructions at the top of
> +   # _Boost_COMPONENT_DEPENDENCIES.
> +   set(_Boost_KNOWN_VERSIONS ${Boost_ADDITIONAL_VERSIONS}
> +-    "1.66.0" "1.66" "1.65.1" "1.65.0" "1.65"
> ++    "1.67.0" "1.67" "1.66.0" "1.66" "1.65.1" "1.65.0" "1.65"
> +     "1.64.0" "1.64" "1.63.0" "1.63" "1.62.0" "1.62" "1.61.0" "1.61" "1.60.0" "1.60"
> +     "1.59.0" "1.59" "1.58.0" "1.58" "1.57.0" "1.57" "1.56.0" "1.56" "1.55.0" "1.55"
> +     "1.54.0" "1.54" "1.53.0" "1.53" "1.52.0" "1.52" "1.51.0" "1.51"
> +@@ -1619,7 +1666,44 @@ foreach(COMPONENT ${Boost_FIND_COMPONENT
> +     endforeach()
> +   endif()
> +
> ++  # Handle Python version suffixes
> ++  unset(COMPONENT_PYTHON_VERSION_MAJOR)
> ++  unset(COMPONENT_PYTHON_VERSION_MINOR)
> ++  if(${COMPONENT} MATCHES "^(python|mpi_python|numpy)([0-9])\$")
> ++    set(COMPONENT_UNVERSIONED "${CMAKE_MATCH_1}")
> ++    set(COMPONENT_PYTHON_VERSION_MAJOR "${CMAKE_MATCH_2}")
> ++  elseif(${COMPONENT} MATCHES "^(python|mpi_python|numpy)([0-9])\\.?([0-9])\$")
> ++    set(COMPONENT_UNVERSIONED "${CMAKE_MATCH_1}")
> ++    set(COMPONENT_PYTHON_VERSION_MAJOR "${CMAKE_MATCH_2}")
> ++    set(COMPONENT_PYTHON_VERSION_MINOR "${CMAKE_MATCH_3}")
> ++  endif()
> ++
> ++  unset(_Boost_FIND_LIBRARY_HINTS_FOR_COMPONENT_NAME)
> ++  if (COMPONENT_PYTHON_VERSION_MINOR)
> ++    # Boost >= 1.67
> ++    list(APPEND _Boost_FIND_LIBRARY_HINTS_FOR_COMPONENT_NAME "${COMPONENT_UNVERSIONED}${COMPONENT_PYTHON_VERSION_MAJOR}${COMPONENT_PYTHON_VERSION_MINOR}")
> ++    # Debian/Ubuntu (Some versions omit the 2 and/or 3 from the suffix)
> ++    list(APPEND _Boost_FIND_LIBRARY_HINTS_FOR_COMPONENT_NAME "${COMPONENT_UNVERSIONED}${COMPONENT_PYTHON_VERSION_MAJOR}-py${COMPONENT_PYTHON_VERSION_MAJOR}${COMPONENT_PYTHON_VERSION_MINOR}")
> ++    list(APPEND _Boost_FIND_LIBRARY_HINTS_FOR_COMPONENT_NAME "${COMPONENT_UNVERSIONED}-py${COMPONENT_PYTHON_VERSION_MAJOR}${COMPONENT_PYTHON_VERSION_MINOR}")
> ++    # Gentoo
> ++    list(APPEND _Boost_FIND_LIBRARY_HINTS_FOR_COMPONENT_NAME "${COMPONENT_UNVERSIONED}-${COMPONENT_PYTHON_VERSION_MAJOR}${COMPONENT_PYTHON_VERSION_MINOR}")
> ++    # RPMs
> ++    list(APPEND _Boost_FIND_LIBRARY_HINTS_FOR_COMPONENT_NAME "${COMPONENT_UNVERSIONED}-${COMPONENT_PYTHON_VERSION_MAJOR}${COMPONENT_PYTHON_VERSION_MINOR}")
> ++  endif()
> ++  if (COMPONENT_PYTHON_VERSION_MAJOR AND NOT COMPONENT_PYTHON_VERSION_MINOR)
> ++    # Boost < 1.67
> ++    list(APPEND _Boost_FIND_LIBRARY_HINTS_FOR_COMPONENT_NAME "${COMPONENT_UNVERSIONED}${COMPONENT_PYTHON_VERSION_MAJOR}")
> ++  endif()
> ++
> +   # Consolidate and report component-specific hints.
> ++  if(_Boost_FIND_LIBRARY_HINTS_FOR_COMPONENT_NAME)
> ++    list(REMOVE_DUPLICATES _Boost_FIND_LIBRARY_HINTS_FOR_COMPONENT_NAME)
> ++    if(Boost_DEBUG)
> ++      message(STATUS "[ ${CMAKE_CURRENT_LIST_FILE}:${CMAKE_CURRENT_LIST_LINE} ] "
> ++        "Component-specific library search names for ${COMPONENT_NAME}: "
> ++        "${_Boost_FIND_LIBRARY_HINTS_FOR_COMPONENT_NAME}")
> ++    endif()
> ++  endif()
> +   if(_Boost_FIND_LIBRARY_HINTS_FOR_COMPONENT)
> +     list(REMOVE_DUPLICATES _Boost_FIND_LIBRARY_HINTS_FOR_COMPONENT)
> +     if(Boost_DEBUG)
> +@@ -1649,28 +1733,30 @@ foreach(COMPONENT ${Boost_FIND_COMPONENT
> +   # Find RELEASE libraries
> +   #
> +   unset(_boost_RELEASE_NAMES)
> +-  foreach(compiler IN LISTS _boost_COMPILER)
> +-    list(APPEND _boost_RELEASE_NAMES
> +-      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_RELEASE_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
> +-      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_RELEASE_ABI_TAG} )
> +-  endforeach()
> +-  list(APPEND _boost_RELEASE_NAMES
> +-    ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_RELEASE_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
> +-    ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_RELEASE_ABI_TAG}
> +-    ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT} )
> +-  if(_boost_STATIC_RUNTIME_WORKAROUND)
> +-    set(_boost_RELEASE_STATIC_ABI_TAG "-s${_boost_RELEASE_ABI_TAG}")
> ++  foreach(component IN LISTS _Boost_FIND_LIBRARY_HINTS_FOR_COMPONENT_NAME COMPONENT)
> +     foreach(compiler IN LISTS _boost_COMPILER)
> +       list(APPEND _boost_RELEASE_NAMES
> +-        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_RELEASE_STATIC_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
> +-        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_RELEASE_STATIC_ABI_TAG} )
> ++        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${compiler}${_boost_MULTITHREADED}${_boost_RELEASE_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
> ++        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${compiler}${_boost_MULTITHREADED}${_boost_RELEASE_ABI_TAG} )
> +     endforeach()
> +     list(APPEND _boost_RELEASE_NAMES
> +-      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_RELEASE_STATIC_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
> +-      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_RELEASE_STATIC_ABI_TAG} )
> +-  endif()
> ++      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${_boost_MULTITHREADED}${_boost_RELEASE_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
> ++      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${_boost_MULTITHREADED}${_boost_RELEASE_ABI_TAG}
> ++      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component} )
> ++    if(_boost_STATIC_RUNTIME_WORKAROUND)
> ++      set(_boost_RELEASE_STATIC_ABI_TAG "-s${_boost_RELEASE_ABI_TAG}")
> ++      foreach(compiler IN LISTS _boost_COMPILER)
> ++        list(APPEND _boost_RELEASE_NAMES
> ++          ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${compiler}${_boost_MULTITHREADED}${_boost_RELEASE_STATIC_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
> ++          ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${compiler}${_boost_MULTITHREADED}${_boost_RELEASE_STATIC_ABI_TAG} )
> ++      endforeach()
> ++      list(APPEND _boost_RELEASE_NAMES
> ++        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${_boost_MULTITHREADED}${_boost_RELEASE_STATIC_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
> ++        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${_boost_MULTITHREADED}${_boost_RELEASE_STATIC_ABI_TAG} )
> ++    endif()
> ++  endforeach()
> +   if(Boost_THREADAPI AND ${COMPONENT} STREQUAL "thread")
> +-     _Boost_PREPEND_LIST_WITH_THREADAPI(_boost_RELEASE_NAMES ${_boost_RELEASE_NAMES})
> ++    _Boost_PREPEND_LIST_WITH_THREADAPI(_boost_RELEASE_NAMES ${_boost_RELEASE_NAMES})
> +   endif()
> +   if(Boost_DEBUG)
> +     message(STATUS "[ ${CMAKE_CURRENT_LIST_FILE}:${CMAKE_CURRENT_LIST_LINE} ] "
> +@@ -1699,27 +1785,29 @@ foreach(COMPONENT ${Boost_FIND_COMPONENT
> +   # Find DEBUG libraries
> +   #
> +   unset(_boost_DEBUG_NAMES)
> +-  foreach(compiler IN LISTS _boost_COMPILER)
> +-    list(APPEND _boost_DEBUG_NAMES
> +-      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_DEBUG_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
> +-      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_DEBUG_ABI_TAG} )
> +-  endforeach()
> +-  list(APPEND _boost_DEBUG_NAMES
> +-    ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_DEBUG_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
> +-    ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_DEBUG_ABI_TAG}
> +-    ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}
> +-    ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT} )
> +-  if(_boost_STATIC_RUNTIME_WORKAROUND)
> +-    set(_boost_DEBUG_STATIC_ABI_TAG "-s${_boost_DEBUG_ABI_TAG}")
> ++  foreach(component IN LISTS _Boost_FIND_LIBRARY_HINTS_FOR_COMPONENT_NAME COMPONENT)
> +     foreach(compiler IN LISTS _boost_COMPILER)
> +       list(APPEND _boost_DEBUG_NAMES
> +-        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_DEBUG_STATIC_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
> +-        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${compiler}${_boost_MULTITHREADED}${_boost_DEBUG_STATIC_ABI_TAG} )
> ++        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${compiler}${_boost_MULTITHREADED}${_boost_DEBUG_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
> ++        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${compiler}${_boost_MULTITHREADED}${_boost_DEBUG_ABI_TAG} )
> +     endforeach()
> +     list(APPEND _boost_DEBUG_NAMES
> +-      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_DEBUG_STATIC_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
> +-      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${COMPONENT}${_boost_MULTITHREADED}${_boost_DEBUG_STATIC_ABI_TAG} )
> +-  endif()
> ++      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${_boost_MULTITHREADED}${_boost_DEBUG_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
> ++      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${_boost_MULTITHREADED}${_boost_DEBUG_ABI_TAG}
> ++      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${_boost_MULTITHREADED}
> ++      ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component} )
> ++    if(_boost_STATIC_RUNTIME_WORKAROUND)
> ++      set(_boost_DEBUG_STATIC_ABI_TAG "-s${_boost_DEBUG_ABI_TAG}")
> ++      foreach(compiler IN LISTS _boost_COMPILER)
> ++        list(APPEND _boost_DEBUG_NAMES
> ++          ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${compiler}${_boost_MULTITHREADED}${_boost_DEBUG_STATIC_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
> ++          ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${compiler}${_boost_MULTITHREADED}${_boost_DEBUG_STATIC_ABI_TAG} )
> ++      endforeach()
> ++      list(APPEND _boost_DEBUG_NAMES
> ++        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${_boost_MULTITHREADED}${_boost_DEBUG_STATIC_ABI_TAG}${_boost_ARCHITECTURE_TAG}-${Boost_LIB_VERSION}
> ++        ${Boost_LIB_PREFIX}${Boost_NAMESPACE}_${component}${_boost_MULTITHREADED}${_boost_DEBUG_STATIC_ABI_TAG} )
> ++    endif()
> ++  endforeach()
> +   if(Boost_THREADAPI AND ${COMPONENT} STREQUAL "thread")
> +      _Boost_PREPEND_LIST_WITH_THREADAPI(_boost_DEBUG_NAMES ${_boost_DEBUG_NAMES})
> +   endif()
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

