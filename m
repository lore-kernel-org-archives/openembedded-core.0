Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id E92797319C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 05:17:01 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id v86so42878838pfa.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 21:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Mk0rZvw+XY56FxbUXi1Yx1h4EhWn9be7SydC/wmNR4k=;
	b=r6RnKsyzxmOfhJMNzL7WGHqpOMuzrgVLpJTKXyRfE+ZPhg09RzB4E69aTeYsR4JVsC
	ZlA+nsuM9zQNt5lmZ3udsr18FLNy4dTfm3ekQCei9PjAOIOYQFcSK+CuBsuneubu2IBf
	lsE9Qz+Ccuup3AhzatXtjq3cmLmuT2Cj25OjTPt9msq9niZ8Cn0vapNIeZw1SmFdtd48
	0uDeBO4CK1juWfKwieurdIcSQYKK+itKcnjxjLKC5KBoVE/LPJ5frb+u0AdvrgPRV09q
	e/CrtobAUrdpH1kv0Kcs9cDLiTRRVZLL4Kgv12DdtVGRDHTXfpFzO+vxXsad05ISmVUM
	Z4WA==
X-Received: by 10.98.44.15 with SMTP id s15mr2439244pfs.2.1450415822770;
	Thu, 17 Dec 2015 21:17:02 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:3df1:6e85:f350:aa60?
	([2601:646:8802:5d5c:3df1:6e85:f350:aa60])
	by smtp.gmail.com with ESMTPSA id
	87sm14725617pfp.38.2015.12.17.21.17.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Dec 2015 21:17:01 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1450413723-22208-4-git-send-email-armccurdy@gmail.com>
Date: Thu, 17 Dec 2015 21:17:01 -0800
Message-Id: <FB8878E7-D891-4BB0-A20A-E3536DBF316F@gmail.com>
References: <1450413723-22208-1-git-send-email-armccurdy@gmail.com>
	<1450413723-22208-4-git-send-email-armccurdy@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4 v3] valgrind: don't restrict to armv7a
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
X-List-Received-Date: Fri, 18 Dec 2015 05:17:02 -0000
X-Groupsio-MsgNum: 74969
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D7E413D3-6704-452F-8640-CE6C467FF9C1";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_D7E413D3-6704-452F-8640-CE6C467FF9C1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Dec 17, 2015, at 8:42 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> Valgrind has been tested on armv5te/qemuarm, so it seems
> that valgrind's configure check for armv7 is over cautious.
>=20
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
> meta/recipes-devtools/valgrind/valgrind_3.11.0.bb | 8 +++++---
> 1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb =
b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
> index 3dc3cc1..bb3f6e1 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
> @@ -26,14 +26,16 @@ SRC_URI =3D =
"http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
> SRC_URI[md5sum] =3D "4ea62074da73ae82e0162d6550d3f129"
> SRC_URI[sha256sum] =3D =
"6c396271a8c1ddd5a6fb9abe714ea1e8a86fce85b30ab26b4266aeb4c2413b42"
>=20
> -COMPATIBLE_HOST =3D '(i.86|x86_64|mips|powerpc|powerpc64).*-linux'
> -COMPATIBLE_HOST_armv7a =3D 'arm.*-linux'
> +COMPATIBLE_HOST =3D =
'(i.86|x86_64|arm|mips|powerpc|powerpc64).*-linux'
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
> +EXTRA_OECONF_append_arm =3D " =
--host=3Darmv7${HOST_VENDOR}-${HOST_OS}=E2=80=9D

this could be problematic for arm < v7

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


--Apple-Mail=_D7E413D3-6704-452F-8640-CE6C467FF9C1
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZzls0ACgkQuwUzVZGdMxQbgQCfWXmd14uW2MaoMfTjTIWVl1PZ
4D0AnjvZMNPy2d6KrQMh9E2hW57mMNLn
=93zT
-----END PGP SIGNATURE-----

--Apple-Mail=_D7E413D3-6704-452F-8640-CE6C467FF9C1--
