Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7C9AC433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 16:32:10 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web09.378.1637080325948614472
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 08:32:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="214448469"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800";
   d="scan'208";a="214448469"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 08:32:09 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800";
   d="scan'208";a="535956671"
Received: from mmohdso1-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.237.91])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 08:32:08 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 03/17] squashfs-tools: follow-up fix for
 CVE-2021-41072
Date: Wed, 17 Nov 2021 00:31:44 +0800
Message-Id: 
 <722c8fbe68a6236f9391eb0ded4c11efd6962de5.1637080067.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637080067.git.anuj.mittal@intel.com>
References: <cover.1637080067.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 16:32:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158351

From: Kai Kang <kai.kang@windriver.com>

Squash a follow-up fix for CVE-2021-41072 from upstream:
https://github.com/plougher/squashfs-tools/commit/19fcc93

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 70709ff0741ed9fb9c111ef4b7aa2ee7432453f4)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
2.33.1


