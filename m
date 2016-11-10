Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AEDF471A7F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 14:57:29 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 10 Nov 2016 06:57:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,619,1473145200"; 
   d="scan'208";a="2382262"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 10 Nov 2016 06:57:30 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2016 16:57:29 +0200
Message-Id: <1478789849-18895-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH] sanity.bbclass: fix logging of an error
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
X-List-Received-Date: Thu, 10 Nov 2016 14:57:30 -0000

Fixes a crash in exception handler. All bb logging functions need an
string instances as arguments.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 7682ffb..9db3f1d 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -565,7 +565,7 @@ def sanity_check_conffiles(d):
             try:
                 bb.build.exec_func(func, d, pythonexception=True)
             except NotImplementedError as e:
-                bb.fatal(e)
+                bb.fatal(str(e))
             d.setVar("BB_INVALIDCONF", True)
 
 def sanity_handle_abichanges(status, d):
-- 
2.6.6


