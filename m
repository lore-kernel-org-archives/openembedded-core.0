Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 8D46F71AD9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 19:47:36 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 10 May 2017 12:47:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,320,1491289200"; d="scan'208";a="1128735065"
Received: from rnpawar-mobl3.amr.corp.intel.com (HELO
	alimonb-mobl1.zpn.intel.com) ([10.254.59.138])
	by orsmga001.jf.intel.com with ESMTP; 10 May 2017 12:47:33 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2017 14:47:03 -0500
Message-Id: <1540aee49bd60e5b4510ccb8ea4a3f0cb41ad4e0.1494445222.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1494445222.git.anibal.limon@linux.intel.com>
References: <cover.1494445222.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1494445222.git.anibal.limon@linux.intel.com>
References: <cover.1494445222.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, juan.m.cruz.alcaraz@intel.com
Subject: [PATCH 03/17] oeqa/sdk/context.py: Add return to OESDKTestContext.run() method
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
X-List-Received-Date: Wed, 10 May 2017 19:47:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The run() methods of a OETestContext's are expected to return the
results.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/sdk/context.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdk/context.py b/meta/lib/oeqa/sdk/context.py
index 509d2b4..82e4c19 100644
--- a/meta/lib/oeqa/sdk/context.py
+++ b/meta/lib/oeqa/sdk/context.py
@@ -128,6 +128,6 @@ class OESDKTestContextExecutor(OETestContextExecutor):
                    "environment (%s) specified" % args.sdk_env, self.name)
 
         self.sdk_env = sdk_envs[args.sdk_env]
-        super(OESDKTestContextExecutor, self).run(logger, args)
+        return super(OESDKTestContextExecutor, self).run(logger, args)
 
 _executor_class = OESDKTestContextExecutor
-- 
2.1.4


