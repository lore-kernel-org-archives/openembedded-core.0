Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3BC3B7017D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 12:39:05 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id g35so3877392lfi.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 04:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=T5R/q4DZAbL8J27mX0YNtiwsvrMKI2ly2aBOXm8Y8t8=;
	b=p9t0KdmAKHJl3ANKQXaGCDToS5EoN51js6NLvOVawMvhLEuP8vyvEqL6f3M5Pcw+qc
	/XF/dh8tc79P9ppkIIoxDbIMUB6iPjsJGScJuKskPqR/t0OChhUahyL3cK5FZXRO0aie
	IdPWSWdl9VmIbg0yF5+231D1qT+GT3LnaeGEwE0EJUGtdZFQ+mZAVipEZ4/m+Ofounw7
	+LDjv7hd+zbK+W/izHtpKm5qDW17R+uOoHOZ+p8Nq/8b+aaXV6GGIRonxvznigqlhghM
	naFtC8OMjkkEkiZm6k0a+h5mu73aeiU1fuCZBjA+OcnwZEsUWNG4TK3rR8whPCaRAhTP
	H7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=T5R/q4DZAbL8J27mX0YNtiwsvrMKI2ly2aBOXm8Y8t8=;
	b=ZskTR2NRT/lxKEE//eoQUX2KNV3sUPgDb1V4WcwDDuT2dSG6oe0v4gjQHf4fOQ4LJ8
	Cq+Svwhx4COOLlNcKnXCrjoJDyy3aet1OZ7VO0vmUsEf35lxQwRSP2GmNLJ/ZVxPnBMI
	6L5p4mxqb1k8JZ0RU1D+hivsailmF0TbjSseRkk/G4c1Y+mRIvB5UUNXR5EhLRQMbmQh
	Za5z4pj8qtvNlNCmZVZmLMv+PXy8DhiUeJDoC57+Pk7SJSb5xTC1w/MayJsKKS6Toro2
	pVv5xt7v2UvAEfBaj+Lexr1Rp8qTJowc7wLp5hyvCS09E9jDTXjMcS0zmZROBSXxrTfU
	2fhQ==
X-Gm-Message-State: AJaThX7uGSJYEOooWXuhLOWRi+CRjLPDuvsElLxNJehD94nNPK1ahO+n
	ctMFSPmPf0p1jMSw40nZrAkFSfSE
X-Google-Smtp-Source: AGs4zMaVcHe+n4OxULjA2lE8TfjFDvNbga82Ma03sAdbWPlTZIQhTi/4fC/eLZwxajsz4CczfV6a1Q==
X-Received: by 10.25.115.8 with SMTP id o8mr1082561lfc.203.1510576744935;
	Mon, 13 Nov 2017 04:39:04 -0800 (PST)
Received: from ubuntu.office.pelagicore.net ([83.218.80.243])
	by smtp.gmail.com with ESMTPSA id
	g79sm3215161lji.90.2017.11.13.04.39.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Nov 2017 04:39:04 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Nov 2017 13:38:42 +0100
Message-Id: <1510576722-29881-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: [PATCH v2] curl: upgrade to 7.56.1
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
X-List-Received-Date: Mon, 13 Nov 2017 12:39:06 -0000

Upgarded curl to version 7.56.1. Removed few patches fixing CVEs, since
those fixes are included in the this release.

Also removed installation of 'curl/curlbuild.h', which has been removed
in v7.55.0:
http://daniel.haxx.se/blog/2017/06/15/target-independent-libcurl-headers

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
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


