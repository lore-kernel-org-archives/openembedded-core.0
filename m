Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.758.1603381930682510039
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 08:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=jYUA0mM7;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id j7so1173987pgk.5
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 08:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=HSUAGTp9suINJvsyO0E33OYedKDfYY+/RkXrdH66ew0=;
        b=jYUA0mM7YvL8ZVmM8vmMxzpwGh1Xeky3P3trezH92nLcbniH4+xrRnkVJTNcOlfawx
         v8Cc2fu2V7beLWIoOpKVT/k37h4UQXtFBtUdkLg22omcyj92R5je8flFgjyOfKDeXEpW
         K1YobwMq8yvggbtg67AyuPxnwymbjqP0u/x5kJm1lCgbPLVCkPNrDIT/IdSQEZvy5FHt
         csFdjjVhs4hsIWZsbBedu3fgKMx86ZlmFku+KoDwMacMiPOablb245Qu9Hn3JCFVUeRt
         4FteUVBHdy1hHT4L4bpAq1OaLZN16HJRdnYp6iaqm61YA7YOZeSiO0IGQ+c5IQDGRoNG
         1vuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=HSUAGTp9suINJvsyO0E33OYedKDfYY+/RkXrdH66ew0=;
        b=Bt+AmZXZUm763c9sUNSiXMD2cEmzTuBXF9Rw88+QdH7YgT8mFQqj4yBFTqMJig8Dj2
         4pAmgVxGJvllFH7EKszLki6eTTIp77/ArV7L2kjSC/5PqTwNGYx9LTgFLfZuJzYoNhXN
         jPkieYK1SahUrLI5MwOYgJA43A9E9EHvTkV2zfsoIUUsoooR/WDD1bSePRWW5DwaNDvE
         HdhJl50YTEs9WhPjmp4C1OxjtMoB0eoRbv/4qUGBvyuEZisy8BAsUb390o5VSJhIU+ue
         jMwuuTywPWgeUL2mQ8Ik5VaZv3VKkNnSxjZ+wLlfGQa5S4H6i6WQEtpXMMpuhRwBqPgl
         l5rg==
X-Gm-Message-State: AOAM532PQ8w7+qRIEnq7OAlvDODFUce7bYfaJGjarCw+KTRlpt3WDiVQ
	9toVFAeoz2i6jd3xTHwHgkTyJeEyu0IB0Ogi
X-Google-Smtp-Source: ABdhPJwWAgnYwuQ3ztKnryb3WQuSuhywV67noRiVHc3001ab4skPp5FLf1kUI7vj27KlTzFA+qil6g==
X-Received: by 2002:a63:fb48:: with SMTP id w8mr2746506pgj.218.1603381929544;
        Thu, 22 Oct 2020 08:52:09 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id kc21sm2423558pjb.36.2020.10.22.08.52.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 08:52:08 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/14] Patch review
Date: Thu, 22 Oct 2020 05:51:33 -1000
Message-Id: <cover.1603381704.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Please review this next set of patches for dunfell and have comments back
by end of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1501

The following changes since commit 3ee9590f96cb50e93864db768b254773e2ff9465:

  uninative: Fix typo in error message (2020-10-19 04:27:15 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (1):
  selftest/virgl: drop the custom 30 sec timeout

Changqing Li (1):
  toolchain-shar-extract.sh: don't print useless info

Khem Raj (1):
  packagegroup-core-tools-debug: Disable for rv32/glibc as well

Lee Chee Yang (3):
  libproxy: fix CVE-2020-25219
  python3: fix CVE-2020-26116
  grub2: fix CVE-2020-10713

Martin Jansa (7):
  arch-armv7a.inc: fix typo
  arch-mips.inc: remove duplicated mips64el-o32 from
    PACKAGE_EXTRA_ARCHS_tune-mips64el-o32
  tune-mips64r6.inc: fix typo in mipsisa64r6-nf
  tune-ep9312.inc: add t suffix for thumb to
    PACKAGE_EXTRA_ARCHS_tune-ep9312
  tune-riscv.inc: use nf suffix also for TUNE_PKGARCH
  siteinfo: Recognize 32bit PPC LE
  siteinfo: Recognize bigendian sh3be and sh4be

Victor Kamensky (1):
  qemu: change TLBs number to 64 in 34Kf mips cpu model

 meta-selftest/lib/oeqa/runtime/cases/virgl.py |   2 +-
 meta/classes/siteinfo.bbclass                 |   5 +
 meta/conf/machine/include/arm/arch-armv7a.inc |   2 +-
 meta/conf/machine/include/mips/arch-mips.inc  |   2 +-
 .../conf/machine/include/riscv/tune-riscv.inc |   4 +-
 meta/conf/machine/include/tune-ep9312.inc     |   3 +-
 meta/conf/machine/include/tune-mips64r6.inc   |   2 +-
 meta/files/toolchain-shar-extract.sh          |   2 +-
 .../grub/files/CVE-2020-10713.patch           |  73 ++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |   1 +
 .../packagegroup-core-tools-debug.bb          |   2 +-
 .../python/python3/CVE-2020-26116.patch       | 104 ++++++++++++++++++
 meta/recipes-devtools/python/python3_3.8.2.bb |   1 +
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 ...ease-number-of-TLB-entries-on-the-34.patch |  59 ++++++++++
 .../libproxy/libproxy/CVE-2020-25219.patch    |  61 ++++++++++
 .../libproxy/libproxy_0.4.15.bb               |   1 +
 17 files changed, 315 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-10713.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2020-26116.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-target-mips-Increase-number-of-TLB-entries-on-the-34.patch
 create mode 100644 meta/recipes-support/libproxy/libproxy/CVE-2020-25219.patch

-- 
2.17.1

