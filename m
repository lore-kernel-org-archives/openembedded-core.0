Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SXV5S-0004JU-SO for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 12:16:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4OA5uOq022379
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2012 11:05:56 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21875-04 for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2012 11:05:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4OA5lBD022373
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2012 11:05:48 +0100
Message-ID: <1337853946.8248.109.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 24 May 2012 11:05:46 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] fontconfig-native: Be clear about FILE search path
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
X-List-Received-Date: Thu, 24 May 2012 10:16:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This avoids warnings from the new file checksum code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-graphics/fontconfig/fontconfig-native_2.8.0.bb b/meta/recipes-graphics/fontconfig/fontconfig-native_2.8.0.bb
index a2fd409..cee94de 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig-native_2.8.0.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig-native_2.8.0.bb
@@ -5,6 +5,8 @@ DEPENDS = "freetype-native expat-native zlib-native"
 EXTRA_OEMAKE = ""
 EXTRA_OECONF = "${@[' --disable-docs',' --disable-docs --with-freetype-config=%s/freetype-config' % d.getVar('STAGING_BINDIR', True)][os.path.isfile('%s/freetype-config' % d.getVar('STAGING_BINDIR', True))]}"
 
+FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}-${PV}:"
+
 do_install_append () {
 	install -d ${D}${bindir}/
 	install fc-lang/fc-lang ${D}${bindir}/




