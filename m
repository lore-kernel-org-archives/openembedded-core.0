Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjSDK-0001ZJ-Lc
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 10:33:07 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2011 01:28:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,233,1309762800"; d="scan'208";a="29753302"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2011 01:28:50 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 01:28:17 -0700
Message-Id: <1b812a72a5218ac2a113b8c8e5d4c9a126707b9c.1311150183.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
Subject: [PATCH 30/50] bitbake.conf, sanity.bbclass: Drop mercurial-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jul 2011 08:36:51 -0000

From: Tom Rini <tom_rini@mentor.com>

We have no hg URIs in the metadata, so don't require and don't
ASSUME_PROVIDED it either.  meta-oe has a mercurial-native recipe
if hg URIs are added in a recipe later.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/classes/sanity.bbclass |    2 +-
 meta/conf/bitbake.conf      |    1 -
 2 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 716b158..28c9ecd 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -209,7 +209,7 @@ def check_sanity(e):
     if not check_app_exists('${BUILD_PREFIX}g++', e.data):
         missing = missing + "C++ Compiler (%sg++)," % data.getVar("BUILD_PREFIX", e.data, True)
 
-    required_utilities = "patch help2man diffstat texi2html makeinfo cvs svn bzip2 tar gzip gawk hg chrpath wget cpio"
+    required_utilities = "patch help2man diffstat texi2html makeinfo cvs svn bzip2 tar gzip gawk chrpath wget cpio"
 
     if "qemu-native" in assume_provided:
         if not check_app_exists("qemu-arm", e.data):
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 128b0b6..975e24c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -132,7 +132,6 @@ ASSUME_PROVIDED = "\
     cvs-native \
     grep-native \
     diffstat-native \
-    mercurial-native \
     patch-native \
     perl-native-runtime \
     python-native-runtime \
-- 
1.7.3.4



