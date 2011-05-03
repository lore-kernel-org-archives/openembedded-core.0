Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHPJF-0001in-5h
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 01:47:17 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 May 2011 16:44:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,312,1301900400"; d="scan'208";a="917581985"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by fmsmga001.fm.intel.com with ESMTP; 03 May 2011 16:44:40 -0700
Message-Id: <ef897844fae97d40a8a2dc4a179a0e864e669335.1304465724.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304465724.git.sgw@linux.intel.com>
References: <cover.1304465724.git.sgw@linux.intel.com>
Old-Date: Thu, 21 Apr 2011 17:27:06 +0800
Date: Tue, 03 May 2011 16:44:40 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>, Ilya Yanok <yanok@emcraft.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>, Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 14/33] augeas: upgrade to version 0.8.1
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
X-List-Received-Date: Tue, 03 May 2011 23:47:17 -0000

From: Qing He <qing.he@intel.com>

from 0.7.4

Signed-off-by: Qing He <qing.he@intel.com>
---
 meta/recipes-extended/augeas/augeas_0.7.4.bb |    6 ------
 meta/recipes-extended/augeas/augeas_0.8.1.bb |    6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-extended/augeas/augeas_0.7.4.bb
 create mode 100644 meta/recipes-extended/augeas/augeas_0.8.1.bb

diff --git a/meta/recipes-extended/augeas/augeas_0.7.4.bb b/meta/recipes-extended/augeas/augeas_0.7.4.bb
deleted file mode 100644
index eada58f..0000000
--- a/meta/recipes-extended/augeas/augeas_0.7.4.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require augeas.inc
-
-PR = "r0"
-
-SRC_URI[md5sum] = "e3ddce5305a15bdb876ef7feec9214d1"
-SRC_URI[sha256sum] = "02ba7b4f1d0796dff6ea5f8cc5f4949e4ba30b7fa2f36a0c8a5079f9975060d1"
diff --git a/meta/recipes-extended/augeas/augeas_0.8.1.bb b/meta/recipes-extended/augeas/augeas_0.8.1.bb
new file mode 100644
index 0000000..51eeb33
--- /dev/null
+++ b/meta/recipes-extended/augeas/augeas_0.8.1.bb
@@ -0,0 +1,6 @@
+require augeas.inc
+
+PR = "r0"
+
+SRC_URI[md5sum] = "62d47bdc60e175f93aed3b81cb8e2785"
+SRC_URI[sha256sum] = "916fef67e8eed6d1abe02433830301bd01dfc8228e9cfffb490347545155c4d7"
-- 
1.7.4.1



