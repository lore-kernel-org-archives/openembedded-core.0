Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7E53A731A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 15:20:57 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id cy9so453128379pac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 07:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=9PKb3hl6LeddilVxCibuYx2rTudlim28uWx5sGPbC3g=;
	b=DzpmpkskkkQBkjVVvcd2Ma0Gd1v4aM1FtLr3BTCaHSVxsnbZqy0lKG+Z/pUptBMlxC
	UvJ0EyAhaDl1NuMGNTQmvNmr/VHSWlfteVi/W1OCqEqb4BSjlKtT5QDuObschD7so5XJ
	Xnx5AHqCEAJfQfPE6Tc2N28XD1BtGYjRdALI061Vc46K9WzSc7DeBtoOPL9oO5HbZAKj
	2K2a5nQ3hQ9+Hsqyn/kdEikWNIidaP9u5KGLsmvcFay7Ce75GsjOSteM21gGHu+6WkbG
	e3gmty4lTA2NmUo0yjRtNUmIaa9dAt0d8F7pMg7K0B4DNYnsv2ZNkQLtLawxBb6YuWWl
	E04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=9PKb3hl6LeddilVxCibuYx2rTudlim28uWx5sGPbC3g=;
	b=Uj352v3THDpW18OJTPbne3Z0hx0USeELhWeCembDa4KOMabNH4q9PQRHuZy8YFVYkz
	/JFP2fPI60tBezHf4kXNIxwqNsOtCgQiDSeNOTHjuOuD6dGY8moiPWvwZVEabgMBuPTm
	viBN034op/YfiOrRV72fLjFmruchhZ/hJOR0bWjtMmIDzqzHcNGrgdJXhP5iI0fK/SxA
	qWPAoFs03ZbSEOnyjWRxQPqwT62yr4WocBV8g2udiHS6JmZUTufMO06uz3nGIRu5X9Rm
	SDjtnWA0M5Xu64SkkaUpIGLU8dsr5IWaXO+z2LUaje67HD97JVwdmxf+aUgilZIvoQKh
	atsQ==
X-Gm-Message-State: ALoCoQk5BVetk0EBh4ROgjckAmSW5TBxbuk1bwQmGwOv5IChGOulzdlXvJ+oxmWLQ5Aly22a/3IuJgtIPLZZwpJM0zb8j2Dn1g==
X-Received: by 10.66.144.37 with SMTP id sj5mr44709767pab.69.1453216857924;
	Tue, 19 Jan 2016 07:20:57 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:2cdb:35b7:1df4:399a?
	([2601:646:8802:5d5c:2cdb:35b7:1df4:399a])
	by smtp.gmail.com with ESMTPSA id
	q27sm42237660pfi.80.2016.01.19.07.20.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jan 2016 07:20:57 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <fded6d2dc4a1c3e71d4a1ce1ed9aa985e3467a3c.1453200108.git.joshua.g.lock@intel.com>
Date: Tue, 19 Jan 2016 07:20:56 -0800
Message-Id: <E38D95F1-1BFE-4B35-9E44-10C5DFBA2054@gmail.com>
References: <cover.1453200108.git.joshua.g.lock@intel.com>
	<cover.1453200108.git.joshua.g.lock@intel.com>
	<fded6d2dc4a1c3e71d4a1ce1ed9aa985e3467a3c.1453200108.git.joshua.g.lock@intel.com>
To: Joshua Lock <joshua.g.lock@intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] uclibc: remove a use of immediate expansion and oe_filter_out ()
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
X-List-Received-Date: Tue, 19 Jan 2016 15:21:03 -0000
X-Groupsio-MsgNum: 76401
Content-Type: multipart/signed;
	boundary="Apple-Mail=_EB5DFD22-7DAA-4357-94D6-0A42CCF3C4C2";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_EB5DFD22-7DAA-4357-94D6-0A42CCF3C4C2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 19, 2016, at 2:44 AM, Joshua Lock <joshua.g.lock@intel.com> =
wrote:
>=20
> The remove overrides syntax is much clearer here, and more closely
> matches the preferred style for modern metadata.
>=20
> Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> ---
> meta/recipes-core/uclibc/uclibc.inc | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/uclibc/uclibc.inc =
b/meta/recipes-core/uclibc/uclibc.inc
> index 2b34c34..b63158a 100644
> --- a/meta/recipes-core/uclibc/uclibc.inc
> +++ b/meta/recipes-core/uclibc/uclibc.inc
> @@ -62,7 +62,7 @@ export V=3D"2"
> # -O<n> -fno-omit-frame-pointer ends up with GCC ICE on thumb as =
reported
> # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D44860
> #
> -CFLAGS_arm :=3D "${@oe_filter_out('-fno-omit-frame-pointer', =
'${CFLAGS}', d)}"
> +CFLAGS_remove_arm =3D "-fno-omit-frame-pointer=E2=80=9D

LGTM

> UCLIBC_EXTRA_CFLAGS  :=3D "${@oe_filter_out('(-I\S+|-i\S+)', =
'${CFLAGS}', d)}"
>=20
> configmangle =3D '/^KERNEL_HEADERS/d; \
> --
> 2.5.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_EB5DFD22-7DAA-4357-94D6-0A42CCF3C4C2
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaeVFgACgkQuwUzVZGdMxSmrQCaA0eDKzT0TQvvFNYX4OTizMxf
kfcAn3xI5n3cmA6ASMVOVWiWrgylktHB
=nHt5
-----END PGP SIGNATURE-----

--Apple-Mail=_EB5DFD22-7DAA-4357-94D6-0A42CCF3C4C2--
