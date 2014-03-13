Return-Path: <valentin.popa@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BDF206F776
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 11:29:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Mar 2014 04:24:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,646,1389772800"; d="scan'208";a="499115199"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.47])
	by orsmga002.jf.intel.com with ESMTP; 13 Mar 2014 04:29:09 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Mar 2014 13:28:53 +0200
Message-Id: <1394710133-18659-1-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] Set ac_cv_sizeof_ssize_t
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
X-List-Received-Date: Thu, 13 Mar 2014 11:29:11 -0000

Set ac_cv_sizeof_ssize_t for mips64;
mips-common will not overwrite it.

[YOCTO #5935]

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 meta/site/mips64-linux | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/site/mips64-linux b/meta/site/mips64-linux
index 4449c96..ed0fbbe 100644
--- a/meta/site/mips64-linux
+++ b/meta/site/mips64-linux
@@ -35,6 +35,7 @@ glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
 ac_cv_alignof_guint32=4
 ac_cv_alignof_guint64=8
 ac_cv_alignof_unsigned_long=8
+ac_cv_sizeof_ssize_t=8
 
 # libpcap
 ac_cv_linux_vers=${ac_cv_linux_vers=2}
-- 
1.8.3.2


