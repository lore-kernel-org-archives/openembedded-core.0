Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QOu87-0003tE-9D
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 18:06:47 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 May 2011 09:03:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,261,1304319600"; 
   d="scan'208";a="7845627"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.133])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2011 09:03:04 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2011 09:02:57 -0700
Message-Id: <dc853bcef0319a7ed6c02f68dbe3bb67aac55d5c.1306219274.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306219274.git.sgw@linux.intel.com>
References: <cover.1306219274.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306219274.git.sgw@linux.intel.com>
References: <cover.1306219274.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 10/12] byacc: upgrade from 20101127 to 20101229
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
X-List-Received-Date: Tue, 24 May 2011 16:06:47 -0000

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
1.7.3.4



