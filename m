Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LHh-0001UR-R6
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:44:46 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Mar 2012 17:35:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129565520"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by fmsmga001.fm.intel.com with ESMTP; 15 Mar 2012 17:35:57 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:21 +0800
Message-Id: <fe0c82ae9a2f64cbb184276b0646199b70d33618.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 24/60] dropbear: upgrade to 2012.55
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
X-List-Received-Date: Fri, 16 Mar 2012 00:44:46 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../configure.patch                                |    0
 meta/recipes-core/dropbear/dropbear_2011.54.bb     |    6 ------
 meta/recipes-core/dropbear/dropbear_2012.55.bb     |    6 ++++++
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-core/dropbear/{dropbear-2011.54 => dropbear-2012.55}/configure.patch (100%)
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2011.54.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2012.55.bb

diff --git a/meta/recipes-core/dropbear/dropbear-2011.54/configure.patch b/meta/recipes-core/dropbear/dropbear-2012.55/configure.patch
similarity index 100%
rename from meta/recipes-core/dropbear/dropbear-2011.54/configure.patch
rename to meta/recipes-core/dropbear/dropbear-2012.55/configure.patch
diff --git a/meta/recipes-core/dropbear/dropbear_2011.54.bb b/meta/recipes-core/dropbear/dropbear_2011.54.bb
deleted file mode 100644
index 1bd8bda..0000000
--- a/meta/recipes-core/dropbear/dropbear_2011.54.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require dropbear.inc
-
-SRC_URI[md5sum] = "ce1e236c4a8df0cb95253defee6716b5"
-SRC_URI[sha256sum] = "a5fe60fa9c11e7b0f6a21ef6e86a53ce3d55236548901905070ff1c1716fbf47"
-
-PR = "r1"
diff --git a/meta/recipes-core/dropbear/dropbear_2012.55.bb b/meta/recipes-core/dropbear/dropbear_2012.55.bb
new file mode 100644
index 0000000..4f0ef80
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear_2012.55.bb
@@ -0,0 +1,6 @@
+require dropbear.inc
+
+SRC_URI[md5sum] = "44836e5a0419ba12557f9ea46880077e"
+SRC_URI[sha256sum] = "808df243c61bb60f2f18fa64bca628cbba0918b2a14139f10e6d59d4ac5a17ce"
+
+PR = "r0"
-- 
1.7.6



