Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 21E216CABC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 12:46:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Oct 2013 05:46:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,498,1378882800"; d="scan'208";a="417091169"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 15 Oct 2013 05:46:12 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2013 15:45:58 +0300
Message-Id: <54f855b2ad4d6373947d948968e413d4029f9c83.1381841061.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1381841061.git.laurentiu.palcu@intel.com>
References: <cover.1381841061.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1381841061.git.laurentiu.palcu@intel.com>
References: <cover.1381841061.git.laurentiu.palcu@intel.com>
Subject: [PATCH 01/10] byacc: upgrade to 20130925
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
X-List-Received-Date: Tue, 15 Oct 2013 12:46:11 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../byacc/{byacc_20130304.bb => byacc_20130925.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/byacc/{byacc_20130304.bb => byacc_20130925.bb} (74%)

diff --git a/meta/recipes-extended/byacc/byacc_20130304.bb b/meta/recipes-extended/byacc/byacc_20130925.bb
similarity index 74%
rename from meta/recipes-extended/byacc/byacc_20130304.bb
rename to meta/recipes-extended/byacc/byacc_20130925.bb
index da79833..8e68db8 100644
--- a/meta/recipes-extended/byacc/byacc_20130304.bb
+++ b/meta/recipes-extended/byacc/byacc_20130925.bb
@@ -7,5 +7,5 @@ LICENSE="PD"
 LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=f186cf0d59bac042b75830396ec389a3"
 require byacc.inc
 
-SRC_URI[md5sum] = "e5eef96a33f55b724f2a957f0fa3b019"
-SRC_URI[sha256sum] = "dd8397174e088baf57cf4d344023a34b0758b7bbb8a1dfcdafdc234b8eb57924"
+SRC_URI[md5sum] = "265f74058b923d7d9ddd1bd82f05a42e"
+SRC_URI[sha256sum] = "e2560caab28396fc732a946e722cf5c6220e72388e70cdcc23bf67ae88799b31"
-- 
1.7.9.5


