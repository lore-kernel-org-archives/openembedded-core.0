Return-Path: <marc.ferland@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 56FC972F9C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 14:48:55 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id y33so25338622qta.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 07:48:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IruT3kef6ybWu3COryINkECnIQ4u/fUaiMSUJlfN0pY=;
	b=UM4mFYUYYcBgvTUlAm9w7TEZpcSzFEwsRhCiJHucIPOxfFq5rMmmCdKdK1yCyqAvYD
	75F2gnT1HpnNbBVUQBVqsDa6s6aJzP7CoH/7sqmnNhWSwmezcqUt8XO4+0NEWV8PEufC
	1svUU0OGim5wuqlclR/Eo2vQKBRPyP+nrCMywayGgwOaRwf+sBvzyVrcAF4u3b3xa8H4
	hzoZyleWK3JmIag822ua+Tt6xQXNk1cMviY6V9lUOPufowM8IZtXHq6UiY4NDRGbIXXX
	8dGHOrKJbf9CTq/UzoCj4a9SV875jXr3STni4uDjKESNCRoY9/x6qNqPE0Q/l3FaW2mk
	+dAg==
X-Gm-Message-State: AN3rC/6IljWA/RH0XPiz5JRYgWNavbUKbZ/Q3JYLFfyxzCeMBT6GUrLt
	Ii5b7rbqY4OioA==
X-Received: by 10.200.49.61 with SMTP id g58mr33935233qtb.151.1493131737342;
	Tue, 25 Apr 2017 07:48:57 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id
	s10sm15188330qke.53.2017.04.25.07.48.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 25 Apr 2017 07:48:56 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Apr 2017 10:48:35 -0400
Message-Id: <1493131720-19456-3-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493131720-19456-1-git-send-email-ferlandm@amotus.ca>
References: <1493131720-19456-1-git-send-email-ferlandm@amotus.ca>
Subject: [PATCHv4 2/7] bluez5: remove libasound-module references
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
X-List-Received-Date: Tue, 25 Apr 2017 14:48:56 -0000

Cleanup references to libasound-module since this code has been
completly removed from Bluez.

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
---
 meta/conf/distro/include/default-providers.inc       | 1 -
 meta/recipes-connectivity/bluez5/bluez5.inc          | 5 +----
 meta/recipes-core/packagegroups/packagegroup-base.bb | 2 +-
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index ece4d8b..e1cb2f9 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -46,7 +46,6 @@ PREFERRED_PROVIDER_nativesdk-opkg ?= "nativesdk-opkg"
 PREFERRED_PROVIDER_console-tools ?= "kbd"
 PREFERRED_PROVIDER_gzip-native ?= "pigz-native"
 PREFERRED_PROVIDER_udev ?= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','eudev',d)}"
-PREFERRED_RPROVIDER_libasound-module-bluez ?= "${@bb.utils.contains('DISTRO_FEATURES','bluetooth bluez5','bluez5','bluez4',d)}"
 PREFERRED_RPROVIDER_bluez-hcidump ?= "${@bb.utils.contains('DISTRO_FEATURES','bluetooth bluez5','bluez5','bluez-hcidump',d)}"
 # Alternative is ltp-ddt in meta-oe: meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
 PREFERRED_PROVIDER_ltp ?= "ltp"
diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 11cf8fb..4244fc8 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -79,14 +79,11 @@ do_install_append() {
         sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${libdir}/bluez/test/*
 }
 
-ALLOW_EMPTY_libasound-module-bluez = "1"
-PACKAGES =+ "libasound-module-bluez ${PN}-testtools ${PN}-obex ${PN}-noinst-tools"
+PACKAGES =+ "${PN}-testtools ${PN}-obex ${PN}-noinst-tools"
 
-FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
 FILES_${PN} += "${libdir}/bluetooth/plugins/*.so ${systemd_unitdir}/ ${datadir}/dbus-1"
 FILES_${PN}-dev += "\
   ${libdir}/bluetooth/plugins/*.la \
-  ${libdir}/alsa-lib/*.la \
 "
 
 FILES_${PN}-obex = "${libexecdir}/bluetooth/obexd \
diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 0069e3e..f9e6e2e 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -204,7 +204,7 @@ RRECOMMENDS_packagegroup-base-pcmcia = "\
 SUMMARY_packagegroup-base-bluetooth = "Bluetooth support"
 RDEPENDS_packagegroup-base-bluetooth = "\
     ${BLUEZ} \
-    ${@bb.utils.contains('COMBINED_FEATURES', 'alsa', 'libasound-module-bluez', '',d)} \
+    ${@bb.utils.contains('COMBINED_FEATURES', 'alsa', bb.utils.contains('BLUEZ', 'bluez4', 'libasound-module-bluez', '', d), '',d)} \
     "
 
 RRECOMMENDS_packagegroup-base-bluetooth = "\
-- 
2.7.4


