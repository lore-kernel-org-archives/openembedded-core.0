Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A1CF51419
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 07:23:08 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64680.1772781780851802091
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 23:23:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yRaEh2BF;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-483bd7354efso116674695e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 23:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772781779; x=1773386579; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TbeMDZ1vdA9Bkly2FKs14N9nncfhByWAGxfBCo5Hzxo=;
        b=yRaEh2BFoOQkilXs8i/h4BvXA7Mml4uBRCPHOWjIj2chCtEokTfYprGVI5POhCumPh
         PWNBU1wr/HLzpeduW4lgzydGV9dKL5/CDcB6Jx0b42he/sYRI3NjrMlZV6QgrQqPKlmm
         fkOrt4oWDaJ3ThEZojZVN8lVvba5R8vQ1N/x0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772781779; x=1773386579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TbeMDZ1vdA9Bkly2FKs14N9nncfhByWAGxfBCo5Hzxo=;
        b=Y0Tf+WUzOE/PXvH9UkCsGv7dAwh0X8gZFx3yjoR+WOl8Tzo6jv8VmT5xBSU1DnFC0q
         XpsWKFiQqOGuKOOjW/Alftys9qas/DN11srg/5IZpkEDmwLLElZufqKLg/KIWSpO+IUk
         ZBZOkJFfDGJmMrm0D0bMd9QKg7ERRulWkttPOd6mTnBw8z8h5GLrVCtJhuKQ01abtg91
         xXFlUtuqWn6VF7DCqueRgI1fIX/5fts/Bhi7aWnTvxO/TbFWv+MDZSP2CJE5GLKRfjDe
         YDjsIK2IrMMikbAOOy5YJjqSGhYG2uzUIVeiqw0ftzKH+6FAbRM/JTUlRJo4xzPByhiF
         Wohw==
X-Gm-Message-State: AOJu0Yx49DP2H07/GNAkyc/LIwqTqFkL/xNmqkIPeqBSbgFrARM63I3w
	q4gkvO9RGcWU401qJrc6rHI89elKoEzbutDB1scSGHkcztYKyvCPeV+UyYlzR/tiqKGpZ7kX9+N
	Bvhh5
X-Gm-Gg: ATEYQzz8BL5iBZUGHkPq3Azbr/Ng1AjPwE6/0IzDVtpSbqCpk3VuT+dmQuj+ItSZ1Ki
	N47IkJkNgEVHDQXtyiMMVOPSD5Jv3HmaGMOHIQr65JZ5oZReG7sg9ChJYCq8UXRrqrJWaAlFl3f
	rStKSXzYT96siccVbil5FAf/6wT9HwPVjx/10emB2VW92n0tpBt+10ehamfzEochpGOwltoyLnG
	nzlAPgpJUMbtFyzXvLzjrz1K2YjV5c3lDoWk3cznNiywuk+dsC+diDe1dECO7JiUoWUwZST2FAM
	i7GWuGG/13sGTtGUr9LlQa/Cu1FXWjf2EoEfY3kue1+Ofrj9x5YMdlCsiUI8du33qFf0iy9ntFL
	08HJxeGEozlUzpeD7QPGlZaHYf0V/tJvR6aeVP+47e/BSTSbY0xQSU3jCn3p2b2yeLRF8X8t1iQ
	y07A4uz6ydP0bcvh8JyIaoidfR29wRZL3oFnDPtiPQOJTXb1yb6v3Yu3peY1UcnvMB/meosuBbe
	ovgHZP0GLiH5zjjfmJL5JqtM5Dt
X-Received: by 2002:a05:600c:474f:b0:485:1744:6651 with SMTP id 5b1f17b1804b1-485269692famr16163415e9.25.1772781778789;
        Thu, 05 Mar 2026 23:22:58 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bdeac353f6fa5aa8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bdea:c353:f6fa:5aa8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485276b09casm23106445e9.11.2026.03.05.23.22.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 23:22:58 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 00/16] Patch review
Date: Fri,  6 Mar 2026 08:22:00 +0100
Message-ID: <cover.1772780989.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 07:23:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232539

This is an updated patch review request with added patches.

v1: https://lore.kernel.org/openembedded-core/cover.1772700454.git.yoann.congal@smile.fr/T/#u
v1->v2: added patches:
* python3-urllib3: patch CVE-2025-66471
* lz4: Remove a reference to the rejected CVE-2025-62813
* avahi: Remove a reference to the rejected CVE-2021-36217
* create-pull-request: Keep commit hash to be pulled in cover email

Please review this set of changes for whinlatter and have comments back
by end of day Monday, March 9.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3334

