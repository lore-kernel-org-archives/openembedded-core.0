Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qm5zc-0003U4-VA
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 17:25:52 +0200
Received: by wyg30 with SMTP id 30so1216678wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 08:21:38 -0700 (PDT)
Received: by 10.216.88.132 with SMTP id a4mr165942wef.31.1311780095919;
	Wed, 27 Jul 2011 08:21:35 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id l68sm159843weq.34.2011.07.27.08.21.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jul 2011 08:21:35 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 17:21:31 +0200
Message-Id: <1311780091-10692-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] libpam 1.1.4: fix packaging
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
X-List-Received-Date: Wed, 27 Jul 2011 15:25:53 -0000

| ERROR: QA Issue: non debug package contains .debug directory: libpam-xtests path /work/armv7a-angstrom-linux-gnueabi/libpam-1.1.4-r0/packages-split/libpam-xtests/usr/share/Linux-PAM/xtests/.debug/tst-pam_dispatch4

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-extended/pam/libpam_1.1.4.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam_1.1.4.bb b/meta/recipes-extended/pam/libpam_1.1.4.bb
index 59fbdcd..ae20a97 100644
--- a/meta/recipes-extended/pam/libpam_1.1.4.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.4.bb
@@ -9,7 +9,7 @@ SECTION = "base"
 LICENSE = "GPLv2+ | BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ca0395de9a86191a078b8b79302e3083"
 
-PR = "r0"
+PR = "r1"
 
 DEPENDS = "bison flex cracklib"
 RDEPENDS_${PN}-runtime = "libpam pam-plugin-deny pam-plugin-permit pam-plugin-warn pam-plugin-unix"
@@ -40,7 +40,9 @@ inherit autotools gettext
 PACKAGES += "${PN}-runtime ${PN}-xtests"
 FILES_${PN} = "${base_libdir}/lib*${SOLIBS}"
 FILES_${PN}-dbg += "${base_libdir}/security/.debug \
-                    ${base_libdir}/security/pam_filter/.debug"
+                    ${base_libdir}/security/pam_filter/.debug \
+                    ${datadir}/Linux-PAM/xtests/.debug"
+
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${base_libdir}/*.la ${base_libdir}/lib*${SOLIBSDEV}"
 FILES_${PN}-runtime = "${sysconfdir}"
 FILES_${PN}-xtests = "${datadir}/Linux-PAM/xtests"
-- 
1.6.6.1



