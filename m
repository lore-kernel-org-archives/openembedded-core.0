Return-Path: <brian.avery@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 83C147705F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 03:42:06 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Aug 2016 20:42:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,487,1464678000"; d="scan'208";a="1031481289"
Received: from bavery-ws-desk.jf.intel.com ([10.7.201.28])
	by orsmga002.jf.intel.com with ESMTP; 07 Aug 2016 20:42:06 -0700
From: bavery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Aug 2016 20:43:23 -0700
Message-Id: <238d43d3704f084f3173624c1e4956246a1044e0.1470627445.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1470627445.git.brian.avery@intel.com>
References: <cover.1470627445.git.brian.avery@intel.com>
Subject: [PATCH 1/2] packagegroup-core-eclipse-debug: add openssh server to support openssh-sftp-server
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
X-List-Received-Date: Mon, 08 Aug 2016 03:42:06 -0000

The openssh-sftp-server was already part of the pakagegroup. Adding the openssh-server
lets the sftp server start up correctly.

YOCTO #9362

Signed-off-by: bavery <brian.avery@intel.com>
---
 recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb b/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb
index c45463f..c32fef5 100644
--- a/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb
+++ b/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb
@@ -6,4 +6,5 @@ RDEPENDS_${PN} = "\
     gdbserver \
     tcf-agent \
     openssh-sftp-server \
+    openssh \
     "
-- 
1.9.1


