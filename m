Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EF0237C692
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 03:04:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1F34H6M009344
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 19:04:17 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.435.0; Thu, 14 Feb 2019 19:04:16 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Feb 2019 11:22:21 +0800
Message-ID: <b1072d66374be795a9a6210bdad5d2cb19f1a569.1550200881.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1550200881.git.liezhi.yang@windriver.com>
References: <cover.1550200881.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] mklibs-native: 0.1.43 -> 0.1.44
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
X-List-Received-Date: Fri, 15 Feb 2019 03:04:16 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../mklibs/{mklibs-native_0.1.43.bb => mklibs-native_0.1.44.bb}   | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/mklibs/{mklibs-native_0.1.43.bb => mklibs-native_0.1.44.bb} (71%)

diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.43.bb b/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
similarity index 71%
rename from meta/recipes-devtools/mklibs/mklibs-native_0.1.43.bb
rename to meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
index a161476..1784af1 100644
--- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.43.bb
+++ b/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
@@ -5,7 +5,7 @@ SECTION = "devel"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=98d31037b13d896e33890738ef01af64"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20161123T152011Z/pool/main/m/mklibs/mklibs_${PV}.tar.xz \
+SRC_URI = "http://snapshot.debian.org/archive/debian/20180828T214102Z/pool/main/m/mklibs/mklibs_${PV}.tar.xz \
 	file://ac_init_fix.patch\
 	file://fix_STT_GNU_IFUNC.patch\
 	file://sysrooted-ldso.patch \
@@ -14,11 +14,9 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20161123T152011Z/pool/main/
 	file://fix_cross_compile.patch \
 "
 
-SRC_URI[md5sum] = "39b08a173454e5210ab3f598e94179bf"
-SRC_URI[sha256sum] = "6f0cf24ade13fff76e943c003413d85c3e497c984c95c1ecea1c9731ca86f13c"
+SRC_URI[md5sum] = "6b6eeb9b4016c6a7317acc28c89e32cc"
+SRC_URI[sha256sum] = "3af0b6bd35e5b6fc58d8b68827fbae2ff6b7e20dd2b238ccb9b49d84722066c2"
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/m/mklibs/"
 
 inherit autotools gettext native
-
-S = "${WORKDIR}/mklibs"
-- 
2.7.4


