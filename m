Received: from mail-we0-f172.google.com ([74.125.82.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UXUSN-0002c9-M7
	for openembedded-core@lists.openembedded.org;
	Wed, 01 May 2013 12:40:23 +0200
Received: by mail-we0-f172.google.com with SMTP id r6so1152655wey.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 May 2013 03:22:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=Tm+akN3pPwhyTTu9jrNmS3GnYRiGF/+3598Vm7v5lDo=;
	b=RRWWmMhx1E36F7xCeDjjeT77GwNlks7CF16FA41zEjHajfZLc9VIPp1iHDFeLyK194
	GHOz2WxhGZESYQBjFHO/HzNMs3twkw+e5yYBVFSFN9hz8VrgoBRHqBswrJUmglOaODsL
	Ojx5JbhU7Dyv+bFNOPjTjvFmwBwbJqzjRSwYcigJR++bmANCyI+AAe2AHtEb02kkOj/P
	Ny5FUZka1IyLZf32Ox3Gwf0+dPzFHpt68msNyOkeARWwR3653FT2f0okfQE/P9WffQ1I
	wXadL98sDCL/Axh4SOt2t/NZTj5AvWzH6pK4jWbpnZvLAjyUWO4vDO852dnN8EQF/kBj
	SRiA==
X-Received: by 10.180.87.170 with SMTP id az10mr2209410wib.3.1367403744021;
	Wed, 01 May 2013 03:22:24 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fz3sm3018245wib.0.2013.05.01.03.22.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 01 May 2013 03:22:23 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 May 2013 11:19:21 +0100
Message-Id: <991a012cea7ad68f84ed4de1aa9612de816695cd.1367403369.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <06a1154d758be0744da68717b31077cc02ec657e.1367403369.git.ross.burton@intel.com>
References: <06a1154d758be0744da68717b31077cc02ec657e.1367403369.git.ross.burton@intel.com>
In-Reply-To: <cover.1367403369.git.ross.burton@intel.com>
References: <cover.1367403369.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkhVe9eBoo1h6+GSFl5J8U4T8K7/XrhSJBL/aeQRnJTwoF1XVXeOmBHUaE6yyNPE0NKsaTC
Subject: [PATCH 2/3] gnome-keyring: remove, nothing uses it in oe-core
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
X-List-Received-Date: Wed, 01 May 2013 10:40:25 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/seperatebuilddir.inc      |    1 -
 .../gnome/gnome-keyring/org.gnome.keyring.service  |    3 --
 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb   |   44 --------------------
 3 files changed, 48 deletions(-)
 delete mode 100644 meta/recipes-gnome/gnome/gnome-keyring/org.gnome.keyring.service
 delete mode 100644 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb

diff --git a/meta/conf/distro/include/seperatebuilddir.inc b/meta/conf/distro/include/seperatebuilddir.inc
index 20376bb..f70ae68 100644
--- a/meta/conf/distro/include/seperatebuilddir.inc
+++ b/meta/conf/distro/include/seperatebuilddir.inc
@@ -188,7 +188,6 @@ B_pn-gnome-desktop = "${SEPB}"
 #B_pn-gnome-doc-utils = "${SEPB}"
 #B_pn-gnome-doc-utils-native = "${SEPB}"
 B_pn-gnome-icon-theme = "${SEPB}"
-B_pn-gnome-keyring = "${SEPB}"
 B_pn-gnome-mime-data = "${SEPB}"
 B_pn-gnupg = "${SEPB}"
 ## libtool: link: warning: library `.../usr/lib/libgcrypt.la' was moved.
diff --git a/meta/recipes-gnome/gnome/gnome-keyring/org.gnome.keyring.service b/meta/recipes-gnome/gnome/gnome-keyring/org.gnome.keyring.service
deleted file mode 100644
index 96ea061..0000000
--- a/meta/recipes-gnome/gnome/gnome-keyring/org.gnome.keyring.service
+++ /dev/null
@@ -1,3 +0,0 @@
-[D-BUS Service]
-Name=org.gnome.keyring
-Exec=/usr/bin/gnome-keyring-daemon
diff --git a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb b/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
deleted file mode 100644
index a1cd8f9..0000000
--- a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-DESCRIPTION = "Password and keyring managing daemon"
-HOMEPAGE = "http://www.gnome.org/"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-
-LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://gcr/gcr.h;endline=22;md5=a272df1e633e27ecf35e74fb5576250e \
-                    file://egg/egg-dbus.h;endline=25;md5=eb6f531af37165dc53420c073d774e61 \
-                    file://gp11/gp11.h;endline=24;md5=bd8c7a8a21d6c28d40536d96a35e3469 \
-                    file://pkcs11/pkcs11i.h;endline=24;md5=e72cfbb718389b76a4dae838d1c1f439"
-
-SECTION = "x11/gnome"
-
-PR = "r11"
-
-inherit autotools gnome gtk-doc pkgconfig gsettings
-
-DEPENDS = "gtk+ libgcrypt libtasn1 libtasn1-native gconf ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-RDEPENDS_${PN} = "libgnome-keyring glib-2.0-utils"
-
-EXTRA_OECONF = "${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam --with-pam-dir=${base_libdir}/security', '--disable-pam', d)}"
-
-SRC_URI += "file://org.gnome.keyring.service"
-
-SRC_URI[archive.md5sum] = "9a8aa74e03361676f29d6e73155786fc"
-SRC_URI[archive.sha256sum] = "31fecec1430a97f59a6159a5a2ea8d6a1b44287f1e9e595b3594df46bf7f18f9"
-
-do_install_append () {
-	install -d ${D}${datadir}/dbus-1/services
-	install -m 0644 ${WORKDIR}/org.gnome.keyring.service ${D}${datadir}/dbus-1/services
-}
-
-FILES_${PN} += "${datadir}/dbus-1/services ${datadir}/gcr"
-                
-
-FILES_${PN}-dev += "${libdir}/${BPN}/devel/*.la \
-                    ${libdir}/${BPN}/devel/*${SOLIBSDEV} \
-                    ${libdir}/${BPN}/standalone/*.la \
-                    ${base_libdir}/security/*.la \
-                    ${base_libdir}/security/*${SOLIBSDEV}"
-
-FILES_${PN}-dbg += "${libdir}/${BPN}/standalone/.debug/ \
-                    ${libdir}/${BPN}/devel/.debug/ \
-                    ${base_libdir}/security/.debug/"
-- 
1.7.10.4



