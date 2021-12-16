Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D945C433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 17:07:41 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web08.13271.1639674459860521298
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 09:07:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=feegWInb;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id kd9so2186530qvb.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 09:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yanNx0JGqbKjJDzHisVyULjI3k+6lR+ApIST5AyhWAE=;
        b=feegWInbJoMWL2xBeLpAxrdzPjqdeJultdkzwW5Qyylc5vKFUnt9OaJ7tVOfAVsTir
         KKKB39ygR0bpBKFLsrQLpjsa9k2ce5BEFU+Fo5+SvIvnARx9/yjc8jjC1s2biJR3jlYY
         6niNMwGgB6ImT7Xwg8wGmVnT/WbTM8c+Fus5utfQSuhlZP84qMGvhtesK35QiPlpffpI
         TEs1vTdPNcIDwV/eNfOVd4cQjfIpEp2JmBvVMArHDlEmbdcCci/zLZtV2Efcqabp7ced
         Rb5ROAqeohJ2CUzKDcEv2/trUZTF1uKfdqQqesXC3sZY7fHjbh9dol/tmmKDgn6TvuOv
         32YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yanNx0JGqbKjJDzHisVyULjI3k+6lR+ApIST5AyhWAE=;
        b=6yrAO39k/TDBkDDHyxMrMrqenDLLQRsc18zMUagNrY3vCDfSdEPSSKkAJGui8EvFbG
         JwPPigO6XVjXf/3BVZwtOQwGpq8SNCk59c9deBY0PS+lE/0/6E3VNBhK3ghxwSDWw1BS
         iHgiIGhvGW7sXrCq2WH5CLiAzw7YJlLg75fKVpIFtWc5P+e4kLxk42734Bywbv+5xsOg
         cNPxV+aeUtGP5mKsJaEtpUWqJxG6RG+6LlO+TsfZgZrVDma5tgpOKSdjmE1ouUvOCkAQ
         K236llFf7yMQ6+h3PIMBFcYvjZgPxLfzfR0BnpKDuEQFySNRYcC0QItW8OoMRuDfbb8G
         UuwQ==
X-Gm-Message-State: AOAM531nvdTfm9wADYRstlniPiHAhQB48rN0Tfp06bz7lBeKgHK8RqTC
	Mr9euNqkcU/KdPI8ScvvUetHKcy9gTvMdqpNqcA=
X-Google-Smtp-Source: 
 ABdhPJzH1skYNiuJpZLhTyQd1DCd2utGQlDGOt78T56uN+HfbeFE8Letz4TpV0A45KpEdpqBOyUQxnakF5k/Vg3V/7E=
X-Received: by 2002:a05:6214:2429:: with SMTP id
 gy9mr16627231qvb.36.1639674458781;
 Thu, 16 Dec 2021 09:07:38 -0800 (PST)
MIME-Version: 1.0
References: <20211215224034.1814148-1-alex@linutronix.de>
 <20211215224034.1814148-18-alex@linutronix.de>
 <CAMKF1sqesSYYT8_wbCzAFBdFmow-s-eprXM05x-3xnsog3PqVw@mail.gmail.com>
 <CANNYZj8ixrrKu61w0wroVAd1G4AyHgufbGN650SyaT=50aEL3A@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8ixrrKu61w0wroVAd1G4AyHgufbGN650SyaT=50aEL3A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Dec 2021 09:07:12 -0800
Message-ID: 
 <CAMKF1sp9mLP-4qXD1fX+TweLyPj-F6OMrmyQeBO_Ha8Ej8mCQA@mail.gmail.com>
Subject: Re: [PATCH 18/26] boost: update 1.77.0 -> 1.78.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>,
 Martin Jansa <Martin.Jansa@gmail.com>,
	Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 17:07:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159797

On Thu, Dec 16, 2021 at 12:29 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Thu, 16 Dec 2021 at 00:28, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> > Drop 0001-fiber-libs-Define-SYS_futex-if-it-does-not-exist.patch as
>> > it is difficult to rebase and needs to land upstream first.
>>
>> It's not that rebasing is too hard for this patch but this patch is an
>> incorrect way to fix what it's trying to solve and that's why I am
>> fine with dropping it.
>> landing upstream is not a precondition for submitting patches to
>> OpenEmbedded but good to have. All distributions carry patches and as
>> long as patches are working
>> their way upstream asynchronously its ok.  Let's not make it too hard
>> for contributors and chase them away.
>
>
> Yes, rather than 'land upstream' I should've said 'submitted upstream' - =
that patch is dated 16 October 2020, and it never happened. While myself an=
d everyone else enormously appreciate your toolchain and target work, there=
's a problem with amassing invasive pending patches related to that: no one=
 except you truly understands them. So what I'm asking is just a bit more r=
