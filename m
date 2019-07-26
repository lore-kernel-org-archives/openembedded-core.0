Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 11F3A7F128
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 10:05:05 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id s7so103499478iob.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 03:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=019dwinaPEsJVv73sA2BtqPjrIhk5cpoyuurv0VKGkY=;
	b=DWQ5vcZxAzGvEc7IOsC6K0pSAiGdGrv4lmjbbISrb+ei+68cYyH+fTgaBi/SjmNUAn
	PecZLKDsbTwrqxqOb8cgwtLB/s/kfLtSSLbErMgLMTWTpqSMA5TXz3QtDj2FnLHnsM8R
	33lZwXCYo61epENGaNYG2QjOwCgn+P4ZfXVNBNG49KrxCeXyzMp64Ns+HVfQnt54DCSH
	9to+Hi38g3kVEc9pNHFqa/F2W9o8t18vfQNIQKAt7Gr2p/fxv2uBKh22QPVgRrwCJMX2
	NT1AhN026j0/AOxiiS9Pd7gPoC4BnAC6HNW7ZLMDKCmW9ybA3zS1e/+cNz0oqs+wXaQD
	KAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=019dwinaPEsJVv73sA2BtqPjrIhk5cpoyuurv0VKGkY=;
	b=cU24VH27QKzclWnC8gW3rJJod6IkU6ESBG1ArBMQ42cTS6KkTRUOWf8w+FurMprOHZ
	BfJsh0mahAIVdk8i3CfqS698QIR6Icfns+hwrvoVkFB7U3bYQKUTPNG4ME6TULSU4szs
	dc5iOXgGtEoTZk2nLH9a43ZysxRBR8iD2sYz0ronqDZsK0IwTcexAWGwaqY7eeYoeI/S
	qAv9S4MvHOlwpOOTVfPEKXnIJPCmW6tuWirchPne2TCdfH9yOXZ6vX8bIcgyNkItAwD6
	QAprYQgFwZzFox2dQ65XGD4e1ArtC0ShApN5vaWHC0gWRtUsOam6eA6p3mNkwf63FgB1
	20xg==
X-Gm-Message-State: APjAAAVv8FPTYl4IMemkXXC0/4HiHa9Jtmg2vlZ3nWoxr1Qw6uHYkXWq
	iVLRRulEw6QtzXXRBxdBPiZKc5XCGWxZd4KOKxvoMA==
X-Google-Smtp-Source: APXvYqwueTJBMCkD2XMNv1UZqSqPcdhCHjW2R1I4Z5MaxMg9siSsTe/oRefLt9hOUOrMV+XP76VbxPxmecaPybrUsj0=
X-Received: by 2002:a02:7303:: with SMTP id y3mr94545747jab.97.1564135506853; 
	Fri, 26 Jul 2019 03:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190724095423.23610-1-ross.burton@intel.com>
	<a416d7c03581b0dbd9b5d91490d690c2a03ac72e.camel@intel.com>
In-Reply-To: <a416d7c03581b0dbd9b5d91490d690c2a03ac72e.camel@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Jul 2019 11:04:55 +0100
Message-ID: <CAJTo0Lbgv7=Vm2bib4FM44mVRidUPEsTao5AB4KWeP=f0_9nXA@mail.gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libical: upgrade to 3.0.5
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
X-List-Received-Date: Fri, 26 Jul 2019 10:05:06 -0000
Content-Type: text/plain; charset="UTF-8"

I wonder how that happened, it must be finding a libdb somewhere...

