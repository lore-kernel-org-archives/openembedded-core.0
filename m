Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id C36DB6AC36;
	Mon, 30 Mar 2015 20:06:55 +0000 (UTC)
Received: by wibgn9 with SMTP id gn9so517624wib.1;
	Mon, 30 Mar 2015 13:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pQ9Hl29OApiJ1UI3ibDKACLWG/cNwDAKlQv2C+2anqg=;
	b=qPctWibcm1FbZEiv+4VXVqxjxRkX0Fzt9rGdyze7jxSYe0diT7cPwhM9pe4T54xEQh
	BAjcL1wsuApfB0+oraVOTxoA2pQ8Dx3WJ09YfJl64nbwgj/dyvcg+D9LEH3MUWl3SwkT
	78w4laNuPirzmp2hd4n/W0qxJ5jJ1nuuRn/mL/30/fAymvdhNED6wZ9XzhjGNX0PEBsd
	qWIMA3SrGYzJf89MfKOlC+t8/az61T7M+rFfD5C7uEhiKYQiN9MhhF1gqdOvQVYE9uc1
	aILBmmjbeeudbO+KzbHFRAXdu2mLO7VniP/nSMzh/JKrsZ0VSraS2p2xCoQcRMk6EI8v
	dICQ==
X-Received: by 10.194.88.131 with SMTP id bg3mr68480005wjb.119.1427746016604; 
	Mon, 30 Mar 2015 13:06:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	pa4sm17190967wjb.11.2015.03.30.13.06.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Mar 2015 13:06:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 30 Mar 2015 22:07:18 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20150330200718.GF14928@jama>
References: <1426930147.29168.104.camel@linuxfoundation.org>
	<20150321145504.GG4738@jama> <20150323222113.GD3904@jama>
	<CAJTo0LbTfKqs_se99op6w1eA0A4_QAM5VX9VVDYJYh6+1pnyzQ@mail.gmail.com>
	<20150325161208.GK3904@jama> <20150329002843.GE2343@jama>
	<CAJTo0LZqbqThJ04OTmbrEhUQx1VaXT-9LGS-S6bosyKBmgGvFg@mail.gmail.com>
	<1A4BBFA3-A5F0-4145-A64D-326C186C51C4@gmail.com>
	<20150330184627.GD14928@jama>
	<FADF8578-9B17-41E3-A0FB-C7A132FE83A7@gmail.com>
MIME-Version: 1.0
In-Reply-To: <FADF8578-9B17-41E3-A0FB-C7A132FE83A7@gmail.com>
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
X-List-Received-Date: Mon, 30 Mar 2015 20:06:57 -0000
X-Groupsio-MsgNum: 63851
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tmoQ0UElFV5VgXgH"
Content-Disposition: inline

--tmoQ0UElFV5VgXgH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2015 at 11:49:21AM -0700, Khem Raj wrote:
>=20
> > On Mar 30, 2015, at 11:46 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> >=20
> > On Mon, Mar 30, 2015 at 09:41:30AM -0700, Khem Raj wrote:
> >>=20
> >>> On Mar 30, 2015, at 3:09 AM, Burton, Ross <ross.burton@intel.com> wro=
te:
> >>>=20
> >>>=20
> >>> On 29 March 2015 at 00:28, Martin Jansa <martin.jansa@gmail.com <mail=
to:martin.jansa@gmail.com>> wrote:
> >>> WEBOS_FONTCONFIG_CACHE =3D "${datadir}/fontconfig/cache"
> >>>=20
> >>> I'm sure there's a good reason why fontconfig caches are going in dat=
adir but I'm not sure I want to know it :)
> >>>=20
> >>=20
> >> aren=E2=80=99t they variable data files ? where else should it go othe=
rwise=20
> >=20
> > I've replied to Ross off-list because I'm not sure how much details I
> > should share, but basically we have read-only rootfs which has all the
> > font packages installed, so cache from do_rootfs should remain valid
> > forever. And we delete everything in /var during reset to factory
> > settings (that's why we had to move everything which we want to persist
> > during factory resets like this cache).
> >=20
> > We also have additional fontconfig patch which ignores timestamp
> > modifications in font directories, so that the cache is considered valid
> > even after some manual modification in rootfs (e.g. in devel images
> > which can be switched to read-write mode).
>=20
> may be copy-binds could be deployed ?

We have that but IIRC copy-binds are mounted after or at the same time
the UI is starting in our upstart scripts (to show UI as soon as possible)
and we don't want to wait for copy-binds to be finished before loading font=
config cache.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tmoQ0UElFV5VgXgH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUZrPYACgkQN1Ujt2V2gBzaVACggiLQuPIwcIpFhUVqDu/XRY6D
CNkAoLeavaf86EvrfuFiEm4ZCqRc40bv
=xf5Q
-----END PGP SIGNATURE-----

--tmoQ0UElFV5VgXgH--
