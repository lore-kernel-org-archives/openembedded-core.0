Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id ECE3A60F54
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 10:52:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 Sep 2013 03:49:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,970,1371106800"; d="scan'208";a="408262210"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.52])
	by orsmga002.jf.intel.com with ESMTP; 24 Sep 2013 03:52:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Sep 2013 11:52:39 +0100
Message-Id: <1380019959-18268-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] scripts/runqemu: write temp file into correct location
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
X-List-Received-Date: Tue, 24 Sep 2013 10:52:51 -0000

We want the temporary file to be written in /tmp not the current
directory.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index efab1a2..eb950bc 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -340,7 +340,7 @@ setup_path_vars() {
             exit 1; }
 
         # We have bitbake in PATH, get the variable values from bitbake
-        BITBAKE_ENV_TMPFILE=`mktemp runqemu.XXXXXXXXXX`
+        BITBAKE_ENV_TMPFILE=`mktemp --tmpdir runqemu.XXXXXXXXXX`
         if [ "$?" != "0" ] ; then
             echo "Error: mktemp failed for bitbake environment output"
             exit 1
-- 
1.8.1.2


