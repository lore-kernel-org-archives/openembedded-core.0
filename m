Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 24FD76FF97
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 09:34:24 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id p65so180742480wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 02:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:date:message-id:cc:to:mime-version;
	bh=QjDPftG/SfHHQzz9IT1sixW9zzio9HyPbYc8oFKtJMQ=;
	b=x6wO/UOYdwfOjAM7OqHUHfnpKJIIGIj3/Dd0j1Iz1d3PECybIDAYh2qHOIzRaXHhPr
	RLP6QOUx1dzTX1QvV7Pc8H+LdnaJK5jONwB2eYFMyMxtKQKiaysKzC4NfDd7LIhZ4ZTK
	aB4VgA2QwycAeb8FoUIQf3q4SgUFVnKsXDNsrDTI514zGXHIgeLM8zaFq+5z+72vU9PM
	d4NQJR2U3WspPcuF0nepysxzeSCkDL4Lf4IMpz1kK+mwvlwp1QKjg2xqCx0l/MtW2ebb
	xFDFzoX5qWc6UCGZ2ocmEfWV9Rwcom6HaGeHSxb+oWR1jf8s+dsgTSGb/rmiIoYNGpyL
	wZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:subject:date:message-id:cc:to:mime-version;
	bh=QjDPftG/SfHHQzz9IT1sixW9zzio9HyPbYc8oFKtJMQ=;
	b=jzwsNIuhh0C3uj/VOftOFtntSq+HYfjoYPPi7/q4kp2GRhRsnQeNjyt53LrQg/3Sjd
	uN4PaXgacLqfx57LubRqZQlDC+WhUlhiS/fsSZasGmgN6RYmtPaLPrfDfEE6E83Y5Syu
	zT1Juk5hIvRv5F5mF8pgSeef84VJVb9dER+41DzE3TUY9080mO3x/kj6a6cY3qdWyYSt
	Z3nOvvrZF8MmVVz5DCoUU+JhBeWOwfi9UQViNE1CbbHwuqGbh13nrEgbAyC+WUF0cPUz
	YjQkZ2X/bmSSSIi4JSTh33xjXfWGFQmwgrc6c3hTVm430csVURcQyJsBtGAWOPKrZJB8
	u5Jw==
X-Gm-Message-State: AD7BkJLHDeoF6X4mGUw051tgKBIXbtW0mixts92YKurunP0ek3kL3NyofblEImExJmKJIw==
X-Received: by 10.28.229.132 with SMTP id c126mr27302741wmh.72.1458120865018; 
	Wed, 16 Mar 2016 02:34:25 -0700 (PDT)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	r62sm2608012wmd.15.2016.03.16.02.34.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2016 02:34:24 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Wed, 16 Mar 2016 10:34:22 +0100
Message-Id: <E262EC7C-008A-421F-894E-40BED850BDEB@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Mailer: Apple Mail (2.3112)
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: [PATCH RESEND 1/4] ARM: handle missing thumb suffix
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
X-List-Received-Date: Wed, 16 Mar 2016 09:34:25 -0000
X-Groupsio-MsgNum: 79677
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DF4FA1B4-62E9-42A1-8A0B-F127387E9617";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_DF4FA1B4-62E9-42A1-8A0B-F127387E9617
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

Please apply this one to OE-Core - it has been discussed completely (see =
http://patchwork.openembedded.org/patch/105231/).
@Otavio: Ross gave me the hint to ask you for ACK'ing - if possible =
(please don't, if it hurts).

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_DF4FA1B4-62E9-42A1-8A0B-F127387E9617
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJW6SifAAoJEESZlq7c5QqdhSAP/0YuKp8JczOL+RWDwo5Jnk1Z
7FIu5derixPbpZYohEw7zln/ojVaz5xHuyLfgFdoQ6EiJ0szYrCFn5HOlynF0mAa
Yyw4fdPCl5oJNIAm2hiREaii0RvFSjU4uHYykFlANs76gTKaBuDp4GceIyk2+m0f
Ot+RVeZWakVJ2qL3t7ThMuid32SmWpYSPupHE11vRI9Skz926GktTPQcdP95WqNv
+mo1CELygZy/AexEVHAHuT8FLXNwFeh+BqmH4khOMtYUNhUT4EFqNMm4t6Dfl1+n
4YZSj7mEGcu9TUly1AvMMCJZH0/D5Z9wLRHMeSo2pbyp6moAnrzIqdBinsFY68cK
PwiDjTkbtvHbZo6InDLk8fxeFcNDsmocJbk99ch+93FHwn/cvXVoY/9jh4KvsE8N
R5lTCDaCZXIhy2JhrO+gb/xVqcP1XYAHYAX/p4t07T7gZ6Sf6/Ck8vGCoXTmrThh
XtTjLTWUNgWRnXQi83u0VlZRFpIzM2sCtkw2EtkkDY00xjElZuLpcKUDvsen7qs7
yibv+geXO1dZrP454lsTLDv42AzpQtJ9cEBmxgZFCpOeygujnqwLvpK12WaMgScO
W+8tQUoBc6o1SdIYt9tC6yLs0gSREx7QMGfVAkznxY3VRGOopM3FjfI7KxbsRBkr
uWjlurY5f+FhWJ981YFS
=InFe
-----END PGP SIGNATURE-----

--Apple-Mail=_DF4FA1B4-62E9-42A1-8A0B-F127387E9617--
