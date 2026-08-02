Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51685C55162
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 19:23:13 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28862.1785698587626368817
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 12:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=U/K55ToX;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260802192309c7f8f7a83d000207fe-p4gyxl@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260802192309c7f8f7a83d000207fe
        for <openembedded-core@lists.openembedded.org>;
        Sun, 02 Aug 2026 21:23:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=CJ+2lEQP9Wur7IEWHyRxv/fxgIi8tRZ27Xm3fKpbLv4=;
 b=U/K55ToXRIu43midaJwaLbBC/qTc/4SolCglfnWOtgccNz+gRFWAIOr/an3SnngmbVMqUy
 yX/ea6cEezdrKGd+7nnTwheWvXGIjPV9D3enoannlSgtdk690eWb4GharQTxYCZbBKiwL1Td
 Un7cZmuVf6/yEx/r/pCEERr0GKVLwKd9M+dEl99oHc/psxt29jhr1q8GsTGZK/52V86JK2TC
 ZE8FvbzbcKwo+RO1Th+ckpS07uGl4c+7ZzdFFmKBocj0+MEdEyv4JlFPYhnHqi+RCRy5VGcY
 7XvBjkZExyogIFCKVSc6ecEwf/TjWDCWtmyq8CpYt4k/ancuU1WrgbBw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 2/7] gstreamer1.0-libav: upgrade 1.28.2 -> 1.28.4
Date: Sun,  2 Aug 2026 21:22:29 +0200
Message-ID: <20260802192234.1725830-2-peter.marko@siemens.com>
In-Reply-To: <20260802192234.1725830-1-peter.marko@siemens.com>
References: <20260802192234.1725830-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 19:23:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242565

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 62104c0ccf0aec7254f206fa9406b0a8f6715a86)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...streamer1.0-libav_1.28.2.bb => gstreamer1.0-libav_1.28.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.28.2.bb => gstreamer1.0-libav_1.28.4.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.4.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.4.bb
index 856c883816..4898c42190 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.4.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "45ba65535870aa7c026119d2e90b35dc760e1cf6f50bffbfe8d71223a3043a4e"
+SRC_URI[sha256sum] = "bd17a5df2874a7a58bcbaf7b940223379ad9613624db8ead783db03e74bb904b"
 
 S = "${UNPACKDIR}/gst-libav-${PV}"
 

