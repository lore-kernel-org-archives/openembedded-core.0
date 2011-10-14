Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1REaUZ-0002ZI-Ne
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 07:39:36 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Oct 2011 22:33:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,344,1315206000"; d="scan'208";a="73540462"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.120])
	by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2011 22:33:37 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 22:33:16 -0700
Message-Id: <5b58df4cb8a8e6f53391c3204d2bd05f9e77f637.1318570250.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 18/28] augeas: Update to 0.9.0
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
X-List-Received-Date: Fri, 14 Oct 2011 05:39:38 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/augeas/augeas_0.8.1.bb |    6 ------
 meta/recipes-extended/augeas/augeas_0.9.0.bb |    7 +++++++
 2 files changed, 7 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-extended/augeas/augeas_0.8.1.bb
 create mode 100644 meta/recipes-extended/augeas/augeas_0.9.0.bb

diff --git a/meta/recipes-extended/augeas/augeas_0.8.1.bb b/meta/recipes-extended/augeas/augeas_0.8.1.bb
deleted file mode 100644
index 51eeb33..0000000
--- a/meta/recipes-extended/augeas/augeas_0.8.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require augeas.inc
-
-PR = "r0"
-
-SRC_URI[md5sum] = "62d47bdc60e175f93aed3b81cb8e2785"
-SRC_URI[sha256sum] = "916fef67e8eed6d1abe02433830301bd01dfc8228e9cfffb490347545155c4d7"
diff --git a/meta/recipes-extended/augeas/augeas_0.9.0.bb b/meta/recipes-extended/augeas/augeas_0.9.0.bb
new file mode 100644
index 0000000..4531560
--- /dev/null
+++ b/meta/recipes-extended/augeas/augeas_0.9.0.bb
@@ -0,0 +1,7 @@
+require augeas.inc
+
+PR = "r0"
+
+SRC_URI[md5sum] = "5ef0ce53ce4c75f59ab2523506731084"
+SRC_URI[sha256sum] = "55d2f482d02ac4cb38a80d95c53d2f73de435df7df1022827e7cba20bb4bb9b8"
+
-- 
1.7.6.2



