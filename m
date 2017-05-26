Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6D3A8782B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 20:38:10 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 May 2017 13:38:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,399,1491289200"; d="scan'208";a="266887577"
Received: from tsriniv-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.amr.corp.intel.com) ([10.254.103.51])
	by fmsmga004.fm.intel.com with ESMTP; 26 May 2017 13:38:10 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 May 2017 15:37:29 -0500
Message-Id: <a9688b83fda01311b0eaeeea190028a89e25e48e.1495830706.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 03/36] oeqa/sdk/context.py: Add return to OESDKTestContext.run() method
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
X-List-Received-Date: Fri, 26 May 2017 20:38:10 -0000
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


