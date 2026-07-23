Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FACCC4452B
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 04:38:57 +0000 (UTC)
Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16926.1784781527927581851
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 21:38:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.53 with ESMTP; 23 Jul 2026 13:38:45 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.127.86)
	by 156.147.1.125 with ESMTP; 23 Jul 2026 13:38:45 +0900
X-Original-SENDERIP: 10.177.127.86
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [PATCH] bzip2: add bzip2:bzip2 to CVE_PRODUCT
Date: Thu, 23 Jul 2026 13:38:43 +0900
Message-ID: <20260723043843.510113-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 04:38:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241765

From: "mark.yang" <mark.yang@lge.com>

The CERT-PL record for CVE-2026-42250 carries bzip2:bzip2 in its
affected entry [1], which the bzip:bzip2 pin does not cover, so tools
consuming CNA identities cannot connect the in-tree
CVE-2026-42250.patch to the CVE. NVD has not analysed the entry yet
and currently mirrors the same bzip2:bzip2 identity.

[1] https://www.cve.org/CVERecord?id=CVE-2026-42250

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
index 39f0f6749d..3bc74d74aa 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -67,7 +67,7 @@ FILES:libbz2 = "${libdir}/lib*${SOLIBS}"
 
 RDEPENDS:${PN}-ptest += "make bash"
 
-CVE_PRODUCT = "bzip:bzip2"
+CVE_PRODUCT = "bzip:bzip2 bzip2:bzip2"
 
 PROVIDES:append:class-native = " bzip2-replacement-native"
 BBCLASSEXTEND = "native nativesdk"

