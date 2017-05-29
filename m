Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 8D59E77F90
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 05:16:08 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 May 2017 22:16:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,412,1491289200"; d="scan'208";a="1153993626"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by fmsmga001.fm.intel.com with ESMTP; 28 May 2017 22:16:09 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 29 May 2017 13:16:19 +0800
Message-Id: <1496034979-99713-3-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1496034979-99713-1-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1496034979-99713-1-git-send-email-rebecca.swee.fun.chang@intel.com>
Subject: [PATCH 2/2] devshell.bbclass: clean up trailing whitespaces
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
X-List-Received-Date: Mon, 29 May 2017 05:16:08 -0000

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 meta/classes/devshell.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
index 770dcbd..829c54c 100644
--- a/meta/classes/devshell.bbclass
+++ b/meta/classes/devshell.bbclass
@@ -8,7 +8,7 @@ python do_devshell () {
        fakeenv = d.getVar("FAKEROOTENV").split()
        for f in fakeenv:
             k = f.split("=")
-            d.setVar(k[0], k[1])           
+            d.setVar(k[0], k[1])
             d.appendVar("OE_TERMINAL_EXPORTS", " " + k[0])
        d.delVarFlag("do_devshell", "fakeroot")
 
@@ -58,7 +58,7 @@ def devpyshell(d):
         old[3] = old[3] &~ termios.ECHO &~ termios.ICANON
         # &~ termios.ISIG
         termios.tcsetattr(fd, termios.TCSADRAIN, old)
-    
+
     # No echo or buffering over the pty
     noechoicanon(s)
 
@@ -154,7 +154,7 @@ python do_devpyshell() {
     try:
         devpyshell(d)
     except SystemExit:
-        # Stop the SIGTERM above causing an error exit code    
+        # Stop the SIGTERM above causing an error exit code
         return
     finally:
         return
-- 
2.7.4


