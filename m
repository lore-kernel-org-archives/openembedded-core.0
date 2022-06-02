Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9B4C433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 16:53:23 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web12.1576.1654188796124760974
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:53:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=P6L5/I70;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id d129so5222722pgc.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=J8WPWXC5AX7bVdYd9kTNWE0eIgguCw+DkZmc4YmUmVY=;
        b=P6L5/I70LpDay8z05OKVlS58EO1ZFU2s+1LyeLEKZVhWqIEurXPm6xaJKLRZWCIXOJ
         S2TxsU86rWAlWP+ICygmZufGGB/GuZLBr59JfttFrBppROTdAOSgMooKkfBqZ9V7DW8u
         efum3Ab97mfgmMI6DJzyvDapNaPFpoBWqP2IcBXfXufuowcAsvQLLj+gsROQinMEtJvn
         lsb+9fYWy0+LHM88etHCXyhVU4AYUdG8bPIAEYmSsaWQzcmaBnMvooLj1JTovUR2xwNB
         BDEHfCGy7gF9l3bjh46ns1iKw6YW+59WRBnzREv6dDw8LaxRdL3eV6JE/xVLd19CzFHt
         RzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J8WPWXC5AX7bVdYd9kTNWE0eIgguCw+DkZmc4YmUmVY=;
        b=7YbwZlFYqtWrduT1FhThMaV/yZzRfxnITuv4WlR2dap77ziORQVNCLk4D2UPaY4m4B
         AfY7m/LQLJ2RxFTErwcG/oX8TL7Lfzsae+AzmifJ4kf/RGu/UBRA0ZTH0ZACLUXLJAci
         bbAsoNScazrAKLCmQCJSx9iCCIHJqPsgqYWR2LX3A6Wb7WLnAX4/e1ziDHxMuAtBCT9r
         7Mpuk/FM5OwLdXq8TeQMLBd7qkmQ/m1jxTeTBwyiRvghj7QZbBvOEJ247+BTLYDVaUrl
         b4jdizHhjfPBQR0YBHxIMvHpxRWmsY5zYzO6DyLnU97Xb1yWcK3A2h5Idzir4lMyUCq1
         F4VQ==
X-Gm-Message-State: AOAM5325g2CuMQKmdS8oxrgmJz5Hvtx898YB4m9yo0mFeMvPxjCo7l84
	5nHfSogBe9H2sr5+SflzpcP1uXgC3H/mr8nY
X-Google-Smtp-Source: 
 ABdhPJylZGNUOQWikdK6nxN1lLLWIXcy7+Bn+1HXC1Dk5BNzGP61/2qmaZ5xPSGlPRTTaTiWUHWefQ==
X-Received: by 2002:a63:5b5d:0:b0:3fc:97d5:f8b2 with SMTP id
 l29-20020a635b5d000000b003fc97d5f8b2mr5110591pgm.322.1654188793636;
        Thu, 02 Jun 2022 09:53:13 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i188-20020a626dc5000000b0050dc762815asm3782233pfc.52.2022.06.02.09.53.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 09:53:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 26/26] gcc: Upgrade to 11.3 release
Date: Thu,  2 Jun 2022 06:51:58 -1000
Message-Id: 
 <e63013cc38b82659658365da53b14952711d6701.1654188574.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654188574.git.steve@sakoman.com>
References: <cover.1654188574.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 16:53:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166503

From: Khem Raj <raj.khem@gmail.com>

This is a bugfix release on gcc-11 series, fixes 189 bugs [1]
Drop backported patches already included in 11.3 release

[1] https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=11.3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc      |   2 +-
 .../gcc/{gcc-11.2.inc => gcc-11.3.inc}        |  66 ++--
 ...ian_11.2.bb => gcc-cross-canadian_11.3.bb} |   0
 .../{gcc-cross_11.2.bb => gcc-cross_11.3.bb}  |   0
 ...-crosssdk_11.2.bb => gcc-crosssdk_11.3.bb} |   0
 ...cc-runtime_11.2.bb => gcc-runtime_11.3.bb} |   0
 ...itizers_11.2.bb => gcc-sanitizers_11.3.bb} |   0
 ...{gcc-source_11.2.bb => gcc-source_11.3.bb} |   0
 .../gcc/gcc/0001-CVE-2021-35465.patch         | 138 --------
 ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |  10 +-
 .../gcc/gcc/0002-CVE-2021-35465.patch         |  39 ---
 .../0002-gcc-poison-system-directories.patch  |  26 +-
 ....patch => 0003-64-bit-multilib-hack.patch} |   2 +-
 .../gcc/gcc/0003-CVE-2021-35465.patch         | 103 ------
 .../gcc/gcc/0004-CVE-2021-35465.patch         | 304 ------------------
 ...s.h-in-B-instead-of-S-and-t-oe-in-B.patch} |  12 +-
 ...oot.patch => 0005-cpp-honor-sysroot.patch} |  54 ++--
 ...MIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch} | 101 +++---
 ...gcc-Fix-argument-list-too-long-error.patch |  42 +++
 ...{0014-libtool.patch => 0008-libtool.patch} |   2 +-
 ...-fix-v4bx-to-linker-to-support-EABI.patch} |   2 +-
 ...config-files-from-B-instead-of-usin.patch} |  14 +-
 ...r-from-.la-which-usually-points-to-.patch} |   2 +-
 ...-target-gcc-headers-can-be-included.patch} |   6 +-
 ...gcc-Fix-argument-list-too-long-error.patch |  38 ---
 ...-directory-during-relink-if-inst_pr.patch} |   2 +-
 ...fix-libcc1-s-install-path-and-rpath.patch} |   8 +-
 ...e-build-CPP-CPPFLAGS-is-used-for-bu.patch} |  89 ++---
 ...ins-something-unsupported-by-the-bu.patch} |  39 +--
 ...e-sysroot-support-for-nativesdk-gcc.patch} |  14 +-
 ...root-gcc-version-specific-dirs-with.patch} |   8 +-
 ...19-nios2-Define-MUSL_DYNAMIC_LINKER.patch} |  28 +-
 ...-to-link-commandline-for-musl-targe.patch} |  10 +-
 ...sing-LDFLAGS-not-just-SHLIB_LDFLAGS.patch} |   2 +-
 ...=> 0022-sync-gcc-stddef.h-with-musl.patch} |   2 +-
 ...e-introduce-spe-commandline-options.patch} |   4 +-
 ...s-for-__cpu_indicator_init-instead-.patch} |   6 +-
 ...-Do-not-use-__LINE__-for-maintainin.patch} |   4 +-
 ...gw32-Enable-operation_not_supported.patch} |   2 +-
 ...mic-Do-not-enforce-march-on-aarch64.patch} |  10 +-
 ...y-debug-prefix-maps-before-checksum.patch} |  24 +-
 ... 0029-Fix-install-path-of-linux64.h.patch} |  10 +-
 .../gcc/0042-Fix-thread-stack-size-init.patch |  23 --
 .../gcc/{gcc_11.2.bb => gcc_11.3.bb}          |   0
 ...initial_11.2.bb => libgcc-initial_11.3.bb} |   0
 .../gcc/{libgcc_11.2.bb => libgcc_11.3.bb}    |   0
 ...ibgfortran_11.2.bb => libgfortran_11.3.bb} |   0
 47 files changed, 329 insertions(+), 919 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-11.2.inc => gcc-11.3.inc} (58%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_11.2.bb => gcc-cross-canadian_11.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_11.2.bb => gcc-cross_11.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_11.2.bb => gcc-crosssdk_11.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_11.2.bb => gcc-runtime_11.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_11.2.bb => gcc-sanitizers_11.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_11.2.bb => gcc-source_11.3.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0002-CVE-2021-35465.patch
 rename meta/recipes-devtools/gcc/gcc/{0004-64-bit-multilib-hack.patch => 0003-64-bit-multilib-hack.patch} (99%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0003-CVE-2021-35465.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0004-CVE-2021-35465.patch
 rename meta/recipes-devtools/gcc/gcc/{0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch => 0004-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch} (91%)
 rename meta/recipes-devtools/gcc/gcc/{0009-cpp-honor-sysroot.patch => 0005-cpp-honor-sysroot.patch} (41%)
 rename meta/recipes-devtools/gcc/gcc/{0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch => 0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch} (81%)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0007-gcc-Fix-argument-list-too-long-error.patch
 rename meta/recipes-devtools/gcc/gcc/{0014-libtool.patch => 0008-libtool.patch} (94%)
 rename meta/recipes-devtools/gcc/gcc/{0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch => 0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch} (95%)
 rename meta/recipes-devtools/gcc/gcc/{0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch => 0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch} (89%)
 rename meta/recipes-devtools/gcc/gcc/{0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch => 0011-Avoid-using-libdir-from-.la-which-usually-points-to-.patch} (92%)
 rename meta/recipes-devtools/gcc/gcc/{0019-Ensure-target-gcc-headers-can-be-included.patch => 0012-Ensure-target-gcc-headers-can-be-included.patch} (96%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch
 rename meta/recipes-devtools/gcc/gcc/{0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch => 0013-Don-t-search-host-directory-during-relink-if-inst_pr.patch} (93%)
 rename meta/recipes-devtools/gcc/gcc/{0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch => 0014-libcc1-fix-libcc1-s-install-path-and-rpath.patch} (90%)
 rename meta/recipes-devtools/gcc/gcc/{0018-export-CPP.patch => 0015-Makefile.in-Ensure-build-CPP-CPPFLAGS-is-used-for-bu.patch} (79%)
 rename meta/recipes-devtools/gcc/gcc/{0006-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch => 0016-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch} (68%)
 rename meta/recipes-devtools/gcc/gcc/{0024-handle-sysroot-support-for-nativesdk-gcc.patch => 0017-handle-sysroot-support-for-nativesdk-gcc.patch} (98%)
 rename meta/recipes-devtools/gcc/gcc/{0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch => 0018-Search-target-sysroot-gcc-version-specific-dirs-with.patch} (92%)
 rename meta/recipes-devtools/gcc/gcc/{0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch => 0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch} (40%)
 rename meta/recipes-devtools/gcc/gcc/{0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch => 0020-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch} (84%)
 rename meta/recipes-devtools/gcc/gcc/{0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch => 0021-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch} (93%)
 rename meta/recipes-devtools/gcc/gcc/{0030-sync-gcc-stddef.h-with-musl.patch => 0022-sync-gcc-stddef.h-with-musl.patch} (97%)
 rename meta/recipes-devtools/gcc/gcc/{0033-Re-introduce-spe-commandline-options.patch => 0023-Re-introduce-spe-commandline-options.patch} (90%)
 rename meta/recipes-devtools/gcc/gcc/{0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch => 0024-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch} (94%)
 rename meta/recipes-devtools/gcc/gcc/{0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch => 0025-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch} (98%)
 rename meta/recipes-devtools/gcc/gcc/{0036-mingw32-Enable-operation_not_supported.patch => 0026-mingw32-Enable-operation_not_supported.patch} (93%)
 rename meta/recipes-devtools/gcc/gcc/{0037-libatomic-Do-not-enforce-march-on-aarch64.patch => 0027-libatomic-Do-not-enforce-march-on-aarch64.patch} (85%)
 rename meta/recipes-devtools/gcc/gcc/{0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch => 0028-debug-101473-apply-debug-prefix-maps-before-checksum.patch} (81%)
 rename meta/recipes-devtools/gcc/gcc/{0001-Fix-install-path-of-linux64.h.patch => 0029-Fix-install-path-of-linux64.h.patch} (81%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.patch
 rename meta/recipes-devtools/gcc/{gcc_11.2.bb => gcc_11.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_11.2.bb => libgcc-initial_11.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_11.2.bb => libgcc_11.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_11.2.bb => libgfortran_11.3.bb} (100%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 2c5e730827..0a1897fc92 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -189,7 +189,7 @@ RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <r
 RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-gcc-source-11.2.0 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-gcc-source-11.3.0 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gconf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-gcr = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-gdb = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.3.inc
similarity index 58%
rename from meta/recipes-devtools/gcc/gcc-11.2.inc
rename to meta/recipes-devtools/gcc/gcc-11.3.inc
index 68e0d203fc..b1ef9d25af 100644
--- a/meta/recipes-devtools/gcc/gcc-11.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.3.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "11.2.0"
+PV = "11.3.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "11.2.0"
+BINV = "11.3.0"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
@@ -32,45 +32,41 @@ SRC_URI = "\
            ${BASEURI} \
            file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
            file://0002-gcc-poison-system-directories.patch \
-           file://0004-64-bit-multilib-hack.patch \
-           file://0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch \
-           file://0009-cpp-honor-sysroot.patch \
-           file://0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch \
-           file://0012-gcc-Fix-argument-list-too-long-error.patch \
-           file://0014-libtool.patch \
-           file://0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch \
-           file://0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
-           file://0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch \
-           file://0018-export-CPP.patch \
-           file://0019-Ensure-target-gcc-headers-can-be-included.patch \
-           file://0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch \
-           file://0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch \
-           file://0024-handle-sysroot-support-for-nativesdk-gcc.patch \
-           file://0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch \
-           file://0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
-           file://0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch \
-           file://0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
-           file://0030-sync-gcc-stddef.h-with-musl.patch \
-           file://0033-Re-introduce-spe-commandline-options.patch \
-           file://0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
-           file://0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
-           file://0036-mingw32-Enable-operation_not_supported.patch \
-           file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
-           file://0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch \
-           file://0006-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch \
-           file://0001-Fix-install-path-of-linux64.h.patch \
-           file://0001-CVE-2021-35465.patch \
-           file://0002-CVE-2021-35465.patch \
-           file://0003-CVE-2021-35465.patch \
-           file://0004-CVE-2021-35465.patch \
+           file://0003-64-bit-multilib-hack.patch \
+           file://0004-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch \
+           file://0005-cpp-honor-sysroot.patch \
+           file://0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch \
+           file://0007-gcc-Fix-argument-list-too-long-error.patch \
+           file://0008-libtool.patch \
+           file://0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch \
+           file://0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
+           file://0011-Avoid-using-libdir-from-.la-which-usually-points-to-.patch \
+           file://0012-Ensure-target-gcc-headers-can-be-included.patch \
+           file://0013-Don-t-search-host-directory-during-relink-if-inst_pr.patch \
+           file://0014-libcc1-fix-libcc1-s-install-path-and-rpath.patch \
+           file://0015-Makefile.in-Ensure-build-CPP-CPPFLAGS-is-used-for-bu.patch \
+           file://0016-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch \
+           file://0017-handle-sysroot-support-for-nativesdk-gcc.patch \
+           file://0018-Search-target-sysroot-gcc-version-specific-dirs-with.patch \
+           file://0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
+           file://0020-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch \
+           file://0021-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
+           file://0022-sync-gcc-stddef.h-with-musl.patch \
+           file://0023-Re-introduce-spe-commandline-options.patch \
+           file://0024-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
+           file://0025-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
+           file://0026-mingw32-Enable-operation_not_supported.patch \
+           file://0027-libatomic-Do-not-enforce-march-on-aarch64.patch \
+           file://0028-debug-101473-apply-debug-prefix-maps-before-checksum.patch \
+           file://0029-Fix-install-path-of-linux64.h.patch \
+           \
            file://0001-CVE-2021-42574.patch \
            file://0002-CVE-2021-42574.patch \
            file://0003-CVE-2021-42574.patch \
            file://0004-CVE-2021-42574.patch \
            file://0001-CVE-2021-46195.patch \
-           file://0042-Fix-thread-stack-size-init.patch \
 "
-SRC_URI[sha256sum] = "d08edc536b54c372a1010ff6619dd274c0f1603aa49212ba20f7aa2cda36fa8b"
+SRC_URI[sha256sum] = "b47cf2818691f5b1e21df2bb38c795fac2cfbd640ede2d0a5e1c89e338a3ac39"
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_11.2.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_11.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_11.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_11.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_11.2.bb b/meta/recipes-devtools/gcc/gcc-cross_11.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_11.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross_11.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_11.2.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_11.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_11.2.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_11.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb b/meta/recipes-devtools/gcc/gcc-runtime_11.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_11.2.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_11.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_11.2.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_11.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_11.2.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_11.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_11.2.bb b/meta/recipes-devtools/gcc/gcc-source_11.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_11.2.bb
rename to meta/recipes-devtools/gcc/gcc-source_11.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.patch b/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.patch
deleted file mode 100644
index e4aee10e37..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.patch
+++ /dev/null
@@ -1,138 +0,0 @@
-From 3929bca9ca95de9d35e82ae8828b188029e3eb70 Mon Sep 17 00:00:00 2001
-From: Richard Earnshaw <rearnsha@arm.com>
-Date: Fri, 11 Jun 2021 16:02:05 +0100
-Subject: [PATCH] arm: Add command-line option for enabling CVE-2021-35465
- mitigation [PR102035]
-
-Add a new option, -mfix-cmse-cve-2021-35465 and document it.  Enable it
-automatically for cortex-m33, cortex-m35p and cortex-m55.
-
-gcc:
-	PR target/102035
-	* config/arm/arm.opt (mfix-cmse-cve-2021-35465): New option.
-	* doc/invoke.texi (Arm Options): Document it.
-	* config/arm/arm-cpus.in (quirk_vlldm): New feature bit.
-	(ALL_QUIRKS): Add quirk_vlldm.
-	(cortex-m33): Add quirk_vlldm.
-	(cortex-m35p, cortex-m55): Likewise.
-	* config/arm/arm.c (arm_option_override): Enable fix_vlldm if
-	targetting an affected CPU and not explicitly controlled on
-	the command line.
-
-CVE: CVE-2021-35465
-Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=3929bca9ca95de9d35e82ae8828b188029e3eb70]
-Signed-off-by: Pgowda <pgowda.cve@gmail.com>
-
----
- gcc/config/arm/arm-cpus.in | 9 +++++++--
- gcc/config/arm/arm.c       | 9 +++++++++
- gcc/config/arm/arm.opt     | 4 ++++
- gcc/doc/invoke.texi        | 9 +++++++++
- 4 files changed, 29 insertions(+), 2 deletions(-)
-
-diff --git a/gcc/config/arm/arm.c b/gcc/config/arm/arm.c
---- a/gcc/config/arm/arm.c	2021-11-15 02:13:11.100579812 -0800
-+++ b/gcc/config/arm/arm.c	2021-11-15 02:17:36.988237692 -0800
-@@ -3610,6 +3610,15 @@ arm_option_override (void)
- 	fix_cm3_ldrd = 0;
-     }
- 
-+  /* Enable fix_vlldm by default if required.  */
-+  if (fix_vlldm == 2)
-+    {
-+      if (bitmap_bit_p (arm_active_target.isa, isa_bit_quirk_vlldm))
-+	fix_vlldm = 1;
-+      else
-+	fix_vlldm = 0;
-+    }
-+
-   /* Hot/Cold partitioning is not currently supported, since we can't
-      handle literal pool placement in that case.  */
-   if (flag_reorder_blocks_and_partition)
-diff --git a/gcc/config/arm/arm-cpus.in b/gcc/config/arm/arm-cpus.in
---- a/gcc/config/arm/arm-cpus.in	2021-11-15 02:13:11.104579747 -0800
-+++ b/gcc/config/arm/arm-cpus.in	2021-11-15 02:17:36.984237757 -0800
-@@ -186,6 +186,9 @@ define feature quirk_armv6kz
- # Cortex-M3 LDRD quirk.
- define feature quirk_cm3_ldrd
- 
-+# v8-m/v8.1-m VLLDM errata.
-+define feature quirk_vlldm
-+
- # Don't use .cpu assembly directive
- define feature quirk_no_asmcpu
- 
-@@ -322,7 +325,7 @@ define implied vfp_base MVE MVE_FP ALL_F
- # architectures.
- # xscale isn't really a 'quirk', but it isn't an architecture either and we
- # need to ignore it for matching purposes.
--define fgroup ALL_QUIRKS   quirk_no_volatile_ce quirk_armv6kz quirk_cm3_ldrd xscale quirk_no_asmcpu
-+define fgroup ALL_QUIRKS   quirk_no_volatile_ce quirk_armv6kz quirk_cm3_ldrd quirk_vlldm xscale quirk_no_asmcpu
- 
- define fgroup IGNORE_FOR_MULTILIB cdecp0 cdecp1 cdecp2 cdecp3 cdecp4 cdecp5 cdecp6 cdecp7
- 
-@@ -1570,6 +1573,7 @@ begin cpu cortex-m33
-  architecture armv8-m.main+dsp+fp
-  option nofp remove ALL_FP
-  option nodsp remove armv7em
-+ isa quirk_vlldm
-  costs v7m
- end cpu cortex-m33
- 
-@@ -1579,6 +1583,7 @@ begin cpu cortex-m35p
-  architecture armv8-m.main+dsp+fp
-  option nofp remove ALL_FP
-  option nodsp remove armv7em
-+ isa quirk_vlldm
-  costs v7m
- end cpu cortex-m35p
- 
-@@ -1590,7 +1595,7 @@ begin cpu cortex-m55
-  option nomve remove mve mve_float
-  option nofp remove ALL_FP mve_float
-  option nodsp remove MVE mve_float
-- isa quirk_no_asmcpu
-+ isa quirk_no_asmcpu quirk_vlldm
-  costs v7m
-  vendor 41
- end cpu cortex-m55
-diff --git a/gcc/config/arm/arm.opt b/gcc/config/arm/arm.opt
---- a/gcc/config/arm/arm.opt	2021-11-15 02:13:11.104579747 -0800
-+++ b/gcc/config/arm/arm.opt	2021-11-15 02:17:36.988237692 -0800
-@@ -268,6 +268,10 @@ Target Var(fix_cm3_ldrd) Init(2)
- Avoid overlapping destination and address registers on LDRD instructions
- that may trigger Cortex-M3 errata.
- 
-+mfix-cmse-cve-2021-35465
-+Target Var(fix_vlldm) Init(2)
-+Mitigate issues with VLLDM on some M-profile devices (CVE-2021-35465).
-+
- munaligned-access
- Target Var(unaligned_access) Init(2) Save
- Enable unaligned word and halfword accesses to packed data.
-diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
---- a/gcc/doc/invoke.texi	2021-11-15 02:13:11.112579616 -0800
-+++ b/gcc/doc/invoke.texi	2021-11-15 02:17:36.996237562 -0800
-@@ -804,6 +804,7 @@ Objective-C and Objective-C++ Dialects}.
- -mverbose-cost-dump @gol
- -mpure-code @gol
- -mcmse @gol
-+-mfix-cmse-cve-2021-35465 @gol
- -mfdpic}
- 
- @emph{AVR Options}
-@@ -20487,6 +20488,14 @@ Generate secure code as per the "ARMv8-M
- Development Tools Engineering Specification", which can be found on
- @url{https://developer.arm.com/documentation/ecm0359818/latest/}.
- 
-+@item -mfix-cmse-cve-2021-35465
-+@opindex mfix-cmse-cve-2021-35465
-+Mitigate against a potential security issue with the @code{VLLDM} instruction
-+in some M-profile devices when using CMSE (CVE-2021-365465).  This option is
-+enabled by default when the option @option{-mcpu=} is used with
-+@code{cortex-m33}, @code{cortex-m35p} or @code{cortex-m55}.  The option
-+@option{-mno-fix-cmse-cve-2021-35465} can be used to disable the mitigation.
-+
- @item -mfdpic
- @itemx -mno-fdpic
- @opindex mfdpic
diff --git a/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
index 0a108ee51b..0bf8834bb2 100644
--- a/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
+++ b/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
@@ -1,4 +1,4 @@
-From 368eaf1846733a9920c7cf5bc547a377e7167785 Mon Sep 17 00:00:00 2001
+From 6badb97389cae4ff9a533d38dc7cceefe21b97a8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 08:37:11 +0400
 Subject: [PATCH] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
@@ -12,10 +12,10 @@ Upstream-Status: Inappropriate [embedded specific]
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 504f6410274..bcebad264ec 100755
+index e218a19e333..45744e6e471 100755
 --- a/configure
 +++ b/configure
-@@ -9728,7 +9728,7 @@ fi
+@@ -9750,7 +9750,7 @@ fi
  # for target_alias and gcc doesn't manage it consistently.
  target_configargs="--cache-file=./config.cache ${target_configargs}"
  
@@ -25,10 +25,10 @@ index 504f6410274..bcebad264ec 100755
   *" newlib "*)
    case " $target_configargs " in
 diff --git a/configure.ac b/configure.ac
-index 088e735c5db..1289fe08760 100644
+index 7e8e628b325..bf66b51373c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3240,7 +3240,7 @@ fi
+@@ -3255,7 +3255,7 @@ fi
  # for target_alias and gcc doesn't manage it consistently.
  target_configargs="--cache-file=./config.cache ${target_configargs}"
  
diff --git a/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-35465.patch b/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-35465.patch
deleted file mode 100644
index e09818fecf..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-35465.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 574e7950bd6b34e9e2cacce18c802b45505d1d0a Mon Sep 17 00:00:00 2001
-From: Richard Earnshaw <rearnsha@arm.com>
-Date: Fri, 18 Jun 2021 17:16:25 +0100
-Subject: [PATCH] arm: add erratum mitigation to __gnu_cmse_nonsecure_call
- [PR102035]
-
-Add the recommended erratum mitigation sequence to
-__gnu_cmse_nonsecure_call for use on Armv8-m.main devices. Since this
-is in the library code we cannot know in advance whether the core we
-are running on will be affected by this, so always enable it.
-
-libgcc:
-	PR target/102035
-	* config/arm/cmse_nonsecure_call.S (__gnu_cmse_nonsecure_call):
-	Add vlldm erratum work-around.
-
-CVE: CVE-2021-35465
-Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=574e7950bd6b34e9e2cacce18c802b45505d1d0a]
-Signed-off-by: Pgowda <pgowda.cve@gmail.com>
-
----
- libgcc/config/arm/cmse_nonsecure_call.S | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/libgcc/config/arm/cmse_nonsecure_call.S b/libgcc/config/arm/cmse_nonsecure_call.S
---- a/libgcc/config/arm/cmse_nonsecure_call.S
-+++ b/libgcc/config/arm/cmse_nonsecure_call.S
-@@ -102,6 +102,11 @@ blxns	    r4
- #ifdef __ARM_PCS_VFP
- vpop.f64    {d8-d15}
- #else
-+/* VLLDM erratum mitigation sequence. */
-+mrs	    r5, control
-+tst	    r5, #8	  /* CONTROL_S.SFPA */
-+it	    ne
-+.inst.w	    0xeeb00a40	  /* vmovne s0, s0 */
- vlldm	    sp		  /* Lazy restore of d0-d16 and FPSCR.  */
- add	    sp, sp, #0x88 /* Free space used to save floating point registers.  */
- #endif /* __ARM_PCS_VFP */
diff --git a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
index 18a9fb8701..d19cefbdf9 100644
--- a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
+++ b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
@@ -1,4 +1,4 @@
-From 118c6f054711d437167ff125a88c9236bfc8099c Mon Sep 17 00:00:00 2001
+From 863f1f9dc78839ecd021b2cb01d501e8c9e00ef7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 8 Mar 2021 16:04:20 -0800
 Subject: [PATCH] gcc: poison-system-directories
