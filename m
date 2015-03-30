Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF7C736B6;
	Mon, 30 Mar 2015 18:46:04 +0000 (UTC)
Received: by wgbdm7 with SMTP id dm7so78977173wgb.1;
	Mon, 30 Mar 2015 11:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YJKlW0CvlYHYDf/q28d/jSXNyMGl4Wr7DuFmWjpmlaA=;
	b=l/y1Gh4JqMkFgpe7Vl0QOw2vfQ2B3llZuVZa4ZJV19snGZwW9+fqR5/bkpNMWgbR5D
	Y61mCePszBzVzLiK5uIDD3LS1tbpGkmKgdhGKIeIJwmoVJ2g+x2DvlKTguvKs+Vb69tE
	z/etqCcPJUNvM5Yy7LkTPT/HInDyP27J6JTl9ldNs02EvEuiirT4WEEN52+8vdhqUr6w
	/HdLoZyz/l8DbW4sjG+DSHO7yD6PW2tQwdWXJ4L1sZg1vUcnC9Nk3097FX6ZG+UgthBR
	ZoHOuK+M1mMJRUDBba3gyTCqs8vz9oyGvdLVISIrjaV2KA5Pnh53X/1Z9fsQ23UljB16
	cUDQ==
X-Received: by 10.194.60.203 with SMTP id j11mr67872739wjr.5.1427741165811;
	Mon, 30 Mar 2015 11:46:05 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	e2sm16893967wjy.46.2015.03.30.11.46.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Mar 2015 11:46:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 30 Mar 2015 20:46:27 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20150330184627.GD14928@jama>
References: <20150316174236.48B8050234@opal.openembedded.org>
	<20150321021120.GF4738@jama>
	<1426930147.29168.104.camel@linuxfoundation.org>
	<20150321145504.GG4738@jama> <20150323222113.GD3904@jama>
	<CAJTo0LbTfKqs_se99op6w1eA0A4_QAM5VX9VVDYJYh6+1pnyzQ@mail.gmail.com>
	<20150325161208.GK3904@jama> <20150329002843.GE2343@jama>
	<CAJTo0LZqbqThJ04OTmbrEhUQx1VaXT-9LGS-S6bosyKBmgGvFg@mail.gmail.com>
	<1A4BBFA3-A5F0-4145-A64D-326C186C51C4@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1A4BBFA3-A5F0-4145-A64D-326C186C51C4@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Jonathan Liu : fontcache.bbclass: prepend to PACKAGEFUNCS instead of appending
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
X-List-Received-Date: Mon, 30 Mar 2015 18:46:07 -0000
X-Groupsio-MsgNum: 63845
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7DO5AaGCk89r4vaK"
Content-Disposition: inline

--7DO5AaGCk89r4vaK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2015 at 09:41:30AM -0700, Khem Raj wrote:
>=20
> > On Mar 30, 2015, at 3:09 AM, Burton, Ross <ross.burton@intel.com> wrote:
> >=20
> >=20
> > On 29 March 2015 at 00:28, Martin Jansa <martin.jansa@gmail.com <mailto=
:martin.jansa@gmail.com>> wrote:
> > WEBOS_FONTCONFIG_CACHE =3D "${datadir}/fontconfig/cache"
> >=20
> > I'm sure there's a good reason why fontconfig caches are going in datad=
ir but I'm not sure I want to know it :)
> >=20
>=20
> aren=E2=80=99t they variable data files ? where else should it go otherwi=
se=20

I've replied to Ross off-list because I'm not sure how much details I
should share, but basically we have read-only rootfs which has all the
font packages installed, so cache from do_rootfs should remain valid
forever. And we delete everything in /var during reset to factory
settings (that's why we had to move everything which we want to persist
during factory resets like this cache).

We also have additional fontconfig patch which ignores timestamp
modifications in font directories, so that the cache is considered valid
even after some manual modification in rootfs (e.g. in devel images
which can be switched to read-write mode).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7DO5AaGCk89r4vaK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUZmgMACgkQN1Ujt2V2gBzjawCgnCbrJB9y99Op9KbtM/GpH+O0
dDYAnj7EYK84CMBtstjUnAR9zI6GsI2r
=xCx9
-----END PGP SIGNATURE-----

--7DO5AaGCk89r4vaK--
