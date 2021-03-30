Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web08.166.1617139825567631383
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Mar 2021 14:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XH66EV+h;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id c204so13044190pfc.4
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Mar 2021 14:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L1gyf6iNMQvZ4O3wRVFSGF0jfrwpYzfNscanSS+N82o=;
        b=XH66EV+hwazSISk9bVpTnrXYjGV15mpIUtkoE40BXFZoBi+FPwmBQI+jf+oCH5xyLQ
         ysJIMDdKAEpgtfZVD/vWSXR63riyI7FGTAf+G8RySRTy5biGGHxe/jjCwpV5TxZscECX
         yCIkzNL5PlSqWjEMSbyp8fRHbUm6iDVr3f1X33GoHj6l/Pfxqsnq77v32IFJ2dR9rL4I
         BePYiVgciXVYYNvWp6jHNryxdkd1OWN8iPlhfcQ1kbjbIToq0r6GkVoDIDpJPgQ57GC0
         /Wtn72xjwk7HetOsBPBcQLZfWU/P2xuiuGX2qsroPQS6z5AO+B15raA0cwv7N5ujfwdQ
         S3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L1gyf6iNMQvZ4O3wRVFSGF0jfrwpYzfNscanSS+N82o=;
        b=OXwyCzdxWjLwmY1NOZ8EAbDxZADAoIob1rNcU51pHBUef1kwNz03xWIg470Ah9hzcg
         oh7T6Ky6PKR9G4w7cXiK1or1uWYe20T7iRYXNhha9M69qa/5e4F8lfBpJKYbmDaQsb6B
         bxn3THxeuP+lk2YcboG2QyJoEEhhWSmme8Enftzzq3B2nf3yB/tul70cnxVEhDgKY9KQ
         ldSqBdY8xLBe5Mt6xniwsPz6B9Q2lKgJSbFjlZGrde9Of5R4thYb72K7Ou/tDgH2Myb6
         yLWtouxhGeHvRpvUVI1EWjEMq9AAlwwGxZisbxnsR3KGuTZtlDhl2X+IxvXrpZVDTL9y
         1COA==
X-Gm-Message-State: AOAM532MHa28jTUpGoQ4kt5AxUm15YGDu/4c8eM+bTPk+dWPytflMXF1
	ky76ZjQa5WC6YOrGQ/wKgOBCTz+b9jq0Zg==
X-Google-Smtp-Source: ABdhPJwrBDEaqiOt5zXriiEQapHNqTui1iAi1hiyTyFlg+q0X5WpdC9tSidXsJ84MMI5TkWgdT3DQA==
X-Received: by 2002:a05:6a00:2301:b029:204:9bb6:de72 with SMTP id h1-20020a056a002301b02902049bb6de72mr40225pfh.62.1617139824767;
        Tue, 30 Mar 2021 14:30:24 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ae20])
        by smtp.gmail.com with ESMTPSA id j30sm144875pgm.59.2021.03.30.14.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 14:30:24 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [RFT][PATCH 0/2] GCC 11 Pre-release
Date: Tue, 30 Mar 2021 14:30:17 -0700
Message-Id: <20210330213019.2300696-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset updates to upcoming gcc 11 release, Please give it a try
in your test beds if you have cycles, since there is still sometime left
for final GCC 11 release perhaps we can squeeze in some bugfixes

They are also available via git here
https://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-11

