Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SLH7C-0005gO-U5
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 18:55:23 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Apr 2012 09:45:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156167923"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.163])
	by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2012 09:45:44 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2012 09:45:30 -0700
Message-Id: <9d309cde866b1c1c8bc5480cd18fa16f9dc02252.1334940120.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 39/43] sysstat: Upgrade to 10.0.3
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
X-List-Received-Date: Fri, 20 Apr 2012 16:55:23 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/sysstat/sysstat_10.0.3.bb |    8 --------
 meta/recipes-extended/sysstat/sysstat_10.0.4.bb |    8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-extended/sysstat/sysstat_10.0.3.bb
 create mode 100644 meta/recipes-extended/sysstat/sysstat_10.0.4.bb

diff --git a/meta/recipes-extended/sysstat/sysstat_10.0.3.bb b/meta/recipes-extended/sysstat/sysstat_10.0.3.bb
deleted file mode 100644
index 7ef6c60..0000000
--- a/meta/recipes-extended/sysstat/sysstat_10.0.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require sysstat.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
-
-PR = "r1"
-
-SRC_URI[md5sum] = "0e1ed5200f31f69a3b90ff1e81c07745"
-SRC_URI[sha256sum] = "7c0dd172f09edaff100b33db29ef502e15e71867b505c6d519f76a24fabcc1f5"
diff --git a/meta/recipes-extended/sysstat/sysstat_10.0.4.bb b/meta/recipes-extended/sysstat/sysstat_10.0.4.bb
new file mode 100644
index 0000000..7a5bcdc
--- /dev/null
+++ b/meta/recipes-extended/sysstat/sysstat_10.0.4.bb
@@ -0,0 +1,8 @@
+require sysstat.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+
+PR = "r0"
+
+SRC_URI[md5sum] = "c84fd7774080dae34f47257175a0b187"
+SRC_URI[sha256sum] = "66dbef6e5583c320d5aa5a47a7407b8bf2c20f2cf0d171d36ffa21db034f34ba"
-- 
1.7.7.6



