Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0592C433EF
	for <webhook@archiver.kernel.org>; Sun,  6 Mar 2022 13:31:47 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.15104.1646573506210202659
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Mar 2022 05:31:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.183.201, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id EC9FB1BF205;
	Sun,  6 Mar 2022 13:31:42 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH] curl: Update to 7.82.0
Date: Sun,  6 Mar 2022 05:31:18 -0800
Message-Id: <20220306133118.1542817-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 150
X-GND-Status: SPAM
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Mar 2022 13:31:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162782

Includes bug fixes and feature updates, such as addition of a --json flag
and the removal of mesalink support. Changelog available at:
https://curl.se/changes.html#7_82_0

LIC_FILES_CHKSUM changed due to copyright year update. Now that the full
SPDX license list is supported, refine the license from MIT to
MIT-open-group. The curl license contains the additional advertising
clause present in the Open Group variant.

Use a weak assignment with the RANDOM variable to make changes via
bbappend easier.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../curl/{curl_7.81.0.bb => curl_7.82.0.bb}               | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/curl/{curl_7.81.0.bb => curl_7.82.0.bb} (95%)

diff --git a/meta/recipes-support/curl/curl_7.81.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
similarity index 95%
rename from meta/recipes-support/curl/curl_7.81.0.bb
rename to meta/recipes-support/curl/curl_7.82.0.bb
index e7219def18..23bd7eaa52 100644
--- a/meta/recipes-support/curl/curl_7.81.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -6,11 +6,11 @@ HTTP post, SSL connections, proxy support, FTP uploads, and more!"
 HOMEPAGE = "https://curl.se/"
 BUGTRACKER = "https://github.com/curl/curl/issues"
 SECTION = "console/network"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=425f6fdc767cc067518eef9bbdf4ab7b"
+LICENSE = "MIT-open-group"
+LIC_FILES_CHKSUM = "file://COPYING;md5=190c514872597083303371684954f238"
 
 SRC_URI = "https://curl.se/download/${BP}.tar.xz"
-SRC_URI[sha256sum] = "a067b688d1645183febc31309ec1f3cdce9213d02136b6a6de3d50f69c95a7d3"
+SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
@@ -18,7 +18,7 @@ CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl dan
 inherit autotools pkgconfig binconfig multilib_header
 
 # Entropy source for random PACKAGECONFIG option
-RANDOM = "/dev/urandom"
+RANDOM ?= "/dev/urandom"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} libidn openssl proxy random threaded-resolver verbose zlib"
 PACKAGECONFIG:class-native = "ipv6 openssl proxy random threaded-resolver verbose zlib"
-- 
2.34.1


