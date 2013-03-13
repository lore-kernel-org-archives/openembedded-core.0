Received: from mail-ob0-f170.google.com ([209.85.214.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1UFp7r-0001Mg-W7
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 18:06:05 +0100
Received: by mail-ob0-f170.google.com with SMTP id wc20so1261526obb.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2013 09:49:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=sdUl4Fkppf+kXG8aIVEvL74Lhh8gmq/mhV05DLuaebQ=;
	b=fjDk5nKjhw0INJl0MAEKJ9UCJP9RqH05AzCGAr1Tjy9/P+7uM+kGbaFnQUD1dk/qM8
	HUk7h2pURuKKVoA7rXiBI8hQ1iG3hDT4YXIgD2EIoBAdr0VeQzjmap1Mbivljrtv7tSv
	/OSNIx05Up4nlHa9ewpEBMlzrxplacMHTiq+ldT80ZiSkVNNqQ4Fp5b3yuVap+iJjy0h
	DZ7NmAXybOuoMBNjK0o0f/MnjaIzTuzP3zmBfWeJD0UHlVpwQycCynlk1g0MHNIo+a7u
	ECqgF2yfrhvYGjpfOx2cW8uNYfMZYiLNc+A5c67uozDQmbxKDQ78UQLgqaCPA20gVsyz
	q6LQ==
X-Received: by 10.60.170.20 with SMTP id ai20mr16724194oec.33.1363193362515;
	Wed, 13 Mar 2013 09:49:22 -0700 (PDT)
Received: from mlabs-ftonello.masimolabs.com
	(wsip-70-183-20-162.oc.oc.cox.net. [70.183.20.162])
	by mx.google.com with ESMTPS id ka6sm26233523obb.3.2013.03.13.09.49.21
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 09:49:21 -0700 (PDT)
From: eu@felipetonello.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Mar 2013 09:49:14 -0700
Message-Id: <1363193354-6895-4-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1363193354-6895-1-git-send-email-eu@felipetonello.com>
References: <1363193354-6895-1-git-send-email-eu@felipetonello.com>
X-Gm-Message-State: ALoCoQmBreObZeSILTSIAzzEbmpux/muLCrlScJIDuCv+7nuYniEMz9B9Go9EzRbmrCyY4t0al2p
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: [PATCH v2 3/3] qt-mobility: added list of modules to be compiled
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
X-List-Received-Date: Wed, 13 Mar 2013 17:06:16 -0000

From: "Felipe F. Tonello" <ftonello@cercacor.com>

This is useful for users that want to .bbappend this recipe to select specific
modules to be compiled.

Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
---
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
index fca4cb0..849235c 100644
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



