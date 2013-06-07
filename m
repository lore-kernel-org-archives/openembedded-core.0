Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 48BBC6A53C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 22:16:43 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 07 Jun 2013 15:16:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,824,1363158000"; d="scan'208";a="346581024"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.19])
	by fmsmga001.fm.intel.com with ESMTP; 07 Jun 2013 15:17:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2013 15:16:43 -0700
Message-Id: <1370643403-21918-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] sanity: remove warn debug message
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
X-List-Received-Date: Fri, 07 Jun 2013 22:16:43 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/sanity.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 744e30d..a8e3af6 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -353,7 +353,6 @@ def check_git_version(sanity_data, loosever):
     if status != 0:
         return "Unable to execute git --version, exit code %s\n" % status
     version = result.split()[2]
-    bb.warn(version)
     if loosever(version) < loosever("1.7.5"):
         return "Your version of git is older than 1.7.5 and has bugs which will break builds. Please install a newer version of git.\n"
     return None
-- 
1.8.1.4


