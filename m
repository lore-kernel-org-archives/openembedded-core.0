Received: from mail-wg0-f42.google.com ([74.125.82.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U7UHL-0006Jq-0Q
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 18:13:23 +0100
Received: by mail-wg0-f42.google.com with SMTP id 12so2882681wgh.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2013 08:57:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=gQY53HD89HWnbtua9nmePo9vG28P4r5D1cXa3G8OYlI=;
	b=ZDoipmX3iFO0pFxvoV49BW8IVpivpv+e/dfi0utadWiIQpunPPOamxVscCmbWPbt9g
	HdC0+AXYvEGL2vaKhgFHn791M32pgR6rpbKrKGflBjBn2eaOrwqh1Yo0UBCc9m+Q70uW
	sHfuXpL4xkuQ3dr3HI0M0HrlIDFM5pAZCbbt6CG/lDd2DnJYTAVNIWYBx3tDr97SZGDk
	nhRSqDsM6pDMEr6mitikp9WzSrYrbji16ZO4DG3WioNKKqXPQKff7TwmsR7u+K0Zo4j4
	qU2QmXcg0YqyX3OlJZZRr3UMjQdhc2KkdxnIrdScVC7PnOKx4aCWbJriYzeG1zdCAyUK
	jyQA==
X-Received: by 10.194.156.170 with SMTP id wf10mr20622531wjb.25.1361206627052; 
	Mon, 18 Feb 2013 08:57:07 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id eo1sm20958966wib.8.2013.02.18.08.57.05
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 18 Feb 2013 08:57:06 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2013 16:54:46 +0000
Message-Id: <b9454e45c5992c72afd9b0008ef43be3eb9b86f2.1361206387.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1361206387.git.ross.burton@intel.com>
References: <cover.1361206387.git.ross.burton@intel.com>
In-Reply-To: <cover.1361206387.git.ross.burton@intel.com>
References: <cover.1361206387.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnIxeCA4Oq67I8ObBOu76ltj+jqauNhBjvrQw4ZLgG/+QeLtLAYn8oP9G3thSLDeNG3woWn
Subject: [PATCH 1/3] matchbox-keyboard: general clean up
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
X-List-Received-Date: Mon, 18 Feb 2013 17:13:35 -0000

Re-order variables, use $PN more, and merge the -dbg packages together.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../matchbox-keyboard/matchbox-keyboard_git.bb     |   20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
index a7091d2..6841596 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "Matchbox virtual keyboard for X11"
 HOMEPAGE = "http://matchbox-project.org"
 BUGTRACKER = "http://bugzilla.openedhand.com/"
+SECTION = "x11"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
@@ -8,8 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://applet/applet.c;endline=20;md5=e9201b3efa0a81a160b88d6feb5cf75b"
 
 DEPENDS = "libfakekey expat libxft gtk+ matchbox-panel-2"
-RDEPENDS_${PN} = "formfactor dbus-wait"
-SECTION = "x11"
+
 SRCREV = "b38f24036cff3be6c2fbcf9ca9881803e69003ac"
 PV = "0.0+git${SRCPV}"
 PR = "r4"
@@ -26,20 +26,20 @@ inherit autotools pkgconfig gettext gtk-immodules-cache
 
 EXTRA_OECONF = "--disable-cairo --enable-gtk-im --enable-applet"
 
-PACKAGES += "matchbox-keyboard-im matchbox-keyboard-im-dbg \
-             matchbox-keyboard-applet matchbox-keyboard-applet-dbg"
+PACKAGES += "${PN}-im ${PN}-applet"
 
-FILES_${PN} = "${bindir}/* \
+FILES_${PN} = "${bindir}/ \
 	       ${sysconfdir} \
 	       ${datadir}/applications \
 	       ${datadir}/pixmaps \
 	       ${datadir}/matchbox-keyboard"
 
-FILES_matchbox-keyboard-im = "${libdir}/gtk-2.0/*/immodules/*.so"
-FILES_matchbox-keyboard-im-dbg += "${libdir}/gtk-2.0/*/immodules/.debug"
+FILES_${PN}-dbg += "${libdir}/gtk-2.0/*/immodules/.debug"
+
+FILES_${PN}-im = "${libdir}/gtk-2.0/*/immodules/*.so"
+
+FILES_${PN}-applet = "${libdir}/matchbox-panel/*.so"
 
-FILES_matchbox-keyboard-applet = "${libdir}/matchbox-panel/*.so"
-FILES_matchbox-keyboard-applet-dbg += "${libdir}/matchbox-panel/.debug"
 
 do_install_append () {
 	install -d ${D}/${sysconfdir}/X11/Xsession.d/
@@ -50,3 +50,5 @@ do_install_append () {
 }
 
 GTKIMMODULES_PACKAGES = "${PN}-im"
+
+RDEPENDS_${PN} = "formfactor dbus-wait"
-- 
1.7.10.4



