Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0C60677248
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 03:23:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1A3NL2Z003827
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Feb 2017 19:23:21 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Feb 2017 19:23:21 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Feb 2017 19:23:10 -0800
Message-ID: <422a882218f95f35d6fedcd5858d7f8d81ffd714.1486696950.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1486696950.git.liezhi.yang@windriver.com>
References: <cover.1486696950.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 05/10] libpcre: 8.39 -> 8.40
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
X-List-Received-Date: Fri, 10 Feb 2017 03:23:21 -0000
Content-Type: text/plain

The LIC_FILES_CHKSUM is changed because the date is changed, here is
diff result:
< Copyright (c) 1997-2017 University of Cambridge
---
 meta/recipes-support/libpcre/{libpcre_8.39.bb => libpcre_8.40.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre_8.39.bb => libpcre_8.40.bb} (92%)

diff --git a/meta/recipes-support/libpcre/libpcre_8.39.bb b/meta/recipes-support/libpcre/libpcre_8.40.bb
similarity index 92%
rename from meta/recipes-support/libpcre/libpcre_8.39.bb
rename to meta/recipes-support/libpcre/libpcre_8.40.bb
index 2d4668b52de..6396872d80c 100644
--- a/meta/recipes-support/libpcre/libpcre_8.39.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.40.bb
@@ -6,7 +6,7 @@ SUMMARY = "Perl Compatible Regular Expressions"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=b8221cbf43c5587f90ccf228f1185cc2"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=60da32d84d067f53e22071c4ecb4384d"
 SRC_URI = "ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-${PV}.tar.bz2 \
            file://pcre-cross.patch \
            file://fix-pcre-name-collision.patch \
@@ -14,8 +14,8 @@ SRC_URI = "ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-${PV}.tar.
            file://Makefile \
 "
 
-SRC_URI[md5sum] = "e3fca7650a0556a2647821679d81f585"
-SRC_URI[sha256sum] = "b858099f82483031ee02092711689e7245586ada49e534a06e678b8ea9549e8b"
+SRC_URI[md5sum] = "41a842bf7dcecd6634219336e2167d1d"
+SRC_URI[sha256sum] = "00e27a29ead4267e3de8111fcaa59b132d0533cdfdbdddf4b0604279acbcf4f4"
 
 S = "${WORKDIR}/pcre-${PV}"
 
-- 
2.11.0.rc2.dirty


