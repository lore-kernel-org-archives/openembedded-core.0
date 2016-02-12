Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 1298A731A8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 09:18:45 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id c200so11325951wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 01:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:to:mime-version;
	bh=JTHBWFR/NkPnquLiR9appwLp2DlYQmneLGC3feBV1Zc=;
	b=UvLR2hocOl5SI3+0chHMqeenyhixfUMEmEdRmDcWvMmT3AtCZ7kkosxkpej1h3p7V0
	unJXkZUHNnTKI6RtdhV7Nys32gYck8Ws1Y1rhExlMnOSZyZe/70jNURb+vdrEqpOuVfw
	GgPVVC76eUkmQZXlxeY6vtKMoOIR+SbkM51Ks1uCnpOd4DT3WWOX0yFbj1VtgiBigwo5
	WRbQ2cwPsKJCtckjq2OF3z2iVMF6SgnBUh/S742+211IQLyia+Hw3M+DGZjVrbqTYo2/
	706Y6On3NjrYXRanNahJ3ew7AwGOleWA26CMkqwRzYk7Iip8lrQhFB432rhixMs3g0W7
	SaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-type:subject:date:message-id:to
	:mime-version;
	bh=JTHBWFR/NkPnquLiR9appwLp2DlYQmneLGC3feBV1Zc=;
	b=SkLilInR9KMKOm1GryCf1LeYJTbmE9CKmhqc9PsaxTA30iWJUyKuGPBrLRu+CEc/bV
	LSVhf/JLu7IWmevBmF6QV4utYBWNOrokTyAXN8+8eLAWKgOG9ko2oZUzdH7c8APN5q2u
	wCYl3WyKkcR2wWO5NnoP6U9vBya5fbMtl6X5oRC+HSUk8J08VaTBi7I2vuLkqxT1FBkZ
	3OFLSPoIxrsZhTkA4UkCMMc9plvwBLMCGdWKUKnLmNZtktf7tbRGzSydepVPUjMlc8XO
	MHiLDU90+jtQwV2dE+W6bB5pqM8deHuHA2u8HGjZZOjT3eS0G1cloI/43SgAbqokYP42
	RV0A==
X-Gm-Message-State: AG10YOTvwl1+wFXns0uJpMAQd+j7lmPERkgQz/7zeLXDoaAXWgSU2S0/bBALu8wy+0sqcQ==
X-Received: by 10.194.57.138 with SMTP id i10mr576183wjq.104.1455268726087;
	Fri, 12 Feb 2016 01:18:46 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	os7sm11216631wjc.18.2016.02.12.01.18.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 12 Feb 2016 01:18:45 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Fri, 12 Feb 2016 10:18:44 +0100
Message-Id: <3D51BEA4-AB8E-4A8D-BF30-5075056B390A@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Mailer: Apple Mail (2.3112)
Subject: [jethro][master][PATCH 2/2] initscripts: start urandom after populate-volatiles
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
X-List-Received-Date: Fri, 12 Feb 2016 09:18:46 -0000
X-Groupsio-MsgNum: 78043
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9EBF2114-16AC-42E4-8AF1-ED31F4BDFFFD";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_9EBF2114-16AC-42E4-8AF1-ED31F4BDFFFD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

In case of read-only rootfs, populoate-volatiles might be used to create
some links (or bind-mounts) required for having a writable /var/lib.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-core/initscripts/initscripts_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb =
b/meta/recipes-core/initscripts/initscripts_1.0.bb
index f90de6e..148491f 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -123,7 +123,7 @@ do_install () {
 #
 	update-rc.d -r ${D} rmnologin.sh start 99 2 3 4 5 .
 	update-rc.d -r ${D} sendsigs start 20 0 6 .
-	update-rc.d -r ${D} urandom start 30 S 0 6 .
+	update-rc.d -r ${D} urandom start 38 S 0 6 .
 	update-rc.d -r ${D} umountnfs.sh start 31 0 1 6 .
 	update-rc.d -r ${D} umountfs start 40 0 6 .
 	update-rc.d -r ${D} reboot start 90 6 .
--
2.6.3

--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_9EBF2114-16AC-42E4-8AF1-ED31F4BDFFFD
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWvaN0AAoJEESZlq7c5Qqd1ioQAJ2PnCEXaCJlHjeQvx/LqUUz
I5g2INHMYDnYvhtqBncPn0rdsj/P5wJ1u4mEvg5iWnkK3iu2yWPQmVPgDJYqN/dG
TNNRM5XpOCDAgLKP01Vqot2LT5HcnYl4PRO3Trg22V7eWP8TSNUlrQUoIQ7Rlpwx
CX7vouTEa5LFwkPKSYOCk8HsFfIR3JioKkjp5dtyecz5NQjT+ONogn5ql3A+I1J7
QYe05f5JwozUEahIjHGzEXYWASArbZAdJyq7cdQ8Sg9fS/HVCodPje/59ncA3kXN
wl9zVXc1B/S/R8ETzYPmSwLmq0mksBdy8KpPRiyNpVGmvtt1hSjcjODpb4dzH8Z+
Az6zGHBmpPmfBpTjVTbH/bnEv1twHlcUYB5qj8dF5WiJE5fSxKMNYK+hD+jqcfQ0
nA7kVPGBqAsgEoZX+4cXxJw/rIB8RwvxKa7cBFox70atQP3K1CHt+LBIk7eFhKZt
7fWiutHVH9r0PXu/AFILRY30N1CYvAAGjeGO9kW3bIaBORGq3vLCcE3wfp2Fc+uK
cNav6vmVOXYkaWmZ46dD20swN8VEk04p2cIXwh8rxY05RXJAssY1QUZ5JAGrycyC
nLSAELg7mgFMA26AAW16P+ihgrt325ip2iqVsZVn9lrCLasT+0RhvBm3AFF5rP11
fynZJfwevbwAXsD4GXM8
=xXtF
-----END PGP SIGNATURE-----

--Apple-Mail=_9EBF2114-16AC-42E4-8AF1-ED31F4BDFFFD--
