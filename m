Return-Path: <florian.boor@kernelconcepts.de>
X-Greylist: delayed 2434 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 20 May 2015 12:31:30 UTC
Received: from mail.kernelconcepts.de (mail.kernelconcepts.de [212.60.202.196])
	by mail.openembedded.org (Postfix) with ESMTP id 61B90600B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 12:31:30 +0000 (UTC)
Received: from [192.168.2.34] (helo=yoda.kc.loc)
	by mail.kernelconcepts.de with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.72) (envelope-from <florian.boor@kernelconcepts.de>)
	id 1Yv2Vt-0004PM-8D; Wed, 20 May 2015 13:50:17 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 May 2015 13:49:43 +0200
Message-Id: <1432122583-24497-1-git-send-email-florian.boor@kernelconcepts.de>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] gtk-engines: Allow gtk-engines package to be empty in order to make the -dev package installable.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 May 2015 12:31:30 -0000

---
 meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
index 33b6afe..9c52193 100644
--- a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
+++ b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 SECTION = "x11/base"
 DEPENDS = "intltool-native gtk+"
 
-PR = "r3"
+PR = "r4"
 
 PACKAGES += "${PN}-schemas"
 PACKAGES_DYNAMIC += "^gtk-engine-.* ^gtk-theme-.*"
@@ -29,6 +29,8 @@ FILES_${PN}-schemas = "${datadir}/gtk-engines/*.xml"
 
 CFLAGS_prepend = "-DHAVE_ANIMATION "
 
+ALLOW_EMPTY_${PN} = "1"
+
 inherit gnomebase
 
 python populate_packages_prepend() {
-- 
2.1.4


