Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D96346F939
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 19:24:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Mar 2014 12:24:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,697,1389772800"; d="scan'208";a="476625227"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.120.182])
	by orsmga001.jf.intel.com with ESMTP; 20 Mar 2014 12:24:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Mar 2014 19:24:34 +0000
Message-Id: <2eb9d4b76dfe9fcbecccb6582fe2603061c99da8.1395343268.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1395343268.git.paul.eggleton@linux.intel.com>
References: <cover.1395343268.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1395343268.git.paul.eggleton@linux.intel.com>
References: <cover.1395343268.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/5] generate-manifest-*.py: set SUMMARY instead of DESCRIPTION
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
X-List-Received-Date: Thu, 20 Mar 2014 19:24:55 -0000

Typically what's being set here is a short description, so it makes much
more sense to set SUMMARY.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/contrib/python/generate-manifest-2.7.py | 4 ++--
 scripts/contrib/python/generate-manifest-3.3.py | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index d9d91a4..419268d 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -103,7 +103,7 @@ class MakefileMaker:
             #
             # write out the description, revision and dependencies
             #
-            self.out( 'DESCRIPTION_%s="%s"' % ( name, desc ) )
+            self.out( 'SUMMARY_%s="%s"' % ( name, desc ) )
             self.out( 'RDEPENDS_%s="%s"' % ( name, deps ) )
 
             line = 'FILES_%s="' % name
@@ -127,7 +127,7 @@ class MakefileMaker:
             self.out( line )
             self.out( "" )
 
-        self.out( 'DESCRIPTION_${PN}-modules="All Python modules"' )
+        self.out( 'SUMMARY_${PN}-modules="All Python modules"' )
         line = 'RDEPENDS_${PN}-modules="'
 
         for name, data in sorted(self.packages.iteritems()):
diff --git a/scripts/contrib/python/generate-manifest-3.3.py b/scripts/contrib/python/generate-manifest-3.3.py
index 7449867..273f99f 100755
--- a/scripts/contrib/python/generate-manifest-3.3.py
+++ b/scripts/contrib/python/generate-manifest-3.3.py
@@ -106,7 +106,7 @@ class MakefileMaker:
             #
             # write out the description, revision and dependencies
             #
-            self.out( 'DESCRIPTION_%s="%s"' % ( name, desc ) )
+            self.out( 'SUMMARY_%s="%s"' % ( name, desc ) )
             self.out( 'RDEPENDS_%s="%s"' % ( name, deps ) )
 
             line = 'FILES_%s="' % name
@@ -130,7 +130,7 @@ class MakefileMaker:
             self.out( line )
             self.out( "" )
 
-        self.out( 'DESCRIPTION_${PN}-modules="All Python modules"' )
+        self.out( 'SUMMARY_${PN}-modules="All Python modules"' )
         line = 'RDEPENDS_${PN}-modules="'
 
         for name, data in sorted(self.packages.iteritems()):
-- 
1.8.5.3


