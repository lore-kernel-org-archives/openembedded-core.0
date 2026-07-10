Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 592FDC43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 07:48:23 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7986.1783669697652992537
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 00:48:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=OQ6runeB;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 722821A0F23;
	Fri, 10 Jul 2026 07:48:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3F2FE60342;
	Fri, 10 Jul 2026 07:48:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7DBF611BD240D;
	Fri, 10 Jul 2026 09:48:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783669694; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=fdasboYcpwdcVcxLYPT12iUBLTSWgT9sqnFIhOcXamg=;
	b=OQ6runeBWCN1Rua6EIkQyqR3hcmPL8wJ7VuJ9E8SLP17QM5rDXhH7Lkv6tiX0ym2hM5cbk
	ggPm5k8cFu/rLjgpOECK2SX3zaFO0NBpxq96OBOTqs8MFmMLKN1aQAwnsl+gBElQUAHhvf
	DeFEqGFkQZLF6VEW89KVtqOP8g8x9YvZl3w0tSjAOAJkTLxlLEizZV4O9+SpSdwjzxPWWo
	8K4z4xTOotipqQQPJYYKGyNkY5jWCCvbvQfzVuKwha2If07oC42eZrKClwUzhzbqNRpOui
	GrHVHuo5JtX69WVVfWkg00ibVsnPcgTXE4Crx++NteuftTss073Tl7EySBTbIA==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Fri, 10 Jul 2026 09:48:13 +0200
Subject: [PATCH] python3: add back Co-authored-by in CVE-2026-11972 patch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-fix-cves-python-master-fix-v1-1-653636ec864b@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrDuQ+FNpr1JcxDjWEYySSUNFv
 LtRl99bvA2EPJPAO9vAU2Th2SXoRwZ2MO5LyF0y5Cp/qlor7PmPNpLgsoZhdjgZCeSvrAujy+L
 Vt3VXQRosnlK+5p/mtvzakWw4j7DvByNE9H9+AAAA
X-Change-ID: 20260710-fix-cves-python-master-fix-13a1439fb7d5
To: openembedded-core@lists.openembedded.org
Cc: olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 yoann.congal@smile.fr, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 07:48:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240602

It had been deleted by mistake due to a lack of knowledge regarding how
to handle it.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 meta/recipes-devtools/python/python3/CVE-2026-11972.patch | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-11972.patch b/meta/recipes-devtools/python/python3/CVE-2026-11972.patch
index 7dc9c6697112..12a79754febd 100644
--- a/meta/recipes-devtools/python/python3/CVE-2026-11972.patch
+++ b/meta/recipes-devtools/python/python3/CVE-2026-11972.patch
@@ -4,6 +4,8 @@ Date: Tue, 23 Jun 2026 15:13:30 +0200
 Subject: [PATCH 2/2] gh-151981: Make tarfile._Stream.seek break at EOF
  (GH-151982)
 
+Co-authored-by: Stan Ulbrych <stan@python.org>
+
 CVE: CVE-2026-11972
 Upstream-Status: Backport [https://github.com/python/cpython/commit/f50bf13566189c8d0ce5a814f33eff3d89951896]
 

---
base-commit: 5a5f2ec43cbb9096f1fc52ba4c2a4f94526f103d
change-id: 20260710-fix-cves-python-master-fix-13a1439fb7d5

Best regards,
--  
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


