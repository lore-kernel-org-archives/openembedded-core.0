Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1AF2C433EF
	for <webhook@archiver.kernel.org>; Sat, 11 Jun 2022 02:39:48 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.2114.1654915178889853647
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 19:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=cG4/SMfs;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id f65so777808pgc.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 19:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K6Gv4Mzk+z1UY0rTgqidfFE8aVgHPL+bdgTJ/7vd+HA=;
        b=cG4/SMfsiUw4gSjmq76Th/H234ZgolCUXNhfv1VjZ+5nZyESpJIzZYWyiBjxYtAVr8
         xMhqCLPCjs4qOdXW6DkmC7ml+Ls5q6VPNVfwA+1gbmbF8pdEIRX0kzdDY81/zpFiOao9
         8yOOrMl3gNNJ3wrpTOOe85TSi+8UhrKYx7fU6rmObkaa3LUBQWSxC8d1/uG3hKRaLz0I
         GVQQH/86KtUPPE+hbWP0C16HUY7s/Oh/O55b2ygor3pZtKoG0vduLstD4/w40yBx46eU
         ncFJGJUUYmR7rt3OAnoxxy27ygkN2YDyd18sayrqiclJ1XXefNSBqRciN59DdfNdq2Ms
         qbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K6Gv4Mzk+z1UY0rTgqidfFE8aVgHPL+bdgTJ/7vd+HA=;
        b=FOtOeqA0XN7/RlEjJLaKgXatETTSO51+D9n/I+6oD6FAhCUXcV/t0mXCIhxx5qo7t3
         z4VQ3qoEoNkUqx4I7vrN7vh7V2BKvRJHwrexdIek40Xe5Ip6aa7mHEl1c07MxZ6qWZWd
         Y47NG64H0ilXhyaSRJ38Cy9Va9636+ORKFv369Tj6FOsChQY6EhZrq5ttctGMiS7hjyj
         OPdqqqeyA5/ua08FQQPCW6M0yqCUI4hDBn31WCnKxlTDitdeLnnp7I3CfDYih1SePnjf
         TX21TePeCysKDutWDtCpvrZI5JBwHvwQidpojaMzbIqev3p/R/OQvhVFQ8cWgbvfbopz
         UjXw==
X-Gm-Message-State: AOAM533Z14WsDn1nnaq8tLyhBhW1VTCNGYec5vwhVHxclAWaAQdtqRuv
	hM0a4Ic6w2LT1SJ+GzQvutvp+jmn94vARoks
X-Google-Smtp-Source: 
 ABdhPJwBH4DNEQ3FqDvI84lDePNIzN6QQf9PsIa5s4ySZcI74ZEq4KZ1l4qp55z6WOf5w9KlxLt/Ig==
X-Received: by 2002:a65:67c1:0:b0:3fd:ebd6:5dab with SMTP id
 b1-20020a6567c1000000b003fdebd65dabmr21437399pgs.75.1654915177623;
        Fri, 10 Jun 2022 19:39:37 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 z11-20020aa7958b000000b0051bdb735647sm262787pfj.159.2022.06.10.19.39.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 19:39:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/14] Pull request (cover letter only)
Date: Fri, 10 Jun 2022 16:39:20 -1000
Message-Id: <cover.1654915108.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jun 2022 02:39:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166821

The following changes since commit 4051d1a3aa5f70da96c381f9dea5f52cd9306939:

  openssl: Backport fix for ptest cert expiry (2022-06-07 11:33:46 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Bruce Ashfield (1):
  linux-yocto/5.4: update to v5.4.196

Hitendra Prajapati (2):
  e2fsprogs: CVE-2022-1304 out-of-bounds read/write via crafted
    filesystem
  pcre2: CVE-2022-1587 Out-of-bounds read

Marta Rybczynska (4):
  cve-check: move update_symlinks to a library
  cve-check: write empty fragment files in the text mode
  cve-check: add coverage statistics on recipes with/without CVEs
  cve-update-db-native: make it possible to disable database updates

Richard Purdie (1):
  libxslt: Mark CVE-2022-29824 as not applying

Robert Joslyn (2):
  curl: Backport CVE fixes
  curl: Fix CVE_CHECK_WHITELIST typo

Steve Sakoman (3):
  Revert "openssl: Backport fix for ptest cert expiry"
  openssl: backport fix for ptest certificate expiration
  openssl: update the epoch time for ct_test ptest

omkar patil (1):
  libxslt: Fix CVE-2021-30560

 meta/classes/cve-check.bbclass                |  86 ++-
 meta/lib/oe/cve_check.py                      |  10 +
 ...5d82489b3ec09ccc772dfcee14fef0e8e908.patch | 192 +++++
 ...ea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch |  55 --
 ...611887cfac633aacc052b2e71a7f195418b8.patch |  29 +
 .../openssl/openssl_1.1.1o.bb                 |   3 +-
 .../recipes-core/meta/cve-update-db-native.bb |   6 +-
 .../e2fsprogs/e2fsprogs/CVE-2022-1304.patch   |  42 ++
 .../e2fsprogs/e2fsprogs_1.45.7.bb             |   1 +
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 .../curl/curl/CVE-2022-27774-1.patch          |  45 ++
 .../curl/curl/CVE-2022-27774-2.patch          |  80 +++
 .../curl/curl/CVE-2022-27774-3.patch          |  83 +++
 .../curl/curl/CVE-2022-27774-4.patch          |  35 +
 .../curl/curl/CVE-2022-27781.patch            |  46 ++
 .../curl/curl/CVE-2022-27782-1.patch          | 363 ++++++++++
 .../curl/curl/CVE-2022-27782-2.patch          |  71 ++
 meta/recipes-support/curl/curl_7.69.1.bb      |   9 +-
 .../libpcre/libpcre2/CVE-2022-1587.patch      | 660 ++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.34.bb |   1 +
 .../libxslt/libxslt/CVE-2021-30560.patch      | 201 ++++++
 .../recipes-support/libxslt/libxslt_1.1.34.bb |   5 +
 24 files changed, 1949 insertions(+), 110 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/73db5d82489b3ec09ccc772dfcee14fef0e8e908.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/770aea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/b7ce611887cfac633aacc052b2e71a7f195418b8.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2022-1304.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27774-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27774-2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27774-3.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27774-4.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27781.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27782-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27782-2.patch
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2022-1587.patch
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2021-30560.patch

-- 
2.25.1


