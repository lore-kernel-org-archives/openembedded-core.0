Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFE2C4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 23:11:20 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.6985.1669158678119645120
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 15:11:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=e/2odlF+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id v28so15734334pfi.12
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 15:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zSrW9EsMqvDZlLYvRdVPhSnAoNBN3efpW5bSGUFhyhg=;
        b=e/2odlF+Tlsdjfr//4jbxJv08gBHxxc2EYwZ0Q7B9PeFQsKuuTzkqv7mMXJfw1/ONQ
         zkm4ytIa3imHcL9UaesQOdlU/opKvq72MVWOnPf4FtR0WI5zQJtiP72AhWHbERnTzrzY
         mR/NfK5T2mq6kReMUqppDi24qw9rr2qn+02OUxsip59ZAE3xxdCoZfvss4tQp/hmgQvQ
         RR8vupAisilKDGFZVKUkjy/y8kcsgsPBcGKtuwl6MazMdHpEbiz2KVuDkG/ItdoddJ34
         3TTvAot037r/w7iCpcZhow2yUtBhi7Ym1TD8dtzJ6UdBP6h4cFqgINd2+hm/9g02QFGg
         vZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zSrW9EsMqvDZlLYvRdVPhSnAoNBN3efpW5bSGUFhyhg=;
        b=nnTK+Yt7eu/NTuE/Rkd+90HS32P66TmUk6z5DIXzLMUeVmHBOyr5spkT5pPmBmbmgd
         ooRZlTzc3nZpbZ2U5WWb4xmEw5zZq9x7In2R1Ip9AzR+tmOVnC0jYZQTqj2ImSaQYGZY
         bq9VtRPPB0IhlC46WsAQ894N5tmehpDTzXwxpPL2cFKtvG4N7jR6xnsLCABgxq9RCds6
         7awTWjp71s1MZjzDi4okqC6h9Nh4ML4UsMruMXpTWnnCQp2Ud9o4TXW8twfGg6VxgD/h
         8h5rqaQ8azbJwgUunBd82W2ZmadFJ326NaD3smq4MBCeAybf1rsQjbR4ropvtuFpy5ww
         n4cw==
X-Gm-Message-State: ANoB5pl+1wqZVEaaodyUewwgHcYXDgl8ghryLfGZBYqEhQL0hz4pou4/
	o4ERxdUxWaCBPoGpfC8kkNS++2cn36c19bp7M9c=
X-Google-Smtp-Source: AA0mqf4TDPdLKk/4n+Je/fbn4dKhfmoFUGO7sFHhePhfCtqryqs2DtL43Fr8fvI+4GnpEA/diqpHUg==
X-Received: by 2002:a65:6c0d:0:b0:470:7886:e200 with SMTP id y13-20020a656c0d000000b004707886e200mr11730822pgu.111.1669158676633;
        Tue, 22 Nov 2022 15:11:16 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s2-20020a170902a50200b00187022627d7sm12521849plq.36.2022.11.22.15.11.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 15:11:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/21] Pull request (cover letter only)
Date: Tue, 22 Nov 2022 13:11:06 -1000
Message-Id: <cover.1669158605.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 23:11:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173704

This should be the final pull request for the 3.1.21 release.

