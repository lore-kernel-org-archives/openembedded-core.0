Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzSA-0006KT-Gf
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:57:58 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 15 Apr 2011 23:55:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="420320367"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by azsmga001.ch.intel.com with ESMTP; 15 Apr 2011 23:55:38 -0700
Message-Id: <388040c3ffbf7d5115455dc1068c56953328e0dd.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Fri, 15 Apr 2011 18:05:29 +0800
Date: Fri, 15 Apr 2011 23:55:38 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 51/58] rsync: upgrade to version 3.0.8
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
X-List-Received-Date: Sat, 16 Apr 2011 06:57:58 -0000

From: Qing He <qing.he@intel.com>

[YOCTO #983]

from 3.0.7
fixes CVE-2011-1097

Signed-off-by: Qing He <qing.he@intel.com>
---
 .../rsync/{rsync_3.0.7.bb => rsync_3.0.8.bb}       |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/rsync/{rsync_3.0.7.bb => rsync_3.0.8.bb} (71%)

diff --git a/meta/recipes-devtools/rsync/rsync_3.0.7.bb b/meta/recipes-devtools/rsync/rsync_3.0.8.bb
similarity index 71%
rename from meta/recipes-devtools/rsync/rsync_3.0.7.bb
rename to meta/recipes-devtools/rsync/rsync_3.0.8.bb
index 971fd54..33ab271 100644
--- a/meta/recipes-devtools/rsync/rsync_3.0.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.0.8.bb
@@ -1,11 +1,11 @@
 require rsync.inc
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI += "file://acinclude.m4"
 
-SRC_URI[md5sum] = "b53525900817cf1ba7ad3a516ab5bfe9"
-SRC_URI[sha256sum] = "9ee00d16c023c486328cbb61f59928a954b24b7b7173c3517ebb0d6c3edfe7c8"
+SRC_URI[md5sum] = "0ee8346ce16bdfe4c88a236e94c752b4"
+SRC_URI[sha256sum] = "4b3fc271f4c96036b4c73fb019be078e4d8cce2defe1e7ae7cde1117859a2114"
 
 EXTRA_OECONF += "--disable-xattr-support --disable-acl-support"
 
-- 
1.7.1.1



