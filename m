Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id B04F1776F2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 11:26:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 10 Mar 2017 03:26:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,140,1486454400"; d="scan'208";a="1106988281"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 10 Mar 2017 03:26:12 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Mar 2017 13:24:21 +0200
Message-Id: <20eab4c373b113b90c440d8d134572e127628947.1489144807.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 42/44] db: do the multilib_header processing for db.h
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
X-List-Received-Date: Fri, 10 Mar 2017 11:26:12 -0000

As it varies from one machine to another.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/db/db_5.3.28.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index 4f5aae60132..b7232fc8942 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -28,7 +28,7 @@ SRC_URI[sha256sum] = "e0a992d740709892e81f9d93f06daf305cf73fb81b545afe7247804317
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ed1158e31437f4f87cdd4ab2b8613955"
 
-inherit autotools
+inherit autotools multilib_header
 
 # Put virtual/db in any appropriate provider of a
 # relational database, use it as a dependency in
@@ -96,6 +96,8 @@ do_install_append() {
 	ln -s db51/db.h ${D}/${includedir}/db.h
 	ln -s db51/db_cxx.h ${D}/${includedir}/db_cxx.h
 
+        oe_multilib_header db51/db.h
+
 	# The docs end up in /usr/docs - not right.
 	if test -d "${D}/${prefix}/docs"
 	then
-- 
2.11.0


