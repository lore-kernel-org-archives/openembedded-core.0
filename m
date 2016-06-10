Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 93BAA6FF23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 07:44:01 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 10 Jun 2016 00:44:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,449,1459839600"; d="scan'208";a="716876960"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Jun 2016 00:44:01 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id B38B46A4006;
	Fri, 10 Jun 2016 01:31:26 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jun 2016 10:43:52 +0300
Message-Id: <1465544632-8025-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] buildhistory-diff: suggest correct version of PythonGit
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
X-List-Received-Date: Fri, 10 Jun 2016 07:44:04 -0000

If buildhistory-diff can't import git module it throws error
message suggesting to install it.

Due to the move to Python 3 the suggested package name and
version became outdated.

Changed package name to python3-git and version to >= 0.3.4
as GitPython supports Python 3 starting from 0.3.4.

[YOCTO #9741]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/buildhistory-diff | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/buildhistory-diff b/scripts/buildhistory-diff
index dc8b8f2..d8ca12d 100755
--- a/scripts/buildhistory-diff
+++ b/scripts/buildhistory-diff
@@ -14,7 +14,7 @@ from distutils.version import LooseVersion
 try:
     import git
 except ImportError:
-    print("Please install GitPython (python-git) 0.3.1 or later in order to use this script")
+    print("Please install GitPython (python3-git) 0.3.4 or later in order to use this script")
     sys.exit(1)
 
 def main():
-- 
2.1.4


