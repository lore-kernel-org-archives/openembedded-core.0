Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D4F7271CBD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 06:17:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBL6HEW5025418
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 22:17:14 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 20 Dec 2016 22:17:14 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Dec 2016 22:17:09 -0800
Message-ID: <fbe2bd209cd41466fc3138b51706e3fdcfdd4235.1482300982.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1482300982.git.liezhi.yang@windriver.com>
References: <cover.1482300982.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] mklibs-native: 0.1.41 -> 0.1.43
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
X-List-Received-Date: Wed, 21 Dec 2016 06:17:14 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../mklibs/{mklibs-native_0.1.41.bb => mklibs-native_0.1.43.bb}   | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/mklibs/{mklibs-native_0.1.41.bb => mklibs-native_0.1.43.bb} (71%)

diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.41.bb b/meta/recipes-devtools/mklibs/mklibs-native_0.1.43.bb
similarity index 71%
rename from meta/recipes-devtools/mklibs/mklibs-native_0.1.41.bb
rename to meta/recipes-devtools/mklibs/mklibs-native_0.1.43.bb
index 4cf1a5cfe2b..e2444da36d4 100644
--- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.41.bb
+++ b/meta/recipes-devtools/mklibs/mklibs-native_0.1.43.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=98d31037b13d896e33890738ef01af64"
 DEPENDS = "python-native"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20160207T221625Z/pool/main/m/${BPN}/${BPN}_${PV}.tar.xz \
+SRC_URI = "http://snapshot.debian.org/archive/debian-debug/20161123T150725Z/pool/main/m/${BPN}/${BPN}_${PV}.tar.xz \
 	file://ac_init_fix.patch\
 	file://fix_STT_GNU_IFUNC.patch\
 	file://sysrooted-ldso.patch \
@@ -15,9 +15,11 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20160207T221625Z/pool/main/
 	file://fix_cross_compile.patch \
 "
 
-SRC_URI[md5sum] = "6b2979876a611717df3d49e7f9cf291d"
-SRC_URI[sha256sum] = "058c7349f8ec8a03b529c546a95cd6426741bd819f1e1211f499273eb4bf5d89"
+SRC_URI[md5sum] = "39b08a173454e5210ab3f598e94179bf"
+SRC_URI[sha256sum] = "6f0cf24ade13fff76e943c003413d85c3e497c984c95c1ecea1c9731ca86f13c"
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/m/mklibs/"
 
 inherit autotools gettext native pythonnative
+
+S = "${WORKDIR}/${BPN}"
-- 
2.11.0.rc2.dirty


