Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id C00AA784B0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 19:08:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 15 Aug 2017 12:08:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,379,1498546800"; d="scan'208";a="1206006155"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga002.fm.intel.com with ESMTP; 15 Aug 2017 12:08:45 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Aug 2017 12:08:27 -0700
Message-Id: <20170815190828.82873-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH 1/2] packagegroup-self-hosted: include missing (pod2man scp ssh) RPEDENDS packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Aug 2017 19:08:45 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Otherwise, the following bitbake error is observed

    root@qemux86-64:~/openembedded-core/build# bitbake -e
    NOTE: Starting bitbake server...
    ERROR: Unable to start bitbake server
    ERROR: Last 10 lines of server log /home/root/openembedded-core/build/bitbake-cookerdaemon.log:
      File "/home/root/openembedded-core/bitbake/lib/bb/cooker.py", line 197, in __init__
        self.initConfigurationData()
      File "/home/root/openembedded-core/bitbake/lib/bb/cooker.py", line 348, in initConfigurationData
        self.databuilder.parseBaseConfiguration()
      File "/home/root/openembedded-core/bitbake/lib/bb/cookerdata.py", line 323, in parseBaseConfiguration
        raise bb.BBHandledException
    bb.BBHandledException
    NOTE: Starting bitbake server...
    ERROR: The following required tools (as specified by HOSTTOOLS) appear to be unavailable in PATH, please install them in order to proceed:
      pod2man scp ssh

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 0abd5bc90e..ff42866e32 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -140,12 +140,15 @@ RDEPENDS_packagegroup-self-hosted-extended = "\
     nfs-utils \
     nfs-utils-client \
     openssl \
+    openssh-scp \
     openssh-sftp-server \
+    openssh-ssh \
     opkg \
     opkg-utils \
     patch \
     perl \
     perl-dev \
+    perl-misc \
     perl-modules \
     perl-pod \
     python \
-- 
2.12.3


