Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BE3CB60017
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 16:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491324347; x=1522860347;
	h=from:to:cc:subject:date:message-id;
	bh=SQqwF7Bb2UG4e2HzGhN2FStyi5CxvwoEz9KVM778R+k=;
	b=EKQVgdy5Em903jLWF7CHmezehutA8ElUJr341mLvFMCBESuw6w1KbLqv
	HLkeFBENYSXgfZmfXkpwpduFihOCgw==;
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2017 09:45:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,275,1486454400"; d="scan'208";a="951683668"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by orsmga003.jf.intel.com with ESMTP; 04 Apr 2017 09:45:45 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Apr 2017 09:45:46 -0700
Message-Id: <20170404164547.39436-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH 1/2] selftest/commands: extend variable regex to include A_B variable notation
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
X-List-Received-Date: Tue, 04 Apr 2017 16:45:46 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

This change allows quering for variables with the format A_B, i.e.
PREFERRED_PROVIDER_virtual/kernel instead of just A.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/utils/commands.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 2951dfb..57286fc 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -165,7 +165,7 @@ def get_bb_vars(variables=None, target=None, postconfig=None):
 
     if variables is not None:
         variables = variables.copy()
-    var_re = re.compile(r'^(export )?(?P<var>\w+)="(?P<value>.*)"$')
+    var_re = re.compile(r'^(export )?(?P<var>\w+(_.*)?)="(?P<value>.*)"$')
     unset_re = re.compile(r'^unset (?P<var>\w+)$')
     lastline = None
     values = {}
-- 
2.10.2


