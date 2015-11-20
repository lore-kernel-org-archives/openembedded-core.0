Return-Path: <andrew.shadura@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 0234460620
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 14:28:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrewsh) with ESMTPSA id 4E874601A4D
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
To: OE Core <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Nov 2015 15:27:45 +0100
Message-Id: <e23ae9f86f9ca553a15f157fd3784a6322f7da0d.1448029554.git.andrew.shadura@collabora.co.uk>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <e36072a82de706f1485c054adf8cb2d38a01e899.1448029554.git.andrew.shadura@collabora.co.uk>
References: <e36072a82de706f1485c054adf8cb2d38a01e899.1448029554.git.andrew.shadura@collabora.co.uk>
In-Reply-To: <e36072a82de706f1485c054adf8cb2d38a01e899.1448029554.git.andrew.shadura@collabora.co.uk>
References: <e36072a82de706f1485c054adf8cb2d38a01e899.1448029554.git.andrew.shadura@collabora.co.uk>
Subject: [PATCH v3 3/3] dbus: add apparmor support
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
X-List-Received-Date: Fri, 20 Nov 2015 14:28:03 -0000

Signed-off-by: Andrew Shadura <andrew.shadura@collabora.co.uk>
---
 meta/recipes-core/dbus/dbus_1.10.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/dbus/dbus_1.10.2.bb b/meta/recipes-core/dbus/dbus_1.10.2.bb
index 9e24090..1abe067 100644
--- a/meta/recipes-core/dbus/dbus_1.10.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.10.2.bb
@@ -104,6 +104,7 @@ PACKAGECONFIG_class-nativesdk = ""
 # systemd<->dbus
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir"
 PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
+PACKAGECONFIG[apparmor] = "--enable-apparmor,--disable-apparmor,libapparmor"
 
 do_install() {
 	autotools_do_install
-- 
2.5.0


