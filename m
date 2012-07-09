Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoGMg-00065I-T8
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 17:59:11 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 08:47:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190292879"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.157])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2012 08:47:58 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2012 08:47:21 -0700
Message-Id: <69f2f10441a1e2a3a9f4d31423786d1339eb4945.1341802889.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 07/41] xinput: upgrade to 1.6.0
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
X-List-Received-Date: Mon, 09 Jul 2012 15:59:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Laurentiu Palcu <laurentiu.palcu@intel.com>

Licence file changed, an entire part has been removed.

See diff below:

<<
 TORTIOUS  ACTION, ARISING    OUT OF OR   IN  CONNECTION  WITH THE USE OR
 PERFORMANCE OF THIS SOFTWARE.

-
-Copyright 2007 Peter Hutterer
-
-Permission to use, copy, modify, distribute, and sell this software and its
-documentation for any purpose is hereby granted without fee, provided that
-the above copyright notice appear in all copies and that both that
-copyright notice and this permission notice appear in supporting
-documentation.
-
-The above copyright notice and this permission notice shall be included
-in all copies or substantial portions of the Software.
-
-THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
-OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY CLAIM, DAMAGES OR
-OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
-ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
-OTHER DEALINGS IN THE SOFTWARE.
-
-Except as contained in this notice, the name of the author shall
-not be used in advertising or otherwise to promote the sale, use or
-other dealings in this Software without prior written authorization
-from the author.
-
-
+Copyright © 2007 Peter Hutterer
Copyright © 2009 Red Hat, Inc.

Permission is hereby granted, free of charge, to any person	obtaining a
>>
---
 meta/recipes-graphics/xorg-app/xinput_1.5.3.bb |   14 --------------
 meta/recipes-graphics/xorg-app/xinput_1.6.0.bb |   15 +++++++++++++++
 2 files changed, 15 insertions(+), 14 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-app/xinput_1.5.3.bb
 create mode 100644 meta/recipes-graphics/xorg-app/xinput_1.6.0.bb

diff --git a/meta/recipes-graphics/xorg-app/xinput_1.5.3.bb b/meta/recipes-graphics/xorg-app/xinput_1.5.3.bb
deleted file mode 100644
index 6790f60..0000000
--- a/meta/recipes-graphics/xorg-app/xinput_1.5.3.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require xorg-app-common.inc
-
-SUMMARY = "Runtime configuration and test of XInput devices"
-
-DESCRIPTION = "Xinput is an utility for configuring and testing XInput devices"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=22c34ea36136407a77702a8b784f9bd0"
-
-DEPENDS += " libxi"
-
-PR = "${INC_PR}.7"
-
-SRC_URI[md5sum] = "1e2f0ad4f3fa833b65c568907f171d28"
-SRC_URI[sha256sum] = "6aade131cecddaeefc39ddce1dd5e8473f6039c2e4efbfd9fbb5ee2a75885c76"
diff --git a/meta/recipes-graphics/xorg-app/xinput_1.6.0.bb b/meta/recipes-graphics/xorg-app/xinput_1.6.0.bb
new file mode 100644
index 0000000..974b11e
--- /dev/null
+++ b/meta/recipes-graphics/xorg-app/xinput_1.6.0.bb
@@ -0,0 +1,15 @@
+require xorg-app-common.inc
+
+SUMMARY = "Runtime configuration and test of XInput devices"
+
+DESCRIPTION = "Xinput is an utility for configuring and testing XInput devices"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=881525f89f99cad39c9832bcb72e6fa5"
+
+DEPENDS += " libxi libxrandr libxinerama"
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "d2459d35b4e0b41ded26a1d1159b7ac6"
+SRC_URI[sha256sum] = "4ab007d952c76665603bcb82ceb15fd3929d10faf0580fc4873ac16f5f63847e"
+
-- 
1.7.7.6



