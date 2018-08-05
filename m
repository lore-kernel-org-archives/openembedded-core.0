Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 01BFB78AF9
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Aug 2018 20:07:09 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id y9-v6so12111351wma.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2018 13:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vgYzboeaqcINY1X9Gz62hFnR76KZjBP/BSe4z8AOa60=;
	b=cffG2+5UJxliQ+NcT+3B3iuzKBjRuy7gDXpObmYwBgb0NpEHLf+yuUoiVTzHM66/Va
	y8i9fD0R4NAXrbJM2KmhGr3wwqMl7KpQoGcEaFarfjcqk2g8+CSgwlGjgKETMtH3dxwe
	g2odIGUxMzoWH/k7Aq0qvc/+XS3Wg67lXccjEQFva+v50CMJmfSfiKediEf6nq2kmGms
	29puem4oNZqwXHh4TuEg+6UyRxGjaMGtuzXRMEvNrLcL/zyiUA/qJVuVpT75GX4uP+tu
	2qgsfhXdFj5U7j5oc6M/TqKjfVZmcahbfQl9dkwhrSCnz7c5yQwqHmzBu1B2C0lds9Fy
	s45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vgYzboeaqcINY1X9Gz62hFnR76KZjBP/BSe4z8AOa60=;
	b=eDsE8oyQV/c4JkQKVbc5Lfbe217D91lQ9yHkDs8yxsSdLdbE0GlEDcXArjmTXnh9ox
	B82ZOPZ3gRM2dv6uDy5Hx3dPTLJzb1bxAyLQTNDGMh3p2IIDbczSjXKnOjdsnTcbHa2S
	2y0GgsJKmVDlhx1xrVGzFLm1oti41LrbjwrIFfEN6WlWDxk4luiztjpFyehN0KpmD4/+
	UnVUpqoaIHKAxkkyeKijPV2/mfDsNwuXInU7Vk2DACriOw9rPJ3VDdgFddqHzFYfDcSw
	kg3tZOv0Crgjv0O1qTVO+2qiCg3eZwIIpAZplL7zs8mpQQT0BvkRl3xaD1RFENt7fmL2
	Vsrg==
X-Gm-Message-State: AOUpUlF5bFCx8QoaYV6N6ub85Hn2yaD45gpd1HzHcjHNDOOQzWkngf6l
	u73/b2OKTzDQnicm+IJ45ja5iFr/etxqBg3uQY1jwNej
X-Google-Smtp-Source: AAOMgpey7kDvabxN8h5NpAxh7rzQrB73YfSL0yCO16K+s6wjhh3V+92Hxi0pbMdGRn+ixdzTzXcAmHBC1bdIuvAziZI=
X-Received: by 2002:a1c:cf0a:: with SMTP id
	f10-v6mr9577704wmg.32.1533499630474; 
	Sun, 05 Aug 2018 13:07:10 -0700 (PDT)
MIME-Version: 1.0
References: <20180727083113.17370-1-raj.khem@gmail.com>
	<CA+chaQfyM=Ui_QX6M=Rnpdk_B9DOgcEfXCaDZPypyotTQ61b+A@mail.gmail.com>
	<CAMKF1srgn4yoy8cA1vv9ENerHk9gE9yrp2zbqJk=5cJuJMR82Q@mail.gmail.com>
	<CA+chaQcsquCB91R0vviaLVjTSf9YyhnBN-Sq_V9ddXfY1u1Hpw@mail.gmail.com>
	<649950f9-677c-f364-24b3-c7e8a3da0776@gmail.com>
In-Reply-To: <649950f9-677c-f364-24b3-c7e8a3da0776@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 5 Aug 2018 22:07:07 +0200
Message-ID: <CA+chaQf+b7fOoeJnV2rU8uS1n5z+L5=YA0hd=0s3d23SHYpLQA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-8: Upgrade to 8.2 release
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
X-List-Received-Date: Sun, 05 Aug 2018 20:07:10 -0000
Content-Type: multipart/alternative; boundary="000000000000bcdb2c0572b5b465"

--000000000000bcdb2c0572b5b465
Content-Type: text/plain; charset="UTF-8"

bash's read.c: http://paste.ubuntu.com/p/TMD7Z4gKxK/
libjpeg-turbo's turbojpeg.c: http://paste.ubuntu.com/p/FsV7zXnKHq/