@@ -25,7 +25,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  7 files changed, 86 insertions(+), 2 deletions(-)
 
 diff --git a/gcc/common.opt b/gcc/common.opt
-index c75dd36843e..49acbd6ed44 100644
+index a75b44ee47e..d15105a73f3 100644
 --- a/gcc/common.opt
 +++ b/gcc/common.opt
 @@ -683,6 +683,10 @@ Wreturn-local-addr
@@ -40,10 +40,10 @@ index c75dd36843e..49acbd6ed44 100644
  Common Var(warn_shadow) Warning
  Warn when one variable shadows another.  Same as -Wshadow=global.
 diff --git a/gcc/config.in b/gcc/config.in
-index 10a13cde586..8848284da41 100644
+index 048bf52e8c2..4f973f7906a 100644
 --- a/gcc/config.in
 +++ b/gcc/config.in
-@@ -218,6 +218,16 @@
+@@ -230,6 +230,16 @@
  #endif
  
  
@@ -61,10 +61,10 @@ index 10a13cde586..8848284da41 100644
     optimizer and back end) to be checked for dynamic type safety at runtime.
     This is quite expensive. */
 diff --git a/gcc/configure b/gcc/configure
-index 9bb436ce7bd..3f0734bff11 100755
+index 7218b0c331a..d7445339f9a 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -1020,6 +1020,7 @@ enable_maintainer_mode
+@@ -1019,6 +1019,7 @@ enable_maintainer_mode
  enable_link_mutex
  enable_link_serialization
  enable_version_specific_runtime_libs
@@ -72,7 +72,7 @@ index 9bb436ce7bd..3f0734bff11 100755
  enable_plugin
  enable_host_shared
  enable_libquadmath_support
-@@ -1782,6 +1783,8 @@ Optional Features:
+@@ -1781,6 +1782,8 @@ Optional Features:
    --enable-version-specific-runtime-libs
                            specify that runtime libraries should be installed
                            in a compiler-specific directory
@@ -81,7 +81,7 @@ index 9bb436ce7bd..3f0734bff11 100755
    --enable-plugin         enable plugin support
    --enable-host-shared    build host code as shared libraries
    --disable-libquadmath-support
-@@ -31325,6 +31328,22 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
+@@ -31932,6 +31935,22 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
  fi
  
  
@@ -105,10 +105,10 @@ index 9bb436ce7bd..3f0734bff11 100755
  
  
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index caa611933df..54e21764b3e 100644
+index 49f043ed29b..fe488f2232b 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -7123,6 +7123,22 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
+@@ -7393,6 +7393,22 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
                  [specify that runtime libraries should be
                   installed in a compiler-specific directory])])
  
@@ -132,7 +132,7 @@ index caa611933df..54e21764b3e 100644
  AC_SUBST(subdirs)
  AC_SUBST(srcdir)
 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index 7a368959e5e..6659a903bf0 100644
+index 35508efb4ef..40f798eac78 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
 @@ -369,6 +369,7 @@ Objective-C and Objective-C++ Dialects}.
@@ -143,7 +143,7 @@ index 7a368959e5e..6659a903bf0 100644
  -Wno-pragmas  -Wno-prio-ctor-dtor  -Wredundant-decls @gol
  -Wrestrict  -Wno-return-local-addr  -Wreturn-type @gol
  -Wno-scalar-storage-order  -Wsequence-point @gol
-@@ -7735,6 +7736,14 @@ made up of data only and thus requires no special treatment.  But, for
+@@ -7728,6 +7729,14 @@ made up of data only and thus requires no special treatment.  But, for
  most targets, it is made up of code and thus requires the stack to be
  made executable in order for the program to work properly.
  
@@ -159,7 +159,7 @@ index 7a368959e5e..6659a903bf0 100644
  @opindex Wfloat-equal
  @opindex Wno-float-equal
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 7837553958b..19c75b6e20d 100644
+index 0af888c7d78..b047fc31c2f 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
 @@ -1152,6 +1152,8 @@ proper position among the other output files.  */
diff --git a/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch
similarity index 99%
rename from meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch
rename to meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch
index 5f14dd2a58..c0e8cbd4d9 100644
--- a/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch
@@ -1,4 +1,4 @@
-From 2fa5c93641b75a662839c1b6eee172b6c481c70e Mon Sep 17 00:00:00 2001
+From b87a3ac51df372128be2fda992238c5aab4a719a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:10:06 +0400
 Subject: [PATCH] 64-bit multilib hack.
