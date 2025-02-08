Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 812BDC02198
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 16:34:03 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.12029.1739032433941256683
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Feb 2025 08:33:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=drQ3fNzL;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202502081633505430ae54adfea8ada3-jdoiby@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202502081633505430ae54adfea8ada3
        for <openembedded-core@lists.openembedded.org>;
        Sat, 08 Feb 2025 17:33:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=CrG/+2X7zDSOxiI19WIHTSfN2s6JgU5oYtw2jW5Po5Q=;
 b=drQ3fNzLiIEnC7hUMI9ezV/eqKWKjE3ZKe6EQzQbEVhEfufg0pbzciJzsov0UQfn9CYRim
 ixdQXgpZe6EUxD0HUtITyLIc3RVUjDyT7juGF4na7cfvhMo0OvitCI20nX/CfFrXGFn+XALi
 e8Ijl++tet5sNV/9MizS3oGQlPYs8fi0Y00TocoCNSFMcwsUkeWxAcRMjEJ54Ec2ttDiA/Sm
 OTVWLDcHiKG62fWbrzqFo0yi1l3zMnUeH5MfVUrVNOLsDZFAXtNw+B4ljJdid6Vzv0VnKS2s
 PHSfUEKF8n43W+zttlr81YPpuRpRQ2JTma/N0J2lkHzqmOU9X4wD8A7w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH v2] curl: upgrade 8.11.1 -> 8.12.0
Date: Sat,  8 Feb 2025 17:33:00 +0100
Message-Id: <20250208163300.3408599-1-peter.marko@siemens.com>
In-Reply-To: <20250207202537.2137371-1-peter.marko@siemens.com>
References: <20250207202537.2137371-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 16:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211040

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2025-0167, CVE-2025-0665 and CVE-2025-0725.

Initialize WATT_ROOT variable to avoid looking in host dirs
when autotools are checking available features.

License-Update: copyright year refreshed

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
v2: handle WATT_ROOT to fix mingw QA error

 meta/recipes-support/curl/{curl_8.11.1.bb => curl_8.12.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_8.11.1.bb => curl_8.12.0.bb} (96%)

diff --git a/meta/recipes-support/curl/curl_8.11.1.bb b/meta/recipes-support/curl/curl_8.12.0.bb
similarity index 96%
rename from meta/recipes-support/curl/curl_8.11.1.bb
rename to meta/recipes-support/curl/curl_8.12.0.bb
index b4d80e9643..7b5e6350ba 100644
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
@@ -76,6 +76,7 @@ EXTRA_OECONF = " \
     --without-libpsl \
     --enable-optimize \
     ${@'--without-ssl' if (bb.utils.filter('PACKAGECONFIG', 'gnutls mbedtls openssl', d) == '') else ''} \
+    WATT_ROOT=${STAGING_DIR_TARGET}${prefix} \
 "
 
 fix_absolute_paths () {

