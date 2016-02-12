Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id B5C6373219
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 09:17:33 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id 128so53717893wmz.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 01:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:to:mime-version;
	bh=+Jg4iJFsuQgNBzotLZWpp0FRyXuKYRegrqa3EpCAb6I=;
	b=mCcVAg0WvqpZc4CnHcbc9tWsGCRPeX6nvLgj9e45eM5hcSZI6UejYczIFMN/PsEtnK
	Pn93sC+DtovXVN6GxekL3BVNcA8B0maSwtK/tpwAL9qkI10jULyCuOMN24tEncbPf0dQ
	f76QeVCwMWZTZbGPwM/MCeafmKK6TaJfd33VLAJhJDKH1x8FSl4tZr304M7jGZ6SCouk
	+dKc3AQ/QCniVrR67OLC3u6SXCzr6pA+bHiId2z35PvLoli0S2Sqb78FxddOxXDevYuD
	7RA1+fdQv3KTiVmiGX8f4yfzPetjVqdXD/5fSy6lwDYg6W1qOOJF/7KLnm4+lR/1WtoW
	D6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-type:subject:date:message-id:to
	:mime-version;
	bh=+Jg4iJFsuQgNBzotLZWpp0FRyXuKYRegrqa3EpCAb6I=;
	b=Bwi80ly3Qr76a4O0QDX7ggO4jejOPfyz4KOX4+kQsr9lpz8YoEO5DgcAEFVZbCKnQI
	zzCLnPpufCfIGzujf6u2Ha1p92/sLYXE4BpK/dXeo3Mqdi4Yl64EGsDVlQ0wwnsWBcPV
	ozfUuFBztp+3UgojJ7rAll2tQY1mkUCOd1sMdAt2VBKHjwOma/zOFtOPYZEWV83XzKZi
	2b2Bud8OwFKDqMzZQKMf9MrVUz5X/6KcD48qmtyEzUDTXAhJnrG+YcOd//Mlz0ECxQFc
	AjdNhPdYa94IlEyMCL47UfQamJNoqSU0FWx75hgtkWLs778ItJP2mYgVLHe/hHYFMQOF
	g1cA==
X-Gm-Message-State: AG10YOSD/CjudJIHCCKiAM5rCjw5DDQezYdfueJujCpnNLxP/3qo2XNlXiBlKDlaZvdKdg==
X-Received: by 10.195.13.98 with SMTP id ex2mr517153wjd.45.1455268653947;
	Fri, 12 Feb 2016 01:17:33 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	gb9sm11111991wjb.26.2016.02.12.01.17.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 12 Feb 2016 01:17:33 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Fri, 12 Feb 2016 10:17:32 +0100
Message-Id: <5C3E518B-29E2-4C69-A82C-0F4AF887EC11@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Mailer: Apple Mail (2.3112)
Subject: [PATCH 1/2] initscripts: populate-volatiles.sh: add mount-bind feature
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
X-List-Received-Date: Fri, 12 Feb 2016 09:17:34 -0000
X-Groupsio-MsgNum: 78042
Content-Type: multipart/signed;
	boundary="Apple-Mail=_93F47718-CE68-4C45-8324-A362C5D92D71";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_93F47718-CE68-4C45-8324-A362C5D92D71
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Add ability to run "mount --bind" to populate-volatiles. Since several
programs use realpath to determine several full qualified file names,
there is no symlink to be resolved. So when speccing /run/lock - that's
the location - not /var/run/lock because of the program is smarter
than the operator/distributor.

See =
https://github.com/rehsack/meta-jens/blob/jethro/recipes-core/initscripts/=
initscripts/volatiles
for an example how to use the "b" feature.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../initscripts/initscripts-1.0/populate-volatile.sh           | 10 =
++++++++++
 1 file changed, 10 insertions(+)

diff --git =
a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh =
b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index 904037e..ce4622a 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -163,6 +163,16 @@ apply_cfgfile() {
 			continue
 		}

+		[ "${TTYPE}" =3D "b" ] && {
+			TSOURCE=3D"$TLTARGET"
+			[ "${VERBOSE}" !=3D "no" ] && echo "Creating =
mount-bind -${TNAME}- from -${TSOURCE}-."
+			mount --bind "${TSOURCE}" "${TNAME}"
+			EXEC=3D"
+	mount --bind \"${TSOURCE}\" \"${TNAME}\""
+			test "$VOLATILE_ENABLE_CACHE" =3D yes && echo =
"$EXEC" >> /etc/volatile.cache.build
+			continue
+		}
+
 		[ -L "${TNAME}" ] && {
 			[ "${VERBOSE}" !=3D "no" ] && echo "Found link."
 			NEWNAME=3D`ls -l "${TNAME}" | sed -e 's/^.*-> =
\(.*\)$/\1/'`
--
2.6.3


--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_93F47718-CE68-4C45-8324-A362C5D92D71
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWvaMsAAoJEESZlq7c5QqdMjoP/19fAJ3Ea5zrqWLGZAL6w5fs
U2XXJf0co6BMXLNcPDG9Ih0uIwDaqrlJBbYpCj7Hq0KzVyE2RT4pkNTmwS2ZfM1r
ue0Z33vgNh5mCBoHJlk1gE9UOxxNfgD6hktJGbczwBGq0dSWLXHbo3f0bhxrof2G
WW5RuVTqYEoii1pse/AQVOMzdukT+m8PZUZrvnGzjMEuzud3Z316tzrnSpPCyAhh
t3i9RrUOLaM6HTTycTgqAs6EBm0j21Rbcme1+dwiU9j5K4fyE4nJHNQIKiV/dmyT
R6Ba4pk4vePE/ukqHR3aK2+0jLDqK2yiWtikSmoTAx+dS+YhZQ0VxJisNX+c+PV5
QRGTu88R0EX4dC87b9OBcXZuCRqQhwvFcvUwJPl6Acn6T/kxxlDKj5Bm5b3M9BxD
cnNiIELb4wBBT0ICnQUxeXQJWL0LtvxLL/qkkTG758baZYCNVgc61iD4io+Yoi+f
+thXQLWBAH8ta2Bux1+0vs8iniNetcddjNNBTFfYLzZ7lSUtuolUm07JBAc+KFG3
C8II84BoJjoW5B+8dIlk0ZL4rS8Iq93DI2Yc/ApvNTDwVfzdbkyvnDHgZVkypJLq
M6rlnGI5tcmfu+xxSp+EML/Gro97mMCzJ1JODIR448xkYU5xooLQz4gT+cRjSNIe
oE4kvIXBhVs03cy1j0bj
=KqRl
-----END PGP SIGNATURE-----

--Apple-Mail=_93F47718-CE68-4C45-8324-A362C5D92D71--
