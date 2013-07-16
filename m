Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4867A6B22C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 19:33:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Jul 2013 12:30:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,679,1367996400"; d="scan'208";a="371335559"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.97])
	by orsmga002.jf.intel.com with ESMTP; 16 Jul 2013 12:32:47 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jul 2013 12:32:47 -0700
Message-Id: <1374003167-16691-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] buildtools: testimage needs the mmap python
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
X-List-Received-Date: Tue, 16 Jul 2013 19:33:08 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index e8abc06..9771497 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -30,6 +30,7 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-python-compression \
     nativesdk-python-json \
     nativesdk-python-unittest \
+    nativesdk-python-mmap \
     nativesdk-python-difflib \
     nativesdk-python-pprint \
     nativesdk-python-git \
-- 
1.8.1.4


