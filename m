Return-Path: <tom.zanussi@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CED036D2BA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 14:24:10 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Oct 2013 07:24:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="396768625"
Received: from unknown (HELO localhost) ([10.255.14.222])
	by orsmga001.jf.intel.com with ESMTP; 22 Oct 2013 07:24:12 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2013 09:24:00 -0500
Message-Id: <1f8c74d82443303457f054bc301c15e0814f4d54.1382451106.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <9872888983dba131e54cd489a1c5b9ef05728681.1382451106.git.tom.zanussi@linux.intel.com>
References: <9872888983dba131e54cd489a1c5b9ef05728681.1382451106.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1382451106.git.tom.zanussi@linux.intel.com>
References: <cover.1382451106.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 05/10] wic: remove rpm warning code from BackendPlugin
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
X-List-Received-Date: Tue, 22 Oct 2013 14:24:11 -0000

We don't currently use rpm functionality, so we don't need to silence
rpm warnings.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/pluginbase.py | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/scripts/lib/mic/pluginbase.py b/scripts/lib/mic/pluginbase.py
index 6ac195b..2f9d720 100644
--- a/scripts/lib/mic/pluginbase.py
+++ b/scripts/lib/mic/pluginbase.py
@@ -83,11 +83,6 @@ class ImagerPlugin(_Plugin):
 class BackendPlugin(_Plugin):
     mic_plugin_type="backend"
 
-    # suppress the verbose rpm warnings
-    if msger.get_loglevel() != 'debug':
-        import rpm
-        rpm.setVerbosity(rpm.RPMLOG_ERR)
-
     def addRepository(self):
         pass
 
-- 
1.8.3.1


