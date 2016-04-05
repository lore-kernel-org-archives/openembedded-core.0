Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 071737713C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 16:20:21 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 05 Apr 2016 09:20:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,444,1455004800"; d="scan'208";a="925960042"
Received: from afshjern.zpn.intel.com ([10.219.5.80])
	by orsmga001.jf.intel.com with ESMTP; 05 Apr 2016 09:20:20 -0700
From: Alex Franco <alejandro.franco@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Apr 2016 11:21:34 -0500
Message-Id: <1459873294-31901-1-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] patch.bbclass: remove useless path assignment
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
X-List-Received-Date: Tue, 05 Apr 2016 16:20:23 -0000

A path variable is assigned the value of PATH from the
environment, before the PATH is set on the environemnt
from the value of PATH in the bb datastore. This seems
to be an unnecessary leftover.

[YOCTO #8543]

Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
---
 meta/classes/patch.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index 1e2aab0..3d22ad8 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -136,7 +136,6 @@ python patch_do_patch() {
 
     s = d.getVar('S', True)
 
-    path = os.getenv('PATH')
     os.putenv('PATH', d.getVar('PATH', True))
 
     # We must use one TMPDIR per process so that the "patch" processes
-- 
2.7.4


