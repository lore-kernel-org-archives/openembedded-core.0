Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3470CC79FAF
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 09:58:43 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3544.1788861519293871751
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 02:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=iE6L+hU/;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9F0E01A1A5A
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 09:58:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 756B4603C4
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 09:58:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BAC7E11C7AF49;
	Tue,  8 Sep 2026 11:58:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788861517; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hFdH7Ds0+Y44HayR+Cw/vIXnKFRH2U9QEtKPXgrXmYo=;
	b=iE6L+hU/O/Mf/yfDv4O2bAtJ7fiwB9oXb5S0TZTa/r8G4aXmekLVT5gdwxdJ/SmzdMa27p
	FSCaK1mz4Gcc2PsykjnONafLjvVFi9MJKc0WHw6Huf0cIfafheNXCfHxbLmty2z0a1uXjP
	mdz/3UdjI4XW5CwSpVs/YY/qfSRfS0+D3czLVQYlx0FvS7tKAl1S/7MmUrzPKnDa/9/b6f
	eFslj6YhvpjInnN86koVX5n1hbwu12eqYK/WtGiAXkXhoW8+/5Oz3l3AcCG5an9Iw74YTl
	vjb7DF+6/0hMqsnqO4Pl0u3ArT24z3e50XRyUhLsUIb90e2g7m6S1QmQd8+bXQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Tue, 08 Sep 2026 11:58:25 +0200
Subject: [PATCH 03/10] gstreamer1.0-python: upgrade 1.28.6 -> 1.28.7
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-mathieu-gstreamer-1-28-7-v1-3-9694738804f6@bootlin.com>
References: <20260908-mathieu-gstreamer-1-28-7-v1-0-9694738804f6@bootlin.com>
In-Reply-To: <20260908-mathieu-gstreamer-1-28-7-v1-0-9694738804f6@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788861512; l=1294;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=k7DHmQ+uuRVALMbdfbbEFDA6d17PjfX9BiaHjwWwBoU=;
 b=qRFy/Wh0GzNHE05t/cccnKDv99xqSjPz9q/c+hvznjD4JW/5wE2xvsf/D8YDSejS5Mldd3eoy
 pt9IIADBcFQBINKwJkbcrWf5gWwqBPgb4vMVaqCu/kyEg1TwMBJ9lIb
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 09:58:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245343

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../{gstreamer1.0-python_1.28.6.bb => gstreamer1.0-python_1.28.7.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.7.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.7.bb
index 9e1e0ae64ade..1b17accd4159 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.7.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "34d58440c53b5495a123d0a4b7b7abbc6e9792a5b21954db86a0791b16f6e012"
+SRC_URI[sha256sum] = "9c23c5dddfd2c9b94bb1b4e4f5b90ebc6400d84277c77cf91b1dbdb4a8b451f9"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstreamer1.0-plugins-bad"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"

-- 
2.47.3


