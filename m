Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QAmPx-0005iM-Fb
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Apr 2011 19:02:49 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Apr 2011 10:00:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,220,1301900400"; d="scan'208";a="679601327"
Received: from unknown (HELO helios) ([10.255.12.218])
	by fmsmga002.fm.intel.com with SMTP; 15 Apr 2011 10:00:28 -0700
Received: by helios (sSMTP sendmail emulation); Fri, 15 Apr 2011 18:00:21 +0100
Message-Id: <b0e016edb629d8253bb4a587f56c1ecb3787d40d.1302886579.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1302886579.git.paul.eggleton@linux.intel.com>
References: <cover.1302886579.git.paul.eggleton@linux.intel.com>
Old-Date: Fri, 15 Apr 2011 17:17:02 +0100
Date: Fri, 15 Apr 2011 18:00:21 +0100
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] netbase: add /etc/network/interfaces file for qemumips & qemuppc
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
X-List-Received-Date: Fri, 15 Apr 2011 17:02:49 -0000

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
1.7.1