diff --git a/meta/recipes-devtools/gcc/gcc/0003-CVE-2021-35465.patch b/meta/recipes-devtools/gcc/gcc/0003-CVE-2021-35465.patch
deleted file mode 100644
index c7a7c76bf8..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0003-CVE-2021-35465.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From 30461cf8dba3d3adb15a125e4da48800eb2b9b8f Mon Sep 17 00:00:00 2001
-From: Richard Earnshaw <rearnsha@arm.com>
-Date: Fri, 18 Jun 2021 17:18:37 +0100
-Subject: [PATCH] arm: fix vlldm erratum for Armv8.1-m [PR102035]
-
-For Armv8.1-m we generate code that emits VLLDM directly and do not
-rely on support code in the library, so emit the mitigation directly
-as well, when required.  In this case, we can use the compiler options
-to determine when to apply the fix and when it is safe to omit it.
-
-gcc:
-	PR target/102035
-	* config/arm/arm.md (attribute arch): Add fix_vlldm.
-	(arch_enabled): Use it.
-	* config/arm/vfp.md (lazy_store_multiple_insn): Add alternative to
-	use when erratum mitigation is needed.
-
-CVE: CVE-2021-35465
-Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=30461cf8dba3d3adb15a125e4da48800eb2b9b8f]
-Signed-off-by: Pgowda <pgowda.cve@gmail.com>
-
----
- gcc/config/arm/arm.md | 11 +++++++++--
- gcc/config/arm/vfp.md | 10 +++++++---
- 2 files changed, 16 insertions(+), 5 deletions(-)
-
-diff -upr a/gcc/config/arm/arm.md b/gcc/config/arm/arm.md
---- a/gcc/config/arm/arm.md	2020-07-22 23:35:17.344384552 -0700
-+++ b/gcc/config/arm/arm.md	2021-11-11 20:33:58.431543947 -0800
-@@ -132,9 +132,12 @@
- ; TARGET_32BIT, "t1" or "t2" to specify a specific Thumb mode.  "v6"
- ; for ARM or Thumb-2 with arm_arch6, and nov6 for ARM without
- ; arm_arch6.  "v6t2" for Thumb-2 with arm_arch6 and "v8mb" for ARMv8-M
--; Baseline.  This attribute is used to compute attribute "enabled",
-+; Baseline.  "fix_vlldm" is for fixing the v8-m/v8.1-m VLLDM erratum.
-+; This attribute is used to compute attribute "enabled",
- ; use type "any" to enable an alternative in all cases.
--(define_attr "arch" "any,a,t,32,t1,t2,v6,nov6,v6t2,v8mb,iwmmxt,iwmmxt2,armv6_or_vfpv3,neon,mve"
-+(define_attr "arch" "any, a, t, 32, t1, t2, v6,nov6, v6t2, \
-+		     v8mb, fix_vlldm, iwmmxt, iwmmxt2, armv6_or_vfpv3, \
-+		     neon, mve"
-   (const_string "any"))
- 
- (define_attr "arch_enabled" "no,yes"
-@@ -177,6 +180,10 @@
- 	      (match_test "TARGET_THUMB1 && arm_arch8"))
- 	 (const_string "yes")
- 
-+	 (and (eq_attr "arch" "fix_vlldm")
-+	      (match_test "fix_vlldm"))
-+	 (const_string "yes")
-+
- 	 (and (eq_attr "arch" "iwmmxt2")
- 	      (match_test "TARGET_REALLY_IWMMXT2"))
- 	 (const_string "yes")
-diff -upr a/gcc/config/arm/vfp.md b/gcc/config/arm/vfp.md
---- a/gcc/config/arm/vfp.md	2020-07-22 23:35:17.356384684 -0700
-+++ b/gcc/config/arm/vfp.md	2021-11-11 20:33:58.431543947 -0800
-@@ -1703,12 +1703,15 @@
-    (set_attr "type" "mov_reg")]
- )
- 
-+;; Both this and the next instruction are treated by GCC in the same
-+;; way as a blockage pattern.  That's perhaps stronger than it needs
-+;; to be, but we do not want accesses to the VFP register bank to be
-+;; moved across either instruction.
-+
- (define_insn "lazy_store_multiple_insn"
--  [(set (match_operand:SI 0 "s_register_operand" "+&rk")
--	(post_dec:SI (match_dup 0)))
--   (unspec_volatile [(const_int 0)
--		     (mem:SI (post_dec:SI (match_dup 0)))]
--		    VUNSPEC_VLSTM)]
-+  [(unspec_volatile
-+    [(mem:BLK (match_operand:SI 0 "s_register_operand" "rk"))]
-+    VUNSPEC_VLSTM)]
-   "use_cmse && reload_completed"
-   "vlstm%?\\t%0"
-   [(set_attr "predicable" "yes")
-@@ -1716,14 +1719,16 @@
- )
- 
- (define_insn "lazy_load_multiple_insn"
--  [(set (match_operand:SI 0 "s_register_operand" "+&rk")
--	(post_inc:SI (match_dup 0)))
--   (unspec_volatile:SI [(const_int 0)
--			(mem:SI (match_dup 0))]
--		       VUNSPEC_VLLDM)]
-+  [(unspec_volatile
-+    [(mem:BLK (match_operand:SI 0 "s_register_operand" "rk,rk"))]
-+    VUNSPEC_VLLDM)]
-   "use_cmse && reload_completed"
--  "vlldm%?\\t%0"
--  [(set_attr "predicable" "yes")
-+  "@
-+   vscclrm\\t{vpr}\;vlldm\\t%0
-+   vlldm\\t%0"
-+  [(set_attr "arch" "fix_vlldm,*")
-+   (set_attr "predicable" "no")
-+   (set_attr "length" "8,4")
-    (set_attr "type" "load_4")]
- )
- 
diff --git a/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-35465.patch b/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-35465.patch
deleted file mode 100644
index 9dd6a313c2..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-35465.patch
+++ /dev/null
@@ -1,304 +0,0 @@
-From 809330ab8450261e05919b472783bf15e4b000f7 Mon Sep 17 00:00:00 2001
-From: Richard Earnshaw <rearnsha@arm.com>
-Date: Tue, 6 Jul 2021 15:10:18 +0100
-Subject: [PATCH] arm: Add tests for VLLDM mitigation [PR102035]
-
-New tests for the erratum mitigation.
-
-gcc/testsuite:
-	PR target/102035
-	* gcc.target/arm/cmse/mainline/8_1m/soft/cmse-13a.c: New test.
-	* gcc.target/arm/cmse/mainline/8_1m/soft/cmse-7a.c: Likewise.
-	* gcc.target/arm/cmse/mainline/8_1m/soft/cmse-8a.c: Likewise.
-	* gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-7a.c: Likewise.
-	* gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-8a.c: Likewise.
-	* gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-13a.c: Likewise.
-	* gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-7a.c: Likewise.
-	* gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-8a.c: Likewise.
-
-CVE: CVE-2021-35465
-Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=809330ab8450261e05919b472783bf15e4b000f7]
-Signed-off-by: Pgowda <pgowda.cve@gmail.com>
-
----
- .../arm/cmse/mainline/8_1m/soft/cmse-13a.c    | 31 +++++++++++++++++++
- .../arm/cmse/mainline/8_1m/soft/cmse-7a.c     | 28 +++++++++++++++++
- .../arm/cmse/mainline/8_1m/soft/cmse-8a.c     | 30 ++++++++++++++++++
- .../cmse/mainline/8_1m/softfp-sp/cmse-7a.c    | 27 ++++++++++++++++
- .../cmse/mainline/8_1m/softfp-sp/cmse-8a.c    | 29 +++++++++++++++++
- .../arm/cmse/mainline/8_1m/softfp/cmse-13a.c  | 30 ++++++++++++++++++
- .../arm/cmse/mainline/8_1m/softfp/cmse-7a.c   | 27 ++++++++++++++++
- .../arm/cmse/mainline/8_1m/softfp/cmse-8a.c   | 29 +++++++++++++++++
- 8 files changed, 231 insertions(+)
- create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-13a.c
- create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-7a.c
- create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-8a.c
- create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-7a.c
- create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-8a.c
- create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-13a.c
- create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-7a.c
- create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-8a.c
-
-diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-13a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-13a.c
---- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-13a.c	1969-12-31 16:00:00.000000000 -0800
-+++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-13a.c	2021-11-15 02:30:37.210637445 -0800
-@@ -0,0 +1,31 @@
-+/* { dg-do compile } */
-+/* { dg-options "-mcmse -mfloat-abi=soft -mfix-cmse-cve-2021-35465" }  */
-+/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=*" } { "-mfloat-abi=soft" } } */
-+
-+#include "../../../cmse-13.x"
-+
-+/* Checks for saving and clearing prior to function call.  */
-+/* Shift on the same register as blxns.  */
-+/* { dg-final { scan-assembler "lsrs\t(r\[1,4-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
-+/* { dg-final { scan-assembler "lsls\t(r\[1,4-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
-+/* { dg-final { scan-assembler-not "mov\tr0, r4" } } */
-+/* { dg-final { scan-assembler-not "mov\tr2, r4" } } */
-+/* { dg-final { scan-assembler-not "mov\tr3, r4" } } */
-+/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
-+/* { dg-final { scan-assembler "vlstm\tsp" } } */
-+/* Check the right registers are cleared and none appears twice.  */
-+/* { dg-final { scan-assembler "clrm\t\{(r1, )?(r4, )?(r5, )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" } } */
-+/* Check that the right number of registers is cleared and thus only one
-+   register is missing.  */
-+/* { dg-final { scan-assembler "clrm\t\{((r\[1,4-9\]|r10|fp|ip), ){9}APSR\}" } } */
-+/* Check that no cleared register is used for blxns.  */
-+/* { dg-final { scan-assembler-not "clrm\t\{\[^\}\]\+(r\[1,4-9\]|r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1" } } */
-+/* Check for v8.1-m variant of erratum work-around.  */
-+/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
-+/* { dg-final { scan-assembler "vlldm\tsp" } } */
-+/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
-+/* { dg-final { scan-assembler-not "vmov" } } */
-+/* { dg-final { scan-assembler-not "vmsr" } } */
-+
-+/* Now we check that we use the correct intrinsic to call.  */
-+/* { dg-final { scan-assembler "blxns" } } */
-diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-7a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-7a.c
---- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-7a.c	1969-12-31 16:00:00.000000000 -0800
-+++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-7a.c	2021-11-15 02:30:37.210637445 -0800
-@@ -0,0 +1,28 @@
-+/* { dg-do compile } */
-+/* { dg-options "-mcmse -mfloat-abi=soft -mfix-cmse-cve-2021-35465" }  */
-+/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=*" } { "-mfloat-abi=soft" } } */
-+
-+#include "../../../cmse-7.x"
-+
-+/* Checks for saving and clearing prior to function call.  */
-+/* Shift on the same register as blxns.  */
-+/* { dg-final { scan-assembler "lsrs\t(r\[0-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
-+/* { dg-final { scan-assembler "lsls\t(r\[0-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
-+/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
-+/* { dg-final { scan-assembler "vlstm\tsp" } } */
-+/* Check the right registers are cleared and none appears twice.  */
-+/* { dg-final { scan-assembler "clrm\t\{(r0, )?(r1, )?(r2, )?(r3, )?(r4, )?(r5, )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" } } */
-+/* Check that the right number of registers is cleared and thus only one
-+   register is missing.  */
-+/* { dg-final { scan-assembler "clrm\t\{((r\[0-9\]|r10|fp|ip), ){12}APSR\}" } } */
-+/* Check that no cleared register is used for blxns.  */
-+/* { dg-final { scan-assembler-not "clrm\t\{\[^\}\]\+(r\[0-9\]|r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1" } } */
-+/* Check for v8.1-m variant of erratum work-around.  */
-+/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
-+/* { dg-final { scan-assembler "vlldm\tsp" } } */
-+/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
-+/* { dg-final { scan-assembler-not "vmov" } } */
-+/* { dg-final { scan-assembler-not "vmsr" } } */
-+
-+/* Now we check that we use the correct intrinsic to call.  */
-+/* { dg-final { scan-assembler "blxns" } } */
-diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-8a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-8a.c
---- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-8a.c	1969-12-31 16:00:00.000000000 -0800
-+++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-8a.c	2021-11-15 02:30:37.210637445 -0800
-@@ -0,0 +1,30 @@
-+/* { dg-do compile } */
-+/* { dg-options "-mcmse -mfloat-abi=soft -mfix-cmse-cve-2021-35465" }  */
-+/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=*" } { "-mfloat-abi=soft" } } */
-+
-+#include "../../../cmse-8.x"
-+
-+/* Checks for saving and clearing prior to function call.  */
-+/* Shift on the same register as blxns.  */
-+/* { dg-final { scan-assembler "lsrs\t(r\[2-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
-+/* { dg-final { scan-assembler "lsls\t(r\[2-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
-+/* { dg-final { scan-assembler-not "mov\tr0, r4" } } */
-+/* { dg-final { scan-assembler-not "mov\tr1, r4" } } */
-+/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
-+/* { dg-final { scan-assembler "vlstm\tsp" } } */
-+/* Check the right registers are cleared and none appears twice.  */
-+/* { dg-final { scan-assembler "clrm\t\{(r2, )?(r3, )?(r4, )?(r5, )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" } } */
-+/* Check that the right number of registers is cleared and thus only one
-+   register is missing.  */
-+/* { dg-final { scan-assembler "clrm\t\{((r\[2-9\]|r10|fp|ip), ){10}APSR\}" } } */
-+/* Check that no cleared register is used for blxns.  */
-+/* { dg-final { scan-assembler-not "clrm\t\{\[^\}\]\+(r\[2-9\]|r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1" } } */
-+/* Check for v8.1-m variant of erratum work-around.  */
-+/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
-+/* { dg-final { scan-assembler "vlldm\tsp" } } */
-+/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
-+/* { dg-final { scan-assembler-not "vmov" } } */
-+/* { dg-final { scan-assembler-not "vmsr" } } */
-+
-+/* Now we check that we use the correct intrinsic to call.  */
-+/* { dg-final { scan-assembler "blxns" } } */
-diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-13a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-13a.c
---- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-13a.c	1969-12-31 16:00:00.000000000 -0800
-+++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-13a.c	2021-11-15 02:30:37.210637445 -0800
-@@ -0,0 +1,30 @@
-+/* { dg-do compile } */
-+/* { dg-options "-mcmse -mfloat-abi=softfp -mfpu=fpv5-d16 -mfix-cmse-cve-2021-35465" }  */
-+/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=*" } { "-mfloat-abi=softfp" } } */
-+/* { dg-skip-if "Skip these if testing single precision" {*-*-*} {"-mfpu=*-sp-*"} {""} } */
-+
-+#include "../../../cmse-13.x"
-+
-+/* Checks for saving and clearing prior to function call.  */
-+/* Shift on the same register as blxns.  */
-+/* { dg-final { scan-assembler "lsrs\t(r\[1,4-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
-+/* { dg-final { scan-assembler "lsls\t(r\[1,4-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
-+/* { dg-final { scan-assembler-not "mov\tr0, r4" } } */
-+/* { dg-final { scan-assembler-not "mov\tr2, r4" } } */
-+/* { dg-final { scan-assembler-not "mov\tr3, r4" } } */
-+/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
-+/* { dg-final { scan-assembler "vlstm\tsp" } } */
-+/* Check the right registers are cleared and none appears twice.  */
-+/* { dg-final { scan-assembler "clrm\t\{(r1, )?(r4, )?(r5, )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" } } */
-+/* Check that the right number of registers is cleared and thus only one
-+   register is missing.  */
-+/* { dg-final { scan-assembler "clrm\t\{((r\[1,4-9\]|r10|fp|ip), ){9}APSR\}" } } */
-+/* Check that no cleared register is used for blxns.  */
-+/* { dg-final { scan-assembler-not "clrm\t\{\[^\}\]\+(r\[1,4-9\]|r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1" } } */
-+/* Check for v8.1-m variant of erratum work-around.  */
-+/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
-+/* { dg-final { scan-assembler "vlldm\tsp" } } */
-+/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
-+
-+/* Now we check that we use the correct intrinsic to call.  */
-+/* { dg-final { scan-assembler "blxns" } } */
-diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-7a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-7a.c
---- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-7a.c	1969-12-31 16:00:00.000000000 -0800
-+++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-7a.c	2021-11-15 02:30:37.210637445 -0800
-@@ -0,0 +1,27 @@
-+/* { dg-do compile } */
-+/* { dg-options "-mcmse -mfloat-abi=softfp -mfpu=fpv5-d16 -mfix-cmse-cve-2021-35465" }  */
-+/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=*" } { "-mfloat-abi=softfp" } } */
-+/* { dg-skip-if "Skip these if testing single precision" {*-*-*} {"-mfpu=*-sp-*"} {""} } */
-+
-+#include "../../../cmse-7.x"
-+
-+/* Checks for saving and clearing prior to function call.  */
-+/* Shift on the same register as blxns.  */
-+/* { dg-final { scan-assembler "lsrs\t(r\[0-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
-+/* { dg-final { scan-assembler "lsls\t(r\[0-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
-+/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
-+/* { dg-final { scan-assembler "vlstm\tsp" } } */
-+/* Check the right registers are cleared and none appears twice.  */
-+/* { dg-final { scan-assembler "clrm\t\{(r0, )?(r1, )?(r2, )?(r3, )?(r4, )?(r5, )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" } } */
-+/* Check that the right number of registers is cleared and thus only one
-+   register is missing.  */
-+/* { dg-final { scan-assembler "clrm\t\{((r\[0-9\]|r10|fp|ip), ){12}APSR\}" } } */
-+/* Check that no cleared register is used for blxns.  */
-+/* { dg-final { scan-assembler-not "clrm\t\{\[^\}\]\+(r\[0-9\]|r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1" } } */
-+/* Check for v8.1-m variant of erratum work-around.  */
-+/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
-+/* { dg-final { scan-assembler "vlldm\tsp" } } */
-+/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
-+
-+/* Now we check that we use the correct intrinsic to call.  */
-+/* { dg-final { scan-assembler "blxns" } } */
-diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-8a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-8a.c
---- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-8a.c	1969-12-31 16:00:00.000000000 -0800
-+++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-8a.c	2021-11-15 02:30:37.210637445 -0800
-@@ -0,0 +1,29 @@
-+/* { dg-do compile } */
-+/* { dg-options "-mcmse -mfloat-abi=softfp -mfpu=fpv5-d16 -mfix-cmse-cve-2021-35465" }  */
-+/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=*" } { "-mfloat-abi=softfp" } } */
-+/* { dg-skip-if "Skip these if testing single precision" {*-*-*} {"-mfpu=*-sp-*"} {""} } */
-+
-+#include "../../../cmse-8.x"
-+
-+/* Checks for saving and clearing prior to function call.  */
-+/* Shift on the same register as blxns.  */
-+/* { dg-final { scan-assembler "lsrs\t(r\[2-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
-+/* { dg-final { scan-assembler "lsls\t(r\[2-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
-+/* { dg-final { scan-assembler-not "mov\tr0, r4" } } */
-+/* { dg-final { scan-assembler-not "mov\tr1, r4" } } */
-+/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
-+/* { dg-final { scan-assembler "vlstm\tsp" } } */
-+/* Check the right registers are cleared and none appears twice.  */
-+/* { dg-final { scan-assembler "clrm\t\{(r2, )?(r3, )?(r4, )?(r5, )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" } } */
-+/* Check that the right number of registers is cleared and thus only one
-+   register is missing.  */
-+/* { dg-final { scan-assembler "clrm\t\{((r\[2-9\]|r10|fp|ip), ){10}APSR\}" } } */
-+/* Check that no cleared register is used for blxns.  */
-+/* { dg-final { scan-assembler-not "clrm\t\{\[^\}\]\+(r\[2-9\]|r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1" } } */
-+/* Check for v8.1-m variant of erratum work-around.  */
-+/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
-+/* { dg-final { scan-assembler "vlldm\tsp" } } */
-+/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
-+
-+/* Now we check that we use the correct intrinsic to call.  */
-+/* { dg-final { scan-assembler "blxns" } } */
-diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-7a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-7a.c
---- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-7a.c	1969-12-31 16:00:00.000000000 -0800
-+++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-7a.c	2021-11-15 02:30:37.210637445 -0800
-@@ -0,0 +1,27 @@
-+/* { dg-do compile } */
-+/* { dg-options "-mcmse -mfloat-abi=softfp -mfpu=fpv5-sp-d16 -mfix-cmse-cve-2021-35465" }  */
-+/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=*" } { "-mfloat-abi=softfp" } } */
-+/* { dg-skip-if "Skip these if testing double precision" {*-*-*} {"-mfpu=fpv[4-5]-d16"} {""} } */
-+
-+#include "../../../cmse-7.x"
-+
-+/* Checks for saving and clearing prior to function call.  */
-+/* Shift on the same register as blxns.  */
-+/* { dg-final { scan-assembler "lsrs\t(r\[0-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
-+/* { dg-final { scan-assembler "lsls\t(r\[0-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
-+/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
-+/* { dg-final { scan-assembler "vlstm\tsp" } } */
-+/* Check the right registers are cleared and none appears twice.  */
-+/* { dg-final { scan-assembler "clrm\t\{(r0, )?(r1, )?(r2, )?(r3, )?(r4, )?(r5, )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" } } */
-+/* Check that the right number of registers is cleared and thus only one
-+   register is missing.  */
-+/* { dg-final { scan-assembler "clrm\t\{((r\[0-9\]|r10|fp|ip), ){12}APSR\}" } } */
-+/* Check that no cleared register is used for blxns.  */
-+/* { dg-final { scan-assembler-not "clrm\t\{\[^\}\]\+(r\[0-9\]|r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1" } } */
-+/* Check for v8.1-m variant of erratum work-around.  */
-+/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
-+/* { dg-final { scan-assembler "vlldm\tsp" } } */
-+/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
-+
-+/* Now we check that we use the correct intrinsic to call.  */
-+/* { dg-final { scan-assembler "blxns" } } */
-diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-8a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-8a.c
---- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-8a.c	1969-12-31 16:00:00.000000000 -0800
-+++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-8a.c	2021-11-15 02:30:37.210637445 -0800
-@@ -0,0 +1,29 @@
-+/* { dg-do compile } */
-+/* { dg-options "-mcmse -mfloat-abi=softfp -mfpu=fpv5-sp-d16 -mfix-cmse-cve-2021-35465" }  */
-+/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=*" } { "-mfloat-abi=softfp" } } */
-+/* { dg-skip-if "Skip these if testing double precision" {*-*-*} {"-mfpu=fpv[4-5]-d16"} {""} } */
-+
-+#include "../../../cmse-8.x"
-+
-+/* Checks for saving and clearing prior to function call.  */
-+/* Shift on the same register as blxns.  */
-+/* { dg-final { scan-assembler "lsrs\t(r\[2-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
-+/* { dg-final { scan-assembler "lsls\t(r\[2-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
-+/* { dg-final { scan-assembler-not "mov\tr0, r4" } } */
-+/* { dg-final { scan-assembler-not "mov\tr1, r4" } } */
-+/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
-+/* { dg-final { scan-assembler "vlstm\tsp" } } */
-+/* Check the right registers are cleared and none appears twice.  */
-+/* { dg-final { scan-assembler "clrm\t\{(r2, )?(r3, )?(r4, )?(r5, )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" } } */
-+/* Check that the right number of registers is cleared and thus only one
-+   register is missing.  */
-+/* { dg-final { scan-assembler "clrm\t\{((r\[2-9\]|r10|fp|ip), ){10}APSR\}" } } */
-+/* Check that no cleared register is used for blxns.  */
-+/* { dg-final { scan-assembler-not "clrm\t\{\[^\}\]\+(r\[2-9\]|r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1" } } */
-+/* Check for v8.1-m variant of erratum work-around.  */
-+/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
-+/* { dg-final { scan-assembler "vlldm\tsp" } } */
-+/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
-+
-+/* Now we check that we use the correct intrinsic to call.  */
-+/* { dg-final { scan-assembler "blxns" } } */
diff --git a/meta/recipes-devtools/gcc/gcc/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc/0004-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
similarity index 91%
rename from meta/recipes-devtools/gcc/gcc/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
rename to meta/recipes-devtools/gcc/gcc/0004-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
index 9844c2ae8a..55a58851dc 100644
--- a/meta/recipes-devtools/gcc/gcc/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
+++ b/meta/recipes-devtools/gcc/gcc/0004-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
@@ -1,4 +1,4 @@
-From e64342df647829d3e1c52fd480a5be7c1281ced0 Mon Sep 17 00:00:00 2001
+From 1766cf28fd7d917df510b1c262c47211b9ea70fa Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:17:25 +0400
 Subject: [PATCH] Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}
