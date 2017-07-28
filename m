Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 38D6078452
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 03:30:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6S3UW1h022954
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 27 Jul 2017 20:30:33 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 27 Jul 2017 20:30:31 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Jul 2017 11:21:06 +0800
Message-ID: <d56ae1e0dab367074d56b8525255beb3d6861256.1501211889.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1501211889.git.kai.kang@windriver.com>
References: <cover.1501211889.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] assimp: upgrade to 4.0.0
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
X-List-Received-Date: Fri, 28 Jul 2017 03:30:35 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade assimp to 4.0.0.

* Because there is also an assimp recipe in meta-oe, so update
  DESCRIPTION, HOMEPAGE and SECTION from it.
* Remove redundant license file
* Update EXTRA_OECMAKE to fix library install path for multilib

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../vulkan/{assimp_git.bb => assimp_4.0.0.bb}       | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)
 rename meta/recipes-graphics/vulkan/{assimp_git.bb => assimp_4.0.0.bb} (41%)

diff --git a/meta/recipes-graphics/vulkan/assimp_git.bb b/meta/recipes-graphics/vulkan/assimp_4.0.0.bb
similarity index 41%
rename from meta/recipes-graphics/vulkan/assimp_git.bb
rename to meta/recipes-graphics/vulkan/assimp_4.0.0.bb
index c519458..0268ebb 100644
--- a/meta/recipes-graphics/vulkan/assimp_git.bb
+++ b/meta/recipes-graphics/vulkan/assimp_4.0.0.bb
@@ -1,14 +1,21 @@
-DESCRIPTION = "Open Asset Import Library"
+DESCRIPTION = "Open Asset Import Library is a portable Open Source library to import \
+               various well-known 3D model formats in a uniform manner."
+HOMEPAGE = "http://www.assimp.org/"
+SECTION = "devel"
+
 LICENSE = "BSD-3-Clause"
-DEPENDS = "zlib"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2119edef0916b0bd511cb3c731076271"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2119edef0916b0bd511cb3c731076271 \
-                    file://code/Assimp.cpp;endline=41;md5=717f847b6e8f43c64cdbafcfea109923"
+DEPENDS = "zlib"
 
 SRC_URI = "git://github.com/assimp/assimp.git"
-SRCREV = "b38ba233f530fdb103d3ede3df5126121af78b10"
+
+SRCREV = "52c8d06f5d6498afd66df983da348a6b112f1314"
+
 S = "${WORKDIR}/git"
 
 inherit cmake
-EXTRA_OECMAKE = "-DASSIMP_BUILD_ASSIMP_TOOLS=OFF -DASSIMP_BUILD_TESTS=OFF"
-FILES_${PN}-dev += "${libdir}/cmake/assimp-3.3"
+
+EXTRA_OECMAKE = "-DASSIMP_BUILD_ASSIMP_TOOLS=OFF -DASSIMP_BUILD_TESTS=OFF -DASSIMP_LIB_INSTALL_DIR=${baselib}"
+
+FILES_${PN}-dev += "${libdir}/cmake/"
-- 
2.10.1


