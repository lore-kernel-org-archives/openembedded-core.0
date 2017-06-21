Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2065D7780E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 16:18:29 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jun 2017 09:18:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,369,1493708400"; d="scan'208";a="983577701"
Received: from snegre-mobl3.ger.corp.intel.com (HELO
	heimdall.ger.corp.intel.com) ([10.252.15.148])
	by orsmga003.jf.intel.com with ESMTP; 21 Jun 2017 09:18:29 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org,
	paul.eggleton@linux.intel.com
Date: Wed, 21 Jun 2017 19:18:26 +0300
Message-Id: <20170621161826.30658-1-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] selftest/devtool: Don't use removed remake as test case
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
X-List-Received-Date: Wed, 21 Jun 2017 16:18:30 -0000

remake was removed from oe-core: use another recipe in the devtool
extract test.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

remake removal is not yet in master.

Paul please review: I didn't know if there was a reason for picking
remake, I chose matchbox-terminal because the source is tiny.

Thanks,
Jussi


 meta/lib/oeqa/selftest/cases/devtool.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index a7fde201fbc..88d69724f93 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1094,8 +1094,7 @@ class DevtoolTests(DevtoolBase):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         # Try devtool extract
         self.track_for_cleanup(tempdir)
-        self.append_config('PREFERRED_PROVIDER_virtual/make = "remake"')
-        result = runCmd('devtool extract remake %s' % tempdir)
+        result = runCmd('devtool extract matchbox-terminal %s' % tempdir)
         self.assertExists(os.path.join(tempdir, 'Makefile.am'), 'Extracted source could not be found')
         # devtool extract shouldn't create the workspace
         self.assertNotExists(self.workspacedir)
-- 
2.11.0


