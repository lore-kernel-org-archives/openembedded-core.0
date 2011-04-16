Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzjo-0006pc-AV
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 09:16:12 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Apr 2011 23:55:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="910411343"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by fmsmga001.fm.intel.com with ESMTP; 15 Apr 2011 23:55:34 -0700
Message-Id: <6b6c0970767e33d68af87ea0a0cdd402a5920f9d.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Fri, 15 Apr 2011 15:30:32 +0800
Date: Fri, 15 Apr 2011 23:55:34 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 49/58] libxml2: upgrade to version 2.7.8
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
X-List-Received-Date: Sat, 16 Apr 2011 07:16:12 -0000

From: Qing He <qing.he@intel.com>

[YOCTO #978]

from 2.7.7
fixes CVE-2010-4008

Signed-off-by: Qing He <qing.he@intel.com>
---
 .../recipes-core/libxml/libxml2/libxml-64bit.patch |    2 ++
 meta/recipes-core/libxml/libxml2_2.7.7.bb          |    6 ------
 meta/recipes-core/libxml/libxml2_2.7.8.bb          |    6 ++++++
 3 files changed, 8 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2_2.7.7.bb
 create mode 100644 meta/recipes-core/libxml/libxml2_2.7.8.bb

diff --git a/meta/recipes-core/libxml/libxml2/libxml-64bit.patch b/meta/recipes-core/libxml/libxml2/libxml-64bit.patch
index fcb7d34..1147017 100644
--- a/meta/recipes-core/libxml/libxml2/libxml-64bit.patch
+++ b/meta/recipes-core/libxml/libxml2/libxml-64bit.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport [from debian: bugs.debian.org/439843]
+
 ---
  libxml.h |    3 +++
  1 file changed, 3 insertions(+)
diff --git a/meta/recipes-core/libxml/libxml2_2.7.7.bb b/meta/recipes-core/libxml/libxml2_2.7.7.bb
deleted file mode 100644
index 91f4ceb..0000000
--- a/meta/recipes-core/libxml/libxml2_2.7.7.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require libxml2.inc
-
-PR = "r4"
-
-SRC_URI[md5sum] = "9abc9959823ca9ff904f1fbcf21df066"
-SRC_URI[sha256sum] = "af5b781418ba4fff556fa43c50086658ea8a2f31909c2b625c2ce913a1d9eb68"
diff --git a/meta/recipes-core/libxml/libxml2_2.7.8.bb b/meta/recipes-core/libxml/libxml2_2.7.8.bb
new file mode 100644
index 0000000..616fd09
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2_2.7.8.bb
@@ -0,0 +1,6 @@
+require libxml2.inc
+
+PR = "r0"
+
+SRC_URI[md5sum] = "8127a65e8c3b08856093099b52599c86"
+SRC_URI[sha256sum] = "cda23bc9ebd26474ca8f3d67e7d1c4a1f1e7106364b690d822e009fdc3c417ec"
-- 
1.7.1.1



