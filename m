Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id A0B946010D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 02:47:31 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id bz2so13260849pad.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 19:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=myULeAKiRmQD2qpN/Mb8s2OLXXqfYapNSrawqvjXg3Y=;
	b=l17FHM9bPBqeclyV6Iv9JsnxrA4fDAuQxdnW60rAtuSRhMRwB82FGv0pBhxXaKV5jr
	gcApwqV1uYLZpXi2H7f56ygUsDJCy7XbtJoF25SyFv0/VwjzpEDg96MZh5taEl/V4Mbw
	xUYmHQ9VywNMxRiyDp33BouTP/IU/3e87Vx06jnP8jXW3bU5/i5dxhZFDNSIk9QlPH1d
	1af6O32E/xx7Q1jGyaExOFOiGoBnzOn1SpaNNrekr3+mbOD5IHjEOCl9e8DfRa9Rlwa1
	L1BCwximTcNdTbn90GNkvPCg0FpeI3DUoFX7OySp0umBWOFc7FjkZcgDRtLnC+SCZW+7
	b22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=myULeAKiRmQD2qpN/Mb8s2OLXXqfYapNSrawqvjXg3Y=;
	b=Mgeg8OnNTmmT2eRFJsBBgIzYBFHjoaQmI9DmEKDmvaIWJfqYfikSegzBR5P0pkey1L
	USEv99INhuqgxHHIoaFPDIDPqbvaC2POrSGajNm6Lq/mC5oVkqpY19D67CJHJZawoOje
	gvUOuyzHceaHTPiDZAaze9gl7Rk9sk8XRNN9q6TVFQCeZJqzylVUJ9ylLuKt0i6B/fKa
	O5s9kEidwmBohK6lRBMrpoaYBqapomm9O7K6Va8T564++Zr1hHMwTywzpJBKUgKngvUw
	6MfvZEKT6lFWkUNKAuBhkqQ3HUm6B9qwid3NRXIPxzf68QjwA0bjIco18lCA/jtfn0Al
	v+Dw==
X-Gm-Message-State: ALyK8tKHKkgcwkQbPz2+JoKRZJ+g1DHskbUvea/1V2/0DpbyzHbT1WrNqD5upVHNQY+e0g==
X-Received: by 10.66.164.195 with SMTP id ys3mr2266948pab.97.1466045252226;
	Wed, 15 Jun 2016 19:47:32 -0700 (PDT)
Received: from [192.168.0.6] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	b186sm56040246pfa.61.2016.06.15.19.47.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Jun 2016 19:47:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1465895420-1660-1-git-send-email-anujx.mittal@intel.com>
Date: Wed, 15 Jun 2016 19:47:25 -0700
Message-Id: <2CA6588C-87EE-4A88-9669-024C67DB9B8C@gmail.com>
References: <1465895420-1660-1-git-send-email-anujx.mittal@intel.com>
To: Anuj Mittal <anujx.mittal@intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc: make sure header path is set correctly
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
X-List-Received-Date: Thu, 16 Jun 2016 02:47:33 -0000
X-Groupsio-MsgNum: 83492
Content-Type: multipart/signed;
	boundary="Apple-Mail=_45E032AB-51DF-4A82-BDE4-B003826E733C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_45E032AB-51DF-4A82-BDE4-B003826E733C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jun 14, 2016, at 2:10 AM, Anuj Mittal <anujx.mittal@intel.com> =
wrote:
>=20
> We're setting the native header paths in do_configure_prepend,
> and don't need to set them again here.
>=20
> This results in gcc-target not being able to locate the headers
> and not being able to detect glibc version, which in turn
> results in SSP support not getting detected even though it's available
> in libc.
>=20

what is this being set to in do_conigure_prepend ?
that value may not be right for target recipe. For target we are setting =
sysroot to /
and if we do not have this option set then it will set =
native-system-headers dir to be
/ relative and not cross sysroot relative. So it will use your build =
hosts installation
for these headers which is not correct either. Have you looked deeper =
into why its not
finding ssp support inside the cross sysroot?

> Signed-off-by: Anuj Mittal <anujx.mittal@intel.com>
> ---
> meta/recipes-devtools/gcc/gcc-target.inc | 1 -
> 1 file changed, 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc =
b/meta/recipes-devtools/gcc/gcc-target.inc
> index a960ed4..37c5c62 100644
> --- a/meta/recipes-devtools/gcc/gcc-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> @@ -4,7 +4,6 @@ require gcc-configure-common.inc
> EXTRA_OECONF_PATHS =3D "\
>     --with-sysroot=3D/ \
>     --with-build-sysroot=3D${STAGING_DIR_TARGET} \
> -    =
--with-native-system-header-dir=3D${STAGING_DIR_TARGET}${target_includedir=
} \
>     --with-gxx-include-dir=3D${includedir}/c++/${BINV} \
> "
>=20
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_45E032AB-51DF-4A82-BDE4-B003826E733C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAldiE0IACgkQuwUzVZGdMxRopwCgiAbOmoO8wrC90+1qPElSZiM2
4cYAn1jnPaVvHSxlfOPXo6khlwR8dYpM
=v7QP
-----END PGP SIGNATURE-----

--Apple-Mail=_45E032AB-51DF-4A82-BDE4-B003826E733C--
