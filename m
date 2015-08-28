Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6A2A360043
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 05:54:46 +0000 (UTC)
Received: by pacdd16 with SMTP id dd16so51033190pac.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 22:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=CpzZeHI3YwI6Wb9nRx+otAz0nRNPAQhvCPgtFtjpcdQ=;
	b=n+20geW82ho1xvPpW6FSy3o8ypLDBKN0DAQ+7WtgBYqryPtRK3WpFzxKAwXxaPvTy0
	uBmE1OYwuqPVGE/1isGliONv7QGsO3aMrkN65me4X9nvBOUxixCISDV7/wbBjIe5yrdH
	dXnqSAMonK/NTgb4XKhtL8HuIEwH4tqPSRzl5l/4VSfOr/eNh7SwkA52i2F3msJkbGHx
	NxScBg2oZaVVeWEJ7zaouajPPQttr08C+4Bej/McIjWNp77if6NS5p65xlYqAtTp5Aph
	ukH9+oakEx3JudKqKAM0nJ2KqjZYoLEzWdfhDtwZi/sX+x9ArK5avYFGL936rHmnBVur
	wsGQ==
X-Received: by 10.67.30.161 with SMTP id kf1mr12450123pad.89.1440741281672;
	Thu, 27 Aug 2015 22:54:41 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:e943:4351:71e0:b332?
	([2601:646:8601:4580:e943:4351:71e0:b332])
	by smtp.gmail.com with ESMTPSA id
	hg3sm4352593pbb.52.2015.08.27.22.54.40
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Aug 2015 22:54:41 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1440686797-24415-1-git-send-email-s.mueller-klieser@phytec.de>
Date: Thu, 27 Aug 2015 22:54:39 -0700
Message-Id: <9108E719-ED79-4FE2-87B3-30373D72E7BB@gmail.com>
References: <1440686797-24415-1-git-send-email-s.mueller-klieser@phytec.de>
To: =?utf-8?Q?Stefan_M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libvorbis: remove legacy options
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
X-List-Received-Date: Fri, 28 Aug 2015 05:54:48 -0000
X-Groupsio-MsgNum: 70202
Content-Type: multipart/signed;
	boundary="Apple-Mail=_3D51A304-A707-432E-9229-ACC4399B97D7";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_3D51A304-A707-432E-9229-ACC4399B97D7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 27, 2015, at 7:46 AM, Stefan M=C3=BCller-Klieser =
<s.mueller-klieser@phytec.de> wrote:
>=20
> Those code fragments date back to ancient times. EXTRA_OECONF is not
> required anymore and we should give gcc another try to do it right.
> Testing on cortex-a8 with thumb and -O2 reveals a performance boost of
> 82 percent during encoding in comparison to -O0. -O4 gives another 7
> percent.
>=20

looks good.

> Signed-off-by: Stefan M=C3=BCller-Klieser =
<s.mueller-klieser@phytec.de>
> ---
> - this requires patch 0fe770ef9817319bb82 from master-next. It is
>  already for version 1.3.5
>=20
> meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb | 7 -------
> 1 file changed, 7 deletions(-)
>=20
> diff --git a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb =
b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
> index b7a0667..636e0f3 100644
> --- a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
> +++ b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.5.bb
> @@ -15,10 +15,3 @@ SRC_URI[md5sum] =3D =
"28cb28097c07a735d6af56e598e1c90f"
> SRC_URI[sha256sum] =3D =
"54f94a9527ff0a88477be0a71c0bab09a4c3febe0ed878b24824906cd4b0e1d1"
>=20
> inherit autotools pkgconfig
> -
> -# vorbisfile.c reveals a problem in the gcc register spilling for the
> -# thumb instruction set...
> -FULL_OPTIMIZATION_thumb =3D "-O0"
> -
> -EXTRA_OECONF =3D "--with-ogg-libraries=3D${STAGING_LIBDIR} \
> -                --with-ogg-includes=3D${STAGING_INCDIR}"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_3D51A304-A707-432E-9229-ACC4399B97D7
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXf958ACgkQuwUzVZGdMxT9lACeKfiKVVqV5Y56MiVku3ejMivS
j10AnR0E0GCaqr79p7J37ooAZFHbO6JB
=u18M
-----END PGP SIGNATURE-----

--Apple-Mail=_3D51A304-A707-432E-9229-ACC4399B97D7--
