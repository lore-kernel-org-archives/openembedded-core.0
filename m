Return-Path: <kmsywula@ecsmtp.ir.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C117D739A6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 20:27:44 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 09 Mar 2015 13:27:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,369,1422950400"; d="scan'208";a="538274577"
Received: from irvmail001.ir.intel.com ([163.33.26.43])
	by orsmga003.jf.intel.com with ESMTP; 09 Mar 2015 13:27:14 -0700
Received: from irsswdev001.ir.intel.com (irsswdev001.ir.intel.com
	[163.33.195.157])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
	t29KRh2a022585; Mon, 9 Mar 2015 20:27:43 GMT
Received: from irsswdev001.ir.intel.com (localhost [127.0.0.1])
	by irsswdev001.ir.intel.com with ESMTP id t29KRhkf000397;
	Mon, 9 Mar 2015 20:27:43 GMT
Received: (from kmsywula@localhost)
	by irsswdev001.ir.intel.com with œ id t29KRhd1000392;
	Mon, 9 Mar 2015 20:27:43 GMT
From: krzysztof.m.sywula@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Mar 2015 20:26:31 +0000
Message-Id: <1425932792-32505-1-git-send-email-krzysztof.m.sywula@intel.com>
X-Mailer: git-send-email 1.8.2
Subject: [dylan][PATCH 1/2] dtc: remove unnecessary 'protocol=git'
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
X-List-Received-Date: Mon, 09 Mar 2015 20:27:45 -0000

From: Krzysztof Sywula <Krzysztof.M.Sywula@intel.com>

backporting change from master
88c5e10d6296efb175f05c3aae6e308972854cb1

Signed-off-by: Krzysztof Sywula <Krzysztof.M.Sywula@intel.com>
---
 meta/recipes-kernel/dtc/dtc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
index 18847c6..6bf2363 100644
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ b/meta/recipes-kernel/dtc/dtc.inc
@@ -6,7 +6,7 @@ DEPENDS = "flex-native bison-native"
 
 inherit autotools
 
-SRC_URI = "git://www.jdl.com/software/dtc.git;protocol=git \
+SRC_URI = "git://www.jdl.com/software/dtc.git \
            file://make_install.patch \
 	  "
 
-- 
1.8.2


