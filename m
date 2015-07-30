Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6542376497
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 13:31:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 30 Jul 2015 06:31:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,577,1432623600"; d="scan'208";a="758407441"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2015 06:31:02 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 16:31:34 +0300
Message-Id: <c55cc3b94b90b17e1025a7f91b06139c72ab76c3.1438262915.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 05/26] ossp-uuid: update SRC_URI to not use Google Code
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
X-List-Received-Date: Thu, 30 Jul 2015 13:31:27 -0000

Google Code is shutting down so tarballs will be fetched from a Debian mirror
instead

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb b/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
index 33bed75..08926ba 100644
--- a/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
+++ b/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=30;endline=55;md5=b394fadb039bbfca6a
 
 PR = "r2"
 
-SRC_URI = "http://gnome-build-stage-1.googlecode.com/files/uuid-1.6.2.tar.gz \
+SRC_URI = "${DEBIAN_MIRROR}/main/o/${BPN}/${BPN}_${PV}.orig.tar.gz \
 	   file://0001-Change-library-name.patch \
 	   file://0002-uuid-preserve-m-option-status-in-v-option-handling.patch \
 	   file://0003-Fix-whatis-entries.patch \
-- 
2.1.4


