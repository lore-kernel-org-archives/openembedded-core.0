Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QReri-00041j-GN
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 08:25:14 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 May 2011 23:22:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,302,1304319600"; d="scan'208";a="10203789"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.41])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2011 23:22:01 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2011 23:21:29 -0700
Message-Id: <5b9ff84204e608b4f300473f53898d6483e03273.1306909184.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 02/32] sysstat: update to 10.0.0
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
X-List-Received-Date: Wed, 01 Jun 2011 06:25:14 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/sysstat/sysstat_10.0.0.bb |   10 ++++++++++
 meta/recipes-extended/sysstat/sysstat_9.1.5.bb  |   10 ----------
 2 files changed, 10 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-extended/sysstat/sysstat_10.0.0.bb
 delete mode 100644 meta/recipes-extended/sysstat/sysstat_9.1.5.bb

diff --git a/meta/recipes-extended/sysstat/sysstat_10.0.0.bb b/meta/recipes-extended/sysstat/sysstat_10.0.0.bb
new file mode 100644
index 0000000..fd003d9
--- /dev/null
+++ b/meta/recipes-extended/sysstat/sysstat_10.0.0.bb
@@ -0,0 +1,10 @@
+require sysstat.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+
+PR = "r1"
+
+
+
+SRC_URI[md5sum] = "accc17cc1fa855be6b27def77dd92a0d"
+SRC_URI[sha256sum] = "12b2ddb1c30a6d69a84ced8243b0745b4ab7f1a3b0048b9e1c21ac052d89cd43"
diff --git a/meta/recipes-extended/sysstat/sysstat_9.1.5.bb b/meta/recipes-extended/sysstat/sysstat_9.1.5.bb
deleted file mode 100644
index 49ac988..0000000
--- a/meta/recipes-extended/sysstat/sysstat_9.1.5.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require sysstat.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
-
-PR = "r1"
-
-
-
-SRC_URI[md5sum] = "b680828159b5158094b9bf1ebad30e90"
-SRC_URI[sha256sum] = "2a567a35511ddb873169ad3345f4e6a6219d39750638bf804027342ef89cb3e0"
-- 
1.7.3.4



