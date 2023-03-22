Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9422AC6FD1F
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 12:13:13 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.40811.1679487192578706621
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 05:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@redrectangle.org header.s=gm1 header.b=XoyMHb7T;
 spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.193, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id CA020240002;
	Wed, 22 Mar 2023 12:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redrectangle.org;
	s=gm1; t=1679487190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3XakuqN9aWJoMTr4JAp8+YJ41/tWqlzxzu8VdoUwXhQ=;
	b=XoyMHb7TjoJIZ4jeGP/pHly5OqBZQFcYZ+rVMF0MFRSNgjCqPNdxhINDGEskBpMQw4T0Iq
	IueAGmmX3Ic0+mzlZcuuUUsutf1q2hit5+0/jGgO7ZKvqLkGeapWXV9jAUW/BDYP1iWC4V
	aAXDCwuEvuV11Q52B+fSXu9Xh/y9zkmkruMRDkxBIr9cf56b68Oj+izY1bwt+oL1o+Ingv
	tA9POq0LVhlobMyPG6jPmr86LeshwBkXyOOZvl1m3GhXLRId5AnBoJJMu0IyzVdlsjKi/0
	MPAkFomAYwRsgrLexEY7uRKrPqA8C+eaaY5priod1Waf1ClAcN4paMvsgvPoSQ==
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH] curl: Update from 7.88.1 to 8.0.1
Date: Wed, 22 Mar 2023 05:12:29 -0700
Message-Id: <20230322121229.2007987-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 12:13:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178921

This update contains bug, security, and feature updates. For detailed
release notes, see https://curl.se/changes.html#8_0_1

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta/recipes-support/curl/{curl_7.88.1.bb => curl_8.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_7.88.1.bb => curl_8.0.1.bb} (98%)

diff --git a/meta/recipes-support/curl/curl_7.88.1.bb b/meta/recipes-support/curl/curl_8.0.1.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_7.88.1.bb
rename to meta/recipes-support/curl/curl_8.0.1.bb
index 0930d229d2..5cf044615f 100644
--- a/meta/recipes-support/curl/curl_7.88.1.bb
+++ b/meta/recipes-support/curl/curl_8.0.1.bb
@@ -14,7 +14,7 @@ SRC_URI = " \
     file://run-ptest \
     file://disable-tests \
 "
-SRC_URI[sha256sum] = "1dae31b2a7c1fe269de99c0c31bb488346aab3459b5ffca909d6938249ae415f"
+SRC_URI[sha256sum] = "0a381cd82f4d00a9a334438b8ca239afea5bfefcfa9a1025f2bf118e79e0b5f0"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.39.2


