Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B805CA5FE8
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 07:36:38 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6162.1790926587793017986
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 00:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=OitGKBAL;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E26764E41109
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Oct 2026 07:36:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B7106603DC
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Oct 2026 07:36:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D4C0F1032843B;
	Fri,  2 Oct 2026 09:36:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790926585; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bXRo8kcU1z5rh36fYW6d1AcAU6R3EnSoptTFvCil2jc=;
	b=OitGKBALZWkh4M+ysHdVfwR416Ip9I9AHIkgOXxQAfkkKU59oRMkKp1/xvAF+wfv0l6okS
	v7IBuY8wDYsGbu3bdQ8xVMOOJHqHxAQMxA4T7JRrEa6sMfi79KJRobOO6YX36r8+0YFQTp
	F4oLQRkVPnYVIipIVPXUF1Dtrta9AjkeX1qixYQn9TAaRlM9WdUbV5yTmTX4SPOgJU2fFY
	kC6BSvY0Ys6dcAlNiVVA4tvJ48F4y83UE3TDHxrByyMH6n4HtDLkWqVIhZoVjwAiqHAmk/
	D2qhsxMlijFffex7ABqhnh6jSqE5rr9I8hOKlwkhWfv9F9mxF9FKnb53uVw3HQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 02 Oct 2026 09:36:04 +0200
Subject: [PATCH 1/9] python3-uv-build: upgrade 0.12.19 -> 0.12.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-mathieu-2026-10-01-upgrades-v1-1-3fdeab391403@bootlin.com>
References: <20261002-mathieu-2026-10-01-upgrades-v1-0-3fdeab391403@bootlin.com>
In-Reply-To: <20261002-mathieu-2026-10-01-upgrades-v1-0-3fdeab391403@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790926581; l=1197;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=7XAWw0nKihSfl80dWZxcENrP5rs6J8icntUKUeOk6kw=;
 b=mVBDzrEY9AQ07owgkEVJ/Sp6wI7kHZU64x9BiDmhneIDRCK+25zSuNCXdYFViddlpigUtBOM1
 TaImJ1yaVlqABcnSapuOMBZw+vbCnA3lop0rjJ6vSGWXgqVyQnZ1ASe
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 07:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247075

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../python/{python3-uv-build_0.12.20.bb => python3-uv-build_0.12.21.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-uv-build_0.12.20.bb b/meta/recipes-devtools/python/python3-uv-build_0.12.21.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.12.20.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.12.21.bb
index 06ea35d5e429..c2808203f911 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.12.20.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.12.21.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "1d6906511beb61469ca638e1cd97472c9e887c4d03495eba91bab14fd68920c7"
+SRC_URI[sha256sum] = "616d1ecccca300b240e65a88644f8c2996b858ff039f759d717249d28f94a2a6"
 
 require ${BPN}-crates.inc
 

-- 
2.47.3


