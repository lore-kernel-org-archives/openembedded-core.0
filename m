Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzSK-0006LK-7t
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:58:09 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 15 Apr 2011 23:55:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="420320419"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by azsmga001.ch.intel.com with ESMTP; 15 Apr 2011 23:55:48 -0700
Message-Id: <190819dd6c0a127c3a9003b67fd0e8cfdc330dbf.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Fri, 15 Apr 2011 17:17:02 +0100
Date: Fri, 15 Apr 2011 23:55:47 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 56/58] netbase: add /etc/network/interfaces file for qemumips & qemuppc
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
X-List-Received-Date: Sat, 16 Apr 2011 06:58:09 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

This fixes the network configuration for qemumips & qemuppc to match the
other qemu* machines.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../netbase/netbase-4.45/qemumips/interfaces       |    8 ++++++++
 .../netbase/netbase-4.45/qemuppc/interfaces        |    8 ++++++++
 2 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/netbase/netbase-4.45/qemumips/interfaces
 create mode 100644 meta/recipes-core/netbase/netbase-4.45/qemuppc/interfaces

diff --git a/meta/recipes-core/netbase/netbase-4.45/qemumips/interfaces b/meta/recipes-core/netbase/netbase-4.45/qemumips/interfaces
new file mode 100644
index 0000000..f62b9a8
--- /dev/null
+++ b/meta/recipes-core/netbase/netbase-4.45/qemumips/interfaces
@@ -0,0 +1,8 @@
+# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
+ 
+# The loopback interface
+auto lo
+iface lo inet loopback
+
+
+
diff --git a/meta/recipes-core/netbase/netbase-4.45/qemuppc/interfaces b/meta/recipes-core/netbase/netbase-4.45/qemuppc/interfaces
new file mode 100644
index 0000000..f62b9a8
--- /dev/null
+++ b/meta/recipes-core/netbase/netbase-4.45/qemuppc/interfaces
@@ -0,0 +1,8 @@
+# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
+ 
+# The loopback interface
+auto lo
+iface lo inet loopback
+
+
+
-- 
1.7.1.1



