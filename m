Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id DAA6460132
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 20:51:41 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id c2so10034005pfa.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 13:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=m5l7IpmmTJhCgC9yE3fr6U3ez+uy8fFH27Pu6Z5CHMc=;
	b=XDYYbC6AOzvbb1mcjRnaMUD2gmXZaI7g2UUVY3rWBNuhyldb9bH6VqB3aXhyKX25kZ
	qhlzw84kvZ9OVCE3m04Ty0mcTfja3/vW47k0BWrQuLExrbbtyGm3VPY8FCv565gRgbY/
	OxIPZhbGP2S8hR8um1Ykj3tOrcrgOsGTtNQH4fVQhLhUNIrC+8Hm29x5RdmZzHI56peh
	Yf0DorUo5gPVAp/ytkpm+QPHm84ukzaXcsGNyFSabvW6Z4Oauziswsb7A5/AOKw9+g13
	+64k4MpUkUv2wPCuD5I9WKM5fQmYWOpJRfy6FFudyhcmWaLpmlyfOWqAhBSwZ9ig0R57
	dokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=m5l7IpmmTJhCgC9yE3fr6U3ez+uy8fFH27Pu6Z5CHMc=;
	b=IubgH+/PqYQp3h8YX92X07mt3L5mc45wy4sHjsGZtM1RRyr7VgGNo8YQw/aEI6qeKS
	Ep1RJMeiy3y+EJjsTcGs2clfMtATeSrDFQEmyLarpb/aV6TXIMb+651qsrUhgU09iYIb
	N38rQQ/fvOWXoMHjCxcb5R8Z1PqsgYiL0N6+wVUb6dV/LJX3DLCU4ek7VITnhyQ/RDMe
	LuExz9yZO8d4l6vcPhFLIXU+8xVWyMXFPchTUtnBqT9qQaRYRrimOGB9zBSUPCvpgIeV
	SL+UCH0lIenHXC0QbrvVKg5JX6WFL/n0nPapAJ5dOZOyL576Nn8glv/UkcE43moPl3jO
	w6oA==
X-Gm-Message-State: ALyK8tII35ASS/+pRy3og3re/ZBI3e+3vP6K0zcbRHE1wzaRkSOnPNvCfbCxpC2MAH8FKg==
X-Received: by 10.98.106.133 with SMTP id f127mr6998294pfc.139.1466542302181; 
	Tue, 21 Jun 2016 13:51:42 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:115c:3c68:c1a0:56a:aaa0?
	([2601:647:4c00:115c:3c68:c1a0:56a:aaa0])
	by smtp.gmail.com with ESMTPSA id
	y66sm50262579pfg.94.2016.06.21.13.51.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Jun 2016 13:51:41 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <DBXPR07MB2395258466152EFCDCB4ADEF92B0@DBXPR07MB239.eurprd07.prod.outlook.com>
Date: Tue, 21 Jun 2016 13:51:35 -0700
Message-Id: <7828DF45-F039-47DD-886C-40F84DFA743E@gmail.com>
References: <DBXPR07MB2395258466152EFCDCB4ADEF92B0@DBXPR07MB239.eurprd07.prod.outlook.com>
To: "Kucharczyk,
	Bartlomiej (Nokia - PL/Wroclaw)" <bartlomiej.kucharczyk@nokia.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Adding Bash to meta-toolchain.
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
X-List-Received-Date: Tue, 21 Jun 2016 20:51:42 -0000
X-Groupsio-MsgNum: 83705
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1E07F2EB-980A-4E80-9488-56B3ACCB9009";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_1E07F2EB-980A-4E80-9488-56B3ACCB9009
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jun 21, 2016, at 9:08 AM, Kucharczyk, Bartlomiej (Nokia - =
PL/Wroclaw) <bartlomiej.kucharczyk@nokia.com> wrote:
>=20
> Hello!
>=20
> I have encountered the following issue when trying to add Bash to the =
SDK (meta-toolchain).
> After SDK is installed, bash is not accessible in PATH.

Are you needing bash on sdkhost or on the target. If you need it on =
sdkhost you have to include nativesdk-bash
into your image. =46rom what you explain it seems you are adding bash to =
image, which will add bash and its level
headers and libs to SDK target sysroot, meaning you can develop your =
applications in cross environment and these
apps can use the libs and headers of bash.

>=20
> _Why_
> The bash binary is installed in ${base_bindir}, which is not part of =
PATH variable in SDK environment script.
>=20
> _Possible solution_
> I can try to send a patch for this, but would like to clarify first if =
that is a good way. Please give some thoughts.
>=20
> Basically my solution is to adjust =
"meta/recipes-extended/bash/bash.inc", and merge do_install_append =
(where /usr/bin/bash is moved to /bin/bash) into =
do_install_append_class-target. Additionally ALTERNATIVE_* variables =
must be adjusted, due to:
>      WARNING: bash: NOT adding alternative provide
>=20
> With regards,
> Bartek
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_1E07F2EB-980A-4E80-9488-56B3ACCB9009
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEUEARECAAYFAldpqNwACgkQuwUzVZGdMxSFiwCeMfIlnTAxMmhsXr21cWKeiaLl
Z98Alii70zmVKNuuIooIJWk7MudjFco=
=vndw
-----END PGP SIGNATURE-----

--Apple-Mail=_1E07F2EB-980A-4E80-9488-56B3ACCB9009--
