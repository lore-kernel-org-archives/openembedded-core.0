Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39AC2C44509
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 23:44:40 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8966.1783986271721842357
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 16:44:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.51 with ESMTP; 14 Jul 2026 08:44:28 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.127.86)
	by 156.147.1.127 with ESMTP; 14 Jul 2026 08:44:28 +0900
X-Original-SENDERIP: 10.177.127.86
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>,
	Paul Barker <paul@pbarker.dev>
Subject: [PATCH v2 2/4] python3-ply: set CVE_PRODUCT
Date: Tue, 14 Jul 2026 08:44:15 +0900
Message-ID: <20260713234417.4071754-2-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713234417.4071754-1-mark.yang@lge.com>
References: <20260713234417.4071754-1-mark.yang@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 23:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240855

From: "mark.yang" <mark.yang@lge.com>

NVD registers ply as dabeaz:ply, so the default python:ply vendor
prefix never matches and no CVEs are reported. Use the exact
vendor:product pair.

CVE-2025-56005 will then show as unpatched; no fixed release exists.

Suggested-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: mark.yang <mark.yang@lge.com>
---
v2: use exact vendor:product pair; drop CVE_STATUS

 meta/recipes-devtools/python/python3-ply_3.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-ply_3.11.bb b/meta/recipes-devtools/python/python3-ply_3.11.bb
index 2c5fa3f215..06393ac4fe 100644
--- a/meta/recipes-devtools/python/python3-ply_3.11.bb
+++ b/meta/recipes-devtools/python/python3-ply_3.11.bb
@@ -14,4 +14,6 @@ RDEPENDS:${PN}:class-target += "\
     python3-shell \
 "
 
+CVE_PRODUCT = "dabeaz:ply"
+
 BBCLASSEXTEND = "native nativesdk"

