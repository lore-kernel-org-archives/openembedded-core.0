Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 34B39771E8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 20:24:36 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2017 12:24:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,137,1486454400"; d="scan'208";a="74304921"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 09 Mar 2017 12:24:36 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Mar 2017 22:23:30 +0200
Message-Id: <20170309202331.5595-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170309202331.5595-1-alexander.kanavin@linux.intel.com>
References: <20170309202331.5595-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/4] db: do the multilib_header processing for db.h
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
X-List-Received-Date: Thu, 09 Mar 2017 20:24:36 -0000

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


