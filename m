Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 980F7C79FB1
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 09:58:43 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3680.1788861522552396158
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 02:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=bBZ/8Mvz;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E03EA1A1A5A
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 09:58:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B5EC8603C4
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 09:58:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F1FBA11C7AF50;
	Tue,  8 Sep 2026 11:58:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788861520; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ifIzSlff5aF4JVxcHp3xfLdyBm29rRfh5XMCQ4k0eGI=;
	b=bBZ/8Mvz4wOGFea2upps2CfrMjLGBzZUa0qNH1GJrNpwE1hlqN+syjzmzOA/GPcH6FiWnN
	FrreBkh4Y7N7ks3Gy5QwIp1KHvWsI3NnNoaszbdZWFeSQ9zqtcT2uVr1v6XkAnq1YV6pKf
	AVggSbgZPwEk9En2v3LCgNP9C24eDvtRzwuN/JUrbo5yVuBgvG/dXF5qnmvMW8uMqmyGgU
	JUx990mHFjsgVM8j7TU5rL3N3xDdj2s9307UgkGGDN5gB2RTQ9h86KheLoiu1r9AfbwfBp
	Xl1extf6nZqiydwX+JYIEWFtsvY1PhI3lJSJ8/7jurZ2kJ9eOmcfLKsisQkyKA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Tue, 08 Sep 2026 11:58:30 +0200
Subject: [PATCH 08/10] gstreamer1.0-plugins-good: upgrade 1.28.6 -> 1.28.7
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-mathieu-gstreamer-1-28-7-v1-8-9694738804f6@bootlin.com>
References: <20260908-mathieu-gstreamer-1-28-7-v1-0-9694738804f6@bootlin.com>
In-Reply-To: <20260908-mathieu-gstreamer-1-28-7-v1-0-9694738804f6@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788861512; l=1195;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=s/l52jdSvnZrPdF0TKrgGWqOoYrAzHvXBWhaIxhHbl8=;
 b=PkVB2nXqZaIsku3S4OVRf3vfP6pnSaH3XMjBknjdDLDv9OA4xx/8AkHXfZWB69pMNbpN+Wiwz
 MzK2zf5fsBuDsQEaL/QStPRtXPMVcuAT5OZhMTobBS+Kwz7ahilYmSA
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 09:58:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245348

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 ...er1.0-plugins-good_1.28.6.bb => gstreamer1.0-plugins-good_1.28.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.7.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.7.bb
index 9c780afffced..027e7b34c947 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.7.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "b0c620a4b18b6ee931b4c43bbf1760d308666dc37f730a7e7f1ad327e59ce2df"
+SRC_URI[sha256sum] = "87256969c82cf3bc8574301f3e7044a90de0ac500a5a27d8ba38c4dde894dd8b"
 
 S = "${UNPACKDIR}/gst-plugins-good-${PV}"
 

-- 
2.47.3


