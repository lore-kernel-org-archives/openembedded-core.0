Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9CEB7731A6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 19:02:12 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id wb13so196150018obb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 11:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ulf0RrasKDgQZc7X/TJSu+9TG4qT2mcVvEZ7m3C1lRk=;
	b=nCKeoCoLs5nP1mgH7DZ6SYSEhJ6533IW7QmIp/nRtVNoFfk/NrCC/QyFZ6x14zbper
	/+Sd2E8UHNRJVBrWrFE23eyjccwtJnpQSLFzOznCgCb34IYu4XmVc9PduZ2trQWuco+N
	Xc5QbKy25TPPJ7LvROhtEvqYXDuPrOXZl0Fu21blokGpjXDZIoN4NE7OEmcfTNI6G0tn
	c3do8MHN1cVGKKUoeXNHYIgUtSpj2dqXRl2YlrYY3+oELJNatlUvVKVzkIrOhkMK4xha
	oFnU96f/W5MW2FaoB2iErLGIS88QBFTM4qf6aD0YjSmlATXR45oZtCNzmKoMC+iT7T7B
	2zGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ulf0RrasKDgQZc7X/TJSu+9TG4qT2mcVvEZ7m3C1lRk=;
	b=iiozPBgFzo2xBL0WRWN1mGib/fR7bYiRFioS4Wfxz8mX+dYs1OyalxOY23tlO5XIlS
	qZvk/SdjMx6CKgGSHmfslgurVT4pnf+NigSKZZGZWUO6H2JhWkoDS1UxMCAJ8VhA7KBA
	QD51bMWpO/Qws1FORcJbe0vKsTo9ifWN3pFge9Q2TzUTN/N2LbawtAiRG7mGwnvK6ztG
	tO6D5PZpKk41f5l7ZouaMD7EfCRDk7+AQKBoQKExpfYmTAlTlKII+GJHhQEFH2j6YiLt
	WP5Tw+kbtiOlmf6GjzR7w/MwwvTTjZ8aFuViCwIt7bVZhrhlBpv8V9afc+WNd+mQ75h6
	IQRw==
X-Gm-Message-State: AG10YOT/rdE6euqku6GRGL4dY6KkaHbZlutUQ2i7INiPTyzPxZbp/4BIqOJBMtwMseS3AA==
X-Received: by 10.60.81.103 with SMTP id z7mr32315438oex.59.1455044532794;
	Tue, 09 Feb 2016 11:02:12 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	u81sm2523088oia.23.2016.02.09.11.02.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Feb 2016 11:02:11 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Feb 2016 11:02:06 -0800
Message-Id: <1455044526-14680-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] curl: drop obsolete pkgconfig_fix.patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Feb 2016 19:02:12 -0000

This patch has been carried around in oe-core for a long time.
It contains two unrelated changes and neither seem to be required
any more. Drop the patch.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/curl/curl/pkgconfig_fix.patch | 32 ----------------------
 meta/recipes-support/curl/curl_7.47.1.bb           |  4 +--
 2 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100644 meta/recipes-support/curl/curl/pkgconfig_fix.patch

diff --git a/meta/recipes-support/curl/curl/pkgconfig_fix.patch b/meta/recipes-support/curl/curl/pkgconfig_fix.patch
deleted file mode 100644
index 5d8769d..0000000
--- a/meta/recipes-support/curl/curl/pkgconfig_fix.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Upstream-Status: Inappropriate [packaging]
-
-diff -Nurd curl-7.29.0/configure.ac curl-7.29.0/configure.ac
---- curl-7.29.0/configure.ac	2013-02-06 11:47:19.000000000 +0200
-+++ curl-7.29.0/configure.ac	2013-02-16 12:32:22.132327764 +0200
-@@ -1883,6 +1883,7 @@
-        AC_SUBST(USE_GNUTLS, [1])
-        GNUTLS_ENABLED=1
-        USE_GNUTLS="yes"
-+       GNUTLS_REQUIRED="gnutls"
-        curl_ssl_msg="enabled (GnuTLS)"
-        ],
-        [
-@@ -1953,6 +1954,8 @@
-    ])
- fi
- 
-+AC_SUBST(GNUTLS_REQUIRED)
-+
- dnl ----------------------------------------------------
- dnl check for PolarSSL
- dnl ----------------------------------------------------
-diff -Nurd curl-7.29.0/libcurl.pc.in curl-7.29.0/libcurl.pc.in
---- curl-7.29.0/libcurl.pc.in	2012-12-12 00:32:22.000000000 +0200
-+++ curl-7.29.0/libcurl.pc.in	2013-02-16 12:33:27.063844337 +0200
-@@ -35,5 +35,5 @@
- Description: Library to transfer files with ftp, http, etc.
- Version: @CURLVERSION@
- Libs: -L${libdir} -lcurl
--Libs.private: @LIBCURL_LIBS@
-+Libs.private: -ldl -lz
- Cflags: -I${includedir} @CPPFLAG_CURL_STATICLIB@
diff --git a/meta/recipes-support/curl/curl_7.47.1.bb b/meta/recipes-support/curl/curl_7.47.1.bb
index f2fa37c..210147c 100644
--- a/meta/recipes-support/curl/curl_7.47.1.bb
+++ b/meta/recipes-support/curl/curl_7.47.1.bb
@@ -5,9 +5,7 @@ SECTION = "console/network"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;beginline=8;md5=3a34942f4ae3fbf1a303160714e664ac"
 
-SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
-           file://pkgconfig_fix.patch \
-          "
+SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2"
 
 # curl likes to set -g0 in CFLAGS, so we stop it
 # from mucking around with debug options
-- 
1.9.1


