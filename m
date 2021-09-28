Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B2FEC433F5
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 23:24:30 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.1921.1632871469045787804
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 16:24:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=nTESptEu;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id t4so239228plo.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 16:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PZU3TJJEH6KhuO3rVVyBdSa12vGvd04TOVV5Y3z45/s=;
        b=nTESptEuLn7eS4wnqwOb/CrE8oHQxVYt9h4bpSE6fdLJ8Iy9JD2LLYP0b9wY/SN1tZ
         z84fXvhn1FAOfTjLQA2tK1yqQ/lcrZPTnikhZh7UM/BfcSqhEXRi4/UO1R5H7B5zce1C
         QWbXXpjrR+PIzPNvKKNrMuGFAqtdHcj/Ve7H0DpIuvN9HiM5yzdGG2g9p8S0ZtimxJUy
         +cBe7rHSUuX2HdwR7VRGpa3m7RKOlH3Hoj23ocqJhSHGb1ecqmgXvkD9nGLNOPAAaCCw
         D4609Gs7Dp/G0BaMki478rTxiX0TC8rIC+9+GNGdtQJtRvG4UEfgIeF7khH1wT0ao9Ag
         byRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PZU3TJJEH6KhuO3rVVyBdSa12vGvd04TOVV5Y3z45/s=;
        b=RuQLd8vudKDB7vLOiUcjYS5HEYuFY4mG8tIiUs26SKr/AdBaFMgj+BnqYIVV+BPmZg
         7vTiR/jxjxSShFhbjIZ8gzK4fhLQ+7LVXAYVaNzJr7Gvybbdx0rfCEMaqnVhCvmzXS0W
         bq0C5yisjiDFR28PEQG5OY6khGOrt7XlqX23CgkSEIREJK6iLoK2NG+jgFxbyLOvyjWj
         UnrVxIXT2SHrduQ4HiFVBIPwbmaybzpQyh8FnSzrPgneWLAfJg/vb4jIfbeb/4dZksN7
         +OVIABga5+/kJ2ohT6/VRBLwFtiiIz8HeABElw6YrKUFB13iymV6w/fE2ffej7+4xwIs
         P7fA==
X-Gm-Message-State: AOAM532rjDEUP4ZbIF/oXYlRVMrxpb6GQRJaRIzTUTMtJXA7H94G6YeH
	8Bp4Zbk1pQCX5Yf+cAgFRwMXvTygE1hJaeRIskU=
X-Google-Smtp-Source: 
 ABdhPJyhfCNDzRITKk1QW5YIK0pKrjEY8eBBV2f33FNx32pGsN6ixRYVhgftpiJzmtaqh5enJyF+BA==
X-Received: by 2002:a17:902:8488:b029:129:97e8:16e7 with SMTP id
 c8-20020a1709028488b029012997e816e7mr7317948plo.39.1632871467632;
        Tue, 28 Sep 2021 16:24:27 -0700 (PDT)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y17sm201801pfa.113.2021.09.28.16.24.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 16:24:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/25] Pull request (cover letter only)
Date: Tue, 28 Sep 2021 13:24:05 -1000
Message-Id: <cover.1632871368.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Sep 2021 23:24:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156433

