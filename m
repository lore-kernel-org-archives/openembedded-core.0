Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.2033.1619668394564112552
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 20:53:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Nzr7xUJd;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id u14-20020a17090a1f0eb029014e38011b09so10242463pja.5
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Apr 2021 20:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B6Inx/RavEteZF6LdHMdz2fXXhiQ1vr8JP0bXcoPSfg=;
        b=Nzr7xUJdOD+19VBHhUh5p/Dp/HAKw1E5bUC1HYkxqWLPmcFPJfCB0Qk0l/q/MkN+ba
         gw6SU/zsrPTLrVaGuht2/Vx5zEBEenl5yMmFLdrj02p5Wm9sSoxsU2QDJQdcwQyYghxw
         9irnzNqaT8fS5sUPmdEVDdYniSa6GaNuN/ZGAfJqo/xuV+ePIo2TCFZlRwnWKv3naicu
         N2d8VpT6Y4rxLOYz8OCb5aMqXNr7/s+m5wYiajQB6TexeRRMDxo8LeaMtsmxS+VGH+vI
         uTAtC3lRU7z8V0zEW/QOhN8BkOMHtcgJloBpYuo+DK+fpZND3tVKP2GaoaSpfekBwalB
         0P3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B6Inx/RavEteZF6LdHMdz2fXXhiQ1vr8JP0bXcoPSfg=;
        b=gevP8P7Fy6+KOHLv19LOXT3j0sk7kzLYlEZ6pukTONJd01oJG2EZFUFQgj3lTnf+zy
         A27jbtgban5onjnV5Bg5T/7CNfBPVhyxlXW9PSeNl18VFrXcup2AL0IvKGUC/4MHVLMv
         5zdELg/nhGbBnyvPy/1HaZvg4F5q+Trrb3vFgoBzUtaAaor7xHbCti8UTE19+yBfdcyp
         cN6sl8t/AFhN59qy+CQVpExJEGiF5mWYQexHbplzJwYXvp6HQFpZftTwXcSyIdd3a43Y
         VO6JPJJgsY9l3+eb92eK4Cq8c4moWHoTFbH/VDoTvIkGzckZsG7DRQ3HRftIiF/jB+ed
         D86A==
X-Gm-Message-State: AOAM533pnRN6KrT0190jiITxUASJFSZgqrrN2raJJ2qD6KT92lPJmFCH
	baoAcwiLfqdyl8mjLGAmsmxQI+g5FlZVEA==
X-Google-Smtp-Source: ABdhPJzLgDKzQTdGt4mKYQwJUtMCmMATAaD5czovpDjwFCJhRlScqc4Hwxse7vHs2A/EC8RnP32Z5g==
X-Received: by 2002:a17:90b:d92:: with SMTP id bg18mr37285160pjb.155.1619668393649;
        Wed, 28 Apr 2021 20:53:13 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ef3])
        by smtp.gmail.com with ESMTPSA id b7sm996929pfi.42.2021.04.28.20.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 20:53:13 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 0/2] Update to GCC 11.1.0
Date: Wed, 28 Apr 2021 20:53:08 -0700
Message-Id: <20210429035310.993762-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset enables OE to use first of GCC 11 release series
this is a major upgrade and details are here

https://gcc.gnu.org/gcc-11/changes.html

If you are porting your packages then porting guide is helpful

https://gcc.gnu.org/gcc-11/porting_to.html

Bugs addressed in this release

https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&list_id=300438&resolution=FIXED&target_milestone=11.0

Its also available on openembedded-core-contrib repo

https://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc11

have fun !

