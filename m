Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E627C38A02
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 03:06:58 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web12.5428.1667185612412924548
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Oct 2022 20:06:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@redrectangle.org header.s=gm1 header.b=BEEQI4N3;
 spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.194, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id C2DF840004;
	Mon, 31 Oct 2022 03:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redrectangle.org;
	s=gm1; t=1667185610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=faobGMpBzakIxNK2NZqNga+WLpWQGZf9mnpIt0dOFQI=;
	b=BEEQI4N3QtPFWC0sNAnZTDpMooV6xKoINTT5HWQLM2dzd8zh/tvm6uXBjKsMrf+lcyrxNE
	SsLCsuC8OQhDfJZEBQ6b9aKbN1ryBGHlkkmwjr9xwYCZB4hqJ5GmEwoyjphGJRXEVU6FKq
	F3Y4d1fSGWh1oqMm43lby/BSecNxSJsWLB+GtAXaBI7MIXWImB9zF11TjNmL2fgrQge1Fw
	i6sb+LbHjjt6qIA5BYn2L0Y9usmtEDPHlnNvN25+7dFZgyHU/zmptA5mMyH49QCOz2pG6A
	LonFpsZR2ipUCzFIHrkjmYrFo5b5aloJznHuJRjkar6NmHJYS6dtuBibVEBJBw==
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH] curl: Update 7.85.0 to 7.86.0
Date: Sun, 30 Oct 2022 20:06:26 -0700
Message-Id: <20221031030626.431961-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 03:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172288

Feature and security update. Fixes the following CVEs:

 - CVE-2022-32221
 - CVE-2022-35260
 - CVE-2022-42915
 - CVE-2022-42916

Release notes: https://curl.se/changes.html#7_86_0

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta/recipes-support/curl/{curl_7.85.0.bb => curl_7.86.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_7.85.0.bb => curl_7.86.0.bb} (98%)

diff --git a/meta/recipes-support/curl/curl_7.85.0.bb b/meta/recipes-support/curl/curl_7.86.0.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_7.85.0.bb
rename to meta/recipes-support/curl/curl_7.86.0.bb
index ad6a5175bc..ec8ce9fd28 100644
--- a/meta/recipes-support/curl/curl_7.85.0.bb
+++ b/meta/recipes-support/curl/curl_7.86.0.bb
@@ -14,7 +14,7 @@ SRC_URI = " \
     file://run-ptest \
     file://disable-tests \
 "
-SRC_URI[sha256sum] = "88b54a6d4b9a48cb4d873c7056dcba997ddd5b7be5a2d537a4acb55c20b04be6"
+SRC_URI[sha256sum] = "2d61116e5f485581f6d59865377df4463f2e788677ac43222b496d4e49fb627b"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.37.4


