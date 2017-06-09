Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A69F8782F6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 17:01:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jun 2017 10:01:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,317,1493708400"; d="scan'208";a="97608086"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.117])
	by orsmga002.jf.intel.com with ESMTP; 09 Jun 2017 10:01:28 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jun 2017 12:01:28 -0500
Message-Id: <e2b7af9477cbc7d55b8659e079941f944d827432.1497027624.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1497027624.git.anibal.limon@linux.intel.com>
References: <cover.1497027624.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1497027624.git.anibal.limon@linux.intel.com>
References: <cover.1497027624.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 4/4] oeqa/sdk/cases: Fix skip of buildgcalculator test
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
X-List-Received-Date: Fri, 09 Jun 2017 17:01:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The tc.hasTargetPackage uses a re.search to see if gtk+3 is on
the manifest but + in regex means 1 or more causing the test
to be skipped.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/sdk/cases/buildgalculator.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdk/cases/buildgalculator.py b/meta/lib/oeqa/sdk/cases/buildgalculator.py
index 42e8ddb..780afcc 100644
--- a/meta/lib/oeqa/sdk/cases/buildgalculator.py
+++ b/meta/lib/oeqa/sdk/cases/buildgalculator.py
@@ -8,7 +8,7 @@ class GalculatorTest(OESDKTestCase):
 
     @classmethod
     def setUpClass(self):
-        if not (self.tc.hasTargetPackage("gtk+3") or\
+        if not (self.tc.hasTargetPackage("gtk\+3") or\
                 self.tc.hasTargetPackage("libgtk-3.0")):
             raise unittest.SkipTest("GalculatorTest class: SDK don't support gtk+3")
 
-- 
2.1.4


