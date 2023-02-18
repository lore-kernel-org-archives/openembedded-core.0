Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54627C61DA4
	for <webhook@archiver.kernel.org>; Sat, 18 Feb 2023 21:53:54 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.21593.1676757232863764722
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Feb 2023 13:53:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@redrectangle.org header.s=gm1 header.b=AsSLmNGA;
 spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.178.230, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 0DDEE240003;
	Sat, 18 Feb 2023 21:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redrectangle.org;
	s=gm1; t=1676757230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xKBNJHh23S63vbM/4+vFo1saY99TUmGE01oQERcyuvY=;
	b=AsSLmNGAdE7QdBZ2rg9Y2cb/PEXom2aSS5I7bO7G/eSBQt2md9jbIbl6qcD6ONuzl/MRmN
	iiNy8oozqB1kT9T4+g5pjJW4rkyNY0HlxMKyf1fCsq4JiUn5CrqK7nUxS62Cmab+TxSnRE
	++VBi57L4u2IVqRzCYDFSP8+AnmxUw/XIRx65JIlTkDjJoOLFCM3L7fj5mGrMfo2Ch5FI0
	bqVoIE7LT/EdGV+p9QGPE6FZ/zgtBzFijwh7cRvSxABGvo9AKmB1YOluiFJtGuT9FlY+oH
	dcR7eHV6nDIGHa7RIk19W4wqVscU5h5g8gOF0U7E9mA9ACEpF0ob2AniYQXtVg==
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH] curl: Update 7.87.0 to 7.88.0
Date: Sat, 18 Feb 2023 13:53:13 -0800
Message-Id: <20230218215313.1017667-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Feb 2023 21:53:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177318

This is a feature and bugfix update. Release notes available at:
https://curl.se/changes.html#7_88_0

License-Update: Copyright year updated
---
 meta/recipes-support/curl/{curl_7.87.0.bb => curl_7.88.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.87.0.bb => curl_7.88.0.bb} (96%)

diff --git a/meta/recipes-support/curl/curl_7.87.0.bb b/meta/recipes-support/curl/curl_7.88.0.bb
similarity index 96%
rename from meta/recipes-support/curl/curl_7.87.0.bb
rename to meta/recipes-support/curl/curl_7.88.0.bb
index 0b4d649f54..749bda815c 100644
--- a/meta/recipes-support/curl/curl_7.87.0.bb
+++ b/meta/recipes-support/curl/curl_7.88.0.bb
@@ -7,14 +7,14 @@ HOMEPAGE = "https://curl.se/"
 BUGTRACKER = "https://github.com/curl/curl/issues"
 SECTION = "console/network"
 LICENSE = "curl"
-LIC_FILES_CHKSUM = "file://COPYING;md5=190c514872597083303371684954f238"
+LIC_FILES_CHKSUM = "file://COPYING;md5=db8448a1e43eb2125f7740fc397db1f6"
 
 SRC_URI = " \
     https://curl.se/download/${BP}.tar.xz \
     file://run-ptest \
     file://disable-tests \
 "
-SRC_URI[sha256sum] = "ee5f1a1955b0ed413435ef79db28b834ea5f0fb7c8cfb1ce47175cc3bee08fff"
+SRC_URI[sha256sum] = "fd17432cf28714a4cf39d89e26b8ace0d8901199fe5d01d75eb0ae3bbfcc731f"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.39.2


