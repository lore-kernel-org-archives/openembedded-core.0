Return-Path: <costin.c.constantin@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id DA43E6FFCC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 09:56:48 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 18 Feb 2016 01:56:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,464,1449561600"; d="scan'208";a="888527018"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 18 Feb 2016 01:56:27 -0800
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id 7E9386A4004;
	Thu, 18 Feb 2016 02:44:17 -0800 (PST)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Feb 2016 12:09:49 +0200
Message-Id: <1455790189-6464-1-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] oeqa/utils/commands.py: eliminate import bb error [YP#9136] added bitbake/lib to sys.path
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
X-List-Received-Date: Thu, 18 Feb 2016 09:56:51 -0000

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 meta/lib/oeqa/utils/commands.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 32e001c..8220169 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -18,6 +18,7 @@ from oeqa.utils import CommandError
 from oeqa.utils import ftools
 import re
 import contextlib
+sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../../../..', 'bitbake/lib')))
 import bb
 
 class Command(object):
-- 
2.5.0


