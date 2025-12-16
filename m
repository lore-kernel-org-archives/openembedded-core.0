Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A843CD5E15A
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 13:36:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22779.1765892169717683155
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 05:36:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 279F21516
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 05:36:02 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EC4173F73B
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 05:36:08 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] ofono: upgrade 2.18 -> 2.19
Date: Tue, 16 Dec 2025 13:35:55 +0000
Message-ID: <20251216133603.1003572-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216133603.1003572-1-ross.burton@arm.com>
References: <20251216133603.1003572-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 13:36:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227948

Upstream changes:

- gobi: Support raw-ip only devices
- Revert "atmodem: let +COPS: report access technology for SIMCom"
- atmodem: report cell technology capability for SIMCom A76XX
- atmodem: also handle EUTRAN networks in creg_notify()
- atmodem: add explicit handling for netreg status in creg_notify()
- sim7100: Update to handle broader A76XX modem series
- sim7100: enable ppp-reset workaround
- plugins: drop droid and use gobi for droid4 modem instead
- gobi: Add "OfflineOperatingMode" property
- gobi: do not assume LTE is supported, detect it
- ofono.conf: enable D-Bus use with PipeWire
- gobi: If WDA unsupported, skip data format logic
- gobi: request PDS service if supported
- gobi: fix start_service_requests() return type

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-connectivity/ofono/{ofono_2.18.bb =3D> ofono_2.19.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.18.bb =3D> ofono_2.19.bb=
} (95%)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.18.bb b/meta/recipes=
-connectivity/ofono/ofono_2.19.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_2.18.bb
rename to meta/recipes-connectivity/ofono/ofono_2.19.bb
index e2666b3e7ec..136c13fbebb 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.18.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.19.bb
@@ -10,7 +10,7 @@ DEPENDS =3D "dbus glib-2.0 udev mobile-broadband-provid=
er-info ell"
 SRC_URI =3D "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://ofono \
            "
-SRC_URI[sha256sum] =3D "f74c3bba7ebac488fed7bcfa6113b0e39e723d2e1a24b53f=
79c9f18a1c85dd00"
+SRC_URI[sha256sum] =3D "d554525ad2db1ccd2fe3ed733e437d76997e7f443c085b87=
e6be1fded020bc8f"
=20
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-da=
ta
=20
--=20
2.43.0