The following changes since commit ce99d451a54b8ce46b7f9030deaba86355009b1a:

  wic: swap partitions are not added to fstab (2022-11-11 04:24:18 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Bhabu Bindu (2):
  libxml2: Fix CVE-2022-40303
  libxml2: Fix CVE-2022-40304

Hitendra Prajapati (1):
  sudo: CVE-2022-43995 heap-based overflow with very small passwords

Manuel Leonhardt (1):
  sstate: Account for reserved characters when shortening sstate
    filenames

Omkar (1):
  python3: Fix CVE-2022-45061

Ralph Siemsen (11):
  golang: fix CVE-2021-33195
  golang: fix CVE-2021-33198
  golang: fix CVE-2021-44716
  golang: fix CVE-2022-24291
  golang: fix CVE-2022-28131
  golang: fix CVE-2022-28327
  golang: ignore CVE-2022-29804
  golang: ignore CVE-2021-33194
  golang: ignore CVE-2021-41772
  golang: ignore CVE-2022-30580
  golang: ignore CVE-2022-30630

Ranjitsinh Rathod (1):
  systemd: Fix CVE-2022-3821 issue

Steve Sakoman (1):
  maintainers: update gcc version to 9.5

Sundeep KOKKONDA (1):
  gcc: upgrade to v9.5

Tim Orling (1):
  vim: upgrade 9.0.0614 -> 9.0.0820

Vivek Kumbhar (1):
  libtasn1: fix CVE-2021-46848 off-by-one in asn1_encode_simple_der

 meta/classes/sstate.bbclass                   |   2 +-
 meta/conf/distro/include/maintainers.inc      |   2 +-
 .../libxml/libxml2/CVE-2022-40303.patch       | 623 +++++++++++++++++
 .../libxml/libxml2/CVE-2022-40304.patch       | 104 +++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |   2 +
 .../systemd/systemd/CVE-2022-3821.patch       |  47 ++
 meta/recipes-core/systemd/systemd_244.5.bb    |   1 +
 ...-PR-tree-optimization-97236-fix-bad-.patch | 119 ----
 ...ight-Line-Speculation-SLS-mitigation.patch | 204 ------
 ...e-SLS-mitigation-for-RET-and-BR-inst.patch | 600 ----------------
 ...h64-Mitigate-SLS-for-BLR-instruction.patch | 659 ------------------
 ...x-missing-dependencies-for-selftests.patch |  45 --
 .../gcc/{gcc-9.3.inc => gcc-9.5.inc}          |  13 +-
 ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |   0
 .../0002-gcc-poison-system-directories.patch  |   0
 ...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   0
 .../0004-64-bit-multilib-hack.patch           |   0
 .../0005-optional-libstdc.patch               |   0
 .../0006-COLLECT_GCC_OPTIONS.patch            |   0
 ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |   0
 .../0008-fortran-cross-compile-hack.patch     |   0
 .../0009-cpp-honor-sysroot.patch              |   0
 .../0010-MIPS64-Default-to-N64-ABI.patch      |   0
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |   0
 ...gcc-Fix-argument-list-too-long-error.patch |   0
 .../0013-Disable-sdt.patch                    |   0
 .../{gcc-9.3 => gcc-9.5}/0014-libtool.patch   |   0
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |   0
 ...-config-files-from-B-instead-of-usin.patch |   0
 ...ir-from-.la-which-usually-points-to-.patch |   0
 .../0018-export-CPP.patch                     |   0
 ...e-target-gcc-headers-can-be-included.patch |   0
 ...ild-with-disable-dependency-tracking.patch |   0
 ...t-directory-during-relink-if-inst_pr.patch |   0
 ...IR-replacement-instead-of-hardcoding.patch |   0
 ...23-aarch64-Add-support-for-musl-ldso.patch |   0
 ...-fix-libcc1-s-install-path-and-rpath.patch |   0
 ...le-sysroot-support-for-nativesdk-gcc.patch |   0
 ...sroot-gcc-version-specific-dirs-with.patch |   0
 ...ous-_FOR_BUILD-and-related-variables.patch |   0
 ...028-nios2-Define-MUSL_DYNAMIC_LINKER.patch |   0
 ...d-to-link-commandline-for-musl-targe.patch |   0
 .../0030-ldbl128-config.patch                 |   0
 ...using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |   0
 ...as-for-__cpu_indicator_init-instead-.patch |   0
 .../0033-sync-gcc-stddef.h-with-musl.patch    |   0
 ...-fault-in-precompiled-header-generat.patch |   0
 .../0035-Fix-for-testsuite-failure.patch      |   0
 ...Re-introduce-spe-commandline-options.patch |   0
 ...heck-zero-value-in-simple_object_elf.patch |   0
 ...s-Do-not-use-__LINE__-for-maintainin.patch |   0
 ...ands-Don-t-match-user-defined-regs-o.patch |   0
 ...adian_9.3.bb => gcc-cross-canadian_9.5.bb} |   0
 .../{gcc-cross_9.3.bb => gcc-cross_9.5.bb}    |   0
 ...cc-crosssdk_9.3.bb => gcc-crosssdk_9.5.bb} |   0
 ...{gcc-runtime_9.3.bb => gcc-runtime_9.5.bb} |   0
 ...anitizers_9.3.bb => gcc-sanitizers_9.5.bb} |   0
 .../{gcc-source_9.3.bb => gcc-source_9.5.bb}  |   0
 .../gcc/{gcc_9.3.bb => gcc_9.5.bb}            |   0
 ...c-initial_9.3.bb => libgcc-initial_9.5.bb} |   0
 .../gcc/{libgcc_9.3.bb => libgcc_9.5.bb}      |   0
 ...{libgfortran_9.3.bb => libgfortran_9.5.bb} |   0
 meta/recipes-devtools/go/go-1.14.inc          |  17 +
 .../go/go-1.14/CVE-2021-33195.patch           | 373 ++++++++++
 .../go/go-1.14/CVE-2021-33198.patch           | 113 +++
 .../go/go-1.14/CVE-2021-44716.patch           |  93 +++
 .../go/go-1.14/CVE-2022-24921.patch           | 198 ++++++
 .../go/go-1.14/CVE-2022-28131.patch           | 104 +++
 .../go/go-1.14/CVE-2022-28327.patch           |  36 +
 .../python/files/CVE-2022-45061.patch         | 100 +++
 .../recipes-devtools/python/python3_3.8.14.bb |   1 +
 .../sudo/sudo/CVE-2022-43995.patch            |  59 ++
 meta/recipes-extended/sudo/sudo_1.8.32.bb     |   1 +
 .../gnutls/libtasn1/CVE-2021-46848.patch      |  45 ++
 .../recipes-support/gnutls/libtasn1_4.16.0.bb |   1 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 76 files changed, 1926 insertions(+), 1640 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-40303.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-40304.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2022-3821.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0040-fix-missing-dependencies-for-selftests.patch
 rename meta/recipes-devtools/gcc/{gcc-9.3.inc => gcc-9.5.inc} (89%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0002-gcc-poison-system-directories.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0004-64-bit-multilib-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0005-optional-libstdc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0006-COLLECT_GCC_OPTIONS.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0008-fortran-cross-compile-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0009-cpp-honor-sysroot.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0010-MIPS64-Default-to-N64-ABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0012-gcc-Fix-argument-list-too-long-error.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0013-Disable-sdt.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0014-libtool.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0018-export-CPP.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0019-Ensure-target-gcc-headers-can-be-included.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0020-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0021-Don-t-search-host-directory-during-relink-if-inst_pr.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0022-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0023-aarch64-Add-support-for-musl-ldso.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0024-libcc1-fix-libcc1-s-install-path-and-rpath.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0025-handle-sysroot-support-for-nativesdk-gcc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0026-Search-target-sysroot-gcc-version-specific-dirs-with.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0027-Fix-various-_FOR_BUILD-and-related-variables.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0028-nios2-Define-MUSL_DYNAMIC_LINKER.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0029-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0030-ldbl128-config.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0031-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0032-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0033-sync-gcc-stddef.h-with-musl.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0034-fix-segmentation-fault-in-precompiled-header-generat.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0035-Fix-for-testsuite-failure.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0036-Re-introduce-spe-commandline-options.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-9.5}/0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_9.3.bb => gcc-cross-canadian_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_9.3.bb => gcc-cross_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_9.3.bb => gcc-crosssdk_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_9.3.bb => gcc-runtime_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_9.3.bb => gcc-sanitizers_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_9.3.bb => gcc-source_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_9.3.bb => gcc_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_9.3.bb => libgcc-initial_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_9.3.bb => libgcc_9.5.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_9.3.bb => libgfortran_9.5.bb} (100%)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-33195.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-33198.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-44716.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-24921.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-28131.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-28327.patch
 create mode 100644 meta/recipes-devtools/python/files/CVE-2022-45061.patch
 create mode 100644 meta/recipes-extended/sudo/sudo/CVE-2022-43995.patch
 create mode 100644 meta/recipes-support/gnutls/libtasn1/CVE-2021-46848.patch

-- 
2.25.1


