Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id C354F773D7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 11:36:18 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id n186so13101710wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 03:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:date:message-id:to:mime-version;
	bh=6UMEbOhnnsCBAH2qcHn8U+lKiuJvPp0GlCQXxx2wjpU=;
	b=SSrhkow4JU7g2MKdwgj3mVVGZXxwpZ9Kz5dVffxyK1NZv+tUnM/dpw82w0w2rd7MCw
	U4XCyJ35D+6QGsDkON0rXlM6ERa6Yaw/mksK4fz7tEFH9/zL/u19fQvpr9CIET1pgdum
	R+3833zbrdGnWuZ7f6qBmLtofHaVpV4M14KVYYdTG+IpQLZSsAQNJHIbPyyGbLMJcNc0
	+nmgPSHvMFLiy9boEfclWt7V4GwuDlYfmiei6q3zpXiR1U+Us/q2dIKPfi9UUkPi14xc
	I4viEGmiZzcCqY4/mRCxM/qvgVaXa50GWLjwe7KrNGkyXZ+ujeuyw4sFkfSL7HbTknuT
	gmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:subject:date:message-id:to:mime-version;
	bh=6UMEbOhnnsCBAH2qcHn8U+lKiuJvPp0GlCQXxx2wjpU=;
	b=gIiNkbNOE7DauSHc/FZOwAUCLCQ+GpcKTh4T/UWCdbybaqGaalpIqysDu1Eqz9/h+K
	Mr005+JHsDfciH9gZnyaU0aavzfmkIDimYheQQbBwtVv50YYq9hsKhAxUT8uNLzgnAQL
	3i3RzZIowLM+rgi3vTIg6IXlA27FMMY6AfJVsNrs7TviKoZifiUBxE/nbYuADVi+IXGn
	yNxDkiQNZlCEJFHucCjuzod8IuAabewGrHIwmoXijWuOV+PVg+M72cetdeWWSXr2KiTz
	oNU5xl0rZ1ID0TgxzrBX71qpEVlctadq1A557dhrjyC8U/sOpSYf2FIkcxzDwAM9vgx1
	fgkA==
X-Gm-Message-State: AD7BkJKBYIn4k6KxL4Qz7qzz0fL5ikUVwrpif0hmvHUIroGY2rxMyqLb/FF78tz/uQtyjQ==
X-Received: by 10.194.92.174 with SMTP id cn14mr11701100wjb.66.1456659378806; 
	Sun, 28 Feb 2016 03:36:18 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	d9sm20711234wjf.43.2016.02.28.03.36.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 28 Feb 2016 03:36:18 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Sun, 28 Feb 2016 12:36:17 +0100
Message-Id: <CE71D385-7711-4B12-9E0B-F3434A2D7D4E@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Mailer: Apple Mail (2.3112)
Subject: [PATCH RESEND 2/7] ARM: handle missing thumb suffix
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
X-List-Received-Date: Sun, 28 Feb 2016 11:36:19 -0000
X-Groupsio-MsgNum: 78846
Content-Type: multipart/signed;
	boundary="Apple-Mail=_FE2B1AE6-AEA5-4DC9-9944-18872100C4AA";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_FE2B1AE6-AEA5-4DC9-9944-18872100C4AA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

When enabling tune for arm926ejs, poky optionally appends suffixes for
thumb and dsp support. Since sometimes arm926ejse (ARM code) and =
sometime
arm926ejste (thumb code) is used in PACKAGE_ARCH, allow both.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/conf/machine/include/tune-arm926ejs.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-arm926ejs.inc =
b/meta/conf/machine/include/tune-arm926ejs.inc
index 4f4d7dc..81bcda3 100644
--- a/meta/conf/machine/include/tune-arm926ejs.inc
+++ b/meta/conf/machine/include/tune-arm926ejs.inc
@@ -8,4 +8,4 @@ TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', =
'arm926ejs', ' -mcpu=3Darm92
 AVAILTUNES +=3D "arm926ejs"
 ARMPKGARCH_tune-arm926ejs =3D "arm926ejs"
 TUNE_FEATURES_tune-arm926ejs =3D "${TUNE_FEATURES_tune-armv5te} =
arm926ejs"
-PACKAGE_EXTRA_ARCHS_tune-arm926ejs =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5te} arm926ejste"
+PACKAGE_EXTRA_ARCHS_tune-arm926ejs =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5te} arm926ejste arm926ejse"
--
2.6.3

--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_FE2B1AE6-AEA5-4DC9-9944-18872100C4AA
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJW0tuxAAoJEESZlq7c5QqdZNgQAIuG9SjXeoMuWXlT5n6b9KMC
Wd7dlVCiU87JUUiRMCbN0KUNjFIbp7pbkP3qWsdwGEKPk3sirTtN0KQ13BtGwmp9
e9/HZvYXLuy90dRpb0DRBYJrDmzL05Sg0GJiEGogE4ycA3YIrtylgUhoHiLSGAcg
smG5NS3YtO8SVJTH0uzE7cCpn8KxIjpHW4TFW/XVRabeayGSZEMSV72kHQgpScFR
qhj4wM470AyNsQeH/7pmG1oCxg68FvlKU+coD9Q1Yfgp1fyDdpKzffcy+frNVKLR
MI9TW/ILg4wJzS8JwVeNtY030uS39nn9UwXUsi8lGtQXEdYvDOYJBhyGMbjK9ZF+
eGBnhb59hsxCTG+Abg53TvoLfUuRDk7iABQzfWsVqKjVmTIVFvkEqQHCAfILNXEy
ud1zcWzmmrXoTsVRZ5F1ZQazSnBZEn/L/ZQU177Fke655yg8UDKvzHWrX3yAH+bI
yT9RPGrIpHPiW/aaYbWTgrB+djqpDI+TXwncw1OJ69+I5pOiwK+yGa5bn6H9NCHI
/Xm/liUspGTM+8EtA6vXqNNUgg+ZD7c98pShUhrxDeArSGKM3uicua94UnhO9WWY
lW4s6PERJH6DklpamaQJ9n/i0mTWHZb1VSUDxF6i+pRl3jeLTQEknPp8ZQuRN6OE
NlOzMVBePLgGg4YwjCCt
=KZ7c
-----END PGP SIGNATURE-----

--Apple-Mail=_FE2B1AE6-AEA5-4DC9-9944-18872100C4AA--
