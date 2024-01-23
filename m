Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5379BC47DDC
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 08:47:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.7669.1705999661163650396
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 00:47:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=G8zqRaNi;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705999661; x=1737535661;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=b2VACjQqp54oc4Ds3y68WvJJ874KZJAeKMpLT+UQlbI=;
  b=G8zqRaNiTB/Neke4/7wmCY1jNwL7WR43yv4PyjP3hMm+vPqmy4j8dinB
   xF9FmlFaW2uUI+7vFcDUrPD+LKRxC+S9u0374FeA5/LDosJwa7mf7QNS/
   HsDibBvlYPAfNemG00+508lx7smIISkzfyZC5hxI2NQMUvxG0+M8JXr/Z
   xTSliOUjiJkUvpTuWz/QctqQvnuH3Ji5LhrQ8JLtOj06ghOBVrDEXY5dD
   omcpZHWE8497IJJ6/tyV5OOJ8MMS4G/Na/3J5gJ5HzDYfZ62u58HbkAZX
   BYGOCt71UMZlwW6Mj9p4K36GetAKJtBf0yls11H/5V3kJoPhMqYOE+qDv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="432617023"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; 
   d="scan'208";a="432617023"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 00:47:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="820012987"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; 
   d="scan'208";a="820012987"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.214.153.8])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 00:47:40 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] cronie: upgrade 1.7.0 -> 1.7.1
Date: Tue, 23 Jan 2024 16:47:32 +0800
Message-ID: <20240123084734.223154-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123084734.223154-1-anuj.mittal@intel.com>
References: <20240123084734.223154-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 08:47:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194215

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../cronie/cronie/crond_pam_config.patch               | 10 ++++++++++
 .../cronie/{cronie_1.7.0.bb => cronie_1.7.1.bb}        |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)
 rename meta/recipes-extended/cronie/{cronie_1.7.0.bb => cronie_1.7.1.bb} (97%)

diff --git a/meta/recipes-extended/cronie/cronie/crond_pam_config.patch b/meta/recipes-extended/cronie/cronie/crond_pam_config.patch
index c374790d1da..464d1470e3a 100644
--- a/meta/recipes-extended/cronie/cronie/crond_pam_config.patch
+++ b/meta/recipes-extended/cronie/cronie/crond_pam_config.patch
@@ -1,9 +1,19 @@
+From f5b325cba73018e5be984570fd4e680e59e7865d Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
+Date: Wed, 20 Jul 2011 02:42:28 +0000
+Subject: [PATCH] cronie: enable PAM support for cronie
+
 password-auth is the Fedora's common pam configure file, use oe common pam
 configure files instead.
 
 Upstream-Status: Pending
 
 Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+
+---
+ pam/crond | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
 diff --git a/pam/crond b/pam/crond
 index 560529d..95a6457 100644
 --- a/pam/crond
diff --git a/meta/recipes-extended/cronie/cronie_1.7.0.bb b/meta/recipes-extended/cronie/cronie_1.7.1.bb
similarity index 97%
rename from meta/recipes-extended/cronie/cronie_1.7.0.bb
rename to meta/recipes-extended/cronie/cronie_1.7.1.bb
index 24c419b1c55..854b68163c3 100644
--- a/meta/recipes-extended/cronie/cronie_1.7.0.bb
+++ b/meta/recipes-extended/cronie/cronie_1.7.1.bb
@@ -25,7 +25,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/cronie-${PV}/cronie-${PV}.tar.gz \
 PAM_SRC_URI = "file://crond_pam_config.patch"
 PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
 
-SRC_URI[sha256sum] = "6827f5a47760cc64afeef0a60d3cb5376f52569109fc9a73957dd5e9fdae7619"
+SRC_URI[sha256sum] = "78033100c24413f0c40f93e6138774d6a4f55bc31050567b90db45a2f9f1b954"
 
 inherit autotools update-rc.d useradd systemd github-releases
 UPSTREAM_CHECK_REGEX = "releases/tag/cronie-(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


