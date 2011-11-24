Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RTPmA-00054J-M1
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 04:15:03 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAO38TOg024788
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 19:08:29 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 23 Nov 2011 19:08:29 -0800
Message-ID: <d0c709c2bd895b9e9d4f925b34261a4201766190.1322102636.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1322102636.git.xiaofeng.yan@windriver.com>
References: <cover.1322102636.git.xiaofeng.yan@windriver.com>
Old-Date: Wed, 23 Nov 2011 13:34:48 +0800
Date: Thu, 24 Nov 2011 11:06:27 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 8/9] task-gtk-directfb.bb: Add task list to run gtk over directfb
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
X-List-Received-Date: Thu, 24 Nov 2011 03:15:03 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Add task-gtk-directfb.bb to OE core for running gtk over directfb.

[YOCTO #1674]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-graphics/tasks/task-gtk-directfb.bb |   26 ++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/tasks/task-gtk-directfb.bb

diff --git a/meta/recipes-graphics/tasks/task-gtk-directfb.bb b/meta/recipes-graphics/tasks/task-gtk-directfb.bb
new file mode 100644
index 0000000..239e0c1
--- /dev/null
+++ b/meta/recipes-graphics/tasks/task-gtk-directfb.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "gkt+ over directfb without x11"
+PR = "r0"
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+inherit task
+
+TOUCH = ' ${@base_contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
+
+PACKAGES += " \
+	${PN}-base \
+"
+
+RDEPENDS_${PN}-base = " \
+		directfb \
+		directfb-examples \
+		pango \
+		pango-modules \
+		fontconfig \
+		gtk+ \
+		gtk-demo \
+		dropbear \
+		${TOUCH} \
+"
-- 
1.7.0.4



