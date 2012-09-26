Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1TGziX-0000K5-KN
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 00:04:29 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Sep 2012 14:51:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,492,1344236400"; d="scan'208";a="198277643"
Received: from envy.jf.intel.com (HELO envy) ([10.7.201.159])
	by orsmga001.jf.intel.com with ESMTP; 26 Sep 2012 14:51:37 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id q8QLoBdx027856;
	Wed, 26 Sep 2012 14:50:11 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q8QLoBQ6027855;
	Wed, 26 Sep 2012 14:50:11 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Sep 2012 14:50:07 -0700
Message-Id: <c2df57712e4e2ce9e87121b063835f51e5a76d7c.1348695851.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1348695851.git.elizabeth.flanagan@intel.com>
References: <cover.1348695851.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 1/3] license.bbclass: Variable standardization
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Sep 2012 22:04:29 -0000

The variable mentioned in license.conf is LICENSE_PATH. The variable
used in license.bbclass is LICENSE_DIR. Conforming to what is in
license.conf

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/license.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index ffcaf93..ad543f6 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -186,7 +186,7 @@ python do_populate_lic() {
     license_source_dirs = []
     license_source_dirs.append(generic_directory)
     try:
-        additional_lic_dirs = d.getVar('LICENSE_DIR', True).split()
+        additional_lic_dirs = d.getVar('LICENSE_PATH', True).split()
         for lic_dir in additional_lic_dirs:
             license_source_dirs.append(lic_dir)
     except:
-- 
1.7.5.4