@@ -26,7 +26,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  4 files changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 8a5fb3fd99c..7da6f439fff 100644
+index 7bfd6ce653f..95962ae37b6 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
 @@ -552,7 +552,7 @@ TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
@@ -39,10 +39,10 @@ index 8a5fb3fd99c..7da6f439fff 100644
  TM_MULTILIB_CONFIG=@TM_MULTILIB_CONFIG@
  TM_MULTILIB_EXCEPTIONS_CONFIG=@TM_MULTILIB_EXCEPTIONS_CONFIG@
 diff --git a/gcc/configure b/gcc/configure
-index 3f0734bff11..c5d3bc4ee2d 100755
+index d7445339f9a..f5b99d1cf7d 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -13090,8 +13090,8 @@ for f in $tm_file; do
+@@ -13131,8 +13131,8 @@ for f in $tm_file; do
         tm_include_list="${tm_include_list} $f"
         ;;
      defaults.h )
@@ -54,10 +54,10 @@ index 3f0734bff11..c5d3bc4ee2d 100755
      * )
         tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 54e21764b3e..f83420326d6 100644
+index fe488f2232b..29005f6d18f 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -2263,8 +2263,8 @@ for f in $tm_file; do
+@@ -2294,8 +2294,8 @@ for f in $tm_file; do
         tm_include_list="${tm_include_list} $f"
         ;;
      defaults.h )
diff --git a/meta/recipes-devtools/gcc/gcc/0009-cpp-honor-sysroot.patch b/meta/recipes-devtools/gcc/gcc/0005-cpp-honor-sysroot.patch
similarity index 41%
rename from meta/recipes-devtools/gcc/gcc/0009-cpp-honor-sysroot.patch
rename to meta/recipes-devtools/gcc/gcc/0005-cpp-honor-sysroot.patch
index 37f26f0728..f2883fe074 100644
--- a/meta/recipes-devtools/gcc/gcc/0009-cpp-honor-sysroot.patch
+++ b/meta/recipes-devtools/gcc/gcc/0005-cpp-honor-sysroot.patch
@@ -1,29 +1,23 @@
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Subject: [PATCH 5/5] gcc: Pass sysroot options to cpp for preprocessed source
+From e6a820a19c4cd115d8af7c235c5f9700c7a24730 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:22:00 +0400
+Subject: [PATCH] cpp: honor sysroot.
 
-OpenEmbedded/Yocto Project extensively uses the --sysroot support within gcc.
-We discovered that when compiling preprocessed source (.i or .ii files), the
-compiler will try and access the builtin sysroot location rather than the
---sysroot option specified on the commandline. If access to that directory is
-permission denied (unreadable), gcc will error. This is particularly problematic
-when ccache is involved.
+Currently, if the gcc toolchain is relocated and installed from sstate, then you try and compile
+preprocessed source (.i or .ii files), the compiler will try and access the builtin sysroot location
+rather than the --sysroot option specified on the commandline. If access to that directory is
+permission denied (unreadable), gcc will error.
 
-This patch adds %I to the cpp-output spec macro so the default substitutions for
--iprefix, -isystem, -isysroot happen and the correct sysroot is used.
+This happens when ccache is in use due to the fact it uses preprocessed source files.
 
-2021-10-27 Richard Purdie <richard.purdie@linuxfoundation.org>
+The fix below adds %I to the cpp-output spec macro so the default substitutions for -iprefix,
+-isystem, -isysroot happen and the correct sysroot is used.
 
