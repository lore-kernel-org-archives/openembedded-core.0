Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27378C43334
	for <webhook@archiver.kernel.org>; Sun,  5 Jun 2022 21:48:40 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.25152.1654465718119016345
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jun 2022 14:48:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.183.200, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 02EFE20005;
	Sun,  5 Jun 2022 21:48:35 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [dunfell][PATCH 2/2] curl: Fix CVE_CHECK_WHITELIST typo
Date: Sun,  5 Jun 2022 14:47:34 -0700
Message-Id: <20220605214734.2872063-2-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220605214734.2872063-1-robert.joslyn@redrectangle.org>
References: <20220605214734.2872063-1-robert.joslyn@redrectangle.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jun 2022 21:48:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166583

Fix typo to properly whitelist CVE-2021-22945.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta/recipes-support/curl/curl_7.69.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index b53b00cc38..5a597a7dd9 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -42,7 +42,7 @@ SRC_URI[sha256sum] = "2ff5e5bd507adf6aa88ff4bbafd4c7af464867ffb688be93b9930717a5
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-CVE_CHECK_WHITELIST = "CVE-2021-22922 CVE-2021-22923 CVE-2021-22926 CVE-22945"
+CVE_CHECK_WHITELIST = "CVE-2021-22922 CVE-2021-22923 CVE-2021-22926 CVE-2021-22945"
 
 # As per link https://security-tracker.debian.org/tracker/CVE-2021-22897
 # and https://ubuntu.com/security/CVE-2021-22897
-- 
2.35.1


