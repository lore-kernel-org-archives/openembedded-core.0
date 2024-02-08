Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E29C4829A
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 08:44:25 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.13546.1707381857082521328
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 00:44:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AOjwwflb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9539460003;
	Thu,  8 Feb 2024 08:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707381855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0gGj06g8cTtghYUEKgR8zFe6781fwACSIOoNojBGpy8=;
	b=AOjwwflbvCnCGR3nh/7Gu61m8KS2Jd0uzt39BNLqB8urkpMT2wS8I4QsHEMRGXvq/Iq+z1
	b2e09ntmMTM3fgpPfRQQKdJ/PR5FtqoOIUMPnF7yyju088WGTE4qinJKuU3DwtKzVeuaSF
	7XnrIoHIOQ4H9rRZY6f5ddtvj94hU851S7tIMtPGwz6fR94h4bYrJKd7IxVQMH6BumS3sS
	QlemsPFR4c90CUPcoo9TMOg1pSfKhSZbmO1MxzEqYzepAQs/yJyw24Aehl3JgQzApo1vW0
	wgBFuLxBUD3jPJpJ+tRxXUtGMaugZ7rinuoRHL3n37XfXJFLpZljNN30TSi4uA==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH v3 2/4] alsa-tools: upgrade 1.2.5 -> 1.2.11
Date: Thu,  8 Feb 2024 09:44:04 +0100
Message-Id: <20240208084406.3621627-3-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240208084406.3621627-1-michael.opdenacker@bootlin.com>
References: <20240208084406.3621627-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 08:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195116

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Upstream release update
  See https://www.alsa-project.org/wiki/Detailed_changes_v1.2.10_v1.2.11

---

Changes in V2:
- Fix commit title, correcting updated version for alsa-tools

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../alsa/{alsa-tools_1.2.5.bb => alsa-tools_1.2.11.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-tools_1.2.5.bb => alsa-tools_1.2.11.bb} (97%)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.2.11.bb
similarity index 97%
rename from meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb
rename to meta/recipes-multimedia/alsa/alsa-tools_1.2.11.bb
index 56acc84559..53868041c0 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.2.5.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.2.11.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=59530bdf33659b29e73d4adb9f9f65
 
 SRC_URI = "https://www.alsa-project.org/files/pub/tools/${BP}.tar.bz2"
 
-SRC_URI[sha256sum] = "35a71027a01f4d7de4722e223520e940de68b3c570b6c671691567ae28f9893e"
+SRC_URI[sha256sum] = "0915c9634a502fd3655ca9c574d259bc9e79983d91d45aeacff6f3c00f8ae3e9"
 
 inherit autotools-brokensep pkgconfig
 # brokensep as as10k1 (and probably more) fail out of tree
-- 
2.34.1


