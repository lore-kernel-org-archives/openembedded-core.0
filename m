Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C37D17713E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 19:08:51 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 05 Apr 2016 12:08:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,445,1455004800"; d="scan'208";a="778683011"
Received: from jhibarra-desk.zpn.intel.com ([10.219.17.169])
	by orsmga003.jf.intel.com with ESMTP; 05 Apr 2016 12:08:54 -0700
From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Apr 2016 22:15:52 -0500
Message-Id: <1459912554-1192-2-git-send-email-humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1459912554-1192-1-git-send-email-humberto.ibarra.lopez@intel.com>
References: <1459912554-1192-1-git-send-email-humberto.ibarra.lopez@intel.com>
Subject: [PATCH 1/3] scripts/oe-selftest: remove unneeded coverage warning
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
X-List-Received-Date: Tue, 05 Apr 2016 19:08:51 -0000

There is a message that warns the user about enabling subprocessing
for coverage to work. After the fix for Yocto #8930,
this task is done automatically, so the warning is not needed
anymore.

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
---
 scripts/oe-selftest | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 9b29ae0..2348b47 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -578,9 +578,7 @@ def buildResultClass(args):
                     # check if user can do coverage
                     import coverage
                 except:
-                    log.warn('\n'.join(["python coverage is not installed",
-                        "Make sure your coverage takes into account sub-process",
-                        "More info on https://pypi.python.org/pypi/coverage"]))
+                    log.warn("python coverage is not installed. More info on https://pypi.python.org/pypi/coverage")
                     self.coverage_installed = False
 
                 if self.coverage_installed:
-- 
2.1.4


