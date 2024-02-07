Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A36C4828D
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 21:45:31 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.2634.1707342325484597844
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 13:45:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Vi3umpTS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 71F661BF209;
	Wed,  7 Feb 2024 21:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707342323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e98aZ2QPrJCFFYr4dtDK4DKNv/x7JONTvIARzELWsyQ=;
	b=Vi3umpTSPHRiRo1fSKapmxj5TnrDU5BitHeMiU9jI/PdpsUV1Q/2owjk7JmKDCgnQiycVj
	x/jbcvCLcadMhGD+O+iMVAnj0/m5760z/JrViTVoho/UrLcOU9qvDzs52+AFKkNbdJyvpo
	lNhXZL3oj9UwGIFHRkxeED+Bpb81Ff4bn1FNZDtfT0Tv1OxCFia9QXIsl0WrWX0HVcnkwa
	/Tl+Akvp0NKZ+cno/96MZfQaDSyX+I/E070bVYNnWXPIWZ1EiE+hPcMFwUI4SBUDG7Slu4
	mSVYi+hzhShD7vRthnjJRbt2hhEf0ByaOanbPFnI6paegP9TmnZbCs+YHvw3hg==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 2/4] alsa-tools: upgrade 1.2.10 -> 1.2.11
Date: Wed,  7 Feb 2024 22:45:05 +0100
Message-Id: <20240207214507.3603517-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240207214507.3603517-1-michael.opdenacker@bootlin.com>
References: <20240207214507.3603517-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 21:45:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195081

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Upstream release update
  See https://www.alsa-project.org/wiki/Detailed_changes_v1.2.10_v1.2.11
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


