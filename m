Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4EC1761FE4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 14:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7EERrE6016493 for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 15:27:53 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JPPShXS-_dFH
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 15:27:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7EERm7x016489
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 15:27:49 +0100
Message-ID: <1408026469.22187.116.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Aug 2014 15:27:49 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] qemu: Simplify DEPENDS
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
X-List-Received-Date: Thu, 14 Aug 2014 14:27:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

These DEPENDS are now identical and the native/nativesdk variants can
be dropped in favour of letting PACKAGECONFIG sort it out.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index aaec58a..0edf30b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -2,8 +2,6 @@ SUMMARY = "Fast open source processor emulator"
 HOMEPAGE = "http://qemu.org"
 LICENSE = "GPLv2 & LGPLv2.1"
 DEPENDS = "glib-2.0 zlib pixman"
-DEPENDS_class-native = "zlib-native glib-2.0-native pixman-native"
-DEPENDS_class-nativesdk = "nativesdk-zlib nativesdk-glib-2.0 nativesdk-pixman"
 RDEPENDS_${PN}_class-nativesdk = "nativesdk-libsdl"
 RDEPENDS_${PN}_class-target += "bash python"
 



