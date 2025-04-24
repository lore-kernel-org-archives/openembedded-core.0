Return-Path: <thond2009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0817C369CB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 02:44:20 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web10.6154.1745462652065465809
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 19:44:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: gmail.com, ip: 156.147.23.51, mailfrom: thond2009@gmail.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.51 with ESMTP; 24 Apr 2025 11:44:10 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: thond2009@gmail.com
Received: from unknown (HELO tho3-nguyen-weboscsm.bee-live.svc.cluster.local) (10.185.60.121)
	by 156.147.1.125 with ESMTP; 24 Apr 2025 11:44:10 +0900
X-Original-SENDERIP: 10.185.60.121
X-Original-MAILFROM: thond2009@gmail.com
From: Nguyen Dat Tho <thond2009@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Nguyen Dat Tho <tho3.nguyen@lge.com>
Subject: [scarthgap][PATCH] libatomic-ops: Update GITHUB_BASE_URI
Date: Thu, 24 Apr 2025 11:43:45 +0900
Message-Id: <20250424024345.14706-1-thond2009@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 02:44:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215323

From: Nguyen Dat Tho <tho3.nguyen@lge.com>

libatomic-ops moves to new repo https://github.com/ivmai/libatomic_ops
according to topic: https://github.com/bdwgc/libatomic_ops/issues/66

Signed-off-by: Nguyen Dat Tho <tho3.nguyen@lge.com>
---
 meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb
index 824400e743..6269133408 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A library for atomic integer operations"
 DESCRIPTION = "Package provides semi-portable access to hardware-provided atomic memory update operations on a number of architectures."
-HOMEPAGE = "https://github.com/ivmai/libatomic_ops/"
+HOMEPAGE = "https://github.com/bdwgc/libatomic_ops/"
 SECTION = "optional"
 PROVIDES += "libatomics-ops"
 LICENSE = "GPL-2.0-only & MIT"
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libatomic_ops-${PV}.tar.gz"
-GITHUB_BASE_URI = "https://github.com/ivmai/libatomic_ops/releases"
+GITHUB_BASE_URI = "https://github.com/bdwgc/libatomic_ops/releases"
 
 SRC_URI[sha256sum] = "d305207fe207f2b3fb5cb4c019da12b44ce3fcbc593dfd5080d867b1a2419b51"
 
-- 
2.34.1


