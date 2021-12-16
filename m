Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97923C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 08:29:13 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.web10.7600.1639643352322009438
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 00:29:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aCrSb5cn;
 spf=pass (domain: gmail.com, ip: 209.85.222.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id 30so45793872uag.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 00:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XCM72pe5hXoMDp1gDiFh/VGK+jozY3BNy1DWUIPHNX8=;
        b=aCrSb5cnT8pSTk4GbIJ0M/+8DvFIEHYmPMmGaucG+AsKttjoX6fVtRNsUkATsaJBbA
         bNRmzMAbZncwoxVLYFlL3EM8KzpQAhfHyDIxbCHzhuHHo5pnZLubEcfjdQyFGFGH2WIo
         NEaR6sqrT8h1pQZEqWslcXoVsl+AA/L7HOZyBk5vULObNrzWYF2Cm7v68PxT1XS5feoq
         6gcHVIpr0yDhJ5PKqPZZ5zz4zQDxo+tUodOzEJX9UWhteLIOJRKk7d3Ttu+B1HmnhAR9
         WN1aUejbEANn9H8BmZe5kwOAREcLJnC6UEYsY7k9ZPN6D1i57ZyXa0s8r8dmrz7TPIu1
         05yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XCM72pe5hXoMDp1gDiFh/VGK+jozY3BNy1DWUIPHNX8=;
        b=uJY8xgtsdwyOVf9I0oRZGJB9uUHnJgk3FGi2/SDPxJ1YgU84dNU9MYR5jSCFIonJBy
         tHVViljlfdX8gTh7cEAa1d2R0/QBLxcKQRRINibI3vCKVuaFe2UguhPPx0mlAJdJzjF6
         R/AliTybvWNF/z5JPQPyjRAKApwxweZla8Q52pDBSnoW8Zgjf2QSwQE2hlcab0s7/2KH
         EJCUS6aG8xh71LOVABP+HTFDwlgjW9J46YuFVflTnJ95L9XFW36NO8IqFcwUheEOboYR
         ugpH2CPijSbrQ2t8Mf0699wc+2Y/yj2vaXp8kzSfIkeNZx55cohQoM3TMvpowGjluSsJ
         7HNw==
X-Gm-Message-State: AOAM533LJsk9sqZPkKEx3OLoOi1reCYnkmAXdnFYNyzHzT3F1x5YbXAa
	mKdeF3iNdHztctNwWj9BlIGRadLGBaxj/nC6jog=
X-Google-Smtp-Source: 
 ABdhPJyO1Q5hpH4K9BtybgrCb09juQgvs9+MykuhdBNmeKbTJwL6DV8ExKzKjAvJUHAgWknw812y/veyrwfuiK8E2iI=
X-Received: by 2002:ab0:6f14:: with SMTP id r20mr12480644uah.22.1639643351305;
 Thu, 16 Dec 2021 00:29:11 -0800 (PST)
MIME-Version: 1.0
References: <20211215224034.1814148-1-alex@linutronix.de>
 <20211215224034.1814148-18-alex@linutronix.de>
 <CAMKF1sqesSYYT8_wbCzAFBdFmow-s-eprXM05x-3xnsog3PqVw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqesSYYT8_wbCzAFBdFmow-s-eprXM05x-3xnsog3PqVw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 16 Dec 2021 09:28:59 +0100
Message-ID: 
 <CANNYZj8ixrrKu61w0wroVAd1G4AyHgufbGN650SyaT=50aEL3A@mail.gmail.com>
Subject: Re: [PATCH 18/26] boost: update 1.77.0 -> 1.78.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>,
 Martin Jansa <Martin.Jansa@gmail.com>,
	Michael Nosthoff <buildroot@heine.tech>
Content-Type: multipart/alternative; boundary="00000000000083504005d33f37c9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 08:29:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159773

--00000000000083504005d33f37c9
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Dec 2021 at 00:28, Khem Raj <raj.khem@gmail.com> wrote:

> > Drop 0001-fiber-libs-Define-SYS_futex-if-it-does-not-exist.patch as
> > it is difficult to rebase and needs to land upstream first.
>
> It's not that rebasing is too hard for this patch but this patch is an
> incorrect way to fix what it's trying to solve and that's why I am
> fine with dropping it.
> landing upstream is not a precondition for submitting patches to
> OpenEmbedded but good to have. All distributions carry patches and as
> long as patches are working
> their way upstream asynchronously its ok.  Let's not make it too hard
> for contributors and chase them away.
>

Yes, rather than 'land upstream' I should've said 'submitted upstream' -
that patch is dated 16 October 2020, and it never happened. While myself
and everyone else enormously appreciate your toolchain and target work,
there's a problem with amassing invasive pending patches related to that:
no one except you truly understands them. So what I'm asking is just a bit
more rigor going forward: submit patches upstream at the same time you
submit them to core, and steadily work your way towards reducing the pile
that's already there.

Alex



>
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  .../{boost-1.77.0.inc => boost-1.78.0.inc}    |   2 +-
> >  ....cmake-allow-searching-for-python310.patch |  50 ------
> >  ...h-instruction-set-flags-we-do-that-o.patch |  15 +-
> >  ...efine-SYS_futex-if-it-does-not-exist.patch |  54 -------
> >  ...th_no_atomic_int-on-the-command-line.patch |  53 ------
> >  ...oft-failure-in-bernoulli_details_hpp.patch | 151 ------------------
> >  ...7e01635306085488290ea83de541ec393f8b.patch |  30 ++++
> >  meta/recipes-support/boost/boost_1.77.0.bb    |  12 --
> >  meta/recipes-support/boost/boost_1.78.0.bb    |   9 ++
> >  9 files changed, 50 insertions(+), 326 deletions(-)
> >  rename meta/recipes-support/boost/{boost-1.77.0.inc =>
> boost-1.78.0.inc} (90%)
> >  delete mode 100644
> meta/recipes-support/boost/boost/0001-BoostConfig.cmake-allow-searching-for-python310.patch
> >  delete mode 100644
> meta/recipes-support/boost/boost/0001-fiber-libs-Define-SYS_futex-if-it-does-not-exist.patch
> >  delete mode 100644
> meta/recipes-support/boost/boost/0002-math-allow-definition-of-boost_math_no_atomic_int-on-the-command-line.patch
> >  delete mode 100644
> meta/recipes-support/boost/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch
> >  create mode 100644
> meta/recipes-support/boost/boost/de657e01635306085488290ea83de541ec393f8b.patch
> >  delete mode 100644 meta/recipes-support/boost/boost_1.77.0.bb
> >  create mode 100644 meta/recipes-support/boost/boost_1.78.0.bb
> >
> > diff --git a/meta/recipes-support/boost/boost-1.77.0.inc
> b/meta/recipes-support/boost/boost-1.78.0.inc
> > similarity index 90%
> > rename from meta/recipes-support/boost/boost-1.77.0.inc
> > rename to meta/recipes-support/boost/boost-1.78.0.inc
> > index 6df06e76c7..729a47b54f 100644
> > --- a/meta/recipes-support/boost/boost-1.77.0.inc
> > +++ b/meta/recipes-support/boost/boost-1.78.0.inc
> > @@ -12,7 +12,7 @@ BOOST_MAJ =
> "${@"_".join(d.getVar("PV").split(".")[0:2])}"
> >  BOOST_P = "boost_${BOOST_VER}"
> >
> >  SRC_URI = "
> https://boostorg.jfrog.io/artifactory/main/release/${PV}/source/${BOOST_P}.tar.bz2
> "
> > -SRC_URI[sha256sum] =
> "fc9f85fc030e233142908241af7a846e60630aa7388de9a5fafb1f3a26840854"
> > +SRC_URI[sha256sum] =
> "8681f175d4bdb26c52222665793eef08490d7758529330f98d3b29dd0735bccc"
> >
> >  UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
> >  UPSTREAM_CHECK_REGEX = "release/(?P<pver>.*)/source/"
> > diff --git
> a/meta/recipes-support/boost/boost/0001-BoostConfig.cmake-allow-searching-for-python310.patch
> b/meta/recipes-support/boost/boost/0001-BoostConfig.cmake-allow-searching-for-python310.patch
> > deleted file mode 100644
> > index 0a9ee2cc95..0000000000
> > ---
> a/meta/recipes-support/boost/boost/0001-BoostConfig.cmake-allow-searching-for-python310.patch
> > +++ /dev/null
> > @@ -1,50 +0,0 @@
> > -From e193f080c7d209516ac9b712fa0c50bb08026fa2 Mon Sep 17 00:00:00 2001
> > -From: Martin Jansa <Martin.Jansa@gmail.com>
> > -Date: Tue, 19 Oct 2021 12:24:31 +0000
> > -Subject: [PATCH] BoostConfig.cmake: allow searching for python310
> > -
> > -* accept double digits in Python3_VERSION_MINOR
> > -
> > -* if someone is using e.g.:
> > -  find_package(Python3 REQUIRED)
> > -  find_package(Boost REQUIRED
> python${Python3_VERSION_MAJOR}${Python3_VERSION_MINOR})
> > -
> > -  with python-3.10 then it currently fails with:
> > -
> > -  -- Found PythonLibs: /usr/lib/libpython3.10.so (found version
> "3.10.0")
> > -  -- Found Python3: -native/usr/bin/python3-native/python3 (found
> version "3.10.0") found components: Interpreter
> > -  CMake Error at /usr/lib/cmake/Boost-1.77.0/BoostConfig.cmake:141
> (find_package):
> > -    Could not find a package configuration file provided by
> "boost_python310"
> > -    (requested version 1.77.0) with any of the following names:
> > -
> > -      boost_python310Config.cmake
> > -      boost_python310-config.cmake
> > -
> > -    Add the installation prefix of "boost_python310" to
> CMAKE_PREFIX_PATH or
> > -    set "boost_python310_DIR" to a directory containing one of the
> above files.
> > -    If "boost_python310" provides a separate development package or
> SDK, be
> > -    sure it has been installed.
> > -  Call Stack (most recent call first):
> > -    /usr/lib/cmake/Boost-1.77.0/BoostConfig.cmake:258
> (boost_find_component)
> > -    /usr/share/cmake-3.21/Modules/FindBoost.cmake:594 (find_package)
> > -    CMakeLists.txt:18 (find_package)
> > -
> > -Upstream-Status: Submitted [
> https://github.com/boostorg/boost_install/pull/53]
> > -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ----
> > - tools/boost_install/BoostConfig.cmake | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/tools/boost_install/BoostConfig.cmake
> b/tools/boost_install/BoostConfig.cmake
> > -index fd17821..5dffa58 100644
> > ---- a/tools/boost_install/BoostConfig.cmake
> > -+++ b/tools/boost_install/BoostConfig.cmake
> > -@@ -113,7 +113,7 @@ macro(boost_find_component comp required quiet)
> > -     set(_BOOST_REQUIRED REQUIRED)
> > -   endif()
> > -
> > --  if("${comp}" MATCHES "^(python|numpy|mpi_python)([1-9])([0-9])$")
> > -+  if("${comp}" MATCHES
> "^(python|numpy|mpi_python)([1-9])([0-9][0-9]?)$")
> > -
> > -     # handle pythonXY and numpyXY versioned components for
> compatibility
> > -
> > diff --git
> a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
> b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
> > index 91ab53efd9..67d5dff125 100644
> > ---
> a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
> > +++
> b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
> > @@ -1,4 +1,4 @@
> > -From 8e1d30454afde37eaa3c593ec19d108cd5ed10d0 Mon Sep 17 00:00:00 2001
> > +From 4d2a8fc8117e56bc283349e5f7f889ebbfc55c71 Mon Sep 17 00:00:00 2001
> >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> >  Date: Tue, 18 Dec 2018 15:42:57 +0100
> >  Subject: [PATCH] Don't set up arch/instruction-set flags, we do that
> > @@ -10,14 +10,14 @@ Signed-off-by: Christopher Larson <
> chris_larson@mentor.com>
> >  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >
> >  ---
> > - tools/build/src/tools/gcc.jam | 139 ----------------------------------
> > - 1 file changed, 139 deletions(-)
> > + tools/build/src/tools/gcc.jam | 144 ----------------------------------
> > + 1 file changed, 144 deletions(-)
> >
> >  diff --git a/tools/build/src/tools/gcc.jam
> b/tools/build/src/tools/gcc.jam
> > -index ff3209f7b..70cbc39a5 100644
> > +index 47a113223..d77525724 100644
> >  --- a/tools/build/src/tools/gcc.jam
> >  +++ b/tools/build/src/tools/gcc.jam
> > -@@ -1217,142 +1217,3 @@ local rule cpu-flags ( toolset variable :
> architecture : instruction-set + :
> > +@@ -1122,147 +1122,3 @@ local rule cpu-flags ( toolset variable :
> architecture : instruction-set + :
> >
>  <architecture>$(architecture)/<instruction-set>$(instruction-set)
> >           : $(values) ;
> >   }
> > @@ -158,5 +158,10 @@ index ff3209f7b..70cbc39a5 100644
> >  -cpu-flags gcc OPTIONS : s390x : z13 : -march=z13 ;
> >  -cpu-flags gcc OPTIONS : s390x : z14 : -march=z14 ;
> >  -cpu-flags gcc OPTIONS : s390x : z15 : -march=z15 ;
> > +-# ARM
> > +-cpu-flags gcc OPTIONS : arm : cortex-a9+vfpv3 : -mcpu=cortex-a9
> -mfpu=vfpv3 -mfloat-abi=hard ;
> > +-cpu-flags gcc OPTIONS : arm : cortex-a53 : -mcpu=cortex-a53 ;
> > +-cpu-flags gcc OPTIONS : arm : cortex-r5 : -mcpu=cortex-r5 ;
> > +-cpu-flags gcc OPTIONS : arm : cortex-r5+vfpv3-d16 : -mcpu=cortex-r5
> -mfpu=vfpv3-d16 -mfloat-abi=hard ;
> >  -# AIX variant of RS/6000 & PowerPC
> >  -toolset.flags gcc AROPTIONS <address-model>64/<target-os>aix : "-X64" ;
> > diff --git
> a/meta/recipes-support/boost/boost/0001-fiber-libs-Define-SYS_futex-if-it-does-not-exist.patch
> b/meta/recipes-support/boost/boost/0001-fiber-libs-Define-SYS_futex-if-it-does-not-exist.patch
> > deleted file mode 100644
> > index 523568e9bc..0000000000
> > ---
> a/meta/recipes-support/boost/boost/0001-fiber-libs-Define-SYS_futex-if-it-does-not-exist.patch
> > +++ /dev/null
> > @@ -1,54 +0,0 @@
> > -From d6f7b6064dc91d1d5fa18554b40b14822ab7a32b Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Fri, 16 Oct 2020 11:13:22 -0700
> > -Subject: [PATCH] fiber,libs: Define SYS_futex if it does not exist
> > -
> > -__NR_futex is not defines by newer architectures e.g. arc, riscv32 as
> > -they only have 64bit variant of time_t. Glibc defines SYS_futex
> interface based on
> > -__NR_futex, since this is used in applications, such applications start
> > -to fail to build for these newer architectures. This patch defines a
> > -fallback to alias __NR_futex to __NR_futex_tim64 so SYS_futex keeps
> > -working
> > -
> > -Upstream-Status: Pending
> > -
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - boost/fiber/detail/futex.hpp | 5 +++++
> > - libs/log/src/event.cpp       | 4 ++++
> > - 2 files changed, 9 insertions(+)
> > -
> > -diff --git a/boost/fiber/detail/futex.hpp b/boost/fiber/detail/futex.hpp
> > -index e64bd5990..16bee64f1 100644
> > ---- a/boost/fiber/detail/futex.hpp
> > -+++ b/boost/fiber/detail/futex.hpp
> > -@@ -17,6 +17,11 @@ extern "C" {
> > - #include <linux/futex.h>
> > - #include <sys/syscall.h>
> > - }
> > -+
> > -+#if !defined(SYS_futex) && defined(SYS_futex_time64)
> > -+#define SYS_futex SYS_futex_time64
> > -+#endif
> > -+
> > - #elif BOOST_OS_WINDOWS
> > - #include <windows.h>
> > - #endif
> > -diff --git a/libs/log/src/event.cpp b/libs/log/src/event.cpp
> > -index 5485154d7..2c7c0381f 100644
> > ---- a/libs/log/src/event.cpp
> > -+++ b/libs/log/src/event.cpp
> > -@@ -31,6 +31,10 @@
> > - #include <linux/futex.h>
> > - #include <boost/memory_order.hpp>
> > -
> > -+#if !defined(SYS_futex) && defined(SYS_futex_time64)
> > -+#define SYS_futex SYS_futex_time64
> > -+#endif
> > -+
> > - // Some Android NDKs (Google NDK and older Crystax.NET NDK versions)
> don't define SYS_futex
> > - #if defined(SYS_futex)
> > - #define BOOST_LOG_SYS_FUTEX SYS_futex
> > ---
> > -2.28.0
> > -
> > diff --git
> a/meta/recipes-support/boost/boost/0002-math-allow-definition-of-boost_math_no_atomic_int-on-the-command-line.patch
> b/meta/recipes-support/boost/boost/0002-math-allow-definition-of-boost_math_no_atomic_int-on-the-command-line.patch
> > deleted file mode 100644
> > index b05b795084..0000000000
> > ---
> a/meta/recipes-support/boost/boost/0002-math-allow-definition-of-boost_math_no_atomic_int-on-the-command-line.patch
> > +++ /dev/null
> > @@ -1,53 +0,0 @@
> > -From 32bd6197353f6ea8e5bef01f09e25c944141acfc Mon Sep 17 00:00:00 2001
> > -From: jzmaddock <john@johnmaddock.co.uk>
> > -Date: Wed, 1 Sep 2021 18:54:54 +0100
> > -Subject: [PATCH] Allow definition of BOOST_MATH_NO_ATOMIC_INT on the
> command
> > - line. Allows us to test/emulate platforms with no atomic integers.
> > -
> > -[buildroot@heine.tech:
> > -  - backport from boostorg/math 32bd6197353f6ea8e5bef01f09e25c944141acfc
> > -  - alter path to match boost release
> > -]
> > -Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> > ----
> > -Upstream-Status: Backport [
> https://github.com/boostorg/math/pull/684/commits/32bd6197353f6ea8e5bef01f09e25c944141acfc
> ]
> > - boost/math/tools/atomic.hpp | 10 +++++-----
> > - 1 file changed, 5 insertions(+), 5 deletions(-)
> > -
> > -diff --git a/boost/math/tools/atomic.hpp b/boost/math/tools/atomic.hpp
> > -index cc76ed269f..e3cbf5db89 100644
> > ---- a/boost/math/tools/atomic.hpp
> > -+++ b/boost/math/tools/atomic.hpp
> > -@@ -16,27 +16,27 @@
> > - namespace boost {
> > -    namespace math {
> > -       namespace detail {
> > --#if ATOMIC_INT_LOCK_FREE == 2
> > -+#if (ATOMIC_INT_LOCK_FREE == 2) && !defined(BOOST_MATH_NO_ATOMIC_INT)
> > -          typedef std::atomic<int> atomic_counter_type;
> > -          typedef std::atomic<unsigned> atomic_unsigned_type;
> > -          typedef int atomic_integer_type;
> > -          typedef unsigned atomic_unsigned_integer_type;
> > --#elif ATOMIC_SHORT_LOCK_FREE == 2
> > -+#elif (ATOMIC_SHORT_LOCK_FREE == 2) &&
> !defined(BOOST_MATH_NO_ATOMIC_INT)
> > -          typedef std::atomic<short> atomic_counter_type;
> > -          typedef std::atomic<unsigned short> atomic_unsigned_type;
> > -          typedef short atomic_integer_type;
> > -          typedef unsigned short atomic_unsigned_type;
> > --#elif ATOMIC_LONG_LOCK_FREE == 2
> > -+#elif (ATOMIC_LONG_LOCK_FREE == 2) &&
> !defined(BOOST_MATH_NO_ATOMIC_INT)
> > -          typedef std::atomic<long> atomic_unsigned_integer_type;
> > -          typedef std::atomic<unsigned long> atomic_unsigned_type;
> > -          typedef unsigned long atomic_unsigned_type;
> > -          typedef long atomic_integer_type;
> > --#elif ATOMIC_LLONG_LOCK_FREE == 2
> > -+#elif (ATOMIC_LLONG_LOCK_FREE == 2) &&
> !defined(BOOST_MATH_NO_ATOMIC_INT)
> > -          typedef std::atomic<long long> atomic_unsigned_integer_type;
> > -          typedef std::atomic<unsigned long long> atomic_unsigned_type;
> > -          typedef long long atomic_integer_type;
> > -          typedef unsigned long long atomic_unsigned_integer_type;
> > --#else
> > -+#elif !defined(BOOST_MATH_NO_ATOMIC_INT)
> > - #  define BOOST_MATH_NO_ATOMIC_INT
> > - #endif
> > -       } // Namespace detail
> > diff --git
> a/meta/recipes-support/boost/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch
> b/meta/recipes-support/boost/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch
> > deleted file mode 100644
> > index f69e4f21f3..0000000000
> > ---
> a/meta/recipes-support/boost/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch
> > +++ /dev/null
> > @@ -1,151 +0,0 @@
> > -From 7d482f6ebc356e6ec455ccb5f51a23971bf6ce5b Mon Sep 17 00:00:00 2001
> > -From: jzmaddock <john@johnmaddock.co.uk>
> > -Date: Wed, 1 Sep 2021 20:31:53 +0100
> > -Subject: [PATCH] Make no atomics a soft failure in
> bernoulli_details.hpp.
> > - Include an "escape macro" so thread safety can be disabled if certain
> > - bernoulli features are to be used in a no-atomics environment. Fixes
> > - https://github.com/boostorg/math/issues/673.
> > -
> > -[buildroot@heine.tech:
> > -  - backport from boostorg/math 7d482f6ebc356e6ec455ccb5f51a23971bf6ce5b
> > -  - alter path to match boost release
> > -]
> > -Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> > ----
> > -Upstream-Status: Backport [
> https://github.com/boostorg/math/pull/684/commits/7d482f6ebc356e6ec455ccb5f51a23971bf6ce5b
> ]
> > - .../detail/bernoulli_details.hpp                 | 10 +++++++---
> > - libs/math/test/Jamfile.v2                        |  3 +++
> > - test/compile_test/bernoulli_no_atomic_d.cpp      | 14 ++++++++++++++
> > - test/compile_test/bernoulli_no_atomic_fail.cpp   | 15 +++++++++++++++
> > - test/compile_test/bernoulli_no_atomic_mp.cpp     | 16 ++++++++++++++++
> > - 5 files changed, 55 insertions(+), 3 deletions(-)
> > - create mode 100644 test/compile_test/bernoulli_no_atomic_d.cpp
> > - create mode 100644 test/compile_test/bernoulli_no_atomic_fail.cpp
> > - create mode 100644 test/compile_test/bernoulli_no_atomic_mp.cpp
> > -
> > -diff --git a/boost/math/special_functions/detail/bernoulli_details.hpp
> b/boost/math/special_functions/detail/bernoulli_details.hpp
> > -index cf35545264..8519b7c89c 100644
> > ---- a/boost/math/special_functions/detail/bernoulli_details.hpp
> > -+++ b/boost/math/special_functions/detail/bernoulli_details.hpp
> > -@@ -360,7 +360,7 @@ class bernoulli_numbers_cache
> > -          return out;
> > -       }
> > -
> > --      #ifndef BOOST_HAS_THREADS
> > -+      #if !defined(BOOST_HAS_THREADS) ||
> defined(BOOST_MATH_BERNOULLI_UNTHREADED)
> > -       //
> > -       // Single threaded code, very simple:
> > -       //
> > -@@ -382,6 +382,8 @@ class bernoulli_numbers_cache
> > -          *out = (i >= m_overflow_limit) ?
> policies::raise_overflow_error<T>("boost::math::bernoulli_b2n<%1%>(std::size_t)",
> 0, T(i), pol) : bn[i];
> > -          ++out;
> > -       }
> > -+      #elif defined(BOOST_MATH_NO_ATOMIC_INT)
> > -+      static_assert(sizeof(T) == 1, "Unsupported configuration: your
> platform appears to have no atomic integers.  If you are happy with
> thread-unsafe code, then you may define BOOST_MATH_BERNOULLI_UNTHREADED to
> suppress this error.");
> > -       #else
> > -       //
> > -       // Double-checked locking pattern, lets us access cached already
> cached values
> > -@@ -464,7 +466,7 @@ class bernoulli_numbers_cache
> > -          return out;
> > -       }
> > -
> > --      #ifndef BOOST_HAS_THREADS
> > -+      #if !defined(BOOST_HAS_THREADS) ||
> defined(BOOST_MATH_BERNOULLI_UNTHREADED)
> > -       //
> > -       // Single threaded code, very simple:
> > -       //
> > -@@ -494,6 +496,8 @@ class bernoulli_numbers_cache
> > -          }
> > -          ++out;
> > -       }
> > -+      #elif defined(BOOST_MATH_NO_ATOMIC_INT)
> > -+      static_assert(sizeof(T) == 1, "Unsupported configuration: your
> platform appears to have no atomic integers.  If you are happy with
> thread-unsafe code, then you may define BOOST_MATH_BERNOULLI_UNTHREADED to
> suppress this error.");
> > -       #else
> > -       //
> > -       // Double-checked locking pattern, lets us access cached already
> cached values
> > -@@ -555,7 +559,7 @@ class bernoulli_numbers_cache
> > -    // The value at which we know overflow has already occurred for the
> Bn:
> > -    std::size_t m_overflow_limit;
> > -
> > --   #ifdef BOOST_HAS_THREADS
> > -+   #if defined(BOOST_HAS_THREADS) && !defined(BOOST_MATH_NO_ATOMIC_INT)
> > -    std::mutex m_mutex;
> > -    atomic_counter_type m_counter, m_current_precision;
> > -    #else
> > -diff --git a/libs/math/test/Jamfile.v2 b/libs/math/test/Jamfile.v2
> > -index 52fb87f5e5..3ac63f9279 100644
> > ---- a/libs/math/test/Jamfile.v2
> > -+++ b/libs/math/test/Jamfile.v2
> > -@@ -1137,6 +1137,9 @@ test-suite misc :
> > -
> > - #   [ run __temporary_test.cpp test_instances//test_instances : : :
> <test-info>always_show_run_output <pch>off ]
> > -    [ compile test_no_long_double_policy.cpp ]
> > -+   [ compile compile_test/bernoulli_no_atomic_d.cpp ]
> > -+   [ compile compile_test/bernoulli_no_atomic_mp.cpp ]
> > -+   [ compile-fail compile_test/bernoulli_no_atomic_fail.cpp ]
> > - ;
> > -
> > - test-suite interpolators :
> > -diff --git a/test/compile_test/bernoulli_no_atomic_d.cpp
> b/test/compile_test/bernoulli_no_atomic_d.cpp
> > -new file mode 100644
> > -index 0000000000..61926f7e1f
> > ---- /dev/null
> > -+++ b/test/compile_test/bernoulli_no_atomic_d.cpp
> > -@@ -0,0 +1,14 @@
> > -+//  (C) Copyright John Maddock 2021.
> > -+//  Use, modification and distribution are subject to the
> > -+//  Boost Software License, Version 1.0. (See accompanying file
> > -+//  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
> > -+
> > -+#define BOOST_MATH_NO_ATOMIC_INT
> > -+
> > -+#include <boost/math/special_functions/bernoulli.hpp>
> > -+#include "test_compile_result.hpp"
> > -+
> > -+void compile_and_link_test()
> > -+{
> > -+   check_result<double>(boost::math::bernoulli_b2n<double>(4));
> > -+}
> > -diff --git a/test/compile_test/bernoulli_no_atomic_fail.cpp
> b/test/compile_test/bernoulli_no_atomic_fail.cpp
> > -new file mode 100644
> > -index 0000000000..bbd7152412
> > ---- /dev/null
> > -+++ b/test/compile_test/bernoulli_no_atomic_fail.cpp
> > -@@ -0,0 +1,15 @@
> > -+//  (C) Copyright John Maddock 2021.
> > -+//  Use, modification and distribution are subject to the
> > -+//  Boost Software License, Version 1.0. (See accompanying file
> > -+//  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
> > -+
> > -+#define BOOST_MATH_NO_ATOMIC_INT
> > -+
> > -+#include <boost/math/special_functions/bernoulli.hpp>
> > -+#include <boost/multiprecision/cpp_bin_float.hpp>
> > -+#include "test_compile_result.hpp"
> > -+
> > -+void compile_and_link_test()
> > -+{
> > -+
>  check_result<boost::multiprecision::cpp_bin_float_50>(boost::math::bernoulli_b2n<boost::multiprecision::cpp_bin_float_50>(4));
> > -+}
> > -diff --git a/test/compile_test/bernoulli_no_atomic_mp.cpp
> b/test/compile_test/bernoulli_no_atomic_mp.cpp
> > -new file mode 100644
> > -index 0000000000..8d5a6e78e6
> > ---- /dev/null
> > -+++ b/test/compile_test/bernoulli_no_atomic_mp.cpp
> > -@@ -0,0 +1,16 @@
> > -+//  (C) Copyright John Maddock 2021.
> > -+//  Use, modification and distribution are subject to the
> > -+//  Boost Software License, Version 1.0. (See accompanying file
> > -+//  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
> > -+
> > -+#define BOOST_MATH_NO_ATOMIC_INT
> > -+#define BOOST_MATH_BERNOULLI_UNTHREADED
> > -+
> > -+#include <boost/math/special_functions/bernoulli.hpp>
> > -+#include <boost/multiprecision/cpp_bin_float.hpp>
> > -+#include "test_compile_result.hpp"
> > -+
> > -+void compile_and_link_test()
> > -+{
> > -+
>  check_result<boost::multiprecision::cpp_bin_float_50>(boost::math::bernoulli_b2n<boost::multiprecision::cpp_bin_float_50>(4));
> > -+}
> > diff --git
> a/meta/recipes-support/boost/boost/de657e01635306085488290ea83de541ec393f8b.patch
> b/meta/recipes-support/boost/boost/de657e01635306085488290ea83de541ec393f8b.patch
> > new file mode 100644
> > index 0000000000..867ec03ba6
> > --- /dev/null
> > +++
> b/meta/recipes-support/boost/boost/de657e01635306085488290ea83de541ec393f8b.patch
> > @@ -0,0 +1,30 @@
> > +From de657e01635306085488290ea83de541ec393f8b Mon Sep 17 00:00:00 2001
> > +From: Leonardo Neumann <leonardo@neumann.dev.br>
> > +Date: Mon, 13 Dec 2021 01:07:20 -0300
> > +Subject: [PATCH] Fix missing sys/stat.h include on musl-based systems
> > +
> > +Boost 1.78.0 fails to build on musl-based systems because musl does
> > +not include sys/stat.h by default.
> > +
> > +Fixes #161 ("Boost compiler error")
> > +Upstream-Status: Submitted [
> https://github.com/boostorg/interprocess/pull/162]
> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +---
> > + include/boost/interprocess/permissions.hpp | 4 ++++
> > + 1 file changed, 4 insertions(+)
> > +
> > +diff --git a/boost/interprocess/permissions.hpp
> b/boost/interprocess/permissions.hpp
> > +index ab55411e..0b21a685 100644
> > +--- a/boost/interprocess/permissions.hpp
> > ++++ b/boost/interprocess/permissions.hpp
> > +@@ -29,6 +29,10 @@
> > +
> > + #include <boost/interprocess/detail/win32_api.hpp>
> > +
> > ++#else
> > ++
> > ++#include <sys/stat.h>
> > ++
> > + #endif
> > +
> > + #endif   //#ifndef BOOST_INTERPROCESS_DOXYGEN_INVOKED
> > diff --git a/meta/recipes-support/boost/boost_1.77.0.bb
> b/meta/recipes-support/boost/boost_1.77.0.bb
> > deleted file mode 100644
> > index bde6b14a79..0000000000
> > --- a/meta/recipes-support/boost/boost_1.77.0.bb
> > +++ /dev/null
> > @@ -1,12 +0,0 @@
> > -require boost-${PV}.inc
> > -require boost.inc
> > -
> > -SRC_URI += "file://boost-CVE-2012-2677.patch \
> > -           file://boost-math-disable-pch-for-gcc.patch \
> > -
>  file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
> > -           file://0001-dont-setup-compiler-flags-m32-m64.patch \
> > -
>  file://0001-fiber-libs-Define-SYS_futex-if-it-does-not-exist.patch \
> > -
>  file://0001-BoostConfig.cmake-allow-searching-for-python310.patch \
> > -
>  file://0002-math-allow-definition-of-boost_math_no_atomic_int-on-the-command-line.patch
> \
> > -
>  file://0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch
> \
> > -           "
> > diff --git a/meta/recipes-support/boost/boost_1.78.0.bb
> b/meta/recipes-support/boost/boost_1.78.0.bb
> > new file mode 100644
> > index 0000000000..f4b6ed8576
> > --- /dev/null
> > +++ b/meta/recipes-support/boost/boost_1.78.0.bb
> > @@ -0,0 +1,9 @@
> > +require boost-${PV}.inc
> > +require boost.inc
> > +
> > +SRC_URI += "file://boost-CVE-2012-2677.patch \
> > +           file://boost-math-disable-pch-for-gcc.patch \
> > +
>  file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
> > +           file://0001-dont-setup-compiler-flags-m32-m64.patch \
> > +           file://de657e01635306085488290ea83de541ec393f8b.patch \
> > +           "
> > --
> > 2.20.1
> >
>

--00000000000083504005d33f37c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 16 Dec 2021 at 00:28, Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">&gt; Drop 0001-fiber-libs-Define-SYS_futex=
-if-it-does-not-exist.patch as<br>
&gt; it is difficult to rebase and needs to land upstream first.<br>
<br>
It&#39;s not that rebasing is too hard for this patch but this patch is an<=
br>
incorrect way to fix what it&#39;s trying to solve and that&#39;s why I am<=
br>
fine with dropping it.<br>
landing upstream is not a precondition for submitting patches to<br>
OpenEmbedded but good to have. All distributions carry patches and as<br>
long as patches are working<br>
their way upstream asynchronously its ok.=C2=A0 Let&#39;s not make it too h=
ard<br>
for contributors and chase them away.<br></blockquote><div><br></div><div>Y=
es, rather than &#39;land upstream&#39; I should&#39;ve said &#39;submitted=
 upstream&#39; - that patch is dated 16 October 2020, and it never happened=
. While myself and everyone else enormously appreciate your toolchain and t=
arget work, there&#39;s a problem with amassing invasive pending patches re=
lated to that: no one except you truly understands them. So what I&#39;m as=
king is just a bit more rigor going forward: submit patches upstream at the=
 same time you submit them to core, and steadily work your way towards redu=
cing the pile that&#39;s already there.<br></div><div><br></div><div>Alex<b=
r></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../{boost-1.77.0.inc =3D&gt; boost-1.78.0.inc}=C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 ....cmake-allow-searching-for-python310.patch |=C2=A0 50 ------<=
br>
&gt;=C2=A0 ...h-instruction-set-flags-we-do-that-o.patch |=C2=A0 15 +-<br>
&gt;=C2=A0 ...efine-SYS_futex-if-it-does-not-exist.patch |=C2=A0 54 -------=
<br>
&gt;=C2=A0 ...th_no_atomic_int-on-the-command-line.patch |=C2=A0 53 ------<=
br>
&gt;=C2=A0 ...oft-failure-in-bernoulli_details_hpp.patch | 151 ------------=
------<br>
&gt;=C2=A0 ...7e01635306085488290ea83de541ec393f8b.patch |=C2=A0 30 ++++<br=
>
&gt;=C2=A0 meta/recipes-support/boost/<a href=3D"http://boost_1.77.0.bb" re=
l=3D"noreferrer" target=3D"_blank">boost_1.77.0.bb</a>=C2=A0 =C2=A0 |=C2=A0=
 12 --<br>
&gt;=C2=A0 meta/recipes-support/boost/<a href=3D"http://boost_1.78.0.bb" re=
l=3D"noreferrer" target=3D"_blank">boost_1.78.0.bb</a>=C2=A0 =C2=A0 |=C2=A0=
 =C2=A09 ++<br>
&gt;=C2=A0 9 files changed, 50 insertions(+), 326 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-support/boost/{boost-1.77.0.inc =3D&gt; boos=
t-1.78.0.inc} (90%)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-support/boost/boost/0001-BoostCo=
nfig.cmake-allow-searching-for-python310.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-support/boost/boost/0001-fiber-l=
ibs-Define-SYS_futex-if-it-does-not-exist.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-support/boost/boost/0002-math-al=
low-definition-of-boost_math_no_atomic_int-on-the-command-line.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-support/boost/boost/0003-math-ma=
ke-no-atomics-a-soft-failure-in-bernoulli_details_hpp.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/boost/boost/de657e016353=
06085488290ea83de541ec393f8b.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-support/boost/<a href=3D"http://=
boost_1.77.0.bb" rel=3D"noreferrer" target=3D"_blank">boost_1.77.0.bb</a><b=
r>
&gt;=C2=A0 create mode 100644 meta/recipes-support/boost/<a href=3D"http://=
boost_1.78.0.bb" rel=3D"noreferrer" target=3D"_blank">boost_1.78.0.bb</a><b=
r>
&gt;<br>
&gt; diff --git a/meta/recipes-support/boost/boost-1.77.0.inc b/meta/recipe=
s-support/boost/boost-1.78.0.inc<br>
&gt; similarity index 90%<br>
&gt; rename from meta/recipes-support/boost/boost-1.77.0.inc<br>
&gt; rename to meta/recipes-support/boost/boost-1.78.0.inc<br>
&gt; index 6df06e76c7..729a47b54f 100644<br>
&gt; --- a/meta/recipes-support/boost/boost-1.77.0.inc<br>
&gt; +++ b/meta/recipes-support/boost/boost-1.78.0.inc<br>
&gt; @@ -12,7 +12,7 @@ BOOST_MAJ =3D &quot;${@&quot;_&quot;.join(d.getVar(&=
quot;PV&quot;).split(&quot;.&quot;)[0:2])}&quot;<br>
&gt;=C2=A0 BOOST_P =3D &quot;boost_${BOOST_VER}&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://boostorg.jfrog.io/artifacto=
ry/main/release/$%7BPV%7D/source/$%7BBOOST_P%7D.tar.bz2" rel=3D"noreferrer"=
 target=3D"_blank">https://boostorg.jfrog.io/artifactory/main/release/${PV}=
/source/${BOOST_P}.tar.bz2</a>&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;fc9f85fc030e233142908241af7a846e60630aa7=
388de9a5fafb1f3a26840854&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;8681f175d4bdb26c52222665793eef08490d7758=
529330f98d3b29dd0735bccc&quot;<br>
&gt;<br>
&gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"http://www.boost.org/use=
rs/download/" rel=3D"noreferrer" target=3D"_blank">http://www.boost.org/use=
rs/download/</a>&quot;<br>
&gt;=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;release/(?P&lt;pver&gt;.*)/source=
/&quot;<br>
&gt; diff --git a/meta/recipes-support/boost/boost/0001-BoostConfig.cmake-a=
llow-searching-for-python310.patch b/meta/recipes-support/boost/boost/0001-=
BoostConfig.cmake-allow-searching-for-python310.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 0a9ee2cc95..0000000000<br>
&gt; --- a/meta/recipes-support/boost/boost/0001-BoostConfig.cmake-allow-se=
arching-for-python310.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,50 +0,0 @@<br>
&gt; -From e193f080c7d209516ac9b712fa0c50bb08026fa2 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" targ=
et=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; -Date: Tue, 19 Oct 2021 12:24:31 +0000<br>
&gt; -Subject: [PATCH] BoostConfig.cmake: allow searching for python310<br>
&gt; -<br>
&gt; -* accept double digits in Python3_VERSION_MINOR<br>
&gt; -<br>
&gt; -* if someone is using e.g.:<br>
&gt; -=C2=A0 find_package(Python3 REQUIRED)<br>
&gt; -=C2=A0 find_package(Boost REQUIRED python${Python3_VERSION_MAJOR}${Py=
thon3_VERSION_MINOR})<br>
&gt; -<br>
&gt; -=C2=A0 with python-3.10 then it currently fails with:<br>
&gt; -<br>
&gt; -=C2=A0 -- Found PythonLibs: /usr/lib/<a href=3D"http://libpython3.10.=
so" rel=3D"noreferrer" target=3D"_blank">libpython3.10.so</a> (found versio=
n &quot;3.10.0&quot;)<br>
&gt; -=C2=A0 -- Found Python3: -native/usr/bin/python3-native/python3 (foun=
d version &quot;3.10.0&quot;) found components: Interpreter<br>
&gt; -=C2=A0 CMake Error at /usr/lib/cmake/Boost-1.77.0/BoostConfig.cmake:1=
41 (find_package):<br>
&gt; -=C2=A0 =C2=A0 Could not find a package configuration file provided by=
 &quot;boost_python310&quot;<br>
&gt; -=C2=A0 =C2=A0 (requested version 1.77.0) with any of the following na=
mes:<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 boost_python310Config.cmake<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 boost_python310-config.cmake<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 Add the installation prefix of &quot;boost_python310&qu=
ot; to CMAKE_PREFIX_PATH or<br>
&gt; -=C2=A0 =C2=A0 set &quot;boost_python310_DIR&quot; to a directory cont=
aining one of the above files.<br>
&gt; -=C2=A0 =C2=A0 If &quot;boost_python310&quot; provides a separate deve=
lopment package or SDK, be<br>
&gt; -=C2=A0 =C2=A0 sure it has been installed.<br>
&gt; -=C2=A0 Call Stack (most recent call first):<br>
&gt; -=C2=A0 =C2=A0 /usr/lib/cmake/Boost-1.77.0/BoostConfig.cmake:258 (boos=
t_find_component)<br>
&gt; -=C2=A0 =C2=A0 /usr/share/cmake-3.21/Modules/FindBoost.cmake:594 (find=
_package)<br>
&gt; -=C2=A0 =C2=A0 CMakeLists.txt:18 (find_package)<br>
&gt; -<br>
&gt; -Upstream-Status: Submitted [<a href=3D"https://github.com/boostorg/bo=
ost_install/pull/53" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/boostorg/boost_install/pull/53</a>]<br>
&gt; -Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.=
com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - tools/boost_install/BoostConfig.cmake | 2 +-<br>
&gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -diff --git a/tools/boost_install/BoostConfig.cmake b/tools/boost_inst=
all/BoostConfig.cmake<br>
&gt; -index fd17821..5dffa58 100644<br>
&gt; ---- a/tools/boost_install/BoostConfig.cmake<br>
&gt; -+++ b/tools/boost_install/BoostConfig.cmake<br>
&gt; -@@ -113,7 +113,7 @@ macro(boost_find_component comp required quiet)<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0set(_BOOST_REQUIRED REQUIRED)<br>
&gt; -=C2=A0 =C2=A0endif()<br>
&gt; -<br>
&gt; --=C2=A0 if(&quot;${comp}&quot; MATCHES &quot;^(python|numpy|mpi_pytho=
n)([1-9])([0-9])$&quot;)<br>
&gt; -+=C2=A0 if(&quot;${comp}&quot; MATCHES &quot;^(python|numpy|mpi_pytho=
n)([1-9])([0-9][0-9]?)$&quot;)<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# handle pythonXY and numpyXY versioned component=
s for compatibility<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-i=
nstruction-set-flags-we-do-that-o.patch b/meta/recipes-support/boost/boost/=
0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch<br>
&gt; index 91ab53efd9..67d5dff125 100644<br>
&gt; --- a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruct=
ion-set-flags-we-do-that-o.patch<br>
&gt; +++ b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruct=
ion-set-flags-we-do-that-o.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 8e1d30454afde37eaa3c593ec19d108cd5ed10d0 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 4d2a8fc8117e56bc283349e5f7f889ebbfc55c71 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Tue, 18 Dec 2018 15:42:57 +0100<br>
&gt;=C2=A0 Subject: [PATCH] Don&#39;t set up arch/instruction-set flags, we=
 do that<br>
&gt; @@ -10,14 +10,14 @@ Signed-off-by: Christopher Larson &lt;<a href=3D"m=
ailto:chris_larson@mentor.com" target=3D"_blank">chris_larson@mentor.com</a=
>&gt;<br>
&gt;=C2=A0 Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kana=
vin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;<br>
&gt;=C2=A0 ---<br>
&gt; - tools/build/src/tools/gcc.jam | 139 --------------------------------=
--<br>
&gt; - 1 file changed, 139 deletions(-)<br>
&gt; + tools/build/src/tools/gcc.jam | 144 --------------------------------=
--<br>
&gt; + 1 file changed, 144 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/too=
ls/gcc.jam<br>
&gt; -index ff3209f7b..70cbc39a5 100644<br>
&gt; +index 47a113223..d77525724 100644<br>
&gt;=C2=A0 --- a/tools/build/src/tools/gcc.jam<br>
&gt;=C2=A0 +++ b/tools/build/src/tools/gcc.jam<br>
&gt; -@@ -1217,142 +1217,3 @@ local rule cpu-flags ( toolset variable : arc=
hitecture : instruction-set + :<br>
&gt; +@@ -1122,147 +1122,3 @@ local rule cpu-flags ( toolset variable : arc=
hitecture : instruction-set + :<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;architecture&gt;$(architec=
ture)/&lt;instruction-set&gt;$(instruction-set)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: $(values) ;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; @@ -158,5 +158,10 @@ index ff3209f7b..70cbc39a5 100644<br>
&gt;=C2=A0 -cpu-flags gcc OPTIONS : s390x : z13 : -march=3Dz13 ;<br>
&gt;=C2=A0 -cpu-flags gcc OPTIONS : s390x : z14 : -march=3Dz14 ;<br>
&gt;=C2=A0 -cpu-flags gcc OPTIONS : s390x : z15 : -march=3Dz15 ;<br>
&gt; +-# ARM<br>
&gt; +-cpu-flags gcc OPTIONS : arm : cortex-a9+vfpv3 : -mcpu=3Dcortex-a9 -m=
fpu=3Dvfpv3 -mfloat-abi=3Dhard ;<br>
&gt; +-cpu-flags gcc OPTIONS : arm : cortex-a53 : -mcpu=3Dcortex-a53 ;<br>
&gt; +-cpu-flags gcc OPTIONS : arm : cortex-r5 : -mcpu=3Dcortex-r5 ;<br>
&gt; +-cpu-flags gcc OPTIONS : arm : cortex-r5+vfpv3-d16 : -mcpu=3Dcortex-r=
5 -mfpu=3Dvfpv3-d16 -mfloat-abi=3Dhard ;<br>
&gt;=C2=A0 -# AIX variant of RS/6000 &amp; PowerPC<br>
&gt;=C2=A0 -toolset.flags gcc AROPTIONS &lt;address-model&gt;64/&lt;target-=
os&gt;aix : &quot;-X64&quot; ;<br>
&gt; diff --git a/meta/recipes-support/boost/boost/0001-fiber-libs-Define-S=
YS_futex-if-it-does-not-exist.patch b/meta/recipes-support/boost/boost/0001=
-fiber-libs-Define-SYS_futex-if-it-does-not-exist.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 523568e9bc..0000000000<br>
&gt; --- a/meta/recipes-support/boost/boost/0001-fiber-libs-Define-SYS_fute=
x-if-it-does-not-exist.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,54 +0,0 @@<br>
&gt; -From d6f7b6064dc91d1d5fa18554b40b14822ab7a32b Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; -Date: Fri, 16 Oct 2020 11:13:22 -0700<br>
&gt; -Subject: [PATCH] fiber,libs: Define SYS_futex if it does not exist<br=
>
&gt; -<br>
&gt; -__NR_futex is not defines by newer architectures e.g. arc, riscv32 as=
<br>
&gt; -they only have 64bit variant of time_t. Glibc defines SYS_futex inter=
face based on<br>
&gt; -__NR_futex, since this is used in applications, such applications sta=
rt<br>
&gt; -to fail to build for these newer architectures. This patch defines a<=
br>
&gt; -fallback to alias __NR_futex to __NR_futex_tim64 so SYS_futex keeps<b=
r>
&gt; -working<br>
&gt; -<br>
&gt; -Upstream-Status: Pending<br>
&gt; -<br>
&gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - boost/fiber/detail/futex.hpp | 5 +++++<br>
&gt; - libs/log/src/event.cpp=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++++<br>
&gt; - 2 files changed, 9 insertions(+)<br>
&gt; -<br>
&gt; -diff --git a/boost/fiber/detail/futex.hpp b/boost/fiber/detail/futex.=
hpp<br>
&gt; -index e64bd5990..16bee64f1 100644<br>
&gt; ---- a/boost/fiber/detail/futex.hpp<br>
&gt; -+++ b/boost/fiber/detail/futex.hpp<br>
&gt; -@@ -17,6 +17,11 @@ extern &quot;C&quot; {<br>
&gt; - #include &lt;linux/futex.h&gt;<br>
&gt; - #include &lt;sys/syscall.h&gt;<br>
&gt; - }<br>
&gt; -+<br>
&gt; -+#if !defined(SYS_futex) &amp;&amp; defined(SYS_futex_time64)<br>
&gt; -+#define SYS_futex SYS_futex_time64<br>
&gt; -+#endif<br>
&gt; -+<br>
&gt; - #elif BOOST_OS_WINDOWS<br>
&gt; - #include &lt;windows.h&gt;<br>
&gt; - #endif<br>
&gt; -diff --git a/libs/log/src/event.cpp b/libs/log/src/event.cpp<br>
&gt; -index 5485154d7..2c7c0381f 100644<br>
&gt; ---- a/libs/log/src/event.cpp<br>
&gt; -+++ b/libs/log/src/event.cpp<br>
&gt; -@@ -31,6 +31,10 @@<br>
&gt; - #include &lt;linux/futex.h&gt;<br>
&gt; - #include &lt;boost/memory_order.hpp&gt;<br>
&gt; -<br>
&gt; -+#if !defined(SYS_futex) &amp;&amp; defined(SYS_futex_time64)<br>
&gt; -+#define SYS_futex SYS_futex_time64<br>
&gt; -+#endif<br>
&gt; -+<br>
&gt; - // Some Android NDKs (Google NDK and older Crystax.NET NDK versions)=
 don&#39;t define SYS_futex<br>
&gt; - #if defined(SYS_futex)<br>
&gt; - #define BOOST_LOG_SYS_FUTEX SYS_futex<br>
&gt; ---<br>
&gt; -2.28.0<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-support/boost/boost/0002-math-allow-definiti=
on-of-boost_math_no_atomic_int-on-the-command-line.patch b/meta/recipes-sup=
port/boost/boost/0002-math-allow-definition-of-boost_math_no_atomic_int-on-=
the-command-line.patch<br>
&gt; deleted file mode 100644<br>
&gt; index b05b795084..0000000000<br>
&gt; --- a/meta/recipes-support/boost/boost/0002-math-allow-definition-of-b=
oost_math_no_atomic_int-on-the-command-line.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,53 +0,0 @@<br>
&gt; -From 32bd6197353f6ea8e5bef01f09e25c944141acfc Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: jzmaddock &lt;<a href=3D"mailto:john@johnmaddock.co.uk" target=
=3D"_blank">john@johnmaddock.co.uk</a>&gt;<br>
&gt; -Date: Wed, 1 Sep 2021 18:54:54 +0100<br>
&gt; -Subject: [PATCH] Allow definition of BOOST_MATH_NO_ATOMIC_INT on the =
command<br>
&gt; - line. Allows us to test/emulate platforms with no atomic integers.<b=
r>
&gt; -<br>
&gt; -[buildroot@heine.tech:<br>
&gt; -=C2=A0 - backport from boostorg/math 32bd6197353f6ea8e5bef01f09e25c94=
4141acfc<br>
&gt; -=C2=A0 - alter path to match boost release<br>
&gt; -]<br>
&gt; -Signed-off-by: Michael Nosthoff &lt;buildroot@heine.tech&gt;<br>
&gt; ----<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://github.com/boostorg/mat=
h/pull/684/commits/32bd6197353f6ea8e5bef01f09e25c944141acfc" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/boostorg/math/pull/684/commits/32=
bd6197353f6ea8e5bef01f09e25c944141acfc</a>]<br>
&gt; - boost/math/tools/atomic.hpp | 10 +++++-----<br>
&gt; - 1 file changed, 5 insertions(+), 5 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/boost/math/tools/atomic.hpp b/boost/math/tools/atomic.hp=
p<br>
&gt; -index cc76ed269f..e3cbf5db89 100644<br>
&gt; ---- a/boost/math/tools/atomic.hpp<br>
&gt; -+++ b/boost/math/tools/atomic.hpp<br>
&gt; -@@ -16,27 +16,27 @@<br>
&gt; - namespace boost {<br>
&gt; -=C2=A0 =C2=A0 namespace math {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0namespace detail {<br>
&gt; --#if ATOMIC_INT_LOCK_FREE =3D=3D 2<br>
&gt; -+#if (ATOMIC_INT_LOCK_FREE =3D=3D 2) &amp;&amp; !defined(BOOST_MATH_N=
O_ATOMIC_INT)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typedef std::atomic&lt;int&gt; ato=
mic_counter_type;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typedef std::atomic&lt;unsigned&gt=
; atomic_unsigned_type;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typedef int atomic_integer_type;<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typedef unsigned atomic_unsigned_i=
nteger_type;<br>
&gt; --#elif ATOMIC_SHORT_LOCK_FREE =3D=3D 2<br>
&gt; -+#elif (ATOMIC_SHORT_LOCK_FREE =3D=3D 2) &amp;&amp; !defined(BOOST_MA=
TH_NO_ATOMIC_INT)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typedef std::atomic&lt;short&gt; a=
tomic_counter_type;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typedef std::atomic&lt;unsigned sh=
ort&gt; atomic_unsigned_type;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typedef short atomic_integer_type;=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typedef unsigned short atomic_unsi=
gned_type;<br>
&gt; --#elif ATOMIC_LONG_LOCK_FREE =3D=3D 2<br>
&gt; -+#elif (ATOMIC_LONG_LOCK_FREE =3D=3D 2) &amp;&amp; !defined(BOOST_MAT=
H_NO_ATOMIC_INT)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typedef std::atomic&lt;long&gt; at=
omic_unsigned_integer_type;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typedef std::atomic&lt;unsigned lo=
ng&gt; atomic_unsigned_type;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typedef unsigned long atomic_unsig=
ned_type;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typedef long atomic_integer_type;<=
br>
&gt; --#elif ATOMIC_LLONG_LOCK_FREE =3D=3D 2<br>
&gt; -+#elif (ATOMIC_LLONG_LOCK_FREE =3D=3D 2) &amp;&amp; !defined(BOOST_MA=
TH_NO_ATOMIC_INT)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typedef std::atomic&lt;long long&g=
t; atomic_unsigned_integer_type;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typedef std::atomic&lt;unsigned lo=
ng long&gt; atomic_unsigned_type;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typedef long long atomic_integer_t=
ype;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typedef unsigned long long atomic_=
unsigned_integer_type;<br>
&gt; --#else<br>
&gt; -+#elif !defined(BOOST_MATH_NO_ATOMIC_INT)<br>
&gt; - #=C2=A0 define BOOST_MATH_NO_ATOMIC_INT<br>
&gt; - #endif<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0} // Namespace detail<br>
&gt; diff --git a/meta/recipes-support/boost/boost/0003-math-make-no-atomic=
s-a-soft-failure-in-bernoulli_details_hpp.patch b/meta/recipes-support/boos=
t/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.p=
atch<br>
&gt; deleted file mode 100644<br>
&gt; index f69e4f21f3..0000000000<br>
&gt; --- a/meta/recipes-support/boost/boost/0003-math-make-no-atomics-a-sof=
t-failure-in-bernoulli_details_hpp.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,151 +0,0 @@<br>
&gt; -From 7d482f6ebc356e6ec455ccb5f51a23971bf6ce5b Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: jzmaddock &lt;<a href=3D"mailto:john@johnmaddock.co.uk" target=
=3D"_blank">john@johnmaddock.co.uk</a>&gt;<br>
&gt; -Date: Wed, 1 Sep 2021 20:31:53 +0100<br>
&gt; -Subject: [PATCH] Make no atomics a soft failure in bernoulli_details.=
hpp.<br>
&gt; - Include an &quot;escape macro&quot; so thread safety can be disabled=
 if certain<br>
&gt; - bernoulli features are to be used in a no-atomics environment. Fixes=
<br>
&gt; - <a href=3D"https://github.com/boostorg/math/issues/673" rel=3D"noref=
errer" target=3D"_blank">https://github.com/boostorg/math/issues/673</a>.<b=
r>
&gt; -<br>
&gt; -[buildroot@heine.tech:<br>
&gt; -=C2=A0 - backport from boostorg/math 7d482f6ebc356e6ec455ccb5f51a2397=
1bf6ce5b<br>
&gt; -=C2=A0 - alter path to match boost release<br>
&gt; -]<br>
&gt; -Signed-off-by: Michael Nosthoff &lt;buildroot@heine.tech&gt;<br>
&gt; ----<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://github.com/boostorg/mat=
h/pull/684/commits/7d482f6ebc356e6ec455ccb5f51a23971bf6ce5b" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/boostorg/math/pull/684/commits/7d=
482f6ebc356e6ec455ccb5f51a23971bf6ce5b</a>]<br>
&gt; - .../detail/bernoulli_details.hpp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++++++---<br>
&gt; - libs/math/test/Jamfile.v2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +++<br>
&gt; - test/compile_test/bernoulli_no_atomic_d.cpp=C2=A0 =C2=A0 =C2=A0 | 14=
 ++++++++++++++<br>
&gt; - test/compile_test/bernoulli_no_atomic_fail.cpp=C2=A0 =C2=A0| 15 ++++=
+++++++++++<br>
&gt; - test/compile_test/bernoulli_no_atomic_mp.cpp=C2=A0 =C2=A0 =C2=A0| 16=
 ++++++++++++++++<br>
&gt; - 5 files changed, 55 insertions(+), 3 deletions(-)<br>
&gt; - create mode 100644 test/compile_test/bernoulli_no_atomic_d.cpp<br>
&gt; - create mode 100644 test/compile_test/bernoulli_no_atomic_fail.cpp<br=
>
&gt; - create mode 100644 test/compile_test/bernoulli_no_atomic_mp.cpp<br>
&gt; -<br>
&gt; -diff --git a/boost/math/special_functions/detail/bernoulli_details.hp=
p b/boost/math/special_functions/detail/bernoulli_details.hpp<br>
&gt; -index cf35545264..8519b7c89c 100644<br>
&gt; ---- a/boost/math/special_functions/detail/bernoulli_details.hpp<br>
&gt; -+++ b/boost/math/special_functions/detail/bernoulli_details.hpp<br>
&gt; -@@ -360,7 +360,7 @@ class bernoulli_numbers_cache<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return out;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 #ifndef BOOST_HAS_THREADS<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 #if !defined(BOOST_HAS_THREADS) || defined(BOOS=
T_MATH_BERNOULLI_UNTHREADED)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0//<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0// Single threaded code, very simple:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0//<br>
&gt; -@@ -382,6 +382,8 @@ class bernoulli_numbers_cache<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *out =3D (i &gt;=3D m_overflow_lim=
it) ? policies::raise_overflow_error&lt;T&gt;(&quot;boost::math::bernoulli_=
b2n&lt;%1%&gt;(std::size_t)&quot;, 0, T(i), pol) : bn[i];<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ++out;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 #elif defined(BOOST_MATH_NO_ATOMIC_INT)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 static_assert(sizeof(T) =3D=3D 1, &quot;Unsuppo=
rted configuration: your platform appears to have no atomic integers.=C2=A0=
 If you are happy with thread-unsafe code, then you may define BOOST_MATH_B=
