Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzRs-0006IW-H6
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:57:41 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Apr 2011 23:55:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="910411248"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by fmsmga001.fm.intel.com with ESMTP; 15 Apr 2011 23:55:19 -0700
Message-Id: <d8a36f1e434c01be41d982e7aa00a7050eff5277.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Fri, 15 Apr 2011 16:09:28 +0800
Date: Fri, 15 Apr 2011 23:55:19 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 44/58] task-poky-lsb.bb:Add locale resoures which is needed by LSB Test Suite
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
X-List-Received-Date: Sat, 16 Apr 2011 06:57:41 -0000

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Owning to absent locale resources in lsb-image, I add them to task-poky-lsb.bb

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-extended/tasks/task-poky-lsb.bb |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/tasks/task-poky-lsb.bb b/meta/recipes-extended/tasks/task-poky-lsb.bb
index 6fea613..71a683a 100644
--- a/meta/recipes-extended/tasks/task-poky-lsb.bb
+++ b/meta/recipes-extended/tasks/task-poky-lsb.bb
@@ -186,15 +186,13 @@ RDEPENDS_task-poky-lsb-runtime-add = "\
     liburi-perl \
     libxml-parser-perl \
     libxml-perl \
+    eglibc-localedatas \
+    eglibc-gconvs \
+    eglibc-charmaps \
+    eglibc-binaries \
     eglibc-localedata-posix \
     eglibc-extra-nss \
     eglibc-pcprofile \
     eglibc-pic \
     eglibc-utils \
 "
-
-#    eglibc-localedatas \
-#    eglibc-gconvs \
-#    eglibc-charmaps \
-#    eglibc-binarys \
-#
-- 
1.7.1.1



