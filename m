Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 75B87770B4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 15:21:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 06 Jun 2016 08:21:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,427,1459839600"; d="scan'208";a="714707583"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Jun 2016 08:21:06 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jun 2016 07:15:39 +0000
Message-Id: <5db2108c6eead07014ec93e072747a6a96fc519d.1465196934.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1465196934.git.mariano.lopez@linux.intel.com>
References: <cover.1465196934.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1465196934.git.mariano.lopez@linux.intel.com>
References: <cover.1465196934.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv2 1/7] oe/lib/pacakge_manager.py: Update missing pipeline decoding
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
X-List-Received-Date: Mon, 06 Jun 2016 15:21:06 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Adds decoding needed by some commands output later used as
strings.

[YOCTO #9702]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 3b1d24f..4aaff8c 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1411,7 +1411,7 @@ class RpmPM(PackageManager):
     def package_info(self, pkg):
         cmd = "%s %s info --urls %s" % (self.smart_cmd, self.smart_opt, pkg)
         try:
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
         except subprocess.CalledProcessError as e:
             bb.fatal("Unable to list available packages. Command '%s' "
                      "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
@@ -1506,7 +1506,7 @@ class OpkgDpkgPM(PackageManager):
     def package_info(self, pkg, cmd):
 
         try:
-            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
         except subprocess.CalledProcessError as e:
             bb.fatal("Unable to list available packages. Command '%s' "
                      "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
-- 
2.6.6