On Sun, Aug 5, 2018 at 9:59 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 8/5/18 12:45 PM, Martin Jansa wrote:
> > Turned out to be related to -fno-omit-frame-pointer from DEBUG_BUILD
> > together with security_flags.inc together with thumb, I've sent a work
> > around which works for me:
> >
> http://lists.openembedded.org/pipermail/openembedded-core/2018-August/153741.html
> >
>
> thumb1 is kind of less tested ISA, so this workaround is perfectly fine.
> although it would be interesting to have the pre-processed file where it
> hangs
>
> > it's reproducible with gcc-8.1 as well, so it wasn't caused by gcc-8.2
> > upgrade (I've enabled security_flags.inc in qemuarm builds around the
> > same time).
> >
> > On Mon, Jul 30, 2018 at 8:35 PM Khem Raj <raj.khem@gmail.com
> > <mailto:raj.khem@gmail.com>> wrote:
> >
> >     Sure my builds with gold did not end up in the fails for qemuarm and
> >     thumb1 the setup is very similar but I might have been lucky let me
> >     know how it goes
> >
> >     On Mon, Jul 30, 2018 at 7:53 AM Martin Jansa <martin.jansa@gmail.com
> >     <mailto:martin.jansa@gmail.com>> wrote:
> >
> >         I'm not sure if it was caused by this change, but I've included
> >         it from patchwork on Friday and since then I've seen 3 builds
> >         getting stuck in gcc for 50 hours.
> >
> >         In all 3 cases it was qemuarm (with thumb and gold enabled),
> >         twice while building bash and once building libjpeg-turbo. I
> >         will let you know after more builds to see how often it happens
> >         (I didn't do many builds over weekend, because well - they were
> >         stuck on early ones, because of this).
> >
> >         On Fri, Jul 27, 2018 at 10:31 AM Khem Raj <raj.khem@gmail.com
> >         <mailto:raj.khem@gmail.com>> wrote:
> >
> >             Signed-off-by: Khem Raj <raj.khem@gmail.com
> >             <mailto:raj.khem@gmail.com>>
> >             ---
> >              ...003-build-failures-with-with-cpu-xsc.patch | 61
> >             -------------------
> >              .../gcc/{gcc-8.1.inc => gcc-8.2.inc}          | 11 ++--
> >              ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |  0
> >              .../0003-gcc-poison-system-directories.patch  |  0
> >              .../0004-gcc-poison-dir-extend.patch          |  0
> >              ...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |  0
> >              .../0006-64-bit-multilib-hack.patch           |  0
> >              .../0007-optional-libstdc.patch               |  0
> >              ...gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |  0
> >              .../0009-COLLECT_GCC_OPTIONS.patch            |  0
> >              ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |  0
> >              .../0011-fortran-cross-compile-hack.patch     |  0
> >              .../0012-cpp-honor-sysroot.patch              |  0
> >              .../0013-MIPS64-Default-to-N64-ABI.patch      |  0
> >              ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  0
> >              ...gcc-Fix-argument-list-too-long-error.patch |  0
> >              .../0016-Disable-sdt.patch                    |  0
> >              .../{gcc-8.1 => gcc-8.2}/0017-libtool.patch   |  0
> >              ...s-fix-v4bx-to-linker-to-support-EABI.patch |  0
> >              ...-config-files-from-B-instead-of-usin.patch |  0
> >              ...ir-from-.la-which-usually-points-to-.patch |  0
> >              .../0021-export-CPP.patch                     |  0
> >              ...ILIB_OSDIRNAMES-and-other-multilib-o.patch |  0
> >              ...e-target-gcc-headers-can-be-included.patch |  0
> >              ...ild-with-disable-dependency-tracking.patch |  0
> >              ...t-directory-during-relink-if-inst_pr.patch |  0
> >              ...IR-replacement-instead-of-hardcoding.patch |  0
> >              ...27-aarch64-Add-support-for-musl-ldso.patch |  0
> >              ...-fix-libcc1-s-install-path-and-rpath.patch |  0
> >              ...le-sysroot-support-for-nativesdk-gcc.patch |  0
> >              ...sroot-gcc-version-specific-dirs-with.patch |  0
> >              ...ous-_FOR_BUILD-and-related-variables.patch |  0
> >              ...032-nios2-Define-MUSL_DYNAMIC_LINKER.patch |  0
> >              ...d-to-link-commandline-for-musl-targe.patch |  0
> >              ...bgcc-Add-knob-to-use-ldbl-128-on-ppc.patch |  0
> >              ...using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |  0
> >              ...as-for-__cpu_indicator_init-instead-.patch |  0
> >              .../0037-sync-gcc-stddef.h-with-musl.patch    |  0
> >              ...-fault-in-precompiled-header-generat.patch |  0
> >              .../0039-Fix-for-testsuite-failure.patch      |  0
> >              ...Re-introduce-spe-commandline-options.patch |  0
> >              ...adian_8.1.bb <http://adian_8.1.bb> =>
> >             gcc-cross-canadian_8.2.bb
> >             <http://gcc-cross-canadian_8.2.bb>} |  0
> >              ...nitial_8.1.bb <http://nitial_8.1.bb> =>
> >             gcc-cross-initial_8.2.bb <http://gcc-cross-initial_8.2.bb>}
> |  0
> >              .../{gcc-cross_8.1.bb <http://gcc-cross_8.1.bb> =>
> >             gcc-cross_8.2.bb <http://gcc-cross_8.2.bb>}    |  0
> >              ...ial_8.1.bb <http://ial_8.1.bb> =>
> >             gcc-crosssdk-initial_8.2.bb
> >             <http://gcc-crosssdk-initial_8.2.bb>} |  0
> >              ...cc-crosssdk_8.1.bb <http://cc-crosssdk_8.1.bb> =>
> >             gcc-crosssdk_8.2.bb <http://gcc-crosssdk_8.2.bb>} |  0
> >              ...{gcc-runtime_8.1.bb <http://gcc-runtime_8.1.bb> =>
> >             gcc-runtime_8.2.bb <http://gcc-runtime_8.2.bb>} |  0
> >              ...anitizers_8.1.bb <http://anitizers_8.1.bb> =>
> >             gcc-sanitizers_8.2.bb <http://gcc-sanitizers_8.2.bb>} |  0
> >              .../{gcc-source_8.1.bb <http://gcc-source_8.1.bb> =>
> >             gcc-source_8.2.bb <http://gcc-source_8.2.bb>}  |  0
> >              .../gcc/{gcc_8.1.bb <http://gcc_8.1.bb> => gcc_8.2.bb
> >             <http://gcc_8.2.bb>}            |  0
> >              ...c-initial_8.1.bb <http://c-initial_8.1.bb> =>
> >             libgcc-initial_8.2.bb <http://libgcc-initial_8.2.bb>} |  0
> >              .../gcc/{libgcc_8.1.bb <http://libgcc_8.1.bb> =>
> >             libgcc_8.2.bb <http://libgcc_8.2.bb>}      |  0
> >              ...{libgfortran_8.1.bb <http://libgfortran_8.1.bb> =>
> >             libgfortran_8.2.bb <http://libgfortran_8.2.bb>} |  0
> >              53 files changed, 5 insertions(+), 67 deletions(-)
> >              delete mode 100644
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0041-arm-PR-target-86003-build-failures-with-with-cpu-xsc.patch
> >              rename meta/recipes-devtools/gcc/{gcc-8.1.inc =>
> >             gcc-8.2.inc} (93%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >             gcc-8.2}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >             gcc-8.2}/0003-gcc-poison-system-directories.patch (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >             gcc-8.2}/0004-gcc-poison-dir-extend.patch (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >             gcc-8.2}/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
> (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >             gcc-8.2}/0006-64-bit-multilib-hack.patch (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >             gcc-8.2}/0007-optional-libstdc.patch (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >             gcc-8.2}/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
> (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >             gcc-8.2}/0009-COLLECT_GCC_OPTIONS.patch (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >
>  gcc-8.2}/0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> >             (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >             gcc-8.2}/0011-fortran-cross-compile-hack.patch (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >             gcc-8.2}/0012-cpp-honor-sysroot.patch (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >             gcc-8.2}/0013-MIPS64-Default-to-N64-ABI.patch (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >
>  gcc-8.2}/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> >             (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >             gcc-8.2}/0015-gcc-Fix-argument-list-too-long-error.patch
> (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >             gcc-8.2}/0016-Disable-sdt.patch (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >             gcc-8.2}/0017-libtool.patch (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >
>  gcc-8.2}/0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> >             (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >
>  gcc-8.2}/0019-Use-the-multilib-config-files-from-B-instead-of-usin.patch
> >             (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >
>  gcc-8.2}/0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
> >             (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >             gcc-8.2}/0021-export-CPP.patch (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >
>  gcc-8.2}/0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
> >             (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >
>  gcc-8.2}/0023-Ensure-target-gcc-headers-can-be-included.patch (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >
>  gcc-8.2}/0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
> >             (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >
>  gcc-8.2}/0025-Don-t-search-host-directory-during-relink-if-inst_pr.patch
> >             (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >
>  gcc-8.2}/0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
> >             (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >             gcc-8.2}/0027-aarch64-Add-support-for-musl-ldso.patch (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >
>  gcc-8.2}/0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch
> >             (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >             gcc-8.2}/0029-handle-sysroot-support-for-nativesdk-gcc.patch
> >             (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >
>  gcc-8.2}/0030-Search-target-sysroot-gcc-version-specific-dirs-with.patch
> >             (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >
>  gcc-8.2}/0031-Fix-various-_FOR_BUILD-and-related-variables.patch
> >             (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >             gcc-8.2}/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >
>  gcc-8.2}/0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
> >             (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >             gcc-8.2}/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
> >             (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >
>  gcc-8.2}/0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> >             (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >
>  gcc-8.2}/0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
> >             (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >             gcc-8.2}/0037-sync-gcc-stddef.h-with-musl.patch (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >
>  gcc-8.2}/0038-fix-segmentation-fault-in-precompiled-header-generat.patch
> >             (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >             gcc-8.2}/0039-Fix-for-testsuite-failure.patch (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-8.1 =>
> >             gcc-8.2}/0040-Re-introduce-spe-commandline-options.patch
> (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-cross-canadian_8.1.bb
> >             <http://gcc-cross-canadian_8.1.bb> =>
> >             gcc-cross-canadian_8.2.bb
> >             <http://gcc-cross-canadian_8.2.bb>} (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-cross-initial_8.1.bb
> >             <http://gcc-cross-initial_8.1.bb> =>
> >             gcc-cross-initial_8.2.bb <http://gcc-cross-initial_8.2.bb>}
> >             (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-cross_8.1.bb
> >             <http://gcc-cross_8.1.bb> => gcc-cross_8.2.bb
> >             <http://gcc-cross_8.2.bb>} (100%)
> >              rename
> >             meta/recipes-devtools/gcc/{gcc-crosssdk-initial_8.1.bb
> >             <http://gcc-crosssdk-initial_8.1.bb> =>
> >             gcc-crosssdk-initial_8.2.bb
> >             <http://gcc-crosssdk-initial_8.2.bb>} (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-crosssdk_8.1.bb
> >             <http://gcc-crosssdk_8.1.bb> => gcc-crosssdk_8.2.bb
> >             <http://gcc-crosssdk_8.2.bb>} (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-runtime_8.1.bb
> >             <http://gcc-runtime_8.1.bb> => gcc-runtime_8.2.bb
> >             <http://gcc-runtime_8.2.bb>} (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-sanitizers_8.1.bb
> >             <http://gcc-sanitizers_8.1.bb> => gcc-sanitizers_8.2.bb
> >             <http://gcc-sanitizers_8.2.bb>} (100%)
> >              rename meta/recipes-devtools/gcc/{gcc-source_8.1.bb
> >             <http://gcc-source_8.1.bb> => gcc-source_8.2.bb
> >             <http://gcc-source_8.2.bb>} (100%)
> >              rename meta/recipes-devtools/gcc/{gcc_8.1.bb
> >             <http://gcc_8.1.bb> => gcc_8.2.bb <http://gcc_8.2.bb>}
> (100%)
> >              rename meta/recipes-devtools/gcc/{libgcc-initial_8.1.bb
> >             <http://libgcc-initial_8.1.bb> => libgcc-initial_8.2.bb
> >             <http://libgcc-initial_8.2.bb>} (100%)
> >              rename meta/recipes-devtools/gcc/{libgcc_8.1.bb
> >             <http://libgcc_8.1.bb> => libgcc_8.2.bb
> >             <http://libgcc_8.2.bb>} (100%)
> >              rename meta/recipes-devtools/gcc/{libgfortran_8.1.bb
> >             <http://libgfortran_8.1.bb> => libgfortran_8.2.bb
> >             <http://libgfortran_8.2.bb>} (100%)
> >
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0041-arm-PR-target-86003-build-failures-with-with-cpu-xsc.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.1/0041-arm-PR-target-86003-build-failures-with-with-cpu-xsc.patch
> >             deleted file mode 100644
> >             index 68b8962d47..0000000000
> >             ---
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0041-arm-PR-target-86003-build-failures-with-with-cpu-xsc.patch
> >             +++ /dev/null
> >             @@ -1,61 +0,0 @@
> >             -From 11dc6b9576b78bb7a8d70491beab7ab4de24c9d0 Mon Sep 17
> >             00:00:00 2001
> >             -From: rearnsha
> <rearnsha@138bc75d-0d04-0410-961f-82ee72b054a4>
> >             -Date: Mon, 4 Jun 2018 08:46:04 +0000
> >             -Subject: [PATCH] [arm] PR target/86003 build failures with
> >             --with-cpu=xscale
> >             -
> >             -The XScale cpu configuration in GCC has always been somewhat
> >             -non-conforming.  Although XScale isn't an architecture
> >             (it's simply an
> >             -implementation of ARMv5te), we do by tradition emit a
> specific
> >             -pre-define for it.  We achieve this effect by adding an
> >             additional
> >             -feature bit to the xscale CPU definition that isn't part of
> >             the base
> >             -architecture.
> >             -
> >             -When I restructured the options last year I overlooked this
> >             oddity and
> >             -the result, of course, is that this configuration now fails
> >             to build
> >             -as intended.
> >             -
> >             -What happens is that the driver (correctly) constructs an
> >             architecture
> >             -for the xscale cpu name (as armv5te) and passes it in
> >             addition to the
> >             -CPU name.  The backend code, on finding both a cpu and an
> >             architecture
> >             -specifies attempts to correlate the two and finds a
> >             difference due to
> >             -the additional feature bit and reports an inconsistency
> >             (fatally if
> >             --werror is specified).
> >             -
> >             -I think the best fix to this is to treat the xscale feature
> >             bit using
> >             -the same mechanism that we use for other 'quirks' in CPU
> >             -implementations and simply filter it out before comparing
> the
> >             -capabilities.  It has the additional benefit that it's also
> the
> >             -simplest fix.
> >             -
> >             -       PR target/86003
> >             -       * config/arm/arm-cpus.in <http://arm-cpus.in>
> >             (ALL_QUIRKS): Add xscale feature to the list
> >             -       of bits to ignore when comparing architectures.
> >             -
> >             -
> >             -git-svn-id:
> >             svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-8-branch@261141
> >             <http://gcc.gnu.org/svn/gcc/branches/gcc-8-branch@261141>
> >             138bc75d-0d04-0410-961f-82ee72b054a4
> >             ----
> >             -Signed-off-by: Khem Raj <raj.khem@gmail.com
> >             <mailto:raj.khem@gmail.com>>
> >             -Upstream-Status: Backport
> >             -
> >             - gcc/ChangeLog              | 6 ++++++
> >             - gcc/config/arm/arm-cpus.in <http://arm-cpus.in> | 4 +++-
> >             - 2 files changed, 9 insertions(+), 1 deletion(-)
> >             -
> >             -diff --git a/gcc/config/arm/arm-cpus.in
> >             <http://arm-cpus.in> b/gcc/config/arm/arm-cpus.in
> >             <http://arm-cpus.in>
> >             -index 96972a057e7..545321b0bbe 100644
> >             ---- a/gcc/config/arm/arm-cpus.in <http://arm-cpus.in>
> >             -+++ b/gcc/config/arm/arm-cpus.in <http://arm-cpus.in>
> >             -@@ -268,7 +268,9 @@ define fgroup DOTPROD      NEON dotprod
> >             -
> >             - # List of all quirk bits to strip out when comparing CPU
> >             features with
> >             - # architectures.
> >             --define fgroup ALL_QUIRKS   quirk_no_volatile_ce
> >             quirk_armv6kz quirk_cm3_ldrd
> >             -+# xscale isn't really a 'quirk', but it isn't an
> >             architecture either and we
> >             -+# need to ignore it for matching purposes.
> >             -+define fgroup ALL_QUIRKS   quirk_no_volatile_ce
> >             quirk_armv6kz quirk_cm3_ldrd xscale
> >             -
> >             - # Architecture entries
> >             - # format:
> >             ---
> >             -2.17.1
> >             -
> >             diff --git a/meta/recipes-devtools/gcc/gcc-8.1.inc
> >             b/meta/recipes-devtools/gcc/gcc-8.2.inc
> >             similarity index 93%
> >             rename from meta/recipes-devtools/gcc/gcc-8.1.inc
> >             rename to meta/recipes-devtools/gcc/gcc-8.2.inc
> >             index ebe3c24978..8503a66b07 100644
> >             --- a/meta/recipes-devtools/gcc/gcc-8.1.inc
> >             +++ b/meta/recipes-devtools/gcc/gcc-8.2.inc
> >             @@ -2,13 +2,13 @@ require gcc-common.inc
> >
> >              # Third digit in PV should be incremented after a minor
> release
> >
> >             -PV = "8.1.0"
> >             +PV = "8.2.0"
> >
> >              # BINV should be incremented to a revision after a minor
> >             gcc release
> >
> >             -BINV = "8.1.0"
> >             +BINV = "8.2.0"
> >
> >             -FILESEXTRAPATHS =.
> >             "${FILE_DIRNAME}/gcc-8.1:${FILE_DIRNAME}/gcc-8.1/backport:"
> >             +FILESEXTRAPATHS =.
> >             "${FILE_DIRNAME}/gcc-8.2:${FILE_DIRNAME}/gcc-8.2/backport:"
> >
> >              DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
> >              NATIVEDEPS = "mpfr-native gmp-native libmpc-native
> >             zlib-native flex-native"
> >             @@ -73,10 +73,9 @@ SRC_URI = "\
> >                         ${BACKPORTS} \
> >              "
> >              BACKPORTS = "\
> >             -
> >
>   file://0041-arm-PR-target-86003-build-failures-with-with-cpu-xsc.patch
> >             \
> >              "
> >             -SRC_URI[md5sum] = "65f7c65818dc540b3437605026d329fc"
> >             -SRC_URI[sha256sum] =
> >
>  "1d1866f992626e61349a1ccd0b8d5253816222cdc13390dcfaa74b093aa2b153"
> >             +SRC_URI[md5sum] = "4ab282f414676496483b3e1793d07862"
> >             +SRC_URI[sha256sum] =
> >
>  "196c3c04ba2613f893283977e6011b2345d1cd1af9abeac58e916b1aab3e0080"
> >
> >              S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
> >              #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0003-gcc-poison-system-directories.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0003-gcc-poison-system-directories.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0003-gcc-poison-system-directories.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0003-gcc-poison-system-directories.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0004-gcc-poison-dir-extend.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0004-gcc-poison-dir-extend.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0004-gcc-poison-dir-extend.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0004-gcc-poison-dir-extend.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0006-64-bit-multilib-hack.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0006-64-bit-multilib-hack.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0006-64-bit-multilib-hack.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0006-64-bit-multilib-hack.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0007-optional-libstdc.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0007-optional-libstdc.patch
> >             similarity index 100%
> >             rename from
> >             meta/recipes-devtools/gcc/gcc-8.1/0007-optional-libstdc.patch
> >             rename to
> >             meta/recipes-devtools/gcc/gcc-8.2/0007-optional-libstdc.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0009-COLLECT_GCC_OPTIONS.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0009-COLLECT_GCC_OPTIONS.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0009-COLLECT_GCC_OPTIONS.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0009-COLLECT_GCC_OPTIONS.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0011-fortran-cross-compile-hack.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0011-fortran-cross-compile-hack.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0011-fortran-cross-compile-hack.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0011-fortran-cross-compile-hack.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0012-cpp-honor-sysroot.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0012-cpp-honor-sysroot.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0012-cpp-honor-sysroot.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0012-cpp-honor-sysroot.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0013-MIPS64-Default-to-N64-ABI.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0013-MIPS64-Default-to-N64-ABI.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0013-MIPS64-Default-to-N64-ABI.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0013-MIPS64-Default-to-N64-ABI.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0015-gcc-Fix-argument-list-too-long-error.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0015-gcc-Fix-argument-list-too-long-error.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0015-gcc-Fix-argument-list-too-long-error.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0015-gcc-Fix-argument-list-too-long-error.patch
> >             diff --git
> >             a/meta/recipes-devtools/gcc/gcc-8.1/0016-Disable-sdt.patch
> >             b/meta/recipes-devtools/gcc/gcc-8.2/0016-Disable-sdt.patch
> >             similarity index 100%
> >             rename from
> >             meta/recipes-devtools/gcc/gcc-8.1/0016-Disable-sdt.patch
> >             rename to
> >             meta/recipes-devtools/gcc/gcc-8.2/0016-Disable-sdt.patch
> >             diff --git
> >             a/meta/recipes-devtools/gcc/gcc-8.1/0017-libtool.patch
> >             b/meta/recipes-devtools/gcc/gcc-8.2/0017-libtool.patch
> >             similarity index 100%
> >             rename from
> meta/recipes-devtools/gcc/gcc-8.1/0017-libtool.patch
> >             rename to
> meta/recipes-devtools/gcc/gcc-8.2/0017-libtool.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0019-Use-the-multilib-config-files-from-B-instead-of-usin.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0019-Use-the-multilib-config-files-from-B-instead-of-usin.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0019-Use-the-multilib-config-files-from-B-instead-of-usin.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0019-Use-the-multilib-config-files-from-B-instead-of-usin.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
> >             diff --git
> >             a/meta/recipes-devtools/gcc/gcc-8.1/0021-export-CPP.patch
> >             b/meta/recipes-devtools/gcc/gcc-8.2/0021-export-CPP.patch
> >             similarity index 100%
> >             rename from
> >             meta/recipes-devtools/gcc/gcc-8.1/0021-export-CPP.patch
> >             rename to
> >             meta/recipes-devtools/gcc/gcc-8.2/0021-export-CPP.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0023-Ensure-target-gcc-headers-can-be-included.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0023-Ensure-target-gcc-headers-can-be-included.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0023-Ensure-target-gcc-headers-can-be-included.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0023-Ensure-target-gcc-headers-can-be-included.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0025-Don-t-search-host-directory-during-relink-if-inst_pr.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0025-Don-t-search-host-directory-during-relink-if-inst_pr.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0025-Don-t-search-host-directory-during-relink-if-inst_pr.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0025-Don-t-search-host-directory-during-relink-if-inst_pr.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0027-aarch64-Add-support-for-musl-ldso.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0027-aarch64-Add-support-for-musl-ldso.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0027-aarch64-Add-support-for-musl-ldso.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0027-aarch64-Add-support-for-musl-ldso.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0029-handle-sysroot-support-for-nativesdk-gcc.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0029-handle-sysroot-support-for-nativesdk-gcc.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0029-handle-sysroot-support-for-nativesdk-gcc.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0029-handle-sysroot-support-for-nativesdk-gcc.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0030-Search-target-sysroot-gcc-version-specific-dirs-with.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0030-Search-target-sysroot-gcc-version-specific-dirs-with.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0030-Search-target-sysroot-gcc-version-specific-dirs-with.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0030-Search-target-sysroot-gcc-version-specific-dirs-with.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0031-Fix-various-_FOR_BUILD-and-related-variables.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0031-Fix-various-_FOR_BUILD-and-related-variables.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0031-Fix-various-_FOR_BUILD-and-related-variables.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0031-Fix-various-_FOR_BUILD-and-related-variables.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0037-sync-gcc-stddef.h-with-musl.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0037-sync-gcc-stddef.h-with-musl.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0037-sync-gcc-stddef.h-with-musl.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0037-sync-gcc-stddef.h-with-musl.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0038-fix-segmentation-fault-in-precompiled-header-generat.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0038-fix-segmentation-fault-in-precompiled-header-generat.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0038-fix-segmentation-fault-in-precompiled-header-generat.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0038-fix-segmentation-fault-in-precompiled-header-generat.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0039-Fix-for-testsuite-failure.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0039-Fix-for-testsuite-failure.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0039-Fix-for-testsuite-failure.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0039-Fix-for-testsuite-failure.patch
> >             diff --git
> >
>  a/meta/recipes-devtools/gcc/gcc-8.1/0040-Re-introduce-spe-commandline-options.patch
> >
>  b/meta/recipes-devtools/gcc/gcc-8.2/0040-Re-introduce-spe-commandline-options.patch
> >             similarity index 100%
> >             rename from
> >
>  meta/recipes-devtools/gcc/gcc-8.1/0040-Re-introduce-spe-commandline-options.patch
> >             rename to
> >
>  meta/recipes-devtools/gcc/gcc-8.2/0040-Re-introduce-spe-commandline-options.patch
> >             diff --git
> >             a/meta/recipes-devtools/gcc/gcc-cross-canadian_8.1.bb
> >             <http://gcc-cross-canadian_8.1.bb>
> >             b/meta/recipes-devtools/gcc/gcc-cross-canadian_8.2.bb
> >             <http://gcc-cross-canadian_8.2.bb>
> >             similarity index 100%
> >             rename from
> >             meta/recipes-devtools/gcc/gcc-cross-canadian_8.1.bb
> >             <http://gcc-cross-canadian_8.1.bb>
> >             rename to
> >             meta/recipes-devtools/gcc/gcc-cross-canadian_8.2.bb
> >             <http://gcc-cross-canadian_8.2.bb>
> >             diff --git
> >             a/meta/recipes-devtools/gcc/gcc-cross-initial_8.1.bb
> >             <http://gcc-cross-initial_8.1.bb>
> >             b/meta/recipes-devtools/gcc/gcc-cross-initial_8.2.bb
> >             <http://gcc-cross-initial_8.2.bb>
> >             similarity index 100%
> >             rename from
> >             meta/recipes-devtools/gcc/gcc-cross-initial_8.1.bb
> >             <http://gcc-cross-initial_8.1.bb>
> >             rename to meta/recipes-devtools/gcc/gcc-cross-initial_8.2.bb
> >             <http://gcc-cross-initial_8.2.bb>
> >             diff --git a/meta/recipes-devtools/gcc/gcc-cross_8.1.bb
> >             <http://gcc-cross_8.1.bb>
> >             b/meta/recipes-devtools/gcc/gcc-cross_8.2.bb
> >             <http://gcc-cross_8.2.bb>
> >             similarity index 100%
> >             rename from meta/recipes-devtools/gcc/gcc-cross_8.1.bb
> >             <http://gcc-cross_8.1.bb>
> >             rename to meta/recipes-devtools/gcc/gcc-cross_8.2.bb
> >             <http://gcc-cross_8.2.bb>
> >             diff --git
> >             a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_8.1.bb
> >             <http://gcc-crosssdk-initial_8.1.bb>
> >             b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_8.2.bb
> >             <http://gcc-crosssdk-initial_8.2.bb>
> >             similarity index 100%
> >             rename from
> >             meta/recipes-devtools/gcc/gcc-crosssdk-initial_8.1.bb
> >             <http://gcc-crosssdk-initial_8.1.bb>
> >             rename to
> >             meta/recipes-devtools/gcc/gcc-crosssdk-initial_8.2.bb
> >             <http://gcc-crosssdk-initial_8.2.bb>
> >             diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_8.1.bb
> >             <http://gcc-crosssdk_8.1.bb>
> >             b/meta/recipes-devtools/gcc/gcc-crosssdk_8.2.bb
> >             <http://gcc-crosssdk_8.2.bb>
> >             similarity index 100%
> >             rename from meta/recipes-devtools/gcc/gcc-crosssdk_8.1.bb
> >             <http://gcc-crosssdk_8.1.bb>
> >             rename to meta/recipes-devtools/gcc/gcc-crosssdk_8.2.bb
> >             <http://gcc-crosssdk_8.2.bb>
> >             diff --git a/meta/recipes-devtools/gcc/gcc-runtime_8.1.bb
> >             <http://gcc-runtime_8.1.bb>
> >             b/meta/recipes-devtools/gcc/gcc-runtime_8.2.bb
> >             <http://gcc-runtime_8.2.bb>
> >             similarity index 100%
> >             rename from meta/recipes-devtools/gcc/gcc-runtime_8.1.bb
> >             <http://gcc-runtime_8.1.bb>
> >             rename to meta/recipes-devtools/gcc/gcc-runtime_8.2.bb
> >             <http://gcc-runtime_8.2.bb>
> >             diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_8.1.bb
> >             <http://gcc-sanitizers_8.1.bb>
> >             b/meta/recipes-devtools/gcc/gcc-sanitizers_8.2.bb
> >             <http://gcc-sanitizers_8.2.bb>
> >             similarity index 100%
> >             rename from meta/recipes-devtools/gcc/gcc-sanitizers_8.1.bb
> >             <http://gcc-sanitizers_8.1.bb>
> >             rename to meta/recipes-devtools/gcc/gcc-sanitizers_8.2.bb
> >             <http://gcc-sanitizers_8.2.bb>
> >             diff --git a/meta/recipes-devtools/gcc/gcc-source_8.1.bb
> >             <http://gcc-source_8.1.bb>
> >             b/meta/recipes-devtools/gcc/gcc-source_8.2.bb
> >             <http://gcc-source_8.2.bb>
> >             similarity index 100%
> >             rename from meta/recipes-devtools/gcc/gcc-source_8.1.bb
> >             <http://gcc-source_8.1.bb>
> >             rename to meta/recipes-devtools/gcc/gcc-source_8.2.bb
> >             <http://gcc-source_8.2.bb>
> >             diff --git a/meta/recipes-devtools/gcc/gcc_8.1.bb
> >             <http://gcc_8.1.bb> b/meta/recipes-devtools/gcc/gcc_8.2.bb
> >             <http://gcc_8.2.bb>
> >             similarity index 100%
> >             rename from meta/recipes-devtools/gcc/gcc_8.1.bb
> >             <http://gcc_8.1.bb>
> >             rename to meta/recipes-devtools/gcc/gcc_8.2.bb
> >             <http://gcc_8.2.bb>
> >             diff --git a/meta/recipes-devtools/gcc/libgcc-initial_8.1.bb
> >             <http://libgcc-initial_8.1.bb>
> >             b/meta/recipes-devtools/gcc/libgcc-initial_8.2.bb
> >             <http://libgcc-initial_8.2.bb>
> >             similarity index 100%
> >             rename from meta/recipes-devtools/gcc/libgcc-initial_8.1.bb
> >             <http://libgcc-initial_8.1.bb>
> >             rename to meta/recipes-devtools/gcc/libgcc-initial_8.2.bb
> >             <http://libgcc-initial_8.2.bb>
> >             diff --git a/meta/recipes-devtools/gcc/libgcc_8.1.bb
> >             <http://libgcc_8.1.bb>
> >             b/meta/recipes-devtools/gcc/libgcc_8.2.bb <
> http://libgcc_8.2.bb>
> >             similarity index 100%
> >             rename from meta/recipes-devtools/gcc/libgcc_8.1.bb
> >             <http://libgcc_8.1.bb>
> >             rename to meta/recipes-devtools/gcc/libgcc_8.2.bb
> >             <http://libgcc_8.2.bb>
> >             diff --git a/meta/recipes-devtools/gcc/libgfortran_8.1.bb
> >             <http://libgfortran_8.1.bb>
> >             b/m

--000000000000bcdb2c0572b5b465
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">bash&#39;s read.c:=C2=A0<a href=3D"http://paste.ubuntu.com=
/p/TMD7Z4gKxK/">http://paste.ubuntu.com/p/TMD7Z4gKxK/</a><div>libjpeg-turbo=
&#39;s=C2=A0turbojpeg.c:=C2=A0<a href=3D"http://paste.ubuntu.com/p/FsV7zXnK=
Hq/">http://paste.ubuntu.com/p/FsV7zXnKHq/</a></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr">On Sun, Aug 5, 2018 at 9:59 PM Khem Raj &lt;=
<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><br>
<br>
On 8/5/18 12:45 PM, Martin Jansa wrote:<br>
&gt; Turned out to be related to=C2=A0-fno-omit-frame-pointer from DEBUG_BU=
ILD<br>
&gt; together with security_flags.inc together with thumb, I&#39;ve sent a =
work<br>
&gt; around which works for me:<br>
&gt; <a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2=
018-August/153741.html" rel=3D"noreferrer" target=3D"_blank">http://lists.o=
penembedded.org/pipermail/openembedded-core/2018-August/153741.html</a><br>
&gt; <br>
<br>
thumb1 is kind of less tested ISA, so this workaround is perfectly fine.<br=
>
although it would be interesting to have the pre-processed file where it<br=
>
hangs<br>
<br>
&gt; it&#39;s reproducible with gcc-8.1 as well, so it wasn&#39;t caused by=
 gcc-8.2<br>
&gt; upgrade (I&#39;ve enabled security_flags.inc in qemuarm builds around =
the<br>
&gt; same time).<br>
&gt; <br>
&gt; On Mon, Jul 30, 2018 at 8:35 PM Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com" target=3D"_blank">raj.khem@gmail.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj=
.khem@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Sure my builds with gold did not end up in the fail=
s for qemuarm and<br>
&gt;=C2=A0 =C2=A0 =C2=A0thumb1 the setup is very similar but I might have b=
een lucky let me<br>
&gt;=C2=A0 =C2=A0 =C2=A0know how it goes=C2=A0<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Mon, Jul 30, 2018 at 7:53 AM Martin Jansa &lt;<a=
 href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmai=
l.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:martin.jansa@gmail.com=
" target=3D"_blank">martin.jansa@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I&#39;m not sure if it was caused by =
this change, but I&#39;ve included<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0it from patchwork on Friday and since=
 then I&#39;ve seen 3 builds<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getting stuck in gcc for 50 hours.<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0In all 3 cases it was qemuarm (with t=
humb and gold enabled),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0twice while building bash and once bu=
ilding libjpeg-turbo. I<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0will let you know after more builds t=
o see how often it happens<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(I didn&#39;t do many builds over wee=
kend, because well - they were<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stuck on early ones, because of this)=
.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On Fri, Jul 27, 2018 at 10:31 AM Khem=
 Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@g=
mail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Signed-off-by: Khem Raj=
 &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail=
.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&gt;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...003-build-fail=
ures-with-with-cpu-xsc.patch | 61<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-------------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0.../gcc/{gcc-8.1.=
inc =3D&gt; gcc-8.2.inc}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 ++--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...0001-gcc-4.3.1=
-ARCH_FLAGS_FOR_TARGET.patch |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0.../0003-gcc-pois=
on-system-directories.patch=C2=A0 |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0.../0004-gcc-pois=
on-dir-extend.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...-gcc-4.3.3-SYS=
ROOT_CFLAGS_FOR_TARGET.patch |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0.../0006-64-bit-m=
ultilib-hack.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0.../0007-optional=
-libstdc.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...gcc-disable-MA=
SK_RELAX_PIC_CALLS-bit.patch |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0.../0009-COLLECT_=
GCC_OPTIONS.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...ts.h-in-B-inst=
ead-of-S-and-t-oe-in-B.patch |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0.../0011-fortran-=
cross-compile-hack.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0.../0012-cpp-hono=
r-sysroot.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 0<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0.../0013-MIPS64-D=
efault-to-N64-ABI.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...AMIC_LINKER-an=
d-UCLIBC_DYNAMIC_LINKE.patch |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...gcc-Fix-argume=
nt-list-too-long-error.patch |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0.../0016-Disable-=
sdt.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0.../{gcc-8.1 =3D&=
gt; gcc-8.2}/0017-libtool.patch=C2=A0 =C2=A0|=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...s-fix-v4bx-to-=
linker-to-support-EABI.patch |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...-config-files-=
from-B-instead-of-usin.patch |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...ir-from-.la-wh=
ich-usually-points-to-.patch |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0.../0021-export-C=
PP.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...ILIB_OSDIRNAME=
S-and-other-multilib-o.patch |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...e-target-gcc-h=
eaders-can-be-included.patch |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...ild-with-disab=
le-dependency-tracking.patch |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...t-directory-du=
ring-relink-if-inst_pr.patch |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...IR-replacement=
-instead-of-hardcoding.patch |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...27-aarch64-Add=
-support-for-musl-ldso.patch |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...-fix-libcc1-s-=
install-path-and-rpath.patch |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...le-sysroot-sup=
port-for-nativesdk-gcc.patch |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...sroot-gcc-vers=
ion-specific-dirs-with.patch |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...ous-_FOR_BUILD=
-and-related-variables.patch |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...032-nios2-Defi=
ne-MUSL_DYNAMIC_LINKER.patch |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...d-to-link-comm=
andline-for-musl-targe.patch |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...bgcc-Add-knob-=
to-use-ldbl-128-on-ppc.patch |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...using-LDFLAGS-=
not-just-SHLIB_LDFLAGS.patch |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...as-for-__cpu_i=
ndicator_init-instead-.patch |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0.../0037-sync-gcc=
-stddef.h-with-musl.patch=C2=A0 =C2=A0 |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...-fault-in-prec=
ompiled-header-generat.patch |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0.../0039-Fix-for-=
testsuite-failure.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...Re-introduce-s=
pe-commandline-options.patch |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...<a href=3D"htt=
p://adian_8.1.bb" rel=3D"noreferrer" target=3D"_blank">adian_8.1.bb</a> &lt=
;<a href=3D"http://adian_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http:=
//adian_8.1.bb</a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gcc-c=
ross-canadian_8.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-canadi=
an_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-cross-canadian_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-c=
ross-canadian_8.2.bb</a>&gt;} |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...<a href=3D"htt=
p://nitial_8.1.bb" rel=3D"noreferrer" target=3D"_blank">nitial_8.1.bb</a> &=
lt;<a href=3D"http://nitial_8.1.bb" rel=3D"noreferrer" target=3D"_blank">ht=
tp://nitial_8.1.bb</a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gcc-c=
ross-initial_8.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-initial=
_8.2.bb</a> &lt;<a href=3D"http://gcc-cross-initial_8.2.bb" rel=3D"noreferr=
er" target=3D"_blank">http://gcc-cross-initial_8.2.bb</a>&gt;} |=C2=A0 0<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0.../{<a href=3D"h=
ttp://gcc-cross_8.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross_8.1.=
bb</a> &lt;<a href=3D"http://gcc-cross_8.1.bb" rel=3D"noreferrer" target=3D=
"_blank">http://gcc-cross_8.1.bb</a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gcc-c=
ross_8.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross_8.2.bb</a> &lt;=
<a href=3D"http://gcc-cross_8.2.bb" rel=3D"noreferrer" target=3D"_blank">ht=
tp://gcc-cross_8.2.bb</a>&gt;}=C2=A0 =C2=A0 |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...<a href=3D"htt=
p://ial_8.1.bb" rel=3D"noreferrer" target=3D"_blank">ial_8.1.bb</a> &lt;<a =
href=3D"http://ial_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://ial_=
8.1.bb</a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gcc-c=
rosssdk-initial_8.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk-i=
nitial_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-crosssdk-initial_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc=
-crosssdk-initial_8.2.bb</a>&gt;} |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...<a href=3D"htt=
p://cc-crosssdk_8.1.bb" rel=3D"noreferrer" target=3D"_blank">cc-crosssdk_8.=
1.bb</a> &lt;<a href=3D"http://cc-crosssdk_8.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">http://cc-crosssdk_8.1.bb</a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gcc-c=
rosssdk_8.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk_8.2.bb</a=
> &lt;<a href=3D"http://gcc-crosssdk_8.2.bb" rel=3D"noreferrer" target=3D"_=
blank">http://gcc-crosssdk_8.2.bb</a>&gt;} |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...{<a href=3D"ht=
tp://gcc-runtime_8.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-runtime_8=
.1.bb</a> &lt;<a href=3D"http://gcc-runtime_8.1.bb" rel=3D"noreferrer" targ=
et=3D"_blank">http://gcc-runtime_8.1.bb</a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gcc-r=
untime_8.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-runtime_8.2.bb</a> =
&lt;<a href=3D"http://gcc-runtime_8.2.bb" rel=3D"noreferrer" target=3D"_bla=
nk">http://gcc-runtime_8.2.bb</a>&gt;} |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...<a href=3D"htt=
p://anitizers_8.1.bb" rel=3D"noreferrer" target=3D"_blank">anitizers_8.1.bb=
</a> &lt;<a href=3D"http://anitizers_8.1.bb" rel=3D"noreferrer" target=3D"_=
blank">http://anitizers_8.1.bb</a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gcc-s=
anitizers_8.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-sanitizers_8.2.b=
b</a> &lt;<a href=3D"http://gcc-sanitizers_8.2.bb" rel=3D"noreferrer" targe=
t=3D"_blank">http://gcc-sanitizers_8.2.bb</a>&gt;} |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0.../{<a href=3D"h=
ttp://gcc-source_8.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc-source_8.=
1.bb</a> &lt;<a href=3D"http://gcc-source_8.1.bb" rel=3D"noreferrer" target=
=3D"_blank">http://gcc-source_8.1.bb</a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gcc-s=
ource_8.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-source_8.2.bb</a> &l=
t;<a href=3D"http://gcc-source_8.2.bb" rel=3D"noreferrer" target=3D"_blank"=
>http://gcc-source_8.2.bb</a>&gt;}=C2=A0 |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0.../gcc/{<a href=
=3D"http://gcc_8.1.bb" rel=3D"noreferrer" target=3D"_blank">gcc_8.1.bb</a> =
&lt;<a href=3D"http://gcc_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http=
://gcc_8.1.bb</a>&gt; =3D&gt; <a href=3D"http://gcc_8.2.bb" rel=3D"noreferr=
er" target=3D"_blank">gcc_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc_8.2.bb</a>&gt;}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...<a href=3D"htt=
p://c-initial_8.1.bb" rel=3D"noreferrer" target=3D"_blank">c-initial_8.1.bb=
</a> &lt;<a href=3D"http://c-initial_8.1.bb" rel=3D"noreferrer" target=3D"_=
blank">http://c-initial_8.1.bb</a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://libgc=
c-initial_8.2.bb" rel=3D"noreferrer" target=3D"_blank">libgcc-initial_8.2.b=
b</a> &lt;<a href=3D"http://libgcc-initial_8.2.bb" rel=3D"noreferrer" targe=
t=3D"_blank">http://libgcc-initial_8.2.bb</a>&gt;} |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0.../gcc/{<a href=
=3D"http://libgcc_8.1.bb" rel=3D"noreferrer" target=3D"_blank">libgcc_8.1.b=
b</a> &lt;<a href=3D"http://libgcc_8.1.bb" rel=3D"noreferrer" target=3D"_bl=
ank">http://libgcc_8.1.bb</a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://libgc=
c_8.2.bb" rel=3D"noreferrer" target=3D"_blank">libgcc_8.2.bb</a> &lt;<a hre=
f=3D"http://libgcc_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://libg=
cc_8.2.bb</a>&gt;}=C2=A0 =C2=A0 =C2=A0 |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0...{<a href=3D"ht=
tp://libgfortran_8.1.bb" rel=3D"noreferrer" target=3D"_blank">libgfortran_8=
.1.bb</a> &lt;<a href=3D"http://libgfortran_8.1.bb" rel=3D"noreferrer" targ=
et=3D"_blank">http://libgfortran_8.1.bb</a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://libgf=
ortran_8.2.bb" rel=3D"noreferrer" target=3D"_blank">libgfortran_8.2.bb</a> =
&lt;<a href=3D"http://libgfortran_8.2.bb" rel=3D"noreferrer" target=3D"_bla=
nk">http://libgfortran_8.2.bb</a>&gt;} |=C2=A0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A053 files changed,=
 5 insertions(+), 67 deletions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0delete mode 10064=
4<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0041-arm-PR-target-86003-build-failures-with-with-cpu-xsc.patch<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1.inc =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2.inc} (93%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0001-gcc-4.3.1=
-ARCH_FLAGS_FOR_TARGET.patch (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0003-gcc-poiso=
n-system-directories.patch (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0004-gcc-poiso=
n-dir-extend.patch (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0005-gcc-4.3.3=
-SYSROOT_CFLAGS_FOR_TARGET.patch (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0006-64-bit-mu=
ltilib-hack.patch (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0007-optional-=
libstdc.patch (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0008-gcc-disab=
le-MASK_RELAX_PIC_CALLS-bit.patch (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0009-COLLECT_G=
CC_OPTIONS.patch (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0010-Use-the-d=
efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0011-fortran-c=
ross-compile-hack.patch (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0012-cpp-honor=
-sysroot.patch (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0013-MIPS64-De=
fault-to-N64-ABI.patch (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0014-Define-GL=
IBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0015-gcc-Fix-a=
rgument-list-too-long-error.patch (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0016-Disable-s=
dt.patch (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0017-libtool.p=
atch (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0018-gcc-armv4=
-pass-fix-v4bx-to-linker-to-support-EABI.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0019-Use-the-m=
ultilib-config-files-from-B-instead-of-usin.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0020-Avoid-usi=
ng-libdir-from-.la-which-usually-points-to-.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0021-export-CP=
P.patch (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0022-Disable-t=
he-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0023-Ensure-ta=
rget-gcc-headers-can-be-included.patch (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0024-gcc-4.8-w=
on-t-build-with-disable-dependency-tracking.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0025-Don-t-sea=
rch-host-directory-during-relink-if-inst_pr.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0026-Use-SYSTE=
MLIBS_DIR-replacement-instead-of-hardcoding.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0027-aarch64-A=
dd-support-for-musl-ldso.patch (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0028-libcc1-fi=
x-libcc1-s-install-path-and-rpath.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0029-handle-sy=
sroot-support-for-nativesdk-gcc.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0030-Search-ta=
rget-sysroot-gcc-version-specific-dirs-with.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0031-Fix-vario=
us-_FOR_BUILD-and-related-variables.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0032-nios2-Def=
ine-MUSL_DYNAMIC_LINKER.patch (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0033-Add-ssp_n=
onshared-to-link-commandline-for-musl-targe.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0034-libgcc-Ad=
d-knob-to-use-ldbl-128-on-ppc.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0035-Link-libg=
cc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0036-libgcc_s-=
Use-alias-for-__cpu_indicator_init-instead-.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0037-sync-gcc-=
stddef.h-with-musl.patch (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0038-fix-segme=
ntation-fault-in-precompiled-header-generat.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0039-Fix-for-t=
estsuite-failure.patch (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{gcc-8.1 =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc-8.2}/0040-Re-introd=
uce-spe-commandline-options.patch (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{<a href=3D"http://gcc-cross-canadian_8.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">gcc-cross-canadian_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-cross-canadian_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-c=
ross-canadian_8.1.bb</a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gcc-c=
ross-canadian_8.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-canadi=
an_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-cross-canadian_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-c=
ross-canadian_8.2.bb</a>&gt;} (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{<a href=3D"http://gcc-cross-initial_8.1.bb" rel=3D"norefer=
rer" target=3D"_blank">gcc-cross-initial_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-cross-initial_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-cr=
oss-initial_8.1.bb</a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gcc-c=
ross-initial_8.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-cross-initial=
_8.2.bb</a> &lt;<a href=3D"http://gcc-cross-initial_8.2.bb" rel=3D"noreferr=
er" target=3D"_blank">http://gcc-cross-initial_8.2.bb</a>&gt;}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{<a href=3D"http://gcc-cross_8.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">gcc-cross_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-cross_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-cross_8.1.=
bb</a>&gt; =3D&gt; <a href=3D"http://gcc-cross_8.2.bb" rel=3D"noreferrer" t=
arget=3D"_blank">gcc-cross_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-cross_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-cross_8.2.=
bb</a>&gt;} (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/{<a href=3D"http://gcc-crosssdk-initial_8.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">gcc-crosssdk-initial_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-crosssdk-initial_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc=
-crosssdk-initial_8.1.bb</a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gcc-c=
rosssdk-initial_8.2.bb" rel=3D"noreferrer" target=3D"_blank">gcc-crosssdk-i=
nitial_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-crosssdk-initial_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc=
-crosssdk-initial_8.2.bb</a>&gt;} (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{<a href=3D"http://gcc-crosssdk_8.1.bb" rel=3D"noreferrer" =
target=3D"_blank">gcc-crosssdk_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-crosssdk_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-crosssd=
k_8.1.bb</a>&gt; =3D&gt; <a href=3D"http://gcc-crosssdk_8.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">gcc-crosssdk_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-crosssdk_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-crosssd=
k_8.2.bb</a>&gt;} (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{<a href=3D"http://gcc-runtime_8.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">gcc-runtime_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-runtime_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-runtime_=
8.1.bb</a>&gt; =3D&gt; <a href=3D"http://gcc-runtime_8.2.bb" rel=3D"norefer=
rer" target=3D"_blank">gcc-runtime_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-runtime_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-runtime_=
8.2.bb</a>&gt;} (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{<a href=3D"http://gcc-sanitizers_8.1.bb" rel=3D"noreferrer=
" target=3D"_blank">gcc-sanitizers_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-sanitizers_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-sanit=
izers_8.1.bb</a>&gt; =3D&gt; <a href=3D"http://gcc-sanitizers_8.2.bb" rel=
=3D"noreferrer" target=3D"_blank">gcc-sanitizers_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-sanitizers_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-sanit=
izers_8.2.bb</a>&gt;} (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{<a href=3D"http://gcc-source_8.1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">gcc-source_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-source_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-source_8.=
1.bb</a>&gt; =3D&gt; <a href=3D"http://gcc-source_8.2.bb" rel=3D"noreferrer=
" target=3D"_blank">gcc-source_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-source_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-source_8.=
2.bb</a>&gt;} (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{<a href=3D"http://gcc_8.1.bb" rel=3D"noreferrer" target=3D=
"_blank">gcc_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc_8.1.bb</a>&gt; =
=3D&gt; <a href=3D"http://gcc_8.2.bb" rel=3D"noreferrer" target=3D"_blank">=
gcc_8.2.bb</a> &lt;<a href=3D"http://gcc_8.2.bb" rel=3D"noreferrer" target=
=3D"_blank">http://gcc_8.2.bb</a>&gt;} (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{<a href=3D"http://libgcc-initial_8.1.bb" rel=3D"noreferrer=
" target=3D"_blank">libgcc-initial_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://l=
ibgcc-initial_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://libgcc-in=
itial_8.1.bb</a>&gt; =3D&gt; <a href=3D"http://libgcc-initial_8.2.bb" rel=
=3D"noreferrer" target=3D"_blank">libgcc-initial_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://l=
ibgcc-initial_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://libgcc-in=
itial_8.2.bb</a>&gt;} (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{<a href=3D"http://libgcc_8.1.bb" rel=3D"noreferrer" target=
=3D"_blank">libgcc_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://l=
ibgcc_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://libgcc_8.1.bb</a>=
&gt; =3D&gt; <a href=3D"http://libgcc_8.2.bb" rel=3D"noreferrer" target=3D"=
_blank">libgcc_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://l=
ibgcc_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://libgcc_8.2.bb</a>=
&gt;} (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0rename meta/recip=
es-devtools/gcc/{<a href=3D"http://libgfortran_8.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">libgfortran_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://l=
ibgfortran_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://libgfortran_=
8.1.bb</a>&gt; =3D&gt; <a href=3D"http://libgfortran_8.2.bb" rel=3D"norefer=
rer" target=3D"_blank">libgfortran_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://l=
ibgfortran_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://libgfortran_=
8.2.bb</a>&gt;} (100%)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0041-arm-PR-target-86003-build-failures-with-with-cpu-xsc.patc=
h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.1/0041-arm-PR-target-86003-build-failures-with-with-cpu-xsc.patc=
h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deleted file mode 10064=
4<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0index 68b8962d47..00000=
00000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0041-arm-PR-target-86003-build-failures-with-with-cpu-xsc.patc=
h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+++ /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@@ -1,61 +0,0 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-From 11dc6b9576b78bb7a=
8d70491beab7ab4de24c9d0 Mon Sep 17<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A000:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-From: rearnsha &lt;rea=
rnsha@138bc75d-0d04-0410-961f-82ee72b054a4&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Date: Mon, 4 Jun 2018 =
08:46:04 +0000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Subject: [PATCH] [arm]=
 PR target/86003 build failures with<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-cpu=3Dxscale<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-The XScale cpu configu=
ration in GCC has always been somewhat<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-non-conforming.=C2=A0 =
Although XScale isn&#39;t an architecture<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(it&#39;s simply an<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-implementation of ARMv=
5te), we do by tradition emit a specific<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-pre-define for it.=C2=
=A0 We achieve this effect by adding an<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0additional<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-feature bit to the xsc=
ale CPU definition that isn&#39;t part of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the base<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-architecture.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-When I restructured th=
e options last year I overlooked this<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oddity and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-the result, of course,=
 is that this configuration now fails<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-as intended.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-What happens is that t=
he driver (correctly) constructs an<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0architecture<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-for the xscale cpu nam=
e (as armv5te) and passes it in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addition to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-CPU name.=C2=A0 The ba=
ckend code, on finding both a cpu and an<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0architecture<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-specifies attempts to =
correlate the two and finds a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0difference due to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-the additional feature=
 bit and reports an inconsistency<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(fatally if<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--werror is specified).=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-I think the best fix t=
o this is to treat the xscale feature<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bit using<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-the same mechanism tha=
t we use for other &#39;quirks&#39; in CPU<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-implementations and si=
mply filter it out before comparing the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-capabilities.=C2=A0 It=
 has the additional benefit that it&#39;s also the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-simplest fix.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =
=C2=A0PR target/86003<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =
=C2=A0* config/arm/<a href=3D"http://arm-cpus.in" rel=3D"noreferrer" target=
=3D"_blank">arm-cpus.in</a> &lt;<a href=3D"http://arm-cpus.in" rel=3D"noref=
errer" target=3D"_blank">http://arm-cpus.in</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(ALL_QUIRKS): Add xscal=
e feature to the list<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =
=C2=A0of bits to ignore when comparing architectures.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-git-svn-id:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0svn+ssh://<a href=3D"ht=
tp://gcc.gnu.org/svn/gcc/branches/gcc-8-branch@261141" rel=3D"noreferrer" t=
arget=3D"_blank">gcc.gnu.org/svn/gcc/branches/gcc-8-branch@261141</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc.gnu.org/svn/gcc/branches/gcc-8-branch@261141" rel=3D"noreferrer" target=
=3D"_blank">http://gcc.gnu.org/svn/gcc/branches/gcc-8-branch@261141</a>&gt;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0138bc75d-0d04-0410-961f=
-82ee72b054a4<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0----<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Signed-off-by: Khem Ra=
j &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmai=
l.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&gt;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Upstream-Status: Backp=
ort<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- gcc/ChangeLog=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 6 ++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- gcc/config/arm/<a hre=
f=3D"http://arm-cpus.in" rel=3D"noreferrer" target=3D"_blank">arm-cpus.in</=
a> &lt;<a href=3D"http://arm-cpus.in" rel=3D"noreferrer" target=3D"_blank">=
http://arm-cpus.in</a>&gt; | 4 +++-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- 2 files changed, 9 in=
sertions(+), 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-diff --git a/gcc/confi=
g/arm/<a href=3D"http://arm-cpus.in" rel=3D"noreferrer" target=3D"_blank">a=
rm-cpus.in</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://a=
rm-cpus.in" rel=3D"noreferrer" target=3D"_blank">http://arm-cpus.in</a>&gt;=
 b/gcc/config/arm/<a href=3D"http://arm-cpus.in" rel=3D"noreferrer" target=
=3D"_blank">arm-cpus.in</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://a=
rm-cpus.in" rel=3D"noreferrer" target=3D"_blank">http://arm-cpus.in</a>&gt;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-index 96972a057e7..545=
321b0bbe 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0---- a/gcc/config/arm/<=
a href=3D"http://arm-cpus.in" rel=3D"noreferrer" target=3D"_blank">arm-cpus=
.in</a> &lt;<a href=3D"http://arm-cpus.in" rel=3D"noreferrer" target=3D"_bl=
ank">http://arm-cpus.in</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-+++ b/gcc/config/arm/<=
a href=3D"http://arm-cpus.in" rel=3D"noreferrer" target=3D"_blank">arm-cpus=
.in</a> &lt;<a href=3D"http://arm-cpus.in" rel=3D"noreferrer" target=3D"_bl=
ank">http://arm-cpus.in</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-@@ -268,7 +268,9 @@ de=
fine fgroup DOTPROD=C2=A0 =C2=A0 =C2=A0 NEON dotprod<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- # List of all quirk b=
its to strip out when comparing CPU<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features with<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- # architectures.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--define fgroup ALL_QUI=
RKS=C2=A0 =C2=A0quirk_no_volatile_ce<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0quirk_armv6kz quirk_cm3=
_ldrd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-+# xscale isn&#39;t re=
ally a &#39;quirk&#39;, but it isn&#39;t an<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0architecture either and=
 we<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-+# need to ignore it f=
or matching purposes.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-+define fgroup ALL_QUI=
RKS=C2=A0 =C2=A0quirk_no_volatile_ce<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0quirk_armv6kz quirk_cm3=
_ldrd xscale<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- # Architecture entrie=
s<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- # format:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-2.17.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git a/meta/recip=
es-devtools/gcc/gcc-8.1.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 93%<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from meta/recipe=
s-devtools/gcc/gcc-8.1.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to meta/recipes-=
devtools/gcc/gcc-8.2.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0index ebe3c24978..8503a=
66b07 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--- a/meta/recipes-devt=
ools/gcc/gcc-8.1.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+++ b/meta/recipes-devt=
ools/gcc/gcc-8.2.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@@ -2,13 +2,13 @@ requi=
re gcc-common.inc<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0# Third digit in =
PV should be incremented after a minor release<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-PV =3D &quot;8.1.0&quo=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+PV =3D &quot;8.2.0&quo=
t;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0# BINV should be =
incremented to a revision after a minor<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc release<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-BINV =3D &quot;8.1.0&q=
uot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+BINV =3D &quot;8.2.0&q=
uot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-FILESEXTRAPATHS =3D.<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${FILE_DIRNAME}/g=
cc-8.1:${FILE_DIRNAME}/gcc-8.1/backport:&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+FILESEXTRAPATHS =3D.<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;${FILE_DIRNAME}/g=
cc-8.2:${FILE_DIRNAME}/gcc-8.2/backport:&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0DEPENDS =3D+ &quo=
t;mpfr gmp libmpc zlib flex-native&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0NATIVEDEPS =3D &q=
uot;mpfr-native gmp-native libmpc-native<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0zlib-native flex-native=
&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@@ -73,10 +73,9 @@ SRC_=
URI =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ${BACKPORTS} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0BACKPORTS =3D &qu=
ot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0file://0041-arm-P=
R-target-86003-build-failures-with-with-cpu-xsc.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-SRC_URI[md5sum] =3D &q=
uot;65f7c65818dc540b3437605026d329fc&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-SRC_URI[sha256sum] =3D=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;1d1866f992626e613=
49a1ccd0b8d5253816222cdc13390dcfaa74b093aa2b153&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+SRC_URI[md5sum] =3D &q=
uot;4ab282f414676496483b3e1793d07862&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+SRC_URI[sha256sum] =3D=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;196c3c04ba2613f89=
3283977e6011b2345d1cd1af9abeac58e916b1aab3e0080&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0S =3D &quot;${TMP=
DIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0#S =3D &quot;${TM=
PDIR}/work-shared/gcc-${PV}-${PR}/git&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0003-gcc-poison-system-directories.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0003-gcc-poison-system-directories.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0003-gcc-poison-system-directories.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0003-gcc-poison-system-directories.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0004-gcc-poison-dir-extend.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0004-gcc-poison-dir-extend.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0004-gcc-poison-dir-extend.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0004-gcc-poison-dir-extend.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0006-64-bit-multilib-hack.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0006-64-bit-multilib-hack.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0006-64-bit-multilib-hack.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0006-64-bit-multilib-hack.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0007-optional-libstdc.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0007-optional-libstdc.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0007-optional-libstdc.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0007-optional-libstdc.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0009-COLLECT_GCC_OPTIONS.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0009-COLLECT_GCC_OPTIONS.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0009-COLLECT_GCC_OPTIONS.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0009-COLLECT_GCC_OPTIONS.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0011-fortran-cross-compile-hack.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0011-fortran-cross-compile-hack.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0011-fortran-cross-compile-hack.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0011-fortran-cross-compile-hack.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0012-cpp-honor-sysroot.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0012-cpp-honor-sysroot.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0012-cpp-honor-sysroot.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0012-cpp-honor-sysroot.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0013-MIPS64-Default-to-N64-ABI.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0013-MIPS64-Default-to-N64-ABI.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0013-MIPS64-Default-to-N64-ABI.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0013-MIPS64-Default-to-N64-ABI.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patc=
h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patc=
h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0015-gcc-Fix-argument-list-too-long-error.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0015-gcc-Fix-argument-list-too-long-error.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0015-gcc-Fix-argument-list-too-long-error.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0015-gcc-Fix-argument-list-too-long-error.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0016-Disable-sdt.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0016-Disable-sdt.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0016-Disable-sdt.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0016-Disable-sdt.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0017-libtool.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0017-libtool.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from meta/recipe=
s-devtools/gcc/gcc-8.1/0017-libtool.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to meta/recipes-=
devtools/gcc/gcc-8.2/0017-libtool.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0019-Use-the-multilib-config-files-from-B-instead-of-usin.patc=
h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0019-Use-the-multilib-config-files-from-B-instead-of-usin.patc=
h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0019-Use-the-multilib-config-files-from-B-instead-of-usin.patch<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0019-Use-the-multilib-config-files-from-B-instead-of-usin.patch<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patc=
h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patc=
h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patch<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patch<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0021-export-CPP.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0021-export-CPP.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0021-export-CPP.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0021-export-CPP.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patc=
h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patc=
h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0023-Ensure-target-gcc-headers-can-be-included.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0023-Ensure-target-gcc-headers-can-be-included.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0023-Ensure-target-gcc-headers-can-be-included.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0023-Ensure-target-gcc-headers-can-be-included.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patc=
h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patc=
h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0025-Don-t-search-host-directory-during-relink-if-inst_pr.patc=
h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0025-Don-t-search-host-directory-during-relink-if-inst_pr.patc=
h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0025-Don-t-search-host-directory-during-relink-if-inst_pr.patch<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0025-Don-t-search-host-directory-during-relink-if-inst_pr.patch<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patc=
h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patc=
h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0027-aarch64-Add-support-for-musl-ldso.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0027-aarch64-Add-support-for-musl-ldso.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0027-aarch64-Add-support-for-musl-ldso.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0027-aarch64-Add-support-for-musl-ldso.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0029-handle-sysroot-support-for-nativesdk-gcc.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0029-handle-sysroot-support-for-nativesdk-gcc.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0029-handle-sysroot-support-for-nativesdk-gcc.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0029-handle-sysroot-support-for-nativesdk-gcc.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0030-Search-target-sysroot-gcc-version-specific-dirs-with.patc=
h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0030-Search-target-sysroot-gcc-version-specific-dirs-with.patc=
h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0030-Search-target-sysroot-gcc-version-specific-dirs-with.patch<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0030-Search-target-sysroot-gcc-version-specific-dirs-with.patch<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0031-Fix-various-_FOR_BUILD-and-related-variables.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0031-Fix-various-_FOR_BUILD-and-related-variables.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0031-Fix-various-_FOR_BUILD-and-related-variables.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0031-Fix-various-_FOR_BUILD-and-related-variables.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patc=
h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patc=
h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patc=
h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patc=
h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0037-sync-gcc-stddef.h-with-musl.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0037-sync-gcc-stddef.h-with-musl.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0037-sync-gcc-stddef.h-with-musl.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0037-sync-gcc-stddef.h-with-musl.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0038-fix-segmentation-fault-in-precompiled-header-generat.patc=
h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0038-fix-segmentation-fault-in-precompiled-header-generat.patc=
h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0038-fix-segmentation-fault-in-precompiled-header-generat.patch<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0038-fix-segmentation-fault-in-precompiled-header-generat.patch<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0039-Fix-for-testsuite-failure.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0039-Fix-for-testsuite-failure.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0039-Fix-for-testsuite-failure.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0039-Fix-for-testsuite-failure.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/gcc-8.1/0040-Re-introduce-spe-commandline-options.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/gcc-8.2/0040-Re-introduce-spe-commandline-options.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.1/0040-Re-introduce-spe-commandline-options.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/gcc-8.2/0040-Re-introduce-spe-commandline-options.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/<a href=3D"http://gcc-cross-canadian_8.1.bb" rel=3D"noreferrer" target=
=3D"_blank">gcc-cross-canadian_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-cross-canadian_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-c=
ross-canadian_8.1.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/<a href=3D"http://gcc-cross-canadian_8.2.bb" rel=3D"noreferrer" target=
=3D"_blank">gcc-cross-canadian_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-cross-canadian_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-c=
ross-canadian_8.2.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/<a href=3D"http://gcc-cross-canadian_8.1.bb" rel=3D"noreferrer" target=
=3D"_blank">gcc-cross-canadian_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-cross-canadian_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-c=
ross-canadian_8.1.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/<a href=3D"http://gcc-cross-canadian_8.2.bb" rel=3D"noreferrer" target=
=3D"_blank">gcc-cross-canadian_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-cross-canadian_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-c=
ross-canadian_8.2.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/<a href=3D"http://gcc-cross-initial_8.1.bb" rel=3D"noreferrer" target=
=3D"_blank">gcc-cross-initial_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-cross-initial_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-cr=
oss-initial_8.1.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/<a href=3D"http://gcc-cross-initial_8.2.bb" rel=3D"noreferrer" target=
=3D"_blank">gcc-cross-initial_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-cross-initial_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-cr=
oss-initial_8.2.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/<a href=3D"http://gcc-cross-initial_8.1.bb" rel=3D"noreferrer" target=3D=
"_blank">gcc-cross-initial_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-cross-initial_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-cr=
oss-initial_8.1.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to meta/recipes-=
devtools/gcc/<a href=3D"http://gcc-cross-initial_8.2.bb" rel=3D"noreferrer"=
 target=3D"_blank">gcc-cross-initial_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-cross-initial_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-cr=
oss-initial_8.2.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git a/meta/recip=
es-devtools/gcc/<a href=3D"http://gcc-cross_8.1.bb" rel=3D"noreferrer" targ=
et=3D"_blank">gcc-cross_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-cross_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-cross_8.1.=
bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/<a href=3D"http://gcc-cross_8.2.bb" rel=3D"noreferrer" target=3D"_blan=
k">gcc-cross_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-cross_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-cross_8.2.=
bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from meta/recipe=
s-devtools/gcc/<a href=3D"http://gcc-cross_8.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">gcc-cross_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-cross_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-cross_8.1.=
bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to meta/recipes-=
devtools/gcc/<a href=3D"http://gcc-cross_8.2.bb" rel=3D"noreferrer" target=
=3D"_blank">gcc-cross_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-cross_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-cross_8.2.=
bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a/meta/recipes-devtools=
/gcc/<a href=3D"http://gcc-crosssdk-initial_8.1.bb" rel=3D"noreferrer" targ=
et=3D"_blank">gcc-crosssdk-initial_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-crosssdk-initial_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc=
-crosssdk-initial_8.1.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/<a href=3D"http://gcc-crosssdk-initial_8.2.bb" rel=3D"noreferrer" targ=
et=3D"_blank">gcc-crosssdk-initial_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-crosssdk-initial_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc=
-crosssdk-initial_8.2.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/<a href=3D"http://gcc-crosssdk-initial_8.1.bb" rel=3D"noreferrer" target=
=3D"_blank">gcc-crosssdk-initial_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-crosssdk-initial_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc=
-crosssdk-initial_8.1.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/g=
cc/<a href=3D"http://gcc-crosssdk-initial_8.2.bb" rel=3D"noreferrer" target=
=3D"_blank">gcc-crosssdk-initial_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-crosssdk-initial_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc=
-crosssdk-initial_8.2.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git a/meta/recip=
es-devtools/gcc/<a href=3D"http://gcc-crosssdk_8.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">gcc-crosssdk_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-crosssdk_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-crosssd=
k_8.1.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/<a href=3D"http://gcc-crosssdk_8.2.bb" rel=3D"noreferrer" target=3D"_b=
lank">gcc-crosssdk_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-crosssdk_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-crosssd=
k_8.2.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from meta/recipe=
s-devtools/gcc/<a href=3D"http://gcc-crosssdk_8.1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">gcc-crosssdk_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-crosssdk_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-crosssd=
k_8.1.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to meta/recipes-=
devtools/gcc/<a href=3D"http://gcc-crosssdk_8.2.bb" rel=3D"noreferrer" targ=
et=3D"_blank">gcc-crosssdk_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-crosssdk_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-crosssd=
k_8.2.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git a/meta/recip=
es-devtools/gcc/<a href=3D"http://gcc-runtime_8.1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">gcc-runtime_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-runtime_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-runtime_=
8.1.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/<a href=3D"http://gcc-runtime_8.2.bb" rel=3D"noreferrer" target=3D"_bl=
ank">gcc-runtime_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-runtime_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-runtime_=
8.2.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from meta/recipe=
s-devtools/gcc/<a href=3D"http://gcc-runtime_8.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">gcc-runtime_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-runtime_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-runtime_=
8.1.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to meta/recipes-=
devtools/gcc/<a href=3D"http://gcc-runtime_8.2.bb" rel=3D"noreferrer" targe=
t=3D"_blank">gcc-runtime_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-runtime_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-runtime_=
8.2.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git a/meta/recip=
es-devtools/gcc/<a href=3D"http://gcc-sanitizers_8.1.bb" rel=3D"noreferrer"=
 target=3D"_blank">gcc-sanitizers_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-sanitizers_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-sanit=
izers_8.1.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/<a href=3D"http://gcc-sanitizers_8.2.bb" rel=3D"noreferrer" target=3D"=
_blank">gcc-sanitizers_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-sanitizers_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-sanit=
izers_8.2.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from meta/recipe=
s-devtools/gcc/<a href=3D"http://gcc-sanitizers_8.1.bb" rel=3D"noreferrer" =
target=3D"_blank">gcc-sanitizers_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-sanitizers_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-sanit=
izers_8.1.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to meta/recipes-=
devtools/gcc/<a href=3D"http://gcc-sanitizers_8.2.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">gcc-sanitizers_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-sanitizers_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-sanit=
izers_8.2.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git a/meta/recip=
es-devtools/gcc/<a href=3D"http://gcc-source_8.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">gcc-source_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-source_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-source_8.=
1.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/<a href=3D"http://gcc-source_8.2.bb" rel=3D"noreferrer" target=3D"_bla=
nk">gcc-source_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-source_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-source_8.=
2.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from meta/recipe=
s-devtools/gcc/<a href=3D"http://gcc-source_8.1.bb" rel=3D"noreferrer" targ=
et=3D"_blank">gcc-source_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-source_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-source_8.=
1.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to meta/recipes-=
devtools/gcc/<a href=3D"http://gcc-source_8.2.bb" rel=3D"noreferrer" target=
=3D"_blank">gcc-source_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc-source_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc-source_8.=
2.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git a/meta/recip=
es-devtools/gcc/<a href=3D"http://gcc_8.1.bb" rel=3D"noreferrer" target=3D"=
_blank">gcc_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc_8.1.bb</a>&gt; b=
/meta/recipes-devtools/gcc/<a href=3D"http://gcc_8.2.bb" rel=3D"noreferrer"=
 target=3D"_blank">gcc_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc_8.2.bb</a>&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from meta/recipe=
s-devtools/gcc/<a href=3D"http://gcc_8.1.bb" rel=3D"noreferrer" target=3D"_=
blank">gcc_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc_8.1.bb</a>&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to meta/recipes-=
devtools/gcc/<a href=3D"http://gcc_8.2.bb" rel=3D"noreferrer" target=3D"_bl=
ank">gcc_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://g=
cc_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://gcc_8.2.bb</a>&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git a/meta/recip=
es-devtools/gcc/<a href=3D"http://libgcc-initial_8.1.bb" rel=3D"noreferrer"=
 target=3D"_blank">libgcc-initial_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://l=
ibgcc-initial_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://libgcc-in=
itial_8.1.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/<a href=3D"http://libgcc-initial_8.2.bb" rel=3D"noreferrer" target=3D"=
_blank">libgcc-initial_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://l=
ibgcc-initial_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://libgcc-in=
itial_8.2.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from meta/recipe=
s-devtools/gcc/<a href=3D"http://libgcc-initial_8.1.bb" rel=3D"noreferrer" =
target=3D"_blank">libgcc-initial_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://l=
ibgcc-initial_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://libgcc-in=
itial_8.1.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to meta/recipes-=
devtools/gcc/<a href=3D"http://libgcc-initial_8.2.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">libgcc-initial_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://l=
ibgcc-initial_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://libgcc-in=
itial_8.2.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git a/meta/recip=
es-devtools/gcc/<a href=3D"http://libgcc_8.1.bb" rel=3D"noreferrer" target=
=3D"_blank">libgcc_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://l=
ibgcc_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://libgcc_8.1.bb</a>=
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/meta/recipes-devtools=
/gcc/<a href=3D"http://libgcc_8.2.bb" rel=3D"noreferrer" target=3D"_blank">=
libgcc_8.2.bb</a> &lt;<a href=3D"http://libgcc_8.2.bb" rel=3D"noreferrer" t=
arget=3D"_blank">http://libgcc_8.2.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0similarity index 100%<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename from meta/recipe=
s-devtools/gcc/<a href=3D"http://libgcc_8.1.bb" rel=3D"noreferrer" target=
=3D"_blank">libgcc_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://l=
ibgcc_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://libgcc_8.1.bb</a>=
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rename to meta/recipes-=
devtools/gcc/<a href=3D"http://libgcc_8.2.bb" rel=3D"noreferrer" target=3D"=
_blank">libgcc_8.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://l=
ibgcc_8.2.bb" rel=3D"noreferrer" target=3D"_blank">http://libgcc_8.2.bb</a>=
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git a/meta/recip=
es-devtools/gcc/<a href=3D"http://libgfortran_8.1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">libgfortran_8.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://l=
ibgfortran_8.1.bb" rel=3D"noreferrer" target=3D"_blank">http://libgfortran_=
8.1.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b/m</blockquote></div>

--000000000000bcdb2c0572b5b465--
