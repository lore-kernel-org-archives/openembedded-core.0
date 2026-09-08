Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7A8C79FB3
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 09:58:43 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3545.1788861521900165360
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 02:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Ws5Ue0sV;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 44ABD1A1A58
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 09:58:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 19B69603C4
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 09:58:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53D4111C7AF4C;
	Tue,  8 Sep 2026 11:58:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788861519; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PhTymdcrGw1heNK+XNa04HG9xCT1MYubks4ymtWnWx0=;
	b=Ws5Ue0sV2kc7JMBLGojtxKH+Mwq8AJNwKiu6Z8txsZkaudDSVL2kr8GMODrkHTWRf0z6Fk
	4BmajsQ/8SiPJfeNFBGhgGNdOuTxebv3s70/d62/1UAzBUs1Esm7KNTUZKhc1+AC0p5rMT
	dTkcZ5M9eex4Gq+HQuBp8Cg8bqcAZ10RsV+ecdQl0XD2uZpmPi9QVHLxfOGa7wZ/mfyfCQ
	dowmaVK/tlJDRT4zugAPtct+bKLBM17eOSQHrC+7AthT81LHu/dbI2zOQKk/Be0OuXMYH5
	Q5121PUH0rOV0qwMSXYYBpHiCjK8zIkZvb/0cWfUyeTHhsHPmU09BX9RU+Y6nw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Tue, 08 Sep 2026 11:58:29 +0200
Subject: [PATCH 07/10] gstreamer1.0-plugins-base: upgrade 1.28.6 -> 1.28.7
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-mathieu-gstreamer-1-28-7-v1-7-9694738804f6@bootlin.com>
References: <20260908-mathieu-gstreamer-1-28-7-v1-0-9694738804f6@bootlin.com>
In-Reply-To: <20260908-mathieu-gstreamer-1-28-7-v1-0-9694738804f6@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788861512; l=5196;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=+pIeykZM1QlefcWbsYAMvx1C034uVdJbyaHea3dNVDs=;
 b=yYUiGbm+yw4Wn5cEX84RIQizgUnWOZeHCBfpIL+r6kSsEVVAoG3MwYZsttjm1e/nJPSYINr7D
 KHdcWGiT1BHDEokZaIP23QYix/2BODdsoEUW1By/WYxABP0DlWT2uZK
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 09:58:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245347

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch     | 4 ++--
 .../0002-ssaparse-enhance-SSA-text-lines-parsing.patch                | 4 ++--
 .../0003-viv-fb-Make-sure-config.h-is-included.patch                  | 4 ++--
 ...1.0-plugins-base_1.28.6.bb => gstreamer1.0-plugins-base_1.28.7.bb} | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
index 635c801cdc7d..342be9e38ec6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,4 +1,4 @@
-From ae52c483980409c64b8bdd0c7b794533bcc0fec8 Mon Sep 17 00:00:00 2001
+From d130f609b6cd7281afa8704130251119d676b972 Mon Sep 17 00:00:00 2001
 From: zhouming <b42586@freescale.com>
 Date: Wed, 14 May 2014 10:16:20 +0800
 Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
@@ -16,7 +16,7 @@ Signed-off-by: zhouming <b42586@freescale.com>
 diff --git a/gst-libs/gst/tag/gsttagdemux.c b/gst-libs/gst/tag/gsttagdemux.c
 old mode 100644
 new mode 100755
-index 16bf001..e17a144
+index 16bf0015b64a..e17a14497a8e
 --- a/gst-libs/gst/tag/gsttagdemux.c
 +++ b/gst-libs/gst/tag/gsttagdemux.c
 @@ -1797,6 +1797,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObject * parent, GstQuery * query)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
index 4ce9f30d6a3d..d91526c054c4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -1,4 +1,4 @@
-From 748c467f40d3f0072d9c139f9fdbbfdd56655c1e Mon Sep 17 00:00:00 2001
+From 253fe1cd715e9c25978e9157edcb16b0f09b3580 Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
 Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
@@ -17,7 +17,7 @@ Signed-off-by: Mingke Wang <mingke.wang@freescale.com>
 diff --git a/gst/subparse/gstssaparse.c b/gst/subparse/gstssaparse.c
 old mode 100644
 new mode 100755
-index c162a54..bd8afd9
+index c162a542f581..bd8afd93b5ea
 --- a/gst/subparse/gstssaparse.c
 +++ b/gst/subparse/gstssaparse.c
 @@ -304,6 +304,7 @@ gst_ssa_parse_remove_override_codes (GstSsaParse * parse, gchar * txt)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
index a824235731f1..e2a8ea9c7a67 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
@@ -1,4 +1,4 @@
-From 207df05a877717b1dd93a3a5903f0c58dd74c925 Mon Sep 17 00:00:00 2001
+From 603aea3d1907fff299d7ba3bfbd85d341b311947 Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Tue, 21 May 2019 14:01:11 +0200
 Subject: [PATCH] viv-fb: Make sure config.h is included
@@ -13,7 +13,7 @@ Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
  1 file changed, 4 insertions(+)
 
 diff --git a/gst-libs/gst/gl/gl-prelude.h b/gst-libs/gst/gl/gl-prelude.h
-index 85fca5a..946c729 100644
+index 85fca5a0f4fd..946c7291351b 100644
 --- a/gst-libs/gst/gl/gl-prelude.h
 +++ b/gst-libs/gst/gl/gl-prelude.h
 @@ -22,6 +22,10 @@
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.7.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.7.bb
index 955e4f50928f..cff54545e2ec 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.7.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "0ba699c7c6c66f4ba640be78cb38a24715add9683f3e3a199f5369dc5a4f04ac"
+SRC_URI[sha256sum] = "ed6e5410f496d171818763af2265e7977154bc7f9b827e98acf8c5bed21dd5a7"
 
 S = "${UNPACKDIR}/gst-plugins-base-${PV}"
 

-- 
2.47.3


