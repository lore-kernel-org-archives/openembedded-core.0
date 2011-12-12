Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1Ra4G5-00016m-Cb
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Dec 2011 12:41:25 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pBCBYT1O018464
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2011 03:34:29 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 12 Dec 2011 03:34:28 -0800
Message-ID: <fbfec531140ee0c6848402faf94ba93b903d02ef.1323688580.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1323688579.git.xiaofeng.yan@windriver.com>
References: <cover.1323688579.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 12 Dec 2011 18:54:01 +0800
Date: Mon, 12 Dec 2011 19:28:49 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] core-image-gtk-directfb.bb: add an image for gtk over directfb
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
X-List-Received-Date: Mon, 12 Dec 2011 11:41:26 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

This file can make an image to run gtk over directfb.

[YOCTO #1674]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../images/core-image-gtk-directfb.bb              |   21 ++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/images/core-image-gtk-directfb.bb

diff --git a/meta/recipes-graphics/images/core-image-gtk-directfb.bb b/meta/recipes-graphics/images/core-image-gtk-directfb.bb
new file mode 100644
index 0000000..b0ae469
--- /dev/null
+++ b/meta/recipes-graphics/images/core-image-gtk-directfb.bb
@@ -0,0 +1,21 @@
+LICENSE = "MIT"
+PR="r0"
+
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+
+DEPENDS += "task-core-gtk-directfb"
+
+RDEPENDS_${PN} += " \
+	task-core-gtk-directfb-base \
+	"
+
+inherit core-image
+
+IMAGE_INSTALL += "\
+	${POKY_BASE_INSTALL} \
+	task-core-basic \
+	module-init-tools \
+	task-core-gtk-directfb-base \
+"
-- 
1.7.0.4



