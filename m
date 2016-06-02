Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3D8FC77422
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 10:14:03 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 02 Jun 2016 03:14:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,405,1459839600"; d="scan'208";a="993699887"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 02 Jun 2016 03:14:03 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 8D4916A4083
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 04:01:31 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2016 13:13:01 +0300
Message-Id: <a52cfd95da0f07b5e2950b93a40e6bdb19d24c03.1464861910.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1464861910.git.ed.bartosh@linux.intel.com>
References: <cover.1464861910.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1464861910.git.ed.bartosh@linux.intel.com>
References: <cover.1464861910.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 15/16] combo-layer: python3: use tempfile.TemporaryFile
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
X-List-Received-Date: Thu, 02 Jun 2016 10:14:03 -0000

Used tempfile.TemporaryFile() API instead of deprecated
os.tmpfile().

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/combo-layer | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 7f0fa48..eaa7f5a 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -185,10 +185,10 @@ def runcmd(cmd,destdir=None,printerr=True,out=None,env=None):
     """
     logger.debug("run cmd '%s' in %s" % (cmd, os.getcwd() if destdir is None else destdir))
     if not out:
-        out = os.tmpfile()
+        out = tempfile.TemporaryFile()
         err = out
     else:
-        err = os.tmpfile()
+        err = tempfile.TemporaryFile()
     try:
         subprocess.check_call(cmd, stdout=out, stderr=err, cwd=destdir, shell=isinstance(cmd, str), env=env or os.environ)
     except subprocess.CalledProcessError as e:
-- 
2.1.4


