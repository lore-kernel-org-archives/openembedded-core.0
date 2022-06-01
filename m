Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F3CC433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 10:10:25 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.5694.1654078218608569451
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 03:10:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NGyd9Jep;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id
 n124-20020a1c2782000000b003972dfca96cso778805wmn.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 03:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+L+y0LZIjlvnWaWogtZV7tfzifWNuagJ+NExFIE3y/0=;
        b=NGyd9JepUr157Jy9o4CvwydkQoqPQHgk+cSL7Zf7Acx0yehtwAzbLpNqzYE7jUcIYy
         YWC54MElk4HSCa9Rpef0deXQJEjN78AaxikuQSgV9Qln2JB4NiZ9FJD3BoF+t6NdJuIN
         3T1rn5amndhk/dT95LGHtyp2twkJdBwIPYQFGyEBRVwSaEjJ7xbGAagmvyZTrDioIfYI
         hTHbCiOQoq6JfoJT1KxIGfGV3V97wWSsozjHKf/oQfhrniH00Jc9x1ODkX9yABmY/rgI
         wwn/Vn1mQaWiJ+GGwyuqcgdAO4ZW/tIzFVuLL3Cu25a8DtWTTHgh3rhK9ctvLA78znhN
         +MhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+L+y0LZIjlvnWaWogtZV7tfzifWNuagJ+NExFIE3y/0=;
        b=K5+JJO5tSoYgaaibp6WtCT57eOJsWxoYNwTrFnaTm1zYNsb40lP/Cz/t+wOas7jipw
         QorZt49Q6OyBKeygF1C2r1mg9ATbIgJQQ7DzAqy3naSkKS1cq3pJIKFKKrBc59W36i1X
         Gc3jjElaa3q/6tkzp3g2n3cBQWIP9hEK2zPnXXFXS41LIdDsJtcSJQZFKTi2XhKW2BwO
         oXUJnRvcIDRR/lg8anh2fmUv3JSLCVczu4jr9pNItzAnzAUX1E93PJ/0QTITU3ytOCRL
         4P0o58Xr2+j/zkn9yZHIFh8Swiwnt65B7Z1R3QYqOXuNdgNIEhdOgK11KwLDAi61ZRlb
         92Vg==
X-Gm-Message-State: AOAM533SgFf8rNjdX/q4plPCcVgV2GVx7ibVUac27YIBny31YnQCjSw5
	K5O5aCgXYFuT007vWlLotrWBOIBWpD/gODBgNkk=
X-Google-Smtp-Source: 
 ABdhPJzpCSlUkLWcuMxiQng2ZNQED7jTkwp/jl0Ws3YQtHxXHG/7z6aSqilIxlw0LfzCPaBAaY0yOgKOzrzD3Y6qnB4=
X-Received: by 2002:a1c:721a:0:b0:397:5697:5351 with SMTP id
 n26-20020a1c721a000000b0039756975351mr27761749wmc.2.1654078216262; Wed, 01
 Jun 2022 03:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220525184852.3999906-1-Martin.Jansa@gmail.com>
 <CAOSpxdY=WZZfZNAEYQRyVG_jmE0=0_6xAH9fDCALMDjm=K9k6g@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdY=WZZfZNAEYQRyVG_jmE0=0_6xAH9fDCALMDjm=K9k6g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 1 Jun 2022 12:09:42 +0200
Message-ID: 
 <CA+chaQfSE-oiUxdSJxqCT-GjUP_KGA4dOvcD49xPqwez=ohhFg@mail.gmail.com>
Subject: Re: [kirkstone][PATCH 1/2] gcc: Upgrade to 11.3 release
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000082d81805e0601872"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 10:10:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166370

--00000000000082d81805e0601872
Content-Type: text/plain; charset="UTF-8"

As discussed on IRC yesterday I've tried to reproduce this failure locally
and it works fine with poky master cee443ae75f (last commit in master
before the upgrade to 12.1)
2022-06-01 09:46:37,051 - oe-selftest - INFO - RESULTS -
reproducible.ReproducibleTests.test_reproducible_builds: PASSED (6429.19s)
and now it passed with kirkstone as well:

poky $ git cherry-pick 44a36caa7c2
Auto-merging meta/conf/distro/include/maintainers.inc
[jansa/kirkstone-gcc-11.3 5c6e280eed5] gcc: Upgrade to 11.3 release
...
poky $ oe-selftest -r reproducible 2>&1 | tee
log.oe-selftest.reproducible.kirkstone
2022-06-01 09:51:31,653 - oe-selftest - INFO - Changing cwd to
/OE/build/poky/build
2022-06-01 09:51:31,653 - oe-selftest - INFO - Adding layer libraries:
2022-06-01 09:51:31,653 - oe-selftest - INFO -  /OE/build/poky/meta-poky/lib
2022-06-01 09:51:31,653 - oe-selftest - INFO -  /OE/build/poky/meta/lib
2022-06-01 09:51:31,654 - oe-selftest - INFO -
 /OE/build/poky/meta-yocto-bsp/lib
2022-06-01 09:51:31,654 - oe-selftest - INFO -
 /OE/build/poky/meta-selftest/lib
2022-06-01 09:51:31,655 - oe-selftest - INFO - Running bitbake -e to test
the configuration is valid/parsable
hint: Using 'master' as the name for the initial branch. This default
branch name
hint: is subject to change. To configure the initial branch name to use in
all
hint: of your new repositories, which will suppress this warning, call:
hint:
hint:   git config --global init.defaultBranch <name>
hint:
hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
hint: 'development'. The just-created branch can be renamed via this
command:
hint:
hint:   git branch -m <name>
2022-06-01 09:51:37,091 - oe-selftest - INFO - Adding: "include
selftest.inc" in /OE/build/poky/build-st/conf/local.conf
2022-06-01 09:51:37,091 - oe-selftest - INFO - Adding: "include
bblayers.inc" in bblayers.conf
2022-06-01 09:51:37,092 - oe-selftest - INFO - test_diffoscope
(reproducible.DiffoscopeTests)
2022-06-01 10:08:42,982 - oe-selftest - INFO -  ... ok
2022-06-01 10:08:42,983 - oe-selftest - INFO - test_reproducible_builds
(reproducible.ReproducibleTests)
2022-06-01 10:09:56,114 - oe-selftest - INFO - Building reproducibleA
(sstate allowed)...
^Ap2022-06-01 11:11:09,785 - oe-selftest - INFO - Building reproducibleB
(sstate NOT allowed)...
2022-06-01 11:55:00,507 - oe-selftest - INFO - Checking deb packages for
differences...
2022-06-01 11:55:00,946 - oe-selftest - INFO - Reproducibility summary for
deb: same=139 different=0 different_excluded=0 missing=0 total=139
unused_exclusions=[]
2022-06-01 11:55:00,946 - oe-selftest - INFO - Checking ipk packages for
differences...
2022-06-01 11:55:01,330 - oe-selftest - INFO - Reproducibility summary for
ipk: same=139 different=0 different_excluded=0 missing=0 total=139
unused_exclusions=[]
2022-06-01 11:55:01,331 - oe-selftest - INFO - Checking rpm packages for
differences...
2022-06-01 11:55:01,760 - oe-selftest - INFO - Reproducibility summary for
rpm: same=139 different=0 different_excluded=0 missing=0 total=139
unused_exclusions=[]
2022-06-01 11:55:01,760 - oe-selftest - INFO -  ... ok
2022-06-01 11:56:29,573 - oe-selftest - INFO -
----------------------------------------------------------------------
2022-06-01 11:56:29,573 - oe-selftest - INFO - Ran 2 tests in 7495.224s
2022-06-01 11:56:29,573 - oe-selftest - INFO - OK
2022-06-01 11:56:31,723 - oe-selftest - INFO - RESULTS:
2022-06-01 11:56:31,724 - oe-selftest - INFO - RESULTS -
reproducible.DiffoscopeTests.test_diffoscope: PASSED (1025.89s)
2022-06-01 11:56:31,724 - oe-selftest - INFO - RESULTS -
reproducible.ReproducibleTests.test_reproducible_builds: PASSED (6378.78s)
2022-06-01 11:56:31,881 - oe-selftest - INFO - SUMMARY:
2022-06-01 11:56:31,881 - oe-selftest - INFO - oe-selftest () - Ran 2 tests
in 7495.225s
2022-06-01 11:56:31,881 - oe-selftest - INFO - oe-selftest - OK - All
required tests passed (successes=2, skipped=0, failures=0, errors=0)

Is it possible that the reproducibility failure was caused by something
else included in your run on autobuilder?

Cheers,

On Mon, May 30, 2022 at 1:42 AM Steve Sakoman <steve@sakoman.com> wrote:

> On Wed, May 25, 2022 at 8:49 AM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> > From: Khem Raj <raj.khem@gmail.com>
> >
> > This is a bugfix release on gcc-11 series, fixes 189 bugs [1]
> > Drop backported patches already included in 11.3 release
>
> This is causing a reproducibility error in my autobuilder testing for
> webkit-gtk.  I've tried multiple builds with and without the patch and
> the failure is repeatable.
>
> Sadly diffoscope blows up due to the size of webkit-gtk, so it isn't
> easy to see exactly what differs. I've downloaded the a and b build
> artifacts to my local machine and have determined that the webkit-gtk
> .so file is what differs.
>
> Initial investigation with objdump seems to indicate the issue is in
> one or more of the .debug_* sections of the .so
>
> I'll dig in a bit further on Tuesday (it's a long holiday weekend here
> in the US) and will let you know what I find.
>
> Steve
>
>
> > [1]
> https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=11.3
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/conf/distro/include/maintainers.inc      |   2 +-
> >  .../gcc/{gcc-11.2.inc => gcc-11.3.inc}        |  66 ++--
> >  ...ian_11.2.bb => gcc-cross-canadian_11.3.bb} |   0
> >  .../{gcc-cross_11.2.bb => gcc-cross_11.3.bb}  |   0
> >  ...-crosssdk_11.2.bb => gcc-crosssdk_11.3.bb} |   0
> >  ...cc-runtime_11.2.bb => gcc-runtime_11.3.bb} |   0
> >  ...itizers_11.2.bb => gcc-sanitizers_11.3.bb} |   0
> >  ...{gcc-source_11.2.bb => gcc-source_11.3.bb} |   0
> >  .../gcc/gcc/0001-CVE-2021-35465.patch         | 138 --------
> >  ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |  10 +-
> >  .../gcc/gcc/0002-CVE-2021-35465.patch         |  39 ---
> >  .../0002-gcc-poison-system-directories.patch  |  26 +-
> >  ....patch => 0003-64-bit-multilib-hack.patch} |   2 +-
> >  .../gcc/gcc/0003-CVE-2021-35465.patch         | 103 ------
> >  .../gcc/gcc/0004-CVE-2021-35465.patch         | 304 ------------------
> >  ...s.h-in-B-instead-of-S-and-t-oe-in-B.patch} |  12 +-
> >  .../gcc/gcc/0005-cpp-honor-sysroot.patch      |  53 +++
> >  ...MIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch} | 101 +++---
> >  ...gcc-Fix-argument-list-too-long-error.patch |  42 +++
> >  ...{0014-libtool.patch => 0008-libtool.patch} |   2 +-
> >  .../gcc/gcc/0009-cpp-honor-sysroot.patch      |  59 ----
> >  ...-fix-v4bx-to-linker-to-support-EABI.patch} |   2 +-
> >  ...config-files-from-B-instead-of-usin.patch} |  14 +-
> >  ...r-from-.la-which-usually-points-to-.patch} |   2 +-
> >  ...-target-gcc-headers-can-be-included.patch} |   6 +-
> >  ...gcc-Fix-argument-list-too-long-error.patch |  38 ---
> >  ...-directory-during-relink-if-inst_pr.patch} |   2 +-
> >  ...fix-libcc1-s-install-path-and-rpath.patch} |   8 +-
> >  ...e-build-CPP-CPPFLAGS-is-used-for-bu.patch} |  89 ++---
> >  ...ins-something-unsupported-by-the-bu.patch} |  39 +--
> >  ...e-sysroot-support-for-nativesdk-gcc.patch} |  14 +-
> >  ...root-gcc-version-specific-dirs-with.patch} |   8 +-
> >  ...019-nios2-Define-MUSL_DYNAMIC_LINKER.patch |  25 ++
> >  ...-to-link-commandline-for-musl-targe.patch} |  10 +-
> >  ...sing-LDFLAGS-not-just-SHLIB_LDFLAGS.patch} |   2 +-
> >  ...=> 0022-sync-gcc-stddef.h-with-musl.patch} |   2 +-
> >  ...e-introduce-spe-commandline-options.patch} |   4 +-
> >  ...s-for-__cpu_indicator_init-instead-.patch} |   6 +-
> >  ...-Do-not-use-__LINE__-for-maintainin.patch} |   4 +-
> >  ...gw32-Enable-operation_not_supported.patch} |   2 +-
> >  ...mic-Do-not-enforce-march-on-aarch64.patch} |  10 +-
> >  ...027-nios2-Define-MUSL_DYNAMIC_LINKER.patch |  31 --
> >  ...y-debug-prefix-maps-before-checksum.patch} |  24 +-
> >  ... 0029-Fix-install-path-of-linux64.h.patch} |  10 +-
> >  .../gcc/0042-Fix-thread-stack-size-init.patch |  23 --
> >  .../gcc/{gcc_11.2.bb => gcc_11.3.bb}          |   0
> >  ...initial_11.2.bb => libgcc-initial_11.3.bb} |   0
> >  .../gcc/{libgcc_11.2.bb => libgcc_11.3.bb}    |   0
> >  ...ibgfortran_11.2.bb => libgfortran_11.3.bb} |   0
> >  49 files changed, 372 insertions(+), 962 deletions(-)
> >  rename meta/recipes-devtools/gcc/{gcc-11.2.inc => gcc-11.3.inc} (58%)
> >  rename meta/recipes-devtools/gcc/{gcc-cross-canadian_11.2.bb =>
> gcc-cross-canadian_11.3.bb} (100%)
> >  rename meta/recipes-devtools/gcc/{gcc-cross_11.2.bb =>
> gcc-cross_11.3.bb} (100%)
> >  rename meta/recipes-devtools/gcc/{gcc-crosssdk_11.2.bb =>
> gcc-crosssdk_11.3.bb} (100%)
> >  rename meta/recipes-devtools/gcc/{gcc-runtime_11.2.bb =>
> gcc-runtime_11.3.bb} (100%)
> >  rename meta/recipes-devtools/gcc/{gcc-sanitizers_11.2.bb =>
> gcc-sanitizers_11.3.bb} (100%)
> >  rename meta/recipes-devtools/gcc/{gcc-source_11.2.bb =>
> gcc-source_11.3.bb} (100%)
> >  delete mode 100644
> meta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.patch
> >  delete mode 100644
> meta/recipes-devtools/gcc/gcc/0002-CVE-2021-35465.patch
> >  rename meta/recipes-devtools/gcc/gcc/{0004-64-bit-multilib-hack.patch
> => 0003-64-bit-multilib-hack.patch} (99%)
> >  delete mode 100644
> meta/recipes-devtools/gcc/gcc/0003-CVE-2021-35465.patch
> >  delete mode 100644
> meta/recipes-devtools/gcc/gcc/0004-CVE-2021-35465.patch
> >  rename
> meta/recipes-devtools/gcc/gcc/{0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> => 0004-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch} (91%)
> >  create mode 100644
> meta/recipes-devtools/gcc/gcc/0005-cpp-honor-sysroot.patch
> >  rename
> meta/recipes-devtools/gcc/gcc/{0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> => 0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch} (81%)
> >  create mode 100644
> meta/recipes-devtools/gcc/gcc/0007-gcc-Fix-argument-list-too-long-error.patch
> >  rename meta/recipes-devtools/gcc/gcc/{0014-libtool.patch =>
> 0008-libtool.patch} (94%)
> >  delete mode 100644
> meta/recipes-devtools/gcc/gcc/0009-cpp-honor-sysroot.patch
> >  rename
> meta/recipes-devtools/gcc/gcc/{0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> => 0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch} (95%)
> >  rename
> meta/recipes-devtools/gcc/gcc/{0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
> => 0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch} (89%)
> >  rename
> meta/recipes-devtools/gcc/gcc/{0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
> => 0011-Avoid-using-libdir-from-.la-which-usually-points-to-.patch} (92%)
> >  rename
> meta/recipes-devtools/gcc/gcc/{0019-Ensure-target-gcc-headers-can-be-included.patch
> => 0012-Ensure-target-gcc-headers-can-be-included.patch} (96%)
> >  delete mode 100644
> meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch
> >  rename
> meta/recipes-devtools/gcc/gcc/{0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch
> => 0013-Don-t-search-host-directory-during-relink-if-inst_pr.patch} (93%)
> >  rename
> meta/recipes-devtools/gcc/gcc/{0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch
> => 0014-libcc1-fix-libcc1-s-install-path-and-rpath.patch} (90%)
> >  rename meta/recipes-devtools/gcc/gcc/{0018-export-CPP.patch =>
> 0015-Makefile.in-Ensure-build-CPP-CPPFLAGS-is-used-for-bu.patch} (79%)
> >  rename
> meta/recipes-devtools/gcc/gcc/{0006-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch
> => 0016-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch} (68%)
> >  rename
> meta/recipes-devtools/gcc/gcc/{0024-handle-sysroot-support-for-nativesdk-gcc.patch
> => 0017-handle-sysroot-support-for-nativesdk-gcc.patch} (98%)
> >  rename
> meta/recipes-devtools/gcc/gcc/{0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
> => 0018-Search-target-sysroot-gcc-version-specific-dirs-with.patch} (92%)
> >  create mode 100644
> meta/recipes-devtools/gcc/gcc/0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch
> >  rename
> meta/recipes-devtools/gcc/gcc/{0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
> => 0020-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch} (84%)
> >  rename
> meta/recipes-devtools/gcc/gcc/{0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> => 0021-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch} (93%)
> >  rename
> meta/recipes-devtools/gcc/gcc/{0030-sync-gcc-stddef.h-with-musl.patch =>
> 0022-sync-gcc-stddef.h-with-musl.patch} (97%)
> >  rename
> meta/recipes-devtools/gcc/gcc/{0033-Re-introduce-spe-commandline-options.patch
> => 0023-Re-introduce-spe-commandline-options.patch} (90%)
> >  rename
> meta/recipes-devtools/gcc/gcc/{0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
> => 0024-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch} (94%)
> >  rename
> meta/recipes-devtools/gcc/gcc/{0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
> => 0025-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch} (98%)
> >  rename
> meta/recipes-devtools/gcc/gcc/{0036-mingw32-Enable-operation_not_supported.patch
> => 0026-mingw32-Enable-operation_not_supported.patch} (93%)
> >  rename
> meta/recipes-devtools/gcc/gcc/{0037-libatomic-Do-not-enforce-march-on-aarch64.patch
> => 0027-libatomic-Do-not-enforce-march-on-aarch64.patch} (85%)
> >  delete mode 100644
> meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
> >  rename
> meta/recipes-devtools/gcc/gcc/{0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch
> => 0028-debug-101473-apply-debug-prefix-maps-before-checksum.patch} (81%)
> >  rename
> meta/recipes-devtools/gcc/gcc/{0001-Fix-install-path-of-linux64.h.patch =>
> 0029-Fix-install-path-of-linux64.h.patch} (81%)
> >  delete mode 100644
> meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.patch
> >  rename meta/recipes-devtools/gcc/{gcc_11.2.bb => gcc_11.3.bb} (100%)
> >  rename meta/recipes-devtools/gcc/{libgcc-initial_11.2.bb =>
> libgcc-initial_11.3.bb} (100%)
> >  rename meta/recipes-devtools/gcc/{libgcc_11.2.bb => libgcc_11.3.bb}
> (100%)
> >  rename meta/recipes-devtools/gcc/{libgfortran_11.2.bb =>
> libgfortran_11.3.bb} (100%)
> >
> > diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> > index 2c5e730827..0a1897fc92 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -189,7 +189,7 @@
> RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem
> Raj <r
> >  RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} = "Khem Raj <
> raj.khem@gmail.com>"
> >  RECIPE_MAINTAINER:pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
> >  RECIPE_MAINTAINER:pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
> > -RECIPE_MAINTAINER:pn-gcc-source-11.2.0 = "Khem Raj <raj.khem@gmail.com
> >"
> > +RECIPE_MAINTAINER:pn-gcc-source-11.3.0 = "Khem Raj <raj.khem@gmail.com
> >"
> >  RECIPE_MAINTAINER:pn-gconf = "Ross Burton <ross.burton@arm.com>"
> >  RECIPE_MAINTAINER:pn-gcr = "Alexander Kanavin <alex.kanavin@gmail.com>"
> >  RECIPE_MAINTAINER:pn-gdb = "Khem Raj <raj.khem@gmail.com>"
> > diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc
> b/meta/recipes-devtools/gcc/gcc-11.3.inc
> > similarity index 58%
> > rename from meta/recipes-devtools/gcc/gcc-11.2.inc
> > rename to meta/recipes-devtools/gcc/gcc-11.3.inc
> > index 68e0d203fc..b1ef9d25af 100644
> > --- a/meta/recipes-devtools/gcc/gcc-11.2.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-11.3.inc
> > @@ -2,11 +2,11 @@ require gcc-common.inc
> >
> >  # Third digit in PV should be incremented after a minor release
> >
> > -PV = "11.2.0"
> > +PV = "11.3.0"
> >
> >  # BINV should be incremented to a revision after a minor gcc release
> >
> > -BINV = "11.2.0"
> > +BINV = "11.3.0"
> >
> >  FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
> >
> > @@ -32,45 +32,41 @@ SRC_URI = "\
> >             ${BASEURI} \
> >             file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
> >             file://0002-gcc-poison-system-directories.patch \
> > -           file://0004-64-bit-multilib-hack.patch \
> > -
>  file://0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch \
> > -           file://0009-cpp-honor-sysroot.patch \
> > -
>  file://0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch \
> > -           file://0012-gcc-Fix-argument-list-too-long-error.patch \
> > -           file://0014-libtool.patch \
> > -
>  file://0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch \
> > -
>  file://0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
> > -
>  file://0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch \
> > -           file://0018-export-CPP.patch \
> > -           file://0019-Ensure-target-gcc-headers-can-be-included.patch \
> > -
>  file://0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch \
> > -           file://0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch
> \
> > -           file://0024-handle-sysroot-support-for-nativesdk-gcc.patch \
> > -
>  file://0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch \
> > -           file://0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
> > -
>  file://0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch \
> > -
>  file://0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
> > -           file://0030-sync-gcc-stddef.h-with-musl.patch \
> > -           file://0033-Re-introduce-spe-commandline-options.patch \
> > -
>  file://0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
> > -
>  file://0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
> > -           file://0036-mingw32-Enable-operation_not_supported.patch \
> > -           file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
> > -
>  file://0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch \
> > -
>  file://0006-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch \
> > -           file://0001-Fix-install-path-of-linux64.h.patch \
> > -           file://0001-CVE-2021-35465.patch \
> > -           file://0002-CVE-2021-35465.patch \
> > -           file://0003-CVE-2021-35465.patch \
> > -           file://0004-CVE-2021-35465.patch \
> > +           file://0003-64-bit-multilib-hack.patch \
> > +
>  file://0004-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch \
> > +           file://0005-cpp-honor-sysroot.patch \
> > +
>  file://0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch \
> > +           file://0007-gcc-Fix-argument-list-too-long-error.patch \
> > +           file://0008-libtool.patch \
> > +
>  file://0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch \
> > +
>  file://0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
> > +
>  file://0011-Avoid-using-libdir-from-.la-which-usually-points-to-.patch \
> > +           file://0012-Ensure-target-gcc-headers-can-be-included.patch \
> > +
>  file://0013-Don-t-search-host-directory-during-relink-if-inst_pr.patch \
> > +           file://0014-libcc1-fix-libcc1-s-install-path-and-rpath.patch
> \
> > +
>  file://0015-Makefile.in-Ensure-build-CPP-CPPFLAGS-is-used-for-bu.patch \
> > +
>  file://0016-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch \
> > +           file://0017-handle-sysroot-support-for-nativesdk-gcc.patch \
> > +
>  file://0018-Search-target-sysroot-gcc-version-specific-dirs-with.patch \
> > +           file://0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
> > +
>  file://0020-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch \
> > +
>  file://0021-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
> > +           file://0022-sync-gcc-stddef.h-with-musl.patch \
> > +           file://0023-Re-introduce-spe-commandline-options.patch \
> > +
>  file://0024-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
> > +
>  file://0025-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
> > +           file://0026-mingw32-Enable-operation_not_supported.patch \
> > +           file://0027-libatomic-Do-not-enforce-march-on-aarch64.patch \
> > +
>  file://0028-debug-101473-apply-debug-prefix-maps-before-checksum.patch \
> > +           file://0029-Fix-install-path-of-linux64.h.patch \
> > +           \
> >             file://0001-CVE-2021-42574.patch \
> >             file://0002-CVE-2021-42574.patch \
> >             file://0003-CVE-2021-42574.patch \
> >             file://0004-CVE-2021-42574.patch \
> >             file://0001-CVE-2021-46195.patch \
> > -           file://0042-Fix-thread-stack-size-init.patch \
> >  "
> > -SRC_URI[sha256sum] =
> "d08edc536b54c372a1010ff6619dd274c0f1603aa49212ba20f7aa2cda36fa8b"
> > +SRC_URI[sha256sum] =
> "b47cf2818691f5b1e21df2bb38c795fac2cfbd640ede2d0a5e1c89e338a3ac39"
> >
> >  S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_11.2.bb
> b/meta/recipes-devtools/gcc/gcc-cross-canadian_11.3.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/gcc/gcc-cross-canadian_11.2.bb
> > rename to meta/recipes-devtools/gcc/gcc-cross-canadian_11.3.bb
> > diff --git a/meta/recipes-devtools/gcc/gcc-cross_11.2.bb
> b/meta/recipes-devtools/gcc/gcc-cross_11.3.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/gcc/gcc-cross_11.2.bb
> > rename to meta/recipes-devtools/gcc/gcc-cross_11.3.bb
> > diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_11.2.bb
> b/meta/recipes-devtools/gcc/gcc-crosssdk_11.3.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/gcc/gcc-crosssdk_11.2.bb
> > rename to meta/recipes-devtools/gcc/gcc-crosssdk_11.3.bb
> > diff --git a/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb
> b/meta/recipes-devtools/gcc/gcc-runtime_11.3.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/gcc/gcc-runtime_11.2.bb
> > rename to meta/recipes-devtools/gcc/gcc-runtime_11.3.bb
> > diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_11.2.bb
> b/meta/recipes-devtools/gcc/gcc-sanitizers_11.3.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/gcc/gcc-sanitizers_11.2.bb
> > rename to meta/recipes-devtools/gcc/gcc-sanitizers_11.3.bb
> > diff --git a/meta/recipes-devtools/gcc/gcc-source_11.2.bb
> b/meta/recipes-devtools/gcc/gcc-source_11.3.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/gcc/gcc-source_11.2.bb
> > rename to meta/recipes-devtools/gcc/gcc-source_11.3.bb
> > diff --git a/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.patch
> b/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.patch
> > deleted file mode 100644
> > index e4aee10e37..0000000000
> > --- a/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.patch
> > +++ /dev/null
> > @@ -1,138 +0,0 @@
> > -From 3929bca9ca95de9d35e82ae8828b188029e3eb70 Mon Sep 17 00:00:00 2001
> > -From: Richard Earnshaw <rearnsha@arm.com>
> > -Date: Fri, 11 Jun 2021 16:02:05 +0100
> > -Subject: [PATCH] arm: Add command-line option for enabling
> CVE-2021-35465
> > - mitigation [PR102035]
> > -
> > -Add a new option, -mfix-cmse-cve-2021-35465 and document it.  Enable it
> > -automatically for cortex-m33, cortex-m35p and cortex-m55.
> > -
> > -gcc:
> > -       PR target/102035
> > -       * config/arm/arm.opt (mfix-cmse-cve-2021-35465): New option.
> > -       * doc/invoke.texi (Arm Options): Document it.
> > -       * config/arm/arm-cpus.in (quirk_vlldm): New feature bit.
> > -       (ALL_QUIRKS): Add quirk_vlldm.
> > -       (cortex-m33): Add quirk_vlldm.
> > -       (cortex-m35p, cortex-m55): Likewise.
> > -       * config/arm/arm.c (arm_option_override): Enable fix_vlldm if
> > -       targetting an affected CPU and not explicitly controlled on
> > -       the command line.
> > -
> > -CVE: CVE-2021-35465
> > -Upstream-Status: Backport [
> https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=3929bca9ca95de9d35e82ae8828b188029e3eb70
> ]
> > -Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> > -
> > ----
> > - gcc/config/arm/arm-cpus.in | 9 +++++++--
> > - gcc/config/arm/arm.c       | 9 +++++++++
> > - gcc/config/arm/arm.opt     | 4 ++++
> > - gcc/doc/invoke.texi        | 9 +++++++++
> > - 4 files changed, 29 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/gcc/config/arm/arm.c b/gcc/config/arm/arm.c
> > ---- a/gcc/config/arm/arm.c     2021-11-15 02:13:11.100579812 -0800
> > -+++ b/gcc/config/arm/arm.c     2021-11-15 02:17:36.988237692 -0800
> > -@@ -3610,6 +3610,15 @@ arm_option_override (void)
> > -       fix_cm3_ldrd = 0;
> > -     }
> > -
> > -+  /* Enable fix_vlldm by default if required.  */
> > -+  if (fix_vlldm == 2)
> > -+    {
> > -+      if (bitmap_bit_p (arm_active_target.isa, isa_bit_quirk_vlldm))
> > -+      fix_vlldm = 1;
> > -+      else
> > -+      fix_vlldm = 0;
> > -+    }
> > -+
> > -   /* Hot/Cold partitioning is not currently supported, since we can't
> > -      handle literal pool placement in that case.  */
> > -   if (flag_reorder_blocks_and_partition)
> > -diff --git a/gcc/config/arm/arm-cpus.in b/gcc/config/arm/arm-cpus.in
> > ---- a/gcc/config/arm/arm-cpus.in       2021-11-15 02:13:11.104579747
> -0800
> > -+++ b/gcc/config/arm/arm-cpus.in       2021-11-15 02:17:36.984237757
> -0800
> > -@@ -186,6 +186,9 @@ define feature quirk_armv6kz
> > - # Cortex-M3 LDRD quirk.
> > - define feature quirk_cm3_ldrd
> > -
> > -+# v8-m/v8.1-m VLLDM errata.
> > -+define feature quirk_vlldm
> > -+
> > - # Don't use .cpu assembly directive
> > - define feature quirk_no_asmcpu
> > -
> > -@@ -322,7 +325,7 @@ define implied vfp_base MVE MVE_FP ALL_F
> > - # architectures.
> > - # xscale isn't really a 'quirk', but it isn't an architecture either
> and we
> > - # need to ignore it for matching purposes.
> > --define fgroup ALL_QUIRKS   quirk_no_volatile_ce quirk_armv6kz
> quirk_cm3_ldrd xscale quirk_no_asmcpu
> > -+define fgroup ALL_QUIRKS   quirk_no_volatile_ce quirk_armv6kz
> quirk_cm3_ldrd quirk_vlldm xscale quirk_no_asmcpu
> > -
> > - define fgroup IGNORE_FOR_MULTILIB cdecp0 cdecp1 cdecp2 cdecp3 cdecp4
> cdecp5 cdecp6 cdecp7
> > -
> > -@@ -1570,6 +1573,7 @@ begin cpu cortex-m33
> > -  architecture armv8-m.main+dsp+fp
> > -  option nofp remove ALL_FP
> > -  option nodsp remove armv7em
> > -+ isa quirk_vlldm
> > -  costs v7m
> > - end cpu cortex-m33
> > -
> > -@@ -1579,6 +1583,7 @@ begin cpu cortex-m35p
> > -  architecture armv8-m.main+dsp+fp
> > -  option nofp remove ALL_FP
> > -  option nodsp remove armv7em
> > -+ isa quirk_vlldm
> > -  costs v7m
> > - end cpu cortex-m35p
> > -
> > -@@ -1590,7 +1595,7 @@ begin cpu cortex-m55
> > -  option nomve remove mve mve_float
> > -  option nofp remove ALL_FP mve_float
> > -  option nodsp remove MVE mve_float
> > -- isa quirk_no_asmcpu
> > -+ isa quirk_no_asmcpu quirk_vlldm
> > -  costs v7m
> > -  vendor 41
> > - end cpu cortex-m55
> > -diff --git a/gcc/config/arm/arm.opt b/gcc/config/arm/arm.opt
> > ---- a/gcc/config/arm/arm.opt   2021-11-15 02:13:11.104579747 -0800
> > -+++ b/gcc/config/arm/arm.opt   2021-11-15 02:17:36.988237692 -0800
> > -@@ -268,6 +268,10 @@ Target Var(fix_cm3_ldrd) Init(2)
> > - Avoid overlapping destination and address registers on LDRD
> instructions
> > - that may trigger Cortex-M3 errata.
> > -
> > -+mfix-cmse-cve-2021-35465
> > -+Target Var(fix_vlldm) Init(2)
> > -+Mitigate issues with VLLDM on some M-profile devices (CVE-2021-35465).
> > -+
> > - munaligned-access
> > - Target Var(unaligned_access) Init(2) Save
> > - Enable unaligned word and halfword accesses to packed data.
> > -diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> > ---- a/gcc/doc/invoke.texi      2021-11-15 02:13:11.112579616 -0800
> > -+++ b/gcc/doc/invoke.texi      2021-11-15 02:17:36.996237562 -0800
> > -@@ -804,6 +804,7 @@ Objective-C and Objective-C++ Dialects}.
> > - -mverbose-cost-dump @gol
> > - -mpure-code @gol
> > - -mcmse @gol
> > -+-mfix-cmse-cve-2021-35465 @gol
> > - -mfdpic}
> > -
> > - @emph{AVR Options}
> > -@@ -20487,6 +20488,14 @@ Generate secure code as per the "ARMv8-M
> > - Development Tools Engineering Specification", which can be found on
> > - @url{https://developer.arm.com/documentation/ecm0359818/latest/}.
> > -
> > -+@item -mfix-cmse-cve-2021-35465
> > -+@opindex mfix-cmse-cve-2021-35465
> > -+Mitigate against a potential security issue with the @code{VLLDM}
> instruction
> > -+in some M-profile devices when using CMSE (CVE-2021-365465).  This
> option is
> > -+enabled by default when the option @option{-mcpu=} is used with
> > -+@code{cortex-m33}, @code{cortex-m35p} or @code{cortex-m55}.  The option
> > -+@option{-mno-fix-cmse-cve-2021-35465} can be used to disable the
> mitigation.
> > -+
> > - @item -mfdpic
> > - @itemx -mno-fdpic
> > - @opindex mfdpic
> > diff --git
> a/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> b/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> > index 0a108ee51b..0bf8834bb2 100644
> > ---
> a/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> > +++
> b/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> > @@ -1,4 +1,4 @@
> > -From 368eaf1846733a9920c7cf5bc547a377e7167785 Mon Sep 17 00:00:00 2001
> > +From 6badb97389cae4ff9a533d38dc7cceefe21b97a8 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Fri, 29 Mar 2013 08:37:11 +0400
> >  Subject: [PATCH] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
> > @@ -12,10 +12,10 @@ Upstream-Status: Inappropriate [embedded specific]
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >
> >  diff --git a/configure b/configure
> > -index 504f6410274..bcebad264ec 100755
> > +index e218a19e333..45744e6e471 100755
> >  --- a/configure
> >  +++ b/configure
> > -@@ -9728,7 +9728,7 @@ fi
> > +@@ -9750,7 +9750,7 @@ fi
> >   # for target_alias and gcc doesn't manage it consistently.
> >   target_configargs="--cache-file=./config.cache ${target_configargs}"
> >
> > @@ -25,10 +25,10 @@ index 504f6410274..bcebad264ec 100755
> >    *" newlib "*)
> >     case " $target_configargs " in
> >  diff --git a/configure.ac b/configure.ac
> > -index 088e735c5db..1289fe08760 100644
> > +index 7e8e628b325..bf66b51373c 100644
> >  --- a/configure.ac
> >  +++ b/configure.ac
> > -@@ -3240,7 +3240,7 @@ fi
> > +@@ -3255,7 +3255,7 @@ fi
> >   # for target_alias and gcc doesn't manage it consistently.
> >   target_configargs="--cache-file=./config.cache ${target_configargs}"
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-35465.patch
> b/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-35465.patch
> > deleted file mode 100644
> > index e09818fecf..0000000000
> > --- a/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-35465.patch
> > +++ /dev/null
> > @@ -1,39 +0,0 @@
> > -From 574e7950bd6b34e9e2cacce18c802b45505d1d0a Mon Sep 17 00:00:00 2001
> > -From: Richard Earnshaw <rearnsha@arm.com>
> > -Date: Fri, 18 Jun 2021 17:16:25 +0100
> > -Subject: [PATCH] arm: add erratum mitigation to
> __gnu_cmse_nonsecure_call
> > - [PR102035]
> > -
> > -Add the recommended erratum mitigation sequence to
> > -__gnu_cmse_nonsecure_call for use on Armv8-m.main devices. Since this
> > -is in the library code we cannot know in advance whether the core we
> > -are running on will be affected by this, so always enable it.
> > -
> > -libgcc:
> > -       PR target/102035
> > -       * config/arm/cmse_nonsecure_call.S (__gnu_cmse_nonsecure_call):
> > -       Add vlldm erratum work-around.
> > -
> > -CVE: CVE-2021-35465
> > -Upstream-Status: Backport [
> https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=574e7950bd6b34e9e2cacce18c802b45505d1d0a
> ]
> > -Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> > -
> > ----
> > - libgcc/config/arm/cmse_nonsecure_call.S | 5 +++++
> > - 1 file changed, 5 insertions(+)
> > -
> > -diff --git a/libgcc/config/arm/cmse_nonsecure_call.S
> b/libgcc/config/arm/cmse_nonsecure_call.S
> > ---- a/libgcc/config/arm/cmse_nonsecure_call.S
> > -+++ b/libgcc/config/arm/cmse_nonsecure_call.S
> > -@@ -102,6 +102,11 @@ blxns         r4
> > - #ifdef __ARM_PCS_VFP
> > - vpop.f64    {d8-d15}
> > - #else
> > -+/* VLLDM erratum mitigation sequence. */
> > -+mrs       r5, control
> > -+tst       r5, #8        /* CONTROL_S.SFPA */
> > -+it        ne
> > -+.inst.w           0xeeb00a40    /* vmovne s0, s0 */
> > - vlldm     sp            /* Lazy restore of d0-d16 and FPSCR.  */
> > - add       sp, sp, #0x88 /* Free space used to save floating point
> registers.  */
> > - #endif /* __ARM_PCS_VFP */
> > diff --git
> a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
> b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
> > index 18a9fb8701..d19cefbdf9 100644
> > ---
> a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
> > +++
> b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
> > @@ -1,4 +1,4 @@
> > -From 118c6f054711d437167ff125a88c9236bfc8099c Mon Sep 17 00:00:00 2001
> > +From 863f1f9dc78839ecd021b2cb01d501e8c9e00ef7 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Mon, 8 Mar 2021 16:04:20 -0800
> >  Subject: [PATCH] gcc: poison-system-directories
> > @@ -25,7 +25,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   7 files changed, 86 insertions(+), 2 deletions(-)
> >
> >  diff --git a/gcc/common.opt b/gcc/common.opt
> > -index c75dd36843e..49acbd6ed44 100644
> > +index a75b44ee47e..d15105a73f3 100644
> >  --- a/gcc/common.opt
> >  +++ b/gcc/common.opt
> >  @@ -683,6 +683,10 @@ Wreturn-local-addr
> > @@ -40,10 +40,10 @@ index c75dd36843e..49acbd6ed44 100644
> >   Common Var(warn_shadow) Warning
> >   Warn when one variable shadows another.  Same as -Wshadow=global.
> >  diff --git a/gcc/config.in b/gcc/config.in
> > -index 10a13cde586..8848284da41 100644
> > +index 048bf52e8c2..4f973f7906a 100644
> >  --- a/gcc/config.in
> >  +++ b/gcc/config.in
> > -@@ -218,6 +218,16 @@
> > +@@ -230,6 +230,16 @@
> >   #endif
> >
> >
> > @@ -61,10 +61,10 @@ index 10a13cde586..8848284da41 100644
> >      optimizer and back end) to be checked for dynamic type safety at
> runtime.
> >      This is quite expensive. */
> >  diff --git a/gcc/configure b/gcc/configure
> > -index 9bb436ce7bd..3f0734bff11 100755
> > +index 7218b0c331a..d7445339f9a 100755
> >  --- a/gcc/configure
> >  +++ b/gcc/configure
> > -@@ -1020,6 +1020,7 @@ enable_maintainer_mode
> > +@@ -1019,6 +1019,7 @@ enable_maintainer_mode
> >   enable_link_mutex
> >   enable_link_serialization
> >   enable_version_specific_runtime_libs
> > @@ -72,7 +72,7 @@ index 9bb436ce7bd..3f0734bff11 100755
> >   enable_plugin
> >   enable_host_shared
> >   enable_libquadmath_support
> > -@@ -1782,6 +1783,8 @@ Optional Features:
> > +@@ -1781,6 +1782,8 @@ Optional Features:
> >     --enable-version-specific-runtime-libs
> >                             specify that runtime libraries should be
> installed
> >                             in a compiler-specific directory
> > @@ -81,7 +81,7 @@ index 9bb436ce7bd..3f0734bff11 100755
> >     --enable-plugin         enable plugin support
> >     --enable-host-shared    build host code as shared libraries
> >     --disable-libquadmath-support
> > -@@ -31325,6 +31328,22 @@ if test
> "${enable_version_specific_runtime_libs+set}" = set; then :
> > +@@ -31932,6 +31935,22 @@ if test
> "${enable_version_specific_runtime_libs+set}" = set; then :
> >   fi
> >
> >
> > @@ -105,10 +105,10 @@ index 9bb436ce7bd..3f0734bff11 100755
> >
> >
> >  diff --git a/gcc/configure.ac b/gcc/configure.ac
> > -index caa611933df..54e21764b3e 100644
> > +index 49f043ed29b..fe488f2232b 100644
> >  --- a/gcc/configure.ac
> >  +++ b/gcc/configure.ac
> > -@@ -7123,6 +7123,22 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
> > +@@ -7393,6 +7393,22 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
> >                   [specify that runtime libraries should be
> >                    installed in a compiler-specific directory])])
> >
> > @@ -132,7 +132,7 @@ index caa611933df..54e21764b3e 100644
> >   AC_SUBST(subdirs)
> >   AC_SUBST(srcdir)
> >  diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> > -index 7a368959e5e..6659a903bf0 100644
> > +index 35508efb4ef..40f798eac78 100644
> >  --- a/gcc/doc/invoke.texi
> >  +++ b/gcc/doc/invoke.texi
> >  @@ -369,6 +369,7 @@ Objective-C and Objective-C++ Dialects}.
> > @@ -143,7 +143,7 @@ index 7a368959e5e..6659a903bf0 100644
> >   -Wno-pragmas  -Wno-prio-ctor-dtor  -Wredundant-decls @gol
> >   -Wrestrict  -Wno-return-local-addr  -Wreturn-type @gol
> >   -Wno-scalar-storage-order  -Wsequence-point @gol
> > -@@ -7735,6 +7736,14 @@ made up of data only and thus requires no
> special treatment.  But, for
> > +@@ -7728,6 +7729,14 @@ made up of data only and thus requires no
> special treatment.  But, for
> >   most targets, it is made up of code and thus requires the stack to be
> >   made executable in order for the program to work properly.
> >
> > @@ -159,7 +159,7 @@ index 7a368959e5e..6659a903bf0 100644
> >   @opindex Wfloat-equal
> >   @opindex Wno-float-equal
> >  diff --git a/gcc/gcc.c b/gcc/gcc.c
> > -index 7837553958b..19c75b6e20d 100644
> > +index 0af888c7d78..b047fc31c2f 100644
> >  --- a/gcc/gcc.c
> >  +++ b/gcc/gcc.c
> >  @@ -1152,6 +1152,8 @@ proper position among the other output files.  */
> > diff --git
> a/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch
> b/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch
> > similarity index 99%
> > rename from meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch
> > rename to meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch
> > index 5f14dd2a58..c0e8cbd4d9 100644
> > --- a/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch
> > +++ b/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch
> > @@ -1,4 +1,4 @@
> > -From 2fa5c93641b75a662839c1b6eee172b6c481c70e Mon Sep 17 00:00:00 2001
> > +From b87a3ac51df372128be2fda992238c5aab4a719a Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Fri, 29 Mar 2013 09:10:06 +0400
> >  Subject: [PATCH] 64-bit multilib hack.
> > diff --git a/meta/recipes-devtools/gcc/gcc/0003-CVE-2021-35465.patch
> b/meta/recipes-devtools/gcc/gcc/0003-CVE-2021-35465.patch
> > deleted file mode 100644
> > index c7a7c76bf8..0000000000
> > --- a/meta/recipes-devtools/gcc/gcc/0003-CVE-2021-35465.patch
> > +++ /dev/null
> > @@ -1,103 +0,0 @@
> > -From 30461cf8dba3d3adb15a125e4da48800eb2b9b8f Mon Sep 17 00:00:00 2001
> > -From: Richard Earnshaw <rearnsha@arm.com>
> > -Date: Fri, 18 Jun 2021 17:18:37 +0100
> > -Subject: [PATCH] arm: fix vlldm erratum for Armv8.1-m [PR102035]
> > -
> > -For Armv8.1-m we generate code that emits VLLDM directly and do not
> > -rely on support code in the library, so emit the mitigation directly
> > -as well, when required.  In this case, we can use the compiler options
> > -to determine when to apply the fix and when it is safe to omit it.
> > -
> > -gcc:
> > -       PR target/102035
> > -       * config/arm/arm.md (attribute arch): Add fix_vlldm.
> > -       (arch_enabled): Use it.
> > -       * config/arm/vfp.md (lazy_store_multiple_insn): Add alternative
> to
> > -       use when erratum mitigation is needed.
> > -
> > -CVE: CVE-2021-35465
> > -Upstream-Status: Backport [
> https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=30461cf8dba3d3adb15a125e4da48800eb2b9b8f
> ]
> > -Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> > -
> > ----
> > - gcc/config/arm/arm.md | 11 +++++++++--
> > - gcc/config/arm/vfp.md | 10 +++++++---
> > - 2 files changed, 16 insertions(+), 5 deletions(-)
> > -
> > -diff -upr a/gcc/config/arm/arm.md b/gcc/config/arm/arm.md
> > ---- a/gcc/config/arm/arm.md    2020-07-22 23:35:17.344384552 -0700
> > -+++ b/gcc/config/arm/arm.md    2021-11-11 20:33:58.431543947 -0800
> > -@@ -132,9 +132,12 @@
> > - ; TARGET_32BIT, "t1" or "t2" to specify a specific Thumb mode.  "v6"
> > - ; for ARM or Thumb-2 with arm_arch6, and nov6 for ARM without
> > - ; arm_arch6.  "v6t2" for Thumb-2 with arm_arch6 and "v8mb" for ARMv8-M
> > --; Baseline.  This attribute is used to compute attribute "enabled",
> > -+; Baseline.  "fix_vlldm" is for fixing the v8-m/v8.1-m VLLDM erratum.
> > -+; This attribute is used to compute attribute "enabled",
> > - ; use type "any" to enable an alternative in all cases.
> > --(define_attr "arch"
> "any,a,t,32,t1,t2,v6,nov6,v6t2,v8mb,iwmmxt,iwmmxt2,armv6_or_vfpv3,neon,mve"
> > -+(define_attr "arch" "any, a, t, 32, t1, t2, v6,nov6, v6t2, \
> > -+                   v8mb, fix_vlldm, iwmmxt, iwmmxt2, armv6_or_vfpv3, \
> > -+                   neon, mve"
> > -   (const_string "any"))
> > -
> > - (define_attr "arch_enabled" "no,yes"
> > -@@ -177,6 +180,10 @@
> > -             (match_test "TARGET_THUMB1 && arm_arch8"))
> > -        (const_string "yes")
> > -
> > -+       (and (eq_attr "arch" "fix_vlldm")
> > -+            (match_test "fix_vlldm"))
> > -+       (const_string "yes")
> > -+
> > -        (and (eq_attr "arch" "iwmmxt2")
> > -             (match_test "TARGET_REALLY_IWMMXT2"))
> > -        (const_string "yes")
> > -diff -upr a/gcc/config/arm/vfp.md b/gcc/config/arm/vfp.md
> > ---- a/gcc/config/arm/vfp.md    2020-07-22 23:35:17.356384684 -0700
> > -+++ b/gcc/config/arm/vfp.md    2021-11-11 20:33:58.431543947 -0800
> > -@@ -1703,12 +1703,15 @@
> > -    (set_attr "type" "mov_reg")]
> > - )
> > -
> > -+;; Both this and the next instruction are treated by GCC in the same
> > -+;; way as a blockage pattern.  That's perhaps stronger than it needs
> > -+;; to be, but we do not want accesses to the VFP register bank to be
> > -+;; moved across either instruction.
> > -+
> > - (define_insn "lazy_store_multiple_insn"
> > --  [(set (match_operand:SI 0 "s_register_operand" "+&rk")
> > --      (post_dec:SI (match_dup 0)))
> > --   (unspec_volatile [(const_int 0)
> > --                   (mem:SI (post_dec:SI (match_dup 0)))]
> > --                  VUNSPEC_VLSTM)]
> > -+  [(unspec_volatile
> > -+    [(mem:BLK (match_operand:SI 0 "s_register_operand" "rk"))]
> > -+    VUNSPEC_VLSTM)]
> > -   "use_cmse && reload_completed"
> > -   "vlstm%?\\t%0"
> > -   [(set_attr "predicable" "yes")
> > -@@ -1716,14 +1719,16 @@
> > - )
> > -
> > - (define_insn "lazy_load_multiple_insn"
> > --  [(set (match_operand:SI 0 "s_register_operand" "+&rk")
> > --      (post_inc:SI (match_dup 0)))
> > --   (unspec_volatile:SI [(const_int 0)
> > --                      (mem:SI (match_dup 0))]
> > --                     VUNSPEC_VLLDM)]
> > -+  [(unspec_volatile
> > -+    [(mem:BLK (match_operand:SI 0 "s_register_operand" "rk,rk"))]
> > -+    VUNSPEC_VLLDM)]
> > -   "use_cmse && reload_completed"
> > --  "vlldm%?\\t%0"
> > --  [(set_attr "predicable" "yes")
> > -+  "@
> > -+   vscclrm\\t{vpr}\;vlldm\\t%0
> > -+   vlldm\\t%0"
> > -+  [(set_attr "arch" "fix_vlldm,*")
> > -+   (set_attr "predicable" "no")
> > -+   (set_attr "length" "8,4")
> > -    (set_attr "type" "load_4")]
> > - )
> > -
> > diff --git a/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-35465.patch
> b/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-35465.patch
> > deleted file mode 100644
> > index 9dd6a313c2..0000000000
> > --- a/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-35465.patch
> > +++ /dev/null
> > @@ -1,304 +0,0 @@
> > -From 809330ab8450261e05919b472783bf15e4b000f7 Mon Sep 17 00:00:00 2001
> > -From: Richard Earnshaw <rearnsha@arm.com>
> > -Date: Tue, 6 Jul 2021 15:10:18 +0100
> > -Subject: [PATCH] arm: Add tests for VLLDM mitigation [PR102035]
> > -
> > -New tests for the erratum mitigation.
> > -
> > -gcc/testsuite:
> > -       PR target/102035
> > -       * gcc.target/arm/cmse/mainline/8_1m/soft/cmse-13a.c: New test.
> > -       * gcc.target/arm/cmse/mainline/8_1m/soft/cmse-7a.c: Likewise.
> > -       * gcc.target/arm/cmse/mainline/8_1m/soft/cmse-8a.c: Likewise.
> > -       * gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-7a.c:
> Likewise.
> > -       * gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-8a.c:
> Likewise.
> > -       * gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-13a.c: Likewise.
> > -       * gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-7a.c: Likewise.
> > -       * gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-8a.c: Likewise.
> > -
> > -CVE: CVE-2021-35465
> > -Upstream-Status: Backport [
> https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=809330ab8450261e05919b472783bf15e4b000f7
> ]
> > -Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> > -
> > ----
> > - .../arm/cmse/mainline/8_1m/soft/cmse-13a.c    | 31 +++++++++++++++++++
> > - .../arm/cmse/mainline/8_1m/soft/cmse-7a.c     | 28 +++++++++++++++++
> > - .../arm/cmse/mainline/8_1m/soft/cmse-8a.c     | 30 ++++++++++++++++++
> > - .../cmse/mainline/8_1m/softfp-sp/cmse-7a.c    | 27 ++++++++++++++++
> > - .../cmse/mainline/8_1m/softfp-sp/cmse-8a.c    | 29 +++++++++++++++++
> > - .../arm/cmse/mainline/8_1m/softfp/cmse-13a.c  | 30 ++++++++++++++++++
> > - .../arm/cmse/mainline/8_1m/softfp/cmse-7a.c   | 27 ++++++++++++++++
> > - .../arm/cmse/mainline/8_1m/softfp/cmse-8a.c   | 29 +++++++++++++++++
> > - 8 files changed, 231 insertions(+)
> > - create mode 100644
> gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-13a.c
> > - create mode 100644
> gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-7a.c
> > - create mode 100644
> gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-8a.c
> > - create mode 100644
> gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-7a.c
> > - create mode 100644
> gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-8a.c
> > - create mode 100644
> gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-13a.c
> > - create mode 100644
> gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-7a.c
> > - create mode 100644
> gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-8a.c
> > -
> > -diff --git
> a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-13a.c
> b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-13a.c
> > ---- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-13a.c
> 1969-12-31 16:00:00.000000000 -0800
> > -+++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-13a.c
> 2021-11-15 02:30:37.210637445 -0800
> > -@@ -0,0 +1,31 @@
> > -+/* { dg-do compile } */
> > -+/* { dg-options "-mcmse -mfloat-abi=soft -mfix-cmse-cve-2021-35465" }
> */
> > -+/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=*" }
> { "-mfloat-abi=soft" } } */
> > -+
> > -+#include "../../../cmse-13.x"
> > -+
> > -+/* Checks for saving and clearing prior to function call.  */
> > -+/* Shift on the same register as blxns.  */
> > -+/* { dg-final { scan-assembler "lsrs\t(r\[1,4-9\]|r10|fp|ip), \\1,
> #1.*blxns\t\\1" } } */
> > -+/* { dg-final { scan-assembler "lsls\t(r\[1,4-9\]|r10|fp|ip), \\1,
> #1.*blxns\t\\1" } } */
> > -+/* { dg-final { scan-assembler-not "mov\tr0, r4" } } */
> > -+/* { dg-final { scan-assembler-not "mov\tr2, r4" } } */
> > -+/* { dg-final { scan-assembler-not "mov\tr3, r4" } } */
> > -+/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10,
> fp\}" } } */
> > -+/* { dg-final { scan-assembler "vlstm\tsp" } } */
> > -+/* Check the right registers are cleared and none appears twice.  */
> > -+/* { dg-final { scan-assembler "clrm\t\{(r1, )?(r4, )?(r5, )?(r6,
> )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" } } */
> > -+/* Check that the right number of registers is cleared and thus only
> one
> > -+   register is missing.  */
> > -+/* { dg-final { scan-assembler "clrm\t\{((r\[1,4-9\]|r10|fp|ip),
> ){9}APSR\}" } } */
> > -+/* Check that no cleared register is used for blxns.  */
> > -+/* { dg-final { scan-assembler-not
> "clrm\t\{\[^\}\]\+(r\[1,4-9\]|r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1" } } */
> > -+/* Check for v8.1-m variant of erratum work-around.  */
> > -+/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
> > -+/* { dg-final { scan-assembler "vlldm\tsp" } } */
> > -+/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10,
> fp\}" } } */
> > -+/* { dg-final { scan-assembler-not "vmov" } } */
> > -+/* { dg-final { scan-assembler-not "vmsr" } } */
> > -+
> > -+/* Now we check that we use the correct intrinsic to call.  */
> > -+/* { dg-final { scan-assembler "blxns" } } */
> > -diff --git
> a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-7a.c
> b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-7a.c
> > ---- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-7a.c
>  1969-12-31 16:00:00.000000000 -0800
> > -+++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-7a.c
>  2021-11-15 02:30:37.210637445 -0800
> > -@@ -0,0 +1,28 @@
> > -+/* { dg-do compile } */
> > -+/* { dg-options "-mcmse -mfloat-abi=soft -mfix-cmse-cve-2021-35465" }
> */
> > -+/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=*" }
> { "-mfloat-abi=soft" } } */
> > -+
> > -+#include "../../../cmse-7.x"
> > -+
> > -+/* Checks for saving and clearing prior to function call.  */
> > -+/* Shift on the same register as blxns.  */
> > -+/* { dg-final { scan-assembler "lsrs\t(r\[0-9\]|r10|fp|ip), \\1,
> #1.*blxns\t\\1" } } */
> > -+/* { dg-final { scan-assembler "lsls\t(r\[0-9\]|r10|fp|ip), \\1,
> #1.*blxns\t\\1" } } */
> > -+/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10,
> fp\}" } } */
> > -+/* { dg-final { scan-assembler "vlstm\tsp" } } */
> > -+/* Check the right registers are cleared and none appears twice.  */
> > -+/* { dg-final { scan-assembler "clrm\t\{(r0, )?(r1, )?(r2, )?(r3,
> )?(r4, )?(r5, )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" }
> } */
> > -+/* Check that the right number of registers is cleared and thus only
> one
> > -+   register is missing.  */
> > -+/* { dg-final { scan-assembler "clrm\t\{((r\[0-9\]|r10|fp|ip),
> ){12}APSR\}" } } */
> > -+/* Check that no cleared register is used for blxns.  */
> > -+/* { dg-final { scan-assembler-not
> "clrm\t\{\[^\}\]\+(r\[0-9\]|r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1" } } */
> > -+/* Check for v8.1-m variant of erratum work-around.  */
> > -+/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
> > -+/* { dg-final { scan-assembler "vlldm\tsp" } } */
> > -+/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10,
> fp\}" } } */
> > -+/* { dg-final { scan-assembler-not "vmov" } } */
> > -+/* { dg-final { scan-assembler-not "vmsr" } } */
> > -+
> > -+/* Now we check that we use the correct intrinsic to call.  */
> > -+/* { dg-final { scan-assembler "blxns" } } */
> > -diff --git
> a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-8a.c
> b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-8a.c
> > ---- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-8a.c
>  1969-12-31 16:00:00.000000000 -0800
> > -+++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-8a.c
>  2021-11-15 02:30:37.210637445 -0800
> > -@@ -0,0 +1,30 @@
> > -+/* { dg-do compile } */
> > -+/* { dg-options "-mcmse -mfloat-abi=soft -mfix-cmse-cve-2021-35465" }
> */
> > -+/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=*" }
> { "-mfloat-abi=soft" } } */
> > -+
> > -+#include "../../../cmse-8.x"
> > -+
> > -+/* Checks for saving and clearing prior to function call.  */
> > -+/* Shift on the same register as blxns.  */
> > -+/* { dg-final { scan-assembler "lsrs\t(r\[2-9\]|r10|fp|ip), \\1,
> #1.*blxns\t\\1" } } */
> > -+/* { dg-final { scan-assembler "lsls\t(r\[2-9\]|r10|fp|ip), \\1,
> #1.*blxns\t\\1" } } */
> > -+/* { dg-final { scan-assembler-not "mov\tr0, r4" } } */
> > -+/* { dg-final { scan-assembler-not "mov\tr1, r4" } } */
> > -+/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10,
> fp\}" } } */
> > -+/* { dg-final { scan-assembler "vlstm\tsp" } } */
> > -+/* Check the right registers are cleared and none appears twice.  */
> > -+/* { dg-final { scan-assembler "clrm\t\{(r2, )?(r3, )?(r4, )?(r5,
> )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" } } */
> > -+/* Check that the right number of registers is cleared and thus only
> one
> > -+   register is missing.  */
> > -+/* { dg-final { scan-assembler "clrm\t\{((r\[2-9\]|r10|fp|ip),
> ){10}APSR\}" } } */
> > -+/* Check that no cleared register is used for blxns.  */
> > -+/* { dg-final { scan-assembler-not
> "clrm\t\{\[^\}\]\+(r\[2-9\]|r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1" } } */
> > -+/* Check for v8.1-m variant of erratum work-around.  */
> > -+/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
> > -+/* { dg-final { scan-assembler "vlldm\tsp" } } */
> > -+/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10,
> fp\}" } } */
> > -+/* { dg-final { scan-assembler-not "vmov" } } */
> > -+/* { dg-final { scan-assembler-not "vmsr" } } */
> > -+
> > -+/* Now we check that we use the correct intrinsic to call.  */
> > -+/* { dg-final { scan-assembler "blxns" } } */
> > -diff --git
> a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-13a.c
> b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-13a.c
> > ----
> a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-13a.c
> 1969-12-31 16:00:00.000000000 -0800
> > -+++
> b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-13a.c
> 2021-11-15 02:30:37.210637445 -0800
> > -@@ -0,0 +1,30 @@
> > -+/* { dg-do compile } */
> > -+/* { dg-options "-mcmse -mfloat-abi=softfp -mfpu=fpv5-d16
> -mfix-cmse-cve-2021-35465" }  */
> > -+/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=*" }
> { "-mfloat-abi=softfp" } } */
> > -+/* { dg-skip-if "Skip these if testing single precision" {*-*-*}
> {"-mfpu=*-sp-*"} {""} } */
> > -+
> > -+#include "../../../cmse-13.x"
> > -+
> > -+/* Checks for saving and clearing prior to function call.  */
> > -+/* Shift on the same register as blxns.  */
> > -+/* { dg-final { scan-assembler "lsrs\t(r\[1,4-9\]|r10|fp|ip), \\1,
> #1.*blxns\t\\1" } } */
> > -+/* { dg-final { scan-assembler "lsls\t(r\[1,4-9\]|r10|fp|ip), \\1,
> #1.*blxns\t\\1" } } */
> > -+/* { dg-final { scan-assembler-not "mov\tr0, r4" } } */
> > -+/* { dg-final { scan-assembler-not "mov\tr2, r4" } } */
> > -+/* { dg-final { scan-assembler-not "mov\tr3, r4" } } */
> > -+/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10,
> fp\}" } } */
> > -+/* { dg-final { scan-assembler "vlstm\tsp" } } */
> > -+/* Check the right registers are cleared and none appears twice.  */
> > -+/* { dg-final { scan-assembler "clrm\t\{(r1, )?(r4, )?(r5, )?(r6,
> )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" } } */
> > -+/* Check that the right number of registers is cleared and thus only
> one
> > -+   register is missing.  */
> > -+/* { dg-final { scan-assembler "clrm\t\{((r\[1,4-9\]|r10|fp|ip),
> ){9}APSR\}" } } */
> > -+/* Check that no cleared register is used for blxns.  */
> > -+/* { dg-final { scan-assembler-not
> "clrm\t\{\[^\}\]\+(r\[1,4-9\]|r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1" } } */
> > -+/* Check for v8.1-m variant of erratum work-around.  */
> > -+/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
> > -+/* { dg-final { scan-assembler "vlldm\tsp" } } */
> > -+/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10,
> fp\}" } } */
> > -+
> > -+/* Now we check that we use the correct intrinsic to call.  */
> > -+/* { dg-final { scan-assembler "blxns" } } */
> > -diff --git
> a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-7a.c
> b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-7a.c
> > ---- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-7a.c
> 1969-12-31 16:00:00.000000000 -0800
> > -+++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-7a.c
> 2021-11-15 02:30:37.210637445 -0800
> > -@@ -0,0 +1,27 @@
> > -+/* { dg-do compile } */
> > -+/* { dg-options "-mcmse -mfloat-abi=softfp -mfpu=fpv5-d16
> -mfix-cmse-cve-2021-35465" }  */
> > -+/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=*" }
> { "-mfloat-abi=softfp" } } */
> > -+/* { dg-skip-if "Skip these if testing single precision" {*-*-*}
> {"-mfpu=*-sp-*"} {""} } */
> > -+
> > -+#include "../../../cmse-7.x"
> > -+
> > -+/* Checks for saving and clearing prior to function call.  */
> > -+/* Shift on the same register as blxns.  */
> > -+/* { dg-final { scan-assembler "lsrs\t(r\[0-9\]|r10|fp|ip), \\1,
> #1.*blxns\t\\1" } } */
> > -+/* { dg-final { scan-assembler "lsls\t(r\[0-9\]|r10|fp|ip), \\1,
> #1.*blxns\t\\1" } } */
> > -+/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10,
> fp\}" } } */
> > -+/* { dg-final { scan-assembler "vlstm\tsp" } } */
> > -+/* Check the right registers are cleared and none appears twice.  */
> > -+/* { dg-final { scan-assembler "clrm\t\{(r0, )?(r1, )?(r2, )?(r3,
> )?(r4, )?(r5, )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" }
> } */
> > -+/* Check that the right number of registers is cleared and thus only
> one
> > -+   register is missing.  */
> > -+/* { dg-final { scan-assembler "clrm\t\{((r\[0-9\]|r10|fp|ip),
> ){12}APSR\}" } } */
> > -+/* Check that no cleared register is used for blxns.  */
> > -+/* { dg-final { scan-assembler-not
> "clrm\t\{\[^\}\]\+(r\[0-9\]|r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1" } } */
> > -+/* Check for v8.1-m variant of erratum work-around.  */
> > -+/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
> > -+/* { dg-final { scan-assembler "vlldm\tsp" } } */
> > -+/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10,
> fp\}" } } */
> > -+
> > -+/* Now we check that we use the correct intrinsic to call.  */
> > -+/* { dg-final { scan-assembler "blxns" } } */
> > -diff --git
> a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-8a.c
> b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-8a.c
> > ---- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-8a.c
> 1969-12-31 16:00:00.000000000 -0800
> > -+++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-8a.c
> 2021-11-15 02:30:37.210637445 -0800
> > -@@ -0,0 +1,29 @@
> > -+/* { dg-do compile } */
> > -+/* { dg-options "-mcmse -mfloat-abi=softfp -mfpu=fpv5-d16
> -mfix-cmse-cve-2021-35465" }  */
> > -+/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=*" }
> { "-mfloat-abi=softfp" } } */
> > -+/* { dg-skip-if "Skip these if testing single precision" {*-*-*}
> {"-mfpu=*-sp-*"} {""} } */
> > -+
> > -+#include "../../../cmse-8.x"
> > -+
> > -+/* Checks for saving and clearing prior to function call.  */
> > -+/* Shift on the same register as blxns.  */
> > -+/* { dg-final { scan-assembler "lsrs\t(r\[2-9\]|r10|fp|ip), \\1,
> #1.*blxns\t\\1" } } */
> > -+/* { dg-final { scan-assembler "lsls\t(r\[2-9\]|r10|fp|ip), \\1,
> #1.*blxns\t\\1" } } */
> > -+/* { dg-final { scan-assembler-not "mov\tr0, r4" } } */
> > -+/* { dg-final { scan-assembler-not "mov\tr1, r4" } } */
> > -+/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10,
> fp\}" } } */
> > -+/* { dg-final { scan-assembler "vlstm\tsp" } } */
> > -+/* Check the right registers are cleared and none appears twice.  */
> > -+/* { dg-final { scan-assembler "clrm\t\{(r2, )?(r3, )?(r4, )?(r5,
> )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" } } */
> > -+/* Check that the right number of registers is cleared and thus only
> one
> > -+   register is missing.  */
> > -+/* { dg-final { scan-assembler "clrm\t\{((r\[2-9\]|r10|fp|ip),
> ){10}APSR\}" } } */
> > -+/* Check that no cleared register is used for blxns.  */
> > -+/* { dg-final { scan-assembler-not
> "clrm\t\{\[^\}\]\+(r\[2-9\]|r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1" } } */
> > -+/* Check for v8.1-m variant of erratum work-around.  */
> > -+/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
> > -+/* { dg-final { scan-assembler "vlldm\tsp" } } */
> > -+/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10,
> fp\}" } } */
> > -+
> > -+/* Now we check that we use the correct intrinsic to call.  */
> > -+/* { dg-final { scan-assembler "blxns" } } */
> > -diff --git
> a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-7a.c
> b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-7a.c
> > ----
> a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-7a.c
> 1969-12-31 16:00:00.000000000 -0800
> > -+++
> b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-7a.c
> 2021-11-15 02:30:37.210637445 -0800
> > -@@ -0,0 +1,27 @@
> > -+/* { dg-do compile } */
> > -+/* { dg-options "-mcmse -mfloat-abi=softfp -mfpu=fpv5-sp-d16
> -mfix-cmse-cve-2021-35465" }  */
> > -+/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=*" }
> { "-mfloat-abi=softfp" } } */
> > -+/* { dg-skip-if "Skip these if testing double precision" {*-*-*}
> {"-mfpu=fpv[4-5]-d16"} {""} } */
> > -+
> > -+#include "../../../cmse-7.x"
> > -+
> > -+/* Checks for saving and clearing prior to function call.  */
> > -+/* Shift on the same register as blxns.  */
> > -+/* { dg-final { scan-assembler "lsrs\t(r\[0-9\]|r10|fp|ip), \\1,
> #1.*blxns\t\\1" } } */
> > -+/* { dg-final { scan-assembler "lsls\t(r\[0-9\]|r10|fp|ip), \\1,
> #1.*blxns\t\\1" } } */
> > -+/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10,
> fp\}" } } */
> > -+/* { dg-final { scan-assembler "vlstm\tsp" } } */
> > -+/* Check the right registers are cleared and none appears twice.  */
> > -+/* { dg-final { scan-assembler "clrm\t\{(r0, )?(r1, )?(r2, )?(r3,
> )?(r4, )?(r5, )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" }
> } */
> > -+/* Check that the right number of registers is cleared and thus only
> one
> > -+   register is missing.  */
> > -+/* { dg-final { scan-assembler "clrm\t\{((r\[0-9\]|r10|fp|ip),
> ){12}APSR\}" } } */
> > -+/* Check that no cleared register is used for blxns.  */
> > -+/* { dg-final { scan-assembler-not
> "clrm\t\{\[^\}\]\+(r\[0-9\]|r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1" } } */
> > -+/* Check for v8.1-m variant of erratum work-around.  */
> > -+/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
> > -+/* { dg-final { scan-assembler "vlldm\tsp" } } */
> > -+/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10,
> fp\}" } } */
> > -+
> > -+/* Now we check that we use the correct intrinsic to call.  */
> > -+/* { dg-final { scan-assembler "blxns" } } */
> > -diff --git
> a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-8a.c
> b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-8a.c
> > ----
> a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-8a.c
> 1969-12-31 16:00:00.000000000 -0800
> > -+++
> b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-8a.c
> 2021-11-15 02:30:37.210637445 -0800
> > -@@ -0,0 +1,29 @@
> > -+/* { dg-do compile } */
> > -+/* { dg-options "-mcmse -mfloat-abi=softfp -mfpu=fpv5-sp-d16
> -mfix-cmse-cve-2021-35465" }  */
> > -+/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=*" }
> { "-mfloat-abi=softfp" } } */
> > -+/* { dg-skip-if "Skip these if testing double precision" {*-*-*}
> {"-mfpu=fpv[4-5]-d16"} {""} } */
> > -+
> > -+#include "../../../cmse-8.x"
> > -+
> > -+/* Checks for saving and clearing prior to function call.  */
> > -+/* Shift on the same register as blxns.  */
> > -+/* { dg-final { scan-assembler "lsrs\t(r\[2-9\]|r10|fp|ip), \\1,
> #1.*blxns\t\\1" } } */
> > -+/* { dg-final { scan-assembler "lsls\t(r\[2-9\]|r10|fp|ip), \\1,
> #1.*blxns\t\\1" } } */
> > -+/* { dg-final { scan-assembler-not "mov\tr0, r4" } } */
> > -+/* { dg-final { scan-assembler-not "mov\tr1, r4" } } */
> > -+/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10,
> fp\}" } } */
> > -+/* { dg-final { scan-assembler "vlstm\tsp" } } */
> > -+/* Check the right registers are cleared and none appears twice.  */
> > -+/* { dg-final { scan-assembler "clrm\t\{(r2, )?(r3, )?(r4, )?(r5,
> )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" } } */
> > -+/* Check that the right number of registers is cleared and thus only
> one
> > -+   register is missing.  */
> > -+/* { dg-final { scan-assembler "clrm\t\{((r\[2-9\]|r10|fp|ip),
> ){10}APSR\}" } } */
> > -+/* Check that no cleared register is used for blxns.  */
> > -+/* { dg-final { scan-assembler-not
> "clrm\t\{\[^\}\]\+(r\[2-9\]|r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1" } } */
> > -+/* Check for v8.1-m variant of erratum work-around.  */
> > -+/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
> > -+/* { dg-final { scan-assembler "vlldm\tsp" } } */
> > -+/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10,
> fp\}" } } */
> > -+
> > -+/* Now we check that we use the correct intrinsic to call.  */
> > -+/* { dg-final { scan-assembler "blxns" } } */
> > diff --git
> a/meta/recipes-devtools/gcc/gcc/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> b/meta/recipes-devtools/gcc/gcc/0004-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> > similarity index 91%
> > rename from
> meta/recipes-devtools/gcc/gcc/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> > rename to
> meta/recipes-devtools/gcc/gcc/0004-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> > index 9844c2ae8a..55a58851dc 100644
> > ---
> a/meta/recipes-devtools/gcc/gcc/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> > +++
> b/meta/recipes-devtools/gcc/gcc/0004-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> > @@ -1,4 +1,4 @@
> > -From e64342df647829d3e1c52fd480a5be7c1281ced0 Mon Sep 17 00:00:00 2001
> > +From 1766cf28fd7d917df510b1c262c47211b9ea70fa Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Fri, 29 Mar 2013 09:17:25 +0400
> >  Subject: [PATCH] Use the defaults.h in ${B} instead of ${S}, and t-oe
> in ${B}
> > @@ -26,7 +26,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >   4 files changed, 7 insertions(+), 7 deletions(-)
> >
> >  diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> > -index 8a5fb3fd99c..7da6f439fff 100644
> > +index 7bfd6ce653f..95962ae37b6 100644
> >  --- a/gcc/Makefile.in
> >  +++ b/gcc/Makefile.in
> >  @@ -552,7 +552,7 @@ TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
> > @@ -39,10 +39,10 @@ index 8a5fb3fd99c..7da6f439fff 100644
> >   TM_MULTILIB_CONFIG=@TM_MULTILIB_CONFIG@
> >   TM_MULTILIB_EXCEPTIONS_CONFIG=@TM_MULTILIB_EXCEPTIONS_CONFIG@
> >  diff --git a/gcc/configure b/gcc/configure
> > -index 3f0734bff11..c5d3bc4ee2d 100755
> > +index d7445339f9a..f5b99d1cf7d 100755
> >  --- a/gcc/configure
> >  +++ b/gcc/configure
> > -@@ -13090,8 +13090,8 @@ for f in $tm_file; do
> > +@@ -13131,8 +13131,8 @@ for f in $tm_file; do
> >          tm_include_list="${tm_include_list} $f"
> >          ;;
> >       defaults.h )
> > @@ -54,10 +54,10 @@ index 3f0734bff11..c5d3bc4ee2d 100755
> >       * )
> >          tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
> >  diff --git a/gcc/configure.ac b/gcc/configure.ac
> > -index 54e21764b3e..f83420326d6 100644
> > +index fe488f2232b..29005f6d18f 100644
> >  --- a/gcc/configure.ac
> >  +++ b/gcc/configure.ac
> > -@@ -2263,8 +2263,8 @@ for f in $tm_file; do
> > +@@ -2294,8 +2294,8 @@ for f in $tm_file; do
> >          tm_include_list="${tm_include_list} $f"
> >          ;;
> >       defaults.h )
> > diff --git a/meta/recipes-devtools/gcc/gcc/0005-cpp-honor-sysroot.patch
> b/meta/recipes-devtools/gcc/gcc/0005-cpp-honor-sysroot.patch
> > new file mode 100644
> > index 0000000000..f2883fe074
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc/0005-cpp-honor-sysroot.patch
> > @@ -0,0 +1,53 @@
> > +From e6a820a19c4cd115d8af7c235c5f9700c7a24730 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:22:00 +0400
> > +Subject: [PATCH] cpp: honor sysroot.
> > +
> > +Currently, if the gcc toolchain is relocated and installed from sstate,
> then you try and compile
> > +preprocessed source (.i or .ii files), the compiler will try and access
> the builtin sysroot location
> > +rather than the --sysroot option specified on the commandline. If
> access to that directory is
> > +permission denied (unreadable), gcc will error.
> > +
> > +This happens when ccache is in use due to the fact it uses preprocessed
> source files.
> > +
> > +The fix below adds %I to the cpp-output spec macro so the default
> substitutions for -iprefix,
> > +-isystem, -isysroot happen and the correct sysroot is used.
> > +
> > +[YOCTO #2074]
> > +
> > +RP 2012/04/13
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +Upstream-Status: Submitted [
> https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582725.html]
> > +---
> > + gcc/cp/lang-specs.h | 2 +-
> > + gcc/gcc.c           | 2 +-
> > + 2 files changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/gcc/cp/lang-specs.h b/gcc/cp/lang-specs.h
> > +index 8902ae1d2ed..e99e2fcd6ad 100644
> > +--- a/gcc/cp/lang-specs.h
> > ++++ b/gcc/cp/lang-specs.h
> > +@@ -116,7 +116,7 @@ along with GCC; see the file COPYING3.  If not see
> > +   {".ii", "@c++-cpp-output", 0, 0, 0},
> > +   {"@c++-cpp-output",
> > +       "%{!E:%{!M:%{!MM:"
> > +-      "  cc1plus -fpreprocessed %i %(cc1_options) %2"
> > ++      "  cc1plus -fpreprocessed %i %I %(cc1_options) %2"
> > +       "  %{!fsyntax-only:"
> > +       "    %{fmodule-only:%{!S:-o %g.s%V}}"
> > +       "    %{!fmodule-only:%{!fmodule-header*:%(invoke_as)}}}"
> > +diff --git a/gcc/gcc.c b/gcc/gcc.c
> > +index b047fc31c2f..bdee2671532 100644
> > +--- a/gcc/gcc.c
> > ++++ b/gcc/gcc.c
> > +@@ -1469,7 +1469,7 @@ static const struct compiler default_compilers[] =
> > +
> %W{o*:--output-pch=%*}}%V}}}}}}}", 0, 0, 0},
> > +   {".i", "@cpp-output", 0, 0, 0},
> > +   {"@cpp-output",
> > +-   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %(cc1_options)
> %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
> > ++   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %I %(cc1_options)
> %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
> > +   {".s", "@assembler", 0, 0, 0},
> > +   {"@assembler",
> > +    "%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_options) %i %A }}}}",
> 0, 0, 0},
> > diff --git
> a/meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> b/meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> > similarity index 81%
> > rename from
> meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> > rename to
> meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> > index 0884730786..ef19eef822 100644
> > ---
> a/meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> > +++
> b/meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> > @@ -1,4 +1,4 @@
> > -From 8e9d6efecdc8c42f47e3a012dee764b13c3dad59 Mon Sep 17 00:00:00 2001
> > +From 84dd8ea4c982fc2c82af642293d29e9c1880de5b Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Fri, 29 Mar 2013 09:24:50 +0400
> >  Subject: [PATCH] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
> > @@ -12,25 +12,43 @@ SH, sparc, alpha for possible future support (if any)
> >
> >  Removes the do_headerfix task in metadata
> >
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > -
> >  Upstream-Status: Inappropriate [OE configuration]
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >  ---
> > - gcc/config/alpha/linux-elf.h |  4 ++--
> > - gcc/config/arm/linux-eabi.h  |  4 ++--
> > - gcc/config/arm/linux-elf.h   |  2 +-
> > - gcc/config/i386/linux.h      |  2 +-
> > - gcc/config/i386/linux64.h    |  6 +++---
> > - gcc/config/linux.h           |  8 ++++----
> > - gcc/config/mips/linux.h      | 12 ++++++------
> > - gcc/config/riscv/linux.h     |  2 +-
> > - gcc/config/rs6000/linux64.h  | 15 +++++----------
> > - gcc/config/sh/linux.h        |  2 +-
> > - gcc/config/sparc/linux.h     |  2 +-
> > - gcc/config/sparc/linux64.h   |  4 ++--
> > - 12 files changed, 29 insertions(+), 34 deletions(-)
> > + gcc/config/aarch64/aarch64-linux.h |  4 ++--
> > + gcc/config/alpha/linux-elf.h       |  4 ++--
> > + gcc/config/arm/linux-eabi.h        |  4 ++--
> > + gcc/config/arm/linux-elf.h         |  2 +-
> > + gcc/config/i386/linux.h            |  2 +-
> > + gcc/config/i386/linux64.h          |  6 +++---
> > + gcc/config/linux.h                 |  8 ++++----
> > + gcc/config/mips/linux.h            | 12 ++++++------
> > + gcc/config/riscv/linux.h           |  2 +-
> > + gcc/config/rs6000/linux64.h        | 15 +++++----------
> > + gcc/config/sh/linux.h              |  2 +-
> > + gcc/config/sparc/linux.h           |  2 +-
> > + gcc/config/sparc/linux64.h         |  4 ++--
> > + 13 files changed, 31 insertions(+), 36 deletions(-)
> >
> > -unchanged:
> > +diff --git a/gcc/config/aarch64/aarch64-linux.h
> b/gcc/config/aarch64/aarch64-linux.h
> > +index 7f2529a2a1d..4bcae7f3110 100644
> > +--- a/gcc/config/aarch64/aarch64-linux.h
> > ++++ b/gcc/config/aarch64/aarch64-linux.h
> > +@@ -21,10 +21,10 @@
> > + #ifndef GCC_AARCH64_LINUX_H
> > + #define GCC_AARCH64_LINUX_H
> > +
> > +-#define GLIBC_DYNAMIC_LINKER
> "/lib/ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
> > ++#define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR
> "ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
> > +
> > + #undef MUSL_DYNAMIC_LINKER
> > +-#define MUSL_DYNAMIC_LINKER
> "/lib/ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
> > ++#define MUSL_DYNAMIC_LINKER  SYSTEMLIBS_DIR
> "ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
> > +
> > + #undef  ASAN_CC1_SPEC
> > + #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
> > +diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf.h
> > +index c1dae8ca2cf..3ce2b76c1a4 100644
> >  --- a/gcc/config/alpha/linux-elf.h
> >  +++ b/gcc/config/alpha/linux-elf.h
> >  @@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.  If not see
> > @@ -44,7 +62,8 @@ unchanged:
> >   #if DEFAULT_LIBC == LIBC_UCLIBC
> >   #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
> >   #elif DEFAULT_LIBC == LIBC_GLIBC
> > -unchanged:
> > +diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
> > +index 85d0136e76e..6bd95855827 100644
> >  --- a/gcc/config/arm/linux-eabi.h
> >  +++ b/gcc/config/arm/linux-eabi.h
> >  @@ -65,8 +65,8 @@
> > @@ -58,7 +77,8 @@ unchanged:
> >   #define GLIBC_DYNAMIC_LINKER_DEFAULT GLIBC_DYNAMIC_LINKER_SOFT_FLOAT
> >
> >   #define GLIBC_DYNAMIC_LINKER \
> > -unchanged:
> > +diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
> > +index 0c1c4e70b6b..6bd643ade11 100644
> >  --- a/gcc/config/arm/linux-elf.h
> >  +++ b/gcc/config/arm/linux-elf.h
> >  @@ -60,7 +60,7 @@
> > @@ -70,7 +90,8 @@ unchanged:
> >
> >   #define LINUX_TARGET_LINK_SPEC  "%{h*} \
> >      %{static:-Bstatic} \
> > -unchanged:
> > +diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h
> > +index 04b274f1654..7aafcf3ac2d 100644
> >  --- a/gcc/config/i386/linux.h
> >  +++ b/gcc/config/i386/linux.h
> >  @@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.  If not see
> > @@ -82,7 +103,8 @@ unchanged:
> >
> >   #undef MUSL_DYNAMIC_LINKER
> >   #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
> > -unchanged:
> > +diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h
> > +index b3822ced528..92d303e80d6 100644
> >  --- a/gcc/config/i386/linux64.h
> >  +++ b/gcc/config/i386/linux64.h
> >  @@ -27,9 +27,9 @@ see the files COPYING3 and COPYING.RUNTIME
> respectively.  If not, see
> > @@ -98,7 +120,8 @@ unchanged:
> >
> >   #undef MUSL_DYNAMIC_LINKER32
> >   #define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-i386.so.1"
> > -unchanged:
> > +diff --git a/gcc/config/linux.h b/gcc/config/linux.h
> > +index 4e1db60fced..87efc5f69fe 100644
> >  --- a/gcc/config/linux.h
> >  +++ b/gcc/config/linux.h
> >  @@ -94,10 +94,10 @@ see the files COPYING3 and COPYING.RUNTIME
> respectively.  If not, see
> > @@ -116,7 +139,8 @@ unchanged:
> >   #define BIONIC_DYNAMIC_LINKER "/system/bin/linker"
> >   #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
> >   #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
> > -unchanged:
> > +diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
> > +index 44a85e410d9..8d41b5574f6 100644
> >  --- a/gcc/config/mips/linux.h
> >  +++ b/gcc/config/mips/linux.h
> >  @@ -22,20 +22,20 @@ along with GCC; see the file COPYING3.  If not see
> > @@ -146,7 +170,8 @@ unchanged:
> >
> >   #undef MUSL_DYNAMIC_LINKER32
> >   #define MUSL_DYNAMIC_LINKER32 \
> > -unchanged:
> > +diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h
> > +index fce5b896e6e..03aa55cb5ab 100644
> >  --- a/gcc/config/riscv/linux.h
> >  +++ b/gcc/config/riscv/linux.h
> >  @@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.  If not see
> > @@ -158,7 +183,8 @@ unchanged:
> >
> >   #define MUSL_ABI_SUFFIX \
> >     "%{mabi=ilp32:-sf}" \
> > -unchanged:
> > +diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
> > +index e3f2cd254f6..a11e01faa3d 100644
> >  --- a/gcc/config/rs6000/linux64.h
> >  +++ b/gcc/config/rs6000/linux64.h
> >  @@ -336,24 +336,19 @@ extern int dot_symbols;
> > @@ -191,7 +217,8 @@ unchanged:
> >
> >   #undef  DEFAULT_ASM_ENDIAN
> >   #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
> > -unchanged:
> > +diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h
> > +index 7558d2f7195..3aaa6c3a078 100644
> >  --- a/gcc/config/sh/linux.h
> >  +++ b/gcc/config/sh/linux.h
> >  @@ -64,7 +64,7 @@ along with GCC; see the file COPYING3.  If not see
> > @@ -203,7 +230,8 @@ unchanged:
> >
> >   #undef SUBTARGET_LINK_EMUL_SUFFIX
> >   #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
> > -unchanged:
> > +diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
> > +index 2550d7ee8f0..a94f4cd8ba2 100644
> >  --- a/gcc/config/sparc/linux.h
> >  +++ b/gcc/config/sparc/linux.h
> >  @@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu (int argc,
> const char **argv);
> > @@ -215,7 +243,8 @@ unchanged:
> >
> >   #undef  LINK_SPEC
> >   #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
> > -unchanged:
> > +diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
> > +index 95af8afa9b5..63127afb074 100644
> >  --- a/gcc/config/sparc/linux64.h
> >  +++ b/gcc/config/sparc/linux64.h
> >  @@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.  If not see
> > @@ -229,19 +258,3 @@ unchanged:
> >
> >   #ifdef SPARC_BI_ARCH
> >
> > -diff -u b/gcc/config/aarch64/aarch64-linux.h
> b/gcc/config/aarch64/aarch64-linux.h
> > ---- b/gcc/config/aarch64/aarch64-linux.h
> > -+++ b/gcc/config/aarch64/aarch64-linux.h
> > -@@ -21,10 +21,10 @@
> > - #ifndef GCC_AARCH64_LINUX_H
> > - #define GCC_AARCH64_LINUX_H
> > -
> > --#define GLIBC_DYNAMIC_LINKER
> "/lib/ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
> > -+#define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR
> "ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
> > -
> > - #undef MUSL_DYNAMIC_LINKER
> > --#define MUSL_DYNAMIC_LINKER
> "/lib/ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
> > -+#define MUSL_DYNAMIC_LINKER  SYSTEMLIBS_DIR
> "ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
> > -
> > - #undef  ASAN_CC1_SPEC
> > - #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
> > diff --git
> a/meta/recipes-devtools/gcc/gcc/0007-gcc-Fix-argument-list-too-long-error.patch
> b/meta/recipes-devtools/gcc/gcc/0007-gcc-Fix-argument-list-too-long-error.patch
> > new file mode 100644
> > index 0000000000..9f9f8cc856
> > --- /dev/null
> > +++
> b/meta/recipes-devtools/gcc/gcc/0007-gcc-Fix-argument-list-too-long-error.patch
> > @@ -0,0 +1,42 @@
> > +From 768e9075e88d811b00207d991123438bb996e4ea Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 29 Mar 2013 09:26:37 +0400
> > +Subject: [PATCH] gcc: Fix argument list too long error.
> > +
> > +There would be an "Argument list too long" error when the
> > +build directory is longer than 200, this is caused by:
> > +
> > +headers=`echo $(PLUGIN_HEADERS) | tr ' ' '\012' | sort -u`
> > +
> > +The PLUGIN_HEADERS is too long before sort, so the "echo" can't handle
> > +it, use the $(sort list) of GNU make which can handle the too long list
> > +would fix the problem, the header would be short enough after sorted.
> > +The "tr ' ' '\012'" was used for translating the space to "\n", the
> > +$(sort list) doesn't need this.
> > +
> > +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +RP: gcc then added *.h and *.def additions to this list, breaking the
> original
> > +fix. Add the sort to the original gcc code, leaving the tr+sort to fix
> the original
> > +issue but include the new files too as reported by Zhuang <
> qiuguang.zqg@alibaba-inc.com>
> > +
> > +Upstream-Status: Backport [
> https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=66e157188bd2f789809e17e85f917534c9381599
> ]
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/Makefile.in | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> > +index 95962ae37b6..d1d4512bba3 100644
> > +--- a/gcc/Makefile.in
> > ++++ b/gcc/Makefile.in
> > +@@ -3671,7 +3671,7 @@ install-plugin: installdirs lang.install-plugin
> s-header-vars install-gengtype
> > + # We keep the directory structure for files in config, common/config or
> > + # c-family and .def files. All other files are flattened to a single
> directory.
> > +       $(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
> > +-      headers=`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def)
> | tr ' ' '\012' | sort -u`; \
> > ++      headers=`echo $(sort $(PLUGIN_HEADERS)) $$(cd $(srcdir); echo
> *.h *.def) | tr ' ' '\012' | sort -u`; \
> > +       srcdirstrip=`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`; \
> > +       for file in $$headers; do \
> > +         if [ -f $$file ] ; then \
> > diff --git a/meta/recipes-devtools/gcc/gcc/0014-libtool.patch
> b/meta/recipes-devtools/gcc/gcc/0008-libtool.patch
> > similarity index 94%
> > rename from meta/recipes-devtools/gcc/gcc/0014-libtool.patch
> > rename to meta/recipes-devtools/gcc/gcc/0008-libtool.patch
> > index f2b8924ebf..358e1d7b3c 100644
> > --- a/meta/recipes-devtools/gcc/gcc/0014-libtool.patch
> > +++ b/meta/recipes-devtools/gcc/gcc/0008-libtool.patch
> > @@ -1,4 +1,4 @@
> > -From a5b984db9669cf38a7bd76c3fcdb41c086f740db Mon Sep 17 00:00:00 2001
> > +From b19700ef0103f9414416b9a779a64d6138c58b1f Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Fri, 29 Mar 2013 09:29:11 +0400
> >  Subject: [PATCH] libtool
> > diff --git a/meta/recipes-devtools/gcc/gcc/0009-cpp-honor-sysroot.patch
> b/meta/recipes-devtools/gcc/gcc/0009-cpp-honor-sysroot.patch
> > deleted file mode 100644
> > index 37f26f0728..0000000000
> > --- a/meta/recipes-devtools/gcc/gcc/0009-cpp-honor-sysroot.patch
> > +++ /dev/null
> > @@ -1,59 +0,0 @@
> > -From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > -Subject: [PATCH 5/5] gcc: Pass sysroot options to cpp for preprocessed
> source
> > -
> > -OpenEmbedded/Yocto Project extensively uses the --sysroot support
> within gcc.
> > -We discovered that when compiling preprocessed source (.i or .ii
> files), the
> > -compiler will try and access the builtin sysroot location rather than
> the
> > ---sysroot option specified on the commandline. If access to that
> directory is
> > -permission denied (unreadable), gcc will error. This is particularly
> problematic
> > -when ccache is involved.
> > -
> > -This patch adds %I to the cpp-output spec macro so the default
> substitutions for
> > --iprefix, -isystem, -isysroot happen and the correct sysroot is used.
> > -
> > -2021-10-27 Richard Purdie <richard.purdie@linuxfoundation.org>
> > -
> > -gcc/cp/ChangeLog:
> > -
> > -    * lang-specs.h: Pass sysroot options to cpp for preprocessed source
> > -
> > -gcc/ChangeLog:
> > -
> > -    * gcc.c: Pass sysroot options to cpp for preprocessed source
> > -
> > -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > -
> > -[YOCTO #2074]
> > -
> > -Upstream-Status: Submitted [
> https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582725.html]
> > ----
> > - gcc/cp/lang-specs.h | 2 +-
> > - gcc/gcc.c           | 2 +-
> > - 2 files changed, 2 insertions(+), 2 deletions(-)
> > -
> > -Index: gcc-11.2.0/gcc/cp/lang-specs.h
> > -===================================================================
> > ---- gcc-11.2.0.orig/gcc/cp/lang-specs.h
> > -+++ gcc-11.2.0/gcc/cp/lang-specs.h
> > -@@ -116,7 +116,7 @@ along with GCC; see the file COPYING3.
> > -   {".ii", "@c++-cpp-output", 0, 0, 0},
> > -   {"@c++-cpp-output",
> > -       "%{!E:%{!M:%{!MM:"
> > --      "  cc1plus -fpreprocessed %i %(cc1_options) %2"
> > -+      "  cc1plus -fpreprocessed %i %I %(cc1_options) %2"
> > -       "  %{!fsyntax-only:"
> > -       "    %{fmodule-only:%{!S:-o %g.s%V}}"
> > -       "    %{!fmodule-only:%{!fmodule-header*:%(invoke_as)}}}"
> > -Index: gcc-11.2.0/gcc/gcc.c
> > -===================================================================
> > ---- gcc-11.2.0.orig/gcc/gcc.c
> > -+++ gcc-11.2.0/gcc/gcc.c
> > -@@ -1470,7 +1470,7 @@ static const struct compiler default_com
> > -
> %W{o*:--output-pch=%*}}%V}}}}}}}", 0, 0, 0},
> > -   {".i", "@cpp-output", 0, 0, 0},
> > -   {"@cpp-output",
> > --   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %(cc1_options)
> %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
> > -+   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %I %(cc1_options)
> %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
> > -   {".s", "@assembler", 0, 0, 0},
> > -   {"@assembler",
> > -    "%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_options) %i %A }}}}",
> 0, 0, 0},
> > diff --git
> a/meta/recipes-devtools/gcc/gcc/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> > similarity index 95%
> > rename from
> meta/recipes-devtools/gcc/gcc/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> > rename to
> meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> > index 1ccf39ceba..ac139542f1 100644
> > ---
> a/meta/recipes-devtools/gcc/gcc/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> > +++
> b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> > @@ -1,4 +1,4 @@
> > -From 0ae7090dec149cb2ff0c87eef87c043d4000ece1 Mon Sep 17 00:00:00 2001
> > +From 10d23d93697167396e223711bf6210e1642ee926 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Fri, 29 Mar 2013 09:30:32 +0400
> >  Subject: [PATCH] gcc: armv4: pass fix-v4bx to linker to support EABI.
> > diff --git
> a/meta/recipes-devtools/gcc/gcc/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
> b/meta/recipes-devtools/gcc/gcc/0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch
> > similarity index 89%
> > rename from
> meta/recipes-devtools/gcc/gcc/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
> > rename to
> meta/recipes-devtools/gcc/gcc/0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch
> > index bde7ec6609..4912fa9dce 100644
> > ---
> a/meta/recipes-devtools/gcc/gcc/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
> > +++
> b/meta/recipes-devtools/gcc/gcc/0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch
> > @@ -1,4 +1,4 @@
> > -From 5ce8aa4615a3816d12c43752323154744517ae9f Mon Sep 17 00:00:00 2001
> > +From 5970fb3fadccd8c43f7f7030e6ff51e0295731ef Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Fri, 29 Mar 2013 09:33:04 +0400
> >  Subject: [PATCH] Use the multilib config files from ${B} instead of
> using the
> > @@ -18,10 +18,10 @@ Upstream-Status: Inappropriate [configuration]
> >   2 files changed, 36 insertions(+), 8 deletions(-)
> >
> >  diff --git a/gcc/configure b/gcc/configure
> > -index 5160917d73e..e663052cad2 100755
> > +index f5b99d1cf7d..ec3c24482df 100755
> >  --- a/gcc/configure
> >  +++ b/gcc/configure
> > -@@ -13070,10 +13070,20 @@ done
> > +@@ -13111,10 +13111,20 @@ done
> >   tmake_file_=
> >   for f in ${tmake_file}
> >   do
> > @@ -46,7 +46,7 @@ index 5160917d73e..e663052cad2 100755
> >   done
> >   tmake_file="${tmake_file_}${omp_device_property_tmake_file}"
> >
> > -@@ -13084,6 +13094,10 @@ tm_file_list="options.h"
> > +@@ -13125,6 +13135,10 @@ tm_file_list="options.h"
> >   tm_include_list="options.h insn-constants.h"
> >   for f in $tm_file; do
> >     case $f in
> > @@ -58,10 +58,10 @@ index 5160917d73e..e663052cad2 100755
> >          f=`echo $f | sed 's/^..//'`
> >          tm_file_list="${tm_file_list} $f"
> >  diff --git a/gcc/configure.ac b/gcc/configure.ac
> > -index 50f78308e8a..2b84875b028 100644
> > +index 29005f6d18f..ea794cd1763 100644
> >  --- a/gcc/configure.ac
> >  +++ b/gcc/configure.ac
> > -@@ -2243,10 +2243,20 @@ done
> > +@@ -2274,10 +2274,20 @@ done
> >   tmake_file_=
> >   for f in ${tmake_file}
> >   do
> > @@ -86,7 +86,7 @@ index 50f78308e8a..2b84875b028 100644
> >   done
> >   tmake_file="${tmake_file_}${omp_device_property_tmake_file}"
> >
> > -@@ -2257,6 +2267,10 @@ tm_file_list="options.h"
> > +@@ -2288,6 +2298,10 @@ tm_file_list="options.h"
> >   tm_include_list="options.h insn-constants.h"
> >   for f in $tm_file; do
> >     case $f in
> > diff --git
> a/meta/recipes-devtools/gcc/gcc/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
> b/meta/recipes-devtools/gcc/gcc/0011-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
> > similarity index 92%
> > rename from
> meta/recipes-devtools/gcc/gcc/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
> > rename to
> meta/recipes-devtools/gcc/gcc/0011-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
> > index 3e0a1b4136..e3e35942e6 100644
> > ---
> a/meta/recipes-devtools/gcc/gcc/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
> > +++
> b/meta/recipes-devtools/gcc/gcc/0011-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
> > @@ -1,4 +1,4 @@
> > -From 75a1ce0265ca123f74f17a40ad8bd8f26d9c2ab3 Mon Sep 17 00:00:00 2001
> > +From 2af537b9ff0018945a27a7f89efad736a0f647d4 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Fri, 20 Feb 2015 09:39:38 +0000
> >  Subject: [PATCH] Avoid using libdir from .la which usually points to a
> host
> > diff --git
> a/meta/recipes-devtools/gcc/gcc/0019-Ensure-target-gcc-headers-can-be-included.patch
> b/meta/recipes-devtools/gcc/gcc/0012-Ensure-target-gcc-headers-can-be-included.patch
> > similarity index 96%
> > rename from
> meta/recipes-devtools/gcc/gcc/0019-Ensure-target-gcc-headers-can-be-included.patch
> > rename to
> meta/recipes-devtools/gcc/gcc/0012-Ensure-target-gcc-headers-can-be-included.patch
> > index 120d5a29b2..d33925eb40 100644
> > ---
> a/meta/recipes-devtools/gcc/gcc/0019-Ensure-target-gcc-headers-can-be-included.patch
> > +++
> b/meta/recipes-devtools/gcc/gcc/0012-Ensure-target-gcc-headers-can-be-included.patch
> > @@ -1,4 +1,4 @@
> > -From 6f410ed8fb7eee11ba7a25634c2257666b98ef52 Mon Sep 17 00:00:00 2001
> > +From 9427c6cedf88e15f747c48cb4fcf9eda6f5c4555 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Fri, 20 Feb 2015 10:25:11 +0000
> >  Subject: [PATCH] Ensure target gcc headers can be included
> > @@ -25,7 +25,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   4 files changed, 22 insertions(+)
> >
> >  diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> > -index 59c45c81393..9b17d120aa1 100644
> > +index d1d4512bba3..06eb0d27a28 100644
> >  --- a/gcc/Makefile.in
> >  +++ b/gcc/Makefile.in
> >  @@ -630,6 +630,7 @@ libexecdir = @libexecdir@
> > @@ -36,7 +36,7 @@ index 59c45c81393..9b17d120aa1 100644
> >   # Directory in which the compiler finds executables
> >   libexecsubdir =
> $(libexecdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_suffix)
> >   # Directory in which all plugin resources are installed
> > -@@ -3016,6 +3017,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localedir)\"
> > +@@ -3009,6 +3010,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localedir)\"
> >
> >   PREPROCESSOR_DEFINES = \
> >     -DGCC_INCLUDE_DIR=\"$(libsubdir)/include\" \
> > diff --git
> a/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch
> b/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch
> > deleted file mode 100644
> > index ebee30bbd6..0000000000
> > ---
> a/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch
> > +++ /dev/null
> > @@ -1,38 +0,0 @@
> > -From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > -Subject: [PATCH 2/5] gcc: Fix "argument list too long" from
> install-plugins
> > -
> > -When building in longer build paths (200+ characters), the
> > -"echo $(PLUGIN_HEADERS)" from the install-plugins target would cause an
> > -"argument list too long error" on some systems.
> > -
> > -Avoid this by calling make's sort function on the list which removes
> > -duplicates and stops the overflow from reaching the echo command.
> > -The original sort is left to handle the the .h and .def files.
> > -
> > -2021-10-26 Richard Purdie <richard.purdie@linuxfoundation.org>
> > -
> > -gcc/ChangeLog:
> > -
> > -    * Makefile.in: Fix "argument list too long" from install-plugins
> > -
> > -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > -
> > -Submitted [
> https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582722.html]
> > -Upstream-Status: Backport [
> https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=66e157188bd2f789809e17e85f917534c9381599
> ]
> > ----
> > - gcc/Makefile.in | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -Index: gcc-11.2.0/gcc/Makefile.in
> > -===================================================================
> > ---- gcc-11.2.0.orig/gcc/Makefile.in
> > -+++ gcc-11.2.0/gcc/Makefile.in
> > -@@ -3678,7 +3678,7 @@ install-plugin: installdirs lang.install
> > - # We keep the directory structure for files in config, common/config or
> > - # c-family and .def files. All other files are flattened to a single
> directory.
> > -       $(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
> > --      headers=`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def)
> | tr ' ' '\012' | sort -u`; \
> > -+      headers=`echo $(sort $(PLUGIN_HEADERS)) $$(cd $(srcdir); echo
> *.h *.def) | tr ' ' '\012' | sort -u`; \
> > -       srcdirstrip=`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`; \
> > -       for file in $$headers; do \
> > -         if [ -f $$file ] ; then \
> > diff --git
> a/meta/recipes-devtools/gcc/gcc/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch
> b/meta/recipes-devtools/gcc/gcc/0013-Don-t-search-host-directory-during-relink-if-inst_pr.patch
> > similarity index 93%
> > rename from
> meta/recipes-devtools/gcc/gcc/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch
> > rename to
> meta/recipes-devtools/gcc/gcc/0013-Don-t-search-host-directory-during-relink-if-inst_pr.patch
> > index bb2a3671f0..5b5d229eff 100644
> > ---
> a/meta/recipes-devtools/gcc/gcc/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch
> > +++
> b/meta/recipes-devtools/gcc/gcc/0013-Don-t-search-host-directory-during-relink-if-inst_pr.patch
> > @@ -1,4 +1,4 @@
> > -From cd09adb1e7f2a7e81a9f595a17c36f24911b90ac Mon Sep 17 00:00:00 2001
> > +From ab6e6af5deca6f4b35b089a6b197776df38780e6 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Tue, 3 Mar 2015 08:21:19 +0000
> >  Subject: [PATCH] Don't search host directory during "relink" if
> $inst_prefix
> > diff --git
> a/meta/recipes-devtools/gcc/gcc/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch
> b/meta/recipes-devtools/gcc/gcc/0014-libcc1-fix-libcc1-s-install-path-and-rpath.patch
> > similarity index 90%
> > rename from
> meta/recipes-devtools/gcc/gcc/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch
> > rename to
> meta/recipes-devtools/gcc/gcc/0014-libcc1-fix-libcc1-s-install-path-and-rpath.patch
> > index fb4511cc1a..b82277cc4b 100644
> > ---
> a/meta/recipes-devtools/gcc/gcc/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch
> > +++
> b/meta/recipes-devtools/gcc/gcc/0014-libcc1-fix-libcc1-s-install-path-and-rpath.patch
> > @@ -1,4 +1,4 @@
> > -From 2cfc5ee38b3f5ec1d7965aae0991bcd48b5dc2e6 Mon Sep 17 00:00:00 2001
> > +From fd862c8c112067d8613d921ae89c99056aca54a1 Mon Sep 17 00:00:00 2001
> >  From: Robert Yang <liezhi.yang@windriver.com>
> >  Date: Sun, 5 Jul 2015 20:25:18 -0700
> >  Subject: [PATCH] libcc1: fix libcc1's install path and rpath
> > @@ -20,10 +20,10 @@ Signed-off-by: Robert Yang <
> liezhi.yang@windriver.com>
> >   2 files changed, 4 insertions(+), 4 deletions(-)
> >
> >  diff --git a/libcc1/Makefile.am b/libcc1/Makefile.am
> > -index f148fdd7aa2..0b6eb8f2855 100644
> > +index 3b75e7d9290..d3a4c4f9ddf 100644
> >  --- a/libcc1/Makefile.am
> >  +++ b/libcc1/Makefile.am
> > -@@ -40,8 +40,8 @@ libiberty = $(if $(wildcard
> $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
> > +@@ -41,8 +41,8 @@ libiberty = $(if $(wildcard
> $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
> >             $(Wc)$(libiberty_normal)))
> >   libiberty_dep = $(patsubst $(Wc)%,%,$(libiberty))
> >
> > @@ -35,7 +35,7 @@ index f148fdd7aa2..0b6eb8f2855 100644
> >   if ENABLE_PLUGIN
> >   plugin_LTLIBRARIES = libcc1plugin.la libcp1plugin.la
> >  diff --git a/libcc1/Makefile.in b/libcc1/Makefile.in
> > -index 753d435c9cb..455627b0a3b 100644
> > +index 07fa9d94c83..a9f737d78f2 100644
> >  --- a/libcc1/Makefile.in
> >  +++ b/libcc1/Makefile.in
> >  @@ -398,8 +398,8 @@ libiberty = $(if $(wildcard
> $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
> > diff --git a/meta/recipes-devtools/gcc/gcc/0018-export-CPP.patch
> b/meta/recipes-devtools/gcc/gcc/0015-Makefile.in-Ensure-build-CPP-CPPFLAGS-is-used-for-bu.patch
> > similarity index 79%
> > rename from meta/recipes-devtools/gcc/gcc/0018-export-CPP.patch
> > rename to
> meta/recipes-devtools/gcc/gcc/0015-Makefile.in-Ensure-build-CPP-CPPFLAGS-is-used-for-bu.patch
> > index 86ab6574c7..45953f861d 100644
> > --- a/meta/recipes-devtools/gcc/gcc/0018-export-CPP.patch
> > +++
> b/meta/recipes-devtools/gcc/gcc/0015-Makefile.in-Ensure-build-CPP-CPPFLAGS-is-used-for-bu.patch
> > @@ -1,5 +1,8 @@
> > +From 667b302f637be0a4b6ef714b5eb0026c54425386 Mon Sep 17 00:00:00 2001
> >  From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > -Subject: [PATCH 1/5] Makefile.in: Ensure build CPP/CPPFLAGS is used for
> build targets
> > +Date: Sun, 31 Oct 2021 17:40:12 -0700
> > +Subject: [PATCH] Makefile.in: Ensure build CPP/CPPFLAGS is used for
> build
> > + targets
> >
> >  During cross compiling, CPP is being set to the target compiler even for
> >  build targets. As an example, when building a cross compiler targetting
> > @@ -42,6 +45,8 @@ Signed-off-by: Richard Purdie <
> richard.purdie@linuxfoundation.org>
> >
> >  Submitted [
> https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582727.html]
> >  Upstream-Status: Backport [
> https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=84401ce5fb4ecab55decb472b168100e7593e01f
> ]
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >  ---
> >   Makefile.in      | 6 ++++++
> >   Makefile.tpl     | 6 ++++++
> > @@ -51,11 +56,11 @@ Upstream-Status: Backport [
> https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=844
> >   gcc/configure.ac | 2 +-
> >   6 files changed, 22 insertions(+), 2 deletions(-)
> >
> > -Index: gcc-11.2.0/Makefile.in
> > -===================================================================
> > ---- gcc-11.2.0.orig/Makefile.in
> > -+++ gcc-11.2.0/Makefile.in
> > -@@ -151,6 +151,8 @@ BUILD_EXPORTS = \
> > +diff --git a/Makefile.in b/Makefile.in
> > +index 20cbbe2906d..33476d53327 100644
> > +--- a/Makefile.in
> > ++++ b/Makefile.in
> > +@@ -154,6 +154,8 @@ BUILD_EXPORTS = \
> >         CC="$(CC_FOR_BUILD)"; export CC; \
> >         CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> >         CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
> > @@ -64,7 +69,7 @@ Index: gcc-11.2.0/Makefile.in
> >         CXX="$(CXX_FOR_BUILD)"; export CXX; \
> >         CXXFLAGS="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
> >         GFORTRAN="$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
> > -@@ -198,6 +200,8 @@ HOST_EXPORTS = \
> > +@@ -202,6 +204,8 @@ HOST_EXPORTS = \
> >         AR="$(AR)"; export AR; \
> >         AS="$(AS)"; export AS; \
> >         CC_FOR_BUILD="$(CC_FOR_BUILD)"; export CC_FOR_BUILD; \
> > @@ -72,8 +77,8 @@ Index: gcc-11.2.0/Makefile.in
> >  +      CPPFLAGS_FOR_BUILD="$(CPPFLAGS_FOR_BUILD)"; export
> CPPFLAGS_FOR_BUILD; \
> >         CXX_FOR_BUILD="$(CXX_FOR_BUILD)"; export CXX_FOR_BUILD; \
> >         DLLTOOL="$(DLLTOOL)"; export DLLTOOL; \
> > -       LD="$(LD)"; export LD; \
> > -@@ -353,6 +357,8 @@ AR_FOR_BUILD = @AR_FOR_BUILD@
> > +       DSYMUTIL="$(DSYMUTIL)"; export DSYMUTIL; \
> > +@@ -360,6 +364,8 @@ AR_FOR_BUILD = @AR_FOR_BUILD@
> >   AS_FOR_BUILD = @AS_FOR_BUILD@
> >   CC_FOR_BUILD = @CC_FOR_BUILD@
> >   CFLAGS_FOR_BUILD = @CFLAGS_FOR_BUILD@
> > @@ -82,11 +87,11 @@ Index: gcc-11.2.0/Makefile.in
> >   CXXFLAGS_FOR_BUILD = @CXXFLAGS_FOR_BUILD@
> >   CXX_FOR_BUILD = @CXX_FOR_BUILD@
> >   DLLTOOL_FOR_BUILD = @DLLTOOL_FOR_BUILD@
> > -Index: gcc-11.2.0/Makefile.tpl
> > -===================================================================
> > ---- gcc-11.2.0.orig/Makefile.tpl
> > -+++ gcc-11.2.0/Makefile.tpl
> > -@@ -154,6 +154,8 @@ BUILD_EXPORTS = \
> > +diff --git a/Makefile.tpl b/Makefile.tpl
> > +index 9adf4f94728..e39d85d1109 100644
> > +--- a/Makefile.tpl
> > ++++ b/Makefile.tpl
> > +@@ -157,6 +157,8 @@ BUILD_EXPORTS = \
> >         CC="$(CC_FOR_BUILD)"; export CC; \
> >         CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
> >         CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
> > @@ -95,7 +100,7 @@ Index: gcc-11.2.0/Makefile.tpl
> >         CXX="$(CXX_FOR_BUILD)"; export CXX; \
> >         CXXFLAGS="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
> >         GFORTRAN="$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
> > -@@ -201,6 +203,8 @@ HOST_EXPORTS = \
> > +@@ -205,6 +207,8 @@ HOST_EXPORTS = \
> >         AR="$(AR)"; export AR; \
> >         AS="$(AS)"; export AS; \
> >         CC_FOR_BUILD="$(CC_FOR_BUILD)"; export CC_FOR_BUILD; \
> > @@ -103,8 +108,8 @@ Index: gcc-11.2.0/Makefile.tpl
> >  +      CPPFLAGS_FOR_BUILD="$(CPPFLAGS_FOR_BUILD)"; export
> CPPFLAGS_FOR_BUILD; \
> >         CXX_FOR_BUILD="$(CXX_FOR_BUILD)"; export CXX_FOR_BUILD; \
> >         DLLTOOL="$(DLLTOOL)"; export DLLTOOL; \
> > -       LD="$(LD)"; export LD; \
> > -@@ -356,6 +360,8 @@ AR_FOR_BUILD = @AR_FOR_BUILD@
> > +       DSYMUTIL="$(DSYMUTIL)"; export DSYMUTIL; \
> > +@@ -363,6 +367,8 @@ AR_FOR_BUILD = @AR_FOR_BUILD@
> >   AS_FOR_BUILD = @AS_FOR_BUILD@
> >   CC_FOR_BUILD = @CC_FOR_BUILD@
> >   CFLAGS_FOR_BUILD = @CFLAGS_FOR_BUILD@
> > @@ -113,11 +118,11 @@ Index: gcc-11.2.0/Makefile.tpl
> >   CXXFLAGS_FOR_BUILD = @CXXFLAGS_FOR_BUILD@
> >   CXX_FOR_BUILD = @CXX_FOR_BUILD@
> >   DLLTOOL_FOR_BUILD = @DLLTOOL_FOR_BUILD@
> > -Index: gcc-11.2.0/configure
> > -===================================================================
> > ---- gcc-11.2.0.orig/configure
> > -+++ gcc-11.2.0/configure
> > -@@ -652,6 +652,8 @@ GFORTRAN_FOR_BUILD
> > +diff --git a/configure b/configure
> > +index 45744e6e471..ff0de8a68b4 100755
> > +--- a/configure
> > ++++ b/configure
> > +@@ -655,6 +655,8 @@ DSYMUTIL_FOR_BUILD
> >   DLLTOOL_FOR_BUILD
> >   CXX_FOR_BUILD
> >   CXXFLAGS_FOR_BUILD
> > @@ -126,15 +131,15 @@ Index: gcc-11.2.0/configure
> >   CFLAGS_FOR_BUILD
> >   CC_FOR_BUILD
> >   AS_FOR_BUILD
> > -@@ -4092,6 +4094,7 @@ if test "${build}" != "${host}" ; then
> > +@@ -4100,6 +4102,7 @@ if test "${build}" != "${host}" ; then
> >     AR_FOR_BUILD=${AR_FOR_BUILD-ar}
> >     AS_FOR_BUILD=${AS_FOR_BUILD-as}
> >     CC_FOR_BUILD=${CC_FOR_BUILD-gcc}
> >  +  CPP_FOR_BUILD="${CPP_FOR_BUILD-\$(CPP)}"
> >     CXX_FOR_BUILD=${CXX_FOR_BUILD-g++}
> > +   DSYMUTIL_FOR_BUILD=${DSYMUTIL_FOR_BUILD-dsymutil}
> >     GFORTRAN_FOR_BUILD=${GFORTRAN_FOR_BUILD-gfortran}
> > -   GOC_FOR_BUILD=${GOC_FOR_BUILD-gccgo}
> > -@@ -9809,6 +9812,7 @@ esac
> > +@@ -9831,6 +9834,7 @@ esac
> >   # our build compiler if desired.
> >   if test x"${build}" = x"${host}" ; then
> >     CFLAGS_FOR_BUILD=${CFLAGS_FOR_BUILD-${CFLAGS}}
> > @@ -142,19 +147,19 @@ Index: gcc-11.2.0/configure
> >     CXXFLAGS_FOR_BUILD=${CXXFLAGS_FOR_BUILD-${CXXFLAGS}}
> >     LDFLAGS_FOR_BUILD=${LDFLAGS_FOR_BUILD-${LDFLAGS}}
> >   fi
> > -Index: gcc-11.2.0/configure.ac
> > -===================================================================
> > ---- gcc-11.2.0.orig/configure.ac
> > -+++ gcc-11.2.0/configure.ac
> > +diff --git a/configure.ac b/configure.ac
> > +index bf66b51373c..09fa3896dc7 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> >  @@ -1347,6 +1347,7 @@ if test "${build}" != "${host}" ; then
> >     AR_FOR_BUILD=${AR_FOR_BUILD-ar}
> >     AS_FOR_BUILD=${AS_FOR_BUILD-as}
> >     CC_FOR_BUILD=${CC_FOR_BUILD-gcc}
> >  +  CPP_FOR_BUILD="${CPP_FOR_BUILD-\$(CPP)}"
> >     CXX_FOR_BUILD=${CXX_FOR_BUILD-g++}
> > +   DSYMUTIL_FOR_BUILD=${DSYMUTIL_FOR_BUILD-dsymutil}
> >     GFORTRAN_FOR_BUILD=${GFORTRAN_FOR_BUILD-gfortran}
> > -   GOC_FOR_BUILD=${GOC_FOR_BUILD-gccgo}
> > -@@ -3321,6 +3322,7 @@ esac
> > +@@ -3336,6 +3337,7 @@ esac
> >   # our build compiler if desired.
> >   if test x"${build}" = x"${host}" ; then
> >     CFLAGS_FOR_BUILD=${CFLAGS_FOR_BUILD-${CFLAGS}}
> > @@ -162,7 +167,7 @@ Index: gcc-11.2.0/configure.ac
> >     CXXFLAGS_FOR_BUILD=${CXXFLAGS_FOR_BUILD-${CXXFLAGS}}
> >     LDFLAGS_FOR_BUILD=${LDFLAGS_FOR_BUILD-${LDFLAGS}}
> >   fi
> > -@@ -3387,6 +3389,8 @@ AC_SUBST(AR_FOR_BUILD)
> > +@@ -3402,6 +3404,8 @@ AC_SUBST(AR_FOR_BUILD)
> >   AC_SUBST(AS_FOR_BUILD)
> >   AC_SUBST(CC_FOR_BUILD)
> >   AC_SUBST(CFLAGS_FOR_BUILD)
> > @@ -171,11 +176,11 @@ Index: gcc-11.2.0/configure.ac
> >   AC_SUBST(CXXFLAGS_FOR_BUILD)
> >   AC_SUBST(CXX_FOR_BUILD)
> >   AC_SUBST(DLLTOOL_FOR_BUILD)
> > -Index: gcc-11.2.0/gcc/configure
> > -===================================================================
> > ---- gcc-11.2.0.orig/gcc/configure
> > -+++ gcc-11.2.0/gcc/configure
> > -@@ -12699,7 +12699,7 @@ else
> > +diff --git a/gcc/configure b/gcc/configure
> > +index ec3c24482df..31a460dc9d0 100755
> > +--- a/gcc/configure
> > ++++ b/gcc/configure
> > +@@ -12740,7 +12740,7 @@ else
> >         CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
> >         CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
> >         LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
> > @@ -184,11 +189,11 @@ Index: gcc-11.2.0/gcc/configure
> >         ${realsrcdir}/configure \
> >                 --enable-languages=${enable_languages-all} \
> >                 ${enable_obsolete+--enable-obsolete="$enable_obsolete"} \
> > -Index: gcc-11.2.0/gcc/configure.ac
> > -===================================================================
> > ---- gcc-11.2.0.orig/gcc/configure.ac
> > -+++ gcc-11.2.0/gcc/configure.ac
> > -@@ -2023,7 +2023,7 @@ else
> > +diff --git a/gcc/configure.ac b/gcc/configure.ac
> > +index ea794cd1763..b965eb036bc 100644
> > +--- a/gcc/configure.ac
> > ++++ b/gcc/configure.ac
> > +@@ -2054,7 +2054,7 @@ else
> >         CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
> >         CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
> >         LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
> > diff --git
> a/meta/recipes-devtools/gcc/gcc/0006-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch
> b/meta/recipes-devtools/gcc/gcc/0016-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch
> > similarity index 68%
> > rename from
> meta/recipes-devtools/gcc/gcc/0006-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch
> > rename to
> meta/recipes-devtools/gcc/gcc/0016-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch
> > index 98a1bb2a66..7f807a991c 100644
> > ---
> a/meta/recipes-devtools/gcc/gcc/0006-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch
> > +++
> b/meta/recipes-devtools/gcc/gcc/0016-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch
> > @@ -1,8 +1,8 @@
> > -From e700190743fa29ddaebd6ee075298a24b1688773 Mon Sep 17 00:00:00 2001
> > +From 2c2a92573598ddbc33c023fe5d499191491fb523 Mon Sep 17 00:00:00 2001
> >  From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >  Date: Thu, 28 Oct 2021 11:33:40 +0100
> > -Subject: [PATCH 6/6] If CXXFLAGS contains something unsupported by the
> build
> > - CXX, we see build failures (e.g. using -fmacro-prefix-map for the
> target).
> > +Subject: [PATCH] If CXXFLAGS contains something unsupported by the
> build CXX,
> > + we see build failures (e.g. using -fmacro-prefix-map for the target).
> >
> >  Pass CXXFLAGS_FOR_BUILD in a couple of places to avoid these errors.
> >
> > @@ -13,19 +13,20 @@ ChangeLog:
> >      * Makefile.in: Regenerate.
> >      * Makefile.tpl: Add missing CXXFLAGS_FOR_BUILD overrides
> >
> > +Upstream-Status: Pending [should be submittable]
> > +
> >  Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >  ---
> >   Makefile.in  | 2 ++
> >   Makefile.tpl | 2 ++
> >   2 files changed, 4 insertions(+)
> >
> > -Upstream-Status: Pending [should be submittable]
> > -
> > -Index: gcc-11.2.0/Makefile.in
> > -===================================================================
> > ---- gcc-11.2.0.orig/Makefile.in
> > -+++ gcc-11.2.0/Makefile.in
> > -@@ -172,6 +172,7 @@ BUILD_EXPORTS = \
> > +diff --git a/Makefile.in b/Makefile.in
> > +index 33476d53327..b949dffee0e 100644
> > +--- a/Makefile.in
> > ++++ b/Makefile.in
> > +@@ -176,6 +176,7 @@ BUILD_EXPORTS = \
> >   # built for the build system to override those in BASE_FLAGS_TO_PASS.
> >   EXTRA_BUILD_FLAGS = \
> >         CFLAGS="$(CFLAGS_FOR_BUILD)" \
> > @@ -33,19 +34,19 @@ Index: gcc-11.2.0/Makefile.in
> >         LDFLAGS="$(LDFLAGS_FOR_BUILD)"
> >
> >   # This is the list of directories to built for the host system.
> > -@@ -203,6 +204,7 @@ HOST_EXPORTS = \
> > +@@ -207,6 +208,7 @@ HOST_EXPORTS = \
> >         CPP_FOR_BUILD="$(CPP_FOR_BUILD)"; export CPP_FOR_BUILD; \
> >         CPPFLAGS_FOR_BUILD="$(CPPFLAGS_FOR_BUILD)"; export
> CPPFLAGS_FOR_BUILD; \
> >         CXX_FOR_BUILD="$(CXX_FOR_BUILD)"; export CXX_FOR_BUILD; \
> >  +      CXXFLAGS_FOR_BUILD="$(CXXFLAGS_FOR_BUILD)"; export
> CXXFLAGS_FOR_BUILD; \
> >         DLLTOOL="$(DLLTOOL)"; export DLLTOOL; \
> > +       DSYMUTIL="$(DSYMUTIL)"; export DSYMUTIL; \
> >         LD="$(LD)"; export LD; \
> > -       LDFLAGS="$(STAGE1_LDFLAGS) $(LDFLAGS)"; export LDFLAGS; \
> > -Index: gcc-11.2.0/Makefile.tpl
> > -===================================================================
> > ---- gcc-11.2.0.orig/Makefile.tpl
> > -+++ gcc-11.2.0/Makefile.tpl
> > -@@ -175,6 +175,7 @@ BUILD_EXPORTS = \
> > +diff --git a/Makefile.tpl b/Makefile.tpl
> > +index e39d85d1109..d8520cbb164 100644
> > +--- a/Makefile.tpl
> > ++++ b/Makefile.tpl
> > +@@ -179,6 +179,7 @@ BUILD_EXPORTS = \
> >   # built for the build system to override those in BASE_FLAGS_TO_PASS.
> >   EXTRA_BUILD_FLAGS = \
> >         CFLAGS="$(CFLAGS_FOR_BUILD)" \
> > @@ -53,11 +54,11 @@ Index: gcc-11.2.0/Makefile.tpl
> >         LDFLAGS="$(LDFLAGS_FOR_BUILD)"
> >
> >   # This is the list of directories to built for the host system.
> > -@@ -206,6 +207,7 @@ HOST_EXPORTS = \
> > +@@ -210,6 +211,7 @@ HOST_EXPORTS = \
> >         CPP_FOR_BUILD="$(CPP_FOR_BUILD)"; export CPP_FOR_BUILD; \
> >         CPPFLAGS_FOR_BUILD="$(CPPFLAGS_FOR_BUILD)"; export
> CPPFLAGS_FOR_BUILD; \
> >         CXX_FOR_BUILD="$(CXX_FOR_BUILD)"; export CXX_FOR_BUILD; \
> >  +      CXXFLAGS_FOR_BUILD="$(CXXFLAGS_FOR_BUILD)"; export
> CXXFLAGS_FOR_BUILD; \
> >         DLLTOOL="$(DLLTOOL)"; export DLLTOOL; \
> > +       DSYMUTIL="$(DSYMUTIL)"; export DSYMUTIL; \
> >         LD="$(LD)"; export LD; \
> > -       LDFLAGS="$(STAGE1_LDFLAGS) $(LDFLAGS)"; export LDFLAGS; \
> > diff --git
> a/meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-nativesdk-gcc.patch
> b/meta/recipes-devtools/gcc/gcc/0017-handle-sysroot-support-for-nativesdk-gcc.patch
> > similarity index 98%
> > rename from
> meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-nativesdk-gcc.patch
> > rename to
> meta/recipes-devtools/gcc/gcc/0017-handle-sysroot-support-for-nativesdk-gcc.patch
> > index b1054fa749..5d86e4c12d 100644
> > ---
> a/meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-nativesdk-gcc.patch
> > +++
> b/meta/recipes-devtools/gcc/gcc/0017-handle-sysroot-support-for-nativesdk-gcc.patch
> > @@ -1,4 +1,4 @@
> > -From 354682ad8f71f62643dcd83f64b51b5979615a0c Mon Sep 17 00:00:00 2001
> > +From 68802ca536b01ab21cfa58e11ef332e30d9a3c5e Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Mon, 7 Dec 2015 23:39:54 +0000
> >  Subject: [PATCH] handle sysroot support for nativesdk-gcc
> > @@ -46,10 +46,10 @@ Signed-off-by: Mark Hatle <
> mark.hatle@kernel.crashing.org>
> >   8 files changed, 94 insertions(+), 72 deletions(-)
> >
> >  diff --git a/gcc/c-family/c-opts.c b/gcc/c-family/c-opts.c
> > -index 89e05a4c551..5577383665d 100644
> > +index 6f001e0bb6c..55ab07c278f 100644
> >  --- a/gcc/c-family/c-opts.c
> >  +++ b/gcc/c-family/c-opts.c
> > -@@ -1436,8 +1436,8 @@ add_prefixed_path (const char *suffix,
> incpath_kind chain)
> > +@@ -1438,8 +1438,8 @@ add_prefixed_path (const char *suffix,
> incpath_kind chain)
> >     size_t prefix_len, suffix_len;
> >
> >     suffix_len = strlen (suffix);
> > @@ -378,7 +378,7 @@ index fd3c655db1c..20669ac427d 100644
> >      subdirectory of the actual installation.  */
> >   extern const char *gcc_exec_prefix;
> >  diff --git a/gcc/gcc.c b/gcc/gcc.c
> > -index 8737bae5353..aa6fbe43965 100644
> > +index bdee2671532..36e8af38630 100644
> >  --- a/gcc/gcc.c
> >  +++ b/gcc/gcc.c
> >  @@ -252,6 +252,8 @@ FILE *report_times_to_file = NULL;
> > @@ -398,7 +398,7 @@ index 8737bae5353..aa6fbe43965 100644
> >    %S     process STARTFILE_SPEC as a spec.  A capital S is actually
> used here.
> >    %E     process ENDFILE_SPEC as a spec.  A capital E is actually used
> here.
> >    %C     process CPP_SPEC as a spec.
> > -@@ -1621,10 +1624,10 @@ static const char *gcc_libexec_prefix;
> > +@@ -1620,10 +1623,10 @@ static const char *gcc_libexec_prefix;
> >      gcc_exec_prefix is set because, in that case, we know where the
> >      compiler has been installed, and use paths relative to that
> >      location instead.  */
> > @@ -413,7 +413,7 @@ index 8737bae5353..aa6fbe43965 100644
> >
> >   /* For native compilers, these are well-known paths containing
> >      components that may be provided by the system.  For cross
> > -@@ -1632,9 +1635,9 @@ static const char *const
> standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
> > +@@ -1631,9 +1634,9 @@ static const char *const
> standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
> >   static const char *md_exec_prefix = MD_EXEC_PREFIX;
> >   static const char *md_startfile_prefix = MD_STARTFILE_PREFIX;
> >   static const char *md_startfile_prefix_1 = MD_STARTFILE_PREFIX_1;
> > @@ -425,7 +425,7 @@ index 8737bae5353..aa6fbe43965 100644
> >     = STANDARD_STARTFILE_PREFIX_2;
> >
> >   /* A relative path to be used in finding the location of tools
> > -@@ -6564,6 +6567,11 @@ do_spec_1 (const char *spec, int inswitch, const
> char *soft_matched_part)
> > +@@ -6570,6 +6573,11 @@ do_spec_1 (const char *spec, int inswitch, const
> char *soft_matched_part)
> >               }
> >             break;
> >
> > diff --git
> a/meta/recipes-devtools/gcc/gcc/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
> b/meta/recipes-devtools/gcc/gcc/0018-Search-target-sysroot-gcc-version-specific-dirs-with.patch
> > similarity index 92%
> > rename from
> meta/recipes-devtools/gcc/gcc/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
> > rename to
> meta/recipes-devtools/gcc/gcc/0018-Search-target-sysroot-gcc-version-specific-dirs-with.patch
> > index ff622b1056..0f43e985cf 100644
> > ---
> a/meta/recipes-devtools/gcc/gcc/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
> > +++
> b/meta/recipes-devtools/gcc/gcc/0018-Search-target-sysroot-gcc-version-specific-dirs-with.patch
> > @@ -1,4 +1,4 @@
> > -From c55e24459370ad96577496ecd87475e3a9de7dad Mon Sep 17 00:00:00 2001
> > +From 14291076874b133e7fb67ef1714b768a2c48ea44 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Mon, 7 Dec 2015 23:41:45 +0000
> >  Subject: [PATCH] Search target sysroot gcc version specific dirs with
> > @@ -51,10 +51,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   1 file changed, 28 insertions(+), 1 deletion(-)
> >
> >  diff --git a/gcc/gcc.c b/gcc/gcc.c
> > -index aa6fbe43965..f8a71a13826 100644
> > +index 36e8af38630..d1faa788d60 100644
> >  --- a/gcc/gcc.c
> >  +++ b/gcc/gcc.c
> > -@@ -2811,7 +2811,7 @@ for_each_path (const struct path_prefix *paths,
> > +@@ -2810,7 +2810,7 @@ for_each_path (const struct path_prefix *paths,
> >         if (path == NULL)
> >         {
> >           len = paths->max_len + extra_space + 1;
> > @@ -63,7 +63,7 @@ index aa6fbe43965..f8a71a13826 100644
> >           path = XNEWVEC (char, len);
> >         }
> >
> > -@@ -2823,6 +2823,33 @@ for_each_path (const struct path_prefix *paths,
> > +@@ -2822,6 +2822,33 @@ for_each_path (const struct path_prefix *paths,
> >           /* Look first in MACHINE/VERSION subdirectory.  */
> >           if (!skip_multi_dir)
> >             {
> > diff --git
> a/meta/recipes-devtools/gcc/gcc/0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch
> b/meta/recipes-devtools/gcc/gcc/0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch
> > new file mode 100644
> > index 0000000000..76ebfd7f77
> > --- /dev/null
> > +++
> b/meta/recipes-devtools/gcc/gcc/0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch
> > @@ -0,0 +1,25 @@
> > +From 9ec4db8e910d9a51ae43f6b20d4bf1dac2d8cca8 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 2 Feb 2016 10:26:10 -0800
> > +Subject: [PATCH] nios2: Define MUSL_DYNAMIC_LINKER
> > +
> > +Upstream-Status: Backport [
> https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=e5ddbbf992b909d8e38851bd3179d29389e6ac97
> ]
> > +
> > +Signed-off-by: Marek Vasut <marex@denx.de>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + gcc/config/nios2/linux.h | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h
> > +index 08edf1521f6..15696d86241 100644
> > +--- a/gcc/config/nios2/linux.h
> > ++++ b/gcc/config/nios2/linux.h
> > +@@ -30,6 +30,7 @@
> > + #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
> > +
> > + #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-nios2.so.1"
> > ++#define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-nios2.so.1"
> > +
> > + #undef LINK_SPEC
> > + #define LINK_SPEC LINK_SPEC_ENDIAN \
> > diff --git
> a/meta/recipes-devtools/gcc/gcc/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
> b/meta/recipes-devtools/gcc/gcc/0020-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
> > similarity index 84%
> > rename from
> meta/recipes-devtools/gcc/gcc/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
> > rename to
> meta/recipes-devtools/gcc/gcc/0020-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
> > index 9c616d24d0..b82fa44537 100644
> > ---
> a/meta/recipes-devtools/gcc/gcc/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
> > +++
> b/meta/recipes-devtools/gcc/gcc/0020-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
> > @@ -1,4 +1,4 @@
> > -From 745a2ac7825c73102b888226c54397d21512f86b Mon Sep 17 00:00:00 2001
> > +From af72a47a677ce98c08cb73444bdd741ca8e28422 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Tue, 27 Jun 2017 18:10:54 -0700
> >  Subject: [PATCH] Add ssp_nonshared to link commandline for musl targets
> > @@ -22,9 +22,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   gcc/config/rs6000/linux64.h | 10 ++++++++++
> >   3 files changed, 27 insertions(+)
> >
> > +diff --git a/gcc/config/linux.h b/gcc/config/linux.h
> > +index ba02c013e30..8fcaa0c9faf 100644
> >  --- a/gcc/config/linux.h
> >  +++ b/gcc/config/linux.h
> > -@@ -203,6 +203,13 @@ see the files COPYING3 and COPYING.RUNTI
> > +@@ -203,6 +203,13 @@ see the files COPYING3 and COPYING.RUNTIME
> respectively.  If not, see
> >       { GCC_INCLUDE_DIRVAR, "GCC", 0, 1, 0, 0 },                \
> >       { 0, 0, 0, 0, 0, 0 }                              \
> >     }
> > @@ -38,6 +40,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   #endif
> >
> >   #if (DEFAULT_LIBC == LIBC_UCLIBC) && defined (SINGLE_LIBC) /* uClinux
> */
> > +diff --git a/gcc/config/rs6000/linux.h b/gcc/config/rs6000/linux.h
> > +index 47c9d9ac0b6..d065f88b377 100644
> >  --- a/gcc/config/rs6000/linux.h
> >  +++ b/gcc/config/rs6000/linux.h
> >  @@ -94,6 +94,16 @@
> > @@ -57,6 +61,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   #undef LINK_OS_LINUX_SPEC
> >   #define LINK_OS_LINUX_SPEC LINK_OS_LINUX_EMUL " %{!shared: %{!static: \
> >     %{!static-pie: \
> > +diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
> > +index a11e01faa3d..ce464f3626b 100644
> >  --- a/gcc/config/rs6000/linux64.h
> >  +++ b/gcc/config/rs6000/linux64.h
> >  @@ -369,6 +369,16 @@ extern int dot_symbols;
> > diff --git
> a/meta/recipes-devtools/gcc/gcc/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> b/meta/recipes-devtools/gcc/gcc/0021-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> > similarity index 93%
> > rename from
> meta/recipes-devtools/gcc/gcc/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> > rename to
> meta/recipes-devtools/gcc/gcc/0021-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> > index b74aeb8bb6..9b7c5c5642 100644
> > ---
> a/meta/recipes-devtools/gcc/gcc/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> > +++
> b/meta/recipes-devtools/gcc/gcc/0021-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> > @@ -1,4 +1,4 @@
> > -From 695adb4dffb23c6f5cbc757e05cf4187a2bd6528 Mon Sep 17 00:00:00 2001
> > +From 79a568dec47baa264eb6290fed3df3244450a92e Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Wed, 4 May 2016 21:11:34 -0700
> >  Subject: [PATCH] Link libgcc using LDFLAGS, not just SHLIB_LDFLAGS
> > diff --git
> a/meta/recipes-devtools/gcc/gcc/0030-sync-gcc-stddef.h-with-musl.patch
> b/meta/recipes-devtools/gcc/gcc/0022-sync-gcc-stddef.h-with-musl.patch
> > similarity index 97%
> > rename from
> meta/recipes-devtools/gcc/gcc/0030-sync-gcc-stddef.h-with-musl.patch
> > rename to
> meta/recipes-devtools/gcc/gcc/0022-sync-gcc-stddef.h-with-musl.patch
> > index fd7d604e98..86fb22ffd3 100644
> > ---
> a/meta/recipes-devtools/gcc/gcc/0030-sync-gcc-stddef.h-with-musl.patch
> > +++
> b/meta/recipes-devtools/gcc/gcc/0022-sync-gcc-stddef.h-with-musl.patch
> > @@ -1,4 +1,4 @@
> > -From a9173429ae256c4b4a3ab4d758a6adf42f8c4239 Mon Sep 17 00:00:00 2001
> > +From 07a06aa8e8285c1bb06d0bebeaa9ad04eb76f2e2 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Fri, 3 Feb 2017 12:56:00 -0800
> >  Subject: [PATCH] sync gcc stddef.h with musl
> > diff --git
> a/meta/recipes-devtools/gcc/gcc/0033-Re-introduce-spe-commandline-options.patch
> b/meta/recipes-devtools/gcc/gcc/0023-Re-introduce-spe-commandline-options.patch
> > similarity index 90%
> > rename from
> meta/recipes-devtools/gcc/gcc/0033-Re-introduce-spe-commandline-options.patch
> > rename to
> meta/recipes-devtools/gcc/gcc/0023-Re-introduce-spe-commandline-options.patch
> > index 129f555a48..23cf02a6e4 100644
> > ---
> a/meta/recipes-devtools/gcc/gcc/0033-Re-introduce-spe-commandline-options.patch
> > +++
> b/meta/recipes-devtools/gcc/gcc/0023-Re-introduce-spe-commandline-options.patch
> > @@ -1,4 +1,4 @@
> > -From 0b900d6410b7c1938e86eceb87b032fd538566a9 Mon Sep 17 00:00:00 2001
> > +From ca73043041c3c7aa86af9a3d4f316abc87eb3254 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Wed, 6 Jun 2018 12:10:22 -0700
> >  Subject: [PATCH] Re-introduce spe commandline options
> > @@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   1 file changed, 13 insertions(+)
> >
> >  diff --git a/gcc/config/rs6000/rs6000.opt b/gcc/config/rs6000/rs6000.opt
> > -index 0dbdf753673..b273eb65c35 100644
> > +index 6b0a3e27529..1bd2e356ac9 100644
> >  --- a/gcc/config/rs6000/rs6000.opt
> >  +++ b/gcc/config/rs6000/rs6000.opt
> >  @@ -352,6 +352,19 @@ mdebug=
> > diff --git
> a/meta/recipes-devtools/gcc/gcc/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
> b/meta/recipes-devtools/gcc/gcc/0024-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
> > similarity index 94%
> > rename from
> meta/recipes-devtools/gcc/gcc/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
> > rename to
> meta/recipes-devtools/gcc/gcc/0024-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
> > index 3f666dc7bd..f915f284ea 100644
> > ---
> a/meta/recipes-devtools/gcc/gcc/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
> > +++
> b/meta/recipes-devtools/gcc/gcc/0024-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
> > @@ -1,4 +1,4 @@
> > -From ea9154338cb3acbd75945fddde4202e73c20dd1a Mon Sep 17 00:00:00 2001
> > +From b3957bc1fd52ec427a1b71b10055905cab4bbc7c Mon Sep 17 00:00:00 2001
> >  From: Szabolcs Nagy <nsz@port70.net>
> >  Date: Sat, 24 Oct 2015 20:09:53 +0000
> >  Subject: [PATCH] libgcc_s: Use alias for __cpu_indicator_init instead of
> > @@ -39,10 +39,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   3 files changed, 6 insertions(+), 6 deletions(-)
> >
> >  diff --git a/gcc/config/i386/i386-expand.c
> b/gcc/config/i386/i386-expand.c
> > -index ac69eed4d32..ffaa44a16fc 100644
> > +index 31eae75d277..ec7e858ec83 100644
> >  --- a/gcc/config/i386/i386-expand.c
> >  +++ b/gcc/config/i386/i386-expand.c
> > -@@ -11038,10 +11038,10 @@ ix86_expand_builtin (tree exp, rtx target,
> rtx subtarget,
> > +@@ -11066,10 +11066,10 @@ ix86_expand_builtin (tree exp, rtx target,
> rtx subtarget,
> >       {
> >       case IX86_BUILTIN_CPU_INIT:
> >         {
> > diff --git
> a/meta/recipes-devtools/gcc/gcc/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
> b/meta/recipes-devtools/gcc/gcc/0025-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
> > similarity index 98%
> > rename from
> meta/recipes-devtools/gcc/gcc/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
> > rename to
> meta/recipes-devtools/gcc/gcc/0025-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
> > index 874cd7798d..f33193ebcf 100644
> > ---
> a/meta/recipes-devtools/gcc/gcc/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
> > +++
> b/meta/recipes-devtools/gcc/gcc/0025-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
> > @@ -1,4 +1,4 @@
> > -From 520411cf364ee4b0b5a8f0857498aaabd790afb3 Mon Sep 17 00:00:00 2001
> > +From 5fd90d243ae14034a4699443110070dafc0d4d30 Mon Sep 17 00:00:00 2001
> >  From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >  Date: Tue, 10 Mar 2020 08:26:53 -0700
> >  Subject: [PATCH] gentypes/genmodes: Do not use __LINE__ for maintaining
> > @@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   2 files changed, 19 insertions(+), 19 deletions(-)
> >
> >  diff --git a/gcc/gengtype.c b/gcc/gengtype.c
> > -index 5f50242e857..cbaca9b8cd0 100644
> > +index 98d4626f87e..f602da8b501 100644
> >  --- a/gcc/gengtype.c
> >  +++ b/gcc/gengtype.c
> >  @@ -991,7 +991,7 @@ create_field_at (pair_p next, type_p type, const
> char *name, options_p opt,
> > diff --git
> a/meta/recipes-devtools/gcc/gcc/0036-mingw32-Enable-operation_not_supported.patch
> b/meta/recipes-devtools/gcc/gcc/0026-mingw32-Enable-operation_not_supported.patch
> > similarity index 93%
> > rename from
> meta/recipes-devtools/gcc/gcc/0036-mingw32-Enable-operation_not_supported.patch
> > rename to
> meta/recipes-devtools/gcc/gcc/0026-mingw32-Enable-operation_not_supported.patch
> > index 3a7618c820..b46bde1eda 100644
> > ---
> a/meta/recipes-devtools/gcc/gcc/0036-mingw32-Enable-operation_not_supported.patch
> > +++
> b/meta/recipes-devtools/gcc/gcc/0026-mingw32-Enable-operation_not_supported.patch
> > @@ -1,4 +1,4 @@
> > -From 96d895c8d5dc895d24fe37aa2b4f201a2566b4cc Mon Sep 17 00:00:00 2001
> > +From 7bc34769f0b055e25286576e4ba6d211e8159834 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Tue, 12 May 2020 10:39:09 -0700
> >  Subject: [PATCH] mingw32: Enable operation_not_supported
> > diff --git
> a/meta/recipes-devtools/gcc/gcc/0037-libatomic-Do-not-enforce-march-on-aarch64.patch
> b/meta/recipes-devtools/gcc/gcc/0027-libatomic-Do-not-enforce-march-on-aarch64.patch
> > similarity index 85%
> > rename from
> meta/recipes-devtools/gcc/gcc/0037-libatomic-Do-not-enforce-march-on-aarch64.patch
> > rename to
> meta/recipes-devtools/gcc/gcc/0027-libatomic-Do-not-enforce-march-on-aarch64.patch
> > index 4c9a79cb64..85b1251482 100644
> > ---
> a/meta/recipes-devtools/gcc/gcc/0037-libatomic-Do-not-enforce-march-on-aarch64.patch
> > +++
> b/meta/recipes-devtools/gcc/gcc/0027-libatomic-Do-not-enforce-march-on-aarch64.patch
> > @@ -1,4 +1,4 @@
> > -From 36d4fdbc99e69f9d70a29e2bada40cc3c1534557 Mon Sep 17 00:00:00 2001
> > +From df1c63bbd7a520e8c6d0d0692b4d8bff56952394 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Wed, 13 May 2020 15:10:38 -0700
> >  Subject: [PATCH] libatomic: Do not enforce march on aarch64
> > @@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   2 files changed, 2 deletions(-)
> >
> >  diff --git a/libatomic/Makefile.am b/libatomic/Makefile.am
> > -index 0f3cd6f7121..c8124c1d5aa 100644
> > +index ab8c2da24a1..f614a46b34d 100644
> >  --- a/libatomic/Makefile.am
> >  +++ b/libatomic/Makefile.am
> >  @@ -125,7 +125,6 @@ libatomic_la_LIBADD = $(foreach
> s,$(SIZES),$(addsuffix _$(s)_.lo,$(SIZEOBJS)))
> > @@ -29,14 +29,14 @@ index 0f3cd6f7121..c8124c1d5aa 100644
> >   endif
> >   if ARCH_ARM_LINUX
> >  diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
> > -index 0a51bd55f01..6d5b1581706 100644
> > +index 80d25653dc7..7377689ab34 100644
> >  --- a/libatomic/Makefile.in
> >  +++ b/libatomic/Makefile.in
> > -@@ -432,7 +432,6 @@ M_SRC = $(firstword $(filter %/$(M_FILE),
> $(all_c_files)))
> > +@@ -434,7 +434,6 @@ M_SRC = $(firstword $(filter %/$(M_FILE),
> $(all_c_files)))
> >   libatomic_la_LIBADD = $(foreach s,$(SIZES),$(addsuffix \
> >         _$(s)_.lo,$(SIZEOBJS))) $(am__append_1) $(am__append_2) \
> >         $(am__append_3) $(am__append_4)
> >  -@ARCH_AARCH64_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS =
> -march=armv8-a+lse
> >   @ARCH_ARM_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS =
> -march=armv7-a+fp -DHAVE_KERNEL64
> >   @ARCH_I386_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=i586
> > - @ARCH_X86_64_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -mcx16
> > + @ARCH_X86_64_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -mcx16 -mcx16
> > diff --git
> a/meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
> b/meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
> > deleted file mode 100644
> > index 97c271373b..0000000000
> > ---
> a/meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
> > +++ /dev/null
> > @@ -1,31 +0,0 @@
> > -From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > -Subject: [PATCH 4/5] gcc/nios2: Define the musl linker
> > -
> > -Add a definition of the musl linker used on the nios2 platform.
> > -
> > -2021-10-26 Richard Purdie <richard.purdie@linuxfoundation.org>
> > -
> > -gcc/ChangeLog:
> > -
> > -    * config/nios2/linux.h (MUSL_DYNAMIC_LINKER): Add musl linker
> > -
> > -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > -
> > -Submitted [
> https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582723.html]
> > -Upstream-Status: Backport [
> https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=e5ddbbf992b909d8e38851bd3179d29389e6ac97
> ]
> > ----
> > - gcc/config/nios2/linux.h | 1 +
> > - 1 file changed, 1 insertion(+)
> > -
> > -Index: gcc-11.2.0/gcc/config/nios2/linux.h
> > -===================================================================
> > ---- gcc-11.2.0.orig/gcc/config/nios2/linux.h
> > -+++ gcc-11.2.0/gcc/config/nios2/linux.h
> > -@@ -30,6 +30,7 @@
> > - #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
> > -
> > - #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-nios2.so.1"
> > -+#define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-nios2.so.1"
> > -
> > - #undef LINK_SPEC
> > - #define LINK_SPEC LINK_SPEC_ENDIAN \
> > diff --git
> a/meta/recipes-devtools/gcc/gcc/0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch
> b/meta/recipes-devtools/gcc/gcc/0028-debug-101473-apply-debug-prefix-maps-before-checksum.patch
> > similarity index 81%
> > rename from
> meta/recipes-devtools/gcc/gcc/0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch
> > rename to
> meta/recipes-devtools/gcc/gcc/0028-debug-101473-apply-debug-prefix-maps-before-checksum.patch
> > index c8dcd74b9d..de06793482 100644
> > ---
> a/meta/recipes-devtools/gcc/gcc/0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch
> > +++
> b/meta/recipes-devtools/gcc/gcc/0028-debug-101473-apply-debug-prefix-maps-before-checksum.patch
> > @@ -1,7 +1,8 @@
> > -From 7cc2df084b7977653a9b59cbc34a9ad500ae619c Mon Sep 17 00:00:00 2001
> > +From 49008eeedc97014f44e12afe179d3785e4438372 Mon Sep 17 00:00:00 2001
> >  From: Richard Biener <rguenther@suse.de>
> >  Date: Tue, 20 Jul 2021 11:00:33 +0200
> > -Subject: [PATCH] debug/101473 - apply debug prefix maps before
> checksumming DIEs
> > +Subject: [PATCH] debug/101473 - apply debug prefix maps before
> checksumming
> > + DIEs
> >
> >  The following makes sure to apply the debug prefix maps to filenames
> >  before checksumming DIEs to create the global symbol for the CU DIE
> > @@ -36,10 +37,15 @@ The upstream patch was modified to compensate for
> the definition of
> >  this version of gcc.
> >
> >  Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >  ---
> > -diff -urpN a/gcc/dwarf2out.c b/gcc/dwarf2out.c
> > ---- a/gcc/dwarf2out.c  2021-04-27 06:00:13.000000000 -0400
> > -+++ b/gcc/dwarf2out.c  2021-07-23 16:40:06.141886167 -0400
> > + gcc/dwarf2out.c | 13 +++++++------
> > + 1 file changed, 7 insertions(+), 6 deletions(-)
> > +
> > +diff --git a/gcc/dwarf2out.c b/gcc/dwarf2out.c
> > +index e5d3ce4966d..41ac3008507 100644
> > +--- a/gcc/dwarf2out.c
> > ++++ b/gcc/dwarf2out.c
> >  @@ -1283,6 +1283,7 @@ dwarf2out_switch_text_section (void)
> >
> >   /* Data about a single source file.  */
> > @@ -48,7 +54,7 @@ diff -urpN a/gcc/dwarf2out.c b/gcc/dwarf2out.c
> >     const char * filename;
> >     int emitted_number;
> >   };
> > -@@ -12334,7 +12335,7 @@ file_name_acquire (dwarf_file_data **slo
> > +@@ -12335,7 +12336,7 @@ file_name_acquire (dwarf_file_data **slot,
> file_name_acquire_data *fnad)
> >
> >     fi = fnad->files + fnad->used_files++;
> >
> > @@ -57,7 +63,7 @@ diff -urpN a/gcc/dwarf2out.c b/gcc/dwarf2out.c
> >
> >     /* Skip all leading "./".  */
> >     while (f[0] == '.' && IS_DIR_SEPARATOR (f[1]))
> > -@@ -27231,13 +27232,13 @@ dwarf2out_ignore_block (const_tree block
> > +@@ -27259,13 +27260,13 @@ dwarf2out_ignore_block (const_tree block)
> >   bool
> >   dwarf_file_hasher::equal (dwarf_file_data *p1, const char *p2)
> >   {
> > @@ -73,7 +79,7 @@ diff -urpN a/gcc/dwarf2out.c b/gcc/dwarf2out.c
> >   }
> >
> >   /* Lookup FILE_NAME (in the list of filenames that we know about here
> in
> > -@@ -27267,7 +27268,8 @@ lookup_filename (const char *file_name)
> > +@@ -27295,7 +27296,8 @@ lookup_filename (const char *file_name)
> >       return *slot;
> >
> >     created = ggc_alloc<dwarf_file_data> ();
> > @@ -83,7 +89,7 @@ diff -urpN a/gcc/dwarf2out.c b/gcc/dwarf2out.c
> >     created->emitted_number = 0;
> >     *slot = created;
> >     return created;
> > -@@ -27293,8 +27295,7 @@ maybe_emit_file (struct dwarf_file_data
> > +@@ -27321,8 +27323,7 @@ maybe_emit_file (struct dwarf_file_data * fd)
> >         if (output_asm_line_debug_info ())
> >         {
> >           fprintf (asm_out_file, "\t.file %u ", fd->emitted_number);
> > diff --git
> a/meta/recipes-devtools/gcc/gcc/0001-Fix-install-path-of-linux64.h.patch
> b/meta/recipes-devtools/gcc/gcc/0029-Fix-install-path-of-linux64.h.patch
> > similarity index 81%
> > rename from
> meta/recipes-devtools/gcc/gcc/0001-Fix-install-path-of-linux64.h.patch
> > rename to
> meta/recipes-devtools/gcc/gcc/0029-Fix-install-path-of-linux64.h.patch
> > index 5bf895d6e7..d7e156e7a3 100644
> > ---
> a/meta/recipes-devtools/gcc/gcc/0001-Fix-install-path-of-linux64.h.patch
> > +++
> b/meta/recipes-devtools/gcc/gcc/0029-Fix-install-path-of-linux64.h.patch
> > @@ -1,4 +1,4 @@
> > -From 58211c7ceb0510b2a11a7f1da3c7fa968c658749 Mon Sep 17 00:00:00 2001
> > +From 8a62cc0a64670e39f462c1dbbf82e04d2f03b89e Mon Sep 17 00:00:00 2001
> >  From: Andrei Gherzan <andrei.gherzan@huawei.com>
> >  Date: Wed, 22 Dec 2021 12:49:25 +0100
> >  Subject: [PATCH] Fix install path of linux64.h
> > @@ -11,15 +11,16 @@ adapts the install path of linux64.h to match the
> include in tm.h.
> >  Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> >
> >  Upstream-Status: Inappropriate [configuration]
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >  ---
> >   gcc/Makefile.in | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> >  diff --git a/gcc/Makefile.in b/gcc/Makefile.in
> > -index 9b17d120a..d175ec4e3 100644
> > +index 06eb0d27a28..a8678ca24ed 100644
> >  --- a/gcc/Makefile.in
> >  +++ b/gcc/Makefile.in
> > -@@ -3693,6 +3693,8 @@ install-plugin: installdirs lang.install-plugin
> s-header-vars install-gengtype
> > +@@ -3686,6 +3686,8 @@ install-plugin: installdirs lang.install-plugin
> s-header-vars install-gengtype
> >           "$(srcdir)"/config/* | "$(srcdir)"/common/config/* \
> >           | "$(srcdir)"/c-family/* | "$(srcdir)"/*.def ) \
> >             base=`echo "$$path" | sed -e "s|$$srcdirstrip/||"`;; \
> > @@ -28,6 +29,3 @@ index 9b17d120a..d175ec4e3 100644
> >           *) base=`basename $$path` ;; \
> >           esac; \
> >           dest=$(plugin_includedir)/$$base; \
> > ---
> > -2.25.1
> > -
> > diff --git
> a/meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.patch
> b/meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.patch
> > deleted file mode 100644
> > index 3fb9ee98de..0000000000
> > --- a/meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.patch
> > +++ /dev/null
> > @@ -1,23 +0,0 @@
> > -The patch is needed in order to support recent glibc (2.34).
> > -
> > -Upstream-Status: Backport [
> https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=91f8a7a34cf29ae7c465603a801326767f1cc7e9
> ]
> > -
> > -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > -
> > ----
> > ---- a/libsanitizer/sanitizer_common/sanitizer_posix_libcdep.cpp
> 2022-03-15 07:59:54.515325204 -0700
> > -+++ b/libsanitizer/sanitizer_common/sanitizer_posix_libcdep.cpp
> 2022-03-15 08:01:45.919405931 -0700
> > -@@ -166,9 +166,10 @@
> > - #if !SANITIZER_GO
> > - // TODO(glider): different tools may require different altstack size.
> > - static uptr GetAltStackSize() {
> > --  // SIGSTKSZ is not enough.
> > --  static const uptr kAltStackSize = SIGSTKSZ * 4;
> > --  return kAltStackSize;
> > -+  // Note: since GLIBC_2.31, SIGSTKSZ may be a function call, so this
> may be
> > -+  // more costly that you think. However GetAltStackSize is only call
> 2-3 times
> > -+  // per thread so don't cache the evaluation.
> > -+  return SIGSTKSZ * 4;
> > - }
> > -
> > - void SetAlternateSignalStack() {
> > diff --git a/meta/recipes-devtools/gcc/gcc_11.2.bb
> b/meta/recipes-devtools/gcc/gcc_11.3.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/gcc/gcc_11.2.bb
> > rename to meta/recipes-devtools/gcc/gcc_11.3.bb
> > diff --git a/meta/recipes-devtools/gcc/libgcc-initial_11.2.bb
> b/meta/recipes-devtools/gcc/libgcc-initial_11.3.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/gcc/libgcc-initial_11.2.bb
> > rename to meta/recipes-devtools/gcc/libgcc-initial_11.3.bb
> > diff --git a/meta/recipes-devtools/gcc/libgcc_11.2.bb
> b/meta/recipes-devtools/gcc/libgcc_11.3.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/gcc/libgcc_11.2.bb
> > rename to meta/recipes-devtools/gcc/libgcc_11.3.bb
> > diff --git a/meta/recipes-devtools/gcc/libgfortran_11.2.bb
> b/meta/recipes-devtools/gcc/libgfortran_11.3.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/gcc/libgfortran_11.2.bb
> > rename to meta/recipes-devtools/gcc/libgfortran_11.3.bb
> > --
> > 2.35.1
> >
>

--00000000000082d81805e0601872
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">As discussed on IRC yesterday I&#39;ve tried to reproduce =
this failure locally and it works fine with poky master=C2=A0cee443ae75f (l=
ast commit in master before the upgrade to 12.1)<div>2022-06-01 09:46:37,05=
1 - oe-selftest - INFO - RESULTS - reproducible.ReproducibleTests.test_repr=
oducible_builds: PASSED (6429.19s)<br></div><div>and now it passed with kir=
kstone as well:</div><div><br></div><div>poky $ git cherry-pick 44a36caa7c2=
<br>Auto-merging meta/conf/distro/include/maintainers.inc<br>[jansa/kirksto=
ne-gcc-11.3 5c6e280eed5] gcc: Upgrade to 11.3 release<br></div><div>...</di=
v><div>poky $ oe-selftest -r reproducible 2&gt;&amp;1 | tee log.oe-selftest=
.reproducible.kirkstone<br>2022-06-01 09:51:31,653 - oe-selftest - INFO - C=
hanging cwd to /OE/build/poky/build<br>2022-06-01 09:51:31,653 - oe-selftes=
t - INFO - Adding layer libraries:<br>2022-06-01 09:51:31,653 - oe-selftest=
 - INFO - =C2=A0/OE/build/poky/meta-poky/lib<br>2022-06-01 09:51:31,653 - o=
e-selftest - INFO - =C2=A0/OE/build/poky/meta/lib<br>2022-06-01 09:51:31,65=
4 - oe-selftest - INFO - =C2=A0/OE/build/poky/meta-yocto-bsp/lib<br>2022-06=
-01 09:51:31,654 - oe-selftest - INFO - =C2=A0/OE/build/poky/meta-selftest/=
lib<br>2022-06-01 09:51:31,655 - oe-selftest - INFO - Running bitbake -e to=
 test the configuration is valid/parsable<br>hint: Using &#39;master&#39; a=
s the name for the initial branch. This default branch name<br>hint: is sub=
ject to change. To configure the initial branch name to use in all<br>hint:=
 of your new repositories, which will suppress this warning, call:<br>hint:=
<br>hint: =C2=A0 git config --global init.defaultBranch &lt;name&gt;<br>hin=
t:<br>hint: Names commonly chosen instead of &#39;master&#39; are &#39;main=
&#39;, &#39;trunk&#39; and<br>hint: &#39;development&#39;. The just-created=
 branch can be renamed via this command:<br>hint:<br>hint: =C2=A0 git branc=
h -m &lt;name&gt;<br>2022-06-01 09:51:37,091 - oe-selftest - INFO - Adding:=
 &quot;include selftest.inc&quot; in /OE/build/poky/build-st/conf/local.con=
f<br>2022-06-01 09:51:37,091 - oe-selftest - INFO - Adding: &quot;include b=
blayers.inc&quot; in bblayers.conf<br>2022-06-01 09:51:37,092 - oe-selftest=
 - INFO - test_diffoscope (reproducible.DiffoscopeTests)<br>2022-06-01 10:0=
8:42,982 - oe-selftest - INFO - =C2=A0... ok<br>2022-06-01 10:08:42,983 - o=
e-selftest - INFO - test_reproducible_builds (reproducible.ReproducibleTest=
s)<br>2022-06-01 10:09:56,114 - oe-selftest - INFO - Building reproducibleA=
 (sstate allowed)...<br>^Ap2022-06-01 11:11:09,785 - oe-selftest - INFO - B=
uilding reproducibleB (sstate NOT allowed)...<br>2022-06-01 11:55:00,507 - =
oe-selftest - INFO - Checking deb packages for differences...<br>2022-06-01=
 11:55:00,946 - oe-selftest - INFO - Reproducibility summary for deb: same=
=3D139 different=3D0 different_excluded=3D0 missing=3D0 total=3D139<br>unus=
ed_exclusions=3D[]<br>2022-06-01 11:55:00,946 - oe-selftest - INFO - Checki=
ng ipk packages for differences...<br>2022-06-01 11:55:01,330 - oe-selftest=
 - INFO - Reproducibility summary for ipk: same=3D139 different=3D0 differe=
nt_excluded=3D0 missing=3D0 total=3D139<br>unused_exclusions=3D[]<br>2022-0=
6-01 11:55:01,331 - oe-selftest - INFO - Checking rpm packages for differen=
ces...<br>2022-06-01 11:55:01,760 - oe-selftest - INFO - Reproducibility su=
mmary for rpm: same=3D139 different=3D0 different_excluded=3D0 missing=3D0 =
total=3D139<br>unused_exclusions=3D[]<br>2022-06-01 11:55:01,760 - oe-selft=
est - INFO - =C2=A0... ok<br>2022-06-01 11:56:29,573 - oe-selftest - INFO -=
 ----------------------------------------------------------------------<br>=
2022-06-01 11:56:29,573 - oe-selftest - INFO - Ran 2 tests in 7495.224s<br>=
2022-06-01 11:56:29,573 - oe-selftest - INFO - OK<br>2022-06-01 11:56:31,72=
3 - oe-selftest - INFO - RESULTS:<br>2022-06-01 11:56:31,724 - oe-selftest =
- INFO - RESULTS - reproducible.DiffoscopeTests.test_diffoscope: PASSED (10=
25.89s)<br>2022-06-01 11:56:31,724 - oe-selftest - INFO - RESULTS - reprodu=
cible.ReproducibleTests.test_reproducible_builds: PASSED (6378.78s)<br>2022=
-06-01 11:56:31,881 - oe-selftest - INFO - SUMMARY:<br>2022-06-01 11:56:31,=
881 - oe-selftest - INFO - oe-selftest () - Ran 2 tests in 7495.225s<br>202=
2-06-01 11:56:31,881 - oe-selftest - INFO - oe-selftest - OK - All required=
 tests passed (successes=3D2, skipped=3D0, failures=3D0, errors=3D0)<br></d=
iv><div><br></div><div>Is it possible that the reproducibility failure was =
caused by something else included in your run on autobuilder?</div><div><br=
></div><div>Cheers,</div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Mon, May 30, 2022 at 1:42 AM Steve Sakoman &lt;=
<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, May 25, 2022 =
at 8:49 AM Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" targe=
t=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bl=
ank">raj.khem@gmail.com</a>&gt;<br>
&gt;<br>
&gt; This is a bugfix release on gcc-11 series, fixes 189 bugs [1]<br>
&gt; Drop backported patches already included in 11.3 release<br>
<br>
This is causing a reproducibility error in my autobuilder testing for<br>
webkit-gtk.=C2=A0 I&#39;ve tried multiple builds with and without the patch=
 and<br>
the failure is repeatable.<br>
<br>
Sadly diffoscope blows up due to the size of webkit-gtk, so it isn&#39;t<br=
>
easy to see exactly what differs. I&#39;ve downloaded the a and b build<br>
artifacts to my local machine and have determined that the webkit-gtk<br>
.so file is what differs.<br>
<br>
Initial investigation with objdump seems to indicate the issue is in<br>
one or more of the .debug_* sections of the .so<br>
<br>
I&#39;ll dig in a bit further on Tuesday (it&#39;s a long holiday weekend h=
ere<br>
in the US) and will let you know what I find.<br>
<br>
Steve<br>
<br>
<br>
&gt; [1] <a href=3D"https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DR=
ESOLVED&amp;resolution=3DFIXED&amp;target_milestone=3D11.3" rel=3D"noreferr=
er" target=3D"_blank">https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=
=3DRESOLVED&amp;resolution=3DFIXED&amp;target_milestone=3D11.3</a><br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@bootl=
in.com" target=3D"_blank">luca.ceresoli@bootlin.com</a>&gt;<br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../gcc/{gcc-11.2.inc =3D&gt; gcc-11.3.inc}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 66 ++--<br>
&gt;=C2=A0 ...<a href=3D"http://ian_11.2.bb" rel=3D"noreferrer" target=3D"_=
blank">ian_11.2.bb</a> =3D&gt; <a href=3D"http://gcc-cross-canadian_11.3.bb=
" rel=3D"noreferrer" target=3D"_blank">gcc-cross-canadian_11.3.bb</a>} |=C2=
=A0 =C2=A00<br>
&gt;=C2=A0 .../{<a href=3D"http://gcc-cross_11.2.bb" rel=3D"noreferrer" tar=
get=3D"_blank">gcc-cross_11.2.bb</a> =3D&gt; <a href=3D"http://gcc-cross_11=
.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross_11.3.bb</a>}=C2=A0 |=
=C2=A0 =C2=A00<br>
&gt;=C2=A0 ...-<a href=3D"http://crosssdk_11.2.bb" rel=3D"noreferrer" targe=
t=3D"_blank">crosssdk_11.2.bb</a> =3D&gt; <a href=3D"http://gcc-crosssdk_11=
.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk_11.3.bb</a>} |=C2=
=A0 =C2=A00<br>
&gt;=C2=A0 ...<a href=3D"http://cc-runtime_11.2.bb" rel=3D"noreferrer" targ=
et=3D"_blank">cc-runtime_11.2.bb</a> =3D&gt; <a href=3D"http://gcc-runtime_=
11.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-runtime_11.3.bb</a>} |=C2=
=A0 =C2=A00<br>
&gt;=C2=A0 ...<a href=3D"http://itizers_11.2.bb" rel=3D"noreferrer" target=
=3D"_blank">itizers_11.2.bb</a> =3D&gt; <a href=3D"http://gcc-sanitizers_11=
.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-sanitizers_11.3.bb</a>} |=
=C2=A0 =C2=A00<br>
&gt;=C2=A0 ...{<a href=3D"http://gcc-source_11.2.bb" rel=3D"noreferrer" tar=
get=3D"_blank">gcc-source_11.2.bb</a> =3D&gt; <a href=3D"http://gcc-source_=
11.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-source_11.3.bb</a>} |=C2=
=A0 =C2=A00<br>
&gt;=C2=A0 .../gcc/gcc/0001-CVE-2021-35465.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 138 --------<br>
&gt;=C2=A0 ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |=C2=A0 10 +-<br>
&gt;=C2=A0 .../gcc/gcc/0002-CVE-2021-35465.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 39 ---<br>
&gt;=C2=A0 .../0002-gcc-poison-system-directories.patch=C2=A0 |=C2=A0 26 +-=
<br>
&gt;=C2=A0 ....patch =3D&gt; 0003-64-bit-multilib-hack.patch} |=C2=A0 =C2=
=A02 +-<br>
&gt;=C2=A0 .../gcc/gcc/0003-CVE-2021-35465.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 103 ------<br>
&gt;=C2=A0 .../gcc/gcc/0004-CVE-2021-35465.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 304 ------------------<br>
&gt;=C2=A0 ...s.h-in-B-instead-of-S-and-t-oe-in-B.patch} |=C2=A0 12 +-<br>
&gt;=C2=A0 .../gcc/gcc/0005-cpp-honor-sysroot.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 53 +++<br>
&gt;=C2=A0 ...MIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch} | 101 +++---<br>
&gt;=C2=A0 ...gcc-Fix-argument-list-too-long-error.patch |=C2=A0 42 +++<br>
&gt;=C2=A0 ...{0014-libtool.patch =3D&gt; 0008-libtool.patch} |=C2=A0 =C2=
=A02 +-<br>
&gt;=C2=A0 .../gcc/gcc/0009-cpp-honor-sysroot.patch=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 59 ----<br>
&gt;=C2=A0 ...-fix-v4bx-to-linker-to-support-EABI.patch} |=C2=A0 =C2=A02 +-=
<br>
&gt;=C2=A0 ...config-files-from-B-instead-of-usin.patch} |=C2=A0 14 +-<br>
&gt;=C2=A0 ...r-from-.la-which-usually-points-to-.patch} |=C2=A0 =C2=A02 +-=
<br>
&gt;=C2=A0 ...-target-gcc-headers-can-be-included.patch} |=C2=A0 =C2=A06 +-=
<br>
&gt;=C2=A0 ...gcc-Fix-argument-list-too-long-error.patch |=C2=A0 38 ---<br>
&gt;=C2=A0 ...-directory-during-relink-if-inst_pr.patch} |=C2=A0 =C2=A02 +-=
<br>
&gt;=C2=A0 ...fix-libcc1-s-install-path-and-rpath.patch} |=C2=A0 =C2=A08 +-=
<br>
&gt;=C2=A0 ...e-build-CPP-CPPFLAGS-is-used-for-bu.patch} |=C2=A0 89 ++---<b=
r>
&gt;=C2=A0 ...ins-something-unsupported-by-the-bu.patch} |=C2=A0 39 +--<br>
&gt;=C2=A0 ...e-sysroot-support-for-nativesdk-gcc.patch} |=C2=A0 14 +-<br>
&gt;=C2=A0 ...root-gcc-version-specific-dirs-with.patch} |=C2=A0 =C2=A08 +-=
<br>
&gt;=C2=A0 ...019-nios2-Define-MUSL_DYNAMIC_LINKER.patch |=C2=A0 25 ++<br>
&gt;=C2=A0 ...-to-link-commandline-for-musl-targe.patch} |=C2=A0 10 +-<br>
&gt;=C2=A0 ...sing-LDFLAGS-not-just-SHLIB_LDFLAGS.patch} |=C2=A0 =C2=A02 +-=
<br>
&gt;=C2=A0 ...=3D&gt; 0022-sync-gcc-stddef.h-with-musl.patch} |=C2=A0 =C2=
=A02 +-<br>
&gt;=C2=A0 ...e-introduce-spe-commandline-options.patch} |=C2=A0 =C2=A04 +-=
<br>
&gt;=C2=A0 ...s-for-__cpu_indicator_init-instead-.patch} |=C2=A0 =C2=A06 +-=
<br>
&gt;=C2=A0 ...-Do-not-use-__LINE__-for-maintainin.patch} |=C2=A0 =C2=A04 +-=
<br>
&gt;=C2=A0 ...gw32-Enable-operation_not_supported.patch} |=C2=A0 =C2=A02 +-=
<br>
&gt;=C2=A0 ...mic-Do-not-enforce-march-on-aarch64.patch} |=C2=A0 10 +-<br>
&gt;=C2=A0 ...027-nios2-Define-MUSL_DYNAMIC_LINKER.patch |=C2=A0 31 --<br>
&gt;=C2=A0 ...y-debug-prefix-maps-before-checksum.patch} |=C2=A0 24 +-<br>
&gt;=C2=A0 ... 0029-Fix-install-path-of-linux64.h.patch} |=C2=A0 10 +-<br>
&gt;=C2=A0 .../gcc/0042-Fix-thread-stack-size-init.patch |=C2=A0 23 --<br>
&gt;=C2=A0 .../gcc/{<a href=3D"http://gcc_11.2.bb" rel=3D"noreferrer" targe=
t=3D"_blank">gcc_11.2.bb</a> =3D&gt; <a href=3D"http://gcc_11.3.bb" rel=3D"=
noreferrer" target=3D"_blank">gcc_11.3.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A00<br>
&gt;=C2=A0 ...<a href=3D"http://initial_11.2.bb" rel=3D"noreferrer" target=
=3D"_blank">initial_11.2.bb</a> =3D&gt; <a href=3D"http://libgcc-initial_11=
.3.bb" rel=3D"noreferrer" target=3D"_blank">libgcc-initial_11.3.bb</a>} |=
=C2=A0 =C2=A00<br>
&gt;=C2=A0 .../gcc/{<a href=3D"http://libgcc_11.2.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">libgcc_11.2.bb</a> =3D&gt; <a href=3D"http://libgcc_11.3.bb=
" rel=3D"noreferrer" target=3D"_blank">libgcc_11.3.bb</a>}=C2=A0 =C2=A0 |=
=C2=A0 =C2=A00<br>
&gt;=C2=A0 ...<a href=3D"http://ibgfortran_11.2.bb" rel=3D"noreferrer" targ=
et=3D"_blank">ibgfortran_11.2.bb</a> =3D&gt; <a href=3D"http://libgfortran_=
11.3.bb" rel=3D"noreferrer" target=3D"_blank">libgfortran_11.3.bb</a>} |=C2=
=A0 =C2=A00<br>
&gt;=C2=A0 49 files changed, 372 insertions(+), 962 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/{gcc-11.2.inc =3D&gt; gcc-11.3.=
inc} (58%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-cross-ca=
nadian_11.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-canadian_11.=
2.bb</a> =3D&gt; <a href=3D"http://gcc-cross-canadian_11.3.bb" rel=3D"noref=
errer" target=3D"_blank">gcc-cross-canadian_11.3.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-cross_11=
.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross_11.2.bb</a> =3D&gt; <=
a href=3D"http://gcc-cross_11.3.bb" rel=3D"noreferrer" target=3D"_blank">gc=
c-cross_11.3.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-crosssdk=
_11.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk_11.2.bb</a> =3D=
&gt; <a href=3D"http://gcc-crosssdk_11.3.bb" rel=3D"noreferrer" target=3D"_=
blank">gcc-crosssdk_11.3.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-runtime_=
11.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-runtime_11.2.bb</a> =3D&g=
t; <a href=3D"http://gcc-runtime_11.3.bb" rel=3D"noreferrer" target=3D"_bla=
nk">gcc-runtime_11.3.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-sanitize=
rs_11.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-sanitizers_11.2.bb</a>=
 =3D&gt; <a href=3D"http://gcc-sanitizers_11.3.bb" rel=3D"noreferrer" targe=
t=3D"_blank">gcc-sanitizers_11.3.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc-source_1=
1.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-source_11.2.bb</a> =3D&gt;=
 <a href=3D"http://gcc-source_11.3.bb" rel=3D"noreferrer" target=3D"_blank"=
>gcc-source_11.3.bb</a>} (100%)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-CVE-2021-3=
5465.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc/0002-CVE-2021-3=
5465.patch<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/gcc/{0004-64-bit-multilib-hack.=
patch =3D&gt; 0003-64-bit-multilib-hack.patch} (99%)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc/0003-CVE-2021-3=
5465.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc/0004-CVE-2021-3=
5465.patch<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/gcc/{0007-Use-the-defaults.h-in=
-B-instead-of-S-and-t-oe-in-B.patch =3D&gt; 0004-Use-the-defaults.h-in-B-in=
stead-of-S-and-t-oe-in-B.patch} (91%)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc/0005-cpp-honor-=
sysroot.patch<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/gcc/{0011-Define-GLIBC_DYNAMIC_=
LINKER-and-UCLIBC_DYNAMIC_LINKE.patch =3D&gt; 0006-Define-GLIBC_DYNAMIC_LIN=
KER-and-UCLIBC_DYNAMIC_LINKE.patch} (81%)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc/0007-gcc-Fix-ar=
gument-list-too-long-error.patch<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/gcc/{0014-libtool.patch =3D&gt;=
 0008-libtool.patch} (94%)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc/0009-cpp-honor-=
sysroot.patch<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/gcc/{0015-gcc-armv4-pass-fix-v4=
bx-to-linker-to-support-EABI.patch =3D&gt; 0009-gcc-armv4-pass-fix-v4bx-to-=
linker-to-support-EABI.patch} (95%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/gcc/{0016-Use-the-multilib-conf=
ig-files-from-B-instead-of-usin.patch =3D&gt; 0010-Use-the-multilib-config-=
files-from-B-instead-of-usin.patch} (89%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/gcc/{0017-Avoid-using-libdir-fr=
om-.la-which-usually-points-to-.patch =3D&gt; 0011-Avoid-using-libdir-from-=
.la-which-usually-points-to-.patch} (92%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/gcc/{0019-Ensure-target-gcc-hea=
ders-can-be-included.patch =3D&gt; 0012-Ensure-target-gcc-headers-can-be-in=
cluded.patch} (96%)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-ar=
gument-list-too-long-error.patch<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/gcc/{0020-Don-t-search-host-dir=
ectory-during-relink-if-inst_pr.patch =3D&gt; 0013-Don-t-search-host-direct=
ory-during-relink-if-inst_pr.patch} (93%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/gcc/{0023-libcc1-fix-libcc1-s-i=
nstall-path-and-rpath.patch =3D&gt; 0014-libcc1-fix-libcc1-s-install-path-a=
nd-rpath.patch} (90%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/gcc/{0018-export-CPP.patch =3D&=
gt; 0015-Makefile.in-Ensure-build-CPP-CPPFLAGS-is-used-for-bu.patch} (79%)<=
br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/gcc/{0006-If-CXXFLAGS-contains-=
something-unsupported-by-the-bu.patch =3D&gt; 0016-If-CXXFLAGS-contains-som=
ething-unsupported-by-the-bu.patch} (68%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/gcc/{0024-handle-sysroot-suppor=
t-for-nativesdk-gcc.patch =3D&gt; 0017-handle-sysroot-support-for-nativesdk=
-gcc.patch} (98%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/gcc/{0025-Search-target-sysroot=
-gcc-version-specific-dirs-with.patch =3D&gt; 0018-Search-target-sysroot-gc=
c-version-specific-dirs-with.patch} (92%)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/gcc/gcc/0019-nios2-Defi=
ne-MUSL_DYNAMIC_LINKER.patch<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/gcc/{0028-Add-ssp_nonshared-to-=
link-commandline-for-musl-targe.patch =3D&gt; 0020-Add-ssp_nonshared-to-lin=
k-commandline-for-musl-targe.patch} (84%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/gcc/{0029-Link-libgcc-using-LDF=
LAGS-not-just-SHLIB_LDFLAGS.patch =3D&gt; 0021-Link-libgcc-using-LDFLAGS-no=
t-just-SHLIB_LDFLAGS.patch} (93%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/gcc/{0030-sync-gcc-stddef.h-wit=
h-musl.patch =3D&gt; 0022-sync-gcc-stddef.h-with-musl.patch} (97%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/gcc/{0033-Re-introduce-spe-comm=
andline-options.patch =3D&gt; 0023-Re-introduce-spe-commandline-options.pat=
ch} (90%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/gcc/{0034-libgcc_s-Use-alias-fo=
r-__cpu_indicator_init-instead-.patch =3D&gt; 0024-libgcc_s-Use-alias-for-_=
_cpu_indicator_init-instead-.patch} (94%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/gcc/{0035-gentypes-genmodes-Do-=
not-use-__LINE__-for-maintainin.patch =3D&gt; 0025-gentypes-genmodes-Do-not=
-use-__LINE__-for-maintainin.patch} (98%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/gcc/{0036-mingw32-Enable-operat=
ion_not_supported.patch =3D&gt; 0026-mingw32-Enable-operation_not_supported=
.patch} (93%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/gcc/{0037-libatomic-Do-not-enfo=
rce-march-on-aarch64.patch =3D&gt; 0027-libatomic-Do-not-enforce-march-on-a=
arch64.patch} (85%)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc/0027-nios2-Defi=
ne-MUSL_DYNAMIC_LINKER.patch<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/gcc/{0041-apply-debug-prefix-ma=
ps-before-checksumming-DIEs.patch =3D&gt; 0028-debug-101473-apply-debug-pre=
fix-maps-before-checksum.patch} (81%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/gcc/{0001-Fix-install-path-of-l=
inux64.h.patch =3D&gt; 0029-Fix-install-path-of-linux64.h.patch} (81%)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/gcc/gcc/0042-Fix-thread=
-stack-size-init.patch<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/{<a href=3D"http://gcc_11.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">gcc_11.2.bb</a> =3D&gt; <a href=3D"ht=
tp://gcc_11.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc_11.3.bb</a>} (10=
0%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/{<a href=3D"http://libgcc-initi=
al_11.2.bb" rel=3D"noreferrer" target=3D"_blank">libgcc-initial_11.2.bb</a>=
 =3D&gt; <a href=3D"http://libgcc-initial_11.3.bb" rel=3D"noreferrer" targe=
t=3D"_blank">libgcc-initial_11.3.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/{<a href=3D"http://libgcc_11.2.=
bb" rel=3D"noreferrer" target=3D"_blank">libgcc_11.2.bb</a> =3D&gt; <a href=
=3D"http://libgcc_11.3.bb" rel=3D"noreferrer" target=3D"_blank">libgcc_11.3=
.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/gcc/{<a href=3D"http://libgfortran_=
11.2.bb" rel=3D"noreferrer" target=3D"_blank">libgfortran_11.2.bb</a> =3D&g=
t; <a href=3D"http://libgfortran_11.3.bb" rel=3D"noreferrer" target=3D"_bla=
nk">libgfortran_11.3.bb</a>} (100%)<br>
&gt;<br>
&gt; diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/dist=
ro/include/maintainers.inc<br>
&gt; index 2c5e730827..0a1897fc92 100644<br>
&gt; --- a/meta/conf/distro/include/maintainers.inc<br>
&gt; +++ b/meta/conf/distro/include/maintainers.inc<br>
&gt; @@ -189,7 +189,7 @@ RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLAT=
ED_TARGET_ARCH} =3D &quot;Khem Raj &lt;r<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} =3D &quot;Khem Raj =
&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.=
com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-gcc-runtime =3D &quot;Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-gcc-sanitizers =3D &quot;Khem Raj &lt;<a hr=
ef=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&g=
t;&quot;<br>
&gt; -RECIPE_MAINTAINER:pn-gcc-source-11.2.0 =3D &quot;Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
&quot;<br>
&gt; +RECIPE_MAINTAINER:pn-gcc-source-11.3.0 =3D &quot;Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-gconf =3D &quot;Ross Burton &lt;<a href=3D"=
mailto:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.com</a>&gt;&q=
uot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-gcr =3D &quot;Alexander Kanavin &lt;<a href=
=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com=
</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER:pn-gdb =3D &quot;Khem Raj &lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&quot;<br=
>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-dev=
tools/gcc/gcc-11.3.inc<br>
&gt; similarity index 58%<br>
&gt; rename from meta/recipes-devtools/gcc/gcc-11.2.inc<br>
&gt; rename to meta/recipes-devtools/gcc/gcc-11.3.inc<br>
&gt; index 68e0d203fc..b1ef9d25af 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc-11.2.inc<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc-11.3.inc<br>
&gt; @@ -2,11 +2,11 @@ require gcc-common.inc<br>
&gt;<br>
&gt;=C2=A0 # Third digit in PV should be incremented after a minor release<=
br>
&gt;<br>
&gt; -PV =3D &quot;11.2.0&quot;<br>
&gt; +PV =3D &quot;11.3.0&quot;<br>
&gt;<br>
&gt;=C2=A0 # BINV should be incremented to a revision after a minor gcc rel=
ease<br>
&gt;<br>
&gt; -BINV =3D &quot;11.2.0&quot;<br>
&gt; +BINV =3D &quot;11.3.0&quot;<br>
&gt;<br>
&gt;=C2=A0 FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/g=
cc/backport:&quot;<br>
&gt;<br>
&gt; @@ -32,45 +32,41 @@ SRC_URI =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${BASEURI} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-gcc-4.3.1-A=
RCH_FLAGS_FOR_TARGET.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-gcc-poison-=
system-directories.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-64-bit-multilib-=
hack.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0007-Use-the-defaults=
.h-in-B-instead-of-S-and-t-oe-in-B.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0009-cpp-honor-sysroo=
t.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0011-Define-GLIBC_DYN=
AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0012-gcc-Fix-argument=
-list-too-long-error.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0014-libtool.patch \<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0015-gcc-armv4-pass-f=
ix-v4bx-to-linker-to-support-EABI.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0016-Use-the-multilib=
-config-files-from-B-instead-of-usin.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0017-Avoid-using-libd=
ir-from-.la-which-usually-points-to-.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0018-export-CPP.patch=
 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0019-Ensure-target-gc=
c-headers-can-be-included.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0020-Don-t-search-hos=
t-directory-during-relink-if-inst_pr.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0023-libcc1-fix-libcc=
1-s-install-path-and-rpath.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0024-handle-sysroot-s=
upport-for-nativesdk-gcc.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0025-Search-target-sy=
sroot-gcc-version-specific-dirs-with.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0027-nios2-Define-MUS=
L_DYNAMIC_LINKER.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0028-Add-ssp_nonshare=
d-to-link-commandline-for-musl-targe.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0029-Link-libgcc-usin=
g-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0030-sync-gcc-stddef.=
h-with-musl.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0033-Re-introduce-spe=
-commandline-options.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0034-libgcc_s-Use-ali=
as-for-__cpu_indicator_init-instead-.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0035-gentypes-genmode=
s-Do-not-use-__LINE__-for-maintainin.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0036-mingw32-Enable-o=
peration_not_supported.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0037-libatomic-Do-not=
-enforce-march-on-aarch64.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0041-apply-debug-pref=
ix-maps-before-checksumming-DIEs.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-If-CXXFLAGS-cont=
ains-something-unsupported-by-the-bu.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-install-path=
-of-linux64.h.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-CVE-2021-35465.p=
atch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-CVE-2021-35465.p=
atch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-CVE-2021-35465.p=
atch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-CVE-2021-35465.p=
atch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-64-bit-multilib-=
hack.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-Use-the-defaults=
.h-in-B-instead-of-S-and-t-oe-in-B.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-cpp-honor-sysroo=
t.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-Define-GLIBC_DYN=
AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0007-gcc-Fix-argument=
-list-too-long-error.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0008-libtool.patch \<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0009-gcc-armv4-pass-f=
ix-v4bx-to-linker-to-support-EABI.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0010-Use-the-multilib=
-config-files-from-B-instead-of-usin.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0011-Avoid-using-libd=
ir-from-.la-which-usually-points-to-.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0012-Ensure-target-gc=
c-headers-can-be-included.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0013-Don-t-search-hos=
t-directory-during-relink-if-inst_pr.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0014-libcc1-fix-libcc=
1-s-install-path-and-rpath.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0015-Makefile.in-Ensu=
re-build-CPP-CPPFLAGS-is-used-for-bu.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0016-If-CXXFLAGS-cont=
ains-something-unsupported-by-the-bu.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0017-handle-sysroot-s=
upport-for-nativesdk-gcc.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0018-Search-target-sy=
sroot-gcc-version-specific-dirs-with.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0019-nios2-Define-MUS=
L_DYNAMIC_LINKER.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0020-Add-ssp_nonshare=
d-to-link-commandline-for-musl-targe.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0021-Link-libgcc-usin=
g-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0022-sync-gcc-stddef.=
h-with-musl.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0023-Re-introduce-spe=
-commandline-options.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0024-libgcc_s-Use-ali=
as-for-__cpu_indicator_init-instead-.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0025-gentypes-genmode=
s-Do-not-use-__LINE__-for-maintainin.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0026-mingw32-Enable-o=
peration_not_supported.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0027-libatomic-Do-not=
-enforce-march-on-aarch64.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0028-debug-101473-app=
ly-debug-prefix-maps-before-checksum.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0029-Fix-install-path=
-of-linux64.h.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-CVE-2021-42=
574.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-CVE-2021-42=
574.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-CVE-2021-42=
574.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-CVE-2021-42=
574.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-CVE-2021-46=
195.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0042-Fix-thread-stack=
-size-init.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;d08edc536b54c372a1010ff6619dd274c0f1603a=
a49212ba20f7aa2cda36fa8b&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;b47cf2818691f5b1e21df2bb38c795fac2cfbd64=
0ede2d0a5e1c89e338a3ac39&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}&quot=
;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-can=
adian_11.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-canadian_11.2=
.bb</a> b/meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-canadian_11=
.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-canadian_11.3.bb</a><=
br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-cana=
dian_11.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-canadian_11.2.=
bb</a><br>
&gt; rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross-canadi=
an_11.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-canadian_11.3.bb=
</a><br>
&gt; diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross_11.=
2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross_11.2.bb</a> b/meta/rec=
ipes-devtools/gcc/<a href=3D"http://gcc-cross_11.3.bb" rel=3D"noreferrer" t=
arget=3D"_blank">gcc-cross_11.3.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross_11.2=
.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross_11.2.bb</a><br>
&gt; rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-cross_11.3.b=
b" rel=3D"noreferrer" target=3D"_blank">gcc-cross_11.3.bb</a><br>
&gt; diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk_=
11.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk_11.2.bb</a> b/me=
ta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk_11.3.bb" rel=3D"nore=
ferrer" target=3D"_blank">gcc-crosssdk_11.3.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk_1=
1.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk_11.2.bb</a><br>
&gt; rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-crosssdk_11.=
3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk_11.3.bb</a><br>
&gt; diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-runtime_1=
1.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-runtime_11.2.bb</a> b/meta=
/recipes-devtools/gcc/<a href=3D"http://gcc-runtime_11.3.bb" rel=3D"norefer=
rer" target=3D"_blank">gcc-runtime_11.3.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-runtime_11=
.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-runtime_11.2.bb</a><br>
&gt; rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-runtime_11.3=
.bb" rel=3D"noreferrer" target=3D"_blank">gcc-runtime_11.3.bb</a><br>
&gt; diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-sanitizer=
s_11.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-sanitizers_11.2.bb</a> =
b/meta/recipes-devtools/gcc/<a href=3D"http://gcc-sanitizers_11.3.bb" rel=
=3D"noreferrer" target=3D"_blank">gcc-sanitizers_11.3.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-sanitizers=
_11.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-sanitizers_11.2.bb</a><b=
r>
&gt; rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-sanitizers_1=
1.3.bb" rel=3D"noreferrer" target=3D"_blank">gcc-sanitizers_11.3.bb</a><br>
&gt; diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc-source_11=
.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-source_11.2.bb</a> b/meta/r=
ecipes-devtools/gcc/<a href=3D"http://gcc-source_11.3.bb" rel=3D"noreferrer=
" target=3D"_blank">gcc-source_11.3.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc-source_11.=
2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-source_11.2.bb</a><br>
&gt; rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc-source_11.3.=
bb" rel=3D"noreferrer" target=3D"_blank">gcc-source_11.3.bb</a><br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.patch b=
/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.patch<br>
&gt; deleted file mode 100644<br>
&gt; index e4aee10e37..0000000000<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,138 +0,0 @@<br>
&gt; -From 3929bca9ca95de9d35e82ae8828b188029e3eb70 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Richard Earnshaw &lt;<a href=3D"mailto:rearnsha@arm.com" target=
=3D"_blank">rearnsha@arm.com</a>&gt;<br>
&gt; -Date: Fri, 11 Jun 2021 16:02:05 +0100<br>
&gt; -Subject: [PATCH] arm: Add command-line option for enabling CVE-2021-3=
5465<br>
&gt; - mitigation [PR102035]<br>
&gt; -<br>
&gt; -Add a new option, -mfix-cmse-cve-2021-35465 and document it.=C2=A0 En=
able it<br>
&gt; -automatically for cortex-m33, cortex-m35p and cortex-m55.<br>
&gt; -<br>
&gt; -gcc:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0PR target/102035<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/arm/arm.opt (mfix-cmse-cve-2021-3=
5465): New option.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0* doc/invoke.texi (Arm Options): Document =
it.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/arm/<a href=3D"http://arm-cpus.in=
" rel=3D"noreferrer" target=3D"_blank">arm-cpus.in</a> (quirk_vlldm): New f=
eature bit.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0(ALL_QUIRKS): Add quirk_vlldm.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0(cortex-m33): Add quirk_vlldm.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0(cortex-m35p, cortex-m55): Likewise.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/arm/arm.c (arm_option_override): =
Enable fix_vlldm if<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0targetting an affected CPU and not explici=
tly controlled on<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0the command line.<br>
&gt; -<br>
&gt; -CVE: CVE-2021-35465<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://gcc.gnu.org/git/gitweb.=
cgi?p=3Dgcc.git;h=3D3929bca9ca95de9d35e82ae8828b188029e3eb70" rel=3D"norefe=
rrer" target=3D"_blank">https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.git;h=3D=
3929bca9ca95de9d35e82ae8828b188029e3eb70</a>]<br>
&gt; -Signed-off-by: Pgowda &lt;<a href=3D"mailto:pgowda.cve@gmail.com" tar=
get=3D"_blank">pgowda.cve@gmail.com</a>&gt;<br>
&gt; -<br>
&gt; ----<br>
&gt; - gcc/config/arm/<a href=3D"http://arm-cpus.in" rel=3D"noreferrer" tar=
get=3D"_blank">arm-cpus.in</a> | 9 +++++++--<br>
&gt; - gcc/config/arm/arm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 9 +++++++++<br>
&gt; - gcc/config/arm/arm.opt=C2=A0 =C2=A0 =C2=A0| 4 ++++<br>
&gt; - gcc/doc/invoke.texi=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 9 +++++++++<br>
&gt; - 4 files changed, 29 insertions(+), 2 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/gcc/config/arm/arm.c b/gcc/config/arm/arm.c<br>
&gt; ---- a/gcc/config/arm/arm.c=C2=A0 =C2=A0 =C2=A02021-11-15 02:13:11.100=
579812 -0800<br>
&gt; -+++ b/gcc/config/arm/arm.c=C2=A0 =C2=A0 =C2=A02021-11-15 02:17:36.988=
237692 -0800<br>
&gt; -@@ -3610,6 +3610,15 @@ arm_option_override (void)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0fix_cm3_ldrd =3D 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -+=C2=A0 /* Enable fix_vlldm by default if required.=C2=A0 */<br>
&gt; -+=C2=A0 if (fix_vlldm =3D=3D 2)<br>
&gt; -+=C2=A0 =C2=A0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 if (bitmap_bit_p (arm_active_target.isa, isa_bi=
t_quirk_vlldm))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 fix_vlldm =3D 1;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 else<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 fix_vlldm =3D 0;<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0/* Hot/Cold partitioning is not currently supported, sin=
ce we can&#39;t<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 handle literal pool placement in that case.=C2=
=A0 */<br>
&gt; -=C2=A0 =C2=A0if (flag_reorder_blocks_and_partition)<br>
&gt; -diff --git a/gcc/config/arm/<a href=3D"http://arm-cpus.in" rel=3D"nor=
eferrer" target=3D"_blank">arm-cpus.in</a> b/gcc/config/arm/<a href=3D"http=
://arm-cpus.in" rel=3D"noreferrer" target=3D"_blank">arm-cpus.in</a><br>
&gt; ---- a/gcc/config/arm/<a href=3D"http://arm-cpus.in" rel=3D"noreferrer=
" target=3D"_blank">arm-cpus.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A02021-11-15 02=
:13:11.104579747 -0800<br>
&gt; -+++ b/gcc/config/arm/<a href=3D"http://arm-cpus.in" rel=3D"noreferrer=
" target=3D"_blank">arm-cpus.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A02021-11-15 02=
:17:36.984237757 -0800<br>
&gt; -@@ -186,6 +186,9 @@ define feature quirk_armv6kz<br>
&gt; - # Cortex-M3 LDRD quirk.<br>
&gt; - define feature quirk_cm3_ldrd<br>
&gt; -<br>
&gt; -+# v8-m/v8.1-m VLLDM errata.<br>
&gt; -+define feature quirk_vlldm<br>
&gt; -+<br>
&gt; - # Don&#39;t use .cpu assembly directive<br>
&gt; - define feature quirk_no_asmcpu<br>
&gt; -<br>
&gt; -@@ -322,7 +325,7 @@ define implied vfp_base MVE MVE_FP ALL_F<br>
&gt; - # architectures.<br>
&gt; - # xscale isn&#39;t really a &#39;quirk&#39;, but it isn&#39;t an arc=
hitecture either and we<br>
&gt; - # need to ignore it for matching purposes.<br>
&gt; --define fgroup ALL_QUIRKS=C2=A0 =C2=A0quirk_no_volatile_ce quirk_armv=
6kz quirk_cm3_ldrd xscale quirk_no_asmcpu<br>
&gt; -+define fgroup ALL_QUIRKS=C2=A0 =C2=A0quirk_no_volatile_ce quirk_armv=
6kz quirk_cm3_ldrd quirk_vlldm xscale quirk_no_asmcpu<br>
&gt; -<br>
&gt; - define fgroup IGNORE_FOR_MULTILIB cdecp0 cdecp1 cdecp2 cdecp3 cdecp4=
 cdecp5 cdecp6 cdecp7<br>
&gt; -<br>
&gt; -@@ -1570,6 +1573,7 @@ begin cpu cortex-m33<br>
&gt; -=C2=A0 architecture armv8-m.main+dsp+fp<br>
&gt; -=C2=A0 option nofp remove ALL_FP<br>
&gt; -=C2=A0 option nodsp remove armv7em<br>
&gt; -+ isa quirk_vlldm<br>
&gt; -=C2=A0 costs v7m<br>
&gt; - end cpu cortex-m33<br>
&gt; -<br>
&gt; -@@ -1579,6 +1583,7 @@ begin cpu cortex-m35p<br>
&gt; -=C2=A0 architecture armv8-m.main+dsp+fp<br>
&gt; -=C2=A0 option nofp remove ALL_FP<br>
&gt; -=C2=A0 option nodsp remove armv7em<br>
&gt; -+ isa quirk_vlldm<br>
&gt; -=C2=A0 costs v7m<br>
&gt; - end cpu cortex-m35p<br>
&gt; -<br>
&gt; -@@ -1590,7 +1595,7 @@ begin cpu cortex-m55<br>
&gt; -=C2=A0 option nomve remove mve mve_float<br>
&gt; -=C2=A0 option nofp remove ALL_FP mve_float<br>
&gt; -=C2=A0 option nodsp remove MVE mve_float<br>
&gt; -- isa quirk_no_asmcpu<br>
&gt; -+ isa quirk_no_asmcpu quirk_vlldm<br>
&gt; -=C2=A0 costs v7m<br>
&gt; -=C2=A0 vendor 41<br>
&gt; - end cpu cortex-m55<br>
&gt; -diff --git a/gcc/config/arm/arm.opt b/gcc/config/arm/arm.opt<br>
&gt; ---- a/gcc/config/arm/arm.opt=C2=A0 =C2=A02021-11-15 02:13:11.10457974=
7 -0800<br>
&gt; -+++ b/gcc/config/arm/arm.opt=C2=A0 =C2=A02021-11-15 02:17:36.98823769=
2 -0800<br>
&gt; -@@ -268,6 +268,10 @@ Target Var(fix_cm3_ldrd) Init(2)<br>
&gt; - Avoid overlapping destination and address registers on LDRD instruct=
ions<br>
&gt; - that may trigger Cortex-M3 errata.<br>
&gt; -<br>
&gt; -+mfix-cmse-cve-2021-35465<br>
&gt; -+Target Var(fix_vlldm) Init(2)<br>
&gt; -+Mitigate issues with VLLDM on some M-profile devices (CVE-2021-35465=
).<br>
&gt; -+<br>
&gt; - munaligned-access<br>
&gt; - Target Var(unaligned_access) Init(2) Save<br>
&gt; - Enable unaligned word and halfword accesses to packed data.<br>
&gt; -diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi<br>
&gt; ---- a/gcc/doc/invoke.texi=C2=A0 =C2=A0 =C2=A0 2021-11-15 02:13:11.112=
579616 -0800<br>
&gt; -+++ b/gcc/doc/invoke.texi=C2=A0 =C2=A0 =C2=A0 2021-11-15 02:17:36.996=
237562 -0800<br>
&gt; -@@ -804,6 +804,7 @@ Objective-C and Objective-C++ Dialects}.<br>
&gt; - -mverbose-cost-dump @gol<br>
&gt; - -mpure-code @gol<br>
&gt; - -mcmse @gol<br>
&gt; -+-mfix-cmse-cve-2021-35465 @gol<br>
&gt; - -mfdpic}<br>
&gt; -<br>
&gt; - @emph{AVR Options}<br>
&gt; -@@ -20487,6 +20488,14 @@ Generate secure code as per the &quot;ARMv8-=
M<br>
&gt; - Development Tools Engineering Specification&quot;, which can be foun=
d on<br>
&gt; - @url{<a href=3D"https://developer.arm.com/documentation/ecm0359818/l=
atest/" rel=3D"noreferrer" target=3D"_blank">https://developer.arm.com/docu=
mentation/ecm0359818/latest/</a>}.<br>
&gt; -<br>
&gt; -+@item -mfix-cmse-cve-2021-35465<br>
&gt; -+@opindex mfix-cmse-cve-2021-35465<br>
&gt; -+Mitigate against a potential security issue with the @code{VLLDM} in=
struction<br>
&gt; -+in some M-profile devices when using CMSE (CVE-2021-365465).=C2=A0 T=
his option is<br>
&gt; -+enabled by default when the option @option{-mcpu=3D} is used with<br=
>
&gt; -+@code{cortex-m33}, @code{cortex-m35p} or @code{cortex-m55}.=C2=A0 Th=
e option<br>
&gt; -+@option{-mno-fix-cmse-cve-2021-35465} can be used to disable the mit=
igation.<br>
&gt; -+<br>
&gt; - @item -mfdpic<br>
&gt; - @itemx -mno-fdpic<br>
&gt; - @opindex mfdpic<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_F=
OR_TARGET.patch b/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_F=
OR_TARGET.patch<br>
&gt; index 0a108ee51b..0bf8834bb2 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARG=
ET.patch<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARG=
ET.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 368eaf1846733a9920c7cf5bc547a377e7167785 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 6badb97389cae4ff9a533d38dc7cceefe21b97a8 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Fri, 29 Mar 2013 08:37:11 +0400<br>
&gt;=C2=A0 Subject: [PATCH] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET<br>
&gt; @@ -12,10 +12,10 @@ Upstream-Status: Inappropriate [embedded specific]=
<br>
&gt;=C2=A0 =C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/configure b/configure<br>
&gt; -index 504f6410274..bcebad264ec 100755<br>
&gt; +index e218a19e333..45744e6e471 100755<br>
&gt;=C2=A0 --- a/configure<br>
&gt;=C2=A0 +++ b/configure<br>
&gt; -@@ -9728,7 +9728,7 @@ fi<br>
&gt; +@@ -9750,7 +9750,7 @@ fi<br>
&gt;=C2=A0 =C2=A0# for target_alias and gcc doesn&#39;t manage it consisten=
tly.<br>
&gt;=C2=A0 =C2=A0target_configargs=3D&quot;--cache-file=3D./config.cache ${=
target_configargs}&quot;<br>
&gt;<br>
&gt; @@ -25,10 +25,10 @@ index 504f6410274..bcebad264ec 100755<br>
&gt;=C2=A0 =C2=A0 *&quot; newlib &quot;*)<br>
&gt;=C2=A0 =C2=A0 =C2=A0case &quot; $target_configargs &quot; in<br>
&gt;=C2=A0 diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" =
target=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D=
"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt; -index 088e735c5db..1289fe08760 100644<br>
&gt; +index 7e8e628b325..bf66b51373c 100644<br>
&gt;=C2=A0 --- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
&gt;=C2=A0 +++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
&gt; -@@ -3240,7 +3240,7 @@ fi<br>
&gt; +@@ -3255,7 +3255,7 @@ fi<br>
&gt;=C2=A0 =C2=A0# for target_alias and gcc doesn&#39;t manage it consisten=
tly.<br>
&gt;=C2=A0 =C2=A0target_configargs=3D&quot;--cache-file=3D./config.cache ${=
target_configargs}&quot;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-35465.patch b=
/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-35465.patch<br>
&gt; deleted file mode 100644<br>
&gt; index e09818fecf..0000000000<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-35465.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,39 +0,0 @@<br>
&gt; -From 574e7950bd6b34e9e2cacce18c802b45505d1d0a Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Richard Earnshaw &lt;<a href=3D"mailto:rearnsha@arm.com" target=
=3D"_blank">rearnsha@arm.com</a>&gt;<br>
&gt; -Date: Fri, 18 Jun 2021 17:16:25 +0100<br>
&gt; -Subject: [PATCH] arm: add erratum mitigation to __gnu_cmse_nonsecure_=
call<br>
&gt; - [PR102035]<br>
&gt; -<br>
&gt; -Add the recommended erratum mitigation sequence to<br>
&gt; -__gnu_cmse_nonsecure_call for use on Armv8-m.main devices. Since this=
<br>
&gt; -is in the library code we cannot know in advance whether the core we<=
br>
&gt; -are running on will be affected by this, so always enable it.<br>
&gt; -<br>
&gt; -libgcc:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0PR target/102035<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/arm/cmse_nonsecure_call.S (__gnu_=
cmse_nonsecure_call):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0Add vlldm erratum work-around.<br>
&gt; -<br>
&gt; -CVE: CVE-2021-35465<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://gcc.gnu.org/git/gitweb.=
cgi?p=3Dgcc.git;h=3D574e7950bd6b34e9e2cacce18c802b45505d1d0a" rel=3D"norefe=
rrer" target=3D"_blank">https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.git;h=3D=
574e7950bd6b34e9e2cacce18c802b45505d1d0a</a>]<br>
&gt; -Signed-off-by: Pgowda &lt;<a href=3D"mailto:pgowda.cve@gmail.com" tar=
get=3D"_blank">pgowda.cve@gmail.com</a>&gt;<br>
&gt; -<br>
&gt; ----<br>
&gt; - libgcc/config/arm/cmse_nonsecure_call.S | 5 +++++<br>
&gt; - 1 file changed, 5 insertions(+)<br>
&gt; -<br>
&gt; -diff --git a/libgcc/config/arm/cmse_nonsecure_call.S b/libgcc/config/=
arm/cmse_nonsecure_call.S<br>
&gt; ---- a/libgcc/config/arm/cmse_nonsecure_call.S<br>
&gt; -+++ b/libgcc/config/arm/cmse_nonsecure_call.S<br>
&gt; -@@ -102,6 +102,11 @@ blxns=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r4<br>
&gt; - #ifdef __ARM_PCS_VFP<br>
&gt; - vpop.f64=C2=A0 =C2=A0 {d8-d15}<br>
&gt; - #else<br>
&gt; -+/* VLLDM erratum mitigation sequence. */<br>
&gt; -+mrs=C2=A0 =C2=A0 =C2=A0 =C2=A0r5, control<br>
&gt; -+tst=C2=A0 =C2=A0 =C2=A0 =C2=A0r5, #8=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* C=
ONTROL_S.SFPA */<br>
&gt; -+it=C2=A0 =C2=A0 =C2=A0 =C2=A0 ne<br>
&gt; -+.inst.w=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xeeb00a40=C2=A0 =C2=
=A0 /* vmovne s0, s0 */<br>
&gt; - vlldm=C2=A0 =C2=A0 =C2=A0sp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 /* Lazy restore of d0-d16 and FPSCR.=C2=A0 */<br>
&gt; - add=C2=A0 =C2=A0 =C2=A0 =C2=A0sp, sp, #0x88 /* Free space used to sa=
ve floating point registers.=C2=A0 */<br>
&gt; - #endif /* __ARM_PCS_VFP */<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-dire=
ctories.patch b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-direct=
ories.patch<br>
&gt; index 18a9fb8701..d19cefbdf9 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories=
.patch<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories=
.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 118c6f054711d437167ff125a88c9236bfc8099c Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 863f1f9dc78839ecd021b2cb01d501e8c9e00ef7 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 8 Mar 2021 16:04:20 -0800<br>
&gt;=C2=A0 Subject: [PATCH] gcc: poison-system-directories<br>
&gt; @@ -25,7 +25,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A07 files changed, 86 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/gcc/common.opt b/gcc/common.opt<br>
&gt; -index c75dd36843e..49acbd6ed44 100644<br>
&gt; +index a75b44ee47e..d15105a73f3 100644<br>
&gt;=C2=A0 --- a/gcc/common.opt<br>
&gt;=C2=A0 +++ b/gcc/common.opt<br>
&gt;=C2=A0 @@ -683,6 +683,10 @@ Wreturn-local-addr<br>
&gt; @@ -40,10 +40,10 @@ index c75dd36843e..49acbd6ed44 100644<br>
&gt;=C2=A0 =C2=A0Common Var(warn_shadow) Warning<br>
&gt;=C2=A0 =C2=A0Warn when one variable shadows another.=C2=A0 Same as -Wsh=
adow=3Dglobal.<br>
&gt;=C2=A0 diff --git a/gcc/<a href=3D"http://config.in" rel=3D"noreferrer"=
 target=3D"_blank">config.in</a> b/gcc/<a href=3D"http://config.in" rel=3D"=
noreferrer" target=3D"_blank">config.in</a><br>
&gt; -index 10a13cde586..8848284da41 100644<br>
&gt; +index 048bf52e8c2..4f973f7906a 100644<br>
&gt;=C2=A0 --- a/gcc/<a href=3D"http://config.in" rel=3D"noreferrer" target=
=3D"_blank">config.in</a><br>
&gt;=C2=A0 +++ b/gcc/<a href=3D"http://config.in" rel=3D"noreferrer" target=
=3D"_blank">config.in</a><br>
&gt; -@@ -218,6 +218,16 @@<br>
&gt; +@@ -230,6 +230,16 @@<br>
&gt;=C2=A0 =C2=A0#endif<br>
&gt;<br>
&gt;<br>
&gt; @@ -61,10 +61,10 @@ index 10a13cde586..8848284da41 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 optimizer and back end) to be checked for dynamic =
type safety at runtime.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 This is quite expensive. */<br>
&gt;=C2=A0 diff --git a/gcc/configure b/gcc/configure<br>
&gt; -index 9bb436ce7bd..3f0734bff11 100755<br>
&gt; +index 7218b0c331a..d7445339f9a 100755<br>
&gt;=C2=A0 --- a/gcc/configure<br>
&gt;=C2=A0 +++ b/gcc/configure<br>
&gt; -@@ -1020,6 +1020,7 @@ enable_maintainer_mode<br>
&gt; +@@ -1019,6 +1019,7 @@ enable_maintainer_mode<br>
&gt;=C2=A0 =C2=A0enable_link_mutex<br>
&gt;=C2=A0 =C2=A0enable_link_serialization<br>
&gt;=C2=A0 =C2=A0enable_version_specific_runtime_libs<br>
&gt; @@ -72,7 +72,7 @@ index 9bb436ce7bd..3f0734bff11 100755<br>
&gt;=C2=A0 =C2=A0enable_plugin<br>
&gt;=C2=A0 =C2=A0enable_host_shared<br>
&gt;=C2=A0 =C2=A0enable_libquadmath_support<br>
&gt; -@@ -1782,6 +1783,8 @@ Optional Features:<br>
&gt; +@@ -1781,6 +1782,8 @@ Optional Features:<br>
&gt;=C2=A0 =C2=A0 =C2=A0--enable-version-specific-runtime-libs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0specify that runtime libraries should be =
installed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in a compiler-specific directory<br>
&gt; @@ -81,7 +81,7 @@ index 9bb436ce7bd..3f0734bff11 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0--enable-plugin=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0en=
able plugin support<br>
&gt;=C2=A0 =C2=A0 =C2=A0--enable-host-shared=C2=A0 =C2=A0 build host code a=
s shared libraries<br>
&gt;=C2=A0 =C2=A0 =C2=A0--disable-libquadmath-support<br>
&gt; -@@ -31325,6 +31328,22 @@ if test &quot;${enable_version_specific_runt=
ime_libs+set}&quot; =3D set; then :<br>
&gt; +@@ -31932,6 +31935,22 @@ if test &quot;${enable_version_specific_runt=
ime_libs+set}&quot; =3D set; then :<br>
&gt;=C2=A0 =C2=A0fi<br>
&gt;<br>
&gt;<br>
&gt; @@ -105,10 +105,10 @@ index 9bb436ce7bd..3f0734bff11 100755<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 diff --git a/gcc/<a href=3D"http://configure.ac" rel=3D"noreferr=
er" target=3D"_blank">configure.ac</a> b/gcc/<a href=3D"http://configure.ac=
" rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt; -index caa611933df..54e21764b3e 100644<br>
&gt; +index 49f043ed29b..fe488f2232b 100644<br>
&gt;=C2=A0 --- a/gcc/<a href=3D"http://configure.ac" rel=3D"noreferrer" tar=
get=3D"_blank">configure.ac</a><br>
&gt;=C2=A0 +++ b/gcc/<a href=3D"http://configure.ac" rel=3D"noreferrer" tar=
get=3D"_blank">configure.ac</a><br>
&gt; -@@ -7123,6 +7123,22 @@ AC_ARG_ENABLE(version-specific-runtime-libs,<b=
r>
&gt; +@@ -7393,6 +7393,22 @@ AC_ARG_ENABLE(version-specific-runtime-libs,<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[s=
pecify that runtime libraries should be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
nstalled in a compiler-specific directory])])<br>
&gt;<br>
&gt; @@ -132,7 +132,7 @@ index caa611933df..54e21764b3e 100644<br>
&gt;=C2=A0 =C2=A0AC_SUBST(subdirs)<br>
&gt;=C2=A0 =C2=A0AC_SUBST(srcdir)<br>
&gt;=C2=A0 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi<br>
&gt; -index 7a368959e5e..6659a903bf0 100644<br>
&gt; +index 35508efb4ef..40f798eac78 100644<br>
&gt;=C2=A0 --- a/gcc/doc/invoke.texi<br>
&gt;=C2=A0 +++ b/gcc/doc/invoke.texi<br>
&gt;=C2=A0 @@ -369,6 +369,7 @@ Objective-C and Objective-C++ Dialects}.<br>
&gt; @@ -143,7 +143,7 @@ index 7a368959e5e..6659a903bf0 100644<br>
&gt;=C2=A0 =C2=A0-Wno-pragmas=C2=A0 -Wno-prio-ctor-dtor=C2=A0 -Wredundant-d=
ecls @gol<br>
&gt;=C2=A0 =C2=A0-Wrestrict=C2=A0 -Wno-return-local-addr=C2=A0 -Wreturn-typ=
e @gol<br>
&gt;=C2=A0 =C2=A0-Wno-scalar-storage-order=C2=A0 -Wsequence-point @gol<br>
&gt; -@@ -7735,6 +7736,14 @@ made up of data only and thus requires no spec=
ial treatment.=C2=A0 But, for<br>
&gt; +@@ -7728,6 +7729,14 @@ made up of data only and thus requires no spec=
ial treatment.=C2=A0 But, for<br>
&gt;=C2=A0 =C2=A0most targets, it is made up of code and thus requires the =
stack to be<br>
&gt;=C2=A0 =C2=A0made executable in order for the program to work properly.=
<br>
&gt;<br>
&gt; @@ -159,7 +159,7 @@ index 7a368959e5e..6659a903bf0 100644<br>
&gt;=C2=A0 =C2=A0@opindex Wfloat-equal<br>
&gt;=C2=A0 =C2=A0@opindex Wno-float-equal<br>
&gt;=C2=A0 diff --git a/gcc/gcc.c b/gcc/gcc.c<br>
&gt; -index 7837553958b..19c75b6e20d 100644<br>
&gt; +index 0af888c7d78..b047fc31c2f 100644<br>
&gt;=C2=A0 --- a/gcc/gcc.c<br>
&gt;=C2=A0 +++ b/gcc/gcc.c<br>
&gt;=C2=A0 @@ -1152,6 +1152,8 @@ proper position among the other output fil=
es.=C2=A0 */<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.p=
atch b/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch<br>
&gt; similarity index 99%<br>
&gt; rename from meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.pa=
tch<br>
&gt; rename to meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patc=
h<br>
&gt; index 5f14dd2a58..c0e8cbd4d9 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch<br=
>
&gt; +++ b/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch<br=
>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 2fa5c93641b75a662839c1b6eee172b6c481c70e Mon Sep 17 00:00:00 200=
1<br>
&gt; +From b87a3ac51df372128be2fda992238c5aab4a719a Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Fri, 29 Mar 2013 09:10:06 +0400<br>
&gt;=C2=A0 Subject: [PATCH] 64-bit multilib hack.<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0003-CVE-2021-35465.patch b=
/meta/recipes-devtools/gcc/gcc/0003-CVE-2021-35465.patch<br>
&gt; deleted file mode 100644<br>
&gt; index c7a7c76bf8..0000000000<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0003-CVE-2021-35465.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,103 +0,0 @@<br>
&gt; -From 30461cf8dba3d3adb15a125e4da48800eb2b9b8f Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Richard Earnshaw &lt;<a href=3D"mailto:rearnsha@arm.com" target=
=3D"_blank">rearnsha@arm.com</a>&gt;<br>
&gt; -Date: Fri, 18 Jun 2021 17:18:37 +0100<br>
&gt; -Subject: [PATCH] arm: fix vlldm erratum for Armv8.1-m [PR102035]<br>
&gt; -<br>
&gt; -For Armv8.1-m we generate code that emits VLLDM directly and do not<b=
r>
&gt; -rely on support code in the library, so emit the mitigation directly<=
br>
&gt; -as well, when required.=C2=A0 In this case, we can use the compiler o=
ptions<br>
&gt; -to determine when to apply the fix and when it is safe to omit it.<br=
>
&gt; -<br>
&gt; -gcc:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0PR target/102035<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/arm/arm.md (attribute arch): Add =
fix_vlldm.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0(arch_enabled): Use it.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/arm/vfp.md (lazy_store_multiple_i=
nsn): Add alternative to<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0use when erratum mitigation is needed.<br>
&gt; -<br>
&gt; -CVE: CVE-2021-35465<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://gcc.gnu.org/git/gitweb.=
cgi?p=3Dgcc.git;h=3D30461cf8dba3d3adb15a125e4da48800eb2b9b8f" rel=3D"norefe=
rrer" target=3D"_blank">https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.git;h=3D=
30461cf8dba3d3adb15a125e4da48800eb2b9b8f</a>]<br>
&gt; -Signed-off-by: Pgowda &lt;<a href=3D"mailto:pgowda.cve@gmail.com" tar=
get=3D"_blank">pgowda.cve@gmail.com</a>&gt;<br>
&gt; -<br>
&gt; ----<br>
&gt; - gcc/config/arm/arm.md | 11 +++++++++--<br>
&gt; - gcc/config/arm/vfp.md | 10 +++++++---<br>
&gt; - 2 files changed, 16 insertions(+), 5 deletions(-)<br>
&gt; -<br>
&gt; -diff -upr a/gcc/config/arm/arm.md b/gcc/config/arm/arm.md<br>
&gt; ---- a/gcc/config/arm/arm.md=C2=A0 =C2=A0 2020-07-22 23:35:17.34438455=
2 -0700<br>
&gt; -+++ b/gcc/config/arm/arm.md=C2=A0 =C2=A0 2021-11-11 20:33:58.43154394=
7 -0800<br>
&gt; -@@ -132,9 +132,12 @@<br>
&gt; - ; TARGET_32BIT, &quot;t1&quot; or &quot;t2&quot; to specify a specif=
ic Thumb mode.=C2=A0 &quot;v6&quot;<br>
&gt; - ; for ARM or Thumb-2 with arm_arch6, and nov6 for ARM without<br>
&gt; - ; arm_arch6.=C2=A0 &quot;v6t2&quot; for Thumb-2 with arm_arch6 and &=
quot;v8mb&quot; for ARMv8-M<br>
&gt; --; Baseline.=C2=A0 This attribute is used to compute attribute &quot;=
enabled&quot;,<br>
&gt; -+; Baseline.=C2=A0 &quot;fix_vlldm&quot; is for fixing the v8-m/v8.1-=
m VLLDM erratum.<br>
&gt; -+; This attribute is used to compute attribute &quot;enabled&quot;,<b=
r>
&gt; - ; use type &quot;any&quot; to enable an alternative in all cases.<br=
>
&gt; --(define_attr &quot;arch&quot; &quot;any,a,t,32,t1,t2,v6,nov6,v6t2,v8=
mb,iwmmxt,iwmmxt2,armv6_or_vfpv3,neon,mve&quot;<br>
&gt; -+(define_attr &quot;arch&quot; &quot;any, a, t, 32, t1, t2, v6,nov6, =
v6t2, \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0v8mb, fix_vlldm, iwmmxt, iwmmxt2, armv6_or_vfpv3, \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0neon, mve&quot;<br>
&gt; -=C2=A0 =C2=A0(const_string &quot;any&quot;))<br>
&gt; -<br>
&gt; - (define_attr &quot;arch_enabled&quot; &quot;no,yes&quot;<br>
&gt; -@@ -177,6 +180,10 @@<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(match_test &quot;TAR=
GET_THUMB1 &amp;&amp; arm_arch8&quot;))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 (const_string &quot;yes&quot;)<br>
&gt; -<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0(and (eq_attr &quot;arch&quot; &quot;fix_=
vlldm&quot;)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (match_test &quot;fix_vlld=
m&quot;))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0(const_string &quot;yes&quot;)<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 (and (eq_attr &quot;arch&quot; &quot;iwmm=
xt2&quot;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(match_test &quot;TAR=
GET_REALLY_IWMMXT2&quot;))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 (const_string &quot;yes&quot;)<br>
&gt; -diff -upr a/gcc/config/arm/vfp.md b/gcc/config/arm/vfp.md<br>
&gt; ---- a/gcc/config/arm/vfp.md=C2=A0 =C2=A0 2020-07-22 23:35:17.35638468=
4 -0700<br>
&gt; -+++ b/gcc/config/arm/vfp.md=C2=A0 =C2=A0 2021-11-11 20:33:58.43154394=
7 -0800<br>
&gt; -@@ -1703,12 +1703,15 @@<br>
&gt; -=C2=A0 =C2=A0 (set_attr &quot;type&quot; &quot;mov_reg&quot;)]<br>
&gt; - )<br>
&gt; -<br>
&gt; -+;; Both this and the next instruction are treated by GCC in the same=
<br>
&gt; -+;; way as a blockage pattern.=C2=A0 That&#39;s perhaps stronger than=
 it needs<br>
&gt; -+;; to be, but we do not want accesses to the VFP register bank to be=
<br>
&gt; -+;; moved across either instruction.<br>
&gt; -+<br>
&gt; - (define_insn &quot;lazy_store_multiple_insn&quot;<br>
&gt; --=C2=A0 [(set (match_operand:SI 0 &quot;s_register_operand&quot; &quo=
t;+&amp;rk&quot;)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 (post_dec:SI (match_dup 0)))<br>
&gt; --=C2=A0 =C2=A0(unspec_volatile [(const_int 0)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(mem:SI (post_dec:SI (match_dup 0)))]<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VUNSP=
EC_VLSTM)]<br>
&gt; -+=C2=A0 [(unspec_volatile<br>
&gt; -+=C2=A0 =C2=A0 [(mem:BLK (match_operand:SI 0 &quot;s_register_operand=
&quot; &quot;rk&quot;))]<br>
&gt; -+=C2=A0 =C2=A0 VUNSPEC_VLSTM)]<br>
&gt; -=C2=A0 =C2=A0&quot;use_cmse &amp;&amp; reload_completed&quot;<br>
&gt; -=C2=A0 =C2=A0&quot;vlstm%?\\t%0&quot;<br>
&gt; -=C2=A0 =C2=A0[(set_attr &quot;predicable&quot; &quot;yes&quot;)<br>
&gt; -@@ -1716,14 +1719,16 @@<br>
&gt; - )<br>
&gt; -<br>
&gt; - (define_insn &quot;lazy_load_multiple_insn&quot;<br>
&gt; --=C2=A0 [(set (match_operand:SI 0 &quot;s_register_operand&quot; &quo=
t;+&amp;rk&quot;)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 (post_inc:SI (match_dup 0)))<br>
&gt; --=C2=A0 =C2=A0(unspec_volatile:SI [(const_int 0)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (mem:SI (match_dup 0))]<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0VUNSPEC_VLLDM)]<br>
&gt; -+=C2=A0 [(unspec_volatile<br>
&gt; -+=C2=A0 =C2=A0 [(mem:BLK (match_operand:SI 0 &quot;s_register_operand=
&quot; &quot;rk,rk&quot;))]<br>
&gt; -+=C2=A0 =C2=A0 VUNSPEC_VLLDM)]<br>
&gt; -=C2=A0 =C2=A0&quot;use_cmse &amp;&amp; reload_completed&quot;<br>
&gt; --=C2=A0 &quot;vlldm%?\\t%0&quot;<br>
&gt; --=C2=A0 [(set_attr &quot;predicable&quot; &quot;yes&quot;)<br>
&gt; -+=C2=A0 &quot;@<br>
&gt; -+=C2=A0 =C2=A0vscclrm\\t{vpr}\;vlldm\\t%0<br>
&gt; -+=C2=A0 =C2=A0vlldm\\t%0&quot;<br>
&gt; -+=C2=A0 [(set_attr &quot;arch&quot; &quot;fix_vlldm,*&quot;)<br>
&gt; -+=C2=A0 =C2=A0(set_attr &quot;predicable&quot; &quot;no&quot;)<br>
&gt; -+=C2=A0 =C2=A0(set_attr &quot;length&quot; &quot;8,4&quot;)<br>
&gt; -=C2=A0 =C2=A0 (set_attr &quot;type&quot; &quot;load_4&quot;)]<br>
&gt; - )<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-35465.patch b=
/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-35465.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 9dd6a313c2..0000000000<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-35465.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,304 +0,0 @@<br>
&gt; -From 809330ab8450261e05919b472783bf15e4b000f7 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Richard Earnshaw &lt;<a href=3D"mailto:rearnsha@arm.com" target=
=3D"_blank">rearnsha@arm.com</a>&gt;<br>
&gt; -Date: Tue, 6 Jul 2021 15:10:18 +0100<br>
&gt; -Subject: [PATCH] arm: Add tests for VLLDM mitigation [PR102035]<br>
&gt; -<br>
&gt; -New tests for the erratum mitigation.<br>
&gt; -<br>
&gt; -gcc/testsuite:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0PR target/102035<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/arm/cmse/mainline/8_1m/soft/c=
mse-13a.c: New test.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/arm/cmse/mainline/8_1m/soft/c=
mse-7a.c: Likewise.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/arm/cmse/mainline/8_1m/soft/c=
mse-8a.c: Likewise.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/arm/cmse/mainline/8_1m/softfp=
-sp/cmse-7a.c: Likewise.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/arm/cmse/mainline/8_1m/softfp=
-sp/cmse-8a.c: Likewise.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/arm/cmse/mainline/8_1m/softfp=
/cmse-13a.c: Likewise.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/arm/cmse/mainline/8_1m/softfp=
/cmse-7a.c: Likewise.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0* gcc.target/arm/cmse/mainline/8_1m/softfp=
/cmse-8a.c: Likewise.<br>
&gt; -<br>
&gt; -CVE: CVE-2021-35465<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://gcc.gnu.org/git/gitweb.=
cgi?p=3Dgcc.git;h=3D809330ab8450261e05919b472783bf15e4b000f7" rel=3D"norefe=
rrer" target=3D"_blank">https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.git;h=3D=
809330ab8450261e05919b472783bf15e4b000f7</a>]<br>
&gt; -Signed-off-by: Pgowda &lt;<a href=3D"mailto:pgowda.cve@gmail.com" tar=
get=3D"_blank">pgowda.cve@gmail.com</a>&gt;<br>
&gt; -<br>
&gt; ----<br>
&gt; - .../arm/cmse/mainline/8_1m/soft/cmse-13a.c=C2=A0 =C2=A0 | 31 +++++++=
++++++++++++<br>
&gt; - .../arm/cmse/mainline/8_1m/soft/cmse-7a.c=C2=A0 =C2=A0 =C2=A0| 28 ++=
+++++++++++++++<br>
&gt; - .../arm/cmse/mainline/8_1m/soft/cmse-8a.c=C2=A0 =C2=A0 =C2=A0| 30 ++=
++++++++++++++++<br>
&gt; - .../cmse/mainline/8_1m/softfp-sp/cmse-7a.c=C2=A0 =C2=A0 | 27 +++++++=
+++++++++<br>
&gt; - .../cmse/mainline/8_1m/softfp-sp/cmse-8a.c=C2=A0 =C2=A0 | 29 +++++++=
++++++++++<br>
&gt; - .../arm/cmse/mainline/8_1m/softfp/cmse-13a.c=C2=A0 | 30 ++++++++++++=
++++++<br>
&gt; - .../arm/cmse/mainline/8_1m/softfp/cmse-7a.c=C2=A0 =C2=A0| 27 +++++++=
+++++++++<br>
&gt; - .../arm/cmse/mainline/8_1m/softfp/cmse-8a.c=C2=A0 =C2=A0| 29 +++++++=
++++++++++<br>
&gt; - 8 files changed, 231 insertions(+)<br>
&gt; - create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/s=
oft/cmse-13a.c<br>
&gt; - create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/s=
oft/cmse-7a.c<br>
&gt; - create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/s=
oft/cmse-8a.c<br>
&gt; - create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/s=
oftfp-sp/cmse-7a.c<br>
&gt; - create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/s=
oftfp-sp/cmse-8a.c<br>
&gt; - create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/s=
oftfp/cmse-13a.c<br>
&gt; - create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/s=
oftfp/cmse-7a.c<br>
&gt; - create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/s=
oftfp/cmse-8a.c<br>
&gt; -<br>
&gt; -diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cms=
e-13a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-13a.c<b=
r>
&gt; ---- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-13a.c=
=C2=A0 1969-12-31 16:00:00.000000000 -0800<br>
&gt; -+++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-13a.c=
=C2=A0 2021-11-15 02:30:37.210637445 -0800<br>
&gt; -@@ -0,0 +1,31 @@<br>
&gt; -+/* { dg-do compile } */<br>
&gt; -+/* { dg-options &quot;-mcmse -mfloat-abi=3Dsoft -mfix-cmse-cve-2021-=
35465&quot; }=C2=A0 */<br>
&gt; -+/* { dg-skip-if &quot;Incompatible float ABI&quot; { *-*-* } { &quot=
;-mfloat-abi=3D*&quot; } { &quot;-mfloat-abi=3Dsoft&quot; } } */<br>
&gt; -+<br>
&gt; -+#include &quot;../../../cmse-13.x&quot;<br>
&gt; -+<br>
&gt; -+/* Checks for saving and clearing prior to function call.=C2=A0 */<b=
r>
&gt; -+/* Shift on the same register as blxns.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;lsrs\t(r\[1,4-9\]|r10|fp|ip), \=
\1, #1.*blxns\t\\1&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler &quot;lsls\t(r\[1,4-9\]|r10|fp|ip), \=
\1, #1.*blxns\t\\1&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler-not &quot;mov\tr0, r4&quot; } } */<br=
>
&gt; -+/* { dg-final { scan-assembler-not &quot;mov\tr2, r4&quot; } } */<br=
>
&gt; -+/* { dg-final { scan-assembler-not &quot;mov\tr3, r4&quot; } } */<br=
>
&gt; -+/* { dg-final { scan-assembler &quot;push\t\{r4, r5, r6, r7, r8, r9,=
 r10, fp\}&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler &quot;vlstm\tsp&quot; } } */<br>
&gt; -+/* Check the right registers are cleared and none appears twice.=C2=
=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;clrm\t\{(r1, )?(r4, )?(r5, )?(r=
6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}&quot; } } */<br>
&gt; -+/* Check that the right number of registers is cleared and thus only=
 one<br>
&gt; -+=C2=A0 =C2=A0register is missing.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;clrm\t\{((r\[1,4-9\]|r10|fp|ip)=
, ){9}APSR\}&quot; } } */<br>
&gt; -+/* Check that no cleared register is used for blxns.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler-not &quot;clrm\t\{\[^\}\]\+(r\[1,4-9\=
]|r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1&quot; } } */<br>
&gt; -+/* Check for v8.1-m variant of erratum work-around.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;vscclrm\t\{vpr\}&quot; } } */<b=
r>
&gt; -+/* { dg-final { scan-assembler &quot;vlldm\tsp&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler &quot;pop\t\{r4, r5, r6, r7, r8, r9, =
r10, fp\}&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler-not &quot;vmov&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler-not &quot;vmsr&quot; } } */<br>
&gt; -+<br>
&gt; -+/* Now we check that we use the correct intrinsic to call.=C2=A0 */<=
br>
&gt; -+/* { dg-final { scan-assembler &quot;blxns&quot; } } */<br>
&gt; -diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cms=
e-7a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-7a.c<br>
&gt; ---- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-7a.c=
=C2=A0 =C2=A01969-12-31 16:00:00.000000000 -0800<br>
&gt; -+++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-7a.c=
=C2=A0 =C2=A02021-11-15 02:30:37.210637445 -0800<br>
&gt; -@@ -0,0 +1,28 @@<br>
&gt; -+/* { dg-do compile } */<br>
&gt; -+/* { dg-options &quot;-mcmse -mfloat-abi=3Dsoft -mfix-cmse-cve-2021-=
35465&quot; }=C2=A0 */<br>
&gt; -+/* { dg-skip-if &quot;Incompatible float ABI&quot; { *-*-* } { &quot=
;-mfloat-abi=3D*&quot; } { &quot;-mfloat-abi=3Dsoft&quot; } } */<br>
&gt; -+<br>
&gt; -+#include &quot;../../../cmse-7.x&quot;<br>
&gt; -+<br>
&gt; -+/* Checks for saving and clearing prior to function call.=C2=A0 */<b=
r>
&gt; -+/* Shift on the same register as blxns.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;lsrs\t(r\[0-9\]|r10|fp|ip), \\1=
, #1.*blxns\t\\1&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler &quot;lsls\t(r\[0-9\]|r10|fp|ip), \\1=
, #1.*blxns\t\\1&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler &quot;push\t\{r4, r5, r6, r7, r8, r9,=
 r10, fp\}&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler &quot;vlstm\tsp&quot; } } */<br>
&gt; -+/* Check the right registers are cleared and none appears twice.=C2=
=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;clrm\t\{(r0, )?(r1, )?(r2, )?(r=
3, )?(r4, )?(r5, )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}=
&quot; } } */<br>
&gt; -+/* Check that the right number of registers is cleared and thus only=
 one<br>
&gt; -+=C2=A0 =C2=A0register is missing.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;clrm\t\{((r\[0-9\]|r10|fp|ip), =
){12}APSR\}&quot; } } */<br>
&gt; -+/* Check that no cleared register is used for blxns.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler-not &quot;clrm\t\{\[^\}\]\+(r\[0-9\]|=
r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1&quot; } } */<br>
&gt; -+/* Check for v8.1-m variant of erratum work-around.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;vscclrm\t\{vpr\}&quot; } } */<b=
r>
&gt; -+/* { dg-final { scan-assembler &quot;vlldm\tsp&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler &quot;pop\t\{r4, r5, r6, r7, r8, r9, =
r10, fp\}&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler-not &quot;vmov&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler-not &quot;vmsr&quot; } } */<br>
&gt; -+<br>
&gt; -+/* Now we check that we use the correct intrinsic to call.=C2=A0 */<=
br>
&gt; -+/* { dg-final { scan-assembler &quot;blxns&quot; } } */<br>
&gt; -diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cms=
e-8a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-8a.c<br>
&gt; ---- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-8a.c=
=C2=A0 =C2=A01969-12-31 16:00:00.000000000 -0800<br>
&gt; -+++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-8a.c=
=C2=A0 =C2=A02021-11-15 02:30:37.210637445 -0800<br>
&gt; -@@ -0,0 +1,30 @@<br>
&gt; -+/* { dg-do compile } */<br>
&gt; -+/* { dg-options &quot;-mcmse -mfloat-abi=3Dsoft -mfix-cmse-cve-2021-=
35465&quot; }=C2=A0 */<br>
&gt; -+/* { dg-skip-if &quot;Incompatible float ABI&quot; { *-*-* } { &quot=
;-mfloat-abi=3D*&quot; } { &quot;-mfloat-abi=3Dsoft&quot; } } */<br>
&gt; -+<br>
&gt; -+#include &quot;../../../cmse-8.x&quot;<br>
&gt; -+<br>
&gt; -+/* Checks for saving and clearing prior to function call.=C2=A0 */<b=
r>
&gt; -+/* Shift on the same register as blxns.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;lsrs\t(r\[2-9\]|r10|fp|ip), \\1=
, #1.*blxns\t\\1&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler &quot;lsls\t(r\[2-9\]|r10|fp|ip), \\1=
, #1.*blxns\t\\1&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler-not &quot;mov\tr0, r4&quot; } } */<br=
>
&gt; -+/* { dg-final { scan-assembler-not &quot;mov\tr1, r4&quot; } } */<br=
>
&gt; -+/* { dg-final { scan-assembler &quot;push\t\{r4, r5, r6, r7, r8, r9,=
 r10, fp\}&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler &quot;vlstm\tsp&quot; } } */<br>
&gt; -+/* Check the right registers are cleared and none appears twice.=C2=
=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;clrm\t\{(r2, )?(r3, )?(r4, )?(r=
5, )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}&quot; } } */<=
br>
&gt; -+/* Check that the right number of registers is cleared and thus only=
 one<br>
&gt; -+=C2=A0 =C2=A0register is missing.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;clrm\t\{((r\[2-9\]|r10|fp|ip), =
){10}APSR\}&quot; } } */<br>
&gt; -+/* Check that no cleared register is used for blxns.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler-not &quot;clrm\t\{\[^\}\]\+(r\[2-9\]|=
r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1&quot; } } */<br>
&gt; -+/* Check for v8.1-m variant of erratum work-around.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;vscclrm\t\{vpr\}&quot; } } */<b=
r>
&gt; -+/* { dg-final { scan-assembler &quot;vlldm\tsp&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler &quot;pop\t\{r4, r5, r6, r7, r8, r9, =
r10, fp\}&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler-not &quot;vmov&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler-not &quot;vmsr&quot; } } */<br>
&gt; -+<br>
&gt; -+/* Now we check that we use the correct intrinsic to call.=C2=A0 */<=
br>
&gt; -+/* { dg-final { scan-assembler &quot;blxns&quot; } } */<br>
&gt; -diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/c=
mse-13a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-13a=
.c<br>
&gt; ---- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-13a=
.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 1969-12-31 16:00:00.000000000 -0800<br>
&gt; -+++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-13a=
.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 2021-11-15 02:30:37.210637445 -0800<br>
&gt; -@@ -0,0 +1,30 @@<br>
&gt; -+/* { dg-do compile } */<br>
&gt; -+/* { dg-options &quot;-mcmse -mfloat-abi=3Dsoftfp -mfpu=3Dfpv5-d16 -=
mfix-cmse-cve-2021-35465&quot; }=C2=A0 */<br>
&gt; -+/* { dg-skip-if &quot;Incompatible float ABI&quot; { *-*-* } { &quot=
;-mfloat-abi=3D*&quot; } { &quot;-mfloat-abi=3Dsoftfp&quot; } } */<br>
&gt; -+/* { dg-skip-if &quot;Skip these if testing single precision&quot; {=
*-*-*} {&quot;-mfpu=3D*-sp-*&quot;} {&quot;&quot;} } */<br>
&gt; -+<br>
&gt; -+#include &quot;../../../cmse-13.x&quot;<br>
&gt; -+<br>
&gt; -+/* Checks for saving and clearing prior to function call.=C2=A0 */<b=
r>
&gt; -+/* Shift on the same register as blxns.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;lsrs\t(r\[1,4-9\]|r10|fp|ip), \=
\1, #1.*blxns\t\\1&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler &quot;lsls\t(r\[1,4-9\]|r10|fp|ip), \=
\1, #1.*blxns\t\\1&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler-not &quot;mov\tr0, r4&quot; } } */<br=
>
&gt; -+/* { dg-final { scan-assembler-not &quot;mov\tr2, r4&quot; } } */<br=
>
&gt; -+/* { dg-final { scan-assembler-not &quot;mov\tr3, r4&quot; } } */<br=
>
&gt; -+/* { dg-final { scan-assembler &quot;push\t\{r4, r5, r6, r7, r8, r9,=
 r10, fp\}&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler &quot;vlstm\tsp&quot; } } */<br>
&gt; -+/* Check the right registers are cleared and none appears twice.=C2=
=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;clrm\t\{(r1, )?(r4, )?(r5, )?(r=
6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}&quot; } } */<br>
&gt; -+/* Check that the right number of registers is cleared and thus only=
 one<br>
&gt; -+=C2=A0 =C2=A0register is missing.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;clrm\t\{((r\[1,4-9\]|r10|fp|ip)=
, ){9}APSR\}&quot; } } */<br>
&gt; -+/* Check that no cleared register is used for blxns.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler-not &quot;clrm\t\{\[^\}\]\+(r\[1,4-9\=
]|r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1&quot; } } */<br>
&gt; -+/* Check for v8.1-m variant of erratum work-around.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;vscclrm\t\{vpr\}&quot; } } */<b=
r>
&gt; -+/* { dg-final { scan-assembler &quot;vlldm\tsp&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler &quot;pop\t\{r4, r5, r6, r7, r8, r9, =
r10, fp\}&quot; } } */<br>
&gt; -+<br>
&gt; -+/* Now we check that we use the correct intrinsic to call.=C2=A0 */<=
br>
&gt; -+/* { dg-final { scan-assembler &quot;blxns&quot; } } */<br>
&gt; -diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/c=
mse-7a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-7a.c=
<br>
&gt; ---- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-7a.=
c 1969-12-31 16:00:00.000000000 -0800<br>
&gt; -+++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-7a.=
c 2021-11-15 02:30:37.210637445 -0800<br>
&gt; -@@ -0,0 +1,27 @@<br>
&gt; -+/* { dg-do compile } */<br>
&gt; -+/* { dg-options &quot;-mcmse -mfloat-abi=3Dsoftfp -mfpu=3Dfpv5-d16 -=
mfix-cmse-cve-2021-35465&quot; }=C2=A0 */<br>
&gt; -+/* { dg-skip-if &quot;Incompatible float ABI&quot; { *-*-* } { &quot=
;-mfloat-abi=3D*&quot; } { &quot;-mfloat-abi=3Dsoftfp&quot; } } */<br>
&gt; -+/* { dg-skip-if &quot;Skip these if testing single precision&quot; {=
*-*-*} {&quot;-mfpu=3D*-sp-*&quot;} {&quot;&quot;} } */<br>
&gt; -+<br>
&gt; -+#include &quot;../../../cmse-7.x&quot;<br>
&gt; -+<br>
&gt; -+/* Checks for saving and clearing prior to function call.=C2=A0 */<b=
r>
&gt; -+/* Shift on the same register as blxns.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;lsrs\t(r\[0-9\]|r10|fp|ip), \\1=
, #1.*blxns\t\\1&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler &quot;lsls\t(r\[0-9\]|r10|fp|ip), \\1=
, #1.*blxns\t\\1&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler &quot;push\t\{r4, r5, r6, r7, r8, r9,=
 r10, fp\}&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler &quot;vlstm\tsp&quot; } } */<br>
&gt; -+/* Check the right registers are cleared and none appears twice.=C2=
=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;clrm\t\{(r0, )?(r1, )?(r2, )?(r=
3, )?(r4, )?(r5, )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}=
&quot; } } */<br>
&gt; -+/* Check that the right number of registers is cleared and thus only=
 one<br>
&gt; -+=C2=A0 =C2=A0register is missing.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;clrm\t\{((r\[0-9\]|r10|fp|ip), =
){12}APSR\}&quot; } } */<br>
&gt; -+/* Check that no cleared register is used for blxns.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler-not &quot;clrm\t\{\[^\}\]\+(r\[0-9\]|=
r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1&quot; } } */<br>
&gt; -+/* Check for v8.1-m variant of erratum work-around.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;vscclrm\t\{vpr\}&quot; } } */<b=
r>
&gt; -+/* { dg-final { scan-assembler &quot;vlldm\tsp&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler &quot;pop\t\{r4, r5, r6, r7, r8, r9, =
r10, fp\}&quot; } } */<br>
&gt; -+<br>
&gt; -+/* Now we check that we use the correct intrinsic to call.=C2=A0 */<=
br>
&gt; -+/* { dg-final { scan-assembler &quot;blxns&quot; } } */<br>
&gt; -diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/c=
mse-8a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-8a.c=
<br>
&gt; ---- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-8a.=
c 1969-12-31 16:00:00.000000000 -0800<br>
&gt; -+++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-8a.=
c 2021-11-15 02:30:37.210637445 -0800<br>
&gt; -@@ -0,0 +1,29 @@<br>
&gt; -+/* { dg-do compile } */<br>
&gt; -+/* { dg-options &quot;-mcmse -mfloat-abi=3Dsoftfp -mfpu=3Dfpv5-d16 -=
mfix-cmse-cve-2021-35465&quot; }=C2=A0 */<br>
&gt; -+/* { dg-skip-if &quot;Incompatible float ABI&quot; { *-*-* } { &quot=
;-mfloat-abi=3D*&quot; } { &quot;-mfloat-abi=3Dsoftfp&quot; } } */<br>
&gt; -+/* { dg-skip-if &quot;Skip these if testing single precision&quot; {=
*-*-*} {&quot;-mfpu=3D*-sp-*&quot;} {&quot;&quot;} } */<br>
&gt; -+<br>
&gt; -+#include &quot;../../../cmse-8.x&quot;<br>
&gt; -+<br>
&gt; -+/* Checks for saving and clearing prior to function call.=C2=A0 */<b=
r>
&gt; -+/* Shift on the same register as blxns.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;lsrs\t(r\[2-9\]|r10|fp|ip), \\1=
, #1.*blxns\t\\1&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler &quot;lsls\t(r\[2-9\]|r10|fp|ip), \\1=
, #1.*blxns\t\\1&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler-not &quot;mov\tr0, r4&quot; } } */<br=
>
&gt; -+/* { dg-final { scan-assembler-not &quot;mov\tr1, r4&quot; } } */<br=
>
&gt; -+/* { dg-final { scan-assembler &quot;push\t\{r4, r5, r6, r7, r8, r9,=
 r10, fp\}&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler &quot;vlstm\tsp&quot; } } */<br>
&gt; -+/* Check the right registers are cleared and none appears twice.=C2=
=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;clrm\t\{(r2, )?(r3, )?(r4, )?(r=
5, )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}&quot; } } */<=
br>
&gt; -+/* Check that the right number of registers is cleared and thus only=
 one<br>
&gt; -+=C2=A0 =C2=A0register is missing.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;clrm\t\{((r\[2-9\]|r10|fp|ip), =
){10}APSR\}&quot; } } */<br>
&gt; -+/* Check that no cleared register is used for blxns.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler-not &quot;clrm\t\{\[^\}\]\+(r\[2-9\]|=
r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1&quot; } } */<br>
&gt; -+/* Check for v8.1-m variant of erratum work-around.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;vscclrm\t\{vpr\}&quot; } } */<b=
r>
&gt; -+/* { dg-final { scan-assembler &quot;vlldm\tsp&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler &quot;pop\t\{r4, r5, r6, r7, r8, r9, =
r10, fp\}&quot; } } */<br>
&gt; -+<br>
&gt; -+/* Now we check that we use the correct intrinsic to call.=C2=A0 */<=
br>
&gt; -+/* { dg-final { scan-assembler &quot;blxns&quot; } } */<br>
&gt; -diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-s=
p/cmse-7a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cms=
e-7a.c<br>
&gt; ---- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-=
7a.c=C2=A0 =C2=A0 =C2=A0 1969-12-31 16:00:00.000000000 -0800<br>
&gt; -+++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-=
7a.c=C2=A0 =C2=A0 =C2=A0 2021-11-15 02:30:37.210637445 -0800<br>
&gt; -@@ -0,0 +1,27 @@<br>
&gt; -+/* { dg-do compile } */<br>
&gt; -+/* { dg-options &quot;-mcmse -mfloat-abi=3Dsoftfp -mfpu=3Dfpv5-sp-d1=
6 -mfix-cmse-cve-2021-35465&quot; }=C2=A0 */<br>
&gt; -+/* { dg-skip-if &quot;Incompatible float ABI&quot; { *-*-* } { &quot=
;-mfloat-abi=3D*&quot; } { &quot;-mfloat-abi=3Dsoftfp&quot; } } */<br>
&gt; -+/* { dg-skip-if &quot;Skip these if testing double precision&quot; {=
*-*-*} {&quot;-mfpu=3Dfpv[4-5]-d16&quot;} {&quot;&quot;} } */<br>
&gt; -+<br>
&gt; -+#include &quot;../../../cmse-7.x&quot;<br>
&gt; -+<br>
&gt; -+/* Checks for saving and clearing prior to function call.=C2=A0 */<b=
r>
&gt; -+/* Shift on the same register as blxns.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;lsrs\t(r\[0-9\]|r10|fp|ip), \\1=
, #1.*blxns\t\\1&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler &quot;lsls\t(r\[0-9\]|r10|fp|ip), \\1=
, #1.*blxns\t\\1&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler &quot;push\t\{r4, r5, r6, r7, r8, r9,=
 r10, fp\}&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler &quot;vlstm\tsp&quot; } } */<br>
&gt; -+/* Check the right registers are cleared and none appears twice.=C2=
=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;clrm\t\{(r0, )?(r1, )?(r2, )?(r=
3, )?(r4, )?(r5, )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}=
&quot; } } */<br>
&gt; -+/* Check that the right number of registers is cleared and thus only=
 one<br>
&gt; -+=C2=A0 =C2=A0register is missing.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;clrm\t\{((r\[0-9\]|r10|fp|ip), =
){12}APSR\}&quot; } } */<br>
&gt; -+/* Check that no cleared register is used for blxns.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler-not &quot;clrm\t\{\[^\}\]\+(r\[0-9\]|=
r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1&quot; } } */<br>
&gt; -+/* Check for v8.1-m variant of erratum work-around.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;vscclrm\t\{vpr\}&quot; } } */<b=
r>
&gt; -+/* { dg-final { scan-assembler &quot;vlldm\tsp&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler &quot;pop\t\{r4, r5, r6, r7, r8, r9, =
r10, fp\}&quot; } } */<br>
&gt; -+<br>
&gt; -+/* Now we check that we use the correct intrinsic to call.=C2=A0 */<=
br>
&gt; -+/* { dg-final { scan-assembler &quot;blxns&quot; } } */<br>
&gt; -diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-s=
p/cmse-8a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cms=
e-8a.c<br>
&gt; ---- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-=
8a.c=C2=A0 =C2=A0 =C2=A0 1969-12-31 16:00:00.000000000 -0800<br>
&gt; -+++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-=
8a.c=C2=A0 =C2=A0 =C2=A0 2021-11-15 02:30:37.210637445 -0800<br>
&gt; -@@ -0,0 +1,29 @@<br>
&gt; -+/* { dg-do compile } */<br>
&gt; -+/* { dg-options &quot;-mcmse -mfloat-abi=3Dsoftfp -mfpu=3Dfpv5-sp-d1=
6 -mfix-cmse-cve-2021-35465&quot; }=C2=A0 */<br>
&gt; -+/* { dg-skip-if &quot;Incompatible float ABI&quot; { *-*-* } { &quot=
;-mfloat-abi=3D*&quot; } { &quot;-mfloat-abi=3Dsoftfp&quot; } } */<br>
&gt; -+/* { dg-skip-if &quot;Skip these if testing double precision&quot; {=
*-*-*} {&quot;-mfpu=3Dfpv[4-5]-d16&quot;} {&quot;&quot;} } */<br>
&gt; -+<br>
&gt; -+#include &quot;../../../cmse-8.x&quot;<br>
&gt; -+<br>
&gt; -+/* Checks for saving and clearing prior to function call.=C2=A0 */<b=
r>
&gt; -+/* Shift on the same register as blxns.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;lsrs\t(r\[2-9\]|r10|fp|ip), \\1=
, #1.*blxns\t\\1&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler &quot;lsls\t(r\[2-9\]|r10|fp|ip), \\1=
, #1.*blxns\t\\1&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler-not &quot;mov\tr0, r4&quot; } } */<br=
>
&gt; -+/* { dg-final { scan-assembler-not &quot;mov\tr1, r4&quot; } } */<br=
>
&gt; -+/* { dg-final { scan-assembler &quot;push\t\{r4, r5, r6, r7, r8, r9,=
 r10, fp\}&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler &quot;vlstm\tsp&quot; } } */<br>
&gt; -+/* Check the right registers are cleared and none appears twice.=C2=
=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;clrm\t\{(r2, )?(r3, )?(r4, )?(r=
5, )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}&quot; } } */<=
br>
&gt; -+/* Check that the right number of registers is cleared and thus only=
 one<br>
&gt; -+=C2=A0 =C2=A0register is missing.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;clrm\t\{((r\[2-9\]|r10|fp|ip), =
){10}APSR\}&quot; } } */<br>
&gt; -+/* Check that no cleared register is used for blxns.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler-not &quot;clrm\t\{\[^\}\]\+(r\[2-9\]|=
r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1&quot; } } */<br>
&gt; -+/* Check for v8.1-m variant of erratum work-around.=C2=A0 */<br>
&gt; -+/* { dg-final { scan-assembler &quot;vscclrm\t\{vpr\}&quot; } } */<b=
r>
&gt; -+/* { dg-final { scan-assembler &quot;vlldm\tsp&quot; } } */<br>
&gt; -+/* { dg-final { scan-assembler &quot;pop\t\{r4, r5, r6, r7, r8, r9, =
r10, fp\}&quot; } } */<br>
&gt; -+<br>
&gt; -+/* Now we check that we use the correct intrinsic to call.=C2=A0 */<=
br>
&gt; -+/* { dg-final { scan-assembler &quot;blxns&quot; } } */<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0007-Use-the-defaults.h-in-=
B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc/0004-Use=
-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch<br>
&gt; similarity index 91%<br>
&gt; rename from meta/recipes-devtools/gcc/gcc/0007-Use-the-defaults.h-in-B=
-instead-of-S-and-t-oe-in-B.patch<br>
&gt; rename to meta/recipes-devtools/gcc/gcc/0004-Use-the-defaults.h-in-B-i=
nstead-of-S-and-t-oe-in-B.patch<br>
&gt; index 9844c2ae8a..55a58851dc 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0007-Use-the-defaults.h-in-B-inste=
ad-of-S-and-t-oe-in-B.patch<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc/0004-Use-the-defaults.h-in-B-inste=
ad-of-S-and-t-oe-in-B.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From e64342df647829d3e1c52fd480a5be7c1281ced0 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 1766cf28fd7d917df510b1c262c47211b9ea70fa Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Fri, 29 Mar 2013 09:17:25 +0400<br>
&gt;=C2=A0 Subject: [PATCH] Use the defaults.h in ${B} instead of ${S}, and=
 t-oe in ${B}<br>
&gt; @@ -26,7 +26,7 @@ Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hong=
xu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br=
>
&gt;=C2=A0 =C2=A04 files changed, 7 insertions(+), 7 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/gcc/Makefile.in b/gcc/Makefile.in<br>
&gt; -index 8a5fb3fd99c..7da6f439fff 100644<br>
&gt; +index 7bfd6ce653f..95962ae37b6 100644<br>
&gt;=C2=A0 --- a/gcc/Makefile.in<br>
&gt;=C2=A0 +++ b/gcc/Makefile.in<br>
&gt;=C2=A0 @@ -552,7 +552,7 @@ TARGET_SYSTEM_ROOT =3D @TARGET_SYSTEM_ROOT@<=
br>
&gt; @@ -39,10 +39,10 @@ index 8a5fb3fd99c..7da6f439fff 100644<br>
&gt;=C2=A0 =C2=A0TM_MULTILIB_CONFIG=3D@TM_MULTILIB_CONFIG@<br>
&gt;=C2=A0 =C2=A0TM_MULTILIB_EXCEPTIONS_CONFIG=3D@TM_MULTILIB_EXCEPTIONS_CO=
NFIG@<br>
&gt;=C2=A0 diff --git a/gcc/configure b/gcc/configure<br>
&gt; -index 3f0734bff11..c5d3bc4ee2d 100755<br>
&gt; +index d7445339f9a..f5b99d1cf7d 100755<br>
&gt;=C2=A0 --- a/gcc/configure<br>
&gt;=C2=A0 +++ b/gcc/configure<br>
&gt; -@@ -13090,8 +13090,8 @@ for f in $tm_file; do<br>
&gt; +@@ -13131,8 +13131,8 @@ for f in $tm_file; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tm_include_list=3D&quot;${tm_include=
_list} $f&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0defaults.h )<br>
&gt; @@ -54,10 +54,10 @@ index 3f0734bff11..c5d3bc4ee2d 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tm_file_list=3D&quot;${tm_file_list}=
 \$(srcdir)/config/$f&quot;<br>
&gt;=C2=A0 diff --git a/gcc/<a href=3D"http://configure.ac" rel=3D"noreferr=
er" target=3D"_blank">configure.ac</a> b/gcc/<a href=3D"http://configure.ac=
" rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt; -index 54e21764b3e..f83420326d6 100644<br>
&gt; +index fe488f2232b..29005f6d18f 100644<br>
&gt;=C2=A0 --- a/gcc/<a href=3D"http://configure.ac" rel=3D"noreferrer" tar=
get=3D"_blank">configure.ac</a><br>
&gt;=C2=A0 +++ b/gcc/<a href=3D"http://configure.ac" rel=3D"noreferrer" tar=
get=3D"_blank">configure.ac</a><br>
&gt; -@@ -2263,8 +2263,8 @@ for f in $tm_file; do<br>
&gt; +@@ -2294,8 +2294,8 @@ for f in $tm_file; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tm_include_list=3D&quot;${tm_include=
_list} $f&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0defaults.h )<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0005-cpp-honor-sysroot.patc=
h b/meta/recipes-devtools/gcc/gcc/0005-cpp-honor-sysroot.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..f2883fe074<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc/0005-cpp-honor-sysroot.patch<br>
&gt; @@ -0,0 +1,53 @@<br>
&gt; +From e6a820a19c4cd115d8af7c235c5f9700c7a24730 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; +Date: Fri, 29 Mar 2013 09:22:00 +0400<br>
&gt; +Subject: [PATCH] cpp: honor sysroot.<br>
&gt; +<br>
&gt; +Currently, if the gcc toolchain is relocated and installed from sstat=
e, then you try and compile<br>
&gt; +preprocessed source (.i or .ii files), the compiler will try and acce=
ss the builtin sysroot location<br>
&gt; +rather than the --sysroot option specified on the commandline. If acc=
ess to that directory is<br>
&gt; +permission denied (unreadable), gcc will error.<br>
&gt; +<br>
&gt; +This happens when ccache is in use due to the fact it uses preprocess=
ed source files.<br>
&gt; +<br>
&gt; +The fix below adds %I to the cpp-output spec macro so the default sub=
stitutions for -iprefix,<br>
&gt; +-isystem, -isysroot happen and the correct sysroot is used.<br>
&gt; +<br>
&gt; +[YOCTO #2074]<br>
&gt; +<br>
&gt; +RP 2012/04/13<br>
&gt; +<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Submitted [<a href=3D"https://gcc.gnu.org/pipermail/=
gcc-patches/2021-October/582725.html" rel=3D"noreferrer" target=3D"_blank">=
https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582725.html</a>]<br>
&gt; +---<br>
&gt; + gcc/cp/lang-specs.h | 2 +-<br>
&gt; + gcc/gcc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt; + 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/gcc/cp/lang-specs.h b/gcc/cp/lang-specs.h<br>
&gt; +index 8902ae1d2ed..e99e2fcd6ad 100644<br>
&gt; +--- a/gcc/cp/lang-specs.h<br>
&gt; ++++ b/gcc/cp/lang-specs.h<br>
&gt; +@@ -116,7 +116,7 @@ along with GCC; see the file COPYING3.=C2=A0 If n=
ot see<br>
&gt; +=C2=A0 =C2=A0{&quot;.ii&quot;, &quot;@c++-cpp-output&quot;, 0, 0, 0},=
<br>
&gt; +=C2=A0 =C2=A0{&quot;@c++-cpp-output&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%{!E:%{!M:%{!MM:&quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 cc1plus -fpreprocessed %i %(cc1_op=
tions) %2&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 cc1plus -fpreprocessed %i %I %(cc1=
_options) %2&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 %{!fsyntax-only:&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 %{fmodule-only:%{!S:-o=
 %g.s%V}}&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 %{!fmodule-only:%{!fmo=
dule-header*:%(invoke_as)}}}&quot;<br>
&gt; +diff --git a/gcc/gcc.c b/gcc/gcc.c<br>
&gt; +index b047fc31c2f..bdee2671532 100644<br>
&gt; +--- a/gcc/gcc.c<br>
&gt; ++++ b/gcc/gcc.c<br>
&gt; +@@ -1469,7 +1469,7 @@ static const struct compiler default_compilers[=
] =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 %W{o*:--output-pch=3D%*}}%V}}}}}}}&quot;, 0, 0, 0},<br>
&gt; +=C2=A0 =C2=A0{&quot;.i&quot;, &quot;@cpp-output&quot;, 0, 0, 0},<br>
&gt; +=C2=A0 =C2=A0{&quot;@cpp-output&quot;,<br>
&gt; +-=C2=A0 =C2=A0&quot;%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %(cc1_optio=
ns) %{!fsyntax-only:%(invoke_as)}}}}&quot;, 0, 0, 0},<br>
&gt; ++=C2=A0 =C2=A0&quot;%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %I %(cc1_op=
tions) %{!fsyntax-only:%(invoke_as)}}}}&quot;, 0, 0, 0},<br>
&gt; +=C2=A0 =C2=A0{&quot;.s&quot;, &quot;@assembler&quot;, 0, 0, 0},<br>
&gt; +=C2=A0 =C2=A0{&quot;@assembler&quot;,<br>
&gt; +=C2=A0 =C2=A0 &quot;%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_option=
s) %i %A }}}}&quot;, 0, 0, 0},<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_L=
INKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0006-D=
efine-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch<br>
&gt; similarity index 81%<br>
&gt; rename from meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_LI=
NKER-and-UCLIBC_DYNAMIC_LINKE.patch<br>
&gt; rename to meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINK=
ER-and-UCLIBC_DYNAMIC_LINKE.patch<br>
&gt; index 0884730786..ef19eef822 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_LINKER-a=
nd-UCLIBC_DYNAMIC_LINKE.patch<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINKER-a=
nd-UCLIBC_DYNAMIC_LINKE.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 8e9d6efecdc8c42f47e3a012dee764b13c3dad59 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 84dd8ea4c982fc2c82af642293d29e9c1880de5b Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Fri, 29 Mar 2013 09:24:50 +0400<br>
&gt;=C2=A0 Subject: [PATCH] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_=
LINKER<br>
&gt; @@ -12,25 +12,43 @@ SH, sparc, alpha for possible future support (if a=
ny)<br>
&gt;<br>
&gt;=C2=A0 Removes the do_headerfix task in metadata<br>
&gt;<br>
&gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; -<br>
&gt;=C2=A0 Upstream-Status: Inappropriate [OE configuration]<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt; - gcc/config/alpha/linux-elf.h |=C2=A0 4 ++--<br>
&gt; - gcc/config/arm/linux-eabi.h=C2=A0 |=C2=A0 4 ++--<br>
&gt; - gcc/config/arm/linux-elf.h=C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; - gcc/config/i386/linux.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; - gcc/config/i386/linux64.h=C2=A0 =C2=A0 |=C2=A0 6 +++---<br>
&gt; - gcc/config/linux.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8=
 ++++----<br>
&gt; - gcc/config/mips/linux.h=C2=A0 =C2=A0 =C2=A0 | 12 ++++++------<br>
&gt; - gcc/config/riscv/linux.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; - gcc/config/rs6000/linux64.h=C2=A0 | 15 +++++----------<br>
&gt; - gcc/config/sh/linux.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; - gcc/config/sparc/linux.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; - gcc/config/sparc/linux64.h=C2=A0 =C2=A0|=C2=A0 4 ++--<br>
&gt; - 12 files changed, 29 insertions(+), 34 deletions(-)<br>
&gt; + gcc/config/aarch64/aarch64-linux.h |=C2=A0 4 ++--<br>
&gt; + gcc/config/alpha/linux-elf.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++-=
-<br>
&gt; + gcc/config/arm/linux-eabi.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++-=
-<br>
&gt; + gcc/config/arm/linux-elf.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
2 +-<br>
&gt; + gcc/config/i386/linux.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
&gt; + gcc/config/i386/linux64.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
6 +++---<br>
&gt; + gcc/config/linux.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 8 ++++----<br>
&gt; + gcc/config/mips/linux.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
2 ++++++------<br>
&gt; + gcc/config/riscv/linux.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
&gt; + gcc/config/rs6000/linux64.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 15 +++++---=
-------<br>
&gt; + gcc/config/sh/linux.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 2 +-<br>
&gt; + gcc/config/sparc/linux.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
&gt; + gcc/config/sparc/linux64.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
4 ++--<br>
&gt; + 13 files changed, 31 insertions(+), 36 deletions(-)<br>
&gt;<br>
&gt; -unchanged:<br>
&gt; +diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/=
aarch64-linux.h<br>
&gt; +index 7f2529a2a1d..4bcae7f3110 100644<br>
&gt; +--- a/gcc/config/aarch64/aarch64-linux.h<br>
&gt; ++++ b/gcc/config/aarch64/aarch64-linux.h<br>
&gt; +@@ -21,10 +21,10 @@<br>
&gt; + #ifndef GCC_AARCH64_LINUX_H<br>
&gt; + #define GCC_AARCH64_LINUX_H<br>
&gt; +<br>
&gt; +-#define GLIBC_DYNAMIC_LINKER &quot;/lib/ld-linux-aarch64%{mbig-endia=
n:_be}%{mabi=3Dilp32:_ilp32}.so.1&quot;<br>
&gt; ++#define GLIBC_DYNAMIC_LINKER=C2=A0 SYSTEMLIBS_DIR &quot;ld-linux-aar=
ch64%{mbig-endian:_be}%{mabi=3Dilp32:_ilp32}.so.1&quot;<br>
&gt; +<br>
&gt; + #undef MUSL_DYNAMIC_LINKER<br>
&gt; +-#define MUSL_DYNAMIC_LINKER &quot;/lib/ld-musl-aarch64%{mbig-endian:=
_be}%{mabi=3Dilp32:_ilp32}.so.1&quot;<br>
&gt; ++#define MUSL_DYNAMIC_LINKER=C2=A0 SYSTEMLIBS_DIR &quot;ld-musl-aarch=
64%{mbig-endian:_be}%{mabi=3Dilp32:_ilp32}.so.1&quot;<br>
&gt; +<br>
&gt; + #undef=C2=A0 ASAN_CC1_SPEC<br>
&gt; + #define ASAN_CC1_SPEC &quot;%{%:sanitize(address):-funwind-tables}&q=
uot;<br>
&gt; +diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-el=
f.h<br>
&gt; +index c1dae8ca2cf..3ce2b76c1a4 100644<br>
&gt;=C2=A0 --- a/gcc/config/alpha/linux-elf.h<br>
&gt;=C2=A0 +++ b/gcc/config/alpha/linux-elf.h<br>
&gt;=C2=A0 @@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.=C2=A0 I=
f not see<br>
&gt; @@ -44,7 +62,8 @@ unchanged:<br>
&gt;=C2=A0 =C2=A0#if DEFAULT_LIBC =3D=3D LIBC_UCLIBC<br>
&gt;=C2=A0 =C2=A0#define CHOOSE_DYNAMIC_LINKER(G, U) &quot;%{mglibc:&quot; =
G &quot;;:&quot; U &quot;}&quot;<br>
&gt;=C2=A0 =C2=A0#elif DEFAULT_LIBC =3D=3D LIBC_GLIBC<br>
&gt; -unchanged:<br>
&gt; +diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.=
h<br>
&gt; +index 85d0136e76e..6bd95855827 100644<br>
&gt;=C2=A0 --- a/gcc/config/arm/linux-eabi.h<br>
&gt;=C2=A0 +++ b/gcc/config/arm/linux-eabi.h<br>
&gt;=C2=A0 @@ -65,8 +65,8 @@<br>
&gt; @@ -58,7 +77,8 @@ unchanged:<br>
&gt;=C2=A0 =C2=A0#define GLIBC_DYNAMIC_LINKER_DEFAULT GLIBC_DYNAMIC_LINKER_=
SOFT_FLOAT<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#define GLIBC_DYNAMIC_LINKER \<br>
&gt; -unchanged:<br>
&gt; +diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h<=
br>
&gt; +index 0c1c4e70b6b..6bd643ade11 100644<br>
&gt;=C2=A0 --- a/gcc/config/arm/linux-elf.h<br>
&gt;=C2=A0 +++ b/gcc/config/arm/linux-elf.h<br>
&gt;=C2=A0 @@ -60,7 +60,7 @@<br>
&gt; @@ -70,7 +90,8 @@ unchanged:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#define LINUX_TARGET_LINK_SPEC=C2=A0 &quot;%{h*} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 %{static:-Bstatic} \<br>
&gt; -unchanged:<br>
&gt; +diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h<br>
&gt; +index 04b274f1654..7aafcf3ac2d 100644<br>
&gt;=C2=A0 --- a/gcc/config/i386/linux.h<br>
&gt;=C2=A0 +++ b/gcc/config/i386/linux.h<br>
&gt;=C2=A0 @@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.=C2=A0 I=
f not see<br>
&gt; @@ -82,7 +103,8 @@ unchanged:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#undef MUSL_DYNAMIC_LINKER<br>
&gt;=C2=A0 =C2=A0#define MUSL_DYNAMIC_LINKER &quot;/lib/ld-musl-i386.so.1&q=
uot;<br>
&gt; -unchanged:<br>
&gt; +diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h<br=
>
&gt; +index b3822ced528..92d303e80d6 100644<br>
&gt;=C2=A0 --- a/gcc/config/i386/linux64.h<br>
&gt;=C2=A0 +++ b/gcc/config/i386/linux64.h<br>
&gt;=C2=A0 @@ -27,9 +27,9 @@ see the files COPYING3 and COPYING.RUNTIME res=
pectively.=C2=A0 If not, see<br>
&gt; @@ -98,7 +120,8 @@ unchanged:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#undef MUSL_DYNAMIC_LINKER32<br>
&gt;=C2=A0 =C2=A0#define MUSL_DYNAMIC_LINKER32 &quot;/lib/ld-musl-i386.so.1=
&quot;<br>
&gt; -unchanged:<br>
&gt; +diff --git a/gcc/config/linux.h b/gcc/config/linux.h<br>
&gt; +index 4e1db60fced..87efc5f69fe 100644<br>
&gt;=C2=A0 --- a/gcc/config/linux.h<br>
&gt;=C2=A0 +++ b/gcc/config/linux.h<br>
&gt;=C2=A0 @@ -94,10 +94,10 @@ see the files COPYING3 and COPYING.RUNTIME r=
espectively.=C2=A0 If not, see<br>
&gt; @@ -116,7 +139,8 @@ unchanged:<br>
&gt;=C2=A0 =C2=A0#define BIONIC_DYNAMIC_LINKER &quot;/system/bin/linker&quo=
t;<br>
&gt;=C2=A0 =C2=A0#define BIONIC_DYNAMIC_LINKER32 &quot;/system/bin/linker&q=
uot;<br>
&gt;=C2=A0 =C2=A0#define BIONIC_DYNAMIC_LINKER64 &quot;/system/bin/linker64=
&quot;<br>
&gt; -unchanged:<br>
&gt; +diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h<br>
&gt; +index 44a85e410d9..8d41b5574f6 100644<br>
&gt;=C2=A0 --- a/gcc/config/mips/linux.h<br>
&gt;=C2=A0 +++ b/gcc/config/mips/linux.h<br>
&gt;=C2=A0 @@ -22,20 +22,20 @@ along with GCC; see the file COPYING3.=C2=A0=
 If not see<br>
&gt; @@ -146,7 +170,8 @@ unchanged:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#undef MUSL_DYNAMIC_LINKER32<br>
&gt;=C2=A0 =C2=A0#define MUSL_DYNAMIC_LINKER32 \<br>
&gt; -unchanged:<br>
&gt; +diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h<br>
&gt; +index fce5b896e6e..03aa55cb5ab 100644<br>
&gt;=C2=A0 --- a/gcc/config/riscv/linux.h<br>
&gt;=C2=A0 +++ b/gcc/config/riscv/linux.h<br>
&gt;=C2=A0 @@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.=C2=A0 I=
f not see<br>
&gt; @@ -158,7 +183,8 @@ unchanged:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#define MUSL_ABI_SUFFIX \<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;%{mabi=3Dilp32:-sf}&quot; \<br>
&gt; -unchanged:<br>
&gt; +diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.=
h<br>
&gt; +index e3f2cd254f6..a11e01faa3d 100644<br>
&gt;=C2=A0 --- a/gcc/config/rs6000/linux64.h<br>
&gt;=C2=A0 +++ b/gcc/config/rs6000/linux64.h<br>
&gt;=C2=A0 @@ -336,24 +336,19 @@ extern int dot_symbols;<br>
&gt; @@ -191,7 +217,8 @@ unchanged:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#undef=C2=A0 DEFAULT_ASM_ENDIAN<br>
&gt;=C2=A0 =C2=A0#if (TARGET_DEFAULT &amp; MASK_LITTLE_ENDIAN)<br>
&gt; -unchanged:<br>
&gt; +diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h<br>
&gt; +index 7558d2f7195..3aaa6c3a078 100644<br>
&gt;=C2=A0 --- a/gcc/config/sh/linux.h<br>
&gt;=C2=A0 +++ b/gcc/config/sh/linux.h<br>
&gt;=C2=A0 @@ -64,7 +64,7 @@ along with GCC; see the file COPYING3.=C2=A0 I=
f not see<br>
&gt; @@ -203,7 +230,8 @@ unchanged:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#undef SUBTARGET_LINK_EMUL_SUFFIX<br>
&gt;=C2=A0 =C2=A0#define SUBTARGET_LINK_EMUL_SUFFIX &quot;%{mfdpic:_fd;:_li=
nux}&quot;<br>
&gt; -unchanged:<br>
&gt; +diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h<br>
&gt; +index 2550d7ee8f0..a94f4cd8ba2 100644<br>
&gt;=C2=A0 --- a/gcc/config/sparc/linux.h<br>
&gt;=C2=A0 +++ b/gcc/config/sparc/linux.h<br>
&gt;=C2=A0 @@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu (int =
argc, const char **argv);<br>
&gt; @@ -215,7 +243,8 @@ unchanged:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#undef=C2=A0 LINK_SPEC<br>
&gt;=C2=A0 =C2=A0#define LINK_SPEC &quot;-m elf32_sparc %{shared:-shared} \=
<br>
&gt; -unchanged:<br>
&gt; +diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h<=
br>
&gt; +index 95af8afa9b5..63127afb074 100644<br>
&gt;=C2=A0 --- a/gcc/config/sparc/linux64.h<br>
&gt;=C2=A0 +++ b/gcc/config/sparc/linux64.h<br>
&gt;=C2=A0 @@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.=C2=A0 I=
f not see<br>
&gt; @@ -229,19 +258,3 @@ unchanged:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#ifdef SPARC_BI_ARCH<br>
&gt;<br>
&gt; -diff -u b/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aar=
ch64-linux.h<br>
&gt; ---- b/gcc/config/aarch64/aarch64-linux.h<br>
&gt; -+++ b/gcc/config/aarch64/aarch64-linux.h<br>
&gt; -@@ -21,10 +21,10 @@<br>
&gt; - #ifndef GCC_AARCH64_LINUX_H<br>
&gt; - #define GCC_AARCH64_LINUX_H<br>
&gt; -<br>
&gt; --#define GLIBC_DYNAMIC_LINKER &quot;/lib/ld-linux-aarch64%{mbig-endia=
n:_be}%{mabi=3Dilp32:_ilp32}.so.1&quot;<br>
&gt; -+#define GLIBC_DYNAMIC_LINKER=C2=A0 SYSTEMLIBS_DIR &quot;ld-linux-aar=
ch64%{mbig-endian:_be}%{mabi=3Dilp32:_ilp32}.so.1&quot;<br>
&gt; -<br>
&gt; - #undef MUSL_DYNAMIC_LINKER<br>
&gt; --#define MUSL_DYNAMIC_LINKER &quot;/lib/ld-musl-aarch64%{mbig-endian:=
_be}%{mabi=3Dilp32:_ilp32}.so.1&quot;<br>
&gt; -+#define MUSL_DYNAMIC_LINKER=C2=A0 SYSTEMLIBS_DIR &quot;ld-musl-aarch=
64%{mbig-endian:_be}%{mabi=3Dilp32:_ilp32}.so.1&quot;<br>
&gt; -<br>
&gt; - #undef=C2=A0 ASAN_CC1_SPEC<br>
&gt; - #define ASAN_CC1_SPEC &quot;%{%:sanitize(address):-funwind-tables}&q=
uot;<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0007-gcc-Fix-argument-list-=
too-long-error.patch b/meta/recipes-devtools/gcc/gcc/0007-gcc-Fix-argument-=
list-too-long-error.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..9f9f8cc856<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc/0007-gcc-Fix-argument-list-too-lon=
g-error.patch<br>
&gt; @@ -0,0 +1,42 @@<br>
&gt; +From 768e9075e88d811b00207d991123438bb996e4ea Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; +Date: Fri, 29 Mar 2013 09:26:37 +0400<br>
&gt; +Subject: [PATCH] gcc: Fix argument list too long error.<br>
&gt; +<br>
&gt; +There would be an &quot;Argument list too long&quot; error when the<b=
r>
&gt; +build directory is longer than 200, this is caused by:<br>
&gt; +<br>
&gt; +headers=3D`echo $(PLUGIN_HEADERS) | tr &#39; &#39; &#39;\012&#39; | s=
ort -u`<br>
&gt; +<br>
&gt; +The PLUGIN_HEADERS is too long before sort, so the &quot;echo&quot; c=
an&#39;t handle<br>
&gt; +it, use the $(sort list) of GNU make which can handle the too long li=
st<br>
&gt; +would fix the problem, the header would be short enough after sorted.=
<br>
&gt; +The &quot;tr &#39; &#39; &#39;\012&#39;&quot; was used for translatin=
g the space to &quot;\n&quot;, the<br>
&gt; +$(sort list) doesn&#39;t need this.<br>
&gt; +<br>
&gt; +Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windrive=
r.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +<br>
&gt; +RP: gcc then added *.h and *.def additions to this list, breaking the=
 original<br>
&gt; +fix. Add the sort to the original gcc code, leaving the tr+sort to fi=
x the original<br>
&gt; +issue but include the new files too as reported by Zhuang &lt;<a href=
=3D"mailto:qiuguang.zqg@alibaba-inc.com" target=3D"_blank">qiuguang.zqg@ali=
baba-inc.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gcc.gnu.org/git/?p=3Dgc=
c.git;a=3Dcommit;h=3D66e157188bd2f789809e17e85f917534c9381599" rel=3D"noref=
errer" target=3D"_blank">https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=
=3D66e157188bd2f789809e17e85f917534c9381599</a>]<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + gcc/Makefile.in | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/gcc/Makefile.in b/gcc/Makefile.in<br>
&gt; +index 95962ae37b6..d1d4512bba3 100644<br>
&gt; +--- a/gcc/Makefile.in<br>
&gt; ++++ b/gcc/Makefile.in<br>
&gt; +@@ -3671,7 +3671,7 @@ install-plugin: installdirs lang.install-plugin=
 s-header-vars install-gengtype<br>
&gt; + # We keep the directory structure for files in config, common/config=
 or<br>
&gt; + # c-family and .def files. All other files are flattened to a single=
 directory.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(mkinstalldirs) $(DESTDIR)$(plugin_includ=
edir)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 headers=3D`echo $(PLUGIN_HEADERS) $$(cd $(srcdi=
r); echo *.h *.def) | tr &#39; &#39; &#39;\012&#39; | sort -u`; \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 headers=3D`echo $(sort $(PLUGIN_HEADERS)) $$(cd=
 $(srcdir); echo *.h *.def) | tr &#39; &#39; &#39;\012&#39; | sort -u`; \<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0srcdirstrip=3D`echo &quot;$(srcdir)&quot; =
| sed &#39;s/[].[^$$\\*|]/\\\\&amp;/g&#39;`; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for file in $$headers; do \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f $$file ] ; then \<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0014-libtool.patch b/meta/r=
ecipes-devtools/gcc/gcc/0008-libtool.patch<br>
&gt; similarity index 94%<br>
&gt; rename from meta/recipes-devtools/gcc/gcc/0014-libtool.patch<br>
&gt; rename to meta/recipes-devtools/gcc/gcc/0008-libtool.patch<br>
&gt; index f2b8924ebf..358e1d7b3c 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0014-libtool.patch<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc/0008-libtool.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From a5b984db9669cf38a7bd76c3fcdb41c086f740db Mon Sep 17 00:00:00 200=
1<br>
&gt; +From b19700ef0103f9414416b9a779a64d6138c58b1f Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Fri, 29 Mar 2013 09:29:11 +0400<br>
&gt;=C2=A0 Subject: [PATCH] libtool<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0009-cpp-honor-sysroot.patc=
h b/meta/recipes-devtools/gcc/gcc/0009-cpp-honor-sysroot.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 37f26f0728..0000000000<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0009-cpp-honor-sysroot.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,59 +0,0 @@<br>
&gt; -From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
&gt; -Subject: [PATCH 5/5] gcc: Pass sysroot options to cpp for preprocesse=
d source<br>
&gt; -<br>
&gt; -OpenEmbedded/Yocto Project extensively uses the --sysroot support wit=
hin gcc.<br>
&gt; -We discovered that when compiling preprocessed source (.i or .ii file=
s), the<br>
&gt; -compiler will try and access the builtin sysroot location rather than=
 the<br>
&gt; ---sysroot option specified on the commandline. If access to that dire=
ctory is<br>
&gt; -permission denied (unreadable), gcc will error. This is particularly =
problematic<br>
&gt; -when ccache is involved.<br>
&gt; -<br>
&gt; -This patch adds %I to the cpp-output spec macro so the default substi=
tutions for<br>
&gt; --iprefix, -isystem, -isysroot happen and the correct sysroot is used.=
<br>
&gt; -<br>
&gt; -2021-10-27 Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxf=
oundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;=
<br>
&gt; -<br>
&gt; -gcc/cp/ChangeLog:<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 * lang-specs.h: Pass sysroot options to cpp for preproc=
essed source<br>
&gt; -<br>
&gt; -gcc/ChangeLog:<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 * gcc.c: Pass sysroot options to cpp for preprocessed s=
ource<br>
&gt; -<br>
&gt; -Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@li=
nuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>=
&gt;<br>
&gt; -<br>
&gt; -[YOCTO #2074]<br>
&gt; -<br>
&gt; -Upstream-Status: Submitted [<a href=3D"https://gcc.gnu.org/pipermail/=
gcc-patches/2021-October/582725.html" rel=3D"noreferrer" target=3D"_blank">=
https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582725.html</a>]<br>
&gt; ----<br>
&gt; - gcc/cp/lang-specs.h | 2 +-<br>
&gt; - gcc/gcc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt; - 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt; -<br>
&gt; -Index: gcc-11.2.0/gcc/cp/lang-specs.h<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- gcc-11.2.0.orig/gcc/cp/lang-specs.h<br>
&gt; -+++ gcc-11.2.0/gcc/cp/lang-specs.h<br>
&gt; -@@ -116,7 +116,7 @@ along with GCC; see the file COPYING3.<br>
&gt; -=C2=A0 =C2=A0{&quot;.ii&quot;, &quot;@c++-cpp-output&quot;, 0, 0, 0},=
<br>
&gt; -=C2=A0 =C2=A0{&quot;@c++-cpp-output&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%{!E:%{!M:%{!MM:&quot;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 cc1plus -fpreprocessed %i %(cc1_op=
tions) %2&quot;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 cc1plus -fpreprocessed %i %I %(cc1=
_options) %2&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 %{!fsyntax-only:&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 %{fmodule-only:%{!S:-o=
 %g.s%V}}&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=C2=A0 =C2=A0 %{!fmodule-only:%{!fmo=
dule-header*:%(invoke_as)}}}&quot;<br>
&gt; -Index: gcc-11.2.0/gcc/gcc.c<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- gcc-11.2.0.orig/gcc/gcc.c<br>
&gt; -+++ gcc-11.2.0/gcc/gcc.c<br>
&gt; -@@ -1470,7 +1470,7 @@ static const struct compiler default_com<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 %W{o*:--output-pch=3D%*}}%V}}}}}}}&quot;, 0, 0, 0},<br>
&gt; -=C2=A0 =C2=A0{&quot;.i&quot;, &quot;@cpp-output&quot;, 0, 0, 0},<br>
&gt; -=C2=A0 =C2=A0{&quot;@cpp-output&quot;,<br>
&gt; --=C2=A0 =C2=A0&quot;%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %(cc1_optio=
ns) %{!fsyntax-only:%(invoke_as)}}}}&quot;, 0, 0, 0},<br>
&gt; -+=C2=A0 =C2=A0&quot;%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %I %(cc1_op=
tions) %{!fsyntax-only:%(invoke_as)}}}}&quot;, 0, 0, 0},<br>
&gt; -=C2=A0 =C2=A0{&quot;.s&quot;, &quot;@assembler&quot;, 0, 0, 0},<br>
&gt; -=C2=A0 =C2=A0{&quot;@assembler&quot;,<br>
&gt; -=C2=A0 =C2=A0 &quot;%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_option=
s) %i %A }}}}&quot;, 0, 0, 0},<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0015-gcc-armv4-pass-fix-v4b=
x-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc/0009-gcc-=
armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch<br>
&gt; similarity index 95%<br>
&gt; rename from meta/recipes-devtools/gcc/gcc/0015-gcc-armv4-pass-fix-v4bx=
-to-linker-to-support-EABI.patch<br>
&gt; rename to meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-t=
o-linker-to-support-EABI.patch<br>
&gt; index 1ccf39ceba..ac139542f1 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0015-gcc-armv4-pass-fix-v4bx-to-li=
nker-to-support-EABI.patch<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-li=
nker-to-support-EABI.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 0ae7090dec149cb2ff0c87eef87c043d4000ece1 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 10d23d93697167396e223711bf6210e1642ee926 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Fri, 29 Mar 2013 09:30:32 +0400<br>
&gt;=C2=A0 Subject: [PATCH] gcc: armv4: pass fix-v4bx to linker to support =
EABI.<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0016-Use-the-multilib-confi=
g-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc/0010-U=
se-the-multilib-config-files-from-B-instead-of-usin.patch<br>
&gt; similarity index 89%<br>
&gt; rename from meta/recipes-devtools/gcc/gcc/0016-Use-the-multilib-config=
-files-from-B-instead-of-usin.patch<br>
&gt; rename to meta/recipes-devtools/gcc/gcc/0010-Use-the-multilib-config-f=
iles-from-B-instead-of-usin.patch<br>
&gt; index bde7ec6609..4912fa9dce 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0016-Use-the-multilib-config-files=
-from-B-instead-of-usin.patch<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc/0010-Use-the-multilib-config-files=
-from-B-instead-of-usin.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 5ce8aa4615a3816d12c43752323154744517ae9f Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 5970fb3fadccd8c43f7f7030e6ff51e0295731ef Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Fri, 29 Mar 2013 09:33:04 +0400<br>
&gt;=C2=A0 Subject: [PATCH] Use the multilib config files from ${B} instead=
 of using the<br>
&gt; @@ -18,10 +18,10 @@ Upstream-Status: Inappropriate [configuration]<br>
&gt;=C2=A0 =C2=A02 files changed, 36 insertions(+), 8 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/gcc/configure b/gcc/configure<br>
&gt; -index 5160917d73e..e663052cad2 100755<br>
&gt; +index f5b99d1cf7d..ec3c24482df 100755<br>
&gt;=C2=A0 --- a/gcc/configure<br>
&gt;=C2=A0 +++ b/gcc/configure<br>
&gt; -@@ -13070,10 +13070,20 @@ done<br>
&gt; +@@ -13111,10 +13111,20 @@ done<br>
&gt;=C2=A0 =C2=A0tmake_file_=3D<br>
&gt;=C2=A0 =C2=A0for f in ${tmake_file}<br>
&gt;=C2=A0 =C2=A0do<br>
&gt; @@ -46,7 +46,7 @@ index 5160917d73e..e663052cad2 100755<br>
&gt;=C2=A0 =C2=A0done<br>
&gt;=C2=A0 =C2=A0tmake_file=3D&quot;${tmake_file_}${omp_device_property_tma=
ke_file}&quot;<br>
&gt;<br>
&gt; -@@ -13084,6 +13094,10 @@ tm_file_list=3D&quot;options.h&quot;<br>
&gt; +@@ -13125,6 +13135,10 @@ tm_file_list=3D&quot;options.h&quot;<br>
&gt;=C2=A0 =C2=A0tm_include_list=3D&quot;options.h insn-constants.h&quot;<b=
r>
&gt;=C2=A0 =C2=A0for f in $tm_file; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0case $f in<br>
&gt; @@ -58,10 +58,10 @@ index 5160917d73e..e663052cad2 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f=3D`echo $f | sed &#39;s/^..//&#39;=
`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tm_file_list=3D&quot;${tm_file_list}=
 $f&quot;<br>
&gt;=C2=A0 diff --git a/gcc/<a href=3D"http://configure.ac" rel=3D"noreferr=
er" target=3D"_blank">configure.ac</a> b/gcc/<a href=3D"http://configure.ac=
" rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt; -index 50f78308e8a..2b84875b028 100644<br>
&gt; +index 29005f6d18f..ea794cd1763 100644<br>
&gt;=C2=A0 --- a/gcc/<a href=3D"http://configure.ac" rel=3D"noreferrer" tar=
get=3D"_blank">configure.ac</a><br>
&gt;=C2=A0 +++ b/gcc/<a href=3D"http://configure.ac" rel=3D"noreferrer" tar=
get=3D"_blank">configure.ac</a><br>
&gt; -@@ -2243,10 +2243,20 @@ done<br>
&gt; +@@ -2274,10 +2274,20 @@ done<br>
&gt;=C2=A0 =C2=A0tmake_file_=3D<br>
&gt;=C2=A0 =C2=A0for f in ${tmake_file}<br>
&gt;=C2=A0 =C2=A0do<br>
&gt; @@ -86,7 +86,7 @@ index 50f78308e8a..2b84875b028 100644<br>
&gt;=C2=A0 =C2=A0done<br>
&gt;=C2=A0 =C2=A0tmake_file=3D&quot;${tmake_file_}${omp_device_property_tma=
ke_file}&quot;<br>
&gt;<br>
&gt; -@@ -2257,6 +2267,10 @@ tm_file_list=3D&quot;options.h&quot;<br>
&gt; +@@ -2288,6 +2298,10 @@ tm_file_list=3D&quot;options.h&quot;<br>
&gt;=C2=A0 =C2=A0tm_include_list=3D&quot;options.h insn-constants.h&quot;<b=
r>
&gt;=C2=A0 =C2=A0for f in $tm_file; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0case $f in<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0017-Avoid-using-libdir-fro=
m-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc/0011-A=
void-using-libdir-from-.la-which-usually-points-to-.patch<br>
&gt; similarity index 92%<br>
&gt; rename from meta/recipes-devtools/gcc/gcc/0017-Avoid-using-libdir-from=
-.la-which-usually-points-to-.patch<br>
&gt; rename to meta/recipes-devtools/gcc/gcc/0011-Avoid-using-libdir-from-.=
la-which-usually-points-to-.patch<br>
&gt; index 3e0a1b4136..e3e35942e6 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0017-Avoid-using-libdir-from-.la-w=
hich-usually-points-to-.patch<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc/0011-Avoid-using-libdir-from-.la-w=
hich-usually-points-to-.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 75a1ce0265ca123f74f17a40ad8bd8f26d9c2ab3 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 2af537b9ff0018945a27a7f89efad736a0f647d4 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Fri, 20 Feb 2015 09:39:38 +0000<br>
&gt;=C2=A0 Subject: [PATCH] Avoid using libdir from .la which usually point=
s to a host<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0019-Ensure-target-gcc-head=
ers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc/0012-Ensure-targe=
t-gcc-headers-can-be-included.patch<br>
&gt; similarity index 96%<br>
&gt; rename from meta/recipes-devtools/gcc/gcc/0019-Ensure-target-gcc-heade=
rs-can-be-included.patch<br>
&gt; rename to meta/recipes-devtools/gcc/gcc/0012-Ensure-target-gcc-headers=
-can-be-included.patch<br>
&gt; index 120d5a29b2..d33925eb40 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0019-Ensure-target-gcc-headers-can=
-be-included.patch<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc/0012-Ensure-target-gcc-headers-can=
-be-included.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 6f410ed8fb7eee11ba7a25634c2257666b98ef52 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 9427c6cedf88e15f747c48cb4fcf9eda6f5c4555 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Fri, 20 Feb 2015 10:25:11 +0000<br>
&gt;=C2=A0 Subject: [PATCH] Ensure target gcc headers can be included<br>
&gt; @@ -25,7 +25,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A04 files changed, 22 insertions(+)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/gcc/Makefile.in b/gcc/Makefile.in<br>
&gt; -index 59c45c81393..9b17d120aa1 100644<br>
&gt; +index d1d4512bba3..06eb0d27a28 100644<br>
&gt;=C2=A0 --- a/gcc/Makefile.in<br>
&gt;=C2=A0 +++ b/gcc/Makefile.in<br>
&gt;=C2=A0 @@ -630,6 +630,7 @@ libexecdir =3D @libexecdir@<br>
&gt; @@ -36,7 +36,7 @@ index 59c45c81393..9b17d120aa1 100644<br>
&gt;=C2=A0 =C2=A0# Directory in which the compiler finds executables<br>
&gt;=C2=A0 =C2=A0libexecsubdir =3D $(libexecdir)/gcc/$(real_target_noncanon=
ical)/$(version)$(accel_dir_suffix)<br>
&gt;=C2=A0 =C2=A0# Directory in which all plugin resources are installed<br=
>
&gt; -@@ -3016,6 +3017,7 @@ CFLAGS-intl.o +=3D -DLOCALEDIR=3D\&quot;$(local=
edir)\&quot;<br>
&gt; +@@ -3009,6 +3010,7 @@ CFLAGS-intl.o +=3D -DLOCALEDIR=3D\&quot;$(local=
edir)\&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0PREPROCESSOR_DEFINES =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-DGCC_INCLUDE_DIR=3D\&quot;$(libsubdir)/include\&qu=
ot; \<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-=
too-long-error.patch b/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-=
list-too-long-error.patch<br>
&gt; deleted file mode 100644<br>
&gt; index ebee30bbd6..0000000000<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-lon=
g-error.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,38 +0,0 @@<br>
&gt; -From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
&gt; -Subject: [PATCH 2/5] gcc: Fix &quot;argument list too long&quot; from=
 install-plugins<br>
&gt; -<br>
&gt; -When building in longer build paths (200+ characters), the<br>
&gt; -&quot;echo $(PLUGIN_HEADERS)&quot; from the install-plugins target wo=
uld cause an<br>
&gt; -&quot;argument list too long error&quot; on some systems.<br>
&gt; -<br>
&gt; -Avoid this by calling make&#39;s sort function on the list which remo=
ves<br>
&gt; -duplicates and stops the overflow from reaching the echo command.<br>
&gt; -The original sort is left to handle the the .h and .def files.<br>
&gt; -<br>
&gt; -2021-10-26 Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxf=
oundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;=
<br>
&gt; -<br>
&gt; -gcc/ChangeLog:<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 * Makefile.in: Fix &quot;argument list too long&quot; f=
rom install-plugins<br>
&gt; -<br>
&gt; -Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@li=
nuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>=
&gt;<br>
&gt; -<br>
&gt; -Submitted [<a href=3D"https://gcc.gnu.org/pipermail/gcc-patches/2021-=
October/582722.html" rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.o=
rg/pipermail/gcc-patches/2021-October/582722.html</a>]<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://gcc.gnu.org/git/?p=3Dgc=
c.git;a=3Dcommit;h=3D66e157188bd2f789809e17e85f917534c9381599" rel=3D"noref=
errer" target=3D"_blank">https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=
=3D66e157188bd2f789809e17e85f917534c9381599</a>]<br>
&gt; ----<br>
&gt; - gcc/Makefile.in | 2 +-<br>
&gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -Index: gcc-11.2.0/gcc/Makefile.in<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- gcc-11.2.0.orig/gcc/Makefile.in<br>
&gt; -+++ gcc-11.2.0/gcc/Makefile.in<br>
&gt; -@@ -3678,7 +3678,7 @@ install-plugin: installdirs lang.install<br>
&gt; - # We keep the directory structure for files in config, common/config=
 or<br>
&gt; - # c-family and .def files. All other files are flattened to a single=
 directory.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(mkinstalldirs) $(DESTDIR)$(plugin_includ=
edir)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 headers=3D`echo $(PLUGIN_HEADERS) $$(cd $(srcdi=
r); echo *.h *.def) | tr &#39; &#39; &#39;\012&#39; | sort -u`; \<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 headers=3D`echo $(sort $(PLUGIN_HEADERS)) $$(cd=
 $(srcdir); echo *.h *.def) | tr &#39; &#39; &#39;\012&#39; | sort -u`; \<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0srcdirstrip=3D`echo &quot;$(srcdir)&quot; =
| sed &#39;s/[].[^$$\\*|]/\\\\&amp;/g&#39;`; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0for file in $$headers; do \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f $$file ] ; then \<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0020-Don-t-search-host-dire=
ctory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc/0013-D=
on-t-search-host-directory-during-relink-if-inst_pr.patch<br>
&gt; similarity index 93%<br>
&gt; rename from meta/recipes-devtools/gcc/gcc/0020-Don-t-search-host-direc=
tory-during-relink-if-inst_pr.patch<br>
&gt; rename to meta/recipes-devtools/gcc/gcc/0013-Don-t-search-host-directo=
ry-during-relink-if-inst_pr.patch<br>
&gt; index bb2a3671f0..5b5d229eff 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0020-Don-t-search-host-directory-d=
uring-relink-if-inst_pr.patch<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc/0013-Don-t-search-host-directory-d=
uring-relink-if-inst_pr.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From cd09adb1e7f2a7e81a9f595a17c36f24911b90ac Mon Sep 17 00:00:00 200=
1<br>
&gt; +From ab6e6af5deca6f4b35b089a6b197776df38780e6 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Tue, 3 Mar 2015 08:21:19 +0000<br>
&gt;=C2=A0 Subject: [PATCH] Don&#39;t search host directory during &quot;re=
link&quot; if $inst_prefix<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0023-libcc1-fix-libcc1-s-in=
stall-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc/0014-libcc1-fix-=
libcc1-s-install-path-and-rpath.patch<br>
&gt; similarity index 90%<br>
&gt; rename from meta/recipes-devtools/gcc/gcc/0023-libcc1-fix-libcc1-s-ins=
tall-path-and-rpath.patch<br>
&gt; rename to meta/recipes-devtools/gcc/gcc/0014-libcc1-fix-libcc1-s-insta=
ll-path-and-rpath.patch<br>
&gt; index fb4511cc1a..b82277cc4b 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0023-libcc1-fix-libcc1-s-install-p=
ath-and-rpath.patch<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc/0014-libcc1-fix-libcc1-s-install-p=
ath-and-rpath.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 2cfc5ee38b3f5ec1d7965aae0991bcd48b5dc2e6 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From fd862c8c112067d8613d921ae89c99056aca54a1 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.co=
m" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;<br>
&gt;=C2=A0 Date: Sun, 5 Jul 2015 20:25:18 -0700<br>
&gt;=C2=A0 Subject: [PATCH] libcc1: fix libcc1&#39;s install path and rpath=
<br>
&gt; @@ -20,10 +20,10 @@ Signed-off-by: Robert Yang &lt;<a href=3D"mailto:l=
iezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&g=
t;<br>
&gt;=C2=A0 =C2=A02 files changed, 4 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/libcc1/Makefile.am b/libcc1/Makefile.am<br>
&gt; -index f148fdd7aa2..0b6eb8f2855 100644<br>
&gt; +index 3b75e7d9290..d3a4c4f9ddf 100644<br>
&gt;=C2=A0 --- a/libcc1/Makefile.am<br>
&gt;=C2=A0 +++ b/libcc1/Makefile.am<br>
&gt; -@@ -40,8 +40,8 @@ libiberty =3D $(if $(wildcard $(libiberty_noasan)),=
$(Wc)$(libiberty_noasan), \<br>
&gt; +@@ -41,8 +41,8 @@ libiberty =3D $(if $(wildcard $(libiberty_noasan)),=
$(Wc)$(libiberty_noasan), \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(Wc)$(libiberty_normal=
)))<br>
&gt;=C2=A0 =C2=A0libiberty_dep =3D $(patsubst $(Wc)%,%,$(libiberty))<br>
&gt;<br>
&gt; @@ -35,7 +35,7 @@ index f148fdd7aa2..0b6eb8f2855 100644<br>
&gt;=C2=A0 =C2=A0if ENABLE_PLUGIN<br>
&gt;=C2=A0 =C2=A0plugin_LTLIBRARIES =3D <a href=3D"http://libcc1plugin.la" =
rel=3D"noreferrer" target=3D"_blank">libcc1plugin.la</a> <a href=3D"http://=
libcp1plugin.la" rel=3D"noreferrer" target=3D"_blank">libcp1plugin.la</a><b=
r>
&gt;=C2=A0 diff --git a/libcc1/Makefile.in b/libcc1/Makefile.in<br>
&gt; -index 753d435c9cb..455627b0a3b 100644<br>
&gt; +index 07fa9d94c83..a9f737d78f2 100644<br>
&gt;=C2=A0 --- a/libcc1/Makefile.in<br>
&gt;=C2=A0 +++ b/libcc1/Makefile.in<br>
&gt;=C2=A0 @@ -398,8 +398,8 @@ libiberty =3D $(if $(wildcard $(libiberty_no=
asan)),$(Wc)$(libiberty_noasan), \<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0018-export-CPP.patch b/met=
a/recipes-devtools/gcc/gcc/0015-Makefile.in-Ensure-build-CPP-CPPFLAGS-is-us=
ed-for-bu.patch<br>
&gt; similarity index 79%<br>
&gt; rename from meta/recipes-devtools/gcc/gcc/0018-export-CPP.patch<br>
&gt; rename to meta/recipes-devtools/gcc/gcc/0015-Makefile.in-Ensure-build-=
CPP-CPPFLAGS-is-used-for-bu.patch<br>
&gt; index 86ab6574c7..45953f861d 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0018-export-CPP.patch<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc/0015-Makefile.in-Ensure-build-CPP-=
CPPFLAGS-is-used-for-bu.patch<br>
&gt; @@ -1,5 +1,8 @@<br>
&gt; +From 667b302f637be0a4b6ef714b5eb0026c54425386 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxf=
oundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;=
<br>
&gt; -Subject: [PATCH 1/5] Makefile.in: Ensure build CPP/CPPFLAGS is used f=
or build targets<br>
&gt; +Date: Sun, 31 Oct 2021 17:40:12 -0700<br>
&gt; +Subject: [PATCH] Makefile.in: Ensure build CPP/CPPFLAGS is used for b=
uild<br>
&gt; + targets<br>
&gt;<br>
&gt;=C2=A0 During cross compiling, CPP is being set to the target compiler =
even for<br>
&gt;=C2=A0 build targets. As an example, when building a cross compiler tar=
getting<br>
&gt; @@ -42,6 +45,8 @@ Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxf=
oundation.org</a>&gt;<br>
&gt;<br>
&gt;=C2=A0 Submitted [<a href=3D"https://gcc.gnu.org/pipermail/gcc-patches/=
2021-October/582727.html" rel=3D"noreferrer" target=3D"_blank">https://gcc.=
gnu.org/pipermail/gcc-patches/2021-October/582727.html</a>]<br>
&gt;=C2=A0 Upstream-Status: Backport [<a href=3D"https://gcc.gnu.org/git/?p=
=3Dgcc.git;a=3Dcommitdiff;h=3D84401ce5fb4ecab55decb472b168100e7593e01f" rel=
=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/git/?p=3Dgcc.git;a=3D=
commitdiff;h=3D84401ce5fb4ecab55decb472b168100e7593e01f</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0Makefile.in=C2=A0 =C2=A0 =C2=A0 | 6 ++++++<br>
&gt;=C2=A0 =C2=A0Makefile.tpl=C2=A0 =C2=A0 =C2=A0| 6 ++++++<br>
&gt; @@ -51,11 +56,11 @@ Upstream-Status: Backport [<a href=3D"https://gcc.=
gnu.org/git/?p=3Dgcc.git;a=3Dcommitdiff;h=3D844" rel=3D"noreferrer" target=
=3D"_blank">https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommitdiff;h=3D844</a>=
<br>
&gt;=C2=A0 =C2=A0gcc/<a href=3D"http://configure.ac" rel=3D"noreferrer" tar=
get=3D"_blank">configure.ac</a> | 2 +-<br>
&gt;=C2=A0 =C2=A06 files changed, 22 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; -Index: gcc-11.2.0/Makefile.in<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- gcc-11.2.0.orig/Makefile.in<br>
&gt; -+++ gcc-11.2.0/Makefile.in<br>
&gt; -@@ -151,6 +151,8 @@ BUILD_EXPORTS =3D \<br>
&gt; +diff --git a/Makefile.in b/Makefile.in<br>
&gt; +index 20cbbe2906d..33476d53327 100644<br>
&gt; +--- a/Makefile.in<br>
&gt; ++++ b/Makefile.in<br>
&gt; +@@ -154,6 +154,8 @@ BUILD_EXPORTS =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CC=3D&quot;$(CC_FOR_BUILD)&quot;; exp=
ort CC; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;$(CFLAGS_FOR_BUILD)&qu=
ot;; export CFLAGS; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG_SHELL=3D&quot;$(SHELL)&quot;; =
export CONFIG_SHELL; \<br>
&gt; @@ -64,7 +69,7 @@ Index: gcc-11.2.0/Makefile.in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CXX=3D&quot;$(CXX_FOR_BUILD)&quot;; e=
xport CXX; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CXXFLAGS=3D&quot;$(CXXFLAGS_FOR_BUILD=
)&quot;; export CXXFLAGS; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GFORTRAN=3D&quot;$(GFORTRAN_FOR_BUILD=
)&quot;; export GFORTRAN; \<br>
&gt; -@@ -198,6 +200,8 @@ HOST_EXPORTS =3D \<br>
&gt; +@@ -202,6 +204,8 @@ HOST_EXPORTS =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AR=3D&quot;$(AR)&quot;; export AR; \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AS=3D&quot;$(AS)&quot;; export AS; \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CC_FOR_BUILD=3D&quot;$(CC_FOR_BUILD)&=
quot;; export CC_FOR_BUILD; \<br>
&gt; @@ -72,8 +77,8 @@ Index: gcc-11.2.0/Makefile.in<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 CPPFLAGS_FOR_BUILD=3D&quot;$(CPPFLAGS_FOR_=
BUILD)&quot;; export CPPFLAGS_FOR_BUILD; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CXX_FOR_BUILD=3D&quot;$(CXX_FOR_BUILD=
)&quot;; export CXX_FOR_BUILD; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLLTOOL=3D&quot;$(DLLTOOL)&quot;; exp=
ort DLLTOOL; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0LD=3D&quot;$(LD)&quot;; export LD; \<br>
&gt; -@@ -353,6 +357,8 @@ AR_FOR_BUILD =3D @AR_FOR_BUILD@<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DSYMUTIL=3D&quot;$(DSYMUTIL)&quot;; export=
 DSYMUTIL; \<br>
&gt; +@@ -360,6 +364,8 @@ AR_FOR_BUILD =3D @AR_FOR_BUILD@<br>
&gt;=C2=A0 =C2=A0AS_FOR_BUILD =3D @AS_FOR_BUILD@<br>
&gt;=C2=A0 =C2=A0CC_FOR_BUILD =3D @CC_FOR_BUILD@<br>
&gt;=C2=A0 =C2=A0CFLAGS_FOR_BUILD =3D @CFLAGS_FOR_BUILD@<br>
&gt; @@ -82,11 +87,11 @@ Index: gcc-11.2.0/Makefile.in<br>
&gt;=C2=A0 =C2=A0CXXFLAGS_FOR_BUILD =3D @CXXFLAGS_FOR_BUILD@<br>
&gt;=C2=A0 =C2=A0CXX_FOR_BUILD =3D @CXX_FOR_BUILD@<br>
&gt;=C2=A0 =C2=A0DLLTOOL_FOR_BUILD =3D @DLLTOOL_FOR_BUILD@<br>
&gt; -Index: gcc-11.2.0/Makefile.tpl<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- gcc-11.2.0.orig/Makefile.tpl<br>
&gt; -+++ gcc-11.2.0/Makefile.tpl<br>
&gt; -@@ -154,6 +154,8 @@ BUILD_EXPORTS =3D \<br>
&gt; +diff --git a/Makefile.tpl b/Makefile.tpl<br>
&gt; +index 9adf4f94728..e39d85d1109 100644<br>
&gt; +--- a/Makefile.tpl<br>
&gt; ++++ b/Makefile.tpl<br>
&gt; +@@ -157,6 +157,8 @@ BUILD_EXPORTS =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CC=3D&quot;$(CC_FOR_BUILD)&quot;; exp=
ort CC; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;$(CFLAGS_FOR_BUILD)&qu=
ot;; export CFLAGS; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG_SHELL=3D&quot;$(SHELL)&quot;; =
export CONFIG_SHELL; \<br>
&gt; @@ -95,7 +100,7 @@ Index: gcc-11.2.0/Makefile.tpl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CXX=3D&quot;$(CXX_FOR_BUILD)&quot;; e=
xport CXX; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CXXFLAGS=3D&quot;$(CXXFLAGS_FOR_BUILD=
)&quot;; export CXXFLAGS; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GFORTRAN=3D&quot;$(GFORTRAN_FOR_BUILD=
)&quot;; export GFORTRAN; \<br>
&gt; -@@ -201,6 +203,8 @@ HOST_EXPORTS =3D \<br>
&gt; +@@ -205,6 +207,8 @@ HOST_EXPORTS =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AR=3D&quot;$(AR)&quot;; export AR; \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AS=3D&quot;$(AS)&quot;; export AS; \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CC_FOR_BUILD=3D&quot;$(CC_FOR_BUILD)&=
quot;; export CC_FOR_BUILD; \<br>
&gt; @@ -103,8 +108,8 @@ Index: gcc-11.2.0/Makefile.tpl<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 CPPFLAGS_FOR_BUILD=3D&quot;$(CPPFLAGS_FOR_=
BUILD)&quot;; export CPPFLAGS_FOR_BUILD; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CXX_FOR_BUILD=3D&quot;$(CXX_FOR_BUILD=
)&quot;; export CXX_FOR_BUILD; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLLTOOL=3D&quot;$(DLLTOOL)&quot;; exp=
ort DLLTOOL; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0LD=3D&quot;$(LD)&quot;; export LD; \<br>
&gt; -@@ -356,6 +360,8 @@ AR_FOR_BUILD =3D @AR_FOR_BUILD@<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DSYMUTIL=3D&quot;$(DSYMUTIL)&quot;; export=
 DSYMUTIL; \<br>
&gt; +@@ -363,6 +367,8 @@ AR_FOR_BUILD =3D @AR_FOR_BUILD@<br>
&gt;=C2=A0 =C2=A0AS_FOR_BUILD =3D @AS_FOR_BUILD@<br>
&gt;=C2=A0 =C2=A0CC_FOR_BUILD =3D @CC_FOR_BUILD@<br>
&gt;=C2=A0 =C2=A0CFLAGS_FOR_BUILD =3D @CFLAGS_FOR_BUILD@<br>
&gt; @@ -113,11 +118,11 @@ Index: gcc-11.2.0/Makefile.tpl<br>
&gt;=C2=A0 =C2=A0CXXFLAGS_FOR_BUILD =3D @CXXFLAGS_FOR_BUILD@<br>
&gt;=C2=A0 =C2=A0CXX_FOR_BUILD =3D @CXX_FOR_BUILD@<br>
&gt;=C2=A0 =C2=A0DLLTOOL_FOR_BUILD =3D @DLLTOOL_FOR_BUILD@<br>
&gt; -Index: gcc-11.2.0/configure<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- gcc-11.2.0.orig/configure<br>
&gt; -+++ gcc-11.2.0/configure<br>
&gt; -@@ -652,6 +652,8 @@ GFORTRAN_FOR_BUILD<br>
&gt; +diff --git a/configure b/configure<br>
&gt; +index 45744e6e471..ff0de8a68b4 100755<br>
&gt; +--- a/configure<br>
&gt; ++++ b/configure<br>
&gt; +@@ -655,6 +655,8 @@ DSYMUTIL_FOR_BUILD<br>
&gt;=C2=A0 =C2=A0DLLTOOL_FOR_BUILD<br>
&gt;=C2=A0 =C2=A0CXX_FOR_BUILD<br>
&gt;=C2=A0 =C2=A0CXXFLAGS_FOR_BUILD<br>
&gt; @@ -126,15 +131,15 @@ Index: gcc-11.2.0/configure<br>
&gt;=C2=A0 =C2=A0CFLAGS_FOR_BUILD<br>
&gt;=C2=A0 =C2=A0CC_FOR_BUILD<br>
&gt;=C2=A0 =C2=A0AS_FOR_BUILD<br>
&gt; -@@ -4092,6 +4094,7 @@ if test &quot;${build}&quot; !=3D &quot;${host}=
&quot; ; then<br>
&gt; +@@ -4100,6 +4102,7 @@ if test &quot;${build}&quot; !=3D &quot;${host}=
&quot; ; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0AR_FOR_BUILD=3D${AR_FOR_BUILD-ar}<br>
&gt;=C2=A0 =C2=A0 =C2=A0AS_FOR_BUILD=3D${AS_FOR_BUILD-as}<br>
&gt;=C2=A0 =C2=A0 =C2=A0CC_FOR_BUILD=3D${CC_FOR_BUILD-gcc}<br>
&gt;=C2=A0 +=C2=A0 CPP_FOR_BUILD=3D&quot;${CPP_FOR_BUILD-\$(CPP)}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0CXX_FOR_BUILD=3D${CXX_FOR_BUILD-g++}<br>
&gt; +=C2=A0 =C2=A0DSYMUTIL_FOR_BUILD=3D${DSYMUTIL_FOR_BUILD-dsymutil}<br>
&gt;=C2=A0 =C2=A0 =C2=A0GFORTRAN_FOR_BUILD=3D${GFORTRAN_FOR_BUILD-gfortran}=
<br>
&gt; -=C2=A0 =C2=A0GOC_FOR_BUILD=3D${GOC_FOR_BUILD-gccgo}<br>
&gt; -@@ -9809,6 +9812,7 @@ esac<br>
&gt; +@@ -9831,6 +9834,7 @@ esac<br>
&gt;=C2=A0 =C2=A0# our build compiler if desired.<br>
&gt;=C2=A0 =C2=A0if test x&quot;${build}&quot; =3D x&quot;${host}&quot; ; t=
hen<br>
&gt;=C2=A0 =C2=A0 =C2=A0CFLAGS_FOR_BUILD=3D${CFLAGS_FOR_BUILD-${CFLAGS}}<br=
>
&gt; @@ -142,19 +147,19 @@ Index: gcc-11.2.0/configure<br>
&gt;=C2=A0 =C2=A0 =C2=A0CXXFLAGS_FOR_BUILD=3D${CXXFLAGS_FOR_BUILD-${CXXFLAG=
S}}<br>
&gt;=C2=A0 =C2=A0 =C2=A0LDFLAGS_FOR_BUILD=3D${LDFLAGS_FOR_BUILD-${LDFLAGS}}=
<br>
&gt;=C2=A0 =C2=A0fi<br>
&gt; -Index: gcc-11.2.0/<a href=3D"http://configure.ac" rel=3D"noreferrer" =
target=3D"_blank">configure.ac</a><br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- gcc-11.2.0.orig/<a href=3D"http://configure.ac" rel=3D"noreferrer=
" target=3D"_blank">configure.ac</a><br>
&gt; -+++ gcc-11.2.0/<a href=3D"http://configure.ac" rel=3D"noreferrer" tar=
get=3D"_blank">configure.ac</a><br>
&gt; +diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
&gt; +index bf66b51373c..09fa3896dc7 100644<br>
&gt; +--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; ++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt;=C2=A0 @@ -1347,6 +1347,7 @@ if test &quot;${build}&quot; !=3D &quot;${=
host}&quot; ; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0AR_FOR_BUILD=3D${AR_FOR_BUILD-ar}<br>
&gt;=C2=A0 =C2=A0 =C2=A0AS_FOR_BUILD=3D${AS_FOR_BUILD-as}<br>
&gt;=C2=A0 =C2=A0 =C2=A0CC_FOR_BUILD=3D${CC_FOR_BUILD-gcc}<br>
&gt;=C2=A0 +=C2=A0 CPP_FOR_BUILD=3D&quot;${CPP_FOR_BUILD-\$(CPP)}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0CXX_FOR_BUILD=3D${CXX_FOR_BUILD-g++}<br>
&gt; +=C2=A0 =C2=A0DSYMUTIL_FOR_BUILD=3D${DSYMUTIL_FOR_BUILD-dsymutil}<br>
&gt;=C2=A0 =C2=A0 =C2=A0GFORTRAN_FOR_BUILD=3D${GFORTRAN_FOR_BUILD-gfortran}=
<br>
&gt; -=C2=A0 =C2=A0GOC_FOR_BUILD=3D${GOC_FOR_BUILD-gccgo}<br>
&gt; -@@ -3321,6 +3322,7 @@ esac<br>
&gt; +@@ -3336,6 +3337,7 @@ esac<br>
&gt;=C2=A0 =C2=A0# our build compiler if desired.<br>
&gt;=C2=A0 =C2=A0if test x&quot;${build}&quot; =3D x&quot;${host}&quot; ; t=
hen<br>
&gt;=C2=A0 =C2=A0 =C2=A0CFLAGS_FOR_BUILD=3D${CFLAGS_FOR_BUILD-${CFLAGS}}<br=
>
&gt; @@ -162,7 +167,7 @@ Index: gcc-11.2.0/<a href=3D"http://configure.ac" =
rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0CXXFLAGS_FOR_BUILD=3D${CXXFLAGS_FOR_BUILD-${CXXFLAG=
S}}<br>
&gt;=C2=A0 =C2=A0 =C2=A0LDFLAGS_FOR_BUILD=3D${LDFLAGS_FOR_BUILD-${LDFLAGS}}=
<br>
&gt;=C2=A0 =C2=A0fi<br>
&gt; -@@ -3387,6 +3389,8 @@ AC_SUBST(AR_FOR_BUILD)<br>
&gt; +@@ -3402,6 +3404,8 @@ AC_SUBST(AR_FOR_BUILD)<br>
&gt;=C2=A0 =C2=A0AC_SUBST(AS_FOR_BUILD)<br>
&gt;=C2=A0 =C2=A0AC_SUBST(CC_FOR_BUILD)<br>
&gt;=C2=A0 =C2=A0AC_SUBST(CFLAGS_FOR_BUILD)<br>
&gt; @@ -171,11 +176,11 @@ Index: gcc-11.2.0/<a href=3D"http://configure.ac=
" rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt;=C2=A0 =C2=A0AC_SUBST(CXXFLAGS_FOR_BUILD)<br>
&gt;=C2=A0 =C2=A0AC_SUBST(CXX_FOR_BUILD)<br>
&gt;=C2=A0 =C2=A0AC_SUBST(DLLTOOL_FOR_BUILD)<br>
&gt; -Index: gcc-11.2.0/gcc/configure<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- gcc-11.2.0.orig/gcc/configure<br>
&gt; -+++ gcc-11.2.0/gcc/configure<br>
&gt; -@@ -12699,7 +12699,7 @@ else<br>
&gt; +diff --git a/gcc/configure b/gcc/configure<br>
&gt; +index ec3c24482df..31a460dc9d0 100755<br>
&gt; +--- a/gcc/configure<br>
&gt; ++++ b/gcc/configure<br>
&gt; +@@ -12740,7 +12740,7 @@ else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CC=3D&quot;${CC_FOR_BUILD}&quot; CFLA=
GS=3D&quot;${CFLAGS_FOR_BUILD}&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CXX=3D&quot;${CXX_FOR_BUILD}&quot; CX=
XFLAGS=3D&quot;${CXXFLAGS_FOR_BUILD}&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LD=3D&quot;${LD_FOR_BUILD}&quot; LDFL=
AGS=3D&quot;${LDFLAGS_FOR_BUILD}&quot; \<br>
&gt; @@ -184,11 +189,11 @@ Index: gcc-11.2.0/gcc/configure<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${realsrcdir}/configure \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-=
languages=3D${enable_languages-all} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${enable_=
obsolete+--enable-obsolete=3D&quot;$enable_obsolete&quot;} \<br>
&gt; -Index: gcc-11.2.0/gcc/<a href=3D"http://configure.ac" rel=3D"noreferr=
er" target=3D"_blank">configure.ac</a><br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- gcc-11.2.0.orig/gcc/<a href=3D"http://configure.ac" rel=3D"norefe=
rrer" target=3D"_blank">configure.ac</a><br>
&gt; -+++ gcc-11.2.0/gcc/<a href=3D"http://configure.ac" rel=3D"noreferrer"=
 target=3D"_blank">configure.ac</a><br>
&gt; -@@ -2023,7 +2023,7 @@ else<br>
&gt; +diff --git a/gcc/<a href=3D"http://configure.ac" rel=3D"noreferrer" t=
arget=3D"_blank">configure.ac</a> b/gcc/<a href=3D"http://configure.ac" rel=
=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt; +index ea794cd1763..b965eb036bc 100644<br>
&gt; +--- a/gcc/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
&gt; ++++ b/gcc/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
&gt; +@@ -2054,7 +2054,7 @@ else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CC=3D&quot;${CC_FOR_BUILD}&quot; CFLA=
GS=3D&quot;${CFLAGS_FOR_BUILD}&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CXX=3D&quot;${CXX_FOR_BUILD}&quot; CX=
XFLAGS=3D&quot;${CXXFLAGS_FOR_BUILD}&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LD=3D&quot;${LD_FOR_BUILD}&quot; LDFL=
AGS=3D&quot;${LDFLAGS_FOR_BUILD}&quot; \<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0006-If-CXXFLAGS-contains-s=
omething-unsupported-by-the-bu.patch b/meta/recipes-devtools/gcc/gcc/0016-I=
f-CXXFLAGS-contains-something-unsupported-by-the-bu.patch<br>
&gt; similarity index 68%<br>
&gt; rename from meta/recipes-devtools/gcc/gcc/0006-If-CXXFLAGS-contains-so=
mething-unsupported-by-the-bu.patch<br>
&gt; rename to meta/recipes-devtools/gcc/gcc/0016-If-CXXFLAGS-contains-some=
thing-unsupported-by-the-bu.patch<br>
&gt; index 98a1bb2a66..7f807a991c 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0006-If-CXXFLAGS-contains-somethin=
g-unsupported-by-the-bu.patch<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc/0016-If-CXXFLAGS-contains-somethin=
g-unsupported-by-the-bu.patch<br>
&gt; @@ -1,8 +1,8 @@<br>
&gt; -From e700190743fa29ddaebd6ee075298a24b1688773 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 2c2a92573598ddbc33c023fe5d499191491fb523 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxf=
oundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;=
<br>
&gt;=C2=A0 Date: Thu, 28 Oct 2021 11:33:40 +0100<br>
&gt; -Subject: [PATCH 6/6] If CXXFLAGS contains something unsupported by th=
e build<br>
&gt; - CXX, we see build failures (e.g. using -fmacro-prefix-map for the ta=
rget).<br>
&gt; +Subject: [PATCH] If CXXFLAGS contains something unsupported by the bu=
ild CXX,<br>
&gt; + we see build failures (e.g. using -fmacro-prefix-map for the target)=
.<br>
&gt;<br>
&gt;=C2=A0 Pass CXXFLAGS_FOR_BUILD in a couple of places to avoid these err=
ors.<br>
&gt;<br>
&gt; @@ -13,19 +13,20 @@ ChangeLog:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 * Makefile.in: Regenerate.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 * Makefile.tpl: Add missing CXXFLAGS_FOR_BUILD ove=
rrides<br>
&gt;<br>
&gt; +Upstream-Status: Pending [should be submittable]<br>
&gt; +<br>
&gt;=C2=A0 Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purd=
ie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.or=
g</a>&gt;<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0Makefile.in=C2=A0 | 2 ++<br>
&gt;=C2=A0 =C2=A0Makefile.tpl | 2 ++<br>
&gt;=C2=A0 =C2=A02 files changed, 4 insertions(+)<br>
&gt;<br>
&gt; -Upstream-Status: Pending [should be submittable]<br>
&gt; -<br>
&gt; -Index: gcc-11.2.0/Makefile.in<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- gcc-11.2.0.orig/Makefile.in<br>
&gt; -+++ gcc-11.2.0/Makefile.in<br>
&gt; -@@ -172,6 +172,7 @@ BUILD_EXPORTS =3D \<br>
&gt; +diff --git a/Makefile.in b/Makefile.in<br>
&gt; +index 33476d53327..b949dffee0e 100644<br>
&gt; +--- a/Makefile.in<br>
&gt; ++++ b/Makefile.in<br>
&gt; +@@ -176,6 +176,7 @@ BUILD_EXPORTS =3D \<br>
&gt;=C2=A0 =C2=A0# built for the build system to override those in BASE_FLA=
GS_TO_PASS.<br>
&gt;=C2=A0 =C2=A0EXTRA_BUILD_FLAGS =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;$(CFLAGS_FOR_BUILD)&qu=
ot; \<br>
&gt; @@ -33,19 +34,19 @@ Index: gcc-11.2.0/Makefile.in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LDFLAGS=3D&quot;$(LDFLAGS_FOR_BUILD)&=
quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0# This is the list of directories to built for the host sy=
stem.<br>
&gt; -@@ -203,6 +204,7 @@ HOST_EXPORTS =3D \<br>
&gt; +@@ -207,6 +208,7 @@ HOST_EXPORTS =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPP_FOR_BUILD=3D&quot;$(CPP_FOR_BUILD=
)&quot;; export CPP_FOR_BUILD; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPPFLAGS_FOR_BUILD=3D&quot;$(CPPFLAGS=
_FOR_BUILD)&quot;; export CPPFLAGS_FOR_BUILD; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CXX_FOR_BUILD=3D&quot;$(CXX_FOR_BUILD=
)&quot;; export CXX_FOR_BUILD; \<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 CXXFLAGS_FOR_BUILD=3D&quot;$(CXXFLAGS_FOR_=
BUILD)&quot;; export CXXFLAGS_FOR_BUILD; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLLTOOL=3D&quot;$(DLLTOOL)&quot;; exp=
ort DLLTOOL; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DSYMUTIL=3D&quot;$(DSYMUTIL)&quot;; export=
 DSYMUTIL; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LD=3D&quot;$(LD)&quot;; export LD; \<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0LDFLAGS=3D&quot;$(STAGE1_LDFLAGS) $(LDFLAG=
S)&quot;; export LDFLAGS; \<br>
&gt; -Index: gcc-11.2.0/Makefile.tpl<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- gcc-11.2.0.orig/Makefile.tpl<br>
&gt; -+++ gcc-11.2.0/Makefile.tpl<br>
&gt; -@@ -175,6 +175,7 @@ BUILD_EXPORTS =3D \<br>
&gt; +diff --git a/Makefile.tpl b/Makefile.tpl<br>
&gt; +index e39d85d1109..d8520cbb164 100644<br>
&gt; +--- a/Makefile.tpl<br>
&gt; ++++ b/Makefile.tpl<br>
&gt; +@@ -179,6 +179,7 @@ BUILD_EXPORTS =3D \<br>
&gt;=C2=A0 =C2=A0# built for the build system to override those in BASE_FLA=
GS_TO_PASS.<br>
&gt;=C2=A0 =C2=A0EXTRA_BUILD_FLAGS =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;$(CFLAGS_FOR_BUILD)&qu=
ot; \<br>
&gt; @@ -53,11 +54,11 @@ Index: gcc-11.2.0/Makefile.tpl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LDFLAGS=3D&quot;$(LDFLAGS_FOR_BUILD)&=
quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0# This is the list of directories to built for the host sy=
stem.<br>
&gt; -@@ -206,6 +207,7 @@ HOST_EXPORTS =3D \<br>
&gt; +@@ -210,6 +211,7 @@ HOST_EXPORTS =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPP_FOR_BUILD=3D&quot;$(CPP_FOR_BUILD=
)&quot;; export CPP_FOR_BUILD; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPPFLAGS_FOR_BUILD=3D&quot;$(CPPFLAGS=
_FOR_BUILD)&quot;; export CPPFLAGS_FOR_BUILD; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CXX_FOR_BUILD=3D&quot;$(CXX_FOR_BUILD=
)&quot;; export CXX_FOR_BUILD; \<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 CXXFLAGS_FOR_BUILD=3D&quot;$(CXXFLAGS_FOR_=
BUILD)&quot;; export CXXFLAGS_FOR_BUILD; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DLLTOOL=3D&quot;$(DLLTOOL)&quot;; exp=
ort DLLTOOL; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DSYMUTIL=3D&quot;$(DSYMUTIL)&quot;; export=
 DSYMUTIL; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LD=3D&quot;$(LD)&quot;; export LD; \<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0LDFLAGS=3D&quot;$(STAGE1_LDFLAGS) $(LDFLAG=
S)&quot;; export LDFLAGS; \<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support=
-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc/0017-handle-sysroo=
t-support-for-nativesdk-gcc.patch<br>
&gt; similarity index 98%<br>
&gt; rename from meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-=
for-nativesdk-gcc.patch<br>
&gt; rename to meta/recipes-devtools/gcc/gcc/0017-handle-sysroot-support-fo=
r-nativesdk-gcc.patch<br>
&gt; index b1054fa749..5d86e4c12d 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-na=
tivesdk-gcc.patch<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc/0017-handle-sysroot-support-for-na=
tivesdk-gcc.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 354682ad8f71f62643dcd83f64b51b5979615a0c Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 68802ca536b01ab21cfa58e11ef332e30d9a3c5e Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 7 Dec 2015 23:39:54 +0000<br>
&gt;=C2=A0 Subject: [PATCH] handle sysroot support for nativesdk-gcc<br>
&gt; @@ -46,10 +46,10 @@ Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:ma=
rk.hatle@kernel.crashing.org" target=3D"_blank">mark.hatle@kernel.crashing.=
org</a>&gt;<br>
&gt;=C2=A0 =C2=A08 files changed, 94 insertions(+), 72 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/gcc/c-family/c-opts.c b/gcc/c-family/c-opts.c<br>
&gt; -index 89e05a4c551..5577383665d 100644<br>
&gt; +index 6f001e0bb6c..55ab07c278f 100644<br>
&gt;=C2=A0 --- a/gcc/c-family/c-opts.c<br>
&gt;=C2=A0 +++ b/gcc/c-family/c-opts.c<br>
&gt; -@@ -1436,8 +1436,8 @@ add_prefixed_path (const char *suffix, incpath_=
kind chain)<br>
&gt; +@@ -1438,8 +1438,8 @@ add_prefixed_path (const char *suffix, incpath_=
kind chain)<br>
&gt;=C2=A0 =C2=A0 =C2=A0size_t prefix_len, suffix_len;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0suffix_len =3D strlen (suffix);<br>
&gt; @@ -378,7 +378,7 @@ index fd3c655db1c..20669ac427d 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 subdirectory of the actual installation.=C2=A0 */<=
br>
&gt;=C2=A0 =C2=A0extern const char *gcc_exec_prefix;<br>
&gt;=C2=A0 diff --git a/gcc/gcc.c b/gcc/gcc.c<br>
&gt; -index 8737bae5353..aa6fbe43965 100644<br>
&gt; +index bdee2671532..36e8af38630 100644<br>
&gt;=C2=A0 --- a/gcc/gcc.c<br>
&gt;=C2=A0 +++ b/gcc/gcc.c<br>
&gt;=C2=A0 @@ -252,6 +252,8 @@ FILE *report_times_to_file =3D NULL;<br>
&gt; @@ -398,7 +398,7 @@ index 8737bae5353..aa6fbe43965 100644<br>
&gt;=C2=A0 =C2=A0 %S=C2=A0 =C2=A0 =C2=A0process STARTFILE_SPEC as a spec.=
=C2=A0 A capital S is actually used here.<br>
&gt;=C2=A0 =C2=A0 %E=C2=A0 =C2=A0 =C2=A0process ENDFILE_SPEC as a spec.=C2=
=A0 A capital E is actually used here.<br>
&gt;=C2=A0 =C2=A0 %C=C2=A0 =C2=A0 =C2=A0process CPP_SPEC as a spec.<br>
&gt; -@@ -1621,10 +1624,10 @@ static const char *gcc_libexec_prefix;<br>
&gt; +@@ -1620,10 +1623,10 @@ static const char *gcc_libexec_prefix;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gcc_exec_prefix is set because, in that case, we k=
now where the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 compiler has been installed, and use paths relativ=
e to that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 location instead.=C2=A0 */<br>
&gt; @@ -413,7 +413,7 @@ index 8737bae5353..aa6fbe43965 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0/* For native compilers, these are well-known paths contai=
ning<br>
&gt;=C2=A0 =C2=A0 =C2=A0 components that may be provided by the system.=C2=
=A0 For cross<br>
&gt; -@@ -1632,9 +1635,9 @@ static const char *const standard_startfile_pre=
fix =3D STANDARD_STARTFILE_PREFIX;<br>
&gt; +@@ -1631,9 +1634,9 @@ static const char *const standard_startfile_pre=
fix =3D STANDARD_STARTFILE_PREFIX;<br>
&gt;=C2=A0 =C2=A0static const char *md_exec_prefix =3D MD_EXEC_PREFIX;<br>
&gt;=C2=A0 =C2=A0static const char *md_startfile_prefix =3D MD_STARTFILE_PR=
EFIX;<br>
&gt;=C2=A0 =C2=A0static const char *md_startfile_prefix_1 =3D MD_STARTFILE_=
PREFIX_1;<br>
&gt; @@ -425,7 +425,7 @@ index 8737bae5353..aa6fbe43965 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0=3D STANDARD_STARTFILE_PREFIX_2;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0/* A relative path to be used in finding the location of t=
ools<br>
&gt; -@@ -6564,6 +6567,11 @@ do_spec_1 (const char *spec, int inswitch, con=
st char *soft_matched_part)<br>
&gt; +@@ -6570,6 +6573,11 @@ do_spec_1 (const char *spec, int inswitch, con=
st char *soft_matched_part)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0025-Search-target-sysroot-=
gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc/0018-S=
earch-target-sysroot-gcc-version-specific-dirs-with.patch<br>
&gt; similarity index 92%<br>
&gt; rename from meta/recipes-devtools/gcc/gcc/0025-Search-target-sysroot-g=
cc-version-specific-dirs-with.patch<br>
&gt; rename to meta/recipes-devtools/gcc/gcc/0018-Search-target-sysroot-gcc=
-version-specific-dirs-with.patch<br>
&gt; index ff622b1056..0f43e985cf 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0025-Search-target-sysroot-gcc-ver=
sion-specific-dirs-with.patch<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc/0018-Search-target-sysroot-gcc-ver=
sion-specific-dirs-with.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From c55e24459370ad96577496ecd87475e3a9de7dad Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 14291076874b133e7fb67ef1714b768a2c48ea44 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 7 Dec 2015 23:41:45 +0000<br>
&gt;=C2=A0 Subject: [PATCH] Search target sysroot gcc version specific dirs=
 with<br>
&gt; @@ -51,10 +51,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A01 file changed, 28 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/gcc/gcc.c b/gcc/gcc.c<br>
&gt; -index aa6fbe43965..f8a71a13826 100644<br>
&gt; +index 36e8af38630..d1faa788d60 100644<br>
&gt;=C2=A0 --- a/gcc/gcc.c<br>
&gt;=C2=A0 +++ b/gcc/gcc.c<br>
&gt; -@@ -2811,7 +2811,7 @@ for_each_path (const struct path_prefix *paths,=
<br>
&gt; +@@ -2810,7 +2810,7 @@ for_each_path (const struct path_prefix *paths,=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (path =3D=3D NULL)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D paths-&gt;max_len + ex=
tra_space + 1;<br>
&gt; @@ -63,7 +63,7 @@ index aa6fbe43965..f8a71a13826 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D XNEWVEC (char, len);<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; -@@ -2823,6 +2823,33 @@ for_each_path (const struct path_prefix *paths=
,<br>
&gt; +@@ -2822,6 +2822,33 @@ for_each_path (const struct path_prefix *paths=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Look first in MACHINE/VERSI=
ON subdirectory.=C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!skip_multi_dir)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0019-nios2-Define-MUSL_DYNA=
MIC_LINKER.patch b/meta/recipes-devtools/gcc/gcc/0019-nios2-Define-MUSL_DYN=
AMIC_LINKER.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..76ebfd7f77<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc/0019-nios2-Define-MUSL_DYNAMIC_LIN=
KER.patch<br>
&gt; @@ -0,0 +1,25 @@<br>
&gt; +From 9ec4db8e910d9a51ae43f6b20d4bf1dac2d8cca8 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; +Date: Tue, 2 Feb 2016 10:26:10 -0800<br>
&gt; +Subject: [PATCH] nios2: Define MUSL_DYNAMIC_LINKER<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gcc.gnu.org/git/?p=3Dgc=
c.git;a=3Dcommitdiff;h=3De5ddbbf992b909d8e38851bd3179d29389e6ac97" rel=3D"n=
oreferrer" target=3D"_blank">https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommi=
tdiff;h=3De5ddbbf992b909d8e38851bd3179d29389e6ac97</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Marek Vasut &lt;<a href=3D"mailto:marex@denx.de" targe=
t=3D"_blank">marex@denx.de</a>&gt;<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + gcc/config/nios2/linux.h | 1 +<br>
&gt; + 1 file changed, 1 insertion(+)<br>
&gt; +<br>
&gt; +diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h<br>
&gt; +index 08edf1521f6..15696d86241 100644<br>
&gt; +--- a/gcc/config/nios2/linux.h<br>
&gt; ++++ b/gcc/config/nios2/linux.h<br>
&gt; +@@ -30,6 +30,7 @@<br>
&gt; + #define CPP_SPEC &quot;%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRA=
NT}&quot;<br>
&gt; +<br>
&gt; + #define GLIBC_DYNAMIC_LINKER &quot;/lib/ld-linux-nios2.so.1&quot;<br=
>
&gt; ++#define MUSL_DYNAMIC_LINKER=C2=A0 &quot;/lib/ld-musl-nios2.so.1&quot=
;<br>
&gt; +<br>
&gt; + #undef LINK_SPEC<br>
&gt; + #define LINK_SPEC LINK_SPEC_ENDIAN \<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0028-Add-ssp_nonshared-to-l=
ink-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc/0020-A=
dd-ssp_nonshared-to-link-commandline-for-musl-targe.patch<br>
&gt; similarity index 84%<br>
&gt; rename from meta/recipes-devtools/gcc/gcc/0028-Add-ssp_nonshared-to-li=
nk-commandline-for-musl-targe.patch<br>
&gt; rename to meta/recipes-devtools/gcc/gcc/0020-Add-ssp_nonshared-to-link=
-commandline-for-musl-targe.patch<br>
&gt; index 9c616d24d0..b82fa44537 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0028-Add-ssp_nonshared-to-link-com=
mandline-for-musl-targe.patch<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc/0020-Add-ssp_nonshared-to-link-com=
mandline-for-musl-targe.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 745a2ac7825c73102b888226c54397d21512f86b Mon Sep 17 00:00:00 200=
1<br>
&gt; +From af72a47a677ce98c08cb73444bdd741ca8e28422 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Tue, 27 Jun 2017 18:10:54 -0700<br>
&gt;=C2=A0 Subject: [PATCH] Add ssp_nonshared to link commandline for musl =
targets<br>
&gt; @@ -22,9 +22,11 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.k=
hem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0gcc/config/rs6000/linux64.h | 10 ++++++++++<br>
&gt;=C2=A0 =C2=A03 files changed, 27 insertions(+)<br>
&gt;<br>
&gt; +diff --git a/gcc/config/linux.h b/gcc/config/linux.h<br>
&gt; +index ba02c013e30..8fcaa0c9faf 100644<br>
&gt;=C2=A0 --- a/gcc/config/linux.h<br>
&gt;=C2=A0 +++ b/gcc/config/linux.h<br>
&gt; -@@ -203,6 +203,13 @@ see the files COPYING3 and COPYING.RUNTI<br>
&gt; +@@ -203,6 +203,13 @@ see the files COPYING3 and COPYING.RUNTIME respe=
ctively.=C2=A0 If not, see<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ GCC_INCLUDE_DIRVAR, &quot;GCC&quot;, 0, 1,=
 0, 0 },=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 0, 0, 0, 0, 0, 0 }=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -38,6 +40,8 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0#endif<br>
&gt;<br>
&gt;=C2=A0 =C2=A0#if (DEFAULT_LIBC =3D=3D LIBC_UCLIBC) &amp;&amp; defined (=
SINGLE_LIBC) /* uClinux */<br>
&gt; +diff --git a/gcc/config/rs6000/linux.h b/gcc/config/rs6000/linux.h<br=
>
&gt; +index 47c9d9ac0b6..d065f88b377 100644<br>
&gt;=C2=A0 --- a/gcc/config/rs6000/linux.h<br>
&gt;=C2=A0 +++ b/gcc/config/rs6000/linux.h<br>
&gt;=C2=A0 @@ -94,6 +94,16 @@<br>
&gt; @@ -57,6 +61,8 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0#undef LINK_OS_LINUX_SPEC<br>
&gt;=C2=A0 =C2=A0#define LINK_OS_LINUX_SPEC LINK_OS_LINUX_EMUL &quot; %{!sh=
ared: %{!static: \<br>
&gt;=C2=A0 =C2=A0 =C2=A0%{!static-pie: \<br>
&gt; +diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.=
h<br>
&gt; +index a11e01faa3d..ce464f3626b 100644<br>
&gt;=C2=A0 --- a/gcc/config/rs6000/linux64.h<br>
&gt;=C2=A0 +++ b/gcc/config/rs6000/linux64.h<br>
&gt;=C2=A0 @@ -369,6 +369,16 @@ extern int dot_symbols;<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0029-Link-libgcc-using-LDFL=
AGS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gcc/0021-Link-=
libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch<br>
&gt; similarity index 93%<br>
&gt; rename from meta/recipes-devtools/gcc/gcc/0029-Link-libgcc-using-LDFLA=
GS-not-just-SHLIB_LDFLAGS.patch<br>
&gt; rename to meta/recipes-devtools/gcc/gcc/0021-Link-libgcc-using-LDFLAGS=
-not-just-SHLIB_LDFLAGS.patch<br>
&gt; index b74aeb8bb6..9b7c5c5642 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0029-Link-libgcc-using-LDFLAGS-not=
-just-SHLIB_LDFLAGS.patch<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc/0021-Link-libgcc-using-LDFLAGS-not=
-just-SHLIB_LDFLAGS.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 695adb4dffb23c6f5cbc757e05cf4187a2bd6528 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 79a568dec47baa264eb6290fed3df3244450a92e Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 4 May 2016 21:11:34 -0700<br>
&gt;=C2=A0 Subject: [PATCH] Link libgcc using LDFLAGS, not just SHLIB_LDFLA=
GS<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0030-sync-gcc-stddef.h-with=
-musl.patch b/meta/recipes-devtools/gcc/gcc/0022-sync-gcc-stddef.h-with-mus=
l.patch<br>
&gt; similarity index 97%<br>
&gt; rename from meta/recipes-devtools/gcc/gcc/0030-sync-gcc-stddef.h-with-=
musl.patch<br>
&gt; rename to meta/recipes-devtools/gcc/gcc/0022-sync-gcc-stddef.h-with-mu=
sl.patch<br>
&gt; index fd7d604e98..86fb22ffd3 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0030-sync-gcc-stddef.h-with-musl.p=
atch<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc/0022-sync-gcc-stddef.h-with-musl.p=
atch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From a9173429ae256c4b4a3ab4d758a6adf42f8c4239 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 07a06aa8e8285c1bb06d0bebeaa9ad04eb76f2e2 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Fri, 3 Feb 2017 12:56:00 -0800<br>
&gt;=C2=A0 Subject: [PATCH] sync gcc stddef.h with musl<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0033-Re-introduce-spe-comma=
ndline-options.patch b/meta/recipes-devtools/gcc/gcc/0023-Re-introduce-spe-=
commandline-options.patch<br>
&gt; similarity index 90%<br>
&gt; rename from meta/recipes-devtools/gcc/gcc/0033-Re-introduce-spe-comman=
dline-options.patch<br>
&gt; rename to meta/recipes-devtools/gcc/gcc/0023-Re-introduce-spe-commandl=
ine-options.patch<br>
&gt; index 129f555a48..23cf02a6e4 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0033-Re-introduce-spe-commandline-=
options.patch<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc/0023-Re-introduce-spe-commandline-=
options.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 0b900d6410b7c1938e86eceb87b032fd538566a9 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From ca73043041c3c7aa86af9a3d4f316abc87eb3254 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 6 Jun 2018 12:10:22 -0700<br>
&gt;=C2=A0 Subject: [PATCH] Re-introduce spe commandline options<br>
&gt; @@ -14,7 +14,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A01 file changed, 13 insertions(+)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/gcc/config/rs6000/rs6000.opt b/gcc/config/rs6000/rs=
6000.opt<br>
&gt; -index 0dbdf753673..b273eb65c35 100644<br>
&gt; +index 6b0a3e27529..1bd2e356ac9 100644<br>
&gt;=C2=A0 --- a/gcc/config/rs6000/rs6000.opt<br>
&gt;=C2=A0 +++ b/gcc/config/rs6000/rs6000.opt<br>
&gt;=C2=A0 @@ -352,6 +352,19 @@ mdebug=3D<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0034-libgcc_s-Use-alias-for=
-__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc/0024-l=
ibgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch<br>
&gt; similarity index 94%<br>
&gt; rename from meta/recipes-devtools/gcc/gcc/0034-libgcc_s-Use-alias-for-=
__cpu_indicator_init-instead-.patch<br>
&gt; rename to meta/recipes-devtools/gcc/gcc/0024-libgcc_s-Use-alias-for-__=
cpu_indicator_init-instead-.patch<br>
&gt; index 3f666dc7bd..f915f284ea 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0034-libgcc_s-Use-alias-for-__cpu_=
indicator_init-instead-.patch<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc/0024-libgcc_s-Use-alias-for-__cpu_=
indicator_init-instead-.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From ea9154338cb3acbd75945fddde4202e73c20dd1a Mon Sep 17 00:00:00 200=
1<br>
&gt; +From b3957bc1fd52ec427a1b71b10055905cab4bbc7c Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Szabolcs Nagy &lt;<a href=3D"mailto:nsz@port70.net" target=
=3D"_blank">nsz@port70.net</a>&gt;<br>
&gt;=C2=A0 Date: Sat, 24 Oct 2015 20:09:53 +0000<br>
&gt;=C2=A0 Subject: [PATCH] libgcc_s: Use alias for __cpu_indicator_init in=
stead of<br>
&gt; @@ -39,10 +39,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A03 files changed, 6 insertions(+), 6 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/gcc/config/i386/i386-expand.c b/gcc/config/i386/i38=
6-expand.c<br>
&gt; -index ac69eed4d32..ffaa44a16fc 100644<br>
&gt; +index 31eae75d277..ec7e858ec83 100644<br>
&gt;=C2=A0 --- a/gcc/config/i386/i386-expand.c<br>
&gt;=C2=A0 +++ b/gcc/config/i386/i386-expand.c<br>
&gt; -@@ -11038,10 +11038,10 @@ ix86_expand_builtin (tree exp, rtx target, =
rtx subtarget,<br>
&gt; +@@ -11066,10 +11066,10 @@ ix86_expand_builtin (tree exp, rtx target, =
rtx subtarget,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case IX86_BUILTIN_CPU_INIT:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0035-gentypes-genmodes-Do-n=
ot-use-__LINE__-for-maintainin.patch b/meta/recipes-devtools/gcc/gcc/0025-g=
entypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch<br>
&gt; similarity index 98%<br>
&gt; rename from meta/recipes-devtools/gcc/gcc/0035-gentypes-genmodes-Do-no=
t-use-__LINE__-for-maintainin.patch<br>
&gt; rename to meta/recipes-devtools/gcc/gcc/0025-gentypes-genmodes-Do-not-=
use-__LINE__-for-maintainin.patch<br>
&gt; index 874cd7798d..f33193ebcf 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0035-gentypes-genmodes-Do-not-use-=
__LINE__-for-maintainin.patch<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc/0025-gentypes-genmodes-Do-not-use-=
__LINE__-for-maintainin.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 520411cf364ee4b0b5a8f0857498aaabd790afb3 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 5fd90d243ae14034a4699443110070dafc0d4d30 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxf=
oundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;=
<br>
&gt;=C2=A0 Date: Tue, 10 Mar 2020 08:26:53 -0700<br>
&gt;=C2=A0 Subject: [PATCH] gentypes/genmodes: Do not use __LINE__ for main=
taining<br>
&gt; @@ -17,7 +17,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A02 files changed, 19 insertions(+), 19 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/gcc/gengtype.c b/gcc/gengtype.c<br>
&gt; -index 5f50242e857..cbaca9b8cd0 100644<br>
&gt; +index 98d4626f87e..f602da8b501 100644<br>
&gt;=C2=A0 --- a/gcc/gengtype.c<br>
&gt;=C2=A0 +++ b/gcc/gengtype.c<br>
&gt;=C2=A0 @@ -991,7 +991,7 @@ create_field_at (pair_p next, type_p type, c=
onst char *name, options_p opt,<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0036-mingw32-Enable-operati=
on_not_supported.patch b/meta/recipes-devtools/gcc/gcc/0026-mingw32-Enable-=
operation_not_supported.patch<br>
&gt; similarity index 93%<br>
&gt; rename from meta/recipes-devtools/gcc/gcc/0036-mingw32-Enable-operatio=
n_not_supported.patch<br>
&gt; rename to meta/recipes-devtools/gcc/gcc/0026-mingw32-Enable-operation_=
not_supported.patch<br>
&gt; index 3a7618c820..b46bde1eda 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0036-mingw32-Enable-operation_not_=
supported.patch<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc/0026-mingw32-Enable-operation_not_=
supported.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 96d895c8d5dc895d24fe37aa2b4f201a2566b4cc Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 7bc34769f0b055e25286576e4ba6d211e8159834 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Tue, 12 May 2020 10:39:09 -0700<br>
&gt;=C2=A0 Subject: [PATCH] mingw32: Enable operation_not_supported<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0037-libatomic-Do-not-enfor=
ce-march-on-aarch64.patch b/meta/recipes-devtools/gcc/gcc/0027-libatomic-Do=
-not-enforce-march-on-aarch64.patch<br>
&gt; similarity index 85%<br>
&gt; rename from meta/recipes-devtools/gcc/gcc/0037-libatomic-Do-not-enforc=
e-march-on-aarch64.patch<br>
&gt; rename to meta/recipes-devtools/gcc/gcc/0027-libatomic-Do-not-enforce-=
march-on-aarch64.patch<br>
&gt; index 4c9a79cb64..85b1251482 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0037-libatomic-Do-not-enforce-marc=
h-on-aarch64.patch<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc/0027-libatomic-Do-not-enforce-marc=
h-on-aarch64.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 36d4fdbc99e69f9d70a29e2bada40cc3c1534557 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From df1c63bbd7a520e8c6d0d0692b4d8bff56952394 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 13 May 2020 15:10:38 -0700<br>
&gt;=C2=A0 Subject: [PATCH] libatomic: Do not enforce march on aarch64<br>
&gt; @@ -17,7 +17,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A02 files changed, 2 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/libatomic/Makefile.am b/libatomic/Makefile.am<br>
&gt; -index 0f3cd6f7121..c8124c1d5aa 100644<br>
&gt; +index ab8c2da24a1..f614a46b34d 100644<br>
&gt;=C2=A0 --- a/libatomic/Makefile.am<br>
&gt;=C2=A0 +++ b/libatomic/Makefile.am<br>
&gt;=C2=A0 @@ -125,7 +125,6 @@ libatomic_la_LIBADD =3D $(foreach s,$(SIZES)=
,$(addsuffix _$(s)_.lo,$(SIZEOBJS)))<br>
&gt; @@ -29,14 +29,14 @@ index 0f3cd6f7121..c8124c1d5aa 100644<br>
&gt;=C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0if ARCH_ARM_LINUX<br>
&gt;=C2=A0 diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in<br>
&gt; -index 0a51bd55f01..6d5b1581706 100644<br>
&gt; +index 80d25653dc7..7377689ab34 100644<br>
&gt;=C2=A0 --- a/libatomic/Makefile.in<br>
&gt;=C2=A0 +++ b/libatomic/Makefile.in<br>
&gt; -@@ -432,7 +432,6 @@ M_SRC =3D $(firstword $(filter %/$(M_FILE), $(all=
_c_files)))<br>
&gt; +@@ -434,7 +434,6 @@ M_SRC =3D $(firstword $(filter %/$(M_FILE), $(all=
_c_files)))<br>
&gt;=C2=A0 =C2=A0libatomic_la_LIBADD =3D $(foreach s,$(SIZES),$(addsuffix \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_$(s)_.lo,$(SIZEOBJS))) $(am__append_=
1) $(am__append_2) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(am__append_3) $(am__append_4)<br>
&gt;=C2=A0 -@ARCH_AARCH64_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS =3D -ma=
rch=3Darmv8-a+lse<br>
&gt;=C2=A0 =C2=A0@ARCH_ARM_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS =3D -m=
arch=3Darmv7-a+fp -DHAVE_KERNEL64<br>
&gt;=C2=A0 =C2=A0@ARCH_I386_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS =3D -march=
=3Di586<br>
&gt; - @ARCH_X86_64_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS =3D -mcx16<br>
&gt; + @ARCH_X86_64_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS =3D -mcx16 -mcx16<b=
r>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_DYNA=
MIC_LINKER.patch b/meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_DYN=
AMIC_LINKER.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 97c271373b..0000000000<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_DYNAMIC_LIN=
KER.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,31 +0,0 @@<br>
&gt; -From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
&gt; -Subject: [PATCH 4/5] gcc/nios2: Define the musl linker<br>
&gt; -<br>
&gt; -Add a definition of the musl linker used on the nios2 platform.<br>
&gt; -<br>
&gt; -2021-10-26 Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxf=
oundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;=
<br>
&gt; -<br>
&gt; -gcc/ChangeLog:<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 * config/nios2/linux.h (MUSL_DYNAMIC_LINKER): Add musl =
linker<br>
&gt; -<br>
&gt; -Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@li=
nuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>=
&gt;<br>
&gt; -<br>
&gt; -Submitted [<a href=3D"https://gcc.gnu.org/pipermail/gcc-patches/2021-=
October/582723.html" rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.o=
rg/pipermail/gcc-patches/2021-October/582723.html</a>]<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://gcc.gnu.org/git/?p=3Dgc=
c.git;a=3Dcommitdiff;h=3De5ddbbf992b909d8e38851bd3179d29389e6ac97" rel=3D"n=
oreferrer" target=3D"_blank">https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommi=
tdiff;h=3De5ddbbf992b909d8e38851bd3179d29389e6ac97</a>]<br>
&gt; ----<br>
&gt; - gcc/config/nios2/linux.h | 1 +<br>
&gt; - 1 file changed, 1 insertion(+)<br>
&gt; -<br>
&gt; -Index: gcc-11.2.0/gcc/config/nios2/linux.h<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- gcc-11.2.0.orig/gcc/config/nios2/linux.h<br>
&gt; -+++ gcc-11.2.0/gcc/config/nios2/linux.h<br>
&gt; -@@ -30,6 +30,7 @@<br>
&gt; - #define CPP_SPEC &quot;%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRA=
NT}&quot;<br>
&gt; -<br>
&gt; - #define GLIBC_DYNAMIC_LINKER &quot;/lib/ld-linux-nios2.so.1&quot;<br=
>
&gt; -+#define MUSL_DYNAMIC_LINKER=C2=A0 &quot;/lib/ld-musl-nios2.so.1&quot=
;<br>
&gt; -<br>
&gt; - #undef LINK_SPEC<br>
&gt; - #define LINK_SPEC LINK_SPEC_ENDIAN \<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0041-apply-debug-prefix-map=
s-before-checksumming-DIEs.patch b/meta/recipes-devtools/gcc/gcc/0028-debug=
-101473-apply-debug-prefix-maps-before-checksum.patch<br>
&gt; similarity index 81%<br>
&gt; rename from meta/recipes-devtools/gcc/gcc/0041-apply-debug-prefix-maps=
-before-checksumming-DIEs.patch<br>
&gt; rename to meta/recipes-devtools/gcc/gcc/0028-debug-101473-apply-debug-=
prefix-maps-before-checksum.patch<br>
&gt; index c8dcd74b9d..de06793482 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0041-apply-debug-prefix-maps-befor=
e-checksumming-DIEs.patch<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc/0028-debug-101473-apply-debug-pref=
ix-maps-before-checksum.patch<br>
&gt; @@ -1,7 +1,8 @@<br>
&gt; -From 7cc2df084b7977653a9b59cbc34a9ad500ae619c Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 49008eeedc97014f44e12afe179d3785e4438372 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Richard Biener &lt;<a href=3D"mailto:rguenther@suse.de" ta=
rget=3D"_blank">rguenther@suse.de</a>&gt;<br>
&gt;=C2=A0 Date: Tue, 20 Jul 2021 11:00:33 +0200<br>
&gt; -Subject: [PATCH] debug/101473 - apply debug prefix maps before checks=
umming DIEs<br>
&gt; +Subject: [PATCH] debug/101473 - apply debug prefix maps before checks=
umming<br>
&gt; + DIEs<br>
&gt;<br>
&gt;=C2=A0 The following makes sure to apply the debug prefix maps to filen=
ames<br>
&gt;=C2=A0 before checksumming DIEs to create the global symbol for the CU =
DIE<br>
&gt; @@ -36,10 +37,15 @@ The upstream patch was modified to compensate for =
the definition of<br>
&gt;=C2=A0 this version of gcc.<br>
&gt;<br>
&gt;=C2=A0 Signed-off-by: Tony Battersby &lt;<a href=3D"mailto:tonyb@cybern=
etics.com" target=3D"_blank">tonyb@cybernetics.com</a>&gt;<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt; -diff -urpN a/gcc/dwarf2out.c b/gcc/dwarf2out.c<br>
&gt; ---- a/gcc/dwarf2out.c=C2=A0 2021-04-27 06:00:13.000000000 -0400<br>
&gt; -+++ b/gcc/dwarf2out.c=C2=A0 2021-07-23 16:40:06.141886167 -0400<br>
&gt; + gcc/dwarf2out.c | 13 +++++++------<br>
&gt; + 1 file changed, 7 insertions(+), 6 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/gcc/dwarf2out.c b/gcc/dwarf2out.c<br>
&gt; +index e5d3ce4966d..41ac3008507 100644<br>
&gt; +--- a/gcc/dwarf2out.c<br>
&gt; ++++ b/gcc/dwarf2out.c<br>
&gt;=C2=A0 @@ -1283,6 +1283,7 @@ dwarf2out_switch_text_section (void)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0/* Data about a single source file.=C2=A0 */<br>
&gt; @@ -48,7 +54,7 @@ diff -urpN a/gcc/dwarf2out.c b/gcc/dwarf2out.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0const char * filename;<br>
&gt;=C2=A0 =C2=A0 =C2=A0int emitted_number;<br>
&gt;=C2=A0 =C2=A0};<br>
&gt; -@@ -12334,7 +12335,7 @@ file_name_acquire (dwarf_file_data **slo<br>
&gt; +@@ -12335,7 +12336,7 @@ file_name_acquire (dwarf_file_data **slot, fi=
le_name_acquire_data *fnad)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0fi =3D fnad-&gt;files + fnad-&gt;used_files++;<br>
&gt;<br>
&gt; @@ -57,7 +63,7 @@ diff -urpN a/gcc/dwarf2out.c b/gcc/dwarf2out.c<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/* Skip all leading &quot;./&quot;.=C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0while (f[0] =3D=3D &#39;.&#39; &amp;&amp; IS_DIR_SE=
PARATOR (f[1]))<br>
&gt; -@@ -27231,13 +27232,13 @@ dwarf2out_ignore_block (const_tree block<br=
>
&gt; +@@ -27259,13 +27260,13 @@ dwarf2out_ignore_block (const_tree block)<b=
r>
&gt;=C2=A0 =C2=A0bool<br>
&gt;=C2=A0 =C2=A0dwarf_file_hasher::equal (dwarf_file_data *p1, const char =
*p2)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; @@ -73,7 +79,7 @@ diff -urpN a/gcc/dwarf2out.c b/gcc/dwarf2out.c<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;<br>
&gt;=C2=A0 =C2=A0/* Lookup FILE_NAME (in the list of filenames that we know=
 about here in<br>
&gt; -@@ -27267,7 +27268,8 @@ lookup_filename (const char *file_name)<br>
&gt; +@@ -27295,7 +27296,8 @@ lookup_filename (const char *file_name)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return *slot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0created =3D ggc_alloc&lt;dwarf_file_data&gt; ();<br=
>
&gt; @@ -83,7 +89,7 @@ diff -urpN a/gcc/dwarf2out.c b/gcc/dwarf2out.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0created-&gt;emitted_number =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0*slot =3D created;<br>
&gt;=C2=A0 =C2=A0 =C2=A0return created;<br>
&gt; -@@ -27293,8 +27295,7 @@ maybe_emit_file (struct dwarf_file_data<br>
&gt; +@@ -27321,8 +27323,7 @@ maybe_emit_file (struct dwarf_file_data * fd)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (output_asm_line_debug_info ())<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf (asm_out_file, &quot;\=
t.file %u &quot;, fd-&gt;emitted_number);<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0001-Fix-install-path-of-li=
nux64.h.patch b/meta/recipes-devtools/gcc/gcc/0029-Fix-install-path-of-linu=
x64.h.patch<br>
&gt; similarity index 81%<br>
&gt; rename from meta/recipes-devtools/gcc/gcc/0001-Fix-install-path-of-lin=
ux64.h.patch<br>
&gt; rename to meta/recipes-devtools/gcc/gcc/0029-Fix-install-path-of-linux=
64.h.patch<br>
&gt; index 5bf895d6e7..d7e156e7a3 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0001-Fix-install-path-of-linux64.h=
.patch<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc/0029-Fix-install-path-of-linux64.h=
.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 58211c7ceb0510b2a11a7f1da3c7fa968c658749 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 8a62cc0a64670e39f462c1dbbf82e04d2f03b89e Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Andrei Gherzan &lt;<a href=3D"mailto:andrei.gherzan@huawei=
.com" target=3D"_blank">andrei.gherzan@huawei.com</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 22 Dec 2021 12:49:25 +0100<br>
&gt;=C2=A0 Subject: [PATCH] Fix install path of linux64.h<br>
&gt; @@ -11,15 +11,16 @@ adapts the install path of linux64.h to match the =
include in tm.h.<br>
&gt;=C2=A0 Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei.gherz=
an@huawei.com" target=3D"_blank">andrei.gherzan@huawei.com</a>&gt;<br>
&gt;<br>
&gt;=C2=A0 Upstream-Status: Inappropriate [configuration]<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0gcc/Makefile.in | 2 ++<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/gcc/Makefile.in b/gcc/Makefile.in<br>
&gt; -index 9b17d120a..d175ec4e3 100644<br>
&gt; +index 06eb0d27a28..a8678ca24ed 100644<br>
&gt;=C2=A0 --- a/gcc/Makefile.in<br>
&gt;=C2=A0 +++ b/gcc/Makefile.in<br>
&gt; -@@ -3693,6 +3693,8 @@ install-plugin: installdirs lang.install-plugin=
 s-header-vars install-gengtype<br>
&gt; +@@ -3686,6 +3686,8 @@ install-plugin: installdirs lang.install-plugin=
 s-header-vars install-gengtype<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$(srcdir)&quot;/config/*=
 | &quot;$(srcdir)&quot;/common/config/* \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| &quot;$(srcdir)&quot;/c-fami=
ly/* | &quot;$(srcdir)&quot;/*.def ) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base=3D`echo &quot;$$pa=
th&quot; | sed -e &quot;s|$$srcdirstrip/||&quot;`;; \<br>
&gt; @@ -28,6 +29,3 @@ index 9b17d120a..d175ec4e3 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*) base=3D`basename $$path` ;;=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esac; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dest=3D$(plugin_includedir)/$$=
base; \<br>
&gt; ---<br>
&gt; -2.25.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-=
init.patch b/meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.=
patch<br>
&gt; deleted file mode 100644<br>
&gt; index 3fb9ee98de..0000000000<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.pa=
tch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,23 +0,0 @@<br>
&gt; -The patch is needed in order to support recent glibc (2.34).<br>
&gt; -<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://gcc.gnu.org/git/?p=3Dgc=
c.git;a=3Dcommit;h=3D91f8a7a34cf29ae7c465603a801326767f1cc7e9" rel=3D"noref=
errer" target=3D"_blank">https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=
=3D91f8a7a34cf29ae7c465603a801326767f1cc7e9</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@li=
nuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>=
&gt;<br>
&gt; -<br>
&gt; ----<br>
&gt; ---- a/libsanitizer/sanitizer_common/sanitizer_posix_libcdep.cpp=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 2022-03-15 07:59:54.515325204 -0700<br>
&gt; -+++ b/libsanitizer/sanitizer_common/sanitizer_posix_libcdep.cpp=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 2022-03-15 08:01:45.919405931 -0700<br>
&gt; -@@ -166,9 +166,10 @@<br>
&gt; - #if !SANITIZER_GO<br>
&gt; - // TODO(glider): different tools may require different altstack size=
.<br>
&gt; - static uptr GetAltStackSize() {<br>
&gt; --=C2=A0 // SIGSTKSZ is not enough.<br>
&gt; --=C2=A0 static const uptr kAltStackSize =3D SIGSTKSZ * 4;<br>
&gt; --=C2=A0 return kAltStackSize;<br>
&gt; -+=C2=A0 // Note: since GLIBC_2.31, SIGSTKSZ may be a function call, s=
o this may be<br>
&gt; -+=C2=A0 // more costly that you think. However GetAltStackSize is onl=
y call 2-3 times<br>
&gt; -+=C2=A0 // per thread so don&#39;t cache the evaluation.<br>
&gt; -+=C2=A0 return SIGSTKSZ * 4;<br>
&gt; - }<br>
&gt; -<br>
&gt; - void SetAlternateSignalStack() {<br>
&gt; diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://gcc_11.2.bb" =
rel=3D"noreferrer" target=3D"_blank">gcc_11.2.bb</a> b/meta/recipes-devtool=
s/gcc/<a href=3D"http://gcc_11.3.bb" rel=3D"noreferrer" target=3D"_blank">g=
cc_11.3.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/gcc/<a href=3D"http://gcc_11.2.bb" r=
el=3D"noreferrer" target=3D"_blank">gcc_11.2.bb</a><br>
&gt; rename to meta/recipes-devtools/gcc/<a href=3D"http://gcc_11.3.bb" rel=
=3D"noreferrer" target=3D"_blank">gcc_11.3.bb</a><br>
&gt; diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://libgcc-initia=
l_11.2.bb" rel=3D"noreferrer" target=3D"_blank">libgcc-initial_11.2.bb</a> =
b/meta/recipes-devtools/gcc/<a href=3D"http://libgcc-initial_11.3.bb" rel=
=3D"noreferrer" target=3D"_blank">libgcc-initial_11.3.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/gcc/<a href=3D"http://libgcc-initial=
_11.2.bb" rel=3D"noreferrer" target=3D"_blank">libgcc-initial_11.2.bb</a><b=
r>
&gt; rename to meta/recipes-devtools/gcc/<a href=3D"http://libgcc-initial_1=
1.3.bb" rel=3D"noreferrer" target=3D"_blank">libgcc-initial_11.3.bb</a><br>
&gt; diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://libgcc_11.2.b=
b" rel=3D"noreferrer" target=3D"_blank">libgcc_11.2.bb</a> b/meta/recipes-d=
evtools/gcc/<a href=3D"http://libgcc_11.3.bb" rel=3D"noreferrer" target=3D"=
_blank">libgcc_11.3.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/gcc/<a href=3D"http://libgcc_11.2.bb=
" rel=3D"noreferrer" target=3D"_blank">libgcc_11.2.bb</a><br>
&gt; rename to meta/recipes-devtools/gcc/<a href=3D"http://libgcc_11.3.bb" =
rel=3D"noreferrer" target=3D"_blank">libgcc_11.3.bb</a><br>
&gt; diff --git a/meta/recipes-devtools/gcc/<a href=3D"http://libgfortran_1=
1.2.bb" rel=3D"noreferrer" target=3D"_blank">libgfortran_11.2.bb</a> b/meta=
/recipes-devtools/gcc/<a href=3D"http://libgfortran_11.3.bb" rel=3D"norefer=
rer" target=3D"_blank">libgfortran_11.3.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/gcc/<a href=3D"http://libgfortran_11=
.2.bb" rel=3D"noreferrer" target=3D"_blank">libgfortran_11.2.bb</a><br>
&gt; rename to meta/recipes-devtools/gcc/<a href=3D"http://libgfortran_11.3=
.bb" rel=3D"noreferrer" target=3D"_blank">libgfortran_11.3.bb</a><br>
&gt; --<br>
&gt; 2.35.1<br>
&gt;<br>
</blockquote></div>

--00000000000082d81805e0601872--

