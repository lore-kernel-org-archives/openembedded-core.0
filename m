Return-Path: <andrew.shadura@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 53997762B7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 10:41:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrewsh) with ESMTPSA id 608083C88748
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Sep 2015 12:41:14 +0200
Message-Id: <1442227275-19855-1-git-send-email-andrew.shadura@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440666021-11411-1-git-send-email-andrew.shadura@collabora.co.uk>
References: <1440666021-11411-1-git-send-email-andrew.shadura@collabora.co.uk>
Subject: [PATCH v3 1/2] dbus: add user sessions support
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
X-List-Received-Date: Mon, 14 Sep 2015 10:41:48 -0000

---
 meta/recipes-core/dbus/dbus_1.10.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus_1.10.0.bb b/meta/recipes-core/dbus/dbus_1.10.0.bb
index 31cbef0..e099f4b 100644
--- a/meta/recipes-core/dbus/dbus_1.10.0.bb
+++ b/meta/recipes-core/dbus/dbus_1.10.0.bb
@@ -68,7 +68,9 @@ FILES_${PN} = "${bindir}/dbus-daemon* \
                ${datadir}/dbus-1/session.conf \
                ${datadir}/dbus-1/system.d \
                ${datadir}/dbus-1/system.conf \
-               ${systemd_unitdir}/system/"
+               ${systemd_system_unitdir} \
+               ${systemd_user_unitdir} \
+"
 FILES_${PN}-lib = "${libdir}/lib*.so.*"
 RRECOMMENDS_${PN}-lib = "${PN}"
 FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool ${bindir}/dbus-test-tool"
@@ -105,6 +107,7 @@ PACKAGECONFIG_class-nativesdk = ""
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir"
 PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
 PACKAGECONFIG[apparmor] = "--enable-apparmor,--disable-apparmor,libapparmor"
+PACKAGECONFIG[user-session] = "--enable-user-session,--disable-user-session"
 
 do_install() {
 	autotools_do_install
-- 
2.1.4


