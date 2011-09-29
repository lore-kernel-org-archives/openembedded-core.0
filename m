Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R94FA-0001Dx-04
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 02:12:52 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Sep 2011 17:07:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,458,1312182000"; d="scan'208";a="21629677"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.50])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Sep 2011 17:07:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 17:07:15 -0700
Message-Id: <5b8d6e4cdd5b5348b393712296f98826fa2d07b6.1317254761.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1317254761.git.sgw@linux.intel.com>
References: <cover.1317254761.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317254761.git.sgw@linux.intel.com>
References: <cover.1317254761.git.sgw@linux.intel.com>
Subject: [PATCH 2/3] sysstat: update to 10.0.2
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
X-List-Received-Date: Thu, 29 Sep 2011 00:12:52 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/sysstat/sysstat_10.0.0.bb |   10 ----------
 meta/recipes-extended/sysstat/sysstat_10.0.2.bb |   10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta/recipes-extended/sysstat/sysstat_10.0.0.bb
 create mode 100644 meta/recipes-extended/sysstat/sysstat_10.0.2.bb

diff --git a/meta/recipes-extended/sysstat/sysstat_10.0.0.bb b/meta/recipes-extended/sysstat/sysstat_10.0.0.bb
deleted file mode 100644
index 2faac32..0000000
--- a/meta/recipes-extended/sysstat/sysstat_10.0.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require sysstat.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
-
-PR = "r2"
-
-
-
-SRC_URI[md5sum] = "accc17cc1fa855be6b27def77dd92a0d"
-SRC_URI[sha256sum] = "12b2ddb1c30a6d69a84ced8243b0745b4ab7f1a3b0048b9e1c21ac052d89cd43"
diff --git a/meta/recipes-extended/sysstat/sysstat_10.0.2.bb b/meta/recipes-extended/sysstat/sysstat_10.0.2.bb
new file mode 100644
index 0000000..bd559d8
--- /dev/null
+++ b/meta/recipes-extended/sysstat/sysstat_10.0.2.bb
@@ -0,0 +1,10 @@
+require sysstat.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+
+PR = "r0"
+
+
+
+SRC_URI[md5sum] = "0253058fed65e9394c49255821b8803e"
+SRC_URI[sha256sum] = "c89c7baa904f47aa62f3829a90f87509207bfc26ce11c3c4ec415d027ed3f78a"
-- 
1.7.6



