Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SmUJy-00056y-Mf
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 20:29:03 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 Jul 2012 11:18:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="164055204"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 04 Jul 2012 11:18:00 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jul 2012 21:17:38 +0300
Message-Id: <f0db5c6e86f80facc6a732c195949427eee375f8.1341425229.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1341425229.git.laurentiu.palcu@intel.com>
References: <cover.1341425229.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1341425229.git.laurentiu.palcu@intel.com>
References: <cover.1341425229.git.laurentiu.palcu@intel.com>
MIME-Version: 1.0
Subject: [PATCH 7/8] xinput: upgrade to 1.6.0
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
X-List-Received-Date: Wed, 04 Jul 2012 18:29:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
1.7.9.5



