Return-Path: <francisco.j.pedraza.gonzalez@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 91273600E2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 17:38:57 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 29 Sep 2016 10:38:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,268,1473145200"; d="scan'208";a="1038263066"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 29 Sep 2016 10:38:59 -0700
Received: from fjpedraz-MOBL3.zpn.intel.com (fjpedraz-mobl3.zpn.intel.com
	[10.219.24.19])
	by linux.intel.com (Postfix) with ESMTP id 18F4A6A4080;
	Thu, 29 Sep 2016 10:38:32 -0700 (PDT)
From: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2016 12:38:56 -0500
Message-Id: <1f62598c51576a3d51dde24563e8e935de270185.1475170576.git.francisco.j.pedraza.gonzalez@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1475170576.git.francisco.j.pedraza.gonzalez@intel.com>
References: <cover.1475170576.git.francisco.j.pedraza.gonzalez@intel.com>
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Subject: [PATCH 1/1] oeqa/utils: Add StreamHandler to logger
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
X-List-Received-Date: Thu, 29 Sep 2016 17:38:59 -0000

StreamHandler was added due missing log information on the console in
oe-selftest with Qemu Runner

Signed-off-by: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 1f98682..8f1b5b9 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -20,6 +20,7 @@ from oeqa.utils.dump import HostDumper
 
 import logging
 logger = logging.getLogger("BitBake.QemuRunner")
+logger.addHandler(logging.StreamHandler())
 
 # Get Unicode non printable control chars
 control_range = list(range(0,32))+list(range(127,160))
-- 
2.5.0