-gcc/cp/ChangeLog:
-
-    * lang-specs.h: Pass sysroot options to cpp for preprocessed source
-
-gcc/ChangeLog:
-
-    * gcc.c: Pass sysroot options to cpp for preprocessed source
+[YOCTO #2074]
 
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+RP 2012/04/13
 
-[YOCTO #2074]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582725.html]
 ---
@@ -31,11 +25,11 @@ Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2021-Octob
  gcc/gcc.c           | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
-Index: gcc-11.2.0/gcc/cp/lang-specs.h
-===================================================================
---- gcc-11.2.0.orig/gcc/cp/lang-specs.h
-+++ gcc-11.2.0/gcc/cp/lang-specs.h
-@@ -116,7 +116,7 @@ along with GCC; see the file COPYING3.
+diff --git a/gcc/cp/lang-specs.h b/gcc/cp/lang-specs.h
+index 8902ae1d2ed..e99e2fcd6ad 100644
+--- a/gcc/cp/lang-specs.h
++++ b/gcc/cp/lang-specs.h
+@@ -116,7 +116,7 @@ along with GCC; see the file COPYING3.  If not see
    {".ii", "@c++-cpp-output", 0, 0, 0},
    {"@c++-cpp-output",
        "%{!E:%{!M:%{!MM:"
@@ -44,11 +38,11 @@ Index: gcc-11.2.0/gcc/cp/lang-specs.h
        "  %{!fsyntax-only:"
        "    %{fmodule-only:%{!S:-o %g.s%V}}"
        "    %{!fmodule-only:%{!fmodule-header*:%(invoke_as)}}}"
-Index: gcc-11.2.0/gcc/gcc.c
-===================================================================
---- gcc-11.2.0.orig/gcc/gcc.c
-+++ gcc-11.2.0/gcc/gcc.c
-@@ -1470,7 +1470,7 @@ static const struct compiler default_com
+diff --git a/gcc/gcc.c b/gcc/gcc.c
+index b047fc31c2f..bdee2671532 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -1469,7 +1469,7 @@ static const struct compiler default_compilers[] =
  					   %W{o*:--output-pch=%*}}%V}}}}}}}", 0, 0, 0},
    {".i", "@cpp-output", 0, 0, 0},
    {"@cpp-output",
diff --git a/meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
similarity index 81%
rename from meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
rename to meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index 0884730786..ef19eef822 100644
--- a/meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -1,4 +1,4 @@
-From 8e9d6efecdc8c42f47e3a012dee764b13c3dad59 Mon Sep 17 00:00:00 2001
+From 84dd8ea4c982fc2c82af642293d29e9c1880de5b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:24:50 +0400
 Subject: [PATCH] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
@@ -12,25 +12,43 @@ SH, sparc, alpha for possible future support (if any)
 
 Removes the do_headerfix task in metadata
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 Upstream-Status: Inappropriate [OE configuration]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- gcc/config/alpha/linux-elf.h |  4 ++--
- gcc/config/arm/linux-eabi.h  |  4 ++--
- gcc/config/arm/linux-elf.h   |  2 +-
- gcc/config/i386/linux.h      |  2 +-
- gcc/config/i386/linux64.h    |  6 +++---
- gcc/config/linux.h           |  8 ++++----
- gcc/config/mips/linux.h      | 12 ++++++------
- gcc/config/riscv/linux.h     |  2 +-
- gcc/config/rs6000/linux64.h  | 15 +++++----------
- gcc/config/sh/linux.h        |  2 +-
- gcc/config/sparc/linux.h     |  2 +-
- gcc/config/sparc/linux64.h   |  4 ++--
- 12 files changed, 29 insertions(+), 34 deletions(-)
+ gcc/config/aarch64/aarch64-linux.h |  4 ++--
+ gcc/config/alpha/linux-elf.h       |  4 ++--
+ gcc/config/arm/linux-eabi.h        |  4 ++--
+ gcc/config/arm/linux-elf.h         |  2 +-
+ gcc/config/i386/linux.h            |  2 +-
+ gcc/config/i386/linux64.h          |  6 +++---
+ gcc/config/linux.h                 |  8 ++++----
+ gcc/config/mips/linux.h            | 12 ++++++------
+ gcc/config/riscv/linux.h           |  2 +-
+ gcc/config/rs6000/linux64.h        | 15 +++++----------
+ gcc/config/sh/linux.h              |  2 +-
+ gcc/config/sparc/linux.h           |  2 +-
+ gcc/config/sparc/linux64.h         |  4 ++--
+ 13 files changed, 31 insertions(+), 36 deletions(-)
 
-unchanged:
+diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
+index 7f2529a2a1d..4bcae7f3110 100644
+--- a/gcc/config/aarch64/aarch64-linux.h
++++ b/gcc/config/aarch64/aarch64-linux.h
+@@ -21,10 +21,10 @@
+ #ifndef GCC_AARCH64_LINUX_H
+ #define GCC_AARCH64_LINUX_H
+ 
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
++#define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
+ 
+ #undef MUSL_DYNAMIC_LINKER
+-#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
++#define MUSL_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
+ 
+ #undef  ASAN_CC1_SPEC
+ #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
+diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf.h
+index c1dae8ca2cf..3ce2b76c1a4 100644
 --- a/gcc/config/alpha/linux-elf.h
 +++ b/gcc/config/alpha/linux-elf.h
 @@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.  If not see
@@ -44,7 +62,8 @@ unchanged:
  #if DEFAULT_LIBC == LIBC_UCLIBC
  #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
  #elif DEFAULT_LIBC == LIBC_GLIBC
-unchanged:
+diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
+index 85d0136e76e..6bd95855827 100644
 --- a/gcc/config/arm/linux-eabi.h
 +++ b/gcc/config/arm/linux-eabi.h
 @@ -65,8 +65,8 @@
@@ -58,7 +77,8 @@ unchanged:
  #define GLIBC_DYNAMIC_LINKER_DEFAULT GLIBC_DYNAMIC_LINKER_SOFT_FLOAT
  
  #define GLIBC_DYNAMIC_LINKER \
-unchanged:
+diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
+index 0c1c4e70b6b..6bd643ade11 100644
 --- a/gcc/config/arm/linux-elf.h
 +++ b/gcc/config/arm/linux-elf.h
 @@ -60,7 +60,7 @@
@@ -70,7 +90,8 @@ unchanged:
  
  #define LINUX_TARGET_LINK_SPEC  "%{h*} \
     %{static:-Bstatic} \
-unchanged:
+diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h
+index 04b274f1654..7aafcf3ac2d 100644
 --- a/gcc/config/i386/linux.h
 +++ b/gcc/config/i386/linux.h
 @@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.  If not see
@@ -82,7 +103,8 @@ unchanged:
  
  #undef MUSL_DYNAMIC_LINKER
  #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
-unchanged:
+diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h
+index b3822ced528..92d303e80d6 100644
 --- a/gcc/config/i386/linux64.h
 +++ b/gcc/config/i386/linux64.h
 @@ -27,9 +27,9 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
@@ -98,7 +120,8 @@ unchanged:
  
  #undef MUSL_DYNAMIC_LINKER32
  #define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-i386.so.1"
-unchanged:
+diff --git a/gcc/config/linux.h b/gcc/config/linux.h
+index 4e1db60fced..87efc5f69fe 100644
 --- a/gcc/config/linux.h
 +++ b/gcc/config/linux.h
 @@ -94,10 +94,10 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
@@ -116,7 +139,8 @@ unchanged:
  #define BIONIC_DYNAMIC_LINKER "/system/bin/linker"
  #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
  #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
-unchanged:
+diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
+index 44a85e410d9..8d41b5574f6 100644
 --- a/gcc/config/mips/linux.h
 +++ b/gcc/config/mips/linux.h
 @@ -22,20 +22,20 @@ along with GCC; see the file COPYING3.  If not see
@@ -146,7 +170,8 @@ unchanged:
  
  #undef MUSL_DYNAMIC_LINKER32
  #define MUSL_DYNAMIC_LINKER32 \
-unchanged:
+diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h
+index fce5b896e6e..03aa55cb5ab 100644
 --- a/gcc/config/riscv/linux.h
 +++ b/gcc/config/riscv/linux.h
 @@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.  If not see
@@ -158,7 +183,8 @@ unchanged:
  
  #define MUSL_ABI_SUFFIX \
    "%{mabi=ilp32:-sf}" \
-unchanged:
+diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
+index e3f2cd254f6..a11e01faa3d 100644
 --- a/gcc/config/rs6000/linux64.h
 +++ b/gcc/config/rs6000/linux64.h
 @@ -336,24 +336,19 @@ extern int dot_symbols;
@@ -191,7 +217,8 @@ unchanged:
  
  #undef  DEFAULT_ASM_ENDIAN
  #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
-unchanged:
+diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h
+index 7558d2f7195..3aaa6c3a078 100644
 --- a/gcc/config/sh/linux.h
 +++ b/gcc/config/sh/linux.h
 @@ -64,7 +64,7 @@ along with GCC; see the file COPYING3.  If not see
@@ -203,7 +230,8 @@ unchanged:
  
  #undef SUBTARGET_LINK_EMUL_SUFFIX
  #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
-unchanged:
+diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
+index 2550d7ee8f0..a94f4cd8ba2 100644
 --- a/gcc/config/sparc/linux.h
 +++ b/gcc/config/sparc/linux.h
 @@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu (int argc, const char **argv);
@@ -215,7 +243,8 @@ unchanged:
  
  #undef  LINK_SPEC
  #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
-unchanged:
+diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
+index 95af8afa9b5..63127afb074 100644
 --- a/gcc/config/sparc/linux64.h
 +++ b/gcc/config/sparc/linux64.h
 @@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.  If not see
@@ -229,19 +258,3 @@ unchanged:
  
  #ifdef SPARC_BI_ARCH
  
-diff -u b/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
---- b/gcc/config/aarch64/aarch64-linux.h
-+++ b/gcc/config/aarch64/aarch64-linux.h
-@@ -21,10 +21,10 @@
- #ifndef GCC_AARCH64_LINUX_H
- #define GCC_AARCH64_LINUX_H
- 
--#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
-+#define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
- 
- #undef MUSL_DYNAMIC_LINKER
--#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
-+#define MUSL_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
- 
- #undef  ASAN_CC1_SPEC
- #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
diff --git a/meta/recipes-devtools/gcc/gcc/0007-gcc-Fix-argument-list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc/0007-gcc-Fix-argument-list-too-long-error.patch
new file mode 100644
index 0000000000..9f9f8cc856
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0007-gcc-Fix-argument-list-too-long-error.patch
@@ -0,0 +1,42 @@
+From 768e9075e88d811b00207d991123438bb996e4ea Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:26:37 +0400
+Subject: [PATCH] gcc: Fix argument list too long error.
+
+There would be an "Argument list too long" error when the
+build directory is longer than 200, this is caused by:
+
+headers=`echo $(PLUGIN_HEADERS) | tr ' ' '\012' | sort -u`
+
+The PLUGIN_HEADERS is too long before sort, so the "echo" can't handle
+it, use the $(sort list) of GNU make which can handle the too long list
+would fix the problem, the header would be short enough after sorted.
+The "tr ' ' '\012'" was used for translating the space to "\n", the
+$(sort list) doesn't need this.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+RP: gcc then added *.h and *.def additions to this list, breaking the original
+fix. Add the sort to the original gcc code, leaving the tr+sort to fix the original
+issue but include the new files too as reported by Zhuang <qiuguang.zqg@alibaba-inc.com>
+
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=66e157188bd2f789809e17e85f917534c9381599]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gcc/Makefile.in b/gcc/Makefile.in
+index 95962ae37b6..d1d4512bba3 100644
+--- a/gcc/Makefile.in
++++ b/gcc/Makefile.in
+@@ -3671,7 +3671,7 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
+ # We keep the directory structure for files in config, common/config or
+ # c-family and .def files. All other files are flattened to a single directory.
+ 	$(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
+-	headers=`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
++	headers=`echo $(sort $(PLUGIN_HEADERS)) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
+ 	srcdirstrip=`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`; \
+ 	for file in $$headers; do \
+ 	  if [ -f $$file ] ; then \
diff --git a/meta/recipes-devtools/gcc/gcc/0014-libtool.patch b/meta/recipes-devtools/gcc/gcc/0008-libtool.patch
similarity index 94%
rename from meta/recipes-devtools/gcc/gcc/0014-libtool.patch
rename to meta/recipes-devtools/gcc/gcc/0008-libtool.patch
index f2b8924ebf..358e1d7b3c 100644
--- a/meta/recipes-devtools/gcc/gcc/0014-libtool.patch
+++ b/meta/recipes-devtools/gcc/gcc/0008-libtool.patch
@@ -1,4 +1,4 @@
-From a5b984db9669cf38a7bd76c3fcdb41c086f740db Mon Sep 17 00:00:00 2001
+From b19700ef0103f9414416b9a779a64d6138c58b1f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:29:11 +0400
 Subject: [PATCH] libtool
diff --git a/meta/recipes-devtools/gcc/gcc/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
similarity index 95%
rename from meta/recipes-devtools/gcc/gcc/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
rename to meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
index 1ccf39ceba..ac139542f1 100644
--- a/meta/recipes-devtools/gcc/gcc/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
+++ b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
@@ -1,4 +1,4 @@
-From 0ae7090dec149cb2ff0c87eef87c043d4000ece1 Mon Sep 17 00:00:00 2001
+From 10d23d93697167396e223711bf6210e1642ee926 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:30:32 +0400
 Subject: [PATCH] gcc: armv4: pass fix-v4bx to linker to support EABI.
diff --git a/meta/recipes-devtools/gcc/gcc/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc/0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch
similarity index 89%
rename from meta/recipes-devtools/gcc/gcc/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
rename to meta/recipes-devtools/gcc/gcc/0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch
index bde7ec6609..4912fa9dce 100644
--- a/meta/recipes-devtools/gcc/gcc/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
+++ b/meta/recipes-devtools/gcc/gcc/0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch
@@ -1,4 +1,4 @@
-From 5ce8aa4615a3816d12c43752323154744517ae9f Mon Sep 17 00:00:00 2001
+From 5970fb3fadccd8c43f7f7030e6ff51e0295731ef Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:33:04 +0400
 Subject: [PATCH] Use the multilib config files from ${B} instead of using the
@@ -18,10 +18,10 @@ Upstream-Status: Inappropriate [configuration]
  2 files changed, 36 insertions(+), 8 deletions(-)
 
 diff --git a/gcc/configure b/gcc/configure
-index 5160917d73e..e663052cad2 100755
+index f5b99d1cf7d..ec3c24482df 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -13070,10 +13070,20 @@ done
+@@ -13111,10 +13111,20 @@ done
  tmake_file_=
  for f in ${tmake_file}
  do
@@ -46,7 +46,7 @@ index 5160917d73e..e663052cad2 100755
  done
  tmake_file="${tmake_file_}${omp_device_property_tmake_file}"
  
-@@ -13084,6 +13094,10 @@ tm_file_list="options.h"
+@@ -13125,6 +13135,10 @@ tm_file_list="options.h"
  tm_include_list="options.h insn-constants.h"
  for f in $tm_file; do
    case $f in
@@ -58,10 +58,10 @@ index 5160917d73e..e663052cad2 100755
         f=`echo $f | sed 's/^..//'`
         tm_file_list="${tm_file_list} $f"
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 50f78308e8a..2b84875b028 100644
+index 29005f6d18f..ea794cd1763 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -2243,10 +2243,20 @@ done
+@@ -2274,10 +2274,20 @@ done
  tmake_file_=
  for f in ${tmake_file}
  do
@@ -86,7 +86,7 @@ index 50f78308e8a..2b84875b028 100644
  done
  tmake_file="${tmake_file_}${omp_device_property_tmake_file}"
  
-@@ -2257,6 +2267,10 @@ tm_file_list="options.h"
+@@ -2288,6 +2298,10 @@ tm_file_list="options.h"
  tm_include_list="options.h insn-constants.h"
  for f in $tm_file; do
    case $f in
diff --git a/meta/recipes-devtools/gcc/gcc/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc/0011-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
similarity index 92%
rename from meta/recipes-devtools/gcc/gcc/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
rename to meta/recipes-devtools/gcc/gcc/0011-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
index 3e0a1b4136..e3e35942e6 100644
--- a/meta/recipes-devtools/gcc/gcc/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
+++ b/meta/recipes-devtools/gcc/gcc/0011-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
@@ -1,4 +1,4 @@
-From 75a1ce0265ca123f74f17a40ad8bd8f26d9c2ab3 Mon Sep 17 00:00:00 2001
+From 2af537b9ff0018945a27a7f89efad736a0f647d4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 09:39:38 +0000
 Subject: [PATCH] Avoid using libdir from .la which usually points to a host
diff --git a/meta/recipes-devtools/gcc/gcc/0019-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc/0012-Ensure-target-gcc-headers-can-be-included.patch
similarity index 96%
rename from meta/recipes-devtools/gcc/gcc/0019-Ensure-target-gcc-headers-can-be-included.patch
rename to meta/recipes-devtools/gcc/gcc/0012-Ensure-target-gcc-headers-can-be-included.patch
index 120d5a29b2..d33925eb40 100644
--- a/meta/recipes-devtools/gcc/gcc/0019-Ensure-target-gcc-headers-can-be-included.patch
+++ b/meta/recipes-devtools/gcc/gcc/0012-Ensure-target-gcc-headers-can-be-included.patch
@@ -1,4 +1,4 @@
-From 6f410ed8fb7eee11ba7a25634c2257666b98ef52 Mon Sep 17 00:00:00 2001
+From 9427c6cedf88e15f747c48cb4fcf9eda6f5c4555 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 10:25:11 +0000
 Subject: [PATCH] Ensure target gcc headers can be included
@@ -25,7 +25,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  4 files changed, 22 insertions(+)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 59c45c81393..9b17d120aa1 100644
+index d1d4512bba3..06eb0d27a28 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
 @@ -630,6 +630,7 @@ libexecdir = @libexecdir@
@@ -36,7 +36,7 @@ index 59c45c81393..9b17d120aa1 100644
  # Directory in which the compiler finds executables
  libexecsubdir = $(libexecdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_suffix)
  # Directory in which all plugin resources are installed
-@@ -3016,6 +3017,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localedir)\"
+@@ -3009,6 +3010,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localedir)\"
  
  PREPROCESSOR_DEFINES = \
    -DGCC_INCLUDE_DIR=\"$(libsubdir)/include\" \
diff --git a/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch
deleted file mode 100644
index ebee30bbd6..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Subject: [PATCH 2/5] gcc: Fix "argument list too long" from install-plugins
-
-When building in longer build paths (200+ characters), the
-"echo $(PLUGIN_HEADERS)" from the install-plugins target would cause an
-"argument list too long error" on some systems.
-
-Avoid this by calling make's sort function on the list which removes
-duplicates and stops the overflow from reaching the echo command.
-The original sort is left to handle the the .h and .def files.
-
-2021-10-26 Richard Purdie <richard.purdie@linuxfoundation.org>
-
-gcc/ChangeLog:
-
-    * Makefile.in: Fix "argument list too long" from install-plugins
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582722.html]
-Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=66e157188bd2f789809e17e85f917534c9381599]
----
- gcc/Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: gcc-11.2.0/gcc/Makefile.in
-===================================================================
---- gcc-11.2.0.orig/gcc/Makefile.in
-+++ gcc-11.2.0/gcc/Makefile.in
-@@ -3678,7 +3678,7 @@ install-plugin: installdirs lang.install
- # We keep the directory structure for files in config, common/config or
- # c-family and .def files. All other files are flattened to a single directory.
- 	$(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
--	headers=`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
-+	headers=`echo $(sort $(PLUGIN_HEADERS)) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
- 	srcdirstrip=`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`; \
- 	for file in $$headers; do \
- 	  if [ -f $$file ] ; then \
diff --git a/meta/recipes-devtools/gcc/gcc/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc/0013-Don-t-search-host-directory-during-relink-if-inst_pr.patch
similarity index 93%
rename from meta/recipes-devtools/gcc/gcc/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch
rename to meta/recipes-devtools/gcc/gcc/0013-Don-t-search-host-directory-during-relink-if-inst_pr.patch
index bb2a3671f0..5b5d229eff 100644
--- a/meta/recipes-devtools/gcc/gcc/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch
+++ b/meta/recipes-devtools/gcc/gcc/0013-Don-t-search-host-directory-during-relink-if-inst_pr.patch
@@ -1,4 +1,4 @@
-From cd09adb1e7f2a7e81a9f595a17c36f24911b90ac Mon Sep 17 00:00:00 2001
+From ab6e6af5deca6f4b35b089a6b197776df38780e6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 3 Mar 2015 08:21:19 +0000
 Subject: [PATCH] Don't search host directory during "relink" if $inst_prefix
diff --git a/meta/recipes-devtools/gcc/gcc/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc/0014-libcc1-fix-libcc1-s-install-path-and-rpath.patch
similarity index 90%
rename from meta/recipes-devtools/gcc/gcc/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch
rename to meta/recipes-devtools/gcc/gcc/0014-libcc1-fix-libcc1-s-install-path-and-rpath.patch
index fb4511cc1a..b82277cc4b 100644
--- a/meta/recipes-devtools/gcc/gcc/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch
+++ b/meta/recipes-devtools/gcc/gcc/0014-libcc1-fix-libcc1-s-install-path-and-rpath.patch
@@ -1,4 +1,4 @@
-From 2cfc5ee38b3f5ec1d7965aae0991bcd48b5dc2e6 Mon Sep 17 00:00:00 2001
+From fd862c8c112067d8613d921ae89c99056aca54a1 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Sun, 5 Jul 2015 20:25:18 -0700
 Subject: [PATCH] libcc1: fix libcc1's install path and rpath
@@ -20,10 +20,10 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  2 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/libcc1/Makefile.am b/libcc1/Makefile.am
-index f148fdd7aa2..0b6eb8f2855 100644
+index 3b75e7d9290..d3a4c4f9ddf 100644
 --- a/libcc1/Makefile.am
 +++ b/libcc1/Makefile.am
-@@ -40,8 +40,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
+@@ -41,8 +41,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
  	    $(Wc)$(libiberty_normal)))
  libiberty_dep = $(patsubst $(Wc)%,%,$(libiberty))
  
