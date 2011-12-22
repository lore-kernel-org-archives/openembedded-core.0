Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rddbv-0005NF-F2
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 09:02:45 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2011 23:55:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="89233730"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.90])
	by orsmga001.jf.intel.com with ESMTP; 21 Dec 2011 23:55:34 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2011 23:55:09 -0800
Message-Id: <1a8bf09a07372c3518b692cbaa7c59ff5ec94719.1324540322.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 03/26] augeas: Upgrade to 0.10.0
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
X-List-Received-Date: Thu, 22 Dec 2011 08:02:46 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/augeas/augeas_0.10.0.bb |    6 ++++++
 meta/recipes-extended/augeas/augeas_0.9.0.bb  |    7 -------
 2 files changed, 6 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-extended/augeas/augeas_0.10.0.bb
 delete mode 100644 meta/recipes-extended/augeas/augeas_0.9.0.bb

diff --git a/meta/recipes-extended/augeas/augeas_0.10.0.bb b/meta/recipes-extended/augeas/augeas_0.10.0.bb
new file mode 100644
index 0000000..734d171
--- /dev/null
+++ b/meta/recipes-extended/augeas/augeas_0.10.0.bb
@@ -0,0 +1,6 @@
+require augeas.inc
+
+PR = "r0"
+
+SRC_URI[md5sum] = "fe1834e90a066c3208ac0214622c7352"
+SRC_URI[sha256sum] = "ec111af06186216930176ebe5ecccdf7bf528528aee9acde1d5d70088484afca"
diff --git a/meta/recipes-extended/augeas/augeas_0.9.0.bb b/meta/recipes-extended/augeas/augeas_0.9.0.bb
deleted file mode 100644
index 4531560..0000000
--- a/meta/recipes-extended/augeas/augeas_0.9.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require augeas.inc
-
-PR = "r0"
-
-SRC_URI[md5sum] = "5ef0ce53ce4c75f59ab2523506731084"
-SRC_URI[sha256sum] = "55d2f482d02ac4cb38a80d95c53d2f73de435df7df1022827e7cba20bb4bb9b8"
-
-- 
1.7.6.4



