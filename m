Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TBTIt-0002Ln-Uh
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 18:27:12 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 Sep 2012 09:14:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,406,1344236400"; d="scan'208";a="220783433"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.156])
	by fmsmga001.fm.intel.com with ESMTP; 11 Sep 2012 09:14:39 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 18:19:46 +0300
Message-Id: <80c5e5ef599efe6e9a33daa96ff3d516eccdf404.1347376068.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1347376068.git.constantinx.musca@intel.com>
References: <cover.1347376068.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1347376068.git.constantinx.musca@intel.com>
References: <cover.1347376068.git.constantinx.musca@intel.com>
Subject: [PATCH 1/5] boost: upgrade to 1.51.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 16:27:12 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../boost/{boost_1.50.0.bb => boost_1.51.0.bb}     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/boost/{boost_1.50.0.bb => boost_1.51.0.bb} (53%)

diff --git a/meta/recipes-support/boost/boost_1.50.0.bb b/meta/recipes-support/boost/boost_1.51.0.bb
similarity index 53%
rename from meta/recipes-support/boost/boost_1.50.0.bb
rename to meta/recipes-support/boost/boost_1.51.0.bb
index 78ebf1e..1564b0e 100644
--- a/meta/recipes-support/boost/boost_1.50.0.bb
+++ b/meta/recipes-support/boost/boost_1.51.0.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 PR = "${INC_PR}.0"
 
 SRC_URI += "file://arm-intrinsics.patch"
-SRC_URI[md5sum] = "52dd00be775e689f55a987baebccc462"
-SRC_URI[sha256sum] = "c9ace2b8c81fa6703d1d17c7e478de3bc51101c5adbdeb3f6cb72cf3045a8529"
+SRC_URI[md5sum] = "4b6bd483b692fd138aef84ed2c8eb679"
+SRC_URI[sha256sum] = "fb2d2335a29ee7fe040a197292bfce982af84a645c81688a915c84c925b69696"
-- 
1.7.9.5



