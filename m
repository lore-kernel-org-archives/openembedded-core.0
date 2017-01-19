Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7484A71E39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 22:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JMrUqZ005765; Thu, 19 Jan 2017 22:53:32 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KvUzagTRL1v6; Thu, 19 Jan 2017 22:53:31 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JMrNeQ005662
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 Jan 2017 22:53:24 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cULa7-0004i5-Oj; Thu, 19 Jan 2017 22:53:23 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 22:52:56 +0000
Message-Id: <1484866395-17971-14-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484866395-17971-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1484866395-17971-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 14/33] matchbox-session-sato: Add PACKAGE_WRITE_DEPS for postinst
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
X-List-Received-Date: Thu, 19 Jan 2017 22:53:36 -0000

The postinstall needs gconf-native, mark the dependency and drop
the now unneeded DEPENDS.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
index 42c742f..d146e83 100644
--- a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
+++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
@@ -6,7 +6,6 @@ LICENSE = "GPLv2.0+"
 LIC_FILES_CHKSUM = "file://session;endline=3;md5=f8a5c5b9c279e52dc094d10e11c2be63"
 
 SECTION = "x11"
-DEPENDS = "gconf-native"
 RDEPENDS_${PN} = "formfactor matchbox-theme-sato matchbox-panel-2 matchbox-desktop matchbox-session gconf"
 PR = "r30"
 
@@ -43,6 +42,7 @@ do_install() {
         chmod +x ${D}/${sysconfdir}/matchbox/session
 }
 
+PACKAGE_WRITE_DEPS += "gconf-native"
 pkg_postinst_${PN} () {
 	set_value() {
 		#type, name, value
-- 
2.7.4


