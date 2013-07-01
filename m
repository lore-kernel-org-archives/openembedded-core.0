Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CCD756AF9D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 20:48:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 01 Jul 2013 13:46:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,975,1363158000"; d="scan'208";a="363055845"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.91])
	by orsmga002.jf.intel.com with ESMTP; 01 Jul 2013 13:48:46 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2013 13:48:44 -0700
Message-Id: <a6d0b9fd04f84c084fbb2897faac4ef4a6522b0a.1372711267.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1372711267.git.sgw@linux.intel.com>
References: <cover.1372711267.git.sgw@linux.intel.com>
In-Reply-To: <cover.1372711267.git.sgw@linux.intel.com>
References: <cover.1372711267.git.sgw@linux.intel.com>
Subject: [PATCH 3/4 v2] packagegroup-core-basic: remove hardcode udev
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
X-List-Received-Date: Mon, 01 Jul 2013 20:48:50 -0000

udev is brought in via packagegroup-core-boot

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/packagegroups/packagegroup-core-basic.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
index 47b980e..e802a02 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
@@ -73,7 +73,6 @@ RDEPENDS_packagegroup-core-basic-utils = "\
     sed \
     tar \
     time \
-    udev \
     util-linux \
     zlib \
     "
-- 
1.8.1.4


