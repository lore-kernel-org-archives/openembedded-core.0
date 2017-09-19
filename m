Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f177.google.com (mail-yw0-f177.google.com
	[209.85.161.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8BB7665C8F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 12:39:20 +0000 (UTC)
Received: by mail-yw0-f177.google.com with SMTP id u11so2372423ywh.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 05:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=l2TI82ke4+NnEL1L8Gnq/hPPo46m5bkGY5boVjExo3w=;
	b=Dx7nBoygJ8Qea6I3WIpqPU2n0JDC9SRaUS5YQNhXL/1YzMwxr8wpT/QcMXkaFhvP2t
	8Uhphz2ZciwFtJ1N1R4FbohqTShNYEFR13gRMCNOlNsU3aHHCKWeyZN74MY2j9vCZvgh
	1g6WfHYvtu8EKA1adtIWlT9VomepClojYA/Eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=l2TI82ke4+NnEL1L8Gnq/hPPo46m5bkGY5boVjExo3w=;
	b=ffW0JRybgqe4wPtn2WnDLepGcsN9wi9x+/14Ih1DYuqclABOLKFmZMOixjHsqCFL5b
	6VzTqlxAKYkZTrM5XFizrcScS/qCdCf+XOzb099mzP1dh4ggFNOYp1LP0ZJbVYcAvQHS
	dDExrrMbzGiCkPS883NBAAHiu2U1y8FxcdQm6OGXpspSYEpQH/ISjiq3D33OTzV9QU41
	OJG0gMeyFOLzjAi8p5rAnzCgyvsGjBjvq0fOB2/0unBlGzq3W7+ppdPux/QAcTV6qVCx
	c8Zq5QFzhP0HGBiNIHbeUYHnPT6s07L9ijOwEpJLjD0u05bFXAvQKUj5pY3qKy++qLg/
	jDbA==
X-Gm-Message-State: AHPjjUiFMbi0n6zD49+wp4tipZNFZWF6mwwVwfeb7clu2qXjrPj9DuRc
	rBgrbG3NciLdmTCSyUDABTxj8Q==
X-Google-Smtp-Source: AOwi7QD8mdm334t5DN5cgh2O06WEHs0AYgySyK9qGEC9462uq5NTT7aTxlW4S3+7v+2RE/nGV9JWvQ==
X-Received: by 10.129.153.81 with SMTP id q78mr792801ywg.133.1505824761497;
	Tue, 19 Sep 2017 05:39:21 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	q188sm23344ywh.32.2017.09.19.05.39.20
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Tue, 19 Sep 2017 05:39:20 -0700 (PDT)
Date: Tue, 19 Sep 2017 08:39:20 -0400
From: Tom Rini <trini@konsulko.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20170919123920.GM17137@bill-the-cat>
References: <20170919054058.20380-1-otavio@ossystems.com.br>
	<20170919112634.GL17137@bill-the-cat>
	<CAP9ODKoSKajx42ti5DD6tEnzseF5SF=4cdU1OjEUo2at=k0jwA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoSKajx42ti5DD6tEnzseF5SF=4cdU1OjEUo2at=k0jwA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Marek Vasut <marek.vasut@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot-fw-utils: Fix cross and target builds
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
X-List-Received-Date: Tue, 19 Sep 2017 12:39:20 -0000
X-Groupsio-MsgNum: 103129
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2O+9B+xSKalj/wdD"
Content-Disposition: inline

--2O+9B+xSKalj/wdD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2017 at 08:53:38AM -0300, Otavio Salvador wrote:
> Em 19 de set de 2017 8:26 AM, "Tom Rini" <trini@konsulko.com> escreveu:
>=20
> On Tue, Sep 19, 2017 at 02:40:58AM -0300, Otavio Salvador wrote:
> >  - The environment tools target has change to envtools;
> >  - The HOSTCC variable must be used to set CC for cross;
> >  - The ARCH variable must be set for cross;
> >
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ---
> >
> >  meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
> b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
> > index c2e8f0fb84..21ab5b3e6d 100644
> > --- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
> > +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
> > @@ -5,13 +5,13 @@ DEPENDS =3D "mtd-utils"
> >
> >  INSANE_SKIP_${PN} =3D "already-stripped"
> >  EXTRA_OEMAKE_class-target =3D 'CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D"=
${CC}
> ${CFLAGS} ${LDFLAGS}" HOSTCC=3D"${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLA=
GS}"
> V=3D1'
> > -EXTRA_OEMAKE_class-cross =3D 'ARCH=3D${TARGET_ARCH} CC=3D"${CC} ${CFLA=
GS}
> ${LDFLAGS}" V=3D1'
> > +EXTRA_OEMAKE_class-cross =3D 'ARCH=3D${ARCH} HOSTCC=3D"${CC} ${CFLAGS}
> ${LDFLAGS}" V=3D0'
>=20
> Since we're messing with this, U-Boot's build system doesn't take ARCH.
> It's one of the variables that you pick in Kconfig, not set so that
> arch/$(ARCH)/Kconfig is sourced.  We should drop that.
>=20
>=20
> You can't. Try dropping it...

I've never ever built U-Boot with ARCH=3D, so, what's going on in OE land?

--=20
Tom

--2O+9B+xSKalj/wdD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZwQ/4AAoJEIf59jXTHXZSP/IP/jkQqoGOhD13rgRwLJISRVm4
/2eDzYyFd2qKb1AvEAfwHDOy+8ZfHJhXTxZLsh5XL077KZIfz9SQVGy8RbpIyhgX
kGO+hvkbqzW9hkMt5T/CNa5V+I1p9kmIDnUjqE9XM/i3S5twpa2RbYbPgj4KDNNh
bd9usHbQ8VKelOYzD6avzf5uoBPKcUan6knIwbI4tyOfxcdmn4whGssc0cQAno80
3xLC4VIGPkTrnV/8PXNUx6sZBKwMURNX5B83cNIWwDg9bTmiMa3GTGPOd0fsbwsi
1+w7pa861uYMhjJoMe99VpmoYXwkpoM7wZ9vFNFt7vDtpztIFl6Ywib9CNo47VVC
f3JVhqv/UfcjE+IEKmMagAfL/aqBmy8w7XAsxGY623LDirOLChfrMYvPfIw3kkfo
ILtWPAp3GK+ZlPzow0qlmjU/0COwNEYFxUFkAlfLpI89um2VDTUjl3yjjyS9R/ep
L65sFiJzCoNmaXyeFvARth24zTTX8nWoML1WEo0thucXS8LTFgQAWeFI8Ki2djP+
ph6sCJzOM3eqRECbXmr33SIGsJfQ06pXUc5v1bp8cPJ+nvjwerszElgOJ6NKc+wF
IRR1j5gaXItmSr9W8vj3/SxSVoyHsBSFZ4rMDBO7EIfQlmmsY26/A5TuhhAcMxwC
llcyAfev52o3+UBQNfb8
=QvUv
-----END PGP SIGNATURE-----

--2O+9B+xSKalj/wdD--
