Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrtVD-0000pw-JS
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:22:59 +0200
Received: from mail-wg0-f42.google.com ([74.125.82.42])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 09:11:38 -0700
Received: by wgbfm10 with SMTP id fm10so5237070wgb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=fZrV2c0z8joIVfdLsTP38z3Skzk+JanfmOjcOpU9sUQ=;
	b=O7jGNaF1ZSCwl8ZNHVvffUGdhzyb8LWKRhVflbqDT9m9a1mzWdThDrlxSRGJYIMQ2W
	eMQzYYpAisR1hQlD+xqnUrc4wzuSTBS9IuHW9xnEjXfRfN3TUJ1jFw2lwoI/GNvKKbn2
	ArUTOoG+Jy0en4nT8xx3iQiGET3AJ8g7ZmGvx5pQ86unrezzIYSgPzxMOsEDH6FhneB4
	ndeVryd/SpFewQXYc00xX2zZtNZ5CaId9BKH0cn0QZayojN92UuTEqcdPfXfuV1a/vhd
	iQSX7Rpz4z8iAf3UkXb3L6fK7+6dq4jsfH9GXPkNhD5qq8o7kFms2vgRjrAyO6L3Oiu1
	Iv3A==
Received: by 10.180.103.136 with SMTP id fw8mr6068770wib.20.1342714296964;
	Thu, 19 Jul 2012 09:11:36 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm39193462wib.10.2012.07.19.09.11.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 09:11:36 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 17:10:51 +0100
Message-Id: <96ac72c6b65675842abe6ad842a642126c3bf90b.1342713965.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQktWUj7txXrJrahnDjIK5I8H2E2MprXjp3C6vIFlyIl6AdEQmI9IYDCRkrSUkETKyhunPq/
Subject: [PATCH 04/26] gconf: cleanup thanks to new gtk-doc.bbclass
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
X-List-Received-Date: Thu, 19 Jul 2012 16:22:59 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gnome/gconf_3.2.3.bb |    8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gconf_3.2.3.bb b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
index 1da7203..d84f981 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.3.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
@@ -9,9 +9,9 @@ POLKIT_libc-uclibc = ""
 DEPENDS = "glib-2.0 dbus dbus-glib libxml2 intltool-native ${POLKIT}"
 DEPENDS_virtclass-native = "glib-2.0-native dbus-native dbus-glib-native libxml2-native intltool-native gnome-common-native"
 
-PR = "r9"
+PR = "r10"
 
-inherit gnomebase
+inherit gnomebase gtk-doc
 
 SRC_URI = "${GNOME_MIRROR}/GConf/${@gnome_verdir("${PV}")}/GConf-${PV}.tar.bz2;name=archive \
 	   file://nointro.patch \
@@ -29,10 +29,6 @@ POLKIT_OECONF_libc-uclibc = "--disable-default-service"
 EXTRA_OECONF = "--disable-gtk-doc --enable-shared --disable-static --enable-debug=yes \
                 --disable-introspection --disable-orbit --with-openldap=no ${POLKIT_OECONF} --disable-gtk"
 
-do_configure_prepend () {
-	touch gtk-doc.make
-}
-
 do_install_append() {
 	# this directory need to be created to avoid an Error 256 at gdm launch
 	install -d ${D}${sysconfdir}/gconf/gconf.xml.system
-- 
1.7.10



