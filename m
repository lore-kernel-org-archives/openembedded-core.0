Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1EFFCA5FE2
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 07:36:36 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6164.1790926589974183839
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 00:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=f9vWskNl;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3C3734E4110E
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Oct 2026 07:36:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 12451603DC
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Oct 2026 07:36:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 064FA1032845D;
	Fri,  2 Oct 2026 09:36:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790926587; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UVB/cDC1xT11QWu7wo9wWfGapfmcFg4lYJEZtBvQYKI=;
	b=f9vWskNlJo/g7SHKqjZSqp5JmAulFwcAlrNXOixiM4fD+h5aRhicZEMz8hITtPtXWYa0gQ
	ypWy9EMdBLx6PvTXgbW6Il4tu3MyqWJb6uESkBJllx27z+NB7SJJUtmL1Bkrfr/Ag3fNtM
	/D6p5hGoja9nbku6K6KT/LKjZE2oJbeMdLQrshDsgiGI+mZw/5AWsKfQ3PEt1w5WGERUz+
	CHdDEIiPWuBTUBqtx8cK4dbM47Zn8Dtv4fRCDcZ2eQPl2zX6YFkSNwXW0jFqsdalikV44j
	529AxJwducA96Jt+fwtu4ltLxZ4IIJkWDkLhJQ5GZ9iqmONAbc7jOc/cOvYCXg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 02 Oct 2026 09:36:07 +0200
Subject: [PATCH 4/9] python3-pdm-backend: upgrade 2.4.10 -> 2.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-mathieu-2026-10-01-upgrades-v1-4-3fdeab391403@bootlin.com>
References: <20261002-mathieu-2026-10-01-upgrades-v1-0-3fdeab391403@bootlin.com>
In-Reply-To: <20261002-mathieu-2026-10-01-upgrades-v1-0-3fdeab391403@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790926581; l=1108;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=zpFdjmcF7XIg0fUaXPx/uWPjDv5zB5y9K74drtWQP9Q=;
 b=sp1yjQ+r9K00dtuGPl72eyFp/LZTLxcNnUNlY4OB2pCjkN5INORDm0F3JhALb2bSLBqYTjLc2
 AjG8x5rq/vZC5DL0UOX6gT9Z/NuLpkVE8UzvRNLAm4Fnl6tn5bBc7Z2
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 07:36:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247077

Changelog:
- Update vendored libraries to latest versions

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../{python3-pdm-backend_2.4.10.bb => python3-pdm-backend_2.5.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pdm-backend_2.4.10.bb b/meta/recipes-devtools/python/python3-pdm-backend_2.5.0.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-pdm-backend_2.4.10.bb
rename to meta/recipes-devtools/python/python3-pdm-backend_2.5.0.bb
index 2f68172a4ae2..1b1fe13d3616 100644
--- a/meta/recipes-devtools/python/python3-pdm-backend_2.4.10.bb
+++ b/meta/recipes-devtools/python/python3-pdm-backend_2.5.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a564297b3c5b629a528b92fd8ff61ea"
 
-SRC_URI[sha256sum] = "551b049379d4f270cba18f5bf73031cc229a4f883e085265465d326d4a636861"
+SRC_URI[sha256sum] = "7953b994563d3151755e3364b9d0cfe817ed0eaecdf27c8f777f412d26bcd98a"
 
 inherit pypi python_pep517
 

-- 
2.47.3


