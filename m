Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5C59E731A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 22:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JMrRYN005705; Thu, 19 Jan 2017 22:53:30 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zXQyClqrrpqZ; Thu, 19 Jan 2017 22:53:30 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JMrNln005667
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 Jan 2017 22:53:24 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cULa7-0004iU-Rd; Thu, 19 Jan 2017 22:53:23 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 22:53:01 +0000
Message-Id: <1484866395-17971-19-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484866395-17971-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1484866395-17971-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 19/33] xorg-font-common: Add PACKAGE_WRITE_DEPS for postinst
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
X-List-Received-Date: Thu, 19 Jan 2017 22:53:40 -0000

From: Jussi Kukkonen <jussi.kukkonen@intel.com>

mkfontdir and mkfontscale are used in the postinstall script.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/xorg-font/xorg-font-common.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-font/xorg-font-common.inc b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
index d5267f59..cdbebcf 100644
--- a/meta/recipes-graphics/xorg-font/xorg-font-common.inc
+++ b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
@@ -4,7 +4,7 @@ BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xorg"
 SECTION = "x11/fonts"
 LICENSE = "MIT-X"
 
-DEPENDS = " encodings font-alias font-util-native mkfontdir-native mkfontscale-native"
+DEPENDS = " encodings font-alias font-util-native"
 RDEPENDS_${PN} = "encodings font-util font-alias"
 
 XORG_PN = "${BPN}"
@@ -30,6 +30,7 @@ do_install_append() {
 
 FILES_${PN} += " ${libdir}/X11/fonts ${datadir}"
 
+PACKAGE_WRITE_DEPS += "mkfontdir-native mkfontscale-native"
 pkg_postinst_${PN} () {
         for fontdir in `find $D/usr/lib/X11/fonts -type d`; do
                 mkfontdir $fontdir
-- 
2.7.4


