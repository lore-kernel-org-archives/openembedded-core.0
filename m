Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 12BC677494
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 11:36:56 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id n186so13112456wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 03:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:date:message-id:to:mime-version;
	bh=oiAjMiY6cN6fnmOF/2e41XN9rOKq8gEZ/Fm+dypksKo=;
	b=jlKcyaDokwG4hVwYdkWIUnQzjSvqSxWMZSl78x5VYkJ5sV+/3SiCqB+MLplldXhZr+
	ENkLzw66eoZmaLeXlMQeSJdBO2SfZHsN8IH0hYnjK3RkpKf0DvWcoGZEB2/Udeq/wAaO
	v13FH0CK3QBvpF7PkJnNN5s4v8R8cgJ7U+fubXlNFdfv+JPzPWgah8eb8XHVmrgx99ym
	KOQsm74pjpwP68AvLni+P8rAEZlTGNcHTnJ+1E6AI3BpzLSfHNqazrm6i89TOaW2D4Fn
	nCTsdmIR0DxXkx2vF1Kg8IktUAJeMZHdVZRYn1jXVLHjN1pKYnfvUIZRKI9QLfMmKvwa
	g4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:subject:date:message-id:to:mime-version;
	bh=oiAjMiY6cN6fnmOF/2e41XN9rOKq8gEZ/Fm+dypksKo=;
	b=fQbsv/MXn/sXpOLBBOqGeaVZG5yI+Hy+uL/NFp44afsQpvU3fnROcR2AXgYHVoopcB
	n+WXrB1yphwmL3P+R9meQiJq6MlImbKHKlqnn9Qsl8EBG0fMLhUcNGrtR3Omzl2qvCqR
	IIM4p3eh18T+NVXJiCZ20or+tutCqHLl79jrUPXyJxs+y9NuuO3ecz+fxEi3jWt4sZMn
	yzxY7xuJT1hR85I7NlKBEZvdDTfBy/eUw59QvYbVbVm1NYdVbxUJQUwaZdvp97H/qUWX
	5SPAAzndr+ikZE0AdWggyYj+xHGcqjZZJMpsc/wDDiXQ0QsNG7VLLNZNOl1vAliDgwLS
	B1yA==
X-Gm-Message-State: AD7BkJLSqJUKd5HdYHQFwdMM0rKE+Ms5NEvoyX+8HTBrW1UYSE6k0MWRVR2jZiHDeNZE4g==
X-Received: by 10.28.137.148 with SMTP id l142mr6382707wmd.40.1456659417128;
	Sun, 28 Feb 2016 03:36:57 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	d9sm20711234wjf.43.2016.02.28.03.36.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 28 Feb 2016 03:36:56 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Sun, 28 Feb 2016 12:36:55 +0100
Message-Id: <6889FAEA-5F14-4125-BBD3-81053CE80E59@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Mailer: Apple Mail (2.3112)
Subject: [PATCH RESEND 3/7] linux-firmware: package firmware for Marvell 88W8688
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
X-List-Received-Date: Sun, 28 Feb 2016 11:36:57 -0000
X-Groupsio-MsgNum: 78847
Content-Type: multipart/signed;
	boundary="Apple-Mail=_AD9C013A-A2E0-45FC-8A56-589EA30E0658";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_AD9C013A-A2E0-45FC-8A56-589EA30E0658
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
index 9792686..f4a3230 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -173,7 +173,7 @@ do_install() {

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
@@ -254,6 +254,7 @@ RDEPENDS_${PN}-radeon +=3D "${PN}-radeon-license"

 # For marvell
 LICENSE_${PN}-sd8686 =3D "Firmware-Marvell"
+LICENSE_${PN}-sd8688 =3D "Firmware-Marvell"
 LICENSE_${PN}-sd8787 =3D "Firmware-Marvell"
 LICENSE_${PN}-sd8797 =3D "Firmware-Marvell"

@@ -262,6 +263,10 @@ FILES_${PN}-sd8686 =3D " \
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
@@ -270,6 +275,7 @@ FILES_${PN}-sd8797 =3D " \
 "

 RDEPENDS_${PN}-sd8686 +=3D "${PN}-marvell-license"
+RDEPENDS_${PN}-sd8688 +=3D "${PN}-marvell-license"
 RDEPENDS_${PN}-sd8787 +=3D "${PN}-marvell-license"
 RDEPENDS_${PN}-sd8797 +=3D "${PN}-marvell-license"

--
2.6.3


--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_AD9C013A-A2E0-45FC-8A56-589EA30E0658
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJW0tvYAAoJEESZlq7c5QqdhWUQAKBzM9yEc6qqG7IVPT0EXrZz
Igmv3FIzYxin/Wo1AAIpjvATym9yrObg8Q2dr0wQz2JyApbyqaFq5eqLQeKXwKOK
KPwuD9qOZ4ogFMwI8aLMMY4MjDYZmnu5E72fpXgw/kxcqrknvdsJBiFSqpmb3pLe
CmL5GmaF5NHnRJckQMpXpDqX+OU0CJvoHtMx2e5E3vZEjWk7D+0q+u52Oo/Ajl3E
oYkPSLKQv62pKsQLLUgYnFFLeJGTY3n64rIUDo3zOdzjK7zP+/0wfDSeY/uBdfTo
AbCBFIm4bTa8GCTX0eAIOdDGoWpdVLHM50zcq6XHIWKKKLS7XYJ93IoIy7gs/1zF
M13iWHdPFpFu0jGLlancvtEeFY9i1ohpEcOziEq+SRXJ3B2Y1mEmf27qKQcod/ai
NDXLK1cxN4wx4kivDi0eNJu8WNWchgQVoqtiyTWKS+63V5GR320zGjCkDtIvXBMi
mwo7icbMz4I3dKViCwb6CQDxaIxiTAibJr68wHFAXFgylid2Q3GSf5a2F+75r/qY
nKTvB1wub7Mohu2JyuutNmmM4FeHpzP1Z0vFw/8XibDt1M/EN2F7CGVH2s5Y4hdh
DVw90KKXPSW7SNAShe3ILuCxG+Q8FeQoLqZ88zI91Bcg5kuCBMIskWpmQLUkPa2u
lXBDN9LOB86ozB9Tkq2C
=NwYN
-----END PGP SIGNATURE-----

--Apple-Mail=_AD9C013A-A2E0-45FC-8A56-589EA30E0658--
