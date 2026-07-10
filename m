Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9BAC44507
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 07:44:23 +0000 (UTC)
Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7958.1783669459323100269
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 00:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.53 with ESMTP; 10 Jul 2026 16:44:16 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.127.86)
	by 156.147.1.151 with ESMTP; 10 Jul 2026 16:44:16 +0900
X-Original-SENDERIP: 10.177.127.86
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [PATCH 2/4] python3-ply: set CVE_PRODUCT and CVE_STATUS for CVE-2025-56005 as disputed
Date: Fri, 10 Jul 2026 16:43:02 +0900
Message-ID: <20260710074415.3341616-2-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710074415.3341616-1-mark.yang@lge.com>
References: <20260710074415.3341616-1-mark.yang@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 07:44:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240601

From: "mark.yang" <mark.yang@lge.com>

For python3-ply, the CVE_PRODUCT should be set to ply, not python:ply.
NVD registers ply as dabeaz:ply, so the default python:ply vendor prefix never matches and no CVEs are reported.

CVE-2025-56005 is disputed.
See https://nvd.nist.gov/vuln/detail/CVE-2025-56005

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta/recipes-devtools/python/python3-ply_3.11.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-ply_3.11.bb b/meta/recipes-devtools/python/python3-ply_3.11.bb
index 2c5fa3f215..ce45bbc1bd 100644
--- a/meta/recipes-devtools/python/python3-ply_3.11.bb
+++ b/meta/recipes-devtools/python/python3-ply_3.11.bb
@@ -14,4 +14,8 @@ RDEPENDS:${PN}:class-target += "\
     python3-shell \
 "
 
+CVE_PRODUCT = "ply"
+# https://nvd.nist.gov/vuln/detail/CVE-2025-56005 Disputed
+CVE_STATUS[CVE-2025-56005] = "disputed: PoC fails to demonstrate code execution; picklefile is a developer-controlled parser-table cache parameter"
+
 BBCLASSEXTEND = "native nativesdk"

