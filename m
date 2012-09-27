Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1THEaO-0002G0-LK
	for Openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 15:57:05 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8RDiC2O009092
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 06:44:12 -0700 (PDT)
Received: from ord-lpggp2.wrs.com (128.224.65.244) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 27 Sep 2012 06:44:11 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Thu, 27 Sep 2012 08:52:46 -0500
Message-ID: <1348753966-45893-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH] cml1.bbclass: Convert tab indentation in python functions into four-space
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Sep 2012 13:57:05 -0000
Content-Type: text/plain

Based on the previous commit 604d46c686d06d62d5a07b9c7f4fa170f99307d8
(Convert tab indentation in python functions into four-space), the
cml.bbclass was not converted, and in order to properly extend it
with external bbappend's it needs to be converted.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/classes/cml1.bbclass |   28 ++++++++++++++--------------
 1 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index 37ed792..ba44196 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -15,23 +15,23 @@ HOSTLDFLAGS = "${BUILD_LDFLAGS}"
 HOST_LOADLIBES = "-lncurses"
 
 python do_menuconfig() {
-        try:
-            mtime = os.path.getmtime(".config")
-        except OSError:
-            mtime = 0
+    try:
+        mtime = os.path.getmtime(".config")
+    except OSError:
+        mtime = 0
 
-        oe_terminal("${SHELL} -c \"make menuconfig; if [ $? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"", '${PN} Configuration', d)
+    oe_terminal("${SHELL} -c \"make menuconfig; if [ $? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"", '${PN} Configuration', d)
 
-        # FIXME this check can be removed when the minimum bitbake version has been bumped
-        if hasattr(bb.build, 'write_taint'):
-            try:
-                newmtime = os.path.getmtime(".config")
-            except OSError:
-                newmtime = 0
+    # FIXME this check can be removed when the minimum bitbake version has been bumped
+    if hasattr(bb.build, 'write_taint'):
+        try:
+            newmtime = os.path.getmtime(".config")
+        except OSError:
+            newmtime = 0
 
-            if newmtime > mtime:
-                bb.note("Configuration changed, recompile will be forced")
-                bb.build.write_taint('do_compile', d)
+        if newmtime > mtime:
+            bb.note("Configuration changed, recompile will be forced")
+            bb.build.write_taint('do_compile', d)
 }
 do_menuconfig[depends] += "ncurses-native:do_populate_sysroot"
 do_menuconfig[nostamp] = "1"
-- 
1.7.1



