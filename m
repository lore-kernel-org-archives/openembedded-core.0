Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5AED865DEC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 08:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7H8q4Cr018980 for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 09:52:04 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0on-x2FjWlFV
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 09:52:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7H8pwGg018976
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 09:51:59 +0100
Message-ID: <1408265518.24858.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Aug 2014 09:51:58 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] glib-2.0: Add missing nativesdk-gettext DEPENDS
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
X-List-Received-Date: Sun, 17 Aug 2014 08:52:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This override overrides the gettext class additions so we need to
add back the dependency manually.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index f797ab3..bd8d74b 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -18,7 +18,7 @@ BBCLASSEXTEND = "native nativesdk"
 DEPENDS = "glib-2.0-native virtual/libiconv libffi zlib"
 DEPENDS_append_class-target = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', ' dbus', '', d)}"
 DEPENDS_class-native = "pkgconfig-native gettext-native libffi-native zlib-native"
-DEPENDS_class-nativesdk = "nativesdk-libtool nativesdk-libffi nativesdk-zlib ${BPN}-native"
+DEPENDS_class-nativesdk = "nativesdk-libtool nativesdk-gettext nativesdk-libffi nativesdk-zlib ${BPN}-native"
 
 PACKAGES =+ "${PN}-utils ${PN}-bash-completion ${PN}-codegen"
 



