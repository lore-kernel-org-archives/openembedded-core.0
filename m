Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzQ2-0006A3-Po
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:55:47 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Apr 2011 23:53:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="420319327"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by azsmga001.ch.intel.com with ESMTP; 15 Apr 2011 23:53:25 -0700
Message-Id: <b9ce90d399b4a475f22a94a62cc6617db83fdccb.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Wed, 13 Apr 2011 10:24:13 +0800
Date: Fri, 15 Apr 2011 23:53:25 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 06/58] ofono: upgrade to version 0.45
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
X-List-Received-Date: Sat, 16 Apr 2011 06:55:47 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/recipes-connectivity/ofono/ofono_0.37.bb |    9 ---------
 meta/recipes-connectivity/ofono/ofono_0.45.bb |    9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono_0.37.bb
 create mode 100644 meta/recipes-connectivity/ofono/ofono_0.45.bb

diff --git a/meta/recipes-connectivity/ofono/ofono_0.37.bb b/meta/recipes-connectivity/ofono/ofono_0.37.bb
deleted file mode 100644
index aea4e98..0000000
--- a/meta/recipes-connectivity/ofono/ofono_0.37.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require ofono.inc
-
-PR = "r0"
-
-SRC_URI  = "${KERNELORG_MIRROR}/linux/network/ofono/${P}.tar.bz2 \
-	          file://ofono"
-
-SRC_URI[md5sum] = "fa9a6f91506db2ac5bf313ff0bde65f3"
-SRC_URI[sha256sum] = "0ac71d8a846d564ef6940c47bcc410b76df750aadf7903cb56876d991275f6db"
diff --git a/meta/recipes-connectivity/ofono/ofono_0.45.bb b/meta/recipes-connectivity/ofono/ofono_0.45.bb
new file mode 100644
index 0000000..4a8950f
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono_0.45.bb
@@ -0,0 +1,9 @@
+require ofono.inc
+
+PR = "r0"
+
+SRC_URI  = "${KERNELORG_MIRROR}/linux/network/ofono/${P}.tar.bz2 \
+	          file://ofono"
+
+SRC_URI[md5sum] = "31dabb077e7592ba36913bd9d0c76b94"
+SRC_URI[sha256sum] = "5541e832fb72c6c647b663e5ee55384a33efaee5a34c4544e3a16af94892f47e"
-- 
1.7.1.1



