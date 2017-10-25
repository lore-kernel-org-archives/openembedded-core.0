Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 019BF606CA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 23:18:13 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Oct 2017 16:18:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,433,1503385200"; d="scan'208";a="142266416"
Received: from swold-mobl2.jf.intel.com ([10.24.8.86])
	by orsmga004.jf.intel.com with ESMTP; 25 Oct 2017 16:18:00 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Wed, 25 Oct 2017 16:18:00 -0700
Message-Id: <20171025231800.17123-1-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.5
Subject: [PATCH] wic/misc: Use bitbake -e -b options for env generation
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
X-List-Received-Date: Wed, 25 Oct 2017 23:18:14 -0000

The -e option generates the environment and the -b only select the
one recipe and suppresses the dependency generation as that is not
needed for environment generation.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 scripts/lib/wic/misc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index ee888b478cc..de0307844e7 100644
--- a/scripts/lib/wic/misc.py
+++ b/scripts/lib/wic/misc.py
@@ -222,7 +222,7 @@ class BitbakeVars(defaultdict):
                     return
             else:
                 # Get bitbake -e output
-                cmd = "bitbake -e"
+                cmd = "bitbake -e -b"
                 if image:
                     cmd += " %s" % image
 
-- 
2.13.5


