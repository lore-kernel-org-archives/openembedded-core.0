Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B4AACD5BBA
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 12:41:17 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.8281.1725540070482146218
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Sep 2024 05:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0Mew2Yy8;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2055136b612so7914445ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 05:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725540070; x=1726144870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=12c8L2m5sSXVj4JriWHLnIa7gHyasxXzFiCy/MSs/nM=;
        b=0Mew2Yy8AC8gdRWWhnIuxG3HzMSRZ9QhKFoCvA5+UAH/tTdE6xxReD6No9sb9071WW
         FwxcZ2fhoDyoaDdIrRz/QglSCkHxpYckyI9+CrRC2sPeWvrznY189N2K0IIx1gfNLJTX
         g41KmXcEukEbs7HjR1owmlp+SlPiEdqhcEtAIL6O5fRWTzyfxu45NTxyQ6waifIWySda
         m42Gb7BMK4TrQXWAF6vBhZFuusRAelv/6sPpxipu5O7tS8jiWbnNtakI3LtICEzPEeSW
         DwlvVewjPDoUJinLfk4awfgEYHJeblSOCEAmMA8+prqrOtgSw+2ysbXwP0/4r7i9oDwJ
         vi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725540070; x=1726144870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=12c8L2m5sSXVj4JriWHLnIa7gHyasxXzFiCy/MSs/nM=;
        b=GJ7XR+03Q2TUg/9KVaJcFmRGFPTv2rGbwWd5HWU/g90Yw2KQ3A9HI5JBSnD6i85NRY
         yaVKfNcR8v7hSU90drx0uBkYcGUjERNPJatb9Wv96upSdDhm74Bm3I+xGgoSgubn87OU
         +E6P0sDd68muoA/tZ585Vd6g8hjPBG8bTNIsKouGGULQEqSIUP8+8LEIYmbHxCHsqBi/
         dxMr7gMb71WnoDybDyRuFqWZMB84VFCEN3NjCsoyBOM7I8Rzguyv8SzKU8MPImm+m0/2
         giGp0V8p5FsVceiG1dmZza9aDvf7ZM7LpqCcV2XUNOY3SD+WF2mM0XWTH0fop4fjQdmH
         Ar1g==
X-Gm-Message-State: AOJu0Ywy8HUAxTaPvV/rzmWiLIqxuvSXvJVQYoBDqosY6h1Dcoxeh8xj
	3JbRq3jQQU9OEqFNmC0vWOVhQTokrF7opu2Qyy50y9WP+Ud8h+AbLsAj61Gu0pIbt7PtXVGVGiR
	9yn4=
X-Google-Smtp-Source: AGHT+IFQfpDCFymPnfetEVLa8dzWZqFyK4zyWbUjoQzfVLAD1V67gdEDfs4SsKQQJs84wCjx/e1g0A==
X-Received: by 2002:a17:902:f547:b0:206:b618:1d7f with SMTP id d9443c01a7336-206b61824c9mr62502545ad.37.1725540069187;
        Thu, 05 Sep 2024 05:41:09 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea38c31sm28107265ad.151.2024.09.05.05.41.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 05:41:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/6] Patch review
Date: Thu,  5 Sep 2024 05:40:56 -0700
Message-Id: <cover.1725539924.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 12:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204231

Please review this set of changes for kirkstone and have comments back by
end of day Friday, September 6

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7310

The following changes since commit 6992437d725f9cc88da4261814b69aaadc5ef0f2:

  grub: fs/fat: Don't error when mtime is 0 (2024-08-29 06:13:56 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Hitendra Prajapati (1):
  qemu: fix CVE-2024-7409

Rohini Sangam (1):
  python3: Security fix for CVE-2024-8088

Vijay Anusuri (1):
  apr: upgrade 1.7.2 -> 1.7.5

Vrushti Dabhi (2):
  sqlite3: CVE-ID correction for CVE-2023-7104
  sqlite3: Rename patch for CVE-2022-35737

Wang Mingyu (1):
  wireless-regdb: upgrade 2024.05.08 -> 2024.07.04

 .../python/python3/CVE-2024-8088.patch        | 124 +++++++++++++
 .../python/python3_3.10.14.bb                 |   1 +
 meta/recipes-devtools/qemu/qemu.inc           |   4 +
 .../qemu/qemu/CVE-2024-7409-0001.patch        | 162 ++++++++++++++++
 .../qemu/qemu/CVE-2024-7409-0002.patch        | 174 ++++++++++++++++++
 .../qemu/qemu/CVE-2024-7409-0003.patch        | 122 ++++++++++++
 .../qemu/qemu/CVE-2024-7409-0004.patch        | 163 ++++++++++++++++
 ....05.08.bb => wireless-regdb_2024.07.04.bb} |   2 +-
 ...-runtime-test-for-mmap-that-can-map-.patch |   2 +-
 .../apr/{apr_1.7.2.bb => apr_1.7.5.bb}        |   2 +-
 ...lementation.patch => CVE-2022-35737.patch} |   0
 .../sqlite/files/CVE-2023-7104.patch          |  10 +-
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb |   4 +-
 13 files changed, 761 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2024-8088.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0001.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0002.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0003.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0004.patch
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2024.05.08.bb => wireless-regdb_2024.07.04.bb} (94%)
 rename meta/recipes-support/apr/{apr_1.7.2.bb => apr_1.7.5.bb} (98%)
 rename meta/recipes-support/sqlite/files/{0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch => CVE-2022-35737.patch} (100%)

-- 
2.34.1


