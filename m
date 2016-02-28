Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2B0D962133
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 11:38:01 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id l68so3604470wml.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 03:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:date:message-id:to:mime-version;
	bh=RJMvHXev1IuA9fhh3zNTLfUy1lx74NnEAfOHGDmkpHo=;
	b=Vg3K3dBKbBBFqdQdVIXsk2rndhgEh9RF7U2qHjuneMmG5zeiqZ4jZUWMU3cm//uKtZ
	Q2Vb+jLImaPouDw9W3dkMnISoaRUaqRKikqaRUlc/U6bBKGW9tS3BNsjDleIWO98L3UR
	A1JdOHtxqsk5aU/OpNZgE5rwvWkMtfsNfA4Alp/oPJRdRPy8G4/TyuQO4HNhZuhqyiFb
	nwuf3t1rlgOFLByp28e+vxgTCkVt+WwbXkOoeWxu9HjlqNpgYhmp8y81MVuCzkXDyPro
	11bPCggTWgrhPJII+cQQeLzd94W8eZZYLmtf47GUoIoCwe+P8nDROvracDz4BVtS1y2u
	1eEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:subject:date:message-id:to:mime-version;
	bh=RJMvHXev1IuA9fhh3zNTLfUy1lx74NnEAfOHGDmkpHo=;
	b=RUekEw9OpdadO6UdVmdh+JvqE85/QmKwWde7MTFdN27p4vmGfF8Yzi/ruKPFVoY1tF
	tMs9Pc4tMlVcGYNShQ8LKQxxvgnEGvTPdECjSfcIokAHSCC2dNgwIAQO4LhQoSZtFdUQ
	zLesTiOWd0CSHCgpB3ppY10JF75BVTqD9kUiKX6THsgbpq8+f+vb1OFiDceVRopO9AXx
	rW0RkcYgcmzCMpQG4bq13qMrlTQwAPBiulQL+5sVQ8FZVtjQXR42Po61LQyCGB52F3L4
	TQBsNqLdUa4j9l/wKQBxmYbpTE7WL51Aao4IznHjCTgA+yJfmbjI+zcBgUc1GM0h2rJ0
	vXZg==
X-Gm-Message-State: AD7BkJLe8+R9LVJmeZ9HG7BxVCy+9VlIlsOrpV9QyL+mAlfsxAveQjJsuxAKliVWwgvvcw==
X-Received: by 10.194.90.77 with SMTP id bu13mr9733881wjb.60.1456659481961;
	Sun, 28 Feb 2016 03:38:01 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	n131sm11223835wmf.9.2016.02.28.03.38.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 28 Feb 2016 03:38:01 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Sun, 28 Feb 2016 12:38:00 +0100
Message-Id: <7DE201B3-FFD4-4FBD-899B-F7FF7119B733@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Mailer: Apple Mail (2.3112)
Subject: [PATCH 4/7] udev: udev_run is /run, not /var/run (since ea647cd9 2013-05-26)
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
X-List-Received-Date: Sun, 28 Feb 2016 11:38:04 -0000
X-Groupsio-MsgNum: 78848
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D9519D5E-4022-43E5-B63C-8C3261CD9810";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_D9519D5E-4022-43E5-B63C-8C3261CD9810
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

The symlink which is placed by base-files in /var is only a workaround =
for
such problems as long /var is in the same filesystem as /. Fix the =
problem
by using the right run-path.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-core/udev/udev.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev.inc =
b/meta/recipes-core/udev/udev.inc
index df41f11..d49a50c 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -102,7 +102,7 @@ do_install_append () {
 	# hid2hci has moved to bluez4. removed in udev as of version 169
 	rm -f ${D}${base_libdir}/udev/hid2hci

-	echo 'udev_run=3D"/var/run/udev"' >> =
${D}${sysconfdir}/udev/udev.conf
+	echo 'udev_run=3D"/run/udev"' >> =
${D}${sysconfdir}/udev/udev.conf
 }

 # As systemd also builds udev, skip this package if we're doing a =
systemd build.
--
2.6.3


--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_D9519D5E-4022-43E5-B63C-8C3261CD9810
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJW0twYAAoJEESZlq7c5QqdsagQAJPd5NZg+/BpENX033HlMXTp
rd3tkJzEUseAXhpd2eJwIwLqFdAdQsY2j2gjNPBmi2xxVmv5ahzrv00hYiJojyl5
Lr8GSw7f2ZsPK6mf0Vx1sbGNaiBXcdWaX3EOIX2dg65iDTTxK05L7gLSkQUCh3Ph
Ex0zF6ty8xrWOS47nbqjTxBDl4M1KcDGdlO9qdVQzGTjVii+e1IuH4XG0XJy198D
hhys884xvsbOGi3oWmcZds2DUNRLkU2hushN76HF5qJXWxdcOV+uhjzkXfDMuy1x
AMu+4RzzJEF82n5YP2Pds8de58TiWpUv21UajhKKVKzVM+uxTpUlcGAnWUeZMzpF
1BOxyIASDLnC1DP61o1ouF+xv4IUHJcqjpOpBGvgknmOGkQLbG4//Z4RQwYpnMxd
2ERNOWQL0ETTfHu1GMIbqw7I59x716N+9Rfmy0iLQhF6+Udwg/VUyBtXgWaLWXk2
mGG57WBKe1k9OkKSvnzCy6VfND3XSd3K5OU41Vp5gJQ58+I4agz0uV/8ZzWXlKUE
cC6dVM42s+GGFfDMs/fWrpaTAyyu8lv7QdpxcWAbqKRSw732262+5O4LhY+FGv+B
Cqk/MoqfHqpMErRQkuiB9X86y90nwN2dZY1zzompitCSQjw535wTEfyTYjQlPG6P
Az5OTdASFWafgN5qACTl
=cLps
-----END PGP SIGNATURE-----

--Apple-Mail=_D9519D5E-4022-43E5-B63C-8C3261CD9810--