Khem Raj (2):
  libgcc-initial: Do not build fp128 to decimal ppc functions
  gcc: Upgrade to GCC 11

 meta/conf/distro/include/maintainers.inc      |   2 +-
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 .../gcc/{gcc-10.3.inc => gcc-11.1.inc}        |  12 +-
 ...ian_10.3.bb => gcc-cross-canadian_11.1.bb} |   0
 .../{gcc-cross_10.3.bb => gcc-cross_11.1.bb}  |   0
 ...-crosssdk_10.3.bb => gcc-crosssdk_11.1.bb} |   0
 ...cc-runtime_10.3.bb => gcc-runtime_11.1.bb} |   0
 ...itizers_10.3.bb => gcc-sanitizers_11.1.bb} |   0
 ...{gcc-source_10.3.bb => gcc-source_11.1.bb} |   0
 ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |  10 +-
 .../0002-gcc-poison-system-directories.patch  |  52 +++--
 ...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   6 +-
 .../gcc/gcc/0004-64-bit-multilib-hack.patch   |  10 +-
 .../gcc/gcc/0005-optional-libstdc.patch       |  26 +--
 .../gcc/gcc/0006-COLLECT_GCC_OPTIONS.patch    |   6 +-
 ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |  16 +-
 .../gcc/0008-fortran-cross-compile-hack.patch |  10 +-
 .../gcc/gcc/0009-cpp-honor-sysroot.patch      |  14 +-
 .../gcc/0010-MIPS64-Default-to-N64-ABI.patch  |   6 +-
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  28 +--
 ...gcc-Fix-argument-list-too-long-error.patch |   6 +-
 .../gcc/gcc/0013-Disable-sdt.patch            |  16 +-
 .../gcc/gcc/0014-libtool.patch                |   2 +-
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |   4 +-
 ...-config-files-from-B-instead-of-usin.patch |  14 +-
 ...ir-from-.la-which-usually-points-to-.patch |   2 +-
 .../gcc/gcc/0018-export-CPP.patch             |   4 +-
 ...e-target-gcc-headers-can-be-included.patch |  12 +-
 ...t-directory-during-relink-if-inst_pr.patch |   2 +-
 ...IR-replacement-instead-of-hardcoding.patch |   4 +-
 ...22-aarch64-Add-support-for-musl-ldso.patch |   4 +-
 ...-fix-libcc1-s-install-path-and-rpath.patch |   8 +-
 ...le-sysroot-support-for-nativesdk-gcc.patch |  41 ++--
 ...sroot-gcc-version-specific-dirs-with.patch |   8 +-
 ...ous-_FOR_BUILD-and-related-variables.patch |  18 +-
 ...027-nios2-Define-MUSL_DYNAMIC_LINKER.patch |   4 +-
 ...d-to-link-commandline-for-musl-targe.patch |  10 +-
 ...using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |   4 +-
 .../0030-sync-gcc-stddef.h-with-musl.patch    |   4 +-
 ...-fault-in-precompiled-header-generat.patch |   6 +-
 .../gcc/0032-Fix-for-testsuite-failure.patch  |   2 +-
 ...Re-introduce-spe-commandline-options.patch |  11 +-
 ...as-for-__cpu_indicator_init-instead-.patch |  12 +-
 ...s-Do-not-use-__LINE__-for-maintainin.patch |  34 +--
 ...ngw32-Enable-operation_not_supported.patch |   4 +-
 ...omic-Do-not-enforce-march-on-aarch64.patch |   8 +-
 ...libgomp-libitc-Fix-bootstrap-PR70454.patch | 209 ------------------
 .../gcc/{gcc_10.3.bb => gcc_11.1.bb}          |   0
 meta/recipes-devtools/gcc/libgcc-initial.inc  |   2 +
 ...initial_10.3.bb => libgcc-initial_11.1.bb} |   0
 .../gcc/{libgcc_10.3.bb => libgcc_11.1.bb}    |   0
 ...ibgfortran_10.3.bb => libgfortran_11.1.bb} |   0
 52 files changed, 226 insertions(+), 429 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-10.3.inc => gcc-11.1.inc} (94%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_10.3.bb => gcc-cross-canadian_11.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_10.3.bb => gcc-cross_11.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_10.3.bb => gcc-crosssdk_11.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_10.3.bb => gcc-runtime_11.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_10.3.bb => gcc-sanitizers_11.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_10.3.bb => gcc-source_11.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0038-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch
 rename meta/recipes-devtools/gcc/{gcc_10.3.bb => gcc_11.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_10.3.bb => libgcc-initial_11.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_10.3.bb => libgcc_11.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_10.3.bb => libgfortran_11.1.bb} (100%)

--
2.31.1
