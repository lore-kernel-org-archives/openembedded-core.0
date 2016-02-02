Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 209607721C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 15:12:33 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 02 Feb 2016 07:12:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,385,1449561600"; d="scan'208";a="645913223"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.31])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Feb 2016 07:12:33 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 09:14:08 -0600
Message-Id: <94ecc1506b4f759042d741096615c626aac43de7.1454424743.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1454424743.git.anibal.limon@linux.intel.com>
References: <cover.1454424743.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1454424743.git.anibal.limon@linux.intel.com>
References: <cover.1454424743.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, benjamin.esquivel@intel.com
Subject: [PATCH 05/20] get_test_suites: Add sdkext type for load test suites.
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
X-List-Received-Date: Tue, 02 Feb 2016 15:12:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/oetest.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 18b2209..6470129 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -271,6 +271,8 @@ def get_test_suites(d, type='runtime'):
 
     if type == "sdk":
         testsuites = (d.getVar("TEST_SUITES_SDK", True) or "auto").split()
+    elif type == "sdkext":
+        testsuites = (d.getVar("TEST_SUITES_SDKEXT", True) or "auto").split()
     else:
         manifests = (d.getVar("TEST_SUITES_MANIFEST", True) or '').split()
         if manifests:
-- 
2.1.4


