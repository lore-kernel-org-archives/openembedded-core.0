Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 42F65607A4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 21:50:00 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 22 Oct 2015 14:50:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,184,1444719600"; d="scan'208";a="669848769"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by orsmga003.jf.intel.com with ESMTP; 22 Oct 2015 14:50:01 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 13:39:19 +0000
Message-Id: <d7061d7afd3379f116acdcfffc6baded1addfdb4.1445520365.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1445520365.git.mariano.lopez@linux.intel.com>
References: <cover.1445520365.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1445520365.git.mariano.lopez@linux.intel.com>
References: <cover.1445520365.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/2] qemurunner: Show the output of runqemu script
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
X-List-Received-Date: Thu, 22 Oct 2015 21:50:01 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This change will show runqemu output in the logs
when running the runtime tests. This is helpful
for debugging testimage errors.

[YOCTO #8550]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 6fe75b8..bdc6e0a 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -210,6 +210,7 @@ class QemuRunner:
                 self.stop_thread()
                 return False
 
+            logger.info("Output from runqemu:\n%s", self.getOutput(output))
             logger.info("Waiting at most %d seconds for login banner" % self.boottime)
             endtime = time.time() + self.boottime
             socklist = [self.server_socket]
-- 
1.8.4.5


