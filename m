Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id DE9CB73216
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 12:52:49 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 16 Sep 2016 05:52:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,344,1470726000"; d="scan'208";a="1031537874"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.30.107])
	by orsmga001.jf.intel.com with ESMTP; 16 Sep 2016 05:52:50 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2016 13:52:31 +0100
Message-Id: <a9d0f95fcf85f5fbdf5584bba857de6d51e43176.1474030160.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1474030160.git.joshua.g.lock@intel.com>
References: <cover.1474030160.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1474030160.git.joshua.g.lock@intel.com>
References: <cover.1474030160.git.joshua.g.lock@intel.com>
Subject: [PATCH 4/6] qemuboot: also write the kernel link name to the conf file
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
X-List-Received-Date: Fri, 16 Sep 2016 12:52:50 -0000

This will allow runqemu to fall back to trying the link name when
a file matching the full name can't be found.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/classes/qemuboot.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 0892db3..802eb59 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -48,8 +48,9 @@ python write_qemuboot_conf() {
     import configparser
 
     build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE', \
-                'IMAGE_NAME', 'IMAGE_LINK_NAME', 'STAGING_DIR_NATIVE', \
-                'STAGING_BINDIR_NATIVE', 'STAGING_DIR_HOST']
+                'KERNEL_IMAGETYPE', 'IMAGE_NAME', 'IMAGE_LINK_NAME', \
+                'STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE', \
+                'STAGING_DIR_HOST']
 
     # Vars from bsp
     qb_vars = []
-- 
2.7.4


