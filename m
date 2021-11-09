Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9510FC433F5
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 02:04:16 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.6443.1636423455196608718
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 18:04:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1A924ADh001528
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 8 Nov 2021 18:04:10 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 8 Nov 2021 18:04:09 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Mon, 8 Nov 2021 18:04:09 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 8 Nov 2021 18:04:08 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] squashfs-tools: follow-up fix for CVE-2021-41072
Date: Tue, 9 Nov 2021 10:04:05 +0800
Message-ID: <20211109020405.6549-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 02:04:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157997

From: Kai Kang <kai.kang@windriver.com>

Squash a follow-up fix for CVE-2021-41072 from upstream:
https://github.com/plougher/squashfs-tools/commit/19fcc93

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../squashfs-tools/squashfs-tools/CVE-2021-41072.patch      | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools/CVE-2021-41072.patch b/meta/recipes-devtools/squashfs-tools/squashfs-tools/CVE-2021-41072.patch
index 94d6da4b14..f807af60bc 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools/CVE-2021-41072.patch
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools/CVE-2021-41072.patch
@@ -1,6 +1,10 @@
 CVE: CVE-2021-41072
 Upstream-Status: Backport [https://github.com/plougher/squashfs-tools/commit/e048580]
 
+Update on 20211109:
+Squash a follow-up fix for CVE-2021-41072 from upstream:
+https://github.com/plougher/squashfs-tools/commit/19fcc93
+
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 
 From e0485802ec72996c20026da320650d8362f555bd Mon Sep 17 00:00:00 2001
@@ -65,7 +69,7 @@ index 7262a2e..1b544ed 100755
  
  unsquash-1234.o: unsquash-1234.c unsquashfs_error.h
  
-+unsquash-1234.o: unsquash-12.c
++unsquash-12.o: unsquash-12.c unsquashfs.h
 +
  unsquashfs_xattr.o: unsquashfs_xattr.c unsquashfs.h squashfs_fs.h xattr.h unsquashfs_error.h
  
-- 
2.17.1


