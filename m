Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id ADBC67865C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 12:47:26 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id n69so18203055lfn.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 04:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=3q7wGpfMispv005bOmjNzImWilrgc9lRfrf7HBWVAmQ=;
	b=c9ZJpO05pFIDpbG8pR2jJE5u3HouPiZB8u5ATUhUoHr7Jb53YJAM2cii4ThqWEvDfn
	KkAH6b/BM2/Sufr1kWzi8jIQ8CCBey+SBNxyR0IL6vTCuBGM0v/5qLrfQeUXl5TI/ekU
	PewIvYrEd2l1fmU6Jl7fiAKep/7OGMZAXCxREwz8Jn3+94pOGYvGqK6OV9S7gWNXUAOq
	I8NAr35LIsPCc+ghTV5J/082fIpbQkhXJ1EMeMm1SyOuJ7ckG+0mso40bJMaSmf4SBk5
	Ch2yLmNrZO4k26zjp7ZVdPUNunqOdo9I4XrRfMD/Na0j182CfPfQqfMMLCPsFcj176nP
	00SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3q7wGpfMispv005bOmjNzImWilrgc9lRfrf7HBWVAmQ=;
	b=NHJbObXn1unPltnVEZ4A2zW0Murrg38vLS603pJTh2xdeBm/Q9IsXDA/41/6wfd1yS
	iFB9mx3CHh1J9pITctqgaRELy/OWL8LF6H+IZMiSGbFMsjY3hXFr6bxBP6xB1Od5F0AG
	aX+1Lmy65UN4vmC/jwaKdF8dDXktHNuPRZ+t1DDSyD0DHgUyLh8Y/WN04qe8kASyMs36
	arQ1yD4ITR03N+UeR8RALR9DZ9Kdss1Mg5PhGmR4zCNug9HIXAflROm7xp9HBR45ZcBZ
	2fw/lGDiRVRz5hsjuET66Jega3zmOGQ/dOfgGf5OsVURvtn5HSqoG1mEnyYXFgzlSPly
	kNDA==
X-Gm-Message-State: AJaThX7HLlZq7Bcepn3zQgF+C/m/NRfg6fAwWJI92BQroh0h5lYs6aI6
	QYfvEfyw+baZ2JZ0BQO2tL9t+dFj
X-Google-Smtp-Source: AGs4zMZ44rS9PMrToevVQ5hC8chKcjuxVvwtJGgKLDUC+lSjWoVLRR524uK22vjT9gFjGaPJJ0YR8Q==
X-Received: by 10.25.163.11 with SMTP id m11mr3028687lfe.179.1510577245726;
	Mon, 13 Nov 2017 04:47:25 -0800 (PST)
Received: from ubuntu.office.pelagicore.net ([83.218.80.243])
	by smtp.gmail.com with ESMTPSA id
	a17sm2870587lfl.40.2017.11.13.04.47.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Nov 2017 04:47:25 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Nov 2017 13:47:12 +0100
Message-Id: <1510577232-30262-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: [PATCH v3] curl: upgrade to 7.56.1
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
X-List-Received-Date: Mon, 13 Nov 2017 12:47:26 -0000

Upgarded curl to version 7.56.1. Removed few patches fixing CVEs, since
those fixes are included in the this release.

Also removed installation of 'curl/curlbuild.h', which has been removed
in v7.55.0:
http://daniel.haxx.se/blog/2017/06/15/target-independent-libcurl-headers

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 .../curl/{curl_7.54.1.bb => curl_7.56.1.bb}                | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)
 rename meta/recipes-support/curl/{curl_7.54.1.bb => curl_7.56.1.bb} (87%)

diff --git a/meta/recipes-support/curl/curl_7.54.1.bb b/meta/recipes-support/curl/curl_7.56.1.bb
similarity index 87%
rename from meta/recipes-support/curl/curl_7.54.1.bb
rename to meta/recipes-support/curl/curl_7.56.1.bb
index 58f0531..830f350 100644
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
@@ -22,11 +18,11 @@ SRC_URI_append_class-target = " \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "6b6eb722f512e7a24855ff084f54fe55"
-SRC_URI[sha256sum] = "fdfc4df2d001ee0c44ec071186e770046249263c491fcae48df0e1a3ca8f25a0"
+SRC_URI[md5sum] = "428de25834ef8c04076906d6d5c0498e"
+SRC_URI[sha256sum] = "2594670367875e7d87b0f129b5e4690150780884d90244ba0fe3e74a778b5f90"
 
 CVE_PRODUCT = "libcurl"
-inherit autotools pkgconfig binconfig multilib_header
+inherit autotools pkgconfig binconfig
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} gnutls proxy threaded-resolver zlib"
 PACKAGECONFIG_class-native = "ipv6 proxy ssl threaded-resolver zlib"
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


