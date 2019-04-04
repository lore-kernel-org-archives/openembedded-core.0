Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6C4007D44F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 09:19:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2019 02:19:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,306,1549958400"; d="scan'208";a="132890992"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga006.jf.intel.com with ESMTP; 04 Apr 2019 02:19:39 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2019 16:48:35 +0800
Message-Id: <1554367718-74682-2-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554367718-74682-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1554367718-74682-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 1/4] resulttool/manualexecution: Standardize input check
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
X-List-Received-Date: Thu, 04 Apr 2019 09:19:39 -0000

Current input checking does not match the standard input practiced
by QA team. Change the input checking to match the standard
input practiced by the QA team.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/lib/resulttool/manualexecution.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/resulttool/manualexecution.py b/scripts/lib/resulttool/manualexecution.py
index 6487cd9..8ce7903 100755
--- a/scripts/lib/resulttool/manualexecution.py
+++ b/scripts/lib/resulttool/manualexecution.py
@@ -45,9 +45,9 @@ class ManualTestRunner(object):
     def _get_input(self, config):
         while True:
             output = input('{} = '.format(config))
-            if re.match('^[a-zA-Z0-9_-]+$', output):
+            if re.match('^[a-z0-9-.]+$', output):
                 break
-            print('Only alphanumeric and underscore/hyphen are allowed. Please try again')
+            print('Only lowercase alphanumeric, hyphen and dot are allowed. Please try again')
         return output
 
     def _create_config(self):
-- 
2.7.4


