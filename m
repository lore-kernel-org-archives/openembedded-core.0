Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S2FhR-0008QI-Ne
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 06:34:09 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Feb 2012 21:25:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="130197458"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.37])
	by fmsmga002.fm.intel.com with ESMTP; 27 Feb 2012 21:25:38 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2012 21:25:14 -0800
Message-Id: <a146ce72771d373d07762d217f680ecb927815af.1330406574.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330406574.git.sgw@linux.intel.com>
References: <cover.1330406574.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330406574.git.sgw@linux.intel.com>
References: <cover.1330406574.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 16/36] boost: Update to version 1.49.0
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
X-List-Received-Date: Tue, 28 Feb 2012 05:34:09 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../boost/{boost_1.48.0.bb => boost_1.49.0.bb}     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/boost/{boost_1.48.0.bb => boost_1.49.0.bb} (53%)

diff --git a/meta/recipes-support/boost/boost_1.48.0.bb b/meta/recipes-support/boost/boost_1.49.0.bb
similarity index 53%
rename from meta/recipes-support/boost/boost_1.48.0.bb
rename to meta/recipes-support/boost/boost_1.49.0.bb
index 29e2153..71fdc48 100644
--- a/meta/recipes-support/boost/boost_1.48.0.bb
+++ b/meta/recipes-support/boost/boost_1.49.0.bb
@@ -6,5 +6,5 @@ PR = "${INC_PR}.0"
 
 SRC_URI += "file://arm-intrinsics.patch"
 
-SRC_URI[md5sum] = "d1e9a7a7f532bb031a3c175d86688d95"
-SRC_URI[sha256sum] = "1bf254b2d69393ccd57a3cdd30a2f80318a005de8883a0792ed2f5e2598e5ada"
+SRC_URI[md5sum] = "0d202cb811f934282dea64856a175698"
+SRC_URI[sha256sum] = "dd748a7f5507a7e7af74f452e1c52a64e651ed1f7263fce438a06641d2180d3c"
-- 
1.7.7.6