@@ -35,7 +35,7 @@ index f148fdd7aa2..0b6eb8f2855 100644
  if ENABLE_PLUGIN
  plugin_LTLIBRARIES = libcc1plugin.la libcp1plugin.la
 diff --git a/libcc1/Makefile.in b/libcc1/Makefile.in
-index 753d435c9cb..455627b0a3b 100644
+index 07fa9d94c83..a9f737d78f2 100644
 --- a/libcc1/Makefile.in
 +++ b/libcc1/Makefile.in
 @@ -398,8 +398,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
diff --git a/meta/recipes-devtools/gcc/gcc/0018-export-CPP.patch b/meta/recipes-devtools/gcc/gcc/0015-Makefile.in-Ensure-build-CPP-CPPFLAGS-is-used-for-bu.patch
similarity index 79%
rename from meta/recipes-devtools/gcc/gcc/0018-export-CPP.patch
rename to meta/recipes-devtools/gcc/gcc/0015-Makefile.in-Ensure-build-CPP-CPPFLAGS-is-used-for-bu.patch
index 86ab6574c7..45953f861d 100644
--- a/meta/recipes-devtools/gcc/gcc/0018-export-CPP.patch
+++ b/meta/recipes-devtools/gcc/gcc/0015-Makefile.in-Ensure-build-CPP-CPPFLAGS-is-used-for-bu.patch
@@ -1,5 +1,8 @@
+From 667b302f637be0a4b6ef714b5eb0026c54425386 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Subject: [PATCH 1/5] Makefile.in: Ensure build CPP/CPPFLAGS is used for build targets
+Date: Sun, 31 Oct 2021 17:40:12 -0700
+Subject: [PATCH] Makefile.in: Ensure build CPP/CPPFLAGS is used for build
+ targets
 
 During cross compiling, CPP is being set to the target compiler even for
 build targets. As an example, when building a cross compiler targetting
@@ -42,6 +45,8 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582727.html]
 Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=84401ce5fb4ecab55decb472b168100e7593e01f]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  Makefile.in      | 6 ++++++
  Makefile.tpl     | 6 ++++++
@@ -51,11 +56,11 @@ Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=844
  gcc/configure.ac | 2 +-
  6 files changed, 22 insertions(+), 2 deletions(-)
 
-Index: gcc-11.2.0/Makefile.in
-===================================================================
---- gcc-11.2.0.orig/Makefile.in
-+++ gcc-11.2.0/Makefile.in
-@@ -151,6 +151,8 @@ BUILD_EXPORTS = \
+diff --git a/Makefile.in b/Makefile.in
+index 20cbbe2906d..33476d53327 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -154,6 +154,8 @@ BUILD_EXPORTS = \
  	CC="$(CC_FOR_BUILD)"; export CC; \
  	CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
  	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
@@ -64,7 +69,7 @@ Index: gcc-11.2.0/Makefile.in
  	CXX="$(CXX_FOR_BUILD)"; export CXX; \
  	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
  	GFORTRAN="$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
-@@ -198,6 +200,8 @@ HOST_EXPORTS = \
+@@ -202,6 +204,8 @@ HOST_EXPORTS = \
  	AR="$(AR)"; export AR; \
  	AS="$(AS)"; export AS; \
  	CC_FOR_BUILD="$(CC_FOR_BUILD)"; export CC_FOR_BUILD; \
@@ -72,8 +77,8 @@ Index: gcc-11.2.0/Makefile.in
 +	CPPFLAGS_FOR_BUILD="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS_FOR_BUILD; \
  	CXX_FOR_BUILD="$(CXX_FOR_BUILD)"; export CXX_FOR_BUILD; \
  	DLLTOOL="$(DLLTOOL)"; export DLLTOOL; \
- 	LD="$(LD)"; export LD; \
-@@ -353,6 +357,8 @@ AR_FOR_BUILD = @AR_FOR_BUILD@
+ 	DSYMUTIL="$(DSYMUTIL)"; export DSYMUTIL; \
+@@ -360,6 +364,8 @@ AR_FOR_BUILD = @AR_FOR_BUILD@
  AS_FOR_BUILD = @AS_FOR_BUILD@
  CC_FOR_BUILD = @CC_FOR_BUILD@
  CFLAGS_FOR_BUILD = @CFLAGS_FOR_BUILD@
@@ -82,11 +87,11 @@ Index: gcc-11.2.0/Makefile.in
  CXXFLAGS_FOR_BUILD = @CXXFLAGS_FOR_BUILD@
  CXX_FOR_BUILD = @CXX_FOR_BUILD@
  DLLTOOL_FOR_BUILD = @DLLTOOL_FOR_BUILD@
-Index: gcc-11.2.0/Makefile.tpl
-===================================================================
---- gcc-11.2.0.orig/Makefile.tpl
-+++ gcc-11.2.0/Makefile.tpl
-@@ -154,6 +154,8 @@ BUILD_EXPORTS = \
+diff --git a/Makefile.tpl b/Makefile.tpl
+index 9adf4f94728..e39d85d1109 100644
+--- a/Makefile.tpl
++++ b/Makefile.tpl
+@@ -157,6 +157,8 @@ BUILD_EXPORTS = \
  	CC="$(CC_FOR_BUILD)"; export CC; \
  	CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
  	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
@@ -95,7 +100,7 @@ Index: gcc-11.2.0/Makefile.tpl
  	CXX="$(CXX_FOR_BUILD)"; export CXX; \
  	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
  	GFORTRAN="$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
-@@ -201,6 +203,8 @@ HOST_EXPORTS = \
+@@ -205,6 +207,8 @@ HOST_EXPORTS = \
  	AR="$(AR)"; export AR; \
  	AS="$(AS)"; export AS; \
  	CC_FOR_BUILD="$(CC_FOR_BUILD)"; export CC_FOR_BUILD; \
@@ -103,8 +108,8 @@ Index: gcc-11.2.0/Makefile.tpl
 +	CPPFLAGS_FOR_BUILD="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS_FOR_BUILD; \
  	CXX_FOR_BUILD="$(CXX_FOR_BUILD)"; export CXX_FOR_BUILD; \
  	DLLTOOL="$(DLLTOOL)"; export DLLTOOL; \
- 	LD="$(LD)"; export LD; \
-@@ -356,6 +360,8 @@ AR_FOR_BUILD = @AR_FOR_BUILD@
+ 	DSYMUTIL="$(DSYMUTIL)"; export DSYMUTIL; \
+@@ -363,6 +367,8 @@ AR_FOR_BUILD = @AR_FOR_BUILD@
  AS_FOR_BUILD = @AS_FOR_BUILD@
  CC_FOR_BUILD = @CC_FOR_BUILD@
  CFLAGS_FOR_BUILD = @CFLAGS_FOR_BUILD@
@@ -113,11 +118,11 @@ Index: gcc-11.2.0/Makefile.tpl
  CXXFLAGS_FOR_BUILD = @CXXFLAGS_FOR_BUILD@
  CXX_FOR_BUILD = @CXX_FOR_BUILD@
  DLLTOOL_FOR_BUILD = @DLLTOOL_FOR_BUILD@
-Index: gcc-11.2.0/configure
-===================================================================
---- gcc-11.2.0.orig/configure
-+++ gcc-11.2.0/configure
-@@ -652,6 +652,8 @@ GFORTRAN_FOR_BUILD
+diff --git a/configure b/configure
+index 45744e6e471..ff0de8a68b4 100755
+--- a/configure
++++ b/configure
+@@ -655,6 +655,8 @@ DSYMUTIL_FOR_BUILD
  DLLTOOL_FOR_BUILD
  CXX_FOR_BUILD
  CXXFLAGS_FOR_BUILD
@@ -126,15 +131,15 @@ Index: gcc-11.2.0/configure
  CFLAGS_FOR_BUILD
  CC_FOR_BUILD
  AS_FOR_BUILD
-@@ -4092,6 +4094,7 @@ if test "${build}" != "${host}" ; then
+@@ -4100,6 +4102,7 @@ if test "${build}" != "${host}" ; then
    AR_FOR_BUILD=${AR_FOR_BUILD-ar}
    AS_FOR_BUILD=${AS_FOR_BUILD-as}
    CC_FOR_BUILD=${CC_FOR_BUILD-gcc}
 +  CPP_FOR_BUILD="${CPP_FOR_BUILD-\$(CPP)}"
    CXX_FOR_BUILD=${CXX_FOR_BUILD-g++}
+   DSYMUTIL_FOR_BUILD=${DSYMUTIL_FOR_BUILD-dsymutil}
    GFORTRAN_FOR_BUILD=${GFORTRAN_FOR_BUILD-gfortran}
-   GOC_FOR_BUILD=${GOC_FOR_BUILD-gccgo}
-@@ -9809,6 +9812,7 @@ esac
+@@ -9831,6 +9834,7 @@ esac
  # our build compiler if desired.
  if test x"${build}" = x"${host}" ; then
    CFLAGS_FOR_BUILD=${CFLAGS_FOR_BUILD-${CFLAGS}}
@@ -142,19 +147,19 @@ Index: gcc-11.2.0/configure
    CXXFLAGS_FOR_BUILD=${CXXFLAGS_FOR_BUILD-${CXXFLAGS}}
    LDFLAGS_FOR_BUILD=${LDFLAGS_FOR_BUILD-${LDFLAGS}}
  fi
-Index: gcc-11.2.0/configure.ac
-===================================================================
---- gcc-11.2.0.orig/configure.ac
-+++ gcc-11.2.0/configure.ac
+diff --git a/configure.ac b/configure.ac
+index bf66b51373c..09fa3896dc7 100644
+--- a/configure.ac
++++ b/configure.ac
 @@ -1347,6 +1347,7 @@ if test "${build}" != "${host}" ; then
    AR_FOR_BUILD=${AR_FOR_BUILD-ar}
    AS_FOR_BUILD=${AS_FOR_BUILD-as}
    CC_FOR_BUILD=${CC_FOR_BUILD-gcc}
 +  CPP_FOR_BUILD="${CPP_FOR_BUILD-\$(CPP)}"
    CXX_FOR_BUILD=${CXX_FOR_BUILD-g++}
+   DSYMUTIL_FOR_BUILD=${DSYMUTIL_FOR_BUILD-dsymutil}
    GFORTRAN_FOR_BUILD=${GFORTRAN_FOR_BUILD-gfortran}
-   GOC_FOR_BUILD=${GOC_FOR_BUILD-gccgo}
-@@ -3321,6 +3322,7 @@ esac
+@@ -3336,6 +3337,7 @@ esac
  # our build compiler if desired.
  if test x"${build}" = x"${host}" ; then
    CFLAGS_FOR_BUILD=${CFLAGS_FOR_BUILD-${CFLAGS}}
@@ -162,7 +167,7 @@ Index: gcc-11.2.0/configure.ac
    CXXFLAGS_FOR_BUILD=${CXXFLAGS_FOR_BUILD-${CXXFLAGS}}
    LDFLAGS_FOR_BUILD=${LDFLAGS_FOR_BUILD-${LDFLAGS}}
  fi
-@@ -3387,6 +3389,8 @@ AC_SUBST(AR_FOR_BUILD)
+@@ -3402,6 +3404,8 @@ AC_SUBST(AR_FOR_BUILD)
  AC_SUBST(AS_FOR_BUILD)
  AC_SUBST(CC_FOR_BUILD)
  AC_SUBST(CFLAGS_FOR_BUILD)
@@ -171,11 +176,11 @@ Index: gcc-11.2.0/configure.ac
  AC_SUBST(CXXFLAGS_FOR_BUILD)
  AC_SUBST(CXX_FOR_BUILD)
  AC_SUBST(DLLTOOL_FOR_BUILD)
-Index: gcc-11.2.0/gcc/configure
-===================================================================
---- gcc-11.2.0.orig/gcc/configure
-+++ gcc-11.2.0/gcc/configure
-@@ -12699,7 +12699,7 @@ else
+diff --git a/gcc/configure b/gcc/configure
+index ec3c24482df..31a460dc9d0 100755
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -12740,7 +12740,7 @@ else
  	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
  	CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
  	LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
@@ -184,11 +189,11 @@ Index: gcc-11.2.0/gcc/configure
  	${realsrcdir}/configure \
  		--enable-languages=${enable_languages-all} \
  		${enable_obsolete+--enable-obsolete="$enable_obsolete"} \
-Index: gcc-11.2.0/gcc/configure.ac
-===================================================================
---- gcc-11.2.0.orig/gcc/configure.ac
-+++ gcc-11.2.0/gcc/configure.ac
-@@ -2023,7 +2023,7 @@ else
+diff --git a/gcc/configure.ac b/gcc/configure.ac
+index ea794cd1763..b965eb036bc 100644
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -2054,7 +2054,7 @@ else
  	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
  	CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
  	LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
diff --git a/meta/recipes-devtools/gcc/gcc/0006-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch b/meta/recipes-devtools/gcc/gcc/0016-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch
similarity index 68%
rename from meta/recipes-devtools/gcc/gcc/0006-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch
rename to meta/recipes-devtools/gcc/gcc/0016-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch
index 98a1bb2a66..7f807a991c 100644
--- a/meta/recipes-devtools/gcc/gcc/0006-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch
+++ b/meta/recipes-devtools/gcc/gcc/0016-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch
@@ -1,8 +1,8 @@
-From e700190743fa29ddaebd6ee075298a24b1688773 Mon Sep 17 00:00:00 2001
+From 2c2a92573598ddbc33c023fe5d499191491fb523 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 28 Oct 2021 11:33:40 +0100
-Subject: [PATCH 6/6] If CXXFLAGS contains something unsupported by the build
- CXX, we see build failures (e.g. using -fmacro-prefix-map for the target).
+Subject: [PATCH] If CXXFLAGS contains something unsupported by the build CXX,
+ we see build failures (e.g. using -fmacro-prefix-map for the target).
 
 Pass CXXFLAGS_FOR_BUILD in a couple of places to avoid these errors.
 
