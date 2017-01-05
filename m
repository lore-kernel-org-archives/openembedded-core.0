Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0DFBE719A3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 16:34:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 05 Jan 2017 08:34:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,322,1477983600"; d="scan'208";a="1079571087"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.28.202])
	by orsmga001.jf.intel.com with ESMTP; 05 Jan 2017 08:34:27 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2017 16:34:23 +0000
Message-Id: <20170105163423.8776-1-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] zlib: update SRC_URI to fix fetching
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
X-List-Received-Date: Thu, 05 Jan 2017 16:34:29 -0000

Upstream have removed the file from zlib.net as a new version has
been released, switch to fetching from the official sourceforge
mirror.

[YOCTO #10879]

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/recipes-core/zlib/zlib_1.2.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/zlib/zlib_1.2.8.bb b/meta/recipes-core/zlib/zlib_1.2.8.bb
index 9470adb..913c703 100644
--- a/meta/recipes-core/zlib/zlib_1.2.8.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.8.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://zlib.h;beginline=4;endline=23;md5=fde612df1e5933c428b73844a0c494fd"
 
-SRC_URI = "http://www.zlib.net/${BPN}-${PV}.tar.xz \
+SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/${BPN}/${PV}/${BPN}-${PV}.tar.xz \
            file://remove.ldconfig.call.patch \
            file://Makefile-runtests.patch \
            file://ldflags-tests.patch \
-- 
2.9.3


