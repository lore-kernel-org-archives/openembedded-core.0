Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BFD6C433EF
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 19:09:26 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web08.21352.1641755359641532192
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 11:09:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.178.231, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 01632100005;
	Sun,  9 Jan 2022 19:09:16 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH 1/3] curl: Update to 7.81.0
Date: Sun,  9 Jan 2022 11:08:03 -0800
Message-Id: <20220109190805.2409880-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 19:09:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160287

Update URLs to refelct what upstream is presently using and add zstd
PACKAGECONFIG.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../curl/{curl_7.80.0.bb => curl_7.81.0.bb}            | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-support/curl/{curl_7.80.0.bb => curl_7.81.0.bb} (93%)

diff --git a/meta/recipes-support/curl/curl_7.80.0.bb b/meta/recipes-support/curl/curl_7.81.0.bb
similarity index 93%
rename from meta/recipes-support/curl/curl_7.80.0.bb
rename to meta/recipes-support/curl/curl_7.81.0.bb
index 7b47091933..30bd928751 100644
--- a/meta/recipes-support/curl/curl_7.80.0.bb
+++ b/meta/recipes-support/curl/curl_7.81.0.bb
@@ -3,15 +3,14 @@ DESCRIPTION = "It uses URL syntax to transfer data to and from servers. \
 curl is a widely used because of its ability to be flexible and complete \
 complex tasks. For example, you can use curl for things like user authentication, \
 HTTP post, SSL connections, proxy support, FTP uploads, and more!"
-HOMEPAGE = "http://curl.haxx.se/"
-BUGTRACKER = "http://curl.haxx.se/mail/list.cgi?list=curl-tracker"
+HOMEPAGE = "https://curl.se/"
+BUGTRACKER = "https://github.com/curl/curl/issues"
 SECTION = "console/network"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=425f6fdc767cc067518eef9bbdf4ab7b"
 
-SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2"
-
-SRC_URI[sha256sum] = "dd0d150e49cd950aff35e16b628edf04927f0289df42883750cf952bb858189c"
+SRC_URI = "https://curl.se/download/${BP}.tar.xz"
+SRC_URI[sha256sum] = "a067b688d1645183febc31309ec1f3cdce9213d02136b6a6de3d50f69c95a7d3"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
@@ -53,6 +52,7 @@ PACKAGECONFIG[tftp] = "--enable-tftp,--disable-tftp,"
 PACKAGECONFIG[threaded-resolver] = "--enable-threaded-resolver,--disable-threaded-resolver,,,,ares"
 PACKAGECONFIG[verbose] = "--enable-verbose,--disable-verbose"
 PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
+PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
 
 EXTRA_OECONF = " \
     --disable-libcurl-option \
-- 
2.34.1


