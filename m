Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B70C43334
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 14:39:05 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web12.32700.1654526342155868007
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 07:39:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=YYh1Wsk3;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id q123so13061310pgq.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 07:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uxYDRepy19ho45UGnfPN37ye2v2ZV/88OLE1o6xXfrM=;
        b=YYh1Wsk395vvudN0aNABlLOE5AcEH5i56ztewbo61WoVK8Q/AvNHMoqTUaxzV0QWYA
         sZM7fbzi5Hlm0Nb0K7nbaUmHEi2rANv+J/w/2xscQB7vmHII5pbocueNcAC1xa2uxQPC
         /fl1rK0jEdZxzCgRQL/hyaaSnIx/1buDtLGosMUVpe9jVSjZMTLnZTW6h7uYGVCcgAqr
         uL0t4uBIJcLTDUlScYK6Ee5yy1vg2SwPamktaYhm/qc2Sw8buHEOU+S/6JdWi9ZjqvfT
         D0zniaez07RgvM8tdOK3o4ZK8EyAnNp4/XI1CI1H01ld03swMbRo9Xs92oPklMZPLSHD
         HZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uxYDRepy19ho45UGnfPN37ye2v2ZV/88OLE1o6xXfrM=;
        b=YrSARQFn5Ie5kGvYRn+iB6rCM715pi5HZZ5UX6dIgHNfW9s88++MR24LRWqBA/fuNS
         sKVCjz1GfSmokP72WJ+zKrEHY2r8mmuAhzivflGyA7dD38cXYs3asOKGBApk1BVzhgjV
         XndtDzQsd++Ztrcrny1ioDnB6mc5YGLVRchQ2HTaUOTF/ZD7e2vwtIfUioOqRiVmkpD0
         gMNBKNUBOdw7Vm+T8K/O5PGpO6D4gGhmAhj7xJrqmfZVt04RyKO3lfK65MRhlTybL8xD
         9hvEOfFgnb2g6y10L28A1iMA8VrlDekWlYH3bBut3pVPI7OyIQX67hW8HiKbPu7qX+KO
         La2A==
X-Gm-Message-State: AOAM532aZuw+ero0KPzEoS41xxN7BeDWtXx42CKQzQvFhv2ZQdoIVgoU
	tO5YL0TJJ23S17gPakLRPhrCqYytL4O1G9zZ
X-Google-Smtp-Source: 
 ABdhPJzjFQx2rU/ZsCgTqYtjxbuKxMU6LZpzyJ3yPz7+hgzAHf7opsGibJAhZbdHGEAVjydQb88pqA==
X-Received: by 2002:a63:88c6:0:b0:3fc:aa43:7e3b with SMTP id
 l189-20020a6388c6000000b003fcaa437e3bmr21028669pgd.567.1654526341114;
        Mon, 06 Jun 2022 07:39:01 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a5-20020a1709027d8500b0015ea3a491a1sm10544112plm.191.2022.06.06.07.38.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 07:39:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/13] systemd: Drop
 0001-test-parse-argument-Include-signal.h.patch
Date: Mon,  6 Jun 2022 04:38:23 -1000
Message-Id: 
 <752f51e0a5960a0105b7c1a300406d1aa5049b5a.1654526060.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654526060.git.steve@sakoman.com>
References: <cover.1654526060.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 14:39:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166638

From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>

This patch has already been upstreamed in commit systemd/850f0008bff7
("test-parse-argument: Include signal.h") since v249 stable release.

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 25d8defc806ed760d371423a7ef99bd872462d1e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...test-parse-argument-Include-signal.h.patch | 27 -------------------
 meta/recipes-core/systemd/systemd_250.5.bb    |  1 -
 2 files changed, 28 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-test-parse-argument-Include-signal.h.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-test-parse-argument-Include-signal.h.patch b/meta/recipes-core/systemd/systemd/0001-test-parse-argument-Include-signal.h.patch
deleted file mode 100644
index 898e8af904..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-test-parse-argument-Include-signal.h.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 93c7e482d39cf7765974b3c729d29c1b120a60e3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 24 May 2021 18:26:27 -0700
-Subject: [PATCH] test-parse-argument: Include signal.h
-
-Fixes
-src/test/test-parse-argument.c:49:29: error: use of undeclared identifier 'SIGABRT'
-
-Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/19718]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/test/test-parse-argument.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/test/test-parse-argument.c b/src/test/test-parse-argument.c
-index cf3d54288a..15104e5282 100644
---- a/src/test/test-parse-argument.c
-+++ b/src/test/test-parse-argument.c
-@@ -5,6 +5,7 @@
- #include "parse-argument.h"
- #include "stdio-util.h"
- #include "tests.h"
-+#include <signal.h>
- 
- TEST(parse_json_argument) {
-         JsonFormatFlags flags = JSON_FORMAT_PRETTY;
diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
index c121fb763e..aca140d4d4 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -24,7 +24,6 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch \
-           file://0001-test-parse-argument-Include-signal.h.patch \
            file://0001-resolve-Use-sockaddr-pointer-type-for-bind.patch \
            "
 
-- 
2.25.1


