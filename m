Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83892ECAAA1
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 23:06:49 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.497.1662764808344042733
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 16:06:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=c1ypPofV;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id r17so2880982pgr.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 16:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=jCEe3Sru8q7qpnR1R4PtlqqfLrB0o7fQk2HJmBijTNs=;
        b=c1ypPofVA87gux9ypGObUDPqnM6KuuByhN8JxjkA7haKFBAPfOQ8Ax7Kad715og6km
         Vlt5VaNHisprcTpd5Wx7rbjyfYEQtyU2Kr2wJH2NMyJGwHOdaWAecLhGlKC8WuezhpO+
         HUPZlMWvV5iVlVjS71Ks9yiW+0oopWlC7qOUWpuOoektC7OZtjfQofAv1nAZCYjLOhKr
         bSrBrSWe9X7O5ezgPB6k2F03D8GOfog8Uop9EiP7Q+58zedakZHxzfzdTTnOnvYZEq3U
         iB/J4TNC9fVDWJ5L7W14My7POderxE1VLRhlUvD3Gqb14e1iUJLlc28UeeeKFrFRkozZ
         a4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=jCEe3Sru8q7qpnR1R4PtlqqfLrB0o7fQk2HJmBijTNs=;
        b=JAnWTSuWOWT27fRFosMO4ueSIsKKDu23J9TKmfoDCg6/z3f6SVjyxcu2hj9KvE+dZZ
         YeuDJq9nvKMD49WK72gggaoUeMowuRCdxxY91DeQm5oiXnvoqi4qu4dP3Fb6+qOZEEs5
         Fpz1QaGb3ncdk+mJ7JEAEKA+ohVC70MxptztxWj+IvmWDlbkX3xS7rbuTgFfV4NrYA6Y
         fSrnBNM3ejPZmxln6kiNN9rhIznASP17lnicZCk8yXyTqOSdEcxwgKtxFk9lmAWbZLN7
         Dhm3CZCGfamAP2wRXOIdpYvZF0Ih/bnsU6o0ZG7QSonrLa7ohG0/wCzNmOXfSvZzgJHt
         sNJw==
X-Gm-Message-State: ACgBeo2oID+GCtKc3evJBTqNKd9KZ/O5RqJldz3VXEx9CDEkssf/G7me
	ZhAvB1k0nKWAi3EohzneTjEEViDReJ2nMPfI
X-Google-Smtp-Source: 
 AA6agR6akDe7LymLiwk01qXl58qjHA7+JbMKq8PHNXI8Mfr7AP0cMFjlL/mJjyuwvurh41LuHAtqAQ==
X-Received: by 2002:aa7:80d0:0:b0:52d:f9c6:bb14 with SMTP id
 a16-20020aa780d0000000b0052df9c6bb14mr16428197pfn.57.1662764807023;
        Fri, 09 Sep 2022 16:06:47 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h37-20020a631225000000b0041d322b3bf6sm1004639pgl.77.2022.09.09.16.06.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 16:06:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/7] Pull request (cover letter only)
Date: Fri,  9 Sep 2022 13:06:37 -1000
Message-Id: <cover.1662764729.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 23:06:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170510

The following changes since commit 345193f36d08cfe4899c65e8edf3f79db09c50d2:

  relocate_sdk.py: ensure interpreter size error causes relocation to fail (2022-08-29 05:02:16 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Hitendra Prajapati (1):
  sqlite: CVE-2022-35737 assertion failure

Joshua Watt (1):
  classes: cve-check: Get shared database lock

Ranjitsinh Rathod (2):
  libarchive: Fix CVE-2021-23177 issue
  libarchive: Fix CVE-2021-31566 issue

Richard Purdie (1):
  vim: Upgrade 9.0.0242 -> 9.0.0341

Robert Joslyn (1):
  curl: Backport patch for CVE-2022-35252

Ross Burton (1):
  cve-check: close cursors as soon as possible

 meta/classes/cve-check.bbclass                |  36 ++--
 .../recipes-core/meta/cve-update-db-native.bb |  51 ++---
 .../libarchive/CVE-2021-23177.patch           | 183 ++++++++++++++++++
 .../libarchive/CVE-2021-31566-01.patch        |  23 +++
 .../libarchive/CVE-2021-31566-02.patch        | 172 ++++++++++++++++
 .../libarchive/libarchive_3.4.2.bb            |   3 +
 .../curl/curl/CVE-2022-35252.patch            |  72 +++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   1 +
 .../sqlite/files/CVE-2022-35737.patch         |  29 +++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |   1 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 11 files changed, 535 insertions(+), 40 deletions(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2021-23177.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2021-31566-01.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2021-31566-02.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-35252.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2022-35737.patch

-- 
2.25.1


