Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id C6548776BD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 11:25:26 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 10 Mar 2017 03:25:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,140,1486454400"; d="scan'208";a="1106988121"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 10 Mar 2017 03:25:27 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Mar 2017 13:23:41 +0200
Message-Id: <1959020b4af59b423494a6c83d6dce8a727be0fa.1489144807.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 02/44] libsolv: enable rpm support
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
X-List-Received-Date: Fri, 10 Mar 2017 11:25:27 -0000

This is required by libdnf.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/libsolv/libsolv_0.6.24.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.6.24.bb b/meta/recipes-extended/libsolv/libsolv_0.6.24.bb
index 6de38b59157..3d8b581f851 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.6.24.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.6.24.bb
@@ -5,7 +5,7 @@ SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 
-DEPENDS = "expat zlib"
+DEPENDS = "expat zlib rpm"
 
 SRC_URI = "git://github.com/openSUSE/libsolv.git \
            file://0001-Split-libsolvext-into-it-s-own-pkg-config-file.patch \
@@ -19,7 +19,7 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
-EXTRA_OECMAKE = "-DLIB=${baselib} -DMULTI_SEMANTICS=ON"
+EXTRA_OECMAKE = "-DLIB=${baselib} -DMULTI_SEMANTICS=ON -DENABLE_RPMMD=ON -DENABLE_RPMDB=ON"
 
 PACKAGES =+ "${PN}-tools ${PN}ext"
 
-- 
2.11.0


