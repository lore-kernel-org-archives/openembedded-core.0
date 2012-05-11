Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SSkGA-0003A8-0K
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 09:27:30 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4B7HYIH019564
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2012 00:17:34 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 11 May 2012 00:17:34 -0700
Message-ID: <e95088b41a40a278dbab25a06f14d9f15d2abcb0.1336719792.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1336719792.git.xiaofeng.yan@windriver.com>
References: <cover.1336719792.git.xiaofeng.yan@windriver.com>
Old-Date: Fri, 11 May 2012 14:18:16 +0800
Date: Fri, 11 May 2012 15:23:12 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] task-core-lsb: Add libgdk-pixbuf-xlib to core-image-lsb
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
X-List-Received-Date: Fri, 11 May 2012 07:27:30 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

LSB Test Suite complains "No library libgdk_pixbuf_xlib-2.0.so.0" \
which are created by gdk-pixbuf_2.24.1.bb.
So add this library to core-image-lsb for passing lsb test.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-extended/tasks/task-core-lsb.bb |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/tasks/task-core-lsb.bb b/meta/recipes-extended/tasks/task-core-lsb.bb
index 2767196..350bc7d 100644
--- a/meta/recipes-extended/tasks/task-core-lsb.bb
+++ b/meta/recipes-extended/tasks/task-core-lsb.bb
@@ -3,7 +3,7 @@
 #
 
 DESCRIPTION = "Create Small Image Tasks"
-PR = "r7"
+PR = "r8"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
@@ -169,15 +169,14 @@ RDEPENDS_task-core-lsb-graphic-add = "\
     gdk-pixbuf-loader-ico \
     gdk-pixbuf-loader-bmp \
     gdk-pixbuf-loader-ani \
-    liberation-fonts \
+	gdk-pixbuf-xlib \
+	liberation-fonts \
     gtk+ \
     atk \
     libasound \
     ${@base_contains("DISTRO_FEATURES", "opengl", "libqtopengl4", "", d)} \
 "
 
-#    mesa-dri 
-
 RDEPENDS_task-core-lsb-runtime-add = "\
     ldd \
     pam-plugin-wheel \
-- 
1.7.0.4



