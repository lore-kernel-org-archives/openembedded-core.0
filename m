Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1852D6FFE2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 11:39:26 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id n186so13155949wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 03:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:date:message-id:to:mime-version;
	bh=hhACmnHuckNY8vhKH2vNBFBl5Ke7pVYlMNDAo0i+Pz4=;
	b=O39eNBxoJQxfVSm1/Dc3w0DGPZUGJB99TQt8uz/cf90iLR822O6jEDvlsEEQb5C93U
	dNQnleoVPzAZaHtyE8wpoDS+aUowz/LWuQCdb3xuvoS8igzntQ9H7/jM8Z7sHs63EDvY
	544MA31g2Te5CcBc2W8oTyuAldxD1N25jI4PItw1GAtY2p/NHiGVPJTDBlN/YIoROpaU
	AMs/x+fZN72GEBt+Ms0KNxsmHj8Z1mCyCTMWVqgvhWeyEZI/xLjoXAD6G8tZA0nMuDJ+
	GG0b01IGARmyYLQusHfDw8iorKXoglbQEyi8yoDGcCZ7sGI1S6BOYZCe4CvzF/X54Q+5
	nEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:subject:date:message-id:to:mime-version;
	bh=hhACmnHuckNY8vhKH2vNBFBl5Ke7pVYlMNDAo0i+Pz4=;
	b=eafPONMryFoH9J1qM8tTfpogK6TBOeTl+jO8Or4EvGOy6UTirFzn5kl4vaA/l4oDHm
	rDj89sCX9afbktKPsuuiyDbbNFs74ioOCtAUBSZT8LHzNrXUbH0DIqfJutIfIeOrVs/V
	P7mVoFj+BlfzqCJIXooCK5MjIrwNZZC53B00TL4OGdskaXGAJsuw7n7I/NZG/pq6h4xz
	i4eoR+Ocy5BjGvyVhVfGHc3EEEh8bm7UH7uA306OgQ80+ojQmfgJkAVggCAsKkHt7nq6
	lG7Scew98F6xt46qNr+blTtyvxjtIxhPFiLi+/D8oI5xEIfyUvmPj/tftskkkcHp3lW/
	fcAw==
X-Gm-Message-State: AD7BkJKBCuJvuIwkF96uuOZLrXH38S0Ipg3Y3pwyHqbig+3+nW781XqlJXMbDpMjz2oM+g==
X-Received: by 10.194.91.233 with SMTP id ch9mr9933396wjb.121.1456659567494;
	Sun, 28 Feb 2016 03:39:27 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	n131sm11223835wmf.9.2016.02.28.03.39.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 28 Feb 2016 03:39:26 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Sun, 28 Feb 2016 12:39:26 +0100
Message-Id: <898F5FB0-0062-4647-8A7A-1DE402384A75@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Mailer: Apple Mail (2.3112)
Subject: [PATCH 6/7] avahi: make dbus optional but default
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
X-List-Received-Date: Sun, 28 Feb 2016 11:39:27 -0000
X-Groupsio-MsgNum: 78850
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F49451F1-AD74-4934-BCBB-6CE4D6509361";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_F49451F1-AD74-4934-BCBB-6CE4D6509361
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Since do_install fails when dbus is removed by .bbappend, add =
packageconfig
to allow users to get rid of desktop ipc helper dbus.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-connectivity/avahi/avahi.inc | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc =
b/meta/recipes-connectivity/avahi/avahi.inc
index faa8ee8..435fbc5 100644
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
@@ -124,8 +127,8 @@ do_install() {
 	# if /var/run become non-empty in the future, need to install it =
via volatile
 	rm -rf ${D}${localstatedir}/run
 	rmdir --ignore-fail-on-non-empty ${D}${localstatedir}
-	rm -rf ${D}${datadir}/dbus-1/interfaces
-	rmdir --ignore-fail-on-non-empty ${D}${datadir}/dbus-1
+	${@bb.utils.contains('PACKAGECONFIG','dbus','rm -rf =
${D}${datadir}/dbus-1/interfaces','',d)}
+	${@bb.utils.contains('PACKAGECONFIG','dbus','rmdir =
--ignore-fail-on-non-empty ${D}${datadir}/dbus-1','',d)}
 	rm -rf ${D}${libdir}/avahi

 	install -d ${D}${sysconfdir}/udhcpc.d
--
2.6.3


--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_F49451F1-AD74-4934-BCBB-6CE4D6509361
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJW0txuAAoJEESZlq7c5Qqder4P/iKz+hutnCAzTbvo9a3SVMX0
KvI7mI88Tje4Q6ZyAeNf3BTeXr50CldwFN+eKAEO6IXjFk6UlGgkYwr8uz2QLEM+
P+q3XReirY5S+07sGWn314JiUq2O9nYjD0Lzw2mwWgMvOrE/hW/9t4An2gXoXu1o
Mdp6GX3dqwg9LbTM3YpVBRk2Fw7YlrMFT9lk9r/bUmEwiBlvcELOpS1z15Lf6nr7
3DzT0n/qv1vv8bvtGHzXHcssDoJ0pGIsU4Xkz2Xaw+T3W/Ay+hNh8B0K7suE/9p7
5DmNvx5UkV28aAS+66gNEczx31osaLPBL2y9VME6aPJAMkYQXezv+eKJDKn+SB2g
9Puv8miq39/f3nVjzUcdAmFGOxoAIpMWB4OfYZsNe2SVd0S8ue0tM/IZT0Ii+ML1
ja/yyrSvCMpxrqG4gwhZV8Vo0bO6a55zYTUaDLCI64biExu3ViOOoevNKFYdQj9s
Txy4CQZlvX9H1MerZKwHdnaalo0e/6RHk+9G5ll3TThO91DmMp310nF2IED6OwE6
fmtWsYQ05Sino3l9IshlMmMQCvyf4NYN8Z+zJWN6MMZn6eR6hpEtv0VE6uz7GrgU
x/Qa0GQLdf1DkzMlB258Y1B5NDqFPOx467lpHOWSEc3XfcSXx6yd8Wycn6iJz62E
QaaY1ur1X+Jir0IjOyUJ
=Wyv5
-----END PGP SIGNATURE-----

--Apple-Mail=_F49451F1-AD74-4934-BCBB-6CE4D6509361--
