Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RDz9p-0001Mu-4t for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 15:47:48 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9CDmaZU005949 for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 14:48:36 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JvyIAnm0lXvh
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 14:48:36 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9CDmWYf005946
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 14:48:34 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Oct 2011 14:41:50 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318426918.23801.166.camel@ted>
Mime-Version: 1.0
Subject: [PATCH] clutter: Update git recipe to more recent version
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
X-List-Received-Date: Wed, 12 Oct 2011 13:47:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-graphics/clutter/clutter_git.bb b/meta/recipes-graphics/clutter/clutter_git.bb
index 020453f..897f5ff 100644
--- a/meta/recipes-graphics/clutter/clutter_git.bb
+++ b/meta/recipes-graphics/clutter/clutter_git.bb
@@ -3,9 +3,13 @@ require clutter-package.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-SRCREV = "e957e277b8a4893ce8c99e94402036d42a8b3748"
-PV = "1.0.0+git${SRCPV}"
-PR = "r9"
+DEPENDS += "cogl"
+
+SRCREV = "39db46123ed6bbbc3e6ad359a64d4d344ca9e11b"
+PV = "1.8.0+git${SRCPV}"
+PR = "r0"
+
+DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "git://git.gnome.org/clutter;protocol=git;branch=master \
            file://enable_tests-654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673.patch;rev=654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673 \
@@ -14,6 +18,8 @@ S = "${WORKDIR}/git"
 
 BASE_CONF += "--disable-introspection"
 
+AUTOTOOLS_AUXDIR = "${S}/build"
+
 do_configure_prepend () {
 	# Disable DOLT
 	sed -i -e 's/^DOLT//' ${S}/configure.ac




