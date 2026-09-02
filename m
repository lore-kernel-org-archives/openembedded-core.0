Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C76C624DD
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 15:46:59 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.337.1788364010761974872
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 08:46:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Ig6oJqEn;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 082E31A1965
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 15:46:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D22F36053C
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 15:46:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E1B5E11C79B5A;
	Wed,  2 Sep 2026 17:46:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788364008; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lkKgKKWBZSjFEyFxCD3tFNj584vYyA9JJ/+O5H9JOz4=;
	b=Ig6oJqEntdG/imBxgflhyNjf+5tCTpQSTX8NRMV/z9nQ5CCHvfhFy1zhiFDoLRIXYXC6Ol
	rGTS6jW53a7GjPy2NLha6SRs0vC8hw7Bzwh0XyPA8elNlXIoXwTfJinXSBFqcoFZLB074o
	tV/QvwZnFNeqZOVHAu8SHaSUhwNfGpoXSt4Ld5mvug60AhoLgJQ9ro91y1cl6j+1YGkszb
	tA/CaUnNm/02FHfxsIFzvp9QH01x29tf6kZ6s9eGiUOsNm7HTMMEcQRH+fOEQOW1YC5WkL
	SG3Lq0UE53GhQHklpnCw8cRYADrPSmvjj/W+1kkYUxPAx/yiQMjY2AgEWs+rfA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 02 Sep 2026 17:46:46 +0200
Subject: [PATCH 4/8] mesa-demos: upgrade to latest revision
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-mathieu-updates-2026-09-02-v1-4-039b74833ec7@bootlin.com>
References: <20260902-mathieu-updates-2026-09-02-v1-0-039b74833ec7@bootlin.com>
In-Reply-To: <20260902-mathieu-updates-2026-09-02-v1-0-039b74833ec7@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788364004; l=916;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=UyJAEPlyMjbYKBDPkZ5uYmnULHJha25HkdZ8GiNloME=;
 b=xB0bP+i8Da9Ru5Tg2Tdw+3OYXjfTr5nECqwMFE0vPpGTt3Hs6zxSM0Jp0o+ArmjoPPKiPmrp6
 IV8Irc0ce+NDP/8W3R42wRci411oCBYqmSQ+BydA2oJyEQ9QAXFjNK5
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 15:46:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244977

Changelog:
71b184c3 Add GL ES 1.0 CL version of gears

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
index 784c2d4ad7db..e945538c482d 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=5;md5=2c456
 
 SRC_URI = "git://gitlab.freedesktop.org/mesa/demos.git;protocol=https;branch=main"
 
-SRCREV = "10418e7636cdd9595dda18c3d78a562d7248f734"
+SRCREV = "71b184c379625c91195f5d69186d4de5a1f642ac"
 
 # This recipe doesn't plan to make more releases, so track upstream git commits
 PV .= "+git"

-- 
2.47.3


