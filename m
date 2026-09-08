Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81389C79F82
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 09:58:42 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3678.1788861520495390212
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 02:58:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=VH/AOaCu;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D82541A1A52
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 09:58:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A7366603C4
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 09:58:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0CAA211C7AF4D;
	Tue,  8 Sep 2026 11:58:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788861518; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aohP9WVDcVvvE6BFSdAnZjompLaE9BiLZjAkUFyT/Dk=;
	b=VH/AOaCuVl57huVU/riyYNxY00wbXsJD5AtB/oW0kgKSMLyZPOpHTZ7B7hKnpQLlBpI6SA
	jBUF2lwtEGdIZ5YNBP6SjwoJonNCIeTgZU6+NFsh4FpV0TXpAc2Jxq4zGWTU5xoPLSIC/p
	m2bIQfk2mnm1KSdZ0ETSVOFJqCp0yMpvt6XVlrU5s3YVfflGDQTRXZJcVEEI+79CfPjWIz
	XJ17v5WkcO8x0N/b/5FHJ5S5qG1LMjZ4VLPa2+AKcqOTiTwozbcUXXQ/fa0s+yKHE24PnL
	ktKYhmidDx/DajlCXu4rOOCpTsC7JHpMgG2BdnhsqzAT7+DtUV21JaxniE64Uw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Tue, 08 Sep 2026 11:58:27 +0200
Subject: [PATCH 05/10] gstreamer1.0-plugins-ugly: upgrade 1.28.6 -> 1.28.7
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-mathieu-gstreamer-1-28-7-v1-5-9694738804f6@bootlin.com>
References: <20260908-mathieu-gstreamer-1-28-7-v1-0-9694738804f6@bootlin.com>
In-Reply-To: <20260908-mathieu-gstreamer-1-28-7-v1-0-9694738804f6@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788861512; l=1145;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=MuyanBWNtaOjKn+t2hW+r/rCbQbFS5B5aqm9eGnUQ/8=;
 b=Hlhaut2TjmGRIGJp3jjwlwuvFo82zGP2JBPf7TIF1at79GsnlsHcgEgusrW67foLn10/3hPaZ
 kJU03yEo+ThAMskNhCci9V0Iv4etzS8pkihB+iu7YPDpiGw5rYRrRpr
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 09:58:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245345

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 ...er1.0-plugins-ugly_1.28.6.bb => gstreamer1.0-plugins-ugly_1.28.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.7.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.7.bb
index 5650b9a3954c..15962c14e8c3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.7.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "ee279da13a740fd7f060d631a673223fa3bcc8c33d350c8d0264bd332a24ecd8"
+SRC_URI[sha256sum] = "2b681170ddc22b6b283cafeed48f427c30a17056974a6a9ed137c354e0f7730c"
 
 S = "${UNPACKDIR}/gst-plugins-ugly-${PV}"
 

-- 
2.47.3


