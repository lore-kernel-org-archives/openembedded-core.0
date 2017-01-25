Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3CD5771D4E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 20:24:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 25 Jan 2017 12:24:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,285,1477983600"; d="scan'208";a="1087278617"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by orsmga001.jf.intel.com with ESMTP; 25 Jan 2017 12:24:07 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 12:20:04 +0000
Message-Id: <2a6c94ed7a461f75f428ca691e809e7591057323.1485346622.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1485346622.git.mariano.lopez@linux.intel.com>
References: <cover.1485346622.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1485346622.git.mariano.lopez@linux.intel.com>
References: <cover.1485346622.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/3] runtime/cases/connman.py: Stop using oeRuntimeTest
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
X-List-Received-Date: Wed, 25 Jan 2017 20:24:06 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

oeRuntimeTest class is not used anymore as part of runtime
migration, this particular case was missed, so fix it.

[YOCTO #10964]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/runtime/cases/connman.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/connman.py b/meta/lib/oeqa/runtime/cases/connman.py
index 8b47108..12456b4 100644
--- a/meta/lib/oeqa/runtime/cases/connman.py
+++ b/meta/lib/oeqa/runtime/cases/connman.py
@@ -6,7 +6,7 @@ from oeqa.runtime.decorator.package import OEHasPackage
 class ConnmanTest(OERuntimeTestCase):
 
     def service_status(self, service):
-        if oeRuntimeTest.hasFeature("systemd"):
+        if 'systemd' in self.tc.td['DISTRO_FEATURES']:
             (_, output) = self.target.run('systemctl status -l %s' % service)
             return output
         else:
-- 
2.6.6