The following changes since commit 45cba1329d541fdc5857d6df2624b34c91133f7a:

  build-appliance-image: Update to whinlatter head revisions (2026-02-27 17:46:44 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/whinlatter-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/whinlatter-nut

for you to fetch changes up to cfc0e446a1ad57e710d2c82914211f9bcdc4a752:

  python3-urllib3: patch CVE-2025-66471 (2026-03-06 00:48:43 +0100)

----------------------------------------------------------------

Adarsh Jagadish Kamini (1):
  python3-pip: Backport fix CVE-2026-1703

Ankur Tyagi (1):
  wireless-regdb: upgrade 2025.10.07 -> 2026.02.04

Antonin Godard (1):
  python3: skip flaky test_default_timeout test

Benjamin Robin (Schneider Electric) (2):
  avahi: Remove a reference to the rejected CVE-2021-36217
  lz4: Remove a reference to the rejected CVE-2025-62813

Hugo SIMELIERE (2):
  zlib: Fix CVE-2026-27171
  harfbuzz: Fix CVE-2026-22693

Paul Barker (1):
  create-pull-request: Keep commit hash to be pulled in cover email

Peter Marko (4):
  linux-yocto: apply cve-exclusions also to rt and tiny recipe variants
  cve-exclusions: set status for 5 CVEs
  ffmpeg: set status for CVE-2025-12343
  python3-urllib3: patch CVE-2025-66471

Shaik Moin (1):
  gdk-pixbuf: Fix CVE-2025-6199

Vijay Anusuri (1):
  gnutls: Fix CVE-2025-14831

Yoann Congal (2):
  README: Add whinlatter subject-prefix to git-send-email suggestion
  b4-config: add send-prefixes for whinlatter

 .b4-config                                    |   1 +
 README.OE-Core.md                             |   2 +-
 .../avahi/files/local-ping.patch              |   1 -
 .../zlib/zlib/CVE-2026-27171.patch            |  63 ++
 meta/recipes-core/zlib/zlib_1.3.1.bb          |   1 +
 .../python/python3-pip/CVE-2026-1703.patch    |  41 +
 .../python/python3-pip_25.2.bb                |   4 +-
 .../python3-urllib3/CVE-2025-66471.patch      | 926 ++++++++++++++++++
 .../python/python3-urllib3_2.5.0.bb           |   1 +
 ...kip-flaky-test_default_timeout-tests.patch |  49 +
 .../python/python3_3.13.11.bb                 |   1 +
 .../gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch |  36 +
 .../gdk-pixbuf/gdk-pixbuf_2.42.12.bb          |   1 +
 .../harfbuzz/files/CVE-2026-22693.patch       |  33 +
 .../harfbuzz/harfbuzz_11.4.5.bb               |   4 +-
 meta/recipes-kernel/linux/cve-exclusion.inc   |  16 +
 .../linux/linux-yocto-rt_6.12.bb              |   1 +
 .../linux/linux-yocto-rt_6.16.bb              |   1 +
 .../linux/linux-yocto-tiny_6.12.bb            |   1 +
 .../linux/linux-yocto-tiny_6.16.bb            |   1 +
 ....10.07.bb => wireless-regdb_2026.02.04.bb} |   2 +-
 meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.bb  |   1 +
 .../gnutls/gnutls/CVE-2025-14831-1.patch      | 119 +++
 .../gnutls/gnutls/CVE-2025-14831-10.patch     | 424 ++++++++
 .../gnutls/gnutls/CVE-2025-14831-2.patch      |  66 ++
 .../gnutls/gnutls/CVE-2025-14831-3.patch      |  30 +
 .../gnutls/gnutls/CVE-2025-14831-4.patch      |  45 +
 .../gnutls/gnutls/CVE-2025-14831-5.patch      | 205 ++++
 .../gnutls/gnutls/CVE-2025-14831-6.patch      | 505 ++++++++++
 .../gnutls/gnutls/CVE-2025-14831-7.patch      | 124 +++
 .../gnutls/gnutls/CVE-2025-14831-8.patch      | 155 +++
 .../gnutls/gnutls/CVE-2025-14831-9.patch      | 110 +++
 meta/recipes-support/gnutls/gnutls_3.8.10.bb  |  10 +
 ...13.patch => fix-null-error-handling.patch} |   1 -
 meta/recipes-support/lz4/lz4_1.10.0.bb        |   2 +-
 scripts/create-pull-request                   |   2 +-
 36 files changed, 2977 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2026-27171.patch
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025-66471.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-Skip-flaky-test_default_timeout-tests.patch
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch
 create mode 100644 meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.patch
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2025.10.07.bb => wireless-regdb_2026.02.04.bb} (94%)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-10.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-2.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-3.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-4.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-5.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-6.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-7.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-8.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-14831-9.patch
 rename meta/recipes-support/lz4/lz4/{CVE-2025-62813.patch => fix-null-error-handling.patch} (99%)