On Fri, 26 Jul 2019 at 04:32, Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> Hi Ross
>
> This is causing errors:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/869/steps/8/logs/errors
>
> step7b: ERROR: libical-3.0.5-r0 do_package_qa: QA Issue:
> /usr/lib/libicalss.so.3.0.5 contained in package libical requires
> libdb-5.3.so()(64bit), but no providers found in RDEPENDS_libical?
> [file-rdeps]
> step7b: ERROR: libical-3.0.5-r0 do_package_qa: QA run found fatal
> errors. Please consider fixing them.
> step7b: ERROR: libical-3.0.5-r0 do_package_qa:
> step7b: ERROR: libical-3.0.5-r0 do_package_qa: Function failed:
> do_package_qa
> step7b: ERROR: Logfile of failure stored in: /home/pokybuild/yocto-
> worker/qa-extras2/build/build/tmp/work/core2-64-poky-
> linux/libical/3.0.5-r0/temp/log.do_package_qa.40458
>
> Thanks,
>
> Anuj
>
> On Wed, 2019-07-24 at 10:54 +0100, Ross Burton wrote:
> > Note that this upgrade includes some API breakage.
> >
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >  ...ibical.pc.in-fix-iculibs-remove-full.patch | 44 ---------------
> > ----
> >  .../{libical_2.0.0.bb => libical_3.0.5.bb}    | 20 +++++----
> >  2 files changed, 12 insertions(+), 52 deletions(-)
> >  delete mode 100644 meta/recipes-support/libical/libical/0001-
> > CMakeLists.txt-libical.pc.in-fix-iculibs-remove-full.patch
> >  rename meta/recipes-support/libical/{libical_2.0.0.bb =>
> > libical_3.0.5.bb} (53%)
> >
> > diff --git a/meta/recipes-support/libical/libical/0001-
> > CMakeLists.txt-libical.pc.in-fix-iculibs-remove-full.patch
> > b/meta/recipes-support/libical/libical/0001-CMakeLists.txt-
> > libical.pc.in-fix-iculibs-remove-full.patch
> > deleted file mode 100644
> > index 6db75f5086c..00000000000
> > --- a/meta/recipes-support/libical/libical/0001-CMakeLists.txt-
> > libical.pc.in-fix-iculibs-remove-full.patch
> > +++ /dev/null
> > @@ -1,44 +0,0 @@
> > -From 1a41069c0dc054e59cd76fc3d8cf7cc2a78b5e8d Mon Sep 17 00:00:00
> > 2001
> > -From: Allen Winter <allen.winter@kdab.com>
> > -Date: Sat, 3 Sep 2016 16:56:29 -0400
> > -Subject: [PATCH] CMakeLists.txt, libical.pc.in - fix iculibs (remove
> > full path) ISSUE: 227
> > -
> > -Upstream-Status: Backport
> > -
> > -Signed-off-by: Maxin B. John <maxin.john@intel.com>
> > -----
> > -diff -Naur libical-2.0.0-orig/CMakeLists.txt libical-
> > 2.0.0/CMakeLists.txt
> > ---- libical-2.0.0-orig/CMakeLists.txt        2016-09-08
> > 18:05:06.166049345 +0300
> > -+++ libical-2.0.0/CMakeLists.txt     2016-09-08 18:05:45.201561334
> > +0300
> > -@@ -128,6 +128,7 @@
> > - #  RSCALE info at http://tools.ietf.org/html/rfc7529
> > - find_package(ICU)
> > - if(ICU_FOUND)
> > -+  set(ICUUC_LIBS "-licuuc") #for libical.pc
> > -   set(HAVE_LIBICU 1)
> > -   if(ICU_MAJOR_VERSION VERSION_GREATER 50)
> > -     set(HAVE_ICU_DANGI TRUE)
> > -@@ -137,6 +138,7 @@
> > - endif()
> > - if(ICU_I18N_FOUND)
> > -   set(HAVE_LIBICU_I18N 1)
> > -+  set(ICUI18N_LIBS "-licui18n") #for libical.pc
> > - endif()
> > -
> > - # MSVC specific definitions
> > -diff -Naur libical-2.0.0-orig/libical.pc.in libical-
> > 2.0.0/libical.pc.in
> > ---- libical-2.0.0-orig/libical.pc.in 2015-12-28 23:44:53.000000000
> > +0200
> > -+++ libical-2.0.0/libical.pc.in      2016-09-08 18:09:12.991963597
> > +0300
> > -@@ -3,10 +3,10 @@
> > - libdir=@libdir@
> > - includedir=@includedir@
> > - threadslib=@PTHREAD_LIBS@
> > --iculib=@ICU_LIBRARIES@ @ICU_I18N_LIBRARIES@
> > -+iculibs=@ICUUC_LIBS@ @ICUI18N_LIBS@
> > -
> > - Name: libical
> > - Description: An implementation of basic iCAL protocols
> > - Version: @VERSION@
> > --Libs: -L${libdir} -lical -licalss -licalvcal ${threadslib}
> > ${iculib}
> > -+Libs: -L${libdir} -lical -licalss -licalvcal ${threadslib}
> > ${iculibs}
> > - Cflags: -I${includedir}
> > diff --git a/meta/recipes-support/libical/libical_2.0.0.bb
> > b/meta/recipes-support/libical/libical_3.0.5.bb
> > similarity index 53%
> > rename from meta/recipes-support/libical/libical_2.0.0.bb
> > rename to meta/recipes-support/libical/libical_3.0.5.bb
> > index 7dffdcfb013..a4238f22633 100644
> > --- a/meta/recipes-support/libical/libical_2.0.0.bb
> > +++ b/meta/recipes-support/libical/libical_3.0.5.bb
> > @@ -1,18 +1,18 @@
> >  SUMMARY = "iCal and scheduling (RFC 2445, 2446, 2447) library"
> >  HOMEPAGE = "https://github.com/libical/libical"
> >  BUGTRACKER = "https://github.com/libical/libical/issues"
> > -LICENSE = "LGPLv2.1 | MPL-1.0"
> > -LIC_FILES_CHKSUM =
> > "file://COPYING;md5=d4fc58309d8ed46587ac63bb449d82f8 \
> > -                    file://LICENSE;md5=d1a0891cd3e582b3e2ec8fe63badb
> > bb6"
> > +LICENSE = "LGPLv2.1 | MPL-2.0"
> > +LIC_FILES_CHKSUM =
> > "file://LICENSE;md5=1910a2a76ddf6a9ba369182494170d87 \
> > +                    file://LICENSE.LGPL21.txt;md5=933adb561f159e7c3d
> > a079536f0ed871 \
> > +                    file://LICENSE.MPL2.txt;md5=9741c346eef56131163e
> > 13b9db1241b3"
> >  SECTION = "libs"
> >
> > -SRC_URI = "
> > https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz
> > \
> > -           file://0001-CMakeLists.txt-libical.pc.in-fix-iculibs-
> > remove-full.patch \
> > -           "
> > +SRC_URI = "
> > https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz
> > "
> > +
> >  DEPENDS = "icu"
> >
> > -SRC_URI[md5sum] = "6bf8e5f5a3ba88baf390d0134e05d76e"
> > -SRC_URI[sha256sum] =
> > "654c11f759c19237be39f6ad401d917e5a05f36f1736385ed958e60cf21456da"
> > +SRC_URI[md5sum] = "9be4e8a1739a9c27e06aa8ce66b8cb34"
> > +SRC_URI[sha256sum] =
> > "7ad550c8c49c9b9983658e3ab3e68b1eee2439ec17b169a6b1e6ecb5274e78e6"
> >  UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
> >
> >  inherit cmake pkgconfig
> > @@ -20,6 +20,10 @@ inherit cmake pkgconfig
> >  # No need to use perl-native, the host perl is sufficient.
> >  EXTRA_OECMAKE += "-DPERL_EXECUTABLE=${HOSTTOOLS_DIR}/perl"
> >
> > +# The glib library can't be cross-compiled, disable for now.
> > +# https://github.com/libical/libical/issues/394
> > +EXTRA_OECMAKE += "-DICAL_GLIB=false"
> > +
> >  do_install_append_class-target () {
> >      # Remove build host references
> >      sed -i \
> > --
> > 2.20.1
> >

