Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id BF99877657
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 11:25:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 10 Mar 2017 03:25:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,140,1486454400"; d="scan'208";a="1106988202"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 10 Mar 2017 03:25:51 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Mar 2017 13:24:02 +0200
Message-Id: <b2a418c7d65b95ffecf705bfda5e5cf62381eada.1489144807.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 23/44] scripts/oe-setup-rpmrepo: replace createrepo with createrepo_c
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
X-List-Received-Date: Fri, 10 Mar 2017 11:25:50 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 scripts/oe-setup-rpmrepo | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-setup-rpmrepo b/scripts/oe-setup-rpmrepo
index 7dcded8f1d4..df1c61435c1 100755
--- a/scripts/oe-setup-rpmrepo
+++ b/scripts/oe-setup-rpmrepo
@@ -89,7 +89,7 @@ if [ ! -d "$RPM_DIR" ]; then
 	exit 1
 fi
 
-CREATEREPO=$OECORE_NATIVE_SYSROOT/usr/bin/createrepo
+CREATEREPO=$OECORE_NATIVE_SYSROOT/usr/bin/createrepo_c
 if [ ! -e "$CREATEREPO" ]; then
    	echo "Error: can't find createrepo binary"
 	echo "please run bitbake createrepo-native first"
-- 
2.11.0


