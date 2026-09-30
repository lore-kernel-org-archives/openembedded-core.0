Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C5A2CA5FC6
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 08:17:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8498.1790756224679646010
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 01:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=RitSTU6n;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1479B1A107D
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DE0E160749
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36DC3103298B8;
	Wed, 30 Sep 2026 10:17:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790756222; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=P21AmhZmzU/hapIwYLGjThN/sP835uU7GHRKsdSLzmo=;
	b=RitSTU6n4nJgXgRLzIzN+qD7n8Jlud3M8UWk5EKfM72by2Tgyz1+4esInUGXE3rBAEKsv2
	VXwoZOY7j/Ztejf3escIUGVNMMSZ+URO7Bx/v2olNeB85cjs7s7hsB8RvWCb67OeCdfHVH
	Cd7Gdikb/ETSKKKuXPPf0ocCM7p6NlaL5vQcSnCGipop2+Ck49AMznJoIxqcWHyiQ35Nqm
	jUIru6KYihAz29c2ugkE8jfPvPHnlDO2PGghs23c3J4SgixqJUKAJj5WaLXzOxzGy0QO3E
	5ILHDa9hcsHmJn50SJPKrwg1g/BMG03lHxYz6b2YdCxQ5sE/1GBCC+bpSP2OBw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 30 Sep 2026 10:16:44 +0200
Subject: [PATCH 19/24] vulkan-volk: upgrade 1.4.357.0 -> 1.4.363.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mathieu-upgrades-2026-02-29-v1-19-102c38be04df@bootlin.com>
References: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
In-Reply-To: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790756204; l=1029;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=GtSYQm+4KLp2MhLGMqnZBqFu5QvLU9D+Emfe6t8nDo8=;
 b=OUDb6dWf3WdDEezJ6FcffCGouTl9rCCk09N+dJ/td6Sl1Y2aV+DnExeIUHDZ1qiN+768mvYfU
 D/wVx+LQ8eJB1bCW/rYlgHh4fkngLCq9wzPg90wZE46mUEo32N52cPT
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246943

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../vulkan/{vulkan-volk_1.4.357.0.bb => vulkan-volk_1.4.363.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.357.0.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.363.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-volk_1.4.357.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-volk_1.4.363.0.bb
index 4e8504ed6605..b336428595a6 100644
--- a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.357.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.363.0.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=cfcbdd69e15396e371f639c69acf40bf"
 
 SRC_URI = "git://github.com/zeux/volk.git;branch=master;protocol=https;tag=vulkan-sdk-${PV}"
-SRCREV = "776893306c5d3b22b6185b5d4a258b81d94572bf"
+SRCREV = "54fc0d7a72887cbfc5b030d26897b2b40ac53fb8"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 

-- 
2.47.3


