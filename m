Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrtVl-0001rH-1o
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:23:33 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 09:12:07 -0700
Received: by mail-we0-f180.google.com with SMTP id t11so1708114wey.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=RLA7IT6h32HOv75EPiA6gW+BlH85u2+m8AgDCatvrCc=;
	b=fT3CcC/C+isQTxr/5mUMO/7QeC9M7bNRSrZwryi1L9FCxOyQSMf+aFe6FEyjKOvKcr
	94a5U7bHqsXuFBVi8qT72vwzIWqi8SP4YaO9eJO4ikEJxbKPk0knSdo8GtFakBeHoHJb
	/Gi61Ks4HWhVQ4eTVNbXGfaPUkiMWOe0c+Mi0B922edRabBH+dWPaMssuyMA127mOjh6
	pjWgJM/j2mGKsnsyh6qgxsAfl5XE+BiACpcvLdZH/wd2uDmYBE3Ma9ckmtPmwGqQdxTa
	O0kxbFOLfzi7T+Xu7sAlyTYkfMmKh9G6qmefIRZ6SPanyyCIRlXW78QrmZ1/Vgkqo/n9
	+DBQ==
Received: by 10.216.139.196 with SMTP id c46mr1540039wej.220.1342714322281;
	Thu, 19 Jul 2012 09:12:02 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm39193462wib.10.2012.07.19.09.12.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 09:12:01 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 17:11:09 +0100
Message-Id: <7037d046b43ab7162e224bf65a31a6cfda2510b1.1342713965.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlC28hyG6ghwqqK51d/2GVAYR8rkDybsMP10WcUOwJ8o7cjopx37EG+1Q6Twg+75DVpUbJ+
Subject: [PATCH 22/26] evolution-data-server: cleanup thanks to new gtk-doc.bbclass
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
X-List-Received-Date: Thu, 19 Jul 2012 16:23:33 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/eds/evolution-data-server_git.bb |   10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-sato/eds/evolution-data-server_git.bb b/meta/recipes-sato/eds/evolution-data-server_git.bb
index 2ad81e4..c114c0e 100644
--- a/meta/recipes-sato/eds/evolution-data-server_git.bb
+++ b/meta/recipes-sato/eds/evolution-data-server_git.bb
@@ -13,7 +13,7 @@ DEPENDS = "intltool-native glib-2.0 gtk+ gconf dbus db gnome-common virtual/libi
 SRCREV = "3ca578d968d09785933ebbb45b66b3bccdbd5832"
 
 PV = "2.30+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "git://git.gnome.org/evolution-data-server;protocol=git \
            file://oh-contact.patch;striplevel=0 \
@@ -28,7 +28,7 @@ SRC_URI = "git://git.gnome.org/evolution-data-server;protocol=git \
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig
+inherit autotools gtk-doc pkgconfig
 
 # -ldb needs this on some platforms
 LDFLAGS += "-lpthread"
@@ -38,10 +38,6 @@ LDFLAGS += "-lpthread"
 # directories by make resulting in truncated/corrupt .la files
 #PARALLEL_MAKE = ""
 
-do_configure_prepend () {
-        echo "EXTRA_DIST = " > ${S}/gtk-doc.make
-}
-
 do_configure_append () {
         cp ${WORKDIR}/iconv-detect.h ${S}
         sed -i 's/-DG_DISABLE_DEPRECATED//g' ${S}/libedataserver/Makefile
@@ -49,7 +45,7 @@ do_configure_append () {
 
 EXTRA_OECONF = "--without-openldap --with-dbus --without-bug-buddy \
                 --with-soup --with-libdb=${STAGING_DIR_HOST}${prefix} \
-                --disable-smime --disable-ssl --disable-nntp --disable-gtk-doc --without-weather"
+                --disable-smime --disable-ssl --disable-nntp --without-weather"
 
 PACKAGES =+ "libcamel libcamel-dev libebook libebook-dev libecal libecal-dev \
              libedata-book libedata-book-dev libedata-cal libedata-cal-dev \
-- 
1.7.10



