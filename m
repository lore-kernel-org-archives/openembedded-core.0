Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 2582B71AC5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 19:47:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 10 May 2017 12:47:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,320,1491289200"; d="scan'208";a="1128735040"
Received: from rnpawar-mobl3.amr.corp.intel.com (HELO
	alimonb-mobl1.zpn.intel.com) ([10.254.59.138])
	by orsmga001.jf.intel.com with ESMTP; 10 May 2017 12:47:29 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2017 14:47:01 -0500
Message-Id: <8b1a731f8416c163b3aa3e081fd7e7c5ef1eb69c.1494445222.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1494445222.git.anibal.limon@linux.intel.com>
References: <cover.1494445222.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1494445222.git.anibal.limon@linux.intel.com>
References: <cover.1494445222.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, juan.m.cruz.alcaraz@intel.com
Subject: [PATCH 01/17] testsdk.bbclass: Remove unused import of OEStreamLogger
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
X-List-Received-Date: Wed, 10 May 2017 19:47:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/testsdk.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 6a201aa..4740233 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -21,7 +21,6 @@ def testsdk_main(d):
     import logging
 
     from bb.utils import export_proxies
-    from oeqa.core.runner import OEStreamLogger
     from oeqa.sdk.context import OESDKTestContext, OESDKTestContextExecutor
     from oeqa.utils import make_logger_bitbake_compatible
 
-- 
2.1.4


