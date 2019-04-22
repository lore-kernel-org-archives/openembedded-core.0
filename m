Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
	[209.85.208.172])
	by mail.openembedded.org (Postfix) with ESMTP id D66ED6C4E6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 22:45:18 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id l7so11666604ljg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 15:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=CtL0/44o+fY2lp4V1cHdccC8Ekib6MpXTsxZ8IfdPc4=;
	b=cqdMHBsl1V5kq3TdpxAT7liD0qO6b7enF4ZNkgemXEBhWkFlWZ4O8EKrf31cAoTJqv
	rKVOkDxZp09T2jyK2witaBGKdGupCtIQw9eWZaSA7Eurf1qNkTIGEQ+J7PlOEM+DYXJn
	YBvQ9akTGyWd577R1I3kilQHlRQtn4S0rha4iKKJCgUh7+Do5I3u3d8ozpt27GyhVlGk
	oINI9zGcC7o05U/fD4Xo45aMQUR5USeMJ9fcys7D4MN4WCVLKU/+X9+ROw7vMIGtQBz2
	FUnUtrrAsgHILxio1HX7ASTGH1MzZkaB9drnyN/P85VUdgh+Y+2h8o0lqvGb/JL70ImD
	4CeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CtL0/44o+fY2lp4V1cHdccC8Ekib6MpXTsxZ8IfdPc4=;
	b=GmVlCLfd+EYoml5Y6+556zWdPMruyDsLeRvoPXGq08VEGUHzcv13BL1raqbatO75fC
	fg3zZT1dSfh3UvRfz9vooLaKVU/3/qSI+SQ8xCVsGHlYfabBi3CDsaa7/ddbey/nEI40
	r9CYr8U4Ge/HjT+wDshjdUUzHBV0t5Ejjhm3XUyIBfdtQ/rBLRMC57UadNlgZmj9srsh
	L5JoSNR0qFiqWFuY/INa/5WFppl6T6HTb1NGo004Ykqs7oRtsh28GWAA4o0OaWUwThCC
	JNLteFK2C11thcXmol8qa1S5drrHD3BRLN8dPGRSo6A5ImtQBFHuSg1Q2gXXVnQnRTwA
	w6Zw==
X-Gm-Message-State: APjAAAW9CRsHzfRHDDzrBh3wGNlyUMOgY3PVScrbQbfAW6NBdmzCs1uc
	BCuPfhZRVpZGy53xCmAW7kNMUUOMhcE=
X-Google-Smtp-Source: APXvYqxf7LPk6wUErGAuE6qrIbXV1SArASClSPaNA18NXAnxYGeKJK/G5LPK1uSVBbw+I0nuYG+2tA==
X-Received: by 2002:a2e:8618:: with SMTP id a24mr11463084lji.192.1555973118849;
	Mon, 22 Apr 2019 15:45:18 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id g8sm3293625lfg.4.2019.04.22.15.45.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Apr 2019 15:45:18 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2019 00:45:15 +0200
Message-Id: <20190422224515.4546-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libpng: update to 1.6.37
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
X-List-Received-Date: Mon, 22 Apr 2019 22:45:19 -0000

Removed patch was upsteamed.

License checksums were changed due to modified copyright year and fixed
typo in LICENSE file (see @fef895aa28 and @8da8257d0b).

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libpng/libpng/CVE-2019-7317.patch         | 20 -------------------
 .../{libpng_1.6.36.bb => libpng_1.6.37.bb}    | 11 +++++-----
 2 files changed, 5 insertions(+), 26 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libpng/libpng/CVE-2019-7317.patch
 rename meta/recipes-multimedia/libpng/{libpng_1.6.36.bb => libpng_1.6.37.bb} (70%)

diff --git a/meta/recipes-multimedia/libpng/libpng/CVE-2019-7317.patch b/meta/recipes-multimedia/libpng/libpng/CVE-2019-7317.patch
deleted file mode 100644
index 6ee1f8da30..0000000000
--- a/meta/recipes-multimedia/libpng/libpng/CVE-2019-7317.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Use-after-free detected with static analysis.
-
-CVE: CVE-2019-7317
-Upstream-Status: Submitted [https://github.com/glennrp/libpng/issues/275]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/png.c b/png.c
-index 9d9926f638..efd1aecfbd 100644
---- a/png.c
-+++ b/png.c
-@@ -4588,8 +4588,7 @@ png_image_free(png_imagep image)
-    if (image != NULL && image->opaque != NULL &&
-       image->opaque->error_buf == NULL)
-    {
--      /* Ignore errors here: */
--      (void)png_safe_execute(image, png_image_free_function, image);
-+      png_image_free_function(image);
-       image->opaque = NULL;
-    }
- }
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.36.bb b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
similarity index 70%
rename from meta/recipes-multimedia/libpng/libpng_1.6.36.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.37.bb
index a586237888..66af2f3d60 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.36.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
@@ -2,17 +2,16 @@ SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=12b4ec50384c800bc568f519671b120c \
-                    file://png.h;endline=144;md5=15ae15f53376306868259924a9db4e05 \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b0085051bf265bac2bfc38bc89f50000\
+                    file://png.h;endline=144;md5=8acd23d544623816b097e07be0139509\
                     "
 DEPENDS = "zlib"
 
 LIBV = "16"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz \
-           file://CVE-2019-7317.patch"
-SRC_URI[md5sum] = "df2be2d29c40937fe1f5349b16bc2826"
-SRC_URI[sha256sum] = "eceb924c1fa6b79172fdfd008d335f0e59172a86a66481e09d4089df872aa319"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz"
+SRC_URI[md5sum] = "015e8e15db1eecde5f2eb9eb5b6e59e9"
+SRC_URI[sha256sum] = "505e70834d35383537b6491e7ae8641f1a4bed1876dbfe361201fc80868d88ca"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/${PV}/"
 
-- 
2.17.1


