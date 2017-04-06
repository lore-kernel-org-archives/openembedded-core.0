Return-Path: <jianxun.zhang@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CE9F977684
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 22:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491519259; x=1523055259;
	h=from:to:cc:subject:date:message-id;
	bh=60AVMVzTZcvxXidwDN5YjlHwKmLGOXuZaJ0nXArFErY=;
	b=kECaBoOkQ9ZqhbLITbPOTdE+nnBE/yXAVv6tPDKGEzG2FJOBSG/Rgz7K
	YISq1U0m/cmUwVX02SNPQz1Rl+67WA==;
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Apr 2017 15:54:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,161,1488873600"; d="scan'208";a="85598837"
Received: from chang-s2600cp.jf.intel.com ([10.54.77.140])
	by fmsmga005.fm.intel.com with ESMTP; 06 Apr 2017 15:54:18 -0700
From: Jianxun Zhang <jianxun.zhang@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Apr 2017 15:58:38 -0700
Message-Id: <1491519518-111619-1-git-send-email-jianxun.zhang@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] ethtool: fix 4.8 checksums
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
X-List-Received-Date: Thu, 06 Apr 2017 22:54:17 -0000

The mismatched checksums cause fatching failed in my setup.

Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
---
I am not sure why I got this issue today, but it seems the upstream package has different checksums.

Maintainer could help to check if this is a false patch.

 meta/recipes-extended/ethtool/ethtool_4.8.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/ethtool/ethtool_4.8.bb b/meta/recipes-extended/ethtool/ethtool_4.8.bb
index afaf2e2..ce3eaf3 100644
--- a/meta/recipes-extended/ethtool/ethtool_4.8.bb
+++ b/meta/recipes-extended/ethtool/ethtool_4.8.bb
@@ -11,8 +11,8 @@ SRC_URI = "https://downloads.yoctoproject.org/mirror/sources/ethtool-${PV}.tar.g
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[md5sum] = "28c4a4d85c33f573c49ff6d81ec094fd"
-SRC_URI[sha256sum] = "1bd82ebe3d41de1b7b0d8f4fb18a8e8466fba934c952bc5c5002836ffa8bb606"
+SRC_URI[md5sum] = "992eab97607c64b7848edfd37f23da22"
+SRC_URI[sha256sum] = "c8ea20b8d85898377ec130066008f9241ebcdd95ac85dbcc2d50b32fe2e2f934"
 
 inherit autotools ptest
 RDEPENDS_${PN}-ptest += "make"
-- 
2.7.4


