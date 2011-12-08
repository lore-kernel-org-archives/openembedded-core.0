Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RYaXx-0001CP-Px
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 10:45:46 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pB89ctdA025018
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2011 01:38:55 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 8 Dec 2011 01:38:55 -0800
Message-ID: <908e2179eb64c21c889f73397047190953225b14.1323327959.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1323327959.git.xiaofeng.yan@windriver.com>
References: <cover.1323327959.git.xiaofeng.yan@windriver.com>
Old-Date: Wed, 7 Dec 2011 14:05:02 +0800
Date: Thu, 8 Dec 2011 17:34:04 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03/10] gtk.inc: ship gtk-demo to independent package
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
X-List-Received-Date: Thu, 08 Dec 2011 09:45:46 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

gtk-demo can test gtk over directfb

[YOCTO #1674]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-gnome/gtk+/gtk+.inc |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index 0e5c45c..1d8f4a6 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -15,7 +15,7 @@ DEPENDS = "glib-2.0 pango atk jpeg libpng libxext libxcursor \
 
 inherit autotools pkgconfig
 
-PACKAGES += "libgail"
+PACKAGES += "libgail gtk-demo"
 
 FILES_${PN} = "${bindir}/gtk-update-icon-cache \
 	${bindir}/gtk-query-immodules-2.0 \
@@ -40,6 +40,11 @@ FILES_${PN}-dbg += " \
 	${libdir}/gtk-2.0/${LIBV}/engines/.debug/* \
 	${libdir}/gtk-2.0/${LIBV}/printbackends/.debug/*"
 
+FILES_gtk-demo = " \
+ ${datadir}/gtk-2.0/demo/* \
+ ${bindir}/gtk-demo \
+ "
+
 FILES_libgail = " \
 	${libdir}/gtk-2.0/modules/libgail.so \
 	${libdir}/gtk-2.0/modules/libferret.so \
-- 
1.7.0.4



