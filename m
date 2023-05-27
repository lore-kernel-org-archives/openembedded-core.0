Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB2DEC77B7E
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 21:52:13 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.18798.1685224324844751883
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 May 2023 14:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@redrectangle.org header.s=gm1 header.b=MiL3pq9V;
 spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.197, mailfrom: robert.joslyn@redrectangle.org)
X-GND-Sasl: robert.joslyn@redrectangle.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redrectangle.org;
	s=gm1; t=1685224322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0cZXG24Rd/5XGX+gPQGw8WhGr7zfalL2sMlsolMuI3Q=;
	b=MiL3pq9V5HvttmHQbjyehQ2YRr3735iL7GQLL9WH8+106HCMdyazD7GNtrC0u8WU/2HtmB
	z8PjGFrqSX7WWY12nzsnQ1KkA8n4KwMXeqH79BxG4VyaqRlAO1DvtwsFY7pljkbxPQwZW8
	9u6ElHVMiU+V7yZjPpScLn2ZZjc6p/p4XJnHYmJgLOspuDVE6CkGmG5YzvsBzStSNolIuZ
	NLNunWQpP3EDr0CjVYWcykGQG/kSeooRynNzRrP0B4/Xriuws5G9g0ET5TBfpgKhxMHtIZ
	6VOydRQS9gxp6JKvRFHA15sWLbN52Jy0lhuH1JSvZiX2ZY8k6dO93ifMkATEEA==
X-GND-Sasl: robert.joslyn@redrectangle.org
Received: by mail.gandi.net (Postfix) with ESMTPSA id 689FF1C0002;
	Sat, 27 May 2023 21:52:00 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH] curl: Update from 8.1.0 to 8.1.1
Date: Sat, 27 May 2023 14:51:55 -0700
Message-Id: <20230527215155.3343278-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 21:52:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181810

This is a bugfix only release. Release notes:
https://curl.se/changes.html#8_1_1

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta/recipes-support/curl/{curl_8.1.0.bb => curl_8.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_8.1.0.bb => curl_8.1.1.bb} (98%)

diff --git a/meta/recipes-support/curl/curl_8.1.0.bb b/meta/recipes-support/curl/curl_8.1.1.bb
similarity index 98%
rename from meta/recipes-support/curl/curl_8.1.0.bb
rename to meta/recipes-support/curl/curl_8.1.1.bb
index 0efd0de5c2..89ab61fc59 100644
--- a/meta/recipes-support/curl/curl_8.1.0.bb
+++ b/meta/recipes-support/curl/curl_8.1.1.bb
@@ -14,7 +14,7 @@ SRC_URI = " \
     file://run-ptest \
     file://disable-tests \
 "
-SRC_URI[sha256sum] = "6bd80ad4f07187015911216ee7185b90d285ac5162aed1bded144f9f93232a3c"
+SRC_URI[sha256sum] = "08a948e061929645597c1ef7194e07b308b22084ff03fa7400b465e6c05149e5"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.39.3


