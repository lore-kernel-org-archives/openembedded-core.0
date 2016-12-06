Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 620D271A5B;
	Tue,  6 Dec 2016 14:43:57 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id xy5so44289889wjc.1;
	Tue, 06 Dec 2016 06:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=mqdIer2FgPUN3UoQz9GgIjQczD3vvKgeoAi21yW2vnw=;
	b=yv3HmPJTof+vafflyMC4/mk+sGmYgGToKlJqsvILXZtbF9WYmjbUBQO4DJs76gdaot
	tS5WM0zqhvv+eXWoJZ9dLJ0EW11s1braA8P5lwNbo8qigFuP9tFJKI6I/PTO28aDNH/+
	HdLfGewYDIk3KyeUCI30WAOJJeVqqnDdiurcllULfu2Jgu6Cu+0H2iQuwXulDRRDCCRc
	mkFMOGbk1Hl0v+IcefddKZ8L+R7YiWDdFF1UhzXOniYzLUmuN5EREKRCEPl9jTGQ5nFC
	6MgTBGwhQq7YGZeOWYI+a/Plx3TgC5fsbGjqyDdZo23uS437STZt/0o2fvXbqNsWi4WP
	ZRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=mqdIer2FgPUN3UoQz9GgIjQczD3vvKgeoAi21yW2vnw=;
	b=CsMqjodv1hqr54z8Y9dZUgNaYbAjK2CAMh0i0p/zc0zVn7fLpGqFtc0vUnEmknzKpe
	3J9Ad4oRe2uAoKSE8MC7EH98StlbBsOXl0kN3W/ErR5ecmW9mepqLZIjWuDSwqN+oBtW
	DQVo5/OXl7erLP1CrQ1Hzbig0FoQqfH2kC+t2d8MrZvbZCWOnj1itiyIL/jMKF68quZv
	LBq2ACuqJ7BCndyMvFqk+kGOvrWoPq+1VZ6+HVuUCu88/wx5zwPX2Kb3SJJ1594SJmjl
	7g3vuyejR3yMrfrc0me1OaKf0llfN6wSzKSwyo8B/McugGj9+zz6z0JD1ySo5Rlp2RBP
	eKWQ==
X-Gm-Message-State: AKaTC01y0TagiijLYKmBHJ/UFxplbJ+YkfAy37KFsUJ3M44warrR/B7yF8PnsAYFMI8jKA==
X-Received: by 10.194.157.3 with SMTP id wi3mr54766705wjb.0.1481035438917;
	Tue, 06 Dec 2016 06:43:58 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	n17sm26173805wjq.6.2016.12.06.06.43.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Dec 2016 06:43:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 6 Dec 2016 15:44:00 +0100
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20161206144400.GB3255@jama>
References: <20161130154845.8882.9798@opal.openembedded.org>
	<20161130154913.0EEAE50166@opal.openembedded.org>
	<20161206134904.GA3255@jama>
MIME-Version: 1.0
In-Reply-To: <20161206134904.GA3255@jama>
User-Agent: Mutt/1.7.1 (2016-10-04)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 67/76: gnutls: update to 3.5.6
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
X-List-Received-Date: Tue, 06 Dec 2016 14:43:58 -0000
X-Groupsio-MsgNum: 90287
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1LKvkjL3sHcu1TtY"
Content-Disposition: inline

