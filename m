Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26527C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 14:14:28 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.10868.1651155259992808384
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 07:14:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.183.194, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id A829B4000A;
	Thu, 28 Apr 2022 14:14:16 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH] curl: Update to 7.83.0
Date: Thu, 28 Apr 2022 07:13:41 -0700
Message-Id: <20220428141341.1845-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 150
X-GND-Status: SPAM
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 14:14:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164966

This is a minor feature and bugfix release. Changes include:

 * curl: add %header{name} experimental support in -w handling
 * curl: add %{header_json} experimental support in -w handling
 * curl: add --no-clobber
 * curl: add --remove-on-error
 * header api: add curl_easy_header and curl_easy_nextheader
 * msh3: add support for QUIC and HTTP/3 using msh3

Full changelog at: https://curl.se/changes.html#7_83_0

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta/recipes-support/curl/{curl_7.82.0.bb => curl_7.83.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_7.82.0.bb => curl_7.83.0.bb} (97%)

diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.83.0.bb
similarity index 97%
rename from meta/recipes-support/curl/curl_7.82.0.bb
rename to meta/recipes-support/curl/curl_7.83.0.bb
index 23bd7eaa52..07027a2f31 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.83.0.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT-open-group"
 LIC_FILES_CHKSUM = "file://COPYING;md5=190c514872597083303371684954f238"
 
 SRC_URI = "https://curl.se/download/${BP}.tar.xz"
-SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
+SRC_URI[sha256sum] = "bbff0e6b5047e773f3c3b084d80546cc1be4e354c09e419c2d0ef6116253511a"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.35.1


