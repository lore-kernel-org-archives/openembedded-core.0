Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8530E6E682
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 09:35:19 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id l68so181037790wml.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 02:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:date:message-id:cc:to:mime-version;
	bh=8uumwmcHsJYKDs81I2batk1wqDfe3Oyj27Or4BWVLzE=;
	b=Cm4DGYjOoSujeQ9wI8FLm4xxYJtl+gTHRhBUsmHaXWQbXbzfgMqiNFX3JcNIRkMEkJ
	r39ElRX3FEf60HDEfLgsf4iwfCxr23xo1m2a0/+SrIvhejc/kPb0rLYZcZ/uXErAyFgT
	as4Wjo0yeK9yvncGhqcivzarG8C7YN2WldRFLiQpPO0Ui1YHYA7RxEdkYAX60/7CdZyg
	qSWOWztTEbKhbRmUjsZmQP6OeFQIxlRWe/ws4TxT7Vv7WLFJdTfqEYP2Vn94g0XPHi06
	mdYw5FupRojSO38/pvc7v/Onx75biPGHbUwMuIGm9rODW9I2OwKpkvtspdtZOnEgpLga
	a4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:subject:date:message-id:cc:to:mime-version;
	bh=8uumwmcHsJYKDs81I2batk1wqDfe3Oyj27Or4BWVLzE=;
	b=f3O9369kIYhWu+xvWopiqvcsiQkj93D1SKDxCmfU2UvF4sceECvAY9m7oOuUcALOjG
	hXLFn7MiZn22zlsldRwbkerBJ6Z3k8w50KfnBK6u6P7rRvJ8cje+UVSulNNLd+VRBDTT
	KLdYRIOVfFV+02azTvZtkx0fHJDAuZhwEpJZ2xTS5K8CrDHNOo7fTkWTn4VOimgBotHQ
	qNJnOWFtHhQq6lzK9PNy2QHF0oQGLp171fQ7gSEeGsHXscnfU6I+amGn4vp4dnhV4pN7
	WhLaOlmHgse+nstH5zYTRQQCknypWcVfbU6u3bwZdre2m5wpd6wMwp55A2KBxSPej8w8
	sM8w==
X-Gm-Message-State: AD7BkJIOBjTaBbcI91TbGg9X27E61zGXfteCAIbCkQOD54DFqv7TmN5dKQKbuEmBkFlGbw==
X-Received: by 10.28.113.155 with SMTP id d27mr3387631wmi.67.1458120919224;
	Wed, 16 Mar 2016 02:35:19 -0700 (PDT)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	r62sm2608012wmd.15.2016.03.16.02.35.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2016 02:35:18 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Wed, 16 Mar 2016 10:35:18 +0100
Message-Id: <62C54BAC-C5BF-4B02-8C4B-5645E853D57F@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Mailer: Apple Mail (2.3112)
Subject: [PATCH 2/4] linux-firmware: package firmware for Marvell 88W8688
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
X-List-Received-Date: Wed, 16 Mar 2016 09:35:20 -0000
X-Groupsio-MsgNum: 79678
Content-Type: multipart/signed;
	boundary="Apple-Mail=_FCFB7741-DBD9-4EAB-B8E5-935A2FCCE531";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_FCFB7741-DBD9-4EAB-B8E5-935A2FCCE531
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


--Apple-Mail=_FCFB7741-DBD9-4EAB-B8E5-935A2FCCE531
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJW6SjWAAoJEESZlq7c5Qqd5OcP/1IIGJb4rMlZxLD5TUNzCqRI
e5Qjt5o3ulBp3VchK6nSaWbaWfasliogSaYTo4UjgqQi+EuVk5rUEuw3W+wA38P+
m9tp6pYa24AzVf6X4wUABBWGLd3dAy80RE5Gyso3lpnzd8OxkaHRKFmBE+F6fC3x
OiS09EHxYmPT/V2mSNH232Pk1j4/5xYWfMl3YkfjNsnLi1qknXHkZ8/MgAzvKWH5
T2cmwnMOm66WA+Igr/ouAIQD9OshMFKPmlLWzbfXQxGg8M92GcOH/89DhH0glV0M
ucIc0tmK64y3Zxvu14i8mFZubS4HPa1ar7Ls8U/iJ246fg8zPTc1f/Z2TOUoHU6c
9WYxb/EuaBJp5hDvTg5Rjf+6YADVU8fOe6e7AHW+yQCFcXL2OKKouYq9I0EzDYkI
LeshuWcg8W9MQzslo772sZ8kjpH+Jsuk/JRFp+BnO2+u+gbgw2RiNOEJ/Gr5onSc
qNiCS8gN7Vp4Hs1GKZ4UM3ndG+QHhLJVaoKqp19ZOiD2IbtzZjRCzgIAuesEiT5b
9rP5amYr3JHlf5G4y1mdhidNy774jP0mO/oq5RvsGmG/vyNXFE1QEgOlxO32AB+H
QjngonW2WnoXjWNNf2kkN9TtYsdedZHZBsnHqYOhIX47PPeYhGLNKRhnYIV3rCYJ
6fh7LzM/WvQauZ3WOc4q
=wrG0
-----END PGP SIGNATURE-----

--Apple-Mail=_FCFB7741-DBD9-4EAB-B8E5-935A2FCCE531--
