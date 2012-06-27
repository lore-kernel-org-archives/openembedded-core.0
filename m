Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SjuZZ-0001h1-Fu
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 17:54:30 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Jun 2012 08:43:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="161344569"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by azsmga001.ch.intel.com with ESMTP; 27 Jun 2012 08:43:32 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jun 2012 08:43:23 -0700
Message-Id: <46eb9997ca5c35f17ffdfa3363fd2b2a740d6903.1340811559.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340811559.git.sgw@linux.intel.com>
References: <cover.1340811559.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340811559.git.sgw@linux.intel.com>
References: <cover.1340811559.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 18/20] local.conf.sample.extended: Add filtering function to archiver.bbclass
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
X-List-Received-Date: Wed, 27 Jun 2012 15:54:30 -0000

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Add the option to filter packages according to license.

[YOCTO #2473]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/conf/local.conf.sample.extended |   14 ++++++++++++--
 1 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index 1f84ac7..1d19386 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -162,5 +162,15 @@
 # Whether to include WORKDIR/temp, .bb and .inc files:
 # 'logs_with_scripts' include WORKDIR/temp directory and .bb and .inc files
 # 'logs' only include WORKDIR/temp
-# SOURCE_ARCHIVE_LOG_WITH_SCRIPTS ?= 'logs'
-#SOURCE_ARCHIVE_LOG_WITH_SCRIPTS ?= 'logs_with_scripts'
+# ARCHIVER_MODE[log_type] = "logs logs_with_scripts"
+# There are three basic class defintions of common operations 
+# that might be desired and these can be enabled by 
+# uncommenting five of the following lines:
+# ARCHIVER_MODE[filter] ?= "yes no"
+# Filter packages according to license
+#ARCHIVER_MODE ?= "original"
+#ARCHIVER_MODE[type] ?= "tar"
+#ARCHIVER_MODE[log_type] ?= "logs_with_scripts"
+#ARCHIVER_MODE[filter] ?= "no"
+#ARCHIVER_CLASS = "${@'archive-${ARCHIVER_MODE}-source' if ARCHIVER_MODE != 'none' else ''}"
+#INHERIT += "${ARCHIVER_CLASS}"
-- 
1.7.7.6



