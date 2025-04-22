Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5DE3C369D8
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 19:01:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.48381.1745348461543482012
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 12:01:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D49F71F02;
	Tue, 22 Apr 2025 12:00:56 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 957333F5A1;
	Tue, 22 Apr 2025 12:01:00 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: mikko.rapeli@linaro.org,
	bill.mills@linaro.org
Subject: [PATCH RFC walnascar 3/3] genericarm64: add ttyPS1 for KV260
Date: Tue, 22 Apr 2025 20:00:53 +0100
Message-ID: <20250422190053.3244331-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422190053.3244331-1-ross.burton@arm.com>
References: <20250422190053.3244331-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 19:01:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215244

The AMD KV260 has a serial console on ttyPS1, so until we can dynamically
detect the console under sysvinit we can add it to SERIAL_CONSOLES so
this platform has a working console when not running systemd.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-yocto-bsp/conf/machine/genericarm64.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto-bsp/conf/machine/genericarm64.conf b/meta-yocto-b=
sp/conf/machine/genericarm64.conf
index f5000402e51..eb79475e9a9 100644
--- a/meta-yocto-bsp/conf/machine/genericarm64.conf
+++ b/meta-yocto-bsp/conf/machine/genericarm64.conf
@@ -28,7 +28,7 @@ WKS_FILE ?=3D "genericarm64.wks.in"
 EFI_PROVIDER ?=3D "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "s=
ystemd-boot", "grub-efi", d)}"
=20
 # Try to bring up a selection of physical or virtual serial consoles
-SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;hvc0 115200;ttyS0 115200;tty=
S1 115200;ttyS2"
+SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;hvc0 115200;ttyS0 115200;tty=
S1 115200;ttyS2 115200;ttyPS1"
=20
 # Allow u-boot to be built for use with qemu-system-aarch64.
 # This u-boot is _not_ suitable for use with real hardware, and the expe=
ctation
--=20
2.43.0


