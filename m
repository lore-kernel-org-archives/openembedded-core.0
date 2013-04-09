Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UPZfb-0003vx-PI
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 16:37:14 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Apr 2013 07:18:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,439,1363158000"; d="scan'208";a="315364307"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.195])
	by orsmga002.jf.intel.com with ESMTP; 09 Apr 2013 07:19:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2013 15:19:17 +0100
Message-Id: <e2901c2ad30a411fb90c6b5eaca242563257085c.1365517068.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1365517068.git.paul.eggleton@linux.intel.com>
References: <cover.1365517068.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1365517068.git.paul.eggleton@linux.intel.com>
References: <cover.1365517068.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] meta-*/conf/layer.conf: tweak BBFILES comment
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
X-List-Received-Date: Tue, 09 Apr 2013 14:37:19 -0000

"packages" was the old name (pre-2010) under which the recipe files were
stored.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-hob/conf/layer.conf      |    2 +-
 meta-skeleton/conf/layer.conf |    2 +-
 meta/conf/layer.conf          |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-hob/conf/layer.conf b/meta-hob/conf/layer.conf
index 6df27ac..1785e65 100644
--- a/meta-hob/conf/layer.conf
+++ b/meta-hob/conf/layer.conf
@@ -1,7 +1,7 @@
 # We have a conf and classes directory, add to BBPATH
 BBPATH .= ":${LAYERDIR}"
 
-# We have a packages directory, add to BBFILES
+# We have recipes-* directories, add to BBFILES
 BBFILES += "${LAYERDIR}/recipes-*/*/*.bb"
 
 BBFILE_COLLECTIONS += "hob"
diff --git a/meta-skeleton/conf/layer.conf b/meta-skeleton/conf/layer.conf
index 10031c1..99830d8 100644
--- a/meta-skeleton/conf/layer.conf
+++ b/meta-skeleton/conf/layer.conf
@@ -1,7 +1,7 @@
 # We have a conf and classes directory, add to BBPATH
 BBPATH .= ":${LAYERDIR}"
 
-# We have a packages directory, add to BBFILES
+# We have recipes-* directories, add to BBFILES
 BBFILES += "${LAYERDIR}/recipes-*/*/*.bb"
 
 BBFILE_COLLECTIONS += "skeleton"
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 23ef09a..a112e86 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -1,6 +1,6 @@
 # We have a conf and classes directory, add to BBPATH
 BBPATH .= ":${LAYERDIR}"
-# We have a packages directory, add to BBFILES
+# We have recipes-* directories, add to BBFILES
 BBFILES += "${LAYERDIR}/recipes-*/*/*.bb"
 
 BBFILE_COLLECTIONS += "core"
-- 
1.7.10.4



