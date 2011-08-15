Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1QsuT2-0003G9-77
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 12:32:24 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7FARlC0024443
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 03:27:47 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 15 Aug 2011 03:27:47 -0700
Message-ID: <0f9ca6cc46e84bdd80afce99cca2edafbef24b92.1313391037.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1313391037.git.xiaofeng.yan@windriver.com>
References: <cover.1313391037.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 15 Aug 2011 14:44:26 +0800
Date: Mon, 15 Aug 2011 18:27:51 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libx11-diet: Fix bug 1050
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
X-List-Received-Date: Mon, 15 Aug 2011 10:32:24 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

[YOCTO #1050]
I got do_compile failure during building qemux86 image
| ../../../doltlibtool: line 17:
/distro/dcui/0704/pc1/build/tmp/work/i586-poky-linux/libx11-diet-1.3-r2/libX11-1.3/modules/im/ximcp/../../../libtool:
No such file or directory

This is due to not found libtool, but i586-poky-linux-libtool in libX11-1.3
So I disable dolt for solving this problem.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb
index a4929d2..487e796 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb
@@ -5,13 +5,14 @@ this version."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=597df7e9217e89ccaeb749f48ce2aeb0"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI += "file://x11_disable_makekeys.patch \
             file://include_fix.patch \
             file://X18NCMSstubs.diff \
             file://fix-disable-xlocale.diff \
-            file://fix-utf8-wrong-define.patch"
+            file://fix-utf8-wrong-define.patch \
+            file://nodolt.patch"
 
 DEPENDS += "bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
             libxdmcp xf86bigfontproto kbproto inputproto xproto-native"
-- 
1.7.0.4



