Return-Path: <george.l.musat@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BC08D73CC1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 08:02:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 09 Apr 2015 01:02:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,548,1422950400"; d="scan'208";a="677567722"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 09 Apr 2015 01:02:07 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id CE6DA6A408F;
	Thu,  9 Apr 2015 01:01:44 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Apr 2015 11:01:49 +0300
Message-Id: <1428566511-31895-4-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1428566511-31895-1-git-send-email-george.l.musat@intel.com>
References: <1428566511-31895-1-git-send-email-george.l.musat@intel.com>
Subject: [PATCH 4/6] oeqa/runtime/ping: Added new decorators for existing automated tests.
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
X-List-Received-Date: Thu, 09 Apr 2015 08:02:06 -0000

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runtime/ping.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/runtime/ping.py b/meta/lib/oeqa/runtime/ping.py
index a73c724..80c4601 100644
--- a/meta/lib/oeqa/runtime/ping.py
+++ b/meta/lib/oeqa/runtime/ping.py
@@ -3,9 +3,11 @@ import unittest
 import sys
 import time
 from oeqa.oetest import oeRuntimeTest
+from oeqa.utils.decorators import *
 
 class PingTest(oeRuntimeTest):
 
+    @testcase(964)
     def test_ping(self):
         output = ''
         count = 0
-- 
2.1.0