--1LKvkjL3sHcu1TtY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 06, 2016 at 02:49:04PM +0100, Martin Jansa wrote:
> On Wed, Nov 30, 2016 at 03:49:52PM +0000, git@git.openembedded.org wrote:
> > rpurdie pushed a commit to branch master
> > in repository openembedded-core.
> >=20
> > commit 27f306a752d15ec62d2821d0146be4ffa10b7013
> > Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> > AuthorDate: Mon Nov 28 15:34:20 2016 +0200
> >=20
> >     gnutls: update to 3.5.6
> >    =20
> >     Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> >     Signed-off-by: Ross Burton <ross.burton@intel.com>
>=20
> Anyone else also seeing this?
>=20
> configure:9271: result: no
> configure:9337: checking for NETTLE
> configure:9345: $PKG_CONFIG --exists --print-errors "nettle >=3D 3.1"
> configure:9348: $? =3D 0
> configure:9363: $PKG_CONFIG --exists --print-errors "nettle >=3D 3.1"
> configure:9366: $? =3D 0
> configure:9412: result: yes
> configure:9418: checking for HOGWEED
> configure:9426: $PKG_CONFIG --exists --print-errors "hogweed >=3D 3.1"
> Package hogweed was not found in the pkg-config search path.
> Perhaps you should add the directory containing `hogweed.pc'
> to the PKG_CONFIG_PATH environment variable
> No package 'hogweed' found
> configure:9429: $? =3D 1
> configure:9444: $PKG_CONFIG --exists --print-errors "hogweed >=3D 3.1"
> Package hogweed was not found in the pkg-config search path.
> Perhaps you should add the directory containing `hogweed.pc'
> to the PKG_CONFIG_PATH environment variable
> No package 'hogweed' found
> configure:9447: $? =3D 1
> No package 'hogweed' found
> configure:9475: result: no
> configure:9478: error:
>   ***
>   *** Libhogweed (nettle's companion library) was not found. Note that
> you must compile nettle with gmp support.

Probably caused by nettle upgrade which no longer enables gmp with older
gmp 4.2.1 used in non-GPLv3 builds.

checking for __gmpz_powm_sec in -lgmp... no
configure: WARNING: GNU MP not found, or too old. GMP-5.0 or later is neede=
d, see http://gmplib.org/.
    Support for public key algorithms will be unavailable.
configure: Looking for assembler files in arm.

switching to older nettle 2.7.1 doesn't help, because nettle 3.1 is require=
d by gnutls..

| checking for NETTLE... no
| configure: error:
|   ***
|   *** Libnettle 3.1 was not found.

 nettle 3.1 is required by gnutls..

> >  meta/recipes-support/gnutls/{gnutls_3.5.5.bb =3D> gnutls_3.5.6.bb} | 4=
 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/recipes-support/gnutls/gnutls_3.5.5.bb b/meta/recipes=
-support/gnutls/gnutls_3.5.6.bb
> > similarity index 60%
> > rename from meta/recipes-support/gnutls/gnutls_3.5.5.bb
> > rename to meta/recipes-support/gnutls/gnutls_3.5.6.bb
> > index d255959..2e70734 100644
> > --- a/meta/recipes-support/gnutls/gnutls_3.5.5.bb
> > +++ b/meta/recipes-support/gnutls/gnutls_3.5.6.bb
> > @@ -4,6 +4,6 @@ SRC_URI +=3D "file://correct_rpl_gettimeofday_signature=
=2Epatch \
> >              file://0001-configure.ac-fix-sed-command.patch \
> >              file://use-pkg-config-to-locate-zlib.patch \
> >             "
> > -SRC_URI[md5sum] =3D "fb84c4d7922c1545da8dda4dcb9487d4"
> > -SRC_URI[sha256sum] =3D "86994fe7804ee16d2811e366b9bf2f75304f8e470ae0e3=
716d60ffeedac0e529"
> > +SRC_URI[md5sum] =3D "7a38b23757aae009c3eb5bb12fb0afda"
> > +SRC_URI[sha256sum] =3D "6338b715bf31c758606ffa489c7f87ee1beab947114fbd=
2ffefd73170a8c6b9a"
> > =20
> >=20
> > --=20
> > To stop receiving notification emails like this one, please contact
> > the administrator of this repository.
> > --=20
> > _______________________________________________
> > Openembedded-commits mailing list
> > Openembedded-commits@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1LKvkjL3sHcu1TtY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWEbOVAAKCRA3VSO3ZXaA
HMEoAJ9P6ci72IAMg/21VaAGlSLshoZ/mACgmwRHbzV+NQaJlL1NiLyrHkr3BfY=
=lo9W
-----END PGP SIGNATURE-----

--1LKvkjL3sHcu1TtY--