igor going forward: submit patches upstream at the same time you submit the=
m to core, and steadily work your way towards reducing the pile that's alre=
ady there.
>

you are preaching to the choir :) However new patches will be required
as the packages are upgraded/updates, lot of upstream
do not support/test architectures that OE supports ( which is one of
USPs of OE ) so its bound to happen that something will regress for OE
and we have to patch it.
and we do not have developer strength like other distributions. By not
being accepting of this situation, we are effectively making it hard
for OE to be used on such architectures
which are either new or specific and they could be the reason for OE
to thrive in the future. There is a fine line to tread here.

> Alex
>
>
>>
>>
>> >
>> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> > ---
>> >  .../{boost-1.77.0.inc =3D> boost-1.78.0.inc}    |   2 +-
>> >  ....cmake-allow-searching-for-python310.patch |  50 ------
>> >  ...h-instruction-set-flags-we-do-that-o.patch |  15 +-
>> >  ...efine-SYS_futex-if-it-does-not-exist.patch |  54 -------
>> >  ...th_no_atomic_int-on-the-command-line.patch |  53 ------
>> >  ...oft-failure-in-bernoulli_details_hpp.patch | 151 -----------------=
-
>> >  ...7e01635306085488290ea83de541ec393f8b.patch |  30 ++++
>> >  meta/recipes-support/boost/boost_1.77.0.bb    |  12 --
>> >  meta/recipes-support/boost/boost_1.78.0.bb    |   9 ++
>> >  9 files changed, 50 insertions(+), 326 deletions(-)
>> >  rename meta/recipes-support/boost/{boost-1.77.0.inc =3D> boost-1.78.0=
.inc} (90%)
>> >  delete mode 100644 meta/recipes-support/boost/boost/0001-BoostConfig.=
cmake-allow-searching-for-python310.patch
>> >  delete mode 100644 meta/recipes-support/boost/boost/0001-fiber-libs-D=
efine-SYS_futex-if-it-does-not-exist.patch
>> >  delete mode 100644 meta/recipes-support/boost/boost/0002-math-allow-d=
efinition-of-boost_math_no_atomic_int-on-the-command-line.patch
>> >  delete mode 100644 meta/recipes-support/boost/boost/0003-math-make-no=
-atomics-a-soft-failure-in-bernoulli_details_hpp.patch
>> >  create mode 100644 meta/recipes-support/boost/boost/de657e01635306085=
488290ea83de541ec393f8b.patch
>> >  delete mode 100644 meta/recipes-support/boost/boost_1.77.0.bb
>> >  create mode 100644 meta/recipes-support/boost/boost_1.78.0.bb
>> >
>> > diff --git a/meta/recipes-support/boost/boost-1.77.0.inc b/meta/recipe=
s-support/boost/boost-1.78.0.inc
>> > similarity index 90%
>> > rename from meta/recipes-support/boost/boost-1.77.0.inc
>> > rename to meta/recipes-support/boost/boost-1.78.0.inc
>> > index 6df06e76c7..729a47b54f 100644
>> > --- a/meta/recipes-support/boost/boost-1.77.0.inc
>> > +++ b/meta/recipes-support/boost/boost-1.78.0.inc
>> > @@ -12,7 +12,7 @@ BOOST_MAJ =3D "${@"_".join(d.getVar("PV").split(".")=
[0:2])}"
>> >  BOOST_P =3D "boost_${BOOST_VER}"
>> >
>> >  SRC_URI =3D "https://boostorg.jfrog.io/artifactory/main/release/${PV}=
/source/${BOOST_P}.tar.bz2"
>> > -SRC_URI[sha256sum] =3D "fc9f85fc030e233142908241af7a846e60630aa7388de=
9a5fafb1f3a26840854"
>> > +SRC_URI[sha256sum] =3D "8681f175d4bdb26c52222665793eef08490d775852933=
0f98d3b29dd0735bccc"
>> >
>> >  UPSTREAM_CHECK_URI =3D "http://www.boost.org/users/download/"
>> >  UPSTREAM_CHECK_REGEX =3D "release/(?P<pver>.*)/source/"
>> > diff --git a/meta/recipes-support/boost/boost/0001-BoostConfig.cmake-a=
llow-searching-for-python310.patch b/meta/recipes-support/boost/boost/0001-=
BoostConfig.cmake-allow-searching-for-python310.patch
>> > deleted file mode 100644
>> > index 0a9ee2cc95..0000000000
>> > --- a/meta/recipes-support/boost/boost/0001-BoostConfig.cmake-allow-se=
arching-for-python310.patch
>> > +++ /dev/null
>> > @@ -1,50 +0,0 @@
>> > -From e193f080c7d209516ac9b712fa0c50bb08026fa2 Mon Sep 17 00:00:00 200=
1
>> > -From: Martin Jansa <Martin.Jansa@gmail.com>
>> > -Date: Tue, 19 Oct 2021 12:24:31 +0000
>> > -Subject: [PATCH] BoostConfig.cmake: allow searching for python310
>> > -
>> > -* accept double digits in Python3_VERSION_MINOR
>> > -
>> > -* if someone is using e.g.:
>> > -  find_package(Python3 REQUIRED)
>> > -  find_package(Boost REQUIRED python${Python3_VERSION_MAJOR}${Python3=
_VERSION_MINOR})
>> > -
>> > -  with python-3.10 then it currently fails with:
>> > -
>> > -  -- Found PythonLibs: /usr/lib/libpython3.10.so (found version "3.10=
.0")
>> > -  -- Found Python3: -native/usr/bin/python3-native/python3 (found ver=
sion "3.10.0") found components: Interpreter
>> > -  CMake Error at /usr/lib/cmake/Boost-1.77.0/BoostConfig.cmake:141 (f=
ind_package):
>> > -    Could not find a package configuration file provided by "boost_py=
thon310"
>> > -    (requested version 1.77.0) with any of the following names:
>> > -
>> > -      boost_python310Config.cmake
>> > -      boost_python310-config.cmake
>> > -
>> > -    Add the installation prefix of "boost_python310" to CMAKE_PREFIX_=
PATH or
>> > -    set "boost_python310_DIR" to a directory containing one of the ab=
ove files.
>> > -    If "boost_python310" provides a separate development package or S=
DK, be
>> > -    sure it has been installed.
>> > -  Call Stack (most recent call first):
>> > -    /usr/lib/cmake/Boost-1.77.0/BoostConfig.cmake:258 (boost_find_com=
ponent)
>> > -    /usr/share/cmake-3.21/Modules/FindBoost.cmake:594 (find_package)
>> > -    CMakeLists.txt:18 (find_package)
>> > -
>> > -Upstream-Status: Submitted [https://github.com/boostorg/boost_install=
/pull/53]
>> > -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > ----
>> > - tools/boost_install/BoostConfig.cmake | 2 +-
>> > - 1 file changed, 1 insertion(+), 1 deletion(-)
>> > -
>> > -diff --git a/tools/boost_install/BoostConfig.cmake b/tools/boost_inst=
all/BoostConfig.cmake
>> > -index fd17821..5dffa58 100644
>> > ---- a/tools/boost_install/BoostConfig.cmake
>> > -+++ b/tools/boost_install/BoostConfig.cmake
>> > -@@ -113,7 +113,7 @@ macro(boost_find_component comp required quiet)
>> > -     set(_BOOST_REQUIRED REQUIRED)
>> > -   endif()
>> > -
>> > --  if("${comp}" MATCHES "^(python|numpy|mpi_python)([1-9])([0-9])$")
>> > -+  if("${comp}" MATCHES "^(python|numpy|mpi_python)([1-9])([0-9][0-9]=
?)$")
>> > -
>> > -     # handle pythonXY and numpyXY versioned components for compatibi=
lity
>> > -
>> > diff --git a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-i=
nstruction-set-flags-we-do-that-o.patch b/meta/recipes-support/boost/boost/=
0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
>> > index 91ab53efd9..67d5dff125 100644
>> > --- a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruct=
ion-set-flags-we-do-that-o.patch
>> > +++ b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruct=
ion-set-flags-we-do-that-o.patch
>> > @@ -1,4 +1,4 @@
>> > -From 8e1d30454afde37eaa3c593ec19d108cd5ed10d0 Mon Sep 17 00:00:00 200=
1
>> > +From 4d2a8fc8117e56bc283349e5f7f889ebbfc55c71 Mon Sep 17 00:00:00 200=
1
>> >  From: Alexander Kanavin <alex.kanavin@gmail.com>
>> >  Date: Tue, 18 Dec 2018 15:42:57 +0100
>> >  Subject: [PATCH] Don't set up arch/instruction-set flags, we do that
>> > @@ -10,14 +10,14 @@ Signed-off-by: Christopher Larson <chris_larson@me=
ntor.com>
>> >  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> >
>> >  ---
>> > - tools/build/src/tools/gcc.jam | 139 --------------------------------=
--
>> > - 1 file changed, 139 deletions(-)
>> > + tools/build/src/tools/gcc.jam | 144 --------------------------------=
--
>> > + 1 file changed, 144 deletions(-)
>> >
>> >  diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gc=
c.jam
>> > -index ff3209f7b..70cbc39a5 100644
>> > +index 47a113223..d77525724 100644
>> >  --- a/tools/build/src/tools/gcc.jam
>> >  +++ b/tools/build/src/tools/gcc.jam
>> > -@@ -1217,142 +1217,3 @@ local rule cpu-flags ( toolset variable : arc=
hitecture : instruction-set + :
>> > +@@ -1122,147 +1122,3 @@ local rule cpu-flags ( toolset variable : arc=
hitecture : instruction-set + :
>> >           <architecture>$(architecture)/<instruction-set>$(instruction=
-set)
>> >           : $(values) ;
>> >   }
>> > @@ -158,5 +158,10 @@ index ff3209f7b..70cbc39a5 100644
>> >  -cpu-flags gcc OPTIONS : s390x : z13 : -march=3Dz13 ;
>> >  -cpu-flags gcc OPTIONS : s390x : z14 : -march=3Dz14 ;
>> >  -cpu-flags gcc OPTIONS : s390x : z15 : -march=3Dz15 ;
>> > +-# ARM
>> > +-cpu-flags gcc OPTIONS : arm : cortex-a9+vfpv3 : -mcpu=3Dcortex-a9 -m=
fpu=3Dvfpv3 -mfloat-abi=3Dhard ;
>> > +-cpu-flags gcc OPTIONS : arm : cortex-a53 : -mcpu=3Dcortex-a53 ;
>> > +-cpu-flags gcc OPTIONS : arm : cortex-r5 : -mcpu=3Dcortex-r5 ;
>> > +-cpu-flags gcc OPTIONS : arm : cortex-r5+vfpv3-d16 : -mcpu=3Dcortex-r=
5 -mfpu=3Dvfpv3-d16 -mfloat-abi=3Dhard ;
>> >  -# AIX variant of RS/6000 & PowerPC
>> >  -toolset.flags gcc AROPTIONS <address-model>64/<target-os>aix : "-X64=
" ;
>> > diff --git a/meta/recipes-support/boost/boost/0001-fiber-libs-Define-S=
YS_futex-if-it-does-not-exist.patch b/meta/recipes-support/boost/boost/0001=
-fiber-libs-Define-SYS_futex-if-it-does-not-exist.patch
>> > deleted file mode 100644
>> > index 523568e9bc..0000000000
>> > --- a/meta/recipes-support/boost/boost/0001-fiber-libs-Define-SYS_fute=
x-if-it-does-not-exist.patch
>> > +++ /dev/null
>> > @@ -1,54 +0,0 @@
>> > -From d6f7b6064dc91d1d5fa18554b40b14822ab7a32b Mon Sep 17 00:00:00 200=
1
>> > -From: Khem Raj <raj.khem@gmail.com>
>> > -Date: Fri, 16 Oct 2020 11:13:22 -0700
>> > -Subject: [PATCH] fiber,libs: Define SYS_futex if it does not exist
>> > -
>> > -__NR_futex is not defines by newer architectures e.g. arc, riscv32 as
>> > -they only have 64bit variant of time_t. Glibc defines SYS_futex inter=
face based on
>> > -__NR_futex, since this is used in applications, such applications sta=
rt
>> > -to fail to build for these newer architectures. This patch defines a
>> > -fallback to alias __NR_futex to __NR_futex_tim64 so SYS_futex keeps
>> > -working
>> > -
>> > -Upstream-Status: Pending
>> > -
>> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > ----
>> > - boost/fiber/detail/futex.hpp | 5 +++++
>> > - libs/log/src/event.cpp       | 4 ++++
>> > - 2 files changed, 9 insertions(+)
>> > -
>> > -diff --git a/boost/fiber/detail/futex.hpp b/boost/fiber/detail/futex.=
hpp
>> > -index e64bd5990..16bee64f1 100644
>> > ---- a/boost/fiber/detail/futex.hpp
>> > -+++ b/boost/fiber/detail/futex.hpp
>> > -@@ -17,6 +17,11 @@ extern "C" {
>> > - #include <linux/futex.h>
>> > - #include <sys/syscall.h>
>> > - }
>> > -+
>> > -+#if !defined(SYS_futex) && defined(SYS_futex_time64)
>> > -+#define SYS_futex SYS_futex_time64
>> > -+#endif
>> > -+
>> > - #elif BOOST_OS_WINDOWS
>> > - #include <windows.h>
>> > - #endif
>> > -diff --git a/libs/log/src/event.cpp b/libs/log/src/event.cpp
>> > -index 5485154d7..2c7c0381f 100644
>> > ---- a/libs/log/src/event.cpp
>> > -+++ b/libs/log/src/event.cpp
>> > -@@ -31,6 +31,10 @@
>> > - #include <linux/futex.h>
>> > - #include <boost/memory_order.hpp>
>> > -
>> > -+#if !defined(SYS_futex) && defined(SYS_futex_time64)
>> > -+#define SYS_futex SYS_futex_time64
>> > -+#endif
>> > -+
>> > - // Some Android NDKs (Google NDK and older Crystax.NET NDK versions)=
 don't define SYS_futex
>> > - #if defined(SYS_futex)
>> > - #define BOOST_LOG_SYS_FUTEX SYS_futex
>> > ---
>> > -2.28.0
>> > -
>> > diff --git a/meta/recipes-support/boost/boost/0002-math-allow-definiti=
on-of-boost_math_no_atomic_int-on-the-command-line.patch b/meta/recipes-sup=
port/boost/boost/0002-math-allow-definition-of-boost_math_no_atomic_int-on-=
the-command-line.patch
>> > deleted file mode 100644
>> > index b05b795084..0000000000
>> > --- a/meta/recipes-support/boost/boost/0002-math-allow-definition-of-b=
oost_math_no_atomic_int-on-the-command-line.patch
>> > +++ /dev/null
>> > @@ -1,53 +0,0 @@
>> > -From 32bd6197353f6ea8e5bef01f09e25c944141acfc Mon Sep 17 00:00:00 200=
1
>> > -From: jzmaddock <john@johnmaddock.co.uk>
>> > -Date: Wed, 1 Sep 2021 18:54:54 +0100
>> > -Subject: [PATCH] Allow definition of BOOST_MATH_NO_ATOMIC_INT on the =
command
>> > - line. Allows us to test/emulate platforms with no atomic integers.
>> > -
>> > -[buildroot@heine.tech:
>> > -  - backport from boostorg/math 32bd6197353f6ea8e5bef01f09e25c944141a=
cfc
>> > -  - alter path to match boost release
>> > -]
>> > -Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
>> > ----
>> > -Upstream-Status: Backport [https://github.com/boostorg/math/pull/684/=
commits/32bd6197353f6ea8e5bef01f09e25c944141acfc]
>> > - boost/math/tools/atomic.hpp | 10 +++++-----
>> > - 1 file changed, 5 insertions(+), 5 deletions(-)
>> > -
>> > -diff --git a/boost/math/tools/atomic.hpp b/boost/math/tools/atomic.hp=
p
>> > -index cc76ed269f..e3cbf5db89 100644
>> > ---- a/boost/math/tools/atomic.hpp
>> > -+++ b/boost/math/tools/atomic.hpp
>> > -@@ -16,27 +16,27 @@
>> > - namespace boost {
>> > -    namespace math {
>> > -       namespace detail {
>> > --#if ATOMIC_INT_LOCK_FREE =3D=3D 2
>> > -+#if (ATOMIC_INT_LOCK_FREE =3D=3D 2) && !defined(BOOST_MATH_NO_ATOMIC=
_INT)
>> > -          typedef std::atomic<int> atomic_counter_type;
>> > -          typedef std::atomic<unsigned> atomic_unsigned_type;
>> > -          typedef int atomic_integer_type;
>> > -          typedef unsigned atomic_unsigned_integer_type;
>> > --#elif ATOMIC_SHORT_LOCK_FREE =3D=3D 2
>> > -+#elif (ATOMIC_SHORT_LOCK_FREE =3D=3D 2) && !defined(BOOST_MATH_NO_AT=
OMIC_INT)
>> > -          typedef std::atomic<short> atomic_counter_type;
>> > -          typedef std::atomic<unsigned short> atomic_unsigned_type;
>> > -          typedef short atomic_integer_type;
>> > -          typedef unsigned short atomic_unsigned_type;
>> > --#elif ATOMIC_LONG_LOCK_FREE =3D=3D 2
>> > -+#elif (ATOMIC_LONG_LOCK_FREE =3D=3D 2) && !defined(BOOST_MATH_NO_ATO=
MIC_INT)
>> > -          typedef std::atomic<long> atomic_unsigned_integer_type;
>> > -          typedef std::atomic<unsigned long> atomic_unsigned_type;
>> > -          typedef unsigned long atomic_unsigned_type;
>> > -          typedef long atomic_integer_type;
>> > --#elif ATOMIC_LLONG_LOCK_FREE =3D=3D 2
>> > -+#elif (ATOMIC_LLONG_LOCK_FREE =3D=3D 2) && !defined(BOOST_MATH_NO_AT=
OMIC_INT)
>> > -          typedef std::atomic<long long> atomic_unsigned_integer_type=
;
>> > -          typedef std::atomic<unsigned long long> atomic_unsigned_typ=
e;
>> > -          typedef long long atomic_integer_type;
>> > -          typedef unsigned long long atomic_unsigned_integer_type;
>> > --#else
>> > -+#elif !defined(BOOST_MATH_NO_ATOMIC_INT)
>> > - #  define BOOST_MATH_NO_ATOMIC_INT
>> > - #endif
>> > -       } // Namespace detail
>> > diff --git a/meta/recipes-support/boost/boost/0003-math-make-no-atomic=
s-a-soft-failure-in-bernoulli_details_hpp.patch b/meta/recipes-support/boos=
t/boost/0003-math-make-no-atomics-a-soft-failure-in-bernoulli_details_hpp.p=
atch
>> > deleted file mode 100644
>> > index f69e4f21f3..0000000000
>> > --- a/meta/recipes-support/boost/boost/0003-math-make-no-atomics-a-sof=
t-failure-in-bernoulli_details_hpp.patch
>> > +++ /dev/null
>> > @@ -1,151 +0,0 @@
>> > -From 7d482f6ebc356e6ec455ccb5f51a23971bf6ce5b Mon Sep 17 00:00:00 200=
1
>> > -From: jzmaddock <john@johnmaddock.co.uk>
>> > -Date: Wed, 1 Sep 2021 20:31:53 +0100
>> > -Subject: [PATCH] Make no atomics a soft failure in bernoulli_details.=
hpp.
>> > - Include an "escape macro" so thread safety can be disabled if certai=
n
>> > - bernoulli features are to be used in a no-atomics environment. Fixes
>> > - https://github.com/boostorg/math/issues/673.
>> > -
>> > -[buildroot@heine.tech:
>> > -  - backport from boostorg/math 7d482f6ebc356e6ec455ccb5f51a23971bf6c=
e5b
>> > -  - alter path to match boost release
>> > -]
>> > -Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
>> > ----
>> > -Upstream-Status: Backport [https://github.com/boostorg/math/pull/684/=
commits/7d482f6ebc356e6ec455ccb5f51a23971bf6ce5b]
>> > - .../detail/bernoulli_details.hpp                 | 10 +++++++---
>> > - libs/math/test/Jamfile.v2                        |  3 +++
>> > - test/compile_test/bernoulli_no_atomic_d.cpp      | 14 ++++++++++++++
>> > - test/compile_test/bernoulli_no_atomic_fail.cpp   | 15 ++++++++++++++=
+
>> > - test/compile_test/bernoulli_no_atomic_mp.cpp     | 16 ++++++++++++++=
++
>> > - 5 files changed, 55 insertions(+), 3 deletions(-)
>> > - create mode 100644 test/compile_test/bernoulli_no_atomic_d.cpp
>> > - create mode 100644 test/compile_test/bernoulli_no_atomic_fail.cpp
>> > - create mode 100644 test/compile_test/bernoulli_no_atomic_mp.cpp
>> > -
>> > -diff --git a/boost/math/special_functions/detail/bernoulli_details.hp=
p b/boost/math/special_functions/detail/bernoulli_details.hpp
>> > -index cf35545264..8519b7c89c 100644
>> > ---- a/boost/math/special_functions/detail/bernoulli_details.hpp
>> > -+++ b/boost/math/special_functions/detail/bernoulli_details.hpp
>> > -@@ -360,7 +360,7 @@ class bernoulli_numbers_cache
>> > -          return out;
>> > -       }
>> > -
>> > --      #ifndef BOOST_HAS_THREADS
>> > -+      #if !defined(BOOST_HAS_THREADS) || defined(BOOST_MATH_BERNOULL=
I_UNTHREADED)
>> > -       //
>> > -       // Single threaded code, very simple:
>> > -       //
>> > -@@ -382,6 +382,8 @@ class bernoulli_numbers_cache
>> > -          *out =3D (i >=3D m_overflow_limit) ? policies::raise_overfl=
ow_error<T>("boost::math::bernoulli_b2n<%1%>(std::size_t)", 0, T(i), pol) :=
 bn[i];
