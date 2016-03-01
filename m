Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 786B4765DB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 12:49:46 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id l68so31865106wml.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Mar 2016 04:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:date:message-id:to:mime-version;
	bh=/OXhvGifN4EydVCw2VIY2K49IyNjewigZnSd36VgS6U=;
	b=jQRRw55MB1pbz1T06IyZm4TLrRQm/2Bf6mpmk8ceJwGzu503gSqlxYrFroHQrc4F92
	EMSQ8lRQByh0OKCSHa294RXzXIFnY3K0YUcKMYHz6BbncncwlSBF/SIHcGumpmjIFpcy
	TYnmYfS0rtK7+tNNbNPNRXphn+2fRJtpxMOWTpInHFaORQR0J62KW1ARJEHtYmYIjZ+N
	U5iOfFumF0+SuFEyA/76YZ9e7o2Af+/zQMBVFEQDaS2P22jz2syWMFsXLMUFrKW64LZd
	Zt0KM7z+AKTPt3n8R2BNw9JdfjFqCloTmRd6oPBgQ32XbUDDR5xEnRFCfK35KNyzTSjm
	q1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:subject:date:message-id:to:mime-version;
	bh=/OXhvGifN4EydVCw2VIY2K49IyNjewigZnSd36VgS6U=;
	b=XfH/qZmfKN2cSF6WSrTgS43PUqNIoRXeMTZOLHDV0h66qzbsX4WiMaXCirnkc9mX12
	BBSYg4T9i+HcjGeEkNODNMy4ptBlrOpt06aT61LZ1wPp/rZvmoDDxYaz5iFQp7AYuPN2
	z1xDSCCUQVp5+FBSbSCS93iqCJXgbtkDm9azyqqGz08S1Q0ImGjeUVYOss+c9mQxmTIB
	P/w+IG5Q6SU+3Lyfr7g0T85YMGOa2g1VqfHOslDHxuT4sz/AELnbML4H2xe8mClnS9Oy
	wyxCDMHYJ1TFUgU+hzotjpKQ4S5/lMM7voaj1l1/uITgd0zN+DMz+CZdgv5kgFLKzFib
	PgQA==
X-Gm-Message-State: AD7BkJLVTuoFt5NWy9/+ThUPsLNzEDlwjTyYsQIGPQcYqUwS9XAlfitlLgbMOpYEETqUgw==
X-Received: by 10.28.226.6 with SMTP id z6mr3419233wmg.44.1456836586881;
	Tue, 01 Mar 2016 04:49:46 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	ll9sm30774503wjc.29.2016.03.01.04.49.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Mar 2016 04:49:46 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Tue, 1 Mar 2016 13:49:44 +0100
Message-Id: <FBCBD0D0-ED34-46BE-AB52-BFA3E223EA36@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Mailer: Apple Mail (2.3112)
Subject: [PATCH v3] avahi: make dbus optional but default
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
X-List-Received-Date: Tue, 01 Mar 2016 12:49:47 -0000
X-Groupsio-MsgNum: 78986
Content-Type: multipart/signed;
	boundary="Apple-Mail=_419601B6-6EB7-4AC1-9B1F-B08848D18421";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_419601B6-6EB7-4AC1-9B1F-B08848D18421
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Since do_install fails when dbus is removed by .bbappend, add =
packageconfig
to allow users to get rid of desktop ipc helper dbus.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-connectivity/avahi/avahi.inc | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc =
b/meta/recipes-connectivity/avahi/avahi.inc
index faa8ee8..8ee461b 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -14,7 +14,7 @@ SECTION =3D "network"
 # python scripts are under GPLv2+
 LICENSE =3D "GPLv2+ & LGPLv2.1+"

-DEPENDS =3D "expat libcap libdaemon dbus glib-2.0"
+DEPENDS =3D "expat libcap libdaemon glib-2.0"

 SRC_URI =3D =
"https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}.tar=
.gz \
           file://00avahi-autoipd \
@@ -23,6 +23,9 @@ SRC_URI =3D =
"https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}
           "
 UPSTREAM_CHECK_URI =3D "https://github.com/lathiat/avahi/releases/"

+PACKAGECONFIG ??=3D "dbus"
+PACKAGECONFIG[dbus] =3D "--enable-dbus,--disable-dbus,dbus"
+
 USERADD_PACKAGES =3D "avahi-daemon avahi-autoipd"
 USERADD_PARAM_avahi-daemon =3D "--system --home /var/run/avahi-daemon \
                               --no-create-home --shell /bin/false \
@@ -125,7 +128,7 @@ do_install() {
 	rm -rf ${D}${localstatedir}/run
 	rmdir --ignore-fail-on-non-empty ${D}${localstatedir}
 	rm -rf ${D}${datadir}/dbus-1/interfaces
-	rmdir --ignore-fail-on-non-empty ${D}${datadir}/dbus-1
+	test -d ${D}${datadir}/dbus-1 && rmdir =
--ignore-fail-on-non-empty ${D}${datadir}/dbus-1
 	rm -rf ${D}${libdir}/avahi

 	install -d ${D}${sysconfdir}/udhcpc.d
--
1.9.1


--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_419601B6-6EB7-4AC1-9B1F-B08848D18421
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJW1Y/pAAoJEESZlq7c5QqdMkEP/ifDcagVE7h5edqsOM4xmsb7
oghaUlpw2xs06XfCl1bcc8b6DMMIGtgIukGpq7qE0VE7+NXFD6ie4+Hh7FCzcNOi
PXeWRmIsIlI5SdTOEVIy095JqrpjlEpQ1mZrwB9A38isGc6XfB/C83vzh0XBnrYe
asCAG/AWqK0GK1KCZD9RHFS60Gbc8EC7GNFgBdpyzha3vptScYv81n/xbxeweUpv
sm5AjzWHCJTOkRhCiFYXh0XXkai8pB2Fm6/Uy3H0HwLZvBJN+QZ8B4dhCQ1G/y8B
4oL1W3aUQ70L7GqRejNDabjeefWf/1ssl/SC09y7lZGH2ykiIB1Xsen//NRmwcdy
mdndHGZDKt76pi7mTcV667nZDWIyFTRojhyBytw6mtAFFQ1QWrxCmQzjz4uRLZv4
RJYDmWx3Nw5HogqIKIKQ3EnLKfLBndWjWexbatRzxqWg29Saa2EF+nlkbFTHfCaS
ZAPrPQWHV9YM/ygeNl1D4P9hJMm/fzQN0PQA6GXNMUlbPxeQfxXczawFsLRWAjPK
vgxKj6UyFomdEPriH6qnNs7uTETY2QKGVdTgP66NDrpT8ymoLu5iiTm3psezJqwN
cVZUDABiLv/SL0XkR/mQWAg4KkRxaVb/xo9fvw0QzTXuDKmUWWFROx2rFlZ7CNbb
6EdcMgNjWOXqn+a6W60/
=5w6E
-----END PGP SIGNATURE-----

--Apple-Mail=_419601B6-6EB7-4AC1-9B1F-B08848D18421--
