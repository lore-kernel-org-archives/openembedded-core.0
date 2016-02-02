Return-Path: <andrew.shadura@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 880C4771F5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 17:07:01 +0000 (UTC)
Received: from localhost (unknown [IPv6:2001:470:6f:49f:b1a8:b5ad:1702:2017])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
	bits)) (No client certificate requested)
	(Authenticated sender: andrewsh)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D8BF1265C27;
	Tue,  2 Feb 2016 17:07:01 +0000 (GMT)
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
To: OE Core <openembedded-core@lists.openembedded.org>
Date: Tue,  2 Feb 2016 18:06:57 +0100
Message-Id: <a13cdfe5a7403e93b6c00ca162b84e5ae5d4fb08.1454429175.git.andrew.shadura@collabora.co.uk>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <5507a5b8c53e9a00c4c1da0f91c2d2c0849dc6a4.1454429175.git.andrew.shadura@collabora.co.uk>
References: <5507a5b8c53e9a00c4c1da0f91c2d2c0849dc6a4.1454429175.git.andrew.shadura@collabora.co.uk>
Subject: [PATCH 2/2] dbus: add user sessions support
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
X-List-Received-Date: Tue, 02 Feb 2016 17:07:01 -0000

Enable the user-sessions support with a PACKAGECONFIG flag.

Signed-off-by: Andrew Shadura <andrew.shadura@collabora.co.uk>
Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta/recipes-core/dbus/dbus_1.10.6.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus_1.10.6.bb b/meta/recipes-core/dbus/dbus_1.10.6.bb
index fec68a4..245798a 100644
--- a/meta/recipes-core/dbus/dbus_1.10.6.bb
+++ b/meta/recipes-core/dbus/dbus_1.10.6.bb
@@ -69,7 +69,9 @@ FILES_${PN} = "${bindir}/dbus-daemon* \
                ${datadir}/dbus-1/session.conf \
                ${datadir}/dbus-1/system.d \
                ${datadir}/dbus-1/system.conf \
-               ${systemd_system_unitdir}"
+               ${systemd_system_unitdir} \
+               ${systemd_user_unitdir} \
+"
 FILES_${PN}-lib = "${libdir}/lib*.so.*"
 RRECOMMENDS_${PN}-lib = "${PN}"
 FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-test-tool"
@@ -105,6 +107,7 @@ PACKAGECONFIG_class-nativesdk = ""
 PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_system_unitdir},--disable-systemd --without-systemdsystemunitdir,systemd"
 PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
 PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
+PACKAGECONFIG[user-session] = "--enable-user-session --with-systemduserunitdir=${systemd_user_unitdir},--disable-user-session"
 
 do_install() {
 	autotools_do_install
-- 
2.5.0


