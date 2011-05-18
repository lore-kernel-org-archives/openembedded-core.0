Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMbzr-0000cy-Qy
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 10:20:48 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 May 2011 01:17:55 -0700
X-ExtLoop1: 1
Received: from unknown (HELO localhost) ([10.255.12.160])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2011 01:17:54 -0700
Message-Id: <1612da9bb92924c52646450cc4a32224386f2e53.1305702436.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305702436.git.sgw@linux.intel.com>
References: <cover.1305702436.git.sgw@linux.intel.com>
Old-Date: Wed, 11 May 2011 14:08:11 +0800
Date: Wed, 18 May 2011  1:17:54 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Robert Yang <liezhi.yang@windriver.com>
Subject: [PATCH 06/15] Add the layer meta-skeleton
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
X-List-Received-Date: Wed, 18 May 2011 08:20:48 -0000

From: Robert Yang <liezhi.yang@windriver.com>

Add the layer meta-skeleton, it will be used to place the various
canonical examples.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-skeleton/conf/layer.conf |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 meta-skeleton/conf/layer.conf

diff --git a/meta-skeleton/conf/layer.conf b/meta-skeleton/conf/layer.conf
new file mode 100644
index 0000000..edb31dd
--- /dev/null
+++ b/meta-skeleton/conf/layer.conf
@@ -0,0 +1,10 @@
+# We have a conf and classes directory, add to BBPATH
+BBPATH := "${BBPATH}:${LAYERDIR}"
+
+# We have a packages directory, add to BBFILES
+BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb"
+
+BBFILE_COLLECTIONS += "skeleton"
+BBFILE_PATTERN_skeleton := "^${LAYERDIR}/"
+BBFILE_PRIORITY_skeleton = "1"
+
-- 
1.7.3.4



