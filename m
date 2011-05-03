Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHPJE-0001h3-9G
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 01:47:16 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 May 2011 16:44:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,312,1301900400"; d="scan'208";a="637467137"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by orsmga002.jf.intel.com with ESMTP; 03 May 2011 16:44:39 -0700
Message-Id: <7b7c269e0d06df4a7202d82b9493cf5129f611c7.1304465724.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304465724.git.sgw@linux.intel.com>
References: <cover.1304465724.git.sgw@linux.intel.com>
Old-Date: Thu, 21 Apr 2011 14:35:42 +0800
Date: Tue, 03 May 2011 16:44:38 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>, Ilya Yanok <yanok@emcraft.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>, Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 13/33] acl: upgrade to version 2.2.51
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
X-List-Received-Date: Tue, 03 May 2011 23:47:16 -0000

From: Qing He <qing.he@intel.com>

from 2.2.49

Signed-off-by: Qing He <qing.he@intel.com>
---
 meta/recipes-support/attr/acl_2.2.49.bb |    6 ------
 meta/recipes-support/attr/acl_2.2.51.bb |    6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-support/attr/acl_2.2.49.bb
 create mode 100644 meta/recipes-support/attr/acl_2.2.51.bb

diff --git a/meta/recipes-support/attr/acl_2.2.49.bb b/meta/recipes-support/attr/acl_2.2.49.bb
deleted file mode 100644
index 197ac7d..0000000
--- a/meta/recipes-support/attr/acl_2.2.49.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require acl.inc
-
-PR = "r1"
-
-SRC_URI[md5sum] = "181445894cca986da9ae0099d5ce2d08"
-SRC_URI[sha256sum] = "b9c7f4752e4ef4930a62fa5aa0d7efe1cba2b5a3a2d6ee2b45c0a70c72b7e5d5"
diff --git a/meta/recipes-support/attr/acl_2.2.51.bb b/meta/recipes-support/attr/acl_2.2.51.bb
new file mode 100644
index 0000000..301d44a
--- /dev/null
+++ b/meta/recipes-support/attr/acl_2.2.51.bb
@@ -0,0 +1,6 @@
+require acl.inc
+
+PR = "r0"
+
+SRC_URI[md5sum] = "3fc0ce99dc5253bdcce4c9cd437bc267"
+SRC_URI[sha256sum] = "06854521cf5d396801af7e54b9636680edf8064355e51c07657ec7442a185225"
-- 
1.7.4.1



