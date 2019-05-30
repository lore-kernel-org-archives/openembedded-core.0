Return-Path: <crg7475@mailbox.org>
Received: from mx2.mailbox.org (mx2.mailbox.org [80.241.60.215])
	by mail.openembedded.org (Postfix) with ESMTP id B9C177E48E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 16:42:14 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:1:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx2.mailbox.org (Postfix) with ESMTPS id AE005A107D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 18:42:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1559234527; bh=7scYTQ608lDYgaN
	MP6FaWKLstBxR3vu2YD68oWHDIyY=; b=s5WlMyrj+2audw70hwkL8ylNhUCVAIn
	bYYjlpLIbNn2ZHaE074hM+7xY2wB1F90YyLLAn4USIL33EXa9QT5zWPWx8d89E5c
	xiHOGJptatH4LCkAf8O14+clqzYURvRHEe4hjAFPK2P3LQdihYueR78M35ksa81C
	7yQwAj8iSW6gisLEBcwAvpgxApZopCpkzowRU6pCm8buS5yXD+pHPgsiVwHN80YU
	v87x6UgoZ42oq92eBBFgpCeyj77jTO/8zI+qnhtlW02CqslEGPP35X1HkuSnHHuT
	04daWh2qP9QNzjhKaQ1FvmhjFh4d5pcy6GhLWlOkgrGjw3yBQrXVLsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; 
	t=1559234535; h=from:from:sender:reply-to:subject:subject:date:date:
	message-id:message-id:to:to:cc:mime-version:content-type:
	content-transfer-encoding:in-reply-to:in-reply-to: references:references;
	bh=h4zSYTI1JBaHDRXsn63H/0TpN9ziep5wfc4Agvc63eM=;
	b=c7Q4F9N0HS46b74dgxOgh5ZRNefJXGAhhsTmfH2OwMKowxUiRFsNRHi44EAUTDJXGEgcPi
	OjzPpi2IfdpYRGwmQ+UCy+6uJefzdU6RrTxIIC4NtYKNDfAOQVzQL47+Q3nCFSigiYm0JC
	DOZorgEENFLbWSF+RXxFbtWkHffJKT0DETavvQJqe5kFjFlF0O97q476MHBYHChumnf6FN
	wJmWTioNd7UbWbDmkpHF/GJTpX4qjntCuRPcooF0OZFoE3m6nFyJJYGArkX6bT9DbBAjdY
	uTV6Os9zZzwSEPAty26QpMJdOO5sRGCXFoKvSdrcKuEBs68j1wftVywW1LI8zQ==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
	[80.241.56.117]) (amavisd-new, port 10030) with ESMTP id i3ApvKgbsO-r
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 18:42:07 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2019 18:41:50 +0200
Message-Id: <20190530164150.27038-11-crg7475@mailbox.org>
In-Reply-To: <20190530164150.27038-1-crg7475@mailbox.org>
References: <20190530164150.27038-1-crg7475@mailbox.org>
Subject: [PATCH v2 11/11] gst-validate: upgrade to version 1.16.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 May 2019 16:42:15 -0000

From: Philippe Normand <philn@igalia.com>

Signed-off-by: Philippe Normand <philn@igalia.com>
Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 .../{gst-validate_1.14.4.bb => gst-validate_1.16.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-validate_1.14.4.bb => gst-validate_1.16.0.bb} (87%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-validate_1.14.4.bb b/meta/recipes-multimedia/gstreamer/gst-validate_1.16.0.bb
similarity index 87%
rename from meta/recipes-multimedia/gstreamer/gst-validate_1.14.4.bb
rename to meta/recipes-multimedia/gstreamer/gst-validate_1.16.0.bb
index a4b3b465cc..1f4370619c 100644
--- a/meta/recipes-multimedia/gstreamer/gst-validate_1.14.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-validate_1.16.0.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 SRC_URI = "https://gstreamer.freedesktop.org/src/${BPN}/${BP}.tar.xz \
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
-SRC_URI[md5sum] = "1f4fc5308695adfdc11d13046aa4888c"
-SRC_URI[sha256sum] = "18dccca94bdc0bab3cddb07817bd280df7ab4abbec9a83b92620367a22d955c7"
+SRC_URI[md5sum] = "c5c57f3325a2e62aae4a8ec4931f7711"
+SRC_URI[sha256sum] = "9331ae48a173a048243539730cc7a88607777762dea4aebbc3ab55981e68d6c9"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS_${PN} = "git"
-- 
2.17.1