@@ -13,19 +13,20 @@ ChangeLog:
     * Makefile.in: Regenerate.
     * Makefile.tpl: Add missing CXXFLAGS_FOR_BUILD overrides
 
+Upstream-Status: Pending [should be submittable]
+
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  Makefile.in  | 2 ++
  Makefile.tpl | 2 ++
  2 files changed, 4 insertions(+)
 
-Upstream-Status: Pending [should be submittable]
-
-Index: gcc-11.2.0/Makefile.in
-===================================================================
---- gcc-11.2.0.orig/Makefile.in
-+++ gcc-11.2.0/Makefile.in
-@@ -172,6 +172,7 @@ BUILD_EXPORTS = \
+diff --git a/Makefile.in b/Makefile.in
+index 33476d53327..b949dffee0e 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -176,6 +176,7 @@ BUILD_EXPORTS = \
  # built for the build system to override those in BASE_FLAGS_TO_PASS.
  EXTRA_BUILD_FLAGS = \
  	CFLAGS="$(CFLAGS_FOR_BUILD)" \
@@ -33,19 +34,19 @@ Index: gcc-11.2.0/Makefile.in
  	LDFLAGS="$(LDFLAGS_FOR_BUILD)"
  
  # This is the list of directories to built for the host system.
-@@ -203,6 +204,7 @@ HOST_EXPORTS = \
+@@ -207,6 +208,7 @@ HOST_EXPORTS = \
  	CPP_FOR_BUILD="$(CPP_FOR_BUILD)"; export CPP_FOR_BUILD; \
  	CPPFLAGS_FOR_BUILD="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS_FOR_BUILD; \
  	CXX_FOR_BUILD="$(CXX_FOR_BUILD)"; export CXX_FOR_BUILD; \
 +	CXXFLAGS_FOR_BUILD="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS_FOR_BUILD; \
  	DLLTOOL="$(DLLTOOL)"; export DLLTOOL; \
+ 	DSYMUTIL="$(DSYMUTIL)"; export DSYMUTIL; \
  	LD="$(LD)"; export LD; \
- 	LDFLAGS="$(STAGE1_LDFLAGS) $(LDFLAGS)"; export LDFLAGS; \
-Index: gcc-11.2.0/Makefile.tpl
-===================================================================
---- gcc-11.2.0.orig/Makefile.tpl
-+++ gcc-11.2.0/Makefile.tpl
-@@ -175,6 +175,7 @@ BUILD_EXPORTS = \
+diff --git a/Makefile.tpl b/Makefile.tpl
+index e39d85d1109..d8520cbb164 100644
+--- a/Makefile.tpl
++++ b/Makefile.tpl
+@@ -179,6 +179,7 @@ BUILD_EXPORTS = \
  # built for the build system to override those in BASE_FLAGS_TO_PASS.
  EXTRA_BUILD_FLAGS = \
  	CFLAGS="$(CFLAGS_FOR_BUILD)" \
@@ -53,11 +54,11 @@ Index: gcc-11.2.0/Makefile.tpl
  	LDFLAGS="$(LDFLAGS_FOR_BUILD)"
  
  # This is the list of directories to built for the host system.
-@@ -206,6 +207,7 @@ HOST_EXPORTS = \
+@@ -210,6 +211,7 @@ HOST_EXPORTS = \
  	CPP_FOR_BUILD="$(CPP_FOR_BUILD)"; export CPP_FOR_BUILD; \
  	CPPFLAGS_FOR_BUILD="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS_FOR_BUILD; \
  	CXX_FOR_BUILD="$(CXX_FOR_BUILD)"; export CXX_FOR_BUILD; \
 +	CXXFLAGS_FOR_BUILD="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS_FOR_BUILD; \
  	DLLTOOL="$(DLLTOOL)"; export DLLTOOL; \
+ 	DSYMUTIL="$(DSYMUTIL)"; export DSYMUTIL; \
  	LD="$(LD)"; export LD; \
- 	LDFLAGS="$(STAGE1_LDFLAGS) $(LDFLAGS)"; export LDFLAGS; \
diff --git a/meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc/0017-handle-sysroot-support-for-nativesdk-gcc.patch
similarity index 98%
rename from meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-nativesdk-gcc.patch
rename to meta/recipes-devtools/gcc/gcc/0017-handle-sysroot-support-for-nativesdk-gcc.patch
index b1054fa749..5d86e4c12d 100644
--- a/meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-nativesdk-gcc.patch
+++ b/meta/recipes-devtools/gcc/gcc/0017-handle-sysroot-support-for-nativesdk-gcc.patch
@@ -1,4 +1,4 @@
-From 354682ad8f71f62643dcd83f64b51b5979615a0c Mon Sep 17 00:00:00 2001
+From 68802ca536b01ab21cfa58e11ef332e30d9a3c5e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:39:54 +0000
 Subject: [PATCH] handle sysroot support for nativesdk-gcc
@@ -46,10 +46,10 @@ Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
  8 files changed, 94 insertions(+), 72 deletions(-)
 
 diff --git a/gcc/c-family/c-opts.c b/gcc/c-family/c-opts.c
-index 89e05a4c551..5577383665d 100644
+index 6f001e0bb6c..55ab07c278f 100644
 --- a/gcc/c-family/c-opts.c
 +++ b/gcc/c-family/c-opts.c
-@@ -1436,8 +1436,8 @@ add_prefixed_path (const char *suffix, incpath_kind chain)
+@@ -1438,8 +1438,8 @@ add_prefixed_path (const char *suffix, incpath_kind chain)
    size_t prefix_len, suffix_len;
  
    suffix_len = strlen (suffix);
@@ -378,7 +378,7 @@ index fd3c655db1c..20669ac427d 100644
     subdirectory of the actual installation.  */
  extern const char *gcc_exec_prefix;
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 8737bae5353..aa6fbe43965 100644
+index bdee2671532..36e8af38630 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
 @@ -252,6 +252,8 @@ FILE *report_times_to_file = NULL;
@@ -398,7 +398,7 @@ index 8737bae5353..aa6fbe43965 100644
   %S     process STARTFILE_SPEC as a spec.  A capital S is actually used here.
   %E     process ENDFILE_SPEC as a spec.  A capital E is actually used here.
   %C     process CPP_SPEC as a spec.
-@@ -1621,10 +1624,10 @@ static const char *gcc_libexec_prefix;
+@@ -1620,10 +1623,10 @@ static const char *gcc_libexec_prefix;
     gcc_exec_prefix is set because, in that case, we know where the
     compiler has been installed, and use paths relative to that
     location instead.  */
@@ -413,7 +413,7 @@ index 8737bae5353..aa6fbe43965 100644
  
  /* For native compilers, these are well-known paths containing
     components that may be provided by the system.  For cross
-@@ -1632,9 +1635,9 @@ static const char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
+@@ -1631,9 +1634,9 @@ static const char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
  static const char *md_exec_prefix = MD_EXEC_PREFIX;
  static const char *md_startfile_prefix = MD_STARTFILE_PREFIX;
  static const char *md_startfile_prefix_1 = MD_STARTFILE_PREFIX_1;
@@ -425,7 +425,7 @@ index 8737bae5353..aa6fbe43965 100644
    = STANDARD_STARTFILE_PREFIX_2;
  
  /* A relative path to be used in finding the location of tools
-@@ -6564,6 +6567,11 @@ do_spec_1 (const char *spec, int inswitch, const char *soft_matched_part)
+@@ -6570,6 +6573,11 @@ do_spec_1 (const char *spec, int inswitch, const char *soft_matched_part)
  	      }
  	    break;
  
diff --git a/meta/recipes-devtools/gcc/gcc/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc/0018-Search-target-sysroot-gcc-version-specific-dirs-with.patch
similarity index 92%
rename from meta/recipes-devtools/gcc/gcc/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
rename to meta/recipes-devtools/gcc/gcc/0018-Search-target-sysroot-gcc-version-specific-dirs-with.patch
index ff622b1056..0f43e985cf 100644
--- a/meta/recipes-devtools/gcc/gcc/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch
+++ b/meta/recipes-devtools/gcc/gcc/0018-Search-target-sysroot-gcc-version-specific-dirs-with.patch
@@ -1,4 +1,4 @@
-From c55e24459370ad96577496ecd87475e3a9de7dad Mon Sep 17 00:00:00 2001
+From 14291076874b133e7fb67ef1714b768a2c48ea44 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:41:45 +0000
 Subject: [PATCH] Search target sysroot gcc version specific dirs with
@@ -51,10 +51,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 28 insertions(+), 1 deletion(-)
 
 diff --git a/gcc/gcc.c b/gcc/gcc.c
-index aa6fbe43965..f8a71a13826 100644
+index 36e8af38630..d1faa788d60 100644
 --- a/gcc/gcc.c
 +++ b/gcc/gcc.c
-@@ -2811,7 +2811,7 @@ for_each_path (const struct path_prefix *paths,
+@@ -2810,7 +2810,7 @@ for_each_path (const struct path_prefix *paths,
        if (path == NULL)
  	{
  	  len = paths->max_len + extra_space + 1;
@@ -63,7 +63,7 @@ index aa6fbe43965..f8a71a13826 100644
  	  path = XNEWVEC (char, len);
  	}
  
-@@ -2823,6 +2823,33 @@ for_each_path (const struct path_prefix *paths,
+@@ -2822,6 +2822,33 @@ for_each_path (const struct path_prefix *paths,
  	  /* Look first in MACHINE/VERSION subdirectory.  */
  	  if (!skip_multi_dir)
  	    {
diff --git a/meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta/recipes-devtools/gcc/gcc/0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch
similarity index 40%
rename from meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
rename to meta/recipes-devtools/gcc/gcc/0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch
index 97c271373b..76ebfd7f77 100644
--- a/meta/recipes-devtools/gcc/gcc/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch
+++ b/meta/recipes-devtools/gcc/gcc/0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch
@@ -1,26 +1,20 @@
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Subject: [PATCH 4/5] gcc/nios2: Define the musl linker
+From 9ec4db8e910d9a51ae43f6b20d4bf1dac2d8cca8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 2 Feb 2016 10:26:10 -0800
+Subject: [PATCH] nios2: Define MUSL_DYNAMIC_LINKER
 
-Add a definition of the musl linker used on the nios2 platform.
-
-2021-10-26 Richard Purdie <richard.purdie@linuxfoundation.org>
-
-gcc/ChangeLog:
-
-    * config/nios2/linux.h (MUSL_DYNAMIC_LINKER): Add musl linker
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582723.html]
 Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=e5ddbbf992b909d8e38851bd3179d29389e6ac97]
+
+Signed-off-by: Marek Vasut <marex@denx.de>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  gcc/config/nios2/linux.h | 1 +
  1 file changed, 1 insertion(+)
 
-Index: gcc-11.2.0/gcc/config/nios2/linux.h
-===================================================================
---- gcc-11.2.0.orig/gcc/config/nios2/linux.h
-+++ gcc-11.2.0/gcc/config/nios2/linux.h
+diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h
+index 08edf1521f6..15696d86241 100644
+--- a/gcc/config/nios2/linux.h
++++ b/gcc/config/nios2/linux.h
 @@ -30,6 +30,7 @@
  #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
  
diff --git a/meta/recipes-devtools/gcc/gcc/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc/0020-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
similarity index 84%
rename from meta/recipes-devtools/gcc/gcc/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
rename to meta/recipes-devtools/gcc/gcc/0020-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
index 9c616d24d0..b82fa44537 100644
--- a/meta/recipes-devtools/gcc/gcc/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
+++ b/meta/recipes-devtools/gcc/gcc/0020-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
@@ -1,4 +1,4 @@
-From 745a2ac7825c73102b888226c54397d21512f86b Mon Sep 17 00:00:00 2001
+From af72a47a677ce98c08cb73444bdd741ca8e28422 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 27 Jun 2017 18:10:54 -0700
 Subject: [PATCH] Add ssp_nonshared to link commandline for musl targets
@@ -22,9 +22,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  gcc/config/rs6000/linux64.h | 10 ++++++++++
  3 files changed, 27 insertions(+)
 
+diff --git a/gcc/config/linux.h b/gcc/config/linux.h
+index ba02c013e30..8fcaa0c9faf 100644
 --- a/gcc/config/linux.h
 +++ b/gcc/config/linux.h
-@@ -203,6 +203,13 @@ see the files COPYING3 and COPYING.RUNTI
+@@ -203,6 +203,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
      { GCC_INCLUDE_DIRVAR, "GCC", 0, 1, 0, 0 },		\
      { 0, 0, 0, 0, 0, 0 }				\
    }
@@ -38,6 +40,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #endif
  
  #if (DEFAULT_LIBC == LIBC_UCLIBC) && defined (SINGLE_LIBC) /* uClinux */
+diff --git a/gcc/config/rs6000/linux.h b/gcc/config/rs6000/linux.h
+index 47c9d9ac0b6..d065f88b377 100644
 --- a/gcc/config/rs6000/linux.h
 +++ b/gcc/config/rs6000/linux.h
 @@ -94,6 +94,16 @@
