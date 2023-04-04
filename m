Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C35C76196
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 02:42:59 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.92013.1680576172370905839
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 19:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=A56DwRbq;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id u10so29972020plz.7
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 19:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680576171; x=1683168171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7VwNo4/66e1dTUNHiFY9PtMPGzIz/U7+HFNSWqproVo=;
        b=A56DwRbqIkMpOfAWXpXhtg3DHA1hvjaCmPrMfYcrNHoEZ1aXbjDJmLXEZprp+Us0BE
         7Y4NWb2tbM6/Xr9mEgHRT9RHKpt00b5EsbvTRdaeo58TQtxfdlSMK2ZzMi5w//a6HHKS
         cLnJvQbROFrR/cbkBHpRKg8AeeGbaFQQ/oigHzEbHkmP/y/+0zAEVnJUYJTOPcORhLi8
         EiOcI92zaqeelMg85cv/Dqq/o9HZ+gQhD9Fn7q3KkWY0stuqp82ywlVqdWGpciGaK2r/
         RLGzmBFO5f7ILH0jwdnovuiafXPVCVZpK/Qp2pXlf30028hmPD1Eogrk1VPbpPToOVAC
         KOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680576171; x=1683168171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7VwNo4/66e1dTUNHiFY9PtMPGzIz/U7+HFNSWqproVo=;
        b=i7f1iNie2RErIZiZvNBiLd64GUQY7MT2GgVpZ35ukL5MSF1uDM0km3npWDzMMKBSI8
         RPykrfCOLiTgLzwyjqc7TjHQm6ncQdBIi+1sIMSiPIjBCK2phXNtdoAFyYzvs4d4QfwA
         mLtkIHfycYAH0EzUxPCtfBpmVIrO8X97hED7kYuY2eGDwFm7XD9A5fFDwgpBSXbJj3RT
         4XSfCQrNleECLCWBROoGn5imhIiqKo+1KNsUxobaDsp4WhaR2Gsn4YlnVyFzaVkD/4Vg
         cwGdHN8a52C8fOzWplLw/wpZRAOkgihmJMD1uUkpvlucMUqpCLdTg37GkYUMsuwH8fhd
         NlNA==
X-Gm-Message-State: AAQBX9fHn9QhjEHEV3VaOtu8OzcdzEC0/z+eWsYKuOsDeo6IW5CsJlD3
	OZhoAhHybvSX9YQaTHwTjHpOftj69MK58QrEbH0=
X-Google-Smtp-Source: AKy350aK8stQtocGEU4HMONcZMfF8Oncr2O2oQ5bBn4SbBovYQGDVXziPuY7rVOMB6Y7a8Zs93YMeQ==
X-Received: by 2002:a05:6a20:4a14:b0:e5:58e6:be37 with SMTP id fr20-20020a056a204a1400b000e558e6be37mr707418pzb.61.1680576171359;
        Mon, 03 Apr 2023 19:42:51 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id u16-20020aa78490000000b006242f4a8945sm7577958pfn.182.2023.04.03.19.42.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 19:42:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 00/14] Pull request (cover letter only)
Date: Mon,  3 Apr 2023 16:42:43 -1000
Message-Id: <cover.1680576095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 02:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179668

The following changes since commit a0ef4386d37f84e8f169cbe3cfa9307010b89bbd:

  systemd: fix wrong nobody-group assignment (2023-03-21 06:55:30 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/langdale-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-next

Bruce Ashfield (4):
  linux-yocto/5.15: update to v5.15.98
  linux-yocto/5.15: update to v5.15.103
  lttng-modules: update to v2.13.9
  kernel-devsrc: fix mismatched compiler warning

Geoffrey GIRY (2):
  cve-extra-exclusions: ignore inapplicable linux-yocto CVEs
  cve-check: Fix false negative version issue

Martin Jansa (2):
  selftest: devtool: set BB_HASHSERVE_UPSTREAM when setting
    SSTATE_MIRROR
  bmap-tools: switch to main branch

Narpat Mali (1):
  python3-setuptools: fix for CVE-2022-40897

Peter Marko (1):
  gcc-shared-source: do not use ${S}/.. in deploy_source_date_epoch

Randy MacLeod (1):
  vim: upgrade 9.0.1403 -> 9.0.1429

Ross Burton (1):
  scripts/lib/buildstats: handle top-level build_stats not being
    complete

Siddharth Doshi (1):
  openssl: Security fix for CVE-2023-0464, CVE-2023-0465, CVE-2023-0466

Wang Mingyu (1):
  xcb-proto: Fix install conflict when enable multilib.

 meta/classes/cve-check.bbclass                |   5 +-
 .../distro/include/cve-extra-exclusions.inc   | 212 +++++++++++++++++
 meta/lib/oe/cve_check.py                      |  39 +++
 meta/lib/oeqa/selftest/cases/cve_check.py     |  19 ++
 meta/lib/oeqa/selftest/cases/devtool.py       |   1 +
 .../openssl/openssl/CVE-2023-0464.patch       | 225 ++++++++++++++++++
 .../openssl/openssl/CVE-2023-0465.patch       |  56 +++++
 .../openssl/openssl/CVE-2023-0466.patch       |  50 ++++
 .../openssl/openssl_3.0.8.bb                  |   3 +
 .../gcc/gcc-shared-source.inc                 |   4 +-
 ...-of-whitespace-to-search-backtrack.-.patch |  31 +++
 .../python/python3-setuptools_65.0.2.bb       |   4 +-
 ...nstall-conflict-when-enable-multilib.patch |  32 +++
 .../xorg-proto/xcb-proto_1.15.2.bb            |   1 +
 .../linux/cve-exclusion_5.15.inc              |  90 +++++++
 meta/recipes-kernel/linux/kernel-devsrc.bb    |   7 +
 .../linux/linux-yocto-rt_5.15.bb              |   9 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   9 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  29 ++-
 ...ccessor-helpers-into-accessors.h-v6..patch |  45 ----
 .../fix-jbd2-upper-bound-for-v5.10.163.patch  |  52 ----
 ...e-the-correct-print-format-v5.10.163.patch |  61 -----
 ...ules_2.13.8.bb => lttng-modules_2.13.9.bb} |   5 +-
 .../bmap-tools/bmap-tools_git.bb              |   2 +-
 meta/recipes-support/vim/vim.inc              |   4 +-
 scripts/lib/buildstats.py                     |   1 +
 26 files changed, 808 insertions(+), 188 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0465.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0466.patch
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-Limit-the-amount-of-whitespace-to-search-backtrack.-.patch
 create mode 100644 meta/recipes-graphics/xorg-proto/xcb-proto/0001-Fix-install-conflict-when-enable-multilib.patch
 create mode 100644 meta/recipes-kernel/linux/cve-exclusion_5.15.inc
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-move-accessor-helpers-into-accessors.h-v6..patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-upper-bound-for-v5.10.163.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format-v5.10.163.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.8.bb => lttng-modules_2.13.9.bb} (83%)

-- 
2.34.1


