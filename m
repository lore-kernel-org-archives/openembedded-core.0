Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A51EC77B7A
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 22:11:43 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.1195.1684361500680244015
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 15:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@redrectangle.org header.s=gm1 header.b=dLIoVJk4;
 spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.195, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 0B36460005;
	Wed, 17 May 2023 22:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redrectangle.org;
	s=gm1; t=1684361498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iR4mAaPaCiOZOeVNTR4JRfOUlx4YAVl35CrlO1kKTXc=;
	b=dLIoVJk4bRGhyhEYpV+DZsqot/hIINxSBSeWuGA6vYQCFEMImPkHl+BCxDwwcVcawNl6M0
	K6vyYimrcAPvYP2dtw9lneeyhWNXDAqYq5tcNYyCyBWz1vmlhU0zuXIrErvSPIIJfpYeUe
	3cWGsnD9BDyaqXaxTeRjtIAgW/+ptt24c1F7l5yTKKAAVrGYSt72kJDqaWQhBBo9AvA/AE
	G4Amz9tbsBHghEYNfcTts2Ulrjfrranx4ha6kkvZR6aPftVlcrJBTWpLBGMV7ctzdiOP+7
	4211UEy71w+ZPcw225bVCjUPiYi620Qw1AOYcE4zWx1DfF8H9MlAbCZSQB9CIA==
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH] curl: Update from 8.0.1 to 8.1.0
Date: Wed, 17 May 2023 15:11:16 -0700
Message-Id: <20230517221116.899605-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 22:11:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181503

This is a feature and bugfix release. Release notes are available at:
https://curl.se/changes.html#8_1_0

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta/recipes-support/curl/{curl_8.0.1.bb => curl_8.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_8.0.1.bb => curl_8.1.0.bb} (98%)

diff --git a/meta/recipes-support/curl/curl_8.0.1.bb b/meta/recipes-support/curl/curl_8.1.0.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_8.0.1.bb
rename to meta/recipes-support/curl/curl_8.1.0.bb
index 5cf044615f..0efd0de5c2 100644
--- a/meta/recipes-support/curl/curl_8.0.1.bb
+++ b/meta/recipes-support/curl/curl_8.1.0.bb
@@ -14,7 +14,7 @@ SRC_URI = " \
     file://run-ptest \
     file://disable-tests \
 "
-SRC_URI[sha256sum] = "0a381cd82f4d00a9a334438b8ca239afea5bfefcfa9a1025f2bf118e79e0b5f0"
+SRC_URI[sha256sum] = "6bd80ad4f07187015911216ee7185b90d285ac5162aed1bded144f9f93232a3c"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.39.3


