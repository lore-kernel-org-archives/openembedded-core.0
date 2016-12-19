Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0C2D670016
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 06:07:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBJ67GxQ024197
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2016 22:07:16 -0800 (PST)
Received: from pek-lpgtest20.wrs.com (128.224.179.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Sun, 18 Dec 2016 22:07:16 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Dec 2016 14:07:13 +0800
Message-ID: <1d8d15e8fd9c4c9c1eeb6f13e5b069df6d995dce.1482127585.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1482127585.git.dengke.du@windriver.com>
References: <cover.1482127585.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] cdrtools-native: update 3.01 -> 3.02
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
X-List-Received-Date: Mon, 19 Dec 2016 06:07:16 -0000
Content-Type: text/plain

3.01a31 -> 3.02a07

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../{cdrtools-native_3.01.bb => cdrtools-native_3.02.bb}       | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/cdrtools/{cdrtools-native_3.01.bb => cdrtools-native_3.02.bb} (69%)

diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.02.bb
similarity index 69%
rename from meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
rename to meta/recipes-devtools/cdrtools/cdrtools-native_3.02.bb
index ff4d5ac..f8b9386 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.02.bb
@@ -7,17 +7,17 @@ SECTION = "console/utils"
 LICENSE = "GPLv2 & CDDL-1.0 & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=32f68170be424c2cd64804337726b312"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/cdrtools/cdrtools-${REALPV}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/cdrtools/alpha/cdrtools-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "7d45c5b7e1f78d85d1583b361aee6e8b"
-SRC_URI[sha256sum] = "ed282eb6276c4154ce6a0b5dee0bdb81940d0cbbfc7d03f769c4735ef5f5860f"
+SRC_URI[md5sum] = "ea362a6a42d8aa0d5fc154d195f47926"
+SRC_URI[sha256sum] = "49c1a67fa7ad3d7c0b05d41d18cb6677b40d4811faba111f0c01145d3ef0491b"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
 inherit native
 
-PV = "3.01a31+really3.01"
-REALPV = "3.01"
+PV = "3.02a07"
+REALPV = "3.02"
 
 S = "${WORKDIR}/${BPN}-${REALPV}"
 
-- 
2.7.4


