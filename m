Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 91D2760232
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 20:19:10 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 1so660446wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 12:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:date:message-id:to:mime-version;
	bh=WTxTDJx4fYpScSrAVA8WI8hIV3MlX0qh1PXZgfP9efo=;
	b=Y2cTJ0LGBP07p2O6MdYPAJzwmUHGZKgfsaa7AUNgQHcjGbMiWNRsBmOXbskwY82cz9
	DWLHD5OsCNp43VJeWhJ5RI7r6qdvSfgxGm4pWx1d7f98tUkoROdh8qHMBqHMsBqC96t4
	lV9cyxAPq21fk93OAxN0xC7IJRMRtuFiPES3PJbp4Q+4QzGJJKgKh6cLjBtsOViqE3p2
	cbpq1cZ+5zubtR2cab45XLprxw1BRiXI4df87uftTBECs8xOV6xfOzEOYUhBHbKZFFXd
	NWZqXm7TX6VVvnb9GyaGfIY2KcE99UGtfyEcLvAa+oMWmp16xLLRazGS+hjEqm+rDa6J
	JgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:subject:date:message-id:to:mime-version;
	bh=WTxTDJx4fYpScSrAVA8WI8hIV3MlX0qh1PXZgfP9efo=;
	b=A5Ql/o4nK014BSchbrlVKBIiOClCtiokOvklY0wm67/XS4iPKfQ6IPhO1ZsF8fkBIC
	NoUELVsmLdK93f7I0Y1th1l8uSTbTQk5lr8VJBI5s5RqX4r8/ZMsLRNxYRzBAfzQy2f2
	DI3HgpVLsHSSMHkrKFW+DfAoXoYtYbcT5grtTaVTLJGogeSd1lFRg/iEiOx8W6K6qRYt
	3AbQbN+Q6ME7uLweOuD68RMOwzAV55b2kQ4w8zED5bI3wPD+AjhkVTOjoAWo/6SgQIDK
	hgs6UmeN2+2rOV0J8Y4OrxXCds2OBW6Qm68WFJfuY67Bb2mGmbpfZiz8zq5gu/1dbXW2
	c6JA==
X-Gm-Message-State: AD7BkJJk3ZSFE97VbEvhZ4cwXiYvSWNFV+B52DFJzvk0wwfq8iAkmhMt0SKxVobNAXeCLQ==
X-Received: by 10.194.76.161 with SMTP id l1mr16627410wjw.108.1456777150545;
	Mon, 29 Feb 2016 12:19:10 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	i1sm27379680wjs.45.2016.02.29.12.19.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Feb 2016 12:19:09 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Mon, 29 Feb 2016 21:19:07 +0100
Message-Id: <C902FB1D-2399-4CFF-B128-B239DDBF9539@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Mailer: Apple Mail (2.3112)
Subject: [PATCH v2 1/2] avahi: make dbus optional but default
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
X-List-Received-Date: Mon, 29 Feb 2016 20:19:11 -0000
X-Groupsio-MsgNum: 78925
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DEE04D8A-D855-413D-8316-446B8C65F388";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_DEE04D8A-D855-413D-8316-446B8C65F388
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
index faa8ee8..1e715f5 100644
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
+PACKAGECONFIG[dbus] =3D ",--disable-dbus,dbus"
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


--Apple-Mail=_DEE04D8A-D855-413D-8316-446B8C65F388
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJW1Ke8AAoJEESZlq7c5QqdX7YQAKNKIcqwTZcd9K+nt7bCtwSG
pm1S5YQIlO3+6A7O+5oO3CJLNk+7+qVPk3M/rwVtnRina0XQ2Pzne/UtFkQA+ca1
X9gzPCzT6hYc9GsViylraJRCI2BLSCAiIboJxTYdWuS2Y3siTRsnFELluokx/UaB
iwFxr57FgZsjD5rVELTeI1fUAgeGYvSuO3yukpQOea1Lp0BTE0hgSSVvfzSub7Pw
gKZOMOCNhdavFqRT0i105sHCl/B3e392ZfuEz1+rCUD9j4O781/L6zeO8TkuTC0o
+kABeZIFAASQCfcQrxmhvvpcRb6jelmR5a5dqGnirkVaJTzMpwaMTTSGzhjwLtKb
z8vdOXLSz3JraskYTVGbA2tMokjI3TloGC+sjs0U/KA2XqtJk2MX31ZUyWDZ12Pk
pO5U37vM1Cb1XYOXkppcqjksuuqX5syWKn6xZ0SKAPGJprekJ3tbRVN6hBVJc7jz
XjVhCAmG4fUYqLPaLT4uuPC+evAoq8FNJMYfHqUgdvSVLLlwpFd6bdf6h6lUg+LP
YXlALv4WIJPQnlJ7407bArXTwboUytuNbNMFSetysrzGvFyfJodxWwBRgEVRjD3e
ZFaw3IspN31f8L+/VhoWC3zLIdIc6o4v0B8y4n1VDXkDIyyeHZFW541XWanLxH/A
IKpaIY6MysMVMZTOzTsH
=1YDN
-----END PGP SIGNATURE-----

--Apple-Mail=_DEE04D8A-D855-413D-8316-446B8C65F388--
