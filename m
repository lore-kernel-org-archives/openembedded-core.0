Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id B501C6FF77
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 04:14:05 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id wq6so53595500pac.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 20:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=p6Y4C9z46nbkjV6BDXrEg58db/7CwTQ7tk8p7AWhxoM=;
	b=QwUcJeEHcQ9HNwWkBAj7KaNmUTjwR/7vywrEktz/b8PgKUpW+6i83dIOHLWOgdn3pY
	la7P/Lp58LDAzj1fw1x2LfjvMDhhURe+LKGH3z/eU9kxZNzPePylorDvlbEMig4S+45t
	UU8v+RhxyBCf3+KYS0woI2K9YfMc+jMFtIOQt8Q+gJXGYZEfaOkaPdMCZwxgCCoB9Wty
	yqTObwVqx1GK80gxaenejNqUhUhRa7dLbZXLT1kdqAAaWOmzWRhKqa9/0VG+tNO+714u
	4E87KHQSsXIx4ROM/CtvmLSKLNWBNYPp5Eb3IjmDHtRNdVfkbACnkwFZS54x+tAj8yku
	uahA==
X-Received: by 10.66.153.198 with SMTP id vi6mr2067136pab.37.1450412046116;
	Thu, 17 Dec 2015 20:14:06 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:d8fc:4635:f3ea:21e6?
	([2601:646:8802:5d5c:d8fc:4635:f3ea:21e6])
	by smtp.gmail.com with ESMTPSA id
	ix2sm18790330pac.15.2015.12.17.20.14.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Dec 2015 20:14:05 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1450402525-11430-4-git-send-email-armccurdy@gmail.com>
Date: Thu, 17 Dec 2015 20:14:07 -0800
Message-Id: <685B7CE0-BE34-4C9F-8A8C-841E3D5A488B@gmail.com>
References: <1450402525-11430-1-git-send-email-armccurdy@gmail.com>
	<1450402525-11430-4-git-send-email-armccurdy@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4 v2] valgrind: make it explicit that valgrind supports armv7a and above
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
X-List-Received-Date: Fri, 18 Dec 2015 04:14:05 -0000
X-Groupsio-MsgNum: 74960
Content-Type: multipart/signed;
	boundary="Apple-Mail=_70194ED3-FFA3-41EE-8E53-97BAC9578256";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_70194ED3-FFA3-41EE-8E53-97BAC9578256
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Dec 17, 2015, at 5:35 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> Update comments etc and remove usage of the _armv7a over-ride.
>=20
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
> meta/recipes-devtools/valgrind/valgrind_3.11.0.bb | 13 ++++++++++---
> 1 file changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb =
b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
> index 3dc3cc1..0481c63 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
> @@ -26,14 +26,21 @@ SRC_URI =3D =
"http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
> SRC_URI[md5sum] =3D "4ea62074da73ae82e0162d6550d3f129"
> SRC_URI[sha256sum] =3D =
"6c396271a8c1ddd5a6fb9abe714ea1e8a86fce85b30ab26b4266aeb4c2413b42"
>=20
> -COMPATIBLE_HOST =3D '(i.86|x86_64|mips|powerpc|powerpc64).*-linux'
> -COMPATIBLE_HOST_armv7a =3D 'arm.*-linux'
> +COMPATIBLE_HOST =3D =
'(i.86|x86_64|arm|mips|powerpc|powerpc64).*-linux'
> +
> +# valgrind supports armv7 and above
> +COMPATIBLE_HOST_armv4 =3D 'null'
> +COMPATIBLE_HOST_armv5 =3D 'null'
> +COMPATIBLE_HOST_armv6 =3D =E2=80=98null'

I just used it last week with armv5te/qemuarm

>=20
> inherit autotools ptest
>=20
> EXTRA_OECONF =3D "--enable-tls --without-mpicc"
> -EXTRA_OECONF_armv7a =3D "--enable-tls -host=3Darmv7-none-linux-gnueabi =
--without-mpicc"
> EXTRA_OECONF +=3D =
"${@['--enable-only32bit','--enable-only64bit'][d.getVar('SITEINFO_BITS', =
True) !=3D '32']}"
> +
> +# valgrind checks host_cpu "armv7*)", so we need to over-ride the =
autotools.bbclass default --host option
> +EXTRA_OECONF_append_arm =3D " --host=3Darmv7${HOST_VENDOR}-${HOST_OS}"
> +
> EXTRA_OEMAKE =3D "-w"
>=20
> do_install_append () {
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_70194ED3-FFA3-41EE-8E53-97BAC9578256
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZziA8ACgkQuwUzVZGdMxQqfACfYlRakaN7fdWuwndzEVeqEoiS
BFUAn0MBpLylpP0lPzVm13GrtVi12stP
=96we
-----END PGP SIGNATURE-----

--Apple-Mail=_70194ED3-FFA3-41EE-8E53-97BAC9578256--
