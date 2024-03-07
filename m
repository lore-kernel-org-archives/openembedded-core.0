Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACFE3C48BF6
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 12:05:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.21482.1709813130188505756
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 04:05:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5D8D1FB
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Mar 2024 04:06:06 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 75F8F3F762
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Mar 2024 04:05:29 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-firmware: remove pointless linux-firmware-gplv2-license package
Date: Thu,  7 Mar 2024 12:05:25 +0000
Message-Id: <20240307120526.774895-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240307120526.774895-1-ross.burton@arm.com>
References: <20240307120526.774895-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 12:05:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196788

From: Ross Burton <ross.burton@arm.com>

The GPLv2 text is the standard text, so the -carl9170 package can just
set LICENSE=3DGPL-2.0-or-later and the custom license handling removed.

Confirmed in the source that the intended license is v2-or-later, not
v2-only as WHENCE says.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../linux-firmware/linux-firmware_20231211.bb      | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.b=
b b/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
index 54e0dc7dc91..b6b98628f3f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
@@ -28,7 +28,6 @@ LICENSE =3D "\
     & Firmware-ene_firmware \
     & Firmware-fw_sst_0f28 \
     & Firmware-go7007 \
-    & Firmware-GPLv2 \
     & Firmware-hfi1_firmware \
     & Firmware-i915 \
     & Firmware-ibt_firmware \
@@ -77,6 +76,7 @@ LICENSE =3D "\
     & Firmware-xc5000 \
     & Firmware-xc5000c \
     & WHENCE \
+    & GPL-2.0-or-later \
 "
=20
 LIC_FILES_CHKSUM =3D "file://LICENCE.Abilis;md5=3Db5ee3f410780e56711ad48=
eadc22b8bc \
@@ -102,7 +102,6 @@ LIC_FILES_CHKSUM =3D "file://LICENCE.Abilis;md5=3Db5e=
e3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.ene_firmware;md5=3Ded67f0f62f8f798130=
c296720b7d3921 \
                     file://LICENCE.fw_sst_0f28;md5=3D6353931c988ad52818a=
e733ac61cd293 \
                     file://LICENCE.go7007;md5=3Dc0bb9f6aaaba55b0529ee9b3=
0aa66beb \
-                    file://GPL-2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 =
\
                     file://LICENSE.hfi1_firmware;md5=3D5e7b6e586ce7339d1=
2689e49931ad444 \
                     file://LICENSE.i915;md5=3D2b0b2e0d20984affd4490ba2cb=
a02570 \
                     file://LICENCE.ibt_firmware;md5=3Dfdbee1ddfe0fb7ab0b=
2fcd6b454a366b \
@@ -182,7 +181,6 @@ NO_GENERIC_LICENSE[Firmware-e100] =3D "LICENCE.e100"
 NO_GENERIC_LICENSE[Firmware-ene_firmware] =3D "LICENCE.ene_firmware"
 NO_GENERIC_LICENSE[Firmware-fw_sst_0f28] =3D "LICENCE.fw_sst_0f28"
 NO_GENERIC_LICENSE[Firmware-go7007] =3D "LICENCE.go7007"
-NO_GENERIC_LICENSE[Firmware-GPLv2] =3D "GPL-2"
 NO_GENERIC_LICENSE[Firmware-hfi1_firmware] =3D "LICENSE.hfi1_firmware"
 NO_GENERIC_LICENSE[Firmware-i915] =3D "LICENSE.i915"
 NO_GENERIC_LICENSE[Firmware-ibt_firmware] =3D "LICENCE.ibt_firmware"
@@ -260,7 +258,7 @@ do_compile() {
=20
 do_install() {
         oe_runmake 'DESTDIR=3D${D}' 'FIRMWAREDIR=3D${nonarch_base_libdir=
}/firmware' ${PACKAGECONFIG_CONFARGS}
-        cp GPL-2 LICEN[CS]E.* WHENCE ${D}${nonarch_base_libdir}/firmware=
/
+        cp LICEN[CS]E.* WHENCE ${D}${nonarch_base_libdir}/firmware/
 }
=20
=20
@@ -323,7 +321,7 @@ PACKAGES =3D+ "${PN}-amphion-vpu-license ${PN}-amphio=
n-vpu \
              ${PN}-cirrus-license ${PN}-cirrus \
              ${PN}-cnm-license ${PN}-cnm \
              ${PN}-atheros-license ${PN}-ar5523 ${PN}-ar9170 ${PN}-ath6k=
 ${PN}-ath9k ${PN}-ath3k \
-             ${PN}-gplv2-license ${PN}-carl9170 \
+             ${PN}-carl9170 \
              ${PN}-ar3k-license ${PN}-ar3k ${PN}-ath10k-license ${PN}-at=
h10k ${PN}-ath11k ${PN}-qca \
              \
              ${PN}-imx-sdma-license ${PN}-imx-sdma-imx6q ${PN}-imx-sdma-=
imx7d \
@@ -461,15 +459,11 @@ RDEPENDS:${PN}-ath6k +=3D "${PN}-atheros-license"
 RDEPENDS:${PN}-ath9k +=3D "${PN}-atheros-license"
=20
 # For carl9170
-LICENSE:${PN}-carl9170 =3D "Firmware-GPLv2"
-LICENSE:${PN}-gplv2-license =3D "Firmware-GPLv2"
=20
-FILES:${PN}-gplv2-license =3D "${nonarch_base_libdir}/firmware/GPL-2"
 FILES:${PN}-carl9170 =3D " \
   ${nonarch_base_libdir}/firmware/carl9170*.fw \
 "
-
-RDEPENDS:${PN}-carl9170 +=3D "${PN}-gplv2-license"
+LICENSE:${PN}-carl9170 =3D "GPL-2.0-or-later"
=20
 # For QualCommAthos
 LICENSE:${PN}-ar3k =3D "Firmware-qualcommAthos_ar3k & Firmware-atheros_f=
irmware"
--=20
2.34.1


