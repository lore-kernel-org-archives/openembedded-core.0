Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1QZHGr-00083I-J2
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 08:50:42 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5M6l6ka011537
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 23:47:07 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 21 Jun 2011 23:47:06 -0700
Message-ID: <6724578b184620b36977927b829261482e4ddbfa.1308721296.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1308721296.git.xiaofeng.yan@windriver.com>
References: <cover.1308721296.git.xiaofeng.yan@windriver.com>
Old-Date: Wed, 22 Jun 2011 13:18:59 +0800
Date: Wed, 22 Jun 2011 14:43:05 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.28]
Subject: [PATCH 1/1] task-core-lsb: Add absent libraries and commands to task-core-lsb.bb
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
X-List-Received-Date: Wed, 22 Jun 2011 06:50:42 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Due to "tools-profile" and  "tools-testapps" were removed from variable \
"EXTRA_IMAGE_FEATURES" in meta-yocto/conf/local.conf.sample, some libraries \
needed by LSB Test Suite were absent in an lsb image. I add these absent \
libraries to task-core-lsb.bb.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-extended/tasks/task-core-lsb.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/tasks/task-core-lsb.bb b/meta/recipes-extended/tasks/task-core-lsb.bb
index 9fbacf9..2ec63cc 100644
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
@@ -54,6 +54,7 @@ RDEPENDS_task-core-lsb = "\
 
 RDEPENDS_task-core-sys-extended = "\
     binutils \
+    binutils-symlinks \
     chkconfig \
     curl \
     dhcp-client \
@@ -169,6 +170,9 @@ RDEPENDS_task-core-lsb-graphic-add = "\
     gdk-pixbuf-loader-bmp \
     gdk-pixbuf-loader-ani \
     liberation-fonts \
+    gtk+ \
+    atk \
+    libasound \
 "
 
 RDEPENDS_task-core-lsb-graphic-add_qemux86 = "\
-- 
1.7.0.4



