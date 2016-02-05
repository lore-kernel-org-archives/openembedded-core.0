Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 69B81772FD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 10:15:21 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id 128so63908675wmz.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 02:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:to:mime-version;
	bh=gZh9BB2ugfgOBXj/UhXR8LWs7L+6UYxC6K59b34l4dc=;
	b=Q5dUQXJOR633kKOtxCFgMWoYpq4O8lGH6A2j8m9ZsOYoS22xPFB3hyugvNileeVHoZ
	pJ4cfpRSBxodWL5LJNKIr3tXCiQsHtkULa9o/7ozQdeUuHdkIx3yCURSgOLIpiUn3X2p
	SNgCxu/tMxaIEhtzy21fBJYqOU0X8IaUN/wYsyAkUUmZAiy4EjxxSONQJjKEBxTByrga
	ufRLKnfoFXPUonakITi3FMBRthlDCCVFl5RHcSStvqokWZWP3994A6qkwO61hdYIae8i
	wGx+ol604UrLnqwvxgA8xs9wqR2i2NC04zFTTh9+nqNhrCvsp+mB4oEml2bntvOChvjl
	qcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-type:subject:date:message-id:to
	:mime-version;
	bh=gZh9BB2ugfgOBXj/UhXR8LWs7L+6UYxC6K59b34l4dc=;
	b=buIKcq79nOIFtmCqyH+w7M9Tm6NWUly/Mbf/0k/aOSUr+MCoQgheHj9okJMo/lwFEF
	57QNbbFovj5AhxFWn0NJX48qeQYgvOM082r3L1tAByrOU9Xys0dA+bW1fCfMFYbMjONt
	r4LBdTH453jtc2hTCgGVSUDN/ouKbuTsH/focyTqc/SLA21WHNJctVk6aG6VpTPmeM8a
	+IzuMUBGBj5fhOL4bb34Q/EQYb8e1ksuxONhwFyr0YfA9ARmXZJmhc6sINy3BoLnDr3f
	jkOnd6CXXIY8lYlnjugXekar7cRIX8Em1KsCqP3g32RuO4hGRD+OXYkotBE+/0Sayjll
	BP0w==
X-Gm-Message-State: AG10YOQsEnH9RQSLqEzPzrvI1bGi9VhFPVgxcWC4lQrB9T3glRzdK4/SS2APdqwK7pnLIQ==
X-Received: by 10.28.97.136 with SMTP id v130mr2470755wmb.20.1454667322357;
	Fri, 05 Feb 2016 02:15:22 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	t3sm15198495wjz.11.2016.02.05.02.15.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Feb 2016 02:15:21 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Fri, 5 Feb 2016 11:15:19 +0100
Message-Id: <D9580795-089C-4BE0-BB36-0DEE55E9DA95@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Mailer: Apple Mail (2.3112)
Subject: [PATCH] linux-firmware: package firmware for Marvell 88W8688
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
X-List-Received-Date: Fri, 05 Feb 2016 10:15:24 -0000
X-Groupsio-MsgNum: 77595
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E6E30264-3EF0-4F5F-A3AD-7D462F864C93";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_E6E30264-3EF0-4F5F-A3AD-7D462F864C93
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

According to error messages from guruplug

[   35.826441] btmrvl_sdio mmc0:0001:2: Direct firmware load for =
mrvl/sd8688_helper.bin failed with error -2
[   35.903291] Bluetooth: request_firmware(helper) failed, error code =3D =
-2
[   35.909942] Bluetooth: Failed to download helper!
[   36.052820] Bluetooth: Downloading firmware failed!
...
[  764.422739] libertas_sdio: Libertas SDIO driver
[  764.438213] libertas_sdio: Copyright Pierre Ossman
[  764.461186] libertas_sdio mmc0:0001:1: Direct firmware load for =
libertas/sd8688_helper.bin failed with error -2
[  764.488234] libertas_sdio mmc0:0001:1: Direct firmware load for =
sd8688_helper.bin failed with error -2
[  764.507382] libertas_sdio: failed to find firmware (-2)

