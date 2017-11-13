Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 967D2782DC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 12:01:38 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id a132so18041298lfa.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 04:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=9E+Piv86+SFduuw9s7uqqvMO1kNaa58Gk+J/IvJZ6c4=;
	b=FucVfK2rD+AdfFv8aeGfBgj6feQshyJYKJLY83/NwuQNHiMwCxm2eFi/bSJF+Jz4cz
	Lo7N1o7OH6fHmxt62XmVZT0bFsoxlZmOibT8b6IHqoc6tzH7Dc+kUaLc79BPgh29mIib
	7Gemh+pBuq+/45qUsWyffq71LzPvDB9CO5VP1zDR9KqacnCdK2I3jnYUwlLXelMjGPNS
	7eJDYOC0oDl8c88vRNjDlnDfAGVYQH9PR4Pf0cKttRT7lQEvHgTdMIWBHXjbRxoUDLaH
	UqycSv1JhDA0DstYbW4bJz3R6EaSxtkjgvfrJ/7E2r7WYnRiIt15XyUduvME+cY2DmFW
	lwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9E+Piv86+SFduuw9s7uqqvMO1kNaa58Gk+J/IvJZ6c4=;
	b=ddkb4RjgX//v6L02hpy8LxAoo8EUoAB7v3eKOqHHihGBLB4NwiujaXkrwI2wIddaWq
	JFKejIJZEwhApCyGCebRg5KkV/vepfRUXMNGM2Z0OVXys1PL9bwina6l5a/LUVJq88OO
	JqyfmZJvi+UE/UY7St0NplTOOqfNNZKkTMUD6ilTvkvwDv1Kcr7b1lT8PawLFOT4xV5V
	x+pHz601G6e1YL/ltLzsfCvGX5rRwkvwxRqeW67BFyIUs1R4DyIknlw9LDLhT8aoISmP
	RXSaYQbwHh2T8c8xWaoXcronRYZoX1lkxC9lBv39INsU7gJaWhLu81uqjI4wLihNFpr2
	dIxg==
X-Gm-Message-State: AJaThX4p1I7r5WGOa/I78EhmrbCKHShYYosqzaGjWdIKw0dVWgx7j8wR
	RsLIlI4eDh3OgaLsinxu6h7lnK/6
X-Google-Smtp-Source: AGs4zMbblK+luizrXFuNq7T3AL0cEfrT6d2Xjv4YHDKGhoh1b0N8FmcHvDJH4uPNz1ZhRwU/iRtAVQ==
X-Received: by 10.46.5.12 with SMTP id 12mr759920ljf.116.1510574498810;
	Mon, 13 Nov 2017 04:01:38 -0800 (PST)
Received: from ubuntu.office.pelagicore.net ([83.218.80.243])
	by smtp.gmail.com with ESMTPSA id
	m95sm1394741lfi.76.2017.11.13.04.01.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Nov 2017 04:01:38 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Nov 2017 13:00:54 +0100
Message-Id: <1510574454-26784-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: [PATCH] curl: upgrade to 7.56.1
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
X-List-Received-Date: Mon, 13 Nov 2017 12:01:38 -0000

Upgarded curl to version 7.56.1. Removed few patches fixing CVEs, since
those fixes are included in the this release. Also removed installation
of 'curl/curlbuild.h', which has been removed in v7.55.0.
---
 meta/recipes-support/curl/{curl_7.54.1.bb => curl_7.56.1.bb} | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)
 rename meta/recipes-support/curl/{curl_7.54.1.bb => curl_7.56.1.bb} (89%)

diff --git a/meta/recipes-support/curl/curl_7.54.1.bb b/meta/recipes-support/curl/curl_7.56.1.bb
similarity index 89%
rename from meta/recipes-support/curl/curl_7.54.1.bb
rename to meta/recipes-support/curl/curl_7.56.1.bb
index 58f0531..2891a4b 100644
--- a/meta/recipes-support/curl/curl_7.54.1.bb
+++ b/meta/recipes-support/curl/curl_7.56.1.bb
@@ -7,10 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=8;md5=3a34942f4ae3fbf1a303160714e66
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
-           file://CVE-2017-1000099.patch \
-           file://CVE-2017-1000100.patch \
-           file://CVE-2017-1000101.patch \
-           file://CVE-2017-1000254.patch \
 "
 
 SRC_URI_append_class-target = " \
@@ -22,8 +18,8 @@ SRC_URI_append_class-target = " \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "6b6eb722f512e7a24855ff084f54fe55"
-SRC_URI[sha256sum] = "fdfc4df2d001ee0c44ec071186e770046249263c491fcae48df0e1a3ca8f25a0"
+SRC_URI[md5sum] = "428de25834ef8c04076906d6d5c0498e"
+SRC_URI[sha256sum] = "2594670367875e7d87b0f129b5e4690150780884d90244ba0fe3e74a778b5f90"
 
 CVE_PRODUCT = "libcurl"
 inherit autotools pkgconfig binconfig multilib_header
@@ -64,10 +60,6 @@ EXTRA_OECONF = " \
     --without-libpsl \
 "
 
-do_install_append() {
-	oe_multilib_header curl/curlbuild.h
-}
-
 do_install_append_class-target() {
 	# cleanup buildpaths from curl-config
 	sed -i \
-- 
2.7.4


