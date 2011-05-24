Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QOfsP-00085l-78
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 02:53:37 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 May 2011 17:50:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,259,1304319600"; 
   d="scan'208";a="6498072"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by fmsmga002.fm.intel.com with ESMTP; 23 May 2011 17:50:33 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2011 17:50:25 -0700
Message-Id: <aa6c05b0455de5dd598ebac0f227d41204b77227.1306198151.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.5
In-Reply-To: <c58247a71045c56297c2312e91eff6f17f3c2d7d.1306198151.git.nitin.a.kamble@intel.com>
References: <c58247a71045c56297c2312e91eff6f17f3c2d7d.1306198151.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1306198151.git.nitin.a.kamble@intel.com>
References: <cover.1306198151.git.nitin.a.kamble@intel.com>
Subject: [UPGRADES 3/5] byacc: upgrade from 20101127 to 20101229
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
X-List-Received-Date: Tue, 24 May 2011 00:53:37 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-extended/byacc/byacc_20101127.bb |    7 -------
 meta/recipes-extended/byacc/byacc_20101229.bb |    7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 100644 meta/recipes-extended/byacc/byacc_20101127.bb
 create mode 100644 meta/recipes-extended/byacc/byacc_20101229.bb

diff --git a/meta/recipes-extended/byacc/byacc_20101127.bb b/meta/recipes-extended/byacc/byacc_20101127.bb
deleted file mode 100644
index b6b7b70..0000000
--- a/meta/recipes-extended/byacc/byacc_20101127.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-PR = "r0"
-LICENSE="other-BSD"
-LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=4dc4c30f840a7203fb6edf20b3db849e"
-require byacc.inc
-
-SRC_URI[md5sum] = "5931a27e43102dc868745bf4dce91fb4"
-SRC_URI[sha256sum] = "c172c7ed2ee2130510d4d6e134bcac791b217e4883051137690613ac011aca47"
diff --git a/meta/recipes-extended/byacc/byacc_20101229.bb b/meta/recipes-extended/byacc/byacc_20101229.bb
new file mode 100644
index 0000000..09e91e6
--- /dev/null
+++ b/meta/recipes-extended/byacc/byacc_20101229.bb
@@ -0,0 +1,7 @@
+PR = "r0"
+LICENSE="other-BSD"
+LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=4dc4c30f840a7203fb6edf20b3db849e"
+require byacc.inc
+
+SRC_URI[md5sum] = "e359702cda080c15f656a244aab132e5"
+SRC_URI[sha256sum] = "67a5e4c7888bf7921949e38d4fd6eec855ec8b5a60d83f8d6f34eddb6d42a70c"
-- 
1.7.3.5



