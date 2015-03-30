Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id B3BD76013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 17:27:36 +0000 (UTC)
Received: by wgdm6 with SMTP id m6so183160779wgd.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 10:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lx2gXwvlzwRc8+Z/2Cxsi4ygopggJglJDFujzaugpBA=;
	b=GbRuONAf+EZzstfqvp86l4nh/cbFlogLy/YcL0TKZXGal3G7H1PXBxPqM04Yt2i7hN
	f+0+6uN/kalZkylemQy+43clEu7tV5l966Z2G/tZIfPKQyrylpVBeOIusM69lJQ+fc1/
	k128umK8w9hcCz8esmQgXFWkBCZCj6MEvoTsYrCKqYTI49qdWkNq4UnsTip0P9ZEzf7l
	P/jbKqHRMPTEKX+CRSND9aKBfLYgzcSATIT1/1TydUqcIfjbBlJ5qqfIb++2npiFvVZW
	t7i+dtsZKWUMozkZj0FjEQpmv7OeUTMZBiDSdPQQ/nzCeatc7297no/KB288qWIpDF50
	ghtg==
X-Received: by 10.180.228.36 with SMTP id sf4mr23541196wic.19.1427736457499;
	Mon, 30 Mar 2015 10:27:37 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	uo6sm16627553wjc.49.2015.03.30.10.27.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Mar 2015 10:27:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 30 Mar 2015 19:27:59 +0200
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20150330172759.GC14928@jama>
References: <20150329002843.GE2343@jama>
	<1427592440-2658-1-git-send-email-Martin.Jansa@gmail.com>
	<CAJTo0LapenBOp41wqa=rBaekDOO3urO5EvoHoiG68eNiC+p12Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LapenBOp41wqa=rBaekDOO3urO5EvoHoiG68eNiC+p12Q@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] fontcache: allow to pass different fontconfig cache dir
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
X-List-Received-Date: Mon, 30 Mar 2015 17:27:39 -0000
X-Groupsio-MsgNum: 63839
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bAmEntskrkuBymla"
Content-Disposition: inline

--bAmEntskrkuBymla
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2015 at 11:47:39AM +0100, Burton, Ross wrote:
> On 29 March 2015 at 02:27, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > +FONTCONFIG_CACHE_DIR ?=3D "${localstatedir}/cache/fontconfig"
> >
>=20
> So how is fontconfig told to read fonts from this location?

I think it's the same
--with-cache-dir
parameter which says where to generate the cache and then read it in
runtime.

I didn't change it in fontconfig recipe, because the default is already
matching with FONTCONFIG_CACHE_DIR, do you want me to pass
--with-cache-dir parameter? I agree that it could be less surprising for
people who want to change it, but on the other hand if upstream moves
default cache location in some newer fontconfig version, then the person
updating the recipe should check FONTCONFIG_CACHE_DIR value as well.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bAmEntskrkuBymla
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUZh58ACgkQN1Ujt2V2gBw6agCfXZZV8OIjSEunJWMrWSaxDAAj
SAEAoK+MEgHD1qr+6p27ocR3L9f+fV7Z
=HQO1
-----END PGP SIGNATURE-----

--bAmEntskrkuBymla--
