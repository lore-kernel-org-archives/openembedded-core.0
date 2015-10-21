Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 346C47705E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 13:19:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 21 Oct 2015 06:19:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,712,1437462000"; d="scan'208";a="799108441"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.252.27.125])
	by orsmga001.jf.intel.com with ESMTP; 21 Oct 2015 06:19:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Oct 2015 14:18:50 +0100
Message-Id: <5df3571b7b06b0f895a26acd231ee0d7c63996be.1445433416.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1445433416.git.paul.eggleton@linux.intel.com>
References: <cover.1445433416.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1445433416.git.paul.eggleton@linux.intel.com>
References: <cover.1445433416.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/insane: rename invalid-pkgconfig QA check to invalid-packageconfig
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
X-List-Received-Date: Wed, 21 Oct 2015 13:19:06 -0000

We have enough confusing name clashes already, let's not precipitate
another one.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/insane.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index f7be61b..a77438d 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -32,7 +32,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             installed-vs-shipped compile-host-path install-host-path \
             pn-overrides infodir build-deps file-rdeps \
             unknown-configure-option symlink-to-sysroot multilib \
-            invalid-pkgconfig host-user-contaminated \
+            invalid-packageconfig host-user-contaminated \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -1210,7 +1210,7 @@ Missing inherit gettext?""" % (gt, config))
             if pconfig not in pkgconfigflags:
                 pn = d.getVar('PN', True)
                 error_msg = "%s: invalid PACKAGECONFIG: %s" % (pn, pconfig)
-                package_qa_handle_error("invalid-pkgconfig", error_msg, d)
+                package_qa_handle_error("invalid-packageconfig", error_msg, d)
 }
 
 python do_qa_unpack() {
-- 
2.1.0