Khem Raj (2):
  gcc: Upgrade to GCC 11
  libgcc-initial: Do not build fp128 to decimal ppc functions

 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 .../gcc/{gcc-10.2.inc => gcc-11.0.inc}        |  23 +-
 ...ian_10.2.bb => gcc-cross-canadian_11.0.bb} |   0
 .../{gcc-cross_10.2.bb => gcc-cross_11.0.bb}  |   0
 ...-crosssdk_10.2.bb => gcc-crosssdk_11.0.bb} |   0
 ...cc-runtime_10.2.bb => gcc-runtime_11.0.bb} |   0
 ...itizers_10.2.bb => gcc-sanitizers_11.0.bb} |   0
 ...{gcc-source_10.2.bb => gcc-source_11.0.bb} |   0
 ...-up-__aarch64_cas16_acq_rel-fallback.patch |  66 --
 ...ight-Line-Speculation-SLS-mitigation.patch | 202 ------
 ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |  10 +-
 ...libgomp-libitc-Fix-bootstrap-PR70454.patch | 208 ------
 ...e-SLS-mitigation-for-RET-and-BR-inst.patch | 607 ----------------
 .../0002-gcc-poison-system-directories.patch  |  55 +-
 ...h64-Mitigate-SLS-for-BLR-instruction.patch | 658 ------------------
 ...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   6 +-
 .../gcc/gcc/0004-64-bit-multilib-hack.patch   |  10 +-
 .../gcc/gcc/0005-optional-libstdc.patch       |  26 +-
 .../gcc/gcc/0006-COLLECT_GCC_OPTIONS.patch    |   6 +-
 ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |  16 +-
 .../gcc/0008-fortran-cross-compile-hack.patch |  10 +-
 .../gcc/gcc/0009-cpp-honor-sysroot.patch      |  14 +-
 .../gcc/0010-MIPS64-Default-to-N64-ABI.patch  |   6 +-
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  32 +-
 ...gcc-Fix-argument-list-too-long-error.patch |  11 +-
 .../gcc/gcc/0013-Disable-sdt.patch            |  18 +-
 .../gcc/gcc/0014-libtool.patch                |   2 +-
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |   4 +-
 ...-config-files-from-B-instead-of-usin.patch |  14 +-
 ...ir-from-.la-which-usually-points-to-.patch |   2 +-
 .../gcc/gcc/0018-export-CPP.patch             |   4 +-
 ...e-target-gcc-headers-can-be-included.patch |  12 +-
 ...t-directory-during-relink-if-inst_pr.patch |   2 +-
 ...IR-replacement-instead-of-hardcoding.patch |   4 +-
 ...22-aarch64-Add-support-for-musl-ldso.patch |   4 +-
 ...-fix-libcc1-s-install-path-and-rpath.patch |  10 +-
 ...le-sysroot-support-for-nativesdk-gcc.patch |  44 +-
 ...sroot-gcc-version-specific-dirs-with.patch |   8 +-
 ...ous-_FOR_BUILD-and-related-variables.patch |  18 +-
 ...027-nios2-Define-MUSL_DYNAMIC_LINKER.patch |   4 +-
 ...d-to-link-commandline-for-musl-targe.patch |  10 +-
 ...using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |   4 +-
 .../0030-sync-gcc-stddef.h-with-musl.patch    |   4 +-
 ...-fault-in-precompiled-header-generat.patch |   6 +-
 .../gcc/0032-Fix-for-testsuite-failure.patch  |   2 +-
 ...Re-introduce-spe-commandline-options.patch |  13 +-
 ...as-for-__cpu_indicator_init-instead-.patch |  12 +-
 ...s-Do-not-use-__LINE__-for-maintainin.patch |  34 +-
 ...ngw32-Enable-operation_not_supported.patch |   8 +-
 ...omic-Do-not-enforce-march-on-aarch64.patch |   8 +-
 .../gcc/{gcc_10.2.bb => gcc_11.0.bb}          |   0
 meta/recipes-devtools/gcc/libgcc-initial.inc  |   2 +
 ...initial_10.2.bb => libgcc-initial_11.0.bb} |   0
 .../gcc/{libgcc_10.2.bb => libgcc_11.0.bb}    |   0
 ...ibgfortran_10.2.bb => libgfortran_11.0.bb} |   0
 55 files changed, 238 insertions(+), 1983 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-10.2.inc => gcc-11.0.inc} (82%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_10.2.bb => gcc-cross-canadian_11.0.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_10.2.bb => gcc-cross_11.0.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_10.2.bb => gcc-crosssdk_11.0.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_10.2.bb => gcc-runtime_11.0.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_10.2.bb => gcc-sanitizers_11.0.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_10.2.bb => gcc-source_11.0.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-aarch64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch
 rename meta/recipes-devtools/gcc/{gcc_10.2.bb => gcc_11.0.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_10.2.bb => libgcc-initial_11.0.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_10.2.bb => libgcc_11.0.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_10.2.bb => libgfortran_11.0.bb} (100%)

-- 
2.31.1