and =
http://wiki.beyondlogic.org/index.php?title=3DGuruPlug_Libertas_SD8688,
package the firmware files for Marvell 88W8688, too.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb =
b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 0878ab1..682499e 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -164,7 +164,7 @@ do_install() {

 PACKAGES =3D+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-radeon-license ${PN}-radeon \
-             ${PN}-marvell-license ${PN}-sd8686 ${PN}-sd8787 =
${PN}-sd8797 \
+             ${PN}-marvell-license ${PN}-sd8686 ${PN}-sd8688 =
${PN}-sd8787 ${PN}-sd8797 \
              ${PN}-ti-connectivity-license ${PN}-wl12xx ${PN}-wl18xx \
              ${PN}-vt6656-license ${PN}-vt6656 \
              ${PN}-rtl-license ${PN}-rtl8192cu ${PN}-rtl8192ce =
${PN}-rtl8192su \
@@ -232,6 +232,7 @@ RDEPENDS_${PN}-radeon +=3D "${PN}-radeon-license"

 # For marvell
 LICENSE_${PN}-sd8686 =3D "Firmware-Marvell"
+LICENSE_${PN}-sd8688 =3D "Firmware-Marvell"
 LICENSE_${PN}-sd8787 =3D "Firmware-Marvell"
 LICENSE_${PN}-sd8797 =3D "Firmware-Marvell"

@@ -240,6 +241,10 @@ FILES_${PN}-sd8686 =3D " \
   /lib/firmware/libertas/sd8686_v9* \
   /lib/firmware/sd8686* \
 "
+FILES_${PN}-sd8688 =3D " \
+  /lib/firmware/libertas/sd8688* \
+  /lib/firmware/mrvl/sd8688* \
+"
 FILES_${PN}-sd8787 =3D " \
   /lib/firmware/mrvl/sd8787_uapsta.bin \
 "
@@ -248,6 +253,7 @@ FILES_${PN}-sd8797 =3D " \
 "

 RDEPENDS_${PN}-sd8686 +=3D "${PN}-marvell-license"
+RDEPENDS_${PN}-sd8688 +=3D "${PN}-marvell-license"
 RDEPENDS_${PN}-sd8787 +=3D "${PN}-marvell-license"
 RDEPENDS_${PN}-sd8797 +=3D "${PN}-marvell-license"

--
1.9.1

--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_E6E30264-3EF0-4F5F-A3AD-7D462F864C93
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWtHY4AAoJEESZlq7c5Qqd1uEP/iSq9BTK4Fq2Ez9Y8YLHTfh1
N7+peIvZUTtiMGQeFigcU2XauhKnU6PzsYvRjB9SN4wFxd+lQX1xMzBu8FGIq6nZ
/iOxlbbRB3PLgfebKTwiscmIFZR3SEW3c2Vsn68gp5pfmMFmp2RiQxDASmRYim+L
MCf+FUk9ElmucV9YM6AT/a5xAdIKzz/bkze2BRGdD2jSXGUkFTCEDuu5IaSl5ham
XJ63kYDUHo8ludcz5vcdpqwmzPDodQu8rfS0zfl3q1nilpj+1efy47ifx2CA7x7p
ZD5RiVJlgeByeRSVQUj+gSIvbu0rmNH0i/sCZ/Ue3JbD1fUCb1ugJVEiyNQiQZqC
CNTYbc229qy/V9j0Q9DIgZlxeqeQ3Bu6bkR/y7tYBe74tOLG4APkHeQJOcxIsGGW
NCbu82MFedooLWpa4w4L9D3Ky+MOyvvJH9lWt+k5wE7bsACbgceIMDOgovJhH0NG
NFZj4OzWaB3QRAxwvHXnhRrIVhqD8eE2fgirzElnn5ASsl957A5S8942r0DxF0vb
41eR6YJf5KQqoYopisV5+qgNJ0ZV5O6RrlRa8weulTlJ6VEvJ1b6rFEX0RWMPY65
KJtV8XVaxskr24ao/KGBp1U3OX3E+asj19ahK45vZb8k5LZ28jYxlexWoYI4muCf
D+g4009gjCxjySxOAyOc
=F/iV
-----END PGP SIGNATURE-----

--Apple-Mail=_E6E30264-3EF0-4F5F-A3AD-7D462F864C93--
