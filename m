Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tact4-0005Xz-Et
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Nov 2012 02:44:30 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Nov 2012 17:30:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,282,1352102400"; d="scan'208";a="244596724"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.202])
	by orsmga002.jf.intel.com with ESMTP; 19 Nov 2012 17:30:24 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2012 17:30:13 -0800
Message-Id: <0684a53b16be7aa6ad289f4df981ff2d3eff3f8b.1353374801.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1353374801.git.sgw@linux.intel.com>
References: <cover.1353374801.git.sgw@linux.intel.com>
In-Reply-To: <cover.1353374801.git.sgw@linux.intel.com>
References: <cover.1353374801.git.sgw@linux.intel.com>
Subject: [PATCH 05/13] libxml2: Update to 2.9.0
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
X-List-Received-Date: Tue, 20 Nov 2012 01:44:30 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/libxml/libxml2_2.8.0.bb |    6 ------
 meta/recipes-core/libxml/libxml2_2.9.0.bb |    6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2_2.8.0.bb
 create mode 100644 meta/recipes-core/libxml/libxml2_2.9.0.bb

diff --git a/meta/recipes-core/libxml/libxml2_2.8.0.bb b/meta/recipes-core/libxml/libxml2_2.8.0.bb
deleted file mode 100644
index 37eba34..0000000
--- a/meta/recipes-core/libxml/libxml2_2.8.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require libxml2.inc
-
-PR = "r2"
-
-SRC_URI[md5sum] = "c62106f02ee00b6437f0fb9d370c1093"
-SRC_URI[sha256sum] = "f2e2d0e322685193d1affec83b21dc05d599e17a7306d7b90de95bb5b9ac622a"
diff --git a/meta/recipes-core/libxml/libxml2_2.9.0.bb b/meta/recipes-core/libxml/libxml2_2.9.0.bb
new file mode 100644
index 0000000..92bcf5c
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2_2.9.0.bb
@@ -0,0 +1,6 @@
+require libxml2.inc
+
+PR = "r0"
+
+SRC_URI[md5sum] = "5b9bebf4f5d2200ae2c4efe8fa6103f7"
+SRC_URI[sha256sum] = "ad25d91958b7212abdc12b9611cfb4dc4e5cddb6d1e9891532f48aacee422b82"
-- 
1.7.7.6



