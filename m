Return-Path: <florian.boor@kernelconcepts.de>
Received: from mail.kernelconcepts.de (mail.kernelconcepts.de [212.60.202.196])
	by mail.openembedded.org (Postfix) with ESMTP id 80879607BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 13:49:42 +0000 (UTC)
Received: from [192.168.2.34] (helo=yoda.kc.loc)
	by mail.kernelconcepts.de with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.72) (envelope-from <florian.boor@kernelconcepts.de>)
	id 1Yv4Mp-0004mS-SG; Wed, 20 May 2015 15:49:04 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 May 2015 15:48:34 +0200
Message-Id: <1432129714-5703-1-git-send-email-florian.boor@kernelconcepts.de>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2] gtk-engines: Make gtk-engines-dev installable by dropping dependency to not generated gtk-engines package.
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
X-List-Received-Date: Wed, 20 May 2015 13:49:42 -0000

---
 meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
index 33b6afe..036aa27 100644
--- a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
+++ b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
@@ -29,6 +29,8 @@ FILES_${PN}-schemas = "${datadir}/gtk-engines/*.xml"
 
 CFLAGS_prepend = "-DHAVE_ANIMATION "
 
+RDEPENDS_${PN}-dev = ""
+
 inherit gnomebase
 
 python populate_packages_prepend() {
-- 
2.1.4


