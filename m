Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdhUJ-0000A7-CY
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 14:15:39 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so5157568eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 05:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=P8vlsJTZj/v2ym/fquKAtYSi7IMHahnwS4y6Z5VESdA=;
	b=jareQhY44A7XOh1eKh6BMHTQWf+QGgTtZ599MYCTv7L4u7RSbb3XxLvspcaDx5Te1b
	9aj8G7QFmJLFBc+POFlVhsW/Ecnwg5pHJ/PcwccrhXQix6Hx0eVD1ndCd0Bh2BOR+xd2
	/No64pmXyxOBeE3KjFey59V0cXtjmKJCg5ExT4jI8Qcal7pBNKYswDOl3PWpDahtcSqc
	jI2y8c8FQ3NchrYKksYXDWQ+Gdltfgc5hyb5Pz5lHAX44ivX3JztnSwhAg0DjqtdCcE7
	ocsavsgWN1DX7+wjhi/UhsQ1Bg/tGinoRwNC43LRMDaKU9lyyqwm7GvTtL28EM/vhAc1
	zpWg==
Received: by 10.14.216.193 with SMTP id g41mr69561650eep.37.1354107684982;
	Wed, 28 Nov 2012 05:01:24 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w3sm26121361eel.17.2012.11.28.05.01.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Nov 2012 05:01:24 -0800 (PST)
Date: Wed, 28 Nov 2012 14:01:21 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20121128130121.GC3477@jama.jama.net>
References: <alpine.DEB.2.02.1211272315510.29858@oneiric>
	<50B592B2.1060903@linux.intel.com>
	<alpine.DEB.2.02.1211280753190.407@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1211280753190.407@oneiric>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what is "packagegroup-core-nfs-server"?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2012 13:15:39 -0000
X-Groupsio-MsgNum: 31839
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L6iaP+gRLNZHKoI4"
Content-Disposition: inline

--L6iaP+gRLNZHKoI4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 28, 2012 at 07:58:45AM -0500, Robert P. J. Day wrote:
> On Tue, 27 Nov 2012, Saul Wold wrote:
>=20
> > On 11/27/2012 08:18 PM, Robert P. J. Day wrote:
> > >
> > >    poking around core-image.bbclass, and noticed this:
> > >
> > > PACKAGE_GROUP_nfs-server =3D "packagegroup-core-nfs-server"
> > >
> > > except i don't see the corresponding packagegroup-core-nfs-server.bb
> > > recipe file.  there *is* a packagegroup-core-nfs.bb file; how is the
> > > above processed?
> > >
> > It's defined in recipes-core/packagegroups/packagegroup-core-nfs.bb
> >
> > The line
> > PACKAGES =3D "${PN}-server"
> > provides the key you are looking for.
>=20
>   a followup, for which i'm quite prepared to embarrass myself --
> where is the "splash" package group defined?  i can see this in
> image.bbclass:
>=20
> SPLASH ?=3D "psplash"
> PACKAGE_GROUP_splash =3D "${SPLASH}"
>=20
> and numerous images add that "splash" package group.  but my first
> impression was that any package would be defined under some
> "packagegroups/" directory, and would necessarily need to "inherit
> packagegroup".
>=20
>   so what am i missing?

PACKAGE_GROUP_foo can be provided by any recipe, not only packagegroup-*

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--L6iaP+gRLNZHKoI4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC2CyEACgkQN1Ujt2V2gBxuLwCfWyXHOisYkOoyAeJvRpnqYIly
gvAAoJ9XNA7h+yHnRrAM4zAp4KppCyxO
=BpTd
-----END PGP SIGNATURE-----

--L6iaP+gRLNZHKoI4--
