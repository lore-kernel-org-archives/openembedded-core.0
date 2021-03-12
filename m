Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by mx.groups.io with SMTP id smtpd.web10.750.1615582668090532230
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 12:57:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.10, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4DxynQ0HSVz1ryX4;
	Fri, 12 Mar 2021 21:57:46 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4DxynP70Sdz1qr5L;
	Fri, 12 Mar 2021 21:57:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id nBWXqVpPEwGg; Fri, 12 Mar 2021 21:57:44 +0100 (CET)
X-Auth-Info: vCAGynoNogP9JY0tgrPTqvq/n1QDIA7hIp2w2QLg+hU=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 12 Mar 2021 21:57:44 +0100 (CET)
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Steve Sakoman <steve@sakoman.com>
Subject: [PATCH V2] linux-firmware: Package RSI 911x WiFi firmware
Date: Fri, 12 Mar 2021 21:57:36 +0100
Message-Id: <20210312205736.102998-1-marex@denx.de>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The RSI 911x WiFi firmware is already part of the linux-firmware
repository, package it to make it easily available.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Steve Sakoman <steve@sakoman.com>
---
V2: Rebase on current oe-core/master
---
 .../linux-firmware/linux-firmware_20210208.bb         | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.b=
b b/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
index 1881a8e065..f1d049f1d5 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
@@ -229,6 +229,7 @@ PACKAGES =3D+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-sd8887 ${PN}-sd8897 ${PN}-sd8997 ${PN}-usb8997 \
              ${PN}-ti-connectivity-license ${PN}-wlcommon ${PN}-wl12xx $=
{PN}-wl18xx \
              ${PN}-vt6656-license ${PN}-vt6656 \
+             ${PN}-rs9113 ${PN}-rs9116 \
              ${PN}-rtl-license ${PN}-rtl8188 ${PN}-rtl8192cu ${PN}-rtl81=
92ce ${PN}-rtl8192su ${PN}-rtl8723 ${PN}-rtl8821 \
              ${PN}-rtl8168 \
              ${PN}-cypress-license \
@@ -522,6 +523,16 @@ RDEPENDS_${PN}-nvidia-gpu +=3D "${PN}-nvidia-license=
"
 RDEPENDS_${PN}-nvidia-tegra +=3D "${PN}-nvidia-license"
 RDEPENDS_${PN}-nvidia-tegra-k1 +=3D "${PN}-nvidia-license"
=20
+# For RSI RS911x WiFi
+LICENSE_${PN}-rs9113 =3D "WHENCE"
+LICENSE_${PN}-rs9116 =3D "WHENCE"
+
+FILES_${PN}-rs9113 =3D " ${nonarch_base_libdir}/firmware/rsi/rs9113*.rps=
 "
+FILES_${PN}-rs9116 =3D " ${nonarch_base_libdir}/firmware/rsi/rs9116*.rps=
 "
+
+RDEPENDS_${PN}-rs9113 +=3D "${PN}-whence-license"
+RDEPENDS_${PN}-rs9116 +=3D "${PN}-whence-license"
+
 # For rtl
 LICENSE_${PN}-rtl8188 =3D "Firmware-rtlwifi_firmware"
 LICENSE_${PN}-rtl8192cu =3D "Firmware-rtlwifi_firmware"
--=20
2.30.1

