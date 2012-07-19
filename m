Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrtVI-0000wg-Dt
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:23:05 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 09:11:40 -0700
Received: by weyt11 with SMTP id t11so1708114wey.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=MuzvbFmZ/Gd5/CFBe+Y9B3pEH6qTdQkOHklg3nj/T1c=;
	b=gMaqMFmgMQnpcG2V5PksgvBYaYsuhIl1GtYwMVuAZ45QjkazD2jDoGqw7EbbLgGoAA
	mzlzbJ6JS47FrMfuMPwZH24+PopoQU7DbtLSNWsl17R3iq3xQ0NW2SVnhxR+2cAHlAjT
	UJTwA+BhtRJCKMCqa/Sxt/dG1y80pUZiuLkCBEMjWlTiXOVcWAz8xRE4rzcLSn7JBJKw
	uTTQtGDTg7suHKbnID5SzAsjEKCXRbLMe/TeT7fhDbsYPHNyIU+oS2VdM9EHCed571sI
	D6/gEXZmvyhW5HR/DO6gqe8fY0AUmYul6uq4hWktgNIWcVqkA1lll/cyZG95lVvyUQIy
	zjJQ==
Received: by 10.180.90.207 with SMTP id by15mr17600533wib.22.1342714298395;
	Thu, 19 Jul 2012 09:11:38 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm39193462wib.10.2012.07.19.09.11.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 09:11:37 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 17:10:52 +0100
Message-Id: <9c169397de27be11dc775b6f21a30c4cd234cb6a.1342713965.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQk2Hmksp6ydVc46ZryyYmMf+e7wZNyWbeiU8V30p0I5KvxtsJfazaWbXoerOvIuxSSCwLZ8
Subject: [PATCH 05/26] gobject-introspection: cleanup thanks to new gtk-doc.bbclass
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
X-List-Received-Date: Thu, 19 Jul 2012 16:23:07 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gnome/gobject-introspection_1.32.1.bb |   11 ++++-------
 meta/recipes-gnome/gnome/gobject-introspection_git.bb    |   11 +++--------
 2 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gobject-introspection_1.32.1.bb b/meta/recipes-gnome/gnome/gobject-introspection_1.32.1.bb
index f51e83e..2be10be 100644
--- a/meta/recipes-gnome/gnome/gobject-introspection_1.32.1.bb
+++ b/meta/recipes-gnome/gnome/gobject-introspection_1.32.1.bb
@@ -3,6 +3,8 @@ DEPENDS = "glib-2.0 libffi python-native gobject-introspection-native"
 DEPENDS_virtclass-native = "glib-2.0-native libffi-native python-native bison-native flex-native"
 BBCLASSEXTEND = "native"
 
+PR = "r1"
+
 SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 SRC_URI = "\
   ${GNOME_MIRROR}/${BPN}/${SHRT_VER}/${BP}.tar.xz \
@@ -17,15 +19,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=90d577535a3898e1ae5dbf0ae3509a8c \
                     file://COPYING.GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LGPL;md5=3bf50002aefd002f49e7bb854063f7e7"
 
-inherit autotools
+inherit autotools gtk-doc
 
 do_configure_prepend () {
         echo "EXTRA_DIST = " > ${S}/gtk-doc.make
 }
 
-EXTRA_OECONF = "\
-  --disable-gtk-doc \
-  --disable-gtk-doc-html \
-  --disable-gtk-doc-pdf \
-  --disable-tests \
-"
+EXTRA_OECONF = "--disable-tests"
diff --git a/meta/recipes-gnome/gnome/gobject-introspection_git.bb b/meta/recipes-gnome/gnome/gobject-introspection_git.bb
index 8352384..1e0dd61 100644
--- a/meta/recipes-gnome/gnome/gobject-introspection_git.bb
+++ b/meta/recipes-gnome/gnome/gobject-introspection_git.bb
@@ -13,21 +13,16 @@ LIC_FILES_CHKSUM = "file://COPYING.tools;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SRCREV = "8d64bc23d2b837421ecf9c7b0e4b8d5d95ca0d21"
 PV = "1.29.0+gitr${SRCPV}"
+PR = "r1"
+
 DEFAULT_PREFERENCE = "-1"
 
 S = "${WORKDIR}/git"
 
-inherit autotools
+inherit autotools gtk-doc
 
 BBCLASSEXTEND = "native"
 
-do_configure_prepend () {
-        echo "EXTRA_DIST = " > ${S}/gtk-doc.make
-}
-
 EXTRA_OECONF = "\
-  --disable-gtk-doc \
-  --disable-gtk-doc-html \
-  --disable-gtk-doc-pdf \
   --disable-tests \
 "
-- 
1.7.10



