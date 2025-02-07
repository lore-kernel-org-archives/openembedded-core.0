Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55635C02194
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 20:26:37 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.669.1738959991723209945
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 12:26:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=cTFoQGSM;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202502072026284104e3ca1d361e26fa-fd7ntd@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202502072026284104e3ca1d361e26fa
        for <openembedded-core@lists.openembedded.org>;
        Fri, 07 Feb 2025 21:26:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=1GxkXYPzfekCJoq5FtJUK9durgsI8s8PAIRrbppL1Lg=;
 b=cTFoQGSM1YexKnkXE6+L6JyvkwT3fj4gmvPRTqEMUPJkGD4ghcToJkLadD+wVJ58N6+I26
 3xrz96YF+NYOgKMhpx7gzSCJH1OVMNagBDfq9DwYB/z13GyLAne/ZlJOoUSlfczaK3KMI3kF
 fdwnD42r/5zlatXZ8TjU/hkA9LmDcifIOby8/lv5vPD2a7ebLZc985jrSB7KuF9qeQO1//4u
 0d+xgmp3CtDklqaeVv8VTJFybndGNOe5VyG7KHjRJqbsV0iu2VIULsjUdURPrbBPvTB5oICu
 8C4tB05PufICGinHKulkB7vDQK8kZ4AN+0Dtbmfx6BDZCC0ltJq7vF8w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] curl: upgrade 8.11.1 -> 8.12.0
Date: Fri,  7 Feb 2025 21:25:37 +0100
Message-Id: <20250207202537.2137371-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 20:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210998

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2025-0167, CVE-2025-0665 and CVE-2025-0725.

License-Update: copyright year refreshed

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/curl/{curl_8.11.1.bb => curl_8.12.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_8.11.1.bb => curl_8.12.0.bb} (97%)

diff --git a/meta/recipes-support/curl/curl_8.11.1.bb b/meta/recipes-support/curl/curl_8.12.0.bb
similarity index 97%
rename from meta/recipes-support/curl/curl_8.11.1.bb
rename to meta/recipes-support/curl/curl_8.12.0.bb
index b4d80e9643..0d9457db93 100644
--- a/meta/recipes-support/curl/curl_8.11.1.bb
+++ b/meta/recipes-support/curl/curl_8.12.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://curl.se/"
 BUGTRACKER = "https://github.com/curl/curl/issues"
 SECTION = "console/network"
 LICENSE = "curl"
-LIC_FILES_CHKSUM = "file://COPYING;md5=eed2e5088e1ac619c9a1c747da291d75"
+LIC_FILES_CHKSUM = "file://COPYING;md5=72f4e9890e99e68d77b7e40703d789b8"
 
 SRC_URI = " \
     https://curl.se/download/${BP}.tar.xz \
@@ -15,7 +15,7 @@ SRC_URI = " \
     file://disable-tests \
     file://no-test-timeout.patch \
 "
-SRC_URI[sha256sum] = "c7ca7db48b0909743eaef34250da02c19bc61d4f1dcedd6603f109409536ab56"
+SRC_URI[sha256sum] = "9a4628c764be6b1a9909567c13e8e771041609df43b2158fcac4e05ea7097e5d"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"

