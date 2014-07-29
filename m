Return-Path: <tom.zanussi@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 515CC7089F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 19:40:23 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 Jul 2014 12:40:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,759,1400050800"; d="scan'208";a="462821981"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by azsmga001.ch.intel.com with ESMTP; 29 Jul 2014 12:40:24 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jul 2014 14:40:11 -0500
Message-Id: <f5d4f0edd2576ad34adc264534331a11f9dd9a6d.1406662652.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <fb6a0829b1970aff4f3affc2693fd5af3cc37f37.1406662652.git.tom.zanussi@linux.intel.com>
References: <fb6a0829b1970aff4f3affc2693fd5af3cc37f37.1406662652.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1406662652.git.tom.zanussi@linux.intel.com>
References: <cover.1406662652.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 4/4] wic: Various typo/grammar fixes to wic help text
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
X-List-Received-Date: Tue, 29 Jul 2014 19:40:24 -0000

This is a set of miscellaneous help text updates noticed while
transcribing wic help for the dev manual.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/image/help.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
index b833459..6e8e037 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/image/help.py
@@ -443,8 +443,8 @@ DESCRIPTION
     artifacts, the result is an image or set of images that can be
     directly written onto media and used on a particular system.
 
-    The 'wic' command and the infrastructure it's based is by
-    definition incomplete - it's designed to allow the generation of
+    The 'wic' command and the infrastructure it's based on is by
+    definition incomplete - its purpose is to allow the generation of
     customized images, and as such was designed to be completely
     extensible via a plugin interface (see 'wic help plugins').
 
@@ -705,7 +705,7 @@ DESCRIPTION
                    wic command-line option (or the equivalent rootfs
                    derived from the '-e' command-line option).
                    Exactly what those contents and filesystem type end
-                   up being are depend on the given plugin
+                   up being are dependent on the given plugin
                    implementation.
 
          --ondisk or --ondrive: Forces the partition to be created on
-- 
1.8.3.1


