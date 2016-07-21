Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BAA41605BA
	for <openembedded-core@openembedded.org>;
	Thu, 21 Jul 2016 20:03:42 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 21 Jul 2016 13:03:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,400,1464678000"; d="scan'208";a="1026595602"
Received: from yctb04.ostc.intel.com ([10.54.69.58])
	by fmsmga002.fm.intel.com with ESMTP; 21 Jul 2016 13:03:36 -0700
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Thu, 21 Jul 2016 12:02:06 +0000
Message-Id: <1469102526-48920-3-git-send-email-benjamin.esquivel@linux.intel.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1469102526-48920-1-git-send-email-benjamin.esquivel@linux.intel.com>
References: <1469102526-48920-1-git-send-email-benjamin.esquivel@linux.intel.com>
Subject: [PATCH 2/2] oe-selftest: simplifying log filenames
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
X-List-Received-Date: Thu, 21 Jul 2016 20:03:42 -0000

avoiding characters like ':' and making a clearer separation of the
fields that compose the filename. Changing from:

oe-selftest-2016-07-20_16:05:27.log

to:

oe-selftest-20160720-160527.log

Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
---
 scripts/oe-selftest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 3188a41..72bf4dd 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -57,7 +57,7 @@ except ImportError:
     from unittest import TextTestResult as TestResult
     from unittest import TextTestRunner as _TestRunner
 
-log_prefix = "oe-selftest-" + t.strftime("%Y-%m-%d_%H:%M:%S")
+log_prefix = "oe-selftest-" + t.strftime("%Y%m%d-%H%M%S")
 
 def logger_create():
     log_file = log_prefix + ".log"
-- 
2.5.1


