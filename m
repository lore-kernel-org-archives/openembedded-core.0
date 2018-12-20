Return-Path: <Ricky.Yoon@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5DFE479E93
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 10:45:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBKAjlgb002175
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 02:45:47 -0800 (PST)
Received: from localhost.localdomain (128.224.239.137) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.408.0; Thu, 20 Dec 2018 02:45:47 -0800
From: "ricky.yoon" <ricky.yoon@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Dec 2018 19:45:42 +0900
Message-ID: <20181220104542.9046-1-ricky.yoon@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.239.137]
Subject: [PATCH] libpng: Upgrade 1.6.35 -> 1.6.36
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
X-List-Received-Date: Thu, 20 Dec 2018 10:45:46 -0000
Content-Type: text/plain

License-Update: License file changes are due to updates in Version and Copyright date

(From OE-Core rev: dd46638acf5e8ad0af84cbaf5254918b42bb68ce)

Change-Id: I42bda18b0e68626069795487a35a37a3e96a19c6
Signed-off-by: ricky.yoon <ricky.yoon@windriver.com>
---
 .../libpng/{libpng_1.6.35.bb => libpng_1.6.36.bb}         | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.35.bb => libpng_1.6.36.bb} (74%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.35.bb b/meta/recipes-multimedia/libpng/libpng_1.6.36.bb
similarity index 74%
rename from meta/recipes-multimedia/libpng/libpng_1.6.35.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.36.bb
index 5ae0a91a74..3cf4f7249c 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.35.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.36.bb
@@ -2,16 +2,16 @@ SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4791381a76f106ac4699f6261c65ee29 \
-                    file://png.h;endline=144;md5=090ba5769782e8a1663a45fab1c2b36c \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=12b4ec50384c800bc568f519671b120c \
+                    file://png.h;endline=144;md5=15ae15f53376306868259924a9db4e05 \
                     "
 DEPENDS = "zlib"
 
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz"
-SRC_URI[md5sum] = "678b7e696a62a193ed3503b04bf449d6"
-SRC_URI[sha256sum] = "23912ec8c9584917ed9b09c5023465d71709dce089be503c7867fec68a93bcd7"
+SRC_URI[md5sum] = "df2be2d29c40937fe1f5349b16bc2826"
+SRC_URI[sha256sum] = "eceb924c1fa6b79172fdfd008d335f0e59172a86a66481e09d4089df872aa319"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/${PV}/"
 
-- 
2.17.1