The following changes since commit c7d2281eb6cda9c1637c20b3540b142073bca235:

  build-appliance-image: Update to dunfell head revision (2021-09-15 18:34:19 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (2):
  wic: keep rootfs_size as integer
  testimage: symlink the task log and qemu console log to tmp/log/oeqa

Armin Kuster (9):
  libgcrypt: Security fix CVE-2021-33560
  apr: Security fix for CVE-2021-35940
  libsndfile: Security fix for CVE-2021-3246
  qemu: Security fix CVE-2020-12829
  qemu: Security fix for CVE-2020-27617
  qemu: Security fix for CVE-2020-28916
  nettle: Security fix for CVE-2021-3580
  nettle: Security fix for CVE-2021-20305
  tar: ignore node-tar CVEs

Bruce Ashfield (2):
  linux-yocto/5.4: update to v5.4.143
  linux-yocto/5.4: update to v5.4.144

Jon Mason (2):
  Update mailing list address
  core-image-sato: Fix runqemu error for qemuarmv5

Kai Kang (1):
  squashfs-tools: fix CVE-2021-40153

Mike Crowe (1):
  curl: Fix CVE-2021-22946 and CVE-2021-22947, whitelist CVE-2021-22945

Ranjitsinh Rathod (1):
  rpm: Handle proper return value to avoid major issues

Richard Purdie (3):
  vim: Backport fix for CVE-2021-3770
  useradd: Ensure preinst data is expanded correctly in pkgdata
  bash: Ensure deterministic build

Ross Burton (1):
  libsoup-2.4: remove obsolete intltool dependency

Sakib Sajal (1):
  qemu: fix CVE-2021-3682

Steve Sakoman (1):
  connman: add CVE_PRODUCT

Visa Hankala (1):
  iputils: Fix regression of arp table update

 meta/classes/testimage.bbclass                |  12 +-
 meta/classes/useradd.bbclass                  |   4 +
 meta/conf/distro/include/maintainers.inc      |   2 +-
 meta/recipes-connectivity/connman/connman.inc |   2 +
 .../ldconfig-native-2.12.1/ldconfig.patch     |   2 +-
 meta/recipes-devtools/qemu/qemu.inc           |   8 +
 .../qemu/qemu/CVE-2020-12829_1.patch          | 164 ++++++++
 .../qemu/qemu/CVE-2020-12829_2.patch          | 139 +++++++
 .../qemu/qemu/CVE-2020-12829_3.patch          |  47 +++
 .../qemu/qemu/CVE-2020-12829_4.patch          | 100 +++++
 .../qemu/qemu/CVE-2020-12829_5.patch          | 266 +++++++++++++
 .../qemu/qemu/CVE-2020-27617.patch            |  49 +++
 .../qemu/qemu/CVE-2020-28916.patch            |  48 +++
 .../qemu/qemu/CVE-2021-3682.patch             |  41 ++
 ...rict-virtual-memory-usage-if-limit-s.patch |  25 +-
 .../squashfs-tools/files/CVE-2021-40153.patch | 253 +++++++++++++
 .../squashfs-tools/squashfs-tools_git.bb      |   1 +
 meta/recipes-extended/bash/bash.inc           |   5 +
 ...ng-make-update-neighbours-work-again.patch |  79 ++++
 .../iputils/iputils_s20190709.bb              |   1 +
 meta/recipes-extended/tar/tar_1.32.bb         |   1 +
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 .../libsndfile1/CVE-2021-3246_1.patch         |  36 ++
 .../libsndfile1/CVE-2021-3246_2.patch         |  44 +++
 .../libsndfile/libsndfile1_1.0.28.bb          |   2 +
 meta/recipes-sato/images/core-image-sato.bb   |   1 +
 .../apr/apr/CVE-2021-35940.patch              |  58 +++
 meta/recipes-support/apr/apr_1.7.0.bb         |   1 +
 .../curl/curl/CVE-2021-22946-pre1.patch       |  86 +++++
 .../curl/curl/CVE-2021-22946.patch            | 328 ++++++++++++++++
 .../curl/curl/CVE-2021-22947.patch            | 352 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   5 +-
 .../libgcrypt/files/CVE-2021-33560.patch      | 109 ++++++
 .../libgcrypt/libgcrypt_1.8.5.bb              |   1 +
 .../libsoup/libsoup-2.4_2.68.4.bb             |   2 +-
 .../nettle-3.5.1/CVE-2021-20305-1.patch       | 215 +++++++++++
 .../nettle-3.5.1/CVE-2021-20305-2.patch       |  53 +++
 .../nettle-3.5.1/CVE-2021-20305-3.patch       | 122 ++++++
 .../nettle-3.5.1/CVE-2021-20305-4.patch       |  48 +++
 .../nettle-3.5.1/CVE-2021-20305-5.patch       |  53 +++
 .../nettle/nettle-3.5.1/CVE-2021-3580_1.patch | 277 ++++++++++++++
 .../nettle/nettle-3.5.1/CVE-2021-3580_2.patch | 163 ++++++++
 meta/recipes-support/nettle/nettle_3.5.1.bb   |   7 +
 ...1e135a16091c93f6f5f7525a5c58fb7ca9f9.patch | 207 ++++++++++
 meta/recipes-support/vim/vim.inc              |   2 +
 scripts/lib/wic/partition.py                  |   2 +-
 48 files changed, 3423 insertions(+), 36 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-12829_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-12829_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-12829_3.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-12829_4.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-12829_5.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-27617.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-28916.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3682.patch
 create mode 100644 meta/recipes-devtools/squashfs-tools/files/CVE-2021-40153.patch
 create mode 100644 meta/recipes-extended/iputils/iputils/0001-arping-make-update-neighbours-work-again.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2021-3246_1.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2021-3246_2.patch
 create mode 100644 meta/recipes-support/apr/apr/CVE-2021-35940.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22946-pre1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22946.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22947.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2021-33560.patch
 create mode 100644 meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-20305-1.patch
 create mode 100644 meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-20305-2.patch
 create mode 100644 meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-20305-3.patch
 create mode 100644 meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-20305-4.patch
 create mode 100644 meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-20305-5.patch
 create mode 100644 meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-3580_1.patch
 create mode 100644 meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-3580_2.patch
 create mode 100644 meta/recipes-support/vim/files/b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch

-- 
2.25.1


