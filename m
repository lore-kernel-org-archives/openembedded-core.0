Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id E49D17C12B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 22:27:34 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 870395C0B56;
	Tue, 15 Jan 2019 23:27:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1547591255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=Dc7BOjFsWvU5Ixnw8Z79C5HV12IsfGcZiOSDAzCw9dw=;
	b=D2tx0AfnVNkuJGMEZdObYUA/nxjk6QtkDO8sFIxivOEoSpOPh6B1qMUJx8kKiRi3q2IH8C
	ZYpPnkD/IIeedG9LX4xFsoF4zXCoPBaVqT3ztkqXJOJC/eTKHpGUW+UIVVI1VkbautOGxH
	aNgwjPeqJwle39y3C2SH+EAlv6KSED0=
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 23:27:27 +0100
Message-Id: <20190115222730.54560-3-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20190115222730.54560-1-stefan@agner.ch>
References: <20190115222730.54560-1-stefan@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH 2/5] gconf: rename policykit to polkit
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
X-List-Received-Date: Tue, 15 Jan 2019 22:27:35 -0000

From: Stefan Agner <stefan.agner@toradex.com>

PolicyKit has been renamed to Polkit since quite a while. Rename
the PACKAGECONFIG accordingly.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta/recipes-gnome/gnome/gconf_3.2.6.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
index 120ae3e021..1e8ca2e5d2 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -22,12 +22,12 @@ S = "${WORKDIR}/GConf-${PV}"
 EXTRA_OECONF = "--enable-shared --disable-static \
                 --disable-orbit --with-openldap=no --disable-gtk"
 
-# Disable PolicyKit by default
+# Disable Polkit by default
 PACKAGECONFIG ??= ""
-# We really don't want PolicyKit for native
+# We really don't want Polkit for native
 PACKAGECONFIG_class-native = ""
 
-PACKAGECONFIG[policykit] = "--enable-defaults-service,--disable-defaults-service,polkit"
+PACKAGECONFIG[polkit] = "--enable-defaults-service,--disable-defaults-service,polkit"
 PACKAGECONFIG[debug] = "--enable-debug=yes, --enable-debug=minimum"
 
 do_install_append() {
-- 
2.13.6