@@ -57,6 +61,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #undef LINK_OS_LINUX_SPEC
  #define LINK_OS_LINUX_SPEC LINK_OS_LINUX_EMUL " %{!shared: %{!static: \
    %{!static-pie: \
+diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
+index a11e01faa3d..ce464f3626b 100644
 --- a/gcc/config/rs6000/linux64.h
 +++ b/gcc/config/rs6000/linux64.h
 @@ -369,6 +369,16 @@ extern int dot_symbols;
diff --git a/meta/recipes-devtools/gcc/gcc/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gcc/0021-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
similarity index 93%
rename from meta/recipes-devtools/gcc/gcc/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
rename to meta/recipes-devtools/gcc/gcc/0021-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
index b74aeb8bb6..9b7c5c5642 100644
--- a/meta/recipes-devtools/gcc/gcc/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
+++ b/meta/recipes-devtools/gcc/gcc/0021-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
@@ -1,4 +1,4 @@
-From 695adb4dffb23c6f5cbc757e05cf4187a2bd6528 Mon Sep 17 00:00:00 2001
+From 79a568dec47baa264eb6290fed3df3244450a92e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 4 May 2016 21:11:34 -0700
 Subject: [PATCH] Link libgcc using LDFLAGS, not just SHLIB_LDFLAGS
diff --git a/meta/recipes-devtools/gcc/gcc/0030-sync-gcc-stddef.h-with-musl.patch b/meta/recipes-devtools/gcc/gcc/0022-sync-gcc-stddef.h-with-musl.patch
similarity index 97%
rename from meta/recipes-devtools/gcc/gcc/0030-sync-gcc-stddef.h-with-musl.patch
rename to meta/recipes-devtools/gcc/gcc/0022-sync-gcc-stddef.h-with-musl.patch
index fd7d604e98..86fb22ffd3 100644
--- a/meta/recipes-devtools/gcc/gcc/0030-sync-gcc-stddef.h-with-musl.patch
+++ b/meta/recipes-devtools/gcc/gcc/0022-sync-gcc-stddef.h-with-musl.patch
@@ -1,4 +1,4 @@
-From a9173429ae256c4b4a3ab4d758a6adf42f8c4239 Mon Sep 17 00:00:00 2001
+From 07a06aa8e8285c1bb06d0bebeaa9ad04eb76f2e2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Feb 2017 12:56:00 -0800
 Subject: [PATCH] sync gcc stddef.h with musl
diff --git a/meta/recipes-devtools/gcc/gcc/0033-Re-introduce-spe-commandline-options.patch b/meta/recipes-devtools/gcc/gcc/0023-Re-introduce-spe-commandline-options.patch
similarity index 90%
rename from meta/recipes-devtools/gcc/gcc/0033-Re-introduce-spe-commandline-options.patch
rename to meta/recipes-devtools/gcc/gcc/0023-Re-introduce-spe-commandline-options.patch
index 129f555a48..23cf02a6e4 100644
--- a/meta/recipes-devtools/gcc/gcc/0033-Re-introduce-spe-commandline-options.patch
+++ b/meta/recipes-devtools/gcc/gcc/0023-Re-introduce-spe-commandline-options.patch
@@ -1,4 +1,4 @@
-From 0b900d6410b7c1938e86eceb87b032fd538566a9 Mon Sep 17 00:00:00 2001
+From ca73043041c3c7aa86af9a3d4f316abc87eb3254 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 6 Jun 2018 12:10:22 -0700
 Subject: [PATCH] Re-introduce spe commandline options
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 13 insertions(+)
 
 diff --git a/gcc/config/rs6000/rs6000.opt b/gcc/config/rs6000/rs6000.opt
-index 0dbdf753673..b273eb65c35 100644
+index 6b0a3e27529..1bd2e356ac9 100644
 --- a/gcc/config/rs6000/rs6000.opt
 +++ b/gcc/config/rs6000/rs6000.opt
 @@ -352,6 +352,19 @@ mdebug=
diff --git a/meta/recipes-devtools/gcc/gcc/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc/0024-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
similarity index 94%
rename from meta/recipes-devtools/gcc/gcc/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
rename to meta/recipes-devtools/gcc/gcc/0024-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
index 3f666dc7bd..f915f284ea 100644
--- a/meta/recipes-devtools/gcc/gcc/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
+++ b/meta/recipes-devtools/gcc/gcc/0024-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
@@ -1,4 +1,4 @@
-From ea9154338cb3acbd75945fddde4202e73c20dd1a Mon Sep 17 00:00:00 2001
+From b3957bc1fd52ec427a1b71b10055905cab4bbc7c Mon Sep 17 00:00:00 2001
 From: Szabolcs Nagy <nsz@port70.net>
 Date: Sat, 24 Oct 2015 20:09:53 +0000
 Subject: [PATCH] libgcc_s: Use alias for __cpu_indicator_init instead of
@@ -39,10 +39,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/gcc/config/i386/i386-expand.c b/gcc/config/i386/i386-expand.c
-index ac69eed4d32..ffaa44a16fc 100644
+index 31eae75d277..ec7e858ec83 100644
 --- a/gcc/config/i386/i386-expand.c
 +++ b/gcc/config/i386/i386-expand.c
-@@ -11038,10 +11038,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx subtarget,
+@@ -11066,10 +11066,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx subtarget,
      {
      case IX86_BUILTIN_CPU_INIT:
        {
diff --git a/meta/recipes-devtools/gcc/gcc/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch b/meta/recipes-devtools/gcc/gcc/0025-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
similarity index 98%
rename from meta/recipes-devtools/gcc/gcc/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
rename to meta/recipes-devtools/gcc/gcc/0025-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
index 874cd7798d..f33193ebcf 100644
--- a/meta/recipes-devtools/gcc/gcc/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
+++ b/meta/recipes-devtools/gcc/gcc/0025-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
@@ -1,4 +1,4 @@
-From 520411cf364ee4b0b5a8f0857498aaabd790afb3 Mon Sep 17 00:00:00 2001
+From 5fd90d243ae14034a4699443110070dafc0d4d30 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 10 Mar 2020 08:26:53 -0700
 Subject: [PATCH] gentypes/genmodes: Do not use __LINE__ for maintaining
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 19 insertions(+), 19 deletions(-)
 
 diff --git a/gcc/gengtype.c b/gcc/gengtype.c
-index 5f50242e857..cbaca9b8cd0 100644
+index 98d4626f87e..f602da8b501 100644
 --- a/gcc/gengtype.c
 +++ b/gcc/gengtype.c
 @@ -991,7 +991,7 @@ create_field_at (pair_p next, type_p type, const char *name, options_p opt,
diff --git a/meta/recipes-devtools/gcc/gcc/0036-mingw32-Enable-operation_not_supported.patch b/meta/recipes-devtools/gcc/gcc/0026-mingw32-Enable-operation_not_supported.patch
similarity index 93%
rename from meta/recipes-devtools/gcc/gcc/0036-mingw32-Enable-operation_not_supported.patch
rename to meta/recipes-devtools/gcc/gcc/0026-mingw32-Enable-operation_not_supported.patch
index 3a7618c820..b46bde1eda 100644
--- a/meta/recipes-devtools/gcc/gcc/0036-mingw32-Enable-operation_not_supported.patch
+++ b/meta/recipes-devtools/gcc/gcc/0026-mingw32-Enable-operation_not_supported.patch
@@ -1,4 +1,4 @@
-From 96d895c8d5dc895d24fe37aa2b4f201a2566b4cc Mon Sep 17 00:00:00 2001
+From 7bc34769f0b055e25286576e4ba6d211e8159834 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 12 May 2020 10:39:09 -0700
 Subject: [PATCH] mingw32: Enable operation_not_supported
diff --git a/meta/recipes-devtools/gcc/gcc/0037-libatomic-Do-not-enforce-march-on-aarch64.patch b/meta/recipes-devtools/gcc/gcc/0027-libatomic-Do-not-enforce-march-on-aarch64.patch
similarity index 85%
rename from meta/recipes-devtools/gcc/gcc/0037-libatomic-Do-not-enforce-march-on-aarch64.patch
rename to meta/recipes-devtools/gcc/gcc/0027-libatomic-Do-not-enforce-march-on-aarch64.patch
index 4c9a79cb64..85b1251482 100644
--- a/meta/recipes-devtools/gcc/gcc/0037-libatomic-Do-not-enforce-march-on-aarch64.patch
+++ b/meta/recipes-devtools/gcc/gcc/0027-libatomic-Do-not-enforce-march-on-aarch64.patch
@@ -1,4 +1,4 @@
-From 36d4fdbc99e69f9d70a29e2bada40cc3c1534557 Mon Sep 17 00:00:00 2001
+From df1c63bbd7a520e8c6d0d0692b4d8bff56952394 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 13 May 2020 15:10:38 -0700
 Subject: [PATCH] libatomic: Do not enforce march on aarch64
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 deletions(-)
 
 diff --git a/libatomic/Makefile.am b/libatomic/Makefile.am
-index 0f3cd6f7121..c8124c1d5aa 100644
+index ab8c2da24a1..f614a46b34d 100644
 --- a/libatomic/Makefile.am
 +++ b/libatomic/Makefile.am
 @@ -125,7 +125,6 @@ libatomic_la_LIBADD = $(foreach s,$(SIZES),$(addsuffix _$(s)_.lo,$(SIZEOBJS)))
@@ -29,14 +29,14 @@ index 0f3cd6f7121..c8124c1d5aa 100644
  endif
  if ARCH_ARM_LINUX
 diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
-index 0a51bd55f01..6d5b1581706 100644
+index 80d25653dc7..7377689ab34 100644
 --- a/libatomic/Makefile.in
 +++ b/libatomic/Makefile.in
-@@ -432,7 +432,6 @@ M_SRC = $(firstword $(filter %/$(M_FILE), $(all_c_files)))
+@@ -434,7 +434,6 @@ M_SRC = $(firstword $(filter %/$(M_FILE), $(all_c_files)))
  libatomic_la_LIBADD = $(foreach s,$(SIZES),$(addsuffix \
  	_$(s)_.lo,$(SIZEOBJS))) $(am__append_1) $(am__append_2) \
  	$(am__append_3) $(am__append_4)
 -@ARCH_AARCH64_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=armv8-a+lse
  @ARCH_ARM_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=armv7-a+fp -DHAVE_KERNEL64
  @ARCH_I386_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -march=i586
- @ARCH_X86_64_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -mcx16
+ @ARCH_X86_64_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS = -mcx16 -mcx16
diff --git a/meta/recipes-devtools/gcc/gcc/0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch b/meta/recipes-devtools/gcc/gcc/0028-debug-101473-apply-debug-prefix-maps-before-checksum.patch
similarity index 81%
rename from meta/recipes-devtools/gcc/gcc/0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch
rename to meta/recipes-devtools/gcc/gcc/0028-debug-101473-apply-debug-prefix-maps-before-checksum.patch
index c8dcd74b9d..de06793482 100644
--- a/meta/recipes-devtools/gcc/gcc/0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch
+++ b/meta/recipes-devtools/gcc/gcc/0028-debug-101473-apply-debug-prefix-maps-before-checksum.patch
@@ -1,7 +1,8 @@
-From 7cc2df084b7977653a9b59cbc34a9ad500ae619c Mon Sep 17 00:00:00 2001
+From 49008eeedc97014f44e12afe179d3785e4438372 Mon Sep 17 00:00:00 2001
 From: Richard Biener <rguenther@suse.de>
 Date: Tue, 20 Jul 2021 11:00:33 +0200
-Subject: [PATCH] debug/101473 - apply debug prefix maps before checksumming DIEs
+Subject: [PATCH] debug/101473 - apply debug prefix maps before checksumming
+ DIEs
 
 The following makes sure to apply the debug prefix maps to filenames
 before checksumming DIEs to create the global symbol for the CU DIE
@@ -36,10 +37,15 @@ The upstream patch was modified to compensate for the definition of
 this version of gcc.
 
 Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-diff -urpN a/gcc/dwarf2out.c b/gcc/dwarf2out.c
---- a/gcc/dwarf2out.c	2021-04-27 06:00:13.000000000 -0400
-+++ b/gcc/dwarf2out.c	2021-07-23 16:40:06.141886167 -0400
+ gcc/dwarf2out.c | 13 +++++++------
+ 1 file changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/gcc/dwarf2out.c b/gcc/dwarf2out.c
+index e5d3ce4966d..41ac3008507 100644
+--- a/gcc/dwarf2out.c
++++ b/gcc/dwarf2out.c
 @@ -1283,6 +1283,7 @@ dwarf2out_switch_text_section (void)
  
  /* Data about a single source file.  */
@@ -48,7 +54,7 @@ diff -urpN a/gcc/dwarf2out.c b/gcc/dwarf2out.c
    const char * filename;
    int emitted_number;
  };
-@@ -12334,7 +12335,7 @@ file_name_acquire (dwarf_file_data **slo
+@@ -12335,7 +12336,7 @@ file_name_acquire (dwarf_file_data **slot, file_name_acquire_data *fnad)
  
    fi = fnad->files + fnad->used_files++;
  
@@ -57,7 +63,7 @@ diff -urpN a/gcc/dwarf2out.c b/gcc/dwarf2out.c
  
    /* Skip all leading "./".  */
    while (f[0] == '.' && IS_DIR_SEPARATOR (f[1]))
-@@ -27231,13 +27232,13 @@ dwarf2out_ignore_block (const_tree block
+@@ -27259,13 +27260,13 @@ dwarf2out_ignore_block (const_tree block)
  bool
  dwarf_file_hasher::equal (dwarf_file_data *p1, const char *p2)
  {
@@ -73,7 +79,7 @@ diff -urpN a/gcc/dwarf2out.c b/gcc/dwarf2out.c
  }
  
  /* Lookup FILE_NAME (in the list of filenames that we know about here in
-@@ -27267,7 +27268,8 @@ lookup_filename (const char *file_name)
+@@ -27295,7 +27296,8 @@ lookup_filename (const char *file_name)
      return *slot;
  
    created = ggc_alloc<dwarf_file_data> ();
@@ -83,7 +89,7 @@ diff -urpN a/gcc/dwarf2out.c b/gcc/dwarf2out.c
    created->emitted_number = 0;
    *slot = created;
    return created;
-@@ -27293,8 +27295,7 @@ maybe_emit_file (struct dwarf_file_data
+@@ -27321,8 +27323,7 @@ maybe_emit_file (struct dwarf_file_data * fd)
        if (output_asm_line_debug_info ())
  	{
  	  fprintf (asm_out_file, "\t.file %u ", fd->emitted_number);
diff --git a/meta/recipes-devtools/gcc/gcc/0001-Fix-install-path-of-linux64.h.patch b/meta/recipes-devtools/gcc/gcc/0029-Fix-install-path-of-linux64.h.patch
similarity index 81%
rename from meta/recipes-devtools/gcc/gcc/0001-Fix-install-path-of-linux64.h.patch
rename to meta/recipes-devtools/gcc/gcc/0029-Fix-install-path-of-linux64.h.patch
index 5bf895d6e7..d7e156e7a3 100644
--- a/meta/recipes-devtools/gcc/gcc/0001-Fix-install-path-of-linux64.h.patch
+++ b/meta/recipes-devtools/gcc/gcc/0029-Fix-install-path-of-linux64.h.patch
@@ -1,4 +1,4 @@
-From 58211c7ceb0510b2a11a7f1da3c7fa968c658749 Mon Sep 17 00:00:00 2001
+From 8a62cc0a64670e39f462c1dbbf82e04d2f03b89e Mon Sep 17 00:00:00 2001
 From: Andrei Gherzan <andrei.gherzan@huawei.com>
 Date: Wed, 22 Dec 2021 12:49:25 +0100
 Subject: [PATCH] Fix install path of linux64.h
@@ -11,15 +11,16 @@ adapts the install path of linux64.h to match the include in tm.h.
 Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
 
 Upstream-Status: Inappropriate [configuration]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  gcc/Makefile.in | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 9b17d120a..d175ec4e3 100644
+index 06eb0d27a28..a8678ca24ed 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
-@@ -3693,6 +3693,8 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
+@@ -3686,6 +3686,8 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
  	  "$(srcdir)"/config/* | "$(srcdir)"/common/config/* \
  	  | "$(srcdir)"/c-family/* | "$(srcdir)"/*.def ) \
  	    base=`echo "$$path" | sed -e "s|$$srcdirstrip/||"`;; \
@@ -28,6 +29,3 @@ index 9b17d120a..d175ec4e3 100644
  	  *) base=`basename $$path` ;; \
  	  esac; \
  	  dest=$(plugin_includedir)/$$base; \
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.patch b/meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.patch
deleted file mode 100644
index 3fb9ee98de..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-The patch is needed in order to support recent glibc (2.34).
-
-Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=91f8a7a34cf29ae7c465603a801326767f1cc7e9]
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
----
---- a/libsanitizer/sanitizer_common/sanitizer_posix_libcdep.cpp	2022-03-15 07:59:54.515325204 -0700
-+++ b/libsanitizer/sanitizer_common/sanitizer_posix_libcdep.cpp	2022-03-15 08:01:45.919405931 -0700
-@@ -166,9 +166,10 @@
- #if !SANITIZER_GO
- // TODO(glider): different tools may require different altstack size.
- static uptr GetAltStackSize() {
--  // SIGSTKSZ is not enough.
--  static const uptr kAltStackSize = SIGSTKSZ * 4;
--  return kAltStackSize;
-+  // Note: since GLIBC_2.31, SIGSTKSZ may be a function call, so this may be
-+  // more costly that you think. However GetAltStackSize is only call 2-3 times
-+  // per thread so don't cache the evaluation.
-+  return SIGSTKSZ * 4;
- }
- 
- void SetAlternateSignalStack() {
diff --git a/meta/recipes-devtools/gcc/gcc_11.2.bb b/meta/recipes-devtools/gcc/gcc_11.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_11.2.bb
rename to meta/recipes-devtools/gcc/gcc_11.3.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_11.2.bb b/meta/recipes-devtools/gcc/libgcc-initial_11.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_11.2.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_11.3.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_11.2.bb b/meta/recipes-devtools/gcc/libgcc_11.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_11.2.bb
rename to meta/recipes-devtools/gcc/libgcc_11.3.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_11.2.bb b/meta/recipes-devtools/gcc/libgfortran_11.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_11.2.bb
rename to meta/recipes-devtools/gcc/libgfortran_11.3.bb
-- 
2.25.1


