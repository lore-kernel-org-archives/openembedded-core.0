Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DD56E60842
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 17:21:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2013 10:21:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,935,1367996400"; d="scan'208";a="385034908"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2013 10:21:26 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 20:23:06 +0300
Message-Id: <01452307afa0a07f897245e5a9ec2e02a887fd71.1377191890.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1377191890.git.cristian.iorga@intel.com>
References: <cover.1377191890.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1377191890.git.cristian.iorga@intel.com>
References: <cover.1377191890.git.cristian.iorga@intel.com>
Subject: [PATCH v2 1/4] xdg-utils: add runtime dependency on xprop
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
X-List-Received-Date: Thu, 22 Aug 2013 17:21:26 -0000

xprop is called by xdg-utils scripts.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb
index d5c7aa3..22247f7 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb
+++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb
@@ -23,3 +23,4 @@ SRC_URI[sha256sum] = "7b05558ae4bb8ede356863cae8c42e3e012aa421bf9d45130a570fd209
 
 inherit autotools
 
+RDEPENDS_${PN} = "xprop"
-- 
1.8.1.2


