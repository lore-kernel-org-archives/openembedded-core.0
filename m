Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id 5DD646A9BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 07:15:21 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r5B7FIRI030238; 
	Tue, 11 Jun 2013 02:15:20 -0500
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2013 12:15:31 +0500
Message-Id: <1370934931-20015-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] ofono: Add run time dependency for ofono test scripts
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
X-List-Received-Date: Tue, 11 Jun 2013 07:15:21 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

Some ofono test scripts i.e. enable-modem use python-dbus module
and this must be installed along with ofono-tests package.

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 meta/recipes-connectivity/ofono/ofono.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-connectivity/ofono/ofono.inc
index 48513b2..21e564c 100644
--- a/meta/recipes-connectivity/ofono/ofono.inc
+++ b/meta/recipes-connectivity/ofono/ofono.inc
@@ -23,4 +23,4 @@ RDEPENDS_${PN} += "dbus"
 
 FILES_${PN} += "${base_libdir}/udev ${systemd_unitdir}"
 FILES_${PN}-tests = "${libdir}/ofono"
-RDEPENDS_${PN}-tests = "python python-pygobject"
+RDEPENDS_${PN}-tests = "python python-pygobject python-dbus"
-- 
1.7.9.5


