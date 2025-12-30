Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E209BE95A65
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 09:17:49 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61209.1767086266096790341
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 01:17:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AO7liny9;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767086266; x=1798622266;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zlRG0QoSlqE8cGZrj5tkVcc6DP1Dyq+z8NjQA7MscqE=;
  b=AO7liny9/OmOf0dTbzeVhFTqTqgmk/ozMpuNjy0b7V9nNPtllokdLm2E
   uWUS7NpSnRE6pZBihV5AdAYybRoKN9GG8K+9PxEjJy5CZnTFLF6ZhraWS
   xPtqVRLu6aFGEWe+tSCGCGVIYcwZn9yEgm4o/RlW5BMnrCY7ZAJCfuruK
   tAhR1gAS5rlaOdz0gxp/h0n2kKE9Ruj2tVa6tLc1QJLXEua1iCIpGAZwD
   3H6WwUPow3WeXY6UziXAT8aJSuDgV7DL/Wfk+16xOWzNFmW345KQTdfFt
   rOZrsIdmBT77A+3KMeQv6nsMHw8mAORGIKBVKYl6/lwne5AI4MB5IGNeF
   w==;
X-CSE-ConnectionGUID: xyP+JL1yRXmKU3Z+kMcBJg==
X-CSE-MsgGUID: TblYzkIoS5SycvMFPJhlPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="224937042"
X-IronPort-AV: E=Sophos;i="6.21,188,1763391600"; 
   d="scan'208";a="224937042"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 18:17:44 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 7D7031C1C701
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:44 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 307EB1400381
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 9D95C1800594;
	Tue, 30 Dec 2025 09:17:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/12] quota: upgrade 4.10 -> 4.11
Date: Tue, 30 Dec 2025 17:17:09 +0800
Message-ID: <20251230091714.1501-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251230091714.1501-1-wangmy@fujitsu.com>
References: <20251230091714.1501-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228650

From: Wang Mingyu <wangmy@fujitsu.com>

0001-setproject-Fix-openWRT-build.patch
removed since it's included in 4.11

Changelog:
============
* rquota_server: Fix group presence checking
* Drop support for V0 and V1 kernel interfaces
* Drop support for old quotactl(2) syscall
* Provide quotactl_mnt() helper and use it where possible
* quotaon: Fix handling of filesystems without single device
* setproject: Fix openWRT build
* setproject: fix openat() call

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-setproject-Fix-openWRT-build.patch   | 30 -------------------
 .../quota/{quota_4.10.bb => quota_4.11.bb}    |  6 ++--
 2 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-extended/quota/quota/0001-setproject-Fix-openWRT-build.patch
 rename meta/recipes-extended/quota/{quota_4.10.bb => quota_4.11.bb} (87%)

diff --git a/meta/recipes-extended/quota/quota/0001-setproject-Fix-openWRT-build.patch b/meta/recipes-extended/quota/quota/0001-setproject-Fix-openWRT-build.patch
deleted file mode 100644
index 8ca3d9f773..0000000000
--- a/meta/recipes-extended/quota/quota/0001-setproject-Fix-openWRT-build.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 41ba7031ca4852739dd1f66102d34e4a98490906 Mon Sep 17 00:00:00 2001
-From: Jan Kara <jack@suse.cz>
-Date: Tue, 1 Jul 2025 15:41:56 +0200
-Subject: [PATCH] setproject: Fix openWRT build
-
-basename() needs libgen.h include in openWRT build environment. Add it.
-
-Reported-by: "W. Michael Petullo" <mike@flyn.org>
-Signed-off-by: Jan Kara <jack@suse.cz>
-
-Upstream-Status: Backport [https://sourceforge.net/p/linuxquota/code/ci/41ba7031ca4852739dd1f66102d34e4a98490906/]
-
-This also fixes the build in Yocto.
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- setproject.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/setproject.c b/setproject.c
-index e688dcd..4308435 100644
---- a/setproject.c
-+++ b/setproject.c
-@@ -13,6 +13,7 @@
- #include <sys/stat.h>
- #include <sys/types.h>
- #include <unistd.h>
-+#include <libgen.h>
- 
- #include <linux/fs.h>
- 
diff --git a/meta/recipes-extended/quota/quota_4.10.bb b/meta/recipes-extended/quota/quota_4.11.bb
similarity index 87%
rename from meta/recipes-extended/quota/quota_4.10.bb
rename to meta/recipes-extended/quota/quota_4.11.bb
index 8f9e4fdf34..b386071961 100644
--- a/meta/recipes-extended/quota/quota_4.10.bb
+++ b/meta/recipes-extended/quota/quota_4.11.bb
@@ -7,10 +7,8 @@ LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://rquota_server.c;beginline=1;endline=20;md5=fe7e0d7e11c6f820f8fa62a5af71230f \
                     file://svc_socket.c;beginline=1;endline=17;md5=24d5a8792da45910786eeac750be8ceb"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/linuxquota/quota-tools/${PV}/quota-${PV}.tar.gz \
-           file://0001-setproject-Fix-openWRT-build.patch \
-           "
-SRC_URI[sha256sum] = "a04a0cafca29c15be8b6ac660e06188bccb802c19efe2e7c19ed7f3d667ecf5e"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/linuxquota/quota-tools/${PV}/quota-${PV}.tar.gz"
+SRC_URI[sha256sum] = "0a51b8f920254d8e83c34a4c3082b7d241f5d6fd65188afadf29859d5223ef78"
 
 CVE_PRODUCT = "linux_diskquota"
 
-- 
2.43.0


