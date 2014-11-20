Return-Path: <kmsywula@ecsmtp.ir.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9426865C78
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 19:38:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 20 Nov 2014 11:31:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,425,1413270000"; d="scan'208";a="625773201"
Received: from irvmail001.ir.intel.com ([163.33.26.43])
	by fmsmga001.fm.intel.com with ESMTP; 20 Nov 2014 11:38:24 -0800
Received: from irsswdev001.ir.intel.com (irsswdev001.ir.intel.com
	[163.33.195.157])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
	sAKJcNNC011336; Thu, 20 Nov 2014 19:38:23 GMT
Received: from irsswdev001.ir.intel.com (localhost [127.0.0.1])
	by irsswdev001.ir.intel.com with ESMTP id sAKJcNRu020881;
	Thu, 20 Nov 2014 19:38:23 GMT
Received: (from kmsywula@localhost)
	by irsswdev001.ir.intel.com with œ id sAKJcNc7020876;
	Thu, 20 Nov 2014 19:38:23 GMT
From: krzysztof.m.sywula@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Nov 2014 19:37:42 +0000
Message-Id: <1416512262-20773-1-git-send-email-krzysztof.m.sywula@intel.com>
X-Mailer: git-send-email 1.7.12.2
Cc: calvin.s.park@intel.com
Subject: [PATCH] dtc: old SRC_URI died, changing to new working one
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
X-List-Received-Date: Thu, 20 Nov 2014 19:38:30 -0000

From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>

Signed-off-by: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
---
 meta/recipes-kernel/dtc/dtc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
index 13f5508..95023b6 100644
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ b/meta/recipes-kernel/dtc/dtc.inc
@@ -6,7 +6,7 @@ DEPENDS = "flex-native bison-native"
 
 inherit autotools-brokensep
 
-SRC_URI = "git://www.jdl.com/software/dtc.git \
+SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git \
            file://make_install.patch \
 	  "
 
-- 
1.7.12.2


