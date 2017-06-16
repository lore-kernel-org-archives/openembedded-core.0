Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 68C23784D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:29:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 05:29:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="1161279620"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2017 05:29:19 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:28:55 +0300
Message-Id: <a3c7df04cd013e36c85918051c0a266bc43c59e1.1497615866.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 32/32] dmidecode: update to 3.1
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
X-List-Received-Date: Fri, 16 Jun 2017 12:29:31 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-devtools/dmidecode/{dmidecode_3.0.bb => dmidecode_3.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/dmidecode/{dmidecode_3.0.bb => dmidecode_3.1.bb} (80%)

diff --git a/meta/recipes-devtools/dmidecode/dmidecode_3.0.bb b/meta/recipes-devtools/dmidecode/dmidecode_3.1.bb
similarity index 80%
rename from meta/recipes-devtools/dmidecode/dmidecode_3.0.bb
rename to meta/recipes-devtools/dmidecode/dmidecode_3.1.bb
index 109a9d2ee88..f83281e2359 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_3.0.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_3.1.bb
@@ -18,6 +18,6 @@ do_unpack_extra() {
 }
 addtask unpack_extra after do_unpack before do_patch
 
-SRC_URI[md5sum] = "281ee572d45c78eca73a14834c495ffd"
-SRC_URI[sha256sum] = "7ec35bb193729c1d593a1460b59d82d24b89102ab23fd0416e6cf4325d077e45"
+SRC_URI[md5sum] = "679c2c015c515aa6ca5f229aee49c102"
+SRC_URI[sha256sum] = "d766ce9b25548c59b1e7e930505b4cad9a7bb0b904a1a391fbb604d529781ac0"
 
-- 
2.11.0


