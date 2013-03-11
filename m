Received: from mail-ob0-f176.google.com ([209.85.214.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1UFARZ-0000To-W5
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 22:39:48 +0100
Received: by mail-ob0-f176.google.com with SMTP id v19so3809955obq.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 14:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=bwo5hCaTSyyZIVNFTTX8kKqnEAWdOCvTLDUzj1llBpo=;
	b=UgYYPQ6bgT4m2eLIGeafETtsMVcpgAI1E0YCiVf6xSpg0v8e+Bwwhpq1mcCYpigBVT
	8mdUtHFgyeAD1LcKAxAisS2PZcTJovd9LuoBkWaIZEMy4vdgIjhO+C47zjU7lzQnj+Os
	iSSMF7JGhWkRq6bhVM9w2CFeebqM0Wm95c5tvLJW7WnUvlqORi5/hIOavBGwA6DDawtX
	NXkuUBShM89FFBmKGtbUl/IVi+pnXxPedXDK3rOflAq+qHsLp2szYoez5bIdCMUYGY3v
	5LI6FT0s9uw4wvxGs5bpHIxNPctEOI5TPXv1/c43v4MWUvGUOxV/5+ol3fQzcK1nyoxp
	+PDA==
X-Received: by 10.60.3.10 with SMTP id 10mr10600987oey.61.1363036983137;
	Mon, 11 Mar 2013 14:23:03 -0700 (PDT)
Received: from mlabs-ftonello.masimolabs.com
	(wsip-70-183-20-162.oc.oc.cox.net. [70.183.20.162])
	by mx.google.com with ESMTPS id i19sm18709868obf.0.2013.03.11.14.23.01
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 14:23:02 -0700 (PDT)
From: eu@felipetonello.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 14:23:04 -0700
Message-Id: <1363036984-29155-3-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1363036984-29155-1-git-send-email-eu@felipetonello.com>
References: <1363036984-29155-1-git-send-email-eu@felipetonello.com>
X-Gm-Message-State: ALoCoQnMQyjOcDxmztI5OYtze+Hb76urcj00AQiD5hxw3g4jqydkCYH07LAZbWVT7PJhm8OhagUw
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: [PATCH 2/2] qt-mobility: added list of modules to be compiled
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
X-List-Received-Date: Mon, 11 Mar 2013 21:39:52 -0000

From: "Felipe F. Tonello" <ftonello@cercacor.com>

This is useful for users that want to .bbappend this recipe to select specific
modules to be compiled.

Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
---
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
index e5e671e..b16feb7 100644
--- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
+++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
@@ -18,7 +18,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/add-ons/qt-mobility-opensource-src-${PV}.t
 SRC_URI[md5sum]="ea5db5a8d3dd4709c2926dceda646bd8"
 SRC_URI[sha256sum]="ee3c88975e04139ac9589f76d4be646d44fcbc4c8c1cf2db621abc154cf0ba44"
 
-PR = "r7"
+PR = "r8"
 
 S = "${WORKDIR}/qt-mobility-opensource-src-${PV}"
 
@@ -31,6 +31,8 @@ qtm_plugins	:= "/usr/lib/${qtm_dir}/plugins/QtMobility"
 qtm_data	:= "/usr/share/${qtm_dir}"
 qtm_imports	:= "/usr/lib/${qtm_dir}/imports"
 
+qtm_modules_list ?= "bearer contacts gallery location publishsubscribe messaging multimedia \
+systeminfo serviceframework sensors versit organizer feedback connectivity"
 qtm_bluezflag ?= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'yes', 'no', d)}"
 
 do_configure_prepend() {
@@ -44,7 +46,7 @@ do_configure_prepend() {
 	cp staticconfig.pri staticconfig.pri.old
 	echo "include(${STAGING_DATADIR}/${qtm_dir}/mkspecs/qconfig.pri)" >staticconfig.pri
 	cat staticconfig.pri.old >>staticconfig.pri
-	./configure -qmake-exec qmake2 -prefix /usr -examples -demos
+	./configure -qmake-exec qmake2 -prefix /usr -examples -demos -modules ${qtm_modules_list}
 	echo QT_MOBILITY_BIN = ${qtm_bin} >>./config.pri
 	echo QT_MOBILITY_LIB = ${qtm_lib} >>./config.pri
 	echo QT_MOBILITY_INCLUDE = ${qtm_include} >>./config.pri
-- 
1.7.9.5