>> > -          ++out;
>> > -       }
>> > -+      #elif defined(BOOST_MATH_NO_ATOMIC_INT)
>> > -+      static_assert(sizeof(T) =3D=3D 1, "Unsupported configuration: =
your platform appears to have no atomic integers.  If you are happy with th=
read-unsafe code, then you may define BOOST_MATH_BERNOULLI_UNTHREADED to su=
ppress this error.");
>> > -       #else
>> > -       //
>> > -       // Double-checked locking pattern, lets us access cached alrea=
dy cached values
>> > -@@ -464,7 +466,7 @@ class bernoulli_numbers_cache
>> > -          return out;
>> > -       }
>> > -
>> > --      #ifndef BOOST_HAS_THREADS
>> > -+      #if !defined(BOOST_HAS_THREADS) || defined(BOOST_MATH_BERNOULL=
I_UNTHREADED)
>> > -       //
>> > -       // Single threaded code, very simple:
>> > -       //
>> > -@@ -494,6 +496,8 @@ class bernoulli_numbers_cache
>> > -          }
>> > -          ++out;
>> > -       }
>> > -+      #elif defined(BOOST_MATH_NO_ATOMIC_INT)
>> > -+      static_assert(sizeof(T) =3D=3D 1, "Unsupported configuration: =
your platform appears to have no atomic integers.  If you are happy with th=
read-unsafe code, then you may define BOOST_MATH_BERNOULLI_UNTHREADED to su=
ppress this error.");
>> > -       #else
>> > -       //
>> > -       // Double-checked locking pattern, lets us access cached alrea=
dy cached values
>> > -@@ -555,7 +559,7 @@ class bernoulli_numbers_cache
>> > -    // The value at which we know overflow has already occurred for t=
he Bn:
>> > -    std::size_t m_overflow_limit;
>> > -
>> > --   #ifdef BOOST_HAS_THREADS
>> > -+   #if defined(BOOST_HAS_THREADS) && !defined(BOOST_MATH_NO_ATOMIC_I=
NT)
>> > -    std::mutex m_mutex;
>> > -    atomic_counter_type m_counter, m_current_precision;
>> > -    #else
>> > -diff --git a/libs/math/test/Jamfile.v2 b/libs/math/test/Jamfile.v2
>> > -index 52fb87f5e5..3ac63f9279 100644
>> > ---- a/libs/math/test/Jamfile.v2
>> > -+++ b/libs/math/test/Jamfile.v2
>> > -@@ -1137,6 +1137,9 @@ test-suite misc :
>> > -
>> > - #   [ run __temporary_test.cpp test_instances//test_instances : : : =
<test-info>always_show_run_output <pch>off ]
>> > -    [ compile test_no_long_double_policy.cpp ]
>> > -+   [ compile compile_test/bernoulli_no_atomic_d.cpp ]
>> > -+   [ compile compile_test/bernoulli_no_atomic_mp.cpp ]
>> > -+   [ compile-fail compile_test/bernoulli_no_atomic_fail.cpp ]
>> > - ;
>> > -
>> > - test-suite interpolators :
>> > -diff --git a/test/compile_test/bernoulli_no_atomic_d.cpp b/test/compi=
le_test/bernoulli_no_atomic_d.cpp
>> > -new file mode 100644
>> > -index 0000000000..61926f7e1f
>> > ---- /dev/null
>> > -+++ b/test/compile_test/bernoulli_no_atomic_d.cpp
>> > -@@ -0,0 +1,14 @@
>> > -+//  (C) Copyright John Maddock 2021.
>> > -+//  Use, modification and distribution are subject to the
>> > -+//  Boost Software License, Version 1.0. (See accompanying file
>> > -+//  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
>> > -+
>> > -+#define BOOST_MATH_NO_ATOMIC_INT
>> > -+
>> > -+#include <boost/math/special_functions/bernoulli.hpp>
>> > -+#include "test_compile_result.hpp"
>> > -+
>> > -+void compile_and_link_test()
>> > -+{
>> > -+   check_result<double>(boost::math::bernoulli_b2n<double>(4));
>> > -+}
>> > -diff --git a/test/compile_test/bernoulli_no_atomic_fail.cpp b/test/co=
mpile_test/bernoulli_no_atomic_fail.cpp
>> > -new file mode 100644
>> > -index 0000000000..bbd7152412
>> > ---- /dev/null
>> > -+++ b/test/compile_test/bernoulli_no_atomic_fail.cpp
>> > -@@ -0,0 +1,15 @@
>> > -+//  (C) Copyright John Maddock 2021.
>> > -+//  Use, modification and distribution are subject to the
>> > -+//  Boost Software License, Version 1.0. (See accompanying file
>> > -+//  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
>> > -+
>> > -+#define BOOST_MATH_NO_ATOMIC_INT
>> > -+
>> > -+#include <boost/math/special_functions/bernoulli.hpp>
>> > -+#include <boost/multiprecision/cpp_bin_float.hpp>
>> > -+#include "test_compile_result.hpp"
>> > -+
>> > -+void compile_and_link_test()
>> > -+{
>> > -+   check_result<boost::multiprecision::cpp_bin_float_50>(boost::math=
::bernoulli_b2n<boost::multiprecision::cpp_bin_float_50>(4));
>> > -+}
>> > -diff --git a/test/compile_test/bernoulli_no_atomic_mp.cpp b/test/comp=
ile_test/bernoulli_no_atomic_mp.cpp
>> > -new file mode 100644
>> > -index 0000000000..8d5a6e78e6
>> > ---- /dev/null
>> > -+++ b/test/compile_test/bernoulli_no_atomic_mp.cpp
>> > -@@ -0,0 +1,16 @@
>> > -+//  (C) Copyright John Maddock 2021.
>> > -+//  Use, modification and distribution are subject to the
>> > -+//  Boost Software License, Version 1.0. (See accompanying file
>> > -+//  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
>> > -+
>> > -+#define BOOST_MATH_NO_ATOMIC_INT
>> > -+#define BOOST_MATH_BERNOULLI_UNTHREADED
>> > -+
>> > -+#include <boost/math/special_functions/bernoulli.hpp>
>> > -+#include <boost/multiprecision/cpp_bin_float.hpp>
>> > -+#include "test_compile_result.hpp"
>> > -+
>> > -+void compile_and_link_test()
>> > -+{
>> > -+   check_result<boost::multiprecision::cpp_bin_float_50>(boost::math=
::bernoulli_b2n<boost::multiprecision::cpp_bin_float_50>(4));
>> > -+}
>> > diff --git a/meta/recipes-support/boost/boost/de657e01635306085488290e=
a83de541ec393f8b.patch b/meta/recipes-support/boost/boost/de657e01635306085=
488290ea83de541ec393f8b.patch
>> > new file mode 100644
>> > index 0000000000..867ec03ba6
>> > --- /dev/null
>> > +++ b/meta/recipes-support/boost/boost/de657e01635306085488290ea83de54=
1ec393f8b.patch
>> > @@ -0,0 +1,30 @@
>> > +From de657e01635306085488290ea83de541ec393f8b Mon Sep 17 00:00:00 200=
1
>> > +From: Leonardo Neumann <leonardo@neumann.dev.br>
>> > +Date: Mon, 13 Dec 2021 01:07:20 -0300
>> > +Subject: [PATCH] Fix missing sys/stat.h include on musl-based systems
>> > +
>> > +Boost 1.78.0 fails to build on musl-based systems because musl does
>> > +not include sys/stat.h by default.
>> > +
>> > +Fixes #161 ("Boost compiler error")
>> > +Upstream-Status: Submitted [https://github.com/boostorg/interprocess/=
pull/162]
>> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> > +---
>> > + include/boost/interprocess/permissions.hpp | 4 ++++
>> > + 1 file changed, 4 insertions(+)
>> > +
>> > +diff --git a/boost/interprocess/permissions.hpp b/boost/interprocess/=
permissions.hpp
>> > +index ab55411e..0b21a685 100644
>> > +--- a/boost/interprocess/permissions.hpp
>> > ++++ b/boost/interprocess/permissions.hpp
>> > +@@ -29,6 +29,10 @@
>> > +
>> > + #include <boost/interprocess/detail/win32_api.hpp>
>> > +
>> > ++#else
>> > ++
>> > ++#include <sys/stat.h>
>> > ++
>> > + #endif
>> > +
>> > + #endif   //#ifndef BOOST_INTERPROCESS_DOXYGEN_INVOKED
>> > diff --git a/meta/recipes-support/boost/boost_1.77.0.bb b/meta/recipes=
-support/boost/boost_1.77.0.bb
>> > deleted file mode 100644
>> > index bde6b14a79..0000000000
>> > --- a/meta/recipes-support/boost/boost_1.77.0.bb
>> > +++ /dev/null
>> > @@ -1,12 +0,0 @@
>> > -require boost-${PV}.inc
>> > -require boost.inc
>> > -
>> > -SRC_URI +=3D "file://boost-CVE-2012-2677.patch \
>> > -           file://boost-math-disable-pch-for-gcc.patch \
>> > -           file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-=
that-o.patch \
>> > -           file://0001-dont-setup-compiler-flags-m32-m64.patch \
>> > -           file://0001-fiber-libs-Define-SYS_futex-if-it-does-not-exi=
st.patch \
>> > -           file://0001-BoostConfig.cmake-allow-searching-for-python31=
0.patch \
>> > -           file://0002-math-allow-definition-of-boost_math_no_atomic_=
int-on-the-command-line.patch \
>> > -           file://0003-math-make-no-atomics-a-soft-failure-in-bernoul=
li_details_hpp.patch \
>> > -           "
>> > diff --git a/meta/recipes-support/boost/boost_1.78.0.bb b/meta/recipes=
-support/boost/boost_1.78.0.bb
>> > new file mode 100644
>> > index 0000000000..f4b6ed8576
>> > --- /dev/null
>> > +++ b/meta/recipes-support/boost/boost_1.78.0.bb
>> > @@ -0,0 +1,9 @@
>> > +require boost-${PV}.inc
>> > +require boost.inc
>> > +
>> > +SRC_URI +=3D "file://boost-CVE-2012-2677.patch \
>> > +           file://boost-math-disable-pch-for-gcc.patch \
>> > +           file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-=
that-o.patch \
>> > +           file://0001-dont-setup-compiler-flags-m32-m64.patch \
>> > +           file://de657e01635306085488290ea83de541ec393f8b.patch \
>> > +           "
>> > --
>> > 2.20.1
>> >