ERNOULLI_UNTHREADED to suppress this error.&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0#else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0//<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0// Double-checked locking pattern, lets us=
 access cached already cached values<br>
&gt; -@@ -464,7 +466,7 @@ class bernoulli_numbers_cache<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return out;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 #ifndef BOOST_HAS_THREADS<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 #if !defined(BOOST_HAS_THREADS) || defined(BOOS=
T_MATH_BERNOULLI_UNTHREADED)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0//<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0// Single threaded code, very simple:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0//<br>
&gt; -@@ -494,6 +496,8 @@ class bernoulli_numbers_cache<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ++out;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 #elif defined(BOOST_MATH_NO_ATOMIC_INT)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 static_assert(sizeof(T) =3D=3D 1, &quot;Unsuppo=
rted configuration: your platform appears to have no atomic integers.=C2=A0=
 If you are happy with thread-unsafe code, then you may define BOOST_MATH_B=
ERNOULLI_UNTHREADED to suppress this error.&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0#else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0//<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0// Double-checked locking pattern, lets us=
 access cached already cached values<br>
&gt; -@@ -555,7 +559,7 @@ class bernoulli_numbers_cache<br>
&gt; -=C2=A0 =C2=A0 // The value at which we know overflow has already occu=
rred for the Bn:<br>
&gt; -=C2=A0 =C2=A0 std::size_t m_overflow_limit;<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0#ifdef BOOST_HAS_THREADS<br>
&gt; -+=C2=A0 =C2=A0#if defined(BOOST_HAS_THREADS) &amp;&amp; !defined(BOOS=
T_MATH_NO_ATOMIC_INT)<br>
&gt; -=C2=A0 =C2=A0 std::mutex m_mutex;<br>
&gt; -=C2=A0 =C2=A0 atomic_counter_type m_counter, m_current_precision;<br>
&gt; -=C2=A0 =C2=A0 #else<br>
&gt; -diff --git a/libs/math/test/Jamfile.v2 b/libs/math/test/Jamfile.v2<br=
>
&gt; -index 52fb87f5e5..3ac63f9279 100644<br>
&gt; ---- a/libs/math/test/Jamfile.v2<br>
&gt; -+++ b/libs/math/test/Jamfile.v2<br>
&gt; -@@ -1137,6 +1137,9 @@ test-suite misc :<br>
&gt; -<br>
&gt; - #=C2=A0 =C2=A0[ run __temporary_test.cpp test_instances//test_instan=
ces : : : &lt;test-info&gt;always_show_run_output &lt;pch&gt;off ]<br>
&gt; -=C2=A0 =C2=A0 [ compile test_no_long_double_policy.cpp ]<br>
&gt; -+=C2=A0 =C2=A0[ compile compile_test/bernoulli_no_atomic_d.cpp ]<br>
&gt; -+=C2=A0 =C2=A0[ compile compile_test/bernoulli_no_atomic_mp.cpp ]<br>
&gt; -+=C2=A0 =C2=A0[ compile-fail compile_test/bernoulli_no_atomic_fail.cp=
p ]<br>
&gt; - ;<br>
&gt; -<br>
&gt; - test-suite interpolators :<br>
&gt; -diff --git a/test/compile_test/bernoulli_no_atomic_d.cpp b/test/compi=
le_test/bernoulli_no_atomic_d.cpp<br>
&gt; -new file mode 100644<br>
&gt; -index 0000000000..61926f7e1f<br>
&gt; ---- /dev/null<br>
&gt; -+++ b/test/compile_test/bernoulli_no_atomic_d.cpp<br>
&gt; -@@ -0,0 +1,14 @@<br>
&gt; -+//=C2=A0 (C) Copyright John Maddock 2021.<br>
&gt; -+//=C2=A0 Use, modification and distribution are subject to the<br>
&gt; -+//=C2=A0 Boost Software License, Version 1.0. (See accompanying file=
<br>
&gt; -+//=C2=A0 LICENSE_1_0.txt or copy at <a href=3D"http://www.boost.org/=
LICENSE_1_0.txt" rel=3D"noreferrer" target=3D"_blank">http://www.boost.org/=
LICENSE_1_0.txt</a>)<br>
&gt; -+<br>
&gt; -+#define BOOST_MATH_NO_ATOMIC_INT<br>
&gt; -+<br>
&gt; -+#include &lt;boost/math/special_functions/bernoulli.hpp&gt;<br>
&gt; -+#include &quot;test_compile_result.hpp&quot;<br>
&gt; -+<br>
&gt; -+void compile_and_link_test()<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0check_result&lt;double&gt;(boost::math::bernoulli_b2n&l=
t;double&gt;(4));<br>
&gt; -+}<br>
&gt; -diff --git a/test/compile_test/bernoulli_no_atomic_fail.cpp b/test/co=
mpile_test/bernoulli_no_atomic_fail.cpp<br>
&gt; -new file mode 100644<br>
&gt; -index 0000000000..bbd7152412<br>
&gt; ---- /dev/null<br>
&gt; -+++ b/test/compile_test/bernoulli_no_atomic_fail.cpp<br>
&gt; -@@ -0,0 +1,15 @@<br>
&gt; -+//=C2=A0 (C) Copyright John Maddock 2021.<br>
&gt; -+//=C2=A0 Use, modification and distribution are subject to the<br>
&gt; -+//=C2=A0 Boost Software License, Version 1.0. (See accompanying file=
<br>
&gt; -+//=C2=A0 LICENSE_1_0.txt or copy at <a href=3D"http://www.boost.org/=
LICENSE_1_0.txt" rel=3D"noreferrer" target=3D"_blank">http://www.boost.org/=
LICENSE_1_0.txt</a>)<br>
&gt; -+<br>
&gt; -+#define BOOST_MATH_NO_ATOMIC_INT<br>
&gt; -+<br>
&gt; -+#include &lt;boost/math/special_functions/bernoulli.hpp&gt;<br>
&gt; -+#include &lt;boost/multiprecision/cpp_bin_float.hpp&gt;<br>
&gt; -+#include &quot;test_compile_result.hpp&quot;<br>
&gt; -+<br>
&gt; -+void compile_and_link_test()<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0check_result&lt;boost::multiprecision::cpp_bin_float_50=
&gt;(boost::math::bernoulli_b2n&lt;boost::multiprecision::cpp_bin_float_50&=
gt;(4));<br>
&gt; -+}<br>
&gt; -diff --git a/test/compile_test/bernoulli_no_atomic_mp.cpp b/test/comp=
ile_test/bernoulli_no_atomic_mp.cpp<br>
&gt; -new file mode 100644<br>
&gt; -index 0000000000..8d5a6e78e6<br>
&gt; ---- /dev/null<br>
&gt; -+++ b/test/compile_test/bernoulli_no_atomic_mp.cpp<br>
&gt; -@@ -0,0 +1,16 @@<br>
&gt; -+//=C2=A0 (C) Copyright John Maddock 2021.<br>
&gt; -+//=C2=A0 Use, modification and distribution are subject to the<br>
&gt; -+//=C2=A0 Boost Software License, Version 1.0. (See accompanying file=
<br>
&gt; -+//=C2=A0 LICENSE_1_0.txt or copy at <a href=3D"http://www.boost.org/=
LICENSE_1_0.txt" rel=3D"noreferrer" target=3D"_blank">http://www.boost.org/=
LICENSE_1_0.txt</a>)<br>
&gt; -+<br>
&gt; -+#define BOOST_MATH_NO_ATOMIC_INT<br>
&gt; -+#define BOOST_MATH_BERNOULLI_UNTHREADED<br>
&gt; -+<br>
&gt; -+#include &lt;boost/math/special_functions/bernoulli.hpp&gt;<br>
&gt; -+#include &lt;boost/multiprecision/cpp_bin_float.hpp&gt;<br>
&gt; -+#include &quot;test_compile_result.hpp&quot;<br>
&gt; -+<br>
&gt; -+void compile_and_link_test()<br>
&gt; -+{<br>
&gt; -+=C2=A0 =C2=A0check_result&lt;boost::multiprecision::cpp_bin_float_50=
&gt;(boost::math::bernoulli_b2n&lt;boost::multiprecision::cpp_bin_float_50&=
gt;(4));<br>
&gt; -+}<br>
&gt; diff --git a/meta/recipes-support/boost/boost/de657e01635306085488290e=
a83de541ec393f8b.patch b/meta/recipes-support/boost/boost/de657e01635306085=
488290ea83de541ec393f8b.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..867ec03ba6<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/boost/boost/de657e01635306085488290ea83de54=
1ec393f8b.patch<br>
&gt; @@ -0,0 +1,30 @@<br>
&gt; +From de657e01635306085488290ea83de541ec393f8b Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Leonardo Neumann &lt;<a href=3D"mailto:leonardo@neumann.dev.br"=
 target=3D"_blank">leonardo@neumann.dev.br</a>&gt;<br>
