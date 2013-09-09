Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id AB2686BF68
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 17:47:33 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1; Mon, 9 Sep 2013
	19:47:31 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 59BA1287C78;
	Mon,  9 Sep 2013 19:47:31 +0200 (CEST)
From: <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Sep 2013 19:47:30 +0200
Message-ID: <1378748850-41558-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] dbus-ptest: fix populate_sdk error
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
X-List-Received-Date: Mon, 09 Sep 2013 17:47:34 -0000
Content-Type: text/plain

From: "Maxin B. John" <maxin.john@enea.com>

 When we enable "ptest", populate_sdk fails with the following error:
 # bitbake core-image-minimal -c populate_sdk
 ..
 Collected errors:
  * satisfy_dependencies_for: Cannot satisfy the following dependencies
    for dbus-ptest-dev:
  *    dbus-ptest (= 1.6.10-r0) *
  * opkg_install_cmd: Cannot install package dbus-ptest-dev.

Disable that dependency.

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-core/dbus/dbus-ptest_1.6.10.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/dbus/dbus-ptest_1.6.10.bb b/meta/recipes-core/dbus/dbus-ptest_1.6.10.bb
index a8e82ef..84ed287 100644
--- a/meta/recipes-core/dbus/dbus-ptest_1.6.10.bb
+++ b/meta/recipes-core/dbus/dbus-ptest_1.6.10.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
 DEPENDS = "python-pygobject dbus dbus-glib"
 
 RDEPENDS_${PN} += "make"
+RDEPENDS_${PN}-dev = ""
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch \
-- 
1.7.10.4


