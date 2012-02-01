Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RsiI4-000078-70
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 23:04:32 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 01 Feb 2012 13:55:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="102140810"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 01 Feb 2012 13:55:23 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2012 13:55:15 -0800
Message-Id: <6e7973add09749de3b14543fde53791076063657.1328133261.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1328133261.git.nitin.a.kamble@intel.com>
References: <cover.1328133261.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/8] byacc: upggrade from 20111219 to 20120115
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Feb 2012 22:04:32 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

update md5sum for license as the copyright years are updated in the file

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../byacc/{byacc_20111219.bb => byacc_20120115.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/byacc/{byacc_20111219.bb => byacc_20120115.bb} (59%)

diff --git a/meta/recipes-extended/byacc/byacc_20111219.bb b/meta/recipes-extended/byacc/byacc_20120115.bb
similarity index 59%
rename from meta/recipes-extended/byacc/byacc_20111219.bb
rename to meta/recipes-extended/byacc/byacc_20120115.bb
index 4b317c4..4549ca4 100644
--- a/meta/recipes-extended/byacc/byacc_20111219.bb
+++ b/meta/recipes-extended/byacc/byacc_20120115.bb
@@ -6,8 +6,8 @@ PR = "r0"
 # Setting to PD as this is what the upstream has it as.
 
 LICENSE="PD"
-LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=4dc4c30f840a7203fb6edf20b3db849e"
+LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=f186cf0d59bac042b75830396ec389a3"
 require byacc.inc
 
-SRC_URI[md5sum] = "c17542fd9df6e392d495a64f883e29f1"
-SRC_URI[sha256sum] = "ca37eb3702a02efe4a4dd09e0ef26fc91e4c22c36d8d52e45d2f76923fbd99d9"
+SRC_URI[md5sum] = "3061c62c47ec0f43255afd8fc3f7e3ab"
+SRC_URI[sha256sum] = "4034efc9b59646fc61e29b1a87472cccf1d1aaf45435f9d3bf58dec2b5f0831c"
-- 
1.7.6.4