&gt; +Date: Mon, 13 Dec 2021 01:07:20 -0300<br>
&gt; +Subject: [PATCH] Fix missing sys/stat.h include on musl-based systems=
<br>
&gt; +<br>
&gt; +Boost 1.78.0 fails to build on musl-based systems because musl does<b=
r>
&gt; +not include sys/stat.h by default.<br>
&gt; +<br>
&gt; +Fixes #161 (&quot;Boost compiler error&quot;)<br>
&gt; +Upstream-Status: Submitted [<a href=3D"https://github.com/boostorg/in=
terprocess/pull/162" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/boostorg/interprocess/pull/162</a>]<br>
&gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + include/boost/interprocess/permissions.hpp | 4 ++++<br>
&gt; + 1 file changed, 4 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/boost/interprocess/permissions.hpp b/boost/interprocess/=
permissions.hpp<br>
&gt; +index ab55411e..0b21a685 100644<br>
&gt; +--- a/boost/interprocess/permissions.hpp<br>
&gt; ++++ b/boost/interprocess/permissions.hpp<br>
&gt; +@@ -29,6 +29,10 @@<br>
&gt; +<br>
&gt; + #include &lt;boost/interprocess/detail/win32_api.hpp&gt;<br>
&gt; +<br>
&gt; ++#else<br>
&gt; ++<br>
&gt; ++#include &lt;sys/stat.h&gt;<br>
&gt; ++<br>
&gt; + #endif<br>
&gt; +<br>
&gt; + #endif=C2=A0 =C2=A0//#ifndef BOOST_INTERPROCESS_DOXYGEN_INVOKED<br>
&gt; diff --git a/meta/recipes-support/boost/<a href=3D"http://boost_1.77.0=
.bb" rel=3D"noreferrer" target=3D"_blank">boost_1.77.0.bb</a> b/meta/recipe=
s-support/boost/<a href=3D"http://boost_1.77.0.bb" rel=3D"noreferrer" targe=
t=3D"_blank">boost_1.77.0.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index bde6b14a79..0000000000<br>
&gt; --- a/meta/recipes-support/boost/<a href=3D"http://boost_1.77.0.bb" re=
l=3D"noreferrer" target=3D"_blank">boost_1.77.0.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,12 +0,0 @@<br>
&gt; -require boost-${PV}.inc<br>
&gt; -require boost.inc<br>
&gt; -<br>
&gt; -SRC_URI +=3D &quot;file://boost-CVE-2012-2677.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://boost-math-disable-pc=
h-for-gcc.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Don-t-set-up-arc=
h-instruction-set-flags-we-do-that-o.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-dont-setup-compi=
ler-flags-m32-m64.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-fiber-libs-Defin=
e-SYS_futex-if-it-does-not-exist.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-BoostConfig.cmak=
e-allow-searching-for-python310.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-math-allow-defin=
ition-of-boost_math_no_atomic_int-on-the-command-line.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-math-make-no-ato=
mics-a-soft-failure-in-bernoulli_details_hpp.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; diff --git a/meta/recipes-support/boost/<a href=3D"http://boost_1.78.0=
.bb" rel=3D"noreferrer" target=3D"_blank">boost_1.78.0.bb</a> b/meta/recipe=
s-support/boost/<a href=3D"http://boost_1.78.0.bb" rel=3D"noreferrer" targe=
t=3D"_blank">boost_1.78.0.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..f4b6ed8576<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/boost/<a href=3D"http://boost_1.78.0.bb" re=
l=3D"noreferrer" target=3D"_blank">boost_1.78.0.bb</a><br>
&gt; @@ -0,0 +1,9 @@<br>
&gt; +require boost-${PV}.inc<br>
&gt; +require boost.inc<br>
&gt; +<br>
&gt; +SRC_URI +=3D &quot;file://boost-CVE-2012-2677.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://boost-math-disable-pc=
h-for-gcc.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Don-t-set-up-arc=
h-instruction-set-flags-we-do-that-o.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-dont-setup-compi=
ler-flags-m32-m64.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://de657e016353060854882=
90ea83de541ec393f8b.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; --<br>
&gt; 2.20.1<br>
&gt;<br>
</blockquote></div></div>

--00000000000083504005d33f37c9--

