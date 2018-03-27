Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 429356AC37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 10:20:26 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w2RAKQ1a015518
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 12:20:27 +0200
Received: from dev.vm6.ccp.siemens.com (sk1d124c.siemens.sk [163.242.57.217])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w2RAKQVc028640;
	Tue, 27 Mar 2018 12:20:26 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id E211695179E;
	Tue, 27 Mar 2018 12:20:25 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Mar 2018 12:20:16 +0200
Message-Id: <20180327102016.3402-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180327083002.24475-1-andrej.valek@siemens.com>
References: <20180327083002.24475-1-andrej.valek@siemens.com>
Subject: [PATCH v3] libpcre: 8.41 -> 8.42
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
X-List-Received-Date: Tue, 27 Mar 2018 10:20:27 -0000

License-Update: The checksum of LIC_FILES_CHKSUM has been changed due to
 time update of copyright LICENCE to 2018. The content of LICENCE has no
 change.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/recipes-support/libpcre/{libpcre_8.41.bb => libpcre_8.42.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre_8.41.bb => libpcre_8.42.bb} (92%)

diff --git a/meta/recipes-support/libpcre/libpcre_8.41.bb b/meta/recipes-support/libpcre/libpcre_8.42.bb
similarity index 92%
rename from meta/recipes-support/libpcre/libpcre_8.41.bb
rename to meta/recipes-support/libpcre/libpcre_8.42.bb
index 0eaed1808a..9efbc240fe 100644
--- a/meta/recipes-support/libpcre/libpcre_8.41.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.42.bb
@@ -6,7 +6,7 @@ SUMMARY = "Perl Compatible Regular Expressions"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=60da32d84d067f53e22071c4ecb4384d"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=fc5026403b44c868c25fc9546f7feb05"
 SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre-${PV}.tar.bz2 \
            file://pcre-cross.patch \
            file://fix-pcre-name-collision.patch \
@@ -14,8 +14,8 @@ SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre-${PV}.tar.bz2 \
            file://Makefile \
 "
 
-SRC_URI[md5sum] = "c160d22723b1670447341b08c58981c1"
-SRC_URI[sha256sum] = "e62c7eac5ae7c0e7286db61ff82912e1c0b7a0c13706616e94a7dd729321b530"
+SRC_URI[md5sum] = "085b6aa253e0f91cae70b3cdbe8c1ac2"
+SRC_URI[sha256sum] = "2cd04b7c887808be030254e8d77de11d3fe9d4505c39d4b15d2664ffe8bf9301"
 
 CVE_PRODUCT = "pcre"
 
-- 
2.11.0


