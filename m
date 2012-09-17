Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TDaJc-0003JN-7t
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 14:20:40 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so2288311wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 05:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=inYA1O0r31+xd2X6ZEpxKqDtj1DIjTcXd5IganlG75k=;
	b=mXdkFJIAEW0rob+fOPH0Yz+NYCcFT0tC17RjUfQX7D2U5U6E3B9HPwzMktVK+658Q3
	OKqiLHhL9voWZ8LHiKtjdvkZLOno2h5lCrLq82x9loERM87gUtJ1a2oeLJfH0FzrVxo9
	Ww/oj3nr9i+aHxK8RhHAKXzk6eQ97hTsM8YBaesX5MqToz5ZijU8HNaV/xUTFivlD0kp
	6o2KlCo+Xt925YZ6rgtsb3AdcL1ml0P+fKkf3pvokHedB11ymKC8pfaWqScrCc2kosiY
	eSgbtgMgtZviIapB/jv+6OT9gIZE3mEsED3xvslGZa9Oad2XYqJe4HGrNyyTSZ/BFAON
	Hxpw==
Received: by 10.180.14.8 with SMTP id l8mr15775349wic.6.1347883683934;
	Mon, 17 Sep 2012 05:08:03 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id k20sm17570403wiv.11.2012.09.17.05.08.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 05:08:03 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2012 14:07:32 +0200
Message-Id: <1347883657-17529-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1347883657-17529-1-git-send-email-koen@dominion.thruhere.net>
References: <1347883657-17529-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkocDaev2qKCueE3u/DGe65dFjMF+rLy7tNt3r9EKYVtE93SLC5ce1VoZWj9+DHW/Ll01GQ
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [for-denzil][pulseaudio-updates 05/10] libcanberra: upgrade to 0.29
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
X-List-Received-Date: Mon, 17 Sep 2012 12:20:40 -0000

From: Cristian Iorga <cristian.iorga@intel.com>

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../pulseaudio/libcanberra_0.28.bb                 |   32 --------------------
 .../pulseaudio/libcanberra_0.29.bb                 |   32 ++++++++++++++++++++
 2 files changed, 32 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-multimedia/pulseaudio/libcanberra_0.28.bb
 create mode 100644 meta/recipes-multimedia/pulseaudio/libcanberra_0.29.bb

diff --git a/meta/recipes-multimedia/pulseaudio/libcanberra_0.28.bb b/meta/recipes-multimedia/pulseaudio/libcanberra_0.28.bb
deleted file mode 100644
index e69c89d..0000000
--- a/meta/recipes-multimedia/pulseaudio/libcanberra_0.28.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "Implementation of XDG Sound Theme and Name Specifications"
-DESCRIPTION = "Libcanberra is an implementation of the XDG Sound Theme and Name Specifications, for generating event sounds on free desktops."
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://src/canberra.h;beginline=7;endline=24;md5=c616c687cf8da540a14f917e0d23ab03"
-
-DEPENDS = "gtk+ pulseaudio alsa-lib libtool libvorbis"
-PR = "r1"
-
-inherit gconf autotools
-
-SRC_URI = "http://0pointer.de/lennart/projects/libcanberra/libcanberra-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "c198b4811598c4c161ff505e4531b02c"
-SRC_URI[sha256sum] = "eb1f8b2cabad7f07b6e44d606a91d73e1efca4b46daf92bd553e7222bc68868c"
-
-EXTRA_OECONF = " --disable-oss --disable-ltdl-install" 
-
-do_configure_prepend () {
-	rm -f ${S}/libltdl/configure*
-}
-
-PACKAGES += "${PN}-gnome"
-
-FILES_${PN} += "${libdir}/gtk-2.0/modules/ ${datadir}/gnome"
-FILES_${PN}-gnome += "${datadir}/gdm/autostart/LoginWindow/libcanberra-ready-sound.desktop \
-	              ${libdir}/gnome-settings-daemon-3.0/gtk-modules/canberra-gtk-module.desktop"
-FILES_${PN}-dev += "${libdir}/libcanberra-0.28/libcanberra-*.so \
-		    ${libdir}/libcanberra-0.28/libcanberra-*.la \
-		    ${datadir}/vala/vapi"
-FILES_${PN}-dbg += "${libdir}/gtk-2.0/modules/.debug ${libdir}/libcanberra-0.28/.debug"
-
diff --git a/meta/recipes-multimedia/pulseaudio/libcanberra_0.29.bb b/meta/recipes-multimedia/pulseaudio/libcanberra_0.29.bb
new file mode 100644
index 0000000..b3c0e3d
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/libcanberra_0.29.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Implementation of XDG Sound Theme and Name Specifications"
+DESCRIPTION = "Libcanberra is an implementation of the XDG Sound Theme and Name Specifications, for generating event sounds on free desktops."
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+                    file://src/canberra.h;beginline=7;endline=24;md5=c616c687cf8da540a14f917e0d23ab03"
+
+DEPENDS = "gtk+ pulseaudio alsa-lib libtool libvorbis"
+PR = "r0"
+
+inherit gconf autotools
+
+SRC_URI = "http://0pointer.de/lennart/projects/libcanberra/libcanberra-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "2594093a5d61047bd9cc87e955f86df8"
+SRC_URI[sha256sum] = "127a5ef07805856d63758e5180ebfb241d1f80094fd301c287591a15b8cfcd72"
+
+EXTRA_OECONF = " --disable-oss --disable-ltdl-install" 
+
+do_configure_prepend () {
+	rm -f ${S}/libltdl/configure*
+}
+
+PACKAGES += "${PN}-gnome"
+
+FILES_${PN} += "${libdir}/gtk-2.0/modules/ ${datadir}/gnome"
+FILES_${PN}-gnome += "${datadir}/gdm/autostart/LoginWindow/libcanberra-ready-sound.desktop \
+	              ${libdir}/gnome-settings-daemon-3.0/gtk-modules/canberra-gtk-module.desktop"
+FILES_${PN}-dev += "${libdir}/libcanberra-0.29/libcanberra-*.so \
+		    ${libdir}/libcanberra-0.29/libcanberra-*.la \
+		    ${datadir}/vala/vapi"
+FILES_${PN}-dbg += "${libdir}/gtk-2.0/modules/.debug ${libdir}/libcanberra-0.29/.debug"
+
-- 
1.7.7.6



