Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8BEF87847C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 21:09:18 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id g25so44801323lfh.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 14:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Oj5uRSHppYxyARQnPQDYcpxVierxf7XqbPWikXX/CME=;
	b=qfTe/yLh4TzSkM6eMEzkRkdoWu+vs9aYo5zR5NIT9fPtkyF410TbYS7gKDPnqXlv+d
	BMOCOrv+lf4mRTO01Rmv2+xSsp2c1q/l3ghA29SSkBZKZvydXDXSCQOgwsMMkiquN0Ie
	c7Xpz9MUsZ4NCP8x1tt8PaDebHcx77L5Uo5I49Js7vGcc3hsCUqdn+YAeffgRtdrzFEz
	ZieuM46q+xgrwkhlf7NR2jXRVeHmcZuRBHXd/iwiMs0J17e/XpH4EAZIFIv9AfsTD4Fa
	YOCDlxAgSwK5JOO5PIMuXeDVZpFgVSFGkyaqTu8NJRrFc8qj1G28AMWO9zeAfZHWBLmm
	MtQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Oj5uRSHppYxyARQnPQDYcpxVierxf7XqbPWikXX/CME=;
	b=kgNFQhn25KTpJCXBZNdZG771GnUfuOB87mi4jpS0mKTYfLO0CZawzAavLFhqa7ZptN
	ht4amEpQFbeF2zzj58C0KYR/0rqt9KZh6BXoq9bmMm9e4stRKvHOiYd346XRYd3n0oAA
	5qhBB6VS6QLWtwZVVsZ7B5/VM7H62Vtkm4ym5ER6iD3MJtlC2Hh44OiDkX7vqcTR4uNW
	EGkQk1h2c38CHdp/O5gmbozZw6bCqkJ9I9aJR0aDiHuJ5HP65fsd//B/MyptWzjPrKUr
	9BFwlA4GwNDOYyx4welNe69EFvZv/18Be9Hwo6XkX4iHAqV8ZWev7dvOLFKNrXKKg7/F
	S2Yw==
X-Gm-Message-State: AHYfb5iJQwiqzWWYi3n205NFW6zalBis5AYypf7ppQwe1xSz4TfeUx+p
	CdUl4ZX8wFYuVVp4tkw=
X-Received: by 10.46.21.84 with SMTP id 20mr8487066ljv.72.1502744958449;
	Mon, 14 Aug 2017 14:09:18 -0700 (PDT)
Received: from ubuntu.office.pelagicore.net
	(h-79-136-12-196.NA.cust.bahnhof.se. [79.136.12.196])
	by smtp.gmail.com with ESMTPSA id 15sm1302534ljw.35.2017.08.14.14.09.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Aug 2017 14:09:17 -0700 (PDT)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Aug 2017 23:09:08 +0200
Message-Id: <1502744948-29741-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: [PATCH] curl: upgrade to 7.55.1
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
X-List-Received-Date: Mon, 14 Aug 2017 21:09:18 -0000

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 meta/recipes-support/curl/{curl_7.54.1.bb => curl_7.55.1.bb} | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)
 rename meta/recipes-support/curl/{curl_7.54.1.bb => curl_7.55.1.bb} (92%)

diff --git a/meta/recipes-support/curl/curl_7.54.1.bb b/meta/recipes-support/curl/curl_7.55.1.bb
similarity index 92%
rename from meta/recipes-support/curl/curl_7.54.1.bb
rename to meta/recipes-support/curl/curl_7.55.1.bb
index f42582a..0074a74 100644
--- a/meta/recipes-support/curl/curl_7.54.1.bb
+++ b/meta/recipes-support/curl/curl_7.55.1.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "6b6eb722f512e7a24855ff084f54fe55"
-SRC_URI[sha256sum] = "fdfc4df2d001ee0c44ec071186e770046249263c491fcae48df0e1a3ca8f25a0"
+SRC_URI[md5sum] = "8c153f282bbe482495214654cdcd4182"
+SRC_URI[sha256sum] = "e5b1a92ed3b0c11f149886458fa063419500819f1610c020d62f25b8e4b16cfb"
 
 CVE_PRODUCT = "libcurl"
 inherit autotools pkgconfig binconfig multilib_header
@@ -53,10 +53,6 @@ EXTRA_OECONF = " \
     --without-nghttp2 \
 "
 
-do_install_append() {
-	oe_multilib_header curl/curlbuild.h
-}
-
 do_install_append_class-target() {
 	# cleanup buildpaths from curl-config
 	sed -i -e 's,${STAGING_DIR_HOST},,g' ${D}${bindir}/curl-config
-- 
2.7.4


