Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1QUzk4-0002Yt-Vs
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 13:19:09 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5A8AtIp022855
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2011 01:10:55 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 10 Jun 2011 01:10:55 -0700
Message-ID: <f654a8321554458d47d1cab6ae1201c1f60467e3.1307691902.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1307691902.git.xiaofeng.yan@windriver.com>
References: <cover.1307691902.git.xiaofeng.yan@windriver.com>
Old-Date: Fri, 10 Jun 2011 15:18:55 +0800
Date: Fri, 10 Jun 2011 16:07:51 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.28]
Subject: [PATCH 1/1] task-core-lsb: Install libQtOpenGL* to lsb
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
X-List-Received-Date: Fri, 10 Jun 2011 11:19:09 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Fix bug [#YOCTO 1020]
It is part of fixing bug [YOCTO #1020]. If another patch to add configuration for compiling qtopengl to poky-lsb.conf is merged to poky, \
then this bug will be fixed. LSB Test Suite need library "libQtOpenGL*" in an lsb image. If an image has "mesa-xlib" or "mesa-dri",\
then opegl will run on target platform.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-extended/tasks/task-core-lsb.bb |   15 ++-------------
 1 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-extended/tasks/task-core-lsb.bb b/meta/recipes-extended/tasks/task-core-lsb.bb
index 9fbacf9..0ee4627 100644
--- a/meta/recipes-extended/tasks/task-core-lsb.bb
+++ b/meta/recipes-extended/tasks/task-core-lsb.bb
@@ -3,7 +3,7 @@
 #
 
 DESCRIPTION = "Create Small Image Tasks"
-PR = "r4"
+PR = "r5"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
@@ -156,6 +156,7 @@ RDEPENDS_task-core-lsb-graphic-add = "\
     libqtsvg4 \
     libqtxml4 \
     libqtnetwork4 \
+    libqtopengl4 \
     libxt \
     libxxf86vm \
     libdrm \
@@ -171,18 +172,6 @@ RDEPENDS_task-core-lsb-graphic-add = "\
     liberation-fonts \
 "
 
-RDEPENDS_task-core-lsb-graphic-add_qemux86 = "\
-    libqtopengl4 \
-"
-RDEPENDS_task-core-lsb-graphic-add_atom-pc = "\
-    libqtopengl4 \
-"
-RDEPENDS_task-core-lsb-graphic-add_qemuppc = "\
-    libqtopengl4 \
-"
-RDEPENDS_task-core-lsb-graphic-add_emenlow = "\
-    libqtopengl4 \
-"
 
 RDEPENDS_task-core-lsb-graphic-add_mpc8315e-rdb = "\
     libqtopengl4 \
-- 
1.7.0.4



