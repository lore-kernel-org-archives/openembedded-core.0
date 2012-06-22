Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Si5AV-0004tA-4x
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 16:49:03 +0200
Received: by werg55 with SMTP id g55so1179621wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2012 07:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KFxbGtNm/GxTrbXOE81v0Y7CvXxUR7lnu3W3FHob65E=;
	b=DWEC43WmWbOurzuSHP7751RVC4aL3vRtRhbixY6syQsdv/+sX2dHOaTcGfH3qURShd
	eeOYHh4NKUAHezI1jIPEhBE9RB/0gn07haLIZ+Utg2pMYkX1VyYaOVSdxHcEeytRBB8o
	PXlXKkwWpJV8/eDcPIuhKImPGZMtunqJE8MXvdc3VCG9+jB2im7q8CdFzbwU2McNwOLJ
	LhQ/mhUYMRYHcxfmxIs4EHjTrm/nSWBs+wZmOq3idffQz6CZPYu0FwkyCEBaAY9zA5D5
	aYCAv9lUGNGd+LXJCNE5OR9hyYAopiekgUS/BEr6XLgUGoArS5wtuNNGppwsPbYWTpSb
	bTKw==
Received: by 10.216.140.33 with SMTP id d33mr1345415wej.113.1340375892872;
	Fri, 22 Jun 2012 07:38:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id hs8sm51579836wib.10.2012.06.22.07.38.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jun 2012 07:38:12 -0700 (PDT)
Date: Fri, 22 Jun 2012 16:38:12 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120622143812.GO9352@jama.jama.net>
References: <alpine.DEB.2.02.1206210454080.17361@oneiric>
	<25294393.hmh001VYMW@helios> <1340375063.394.39.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1340375063.394.39.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: superfluous download locations in oe-core's bitbake.conf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Jun 2012 14:49:03 -0000
X-Groupsio-MsgNum: 23993
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R+Rs1qz93vBJxC1z"
Content-Disposition: inline

--R+Rs1qz93vBJxC1z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2012 at 03:24:23PM +0100, Richard Purdie wrote:
> On Fri, 2012-06-22 at 14:34 +0100, Paul Eggleton wrote:
> > On Thursday 21 June 2012 04:56:51 Robert P. J. Day wrote:
> > >   given that oe-core is defined as being a really minimal
> > > configuration with no extraneous cruft, there seems to be a number of
> > > unnecessary download locations in the shipped bitbake.conf, things
> > > like:
> > >=20
> > > ADOBE_MIRROR =3D
> > > FREEBSD_MIRROR =3D
> > >=20
> > > and so on.  obviously, they're not doing any harm but there seems to
> > > be little value in defining download locations that aren't used by
> > > anything actually in oe-core.
> >=20
> > These are present for largely historical reasons - namely in OE-Classic=
 we had=20
> > a number of recipes needing this same mirror defined and it was deemed =
that it=20
> > was easier to edit it in one place if it needed to change. Some of them=
 are=20
> > even completely useless now as the sites to which they point are now go=
ne,=20
> > e.g. HANDHELDS_CVS.
> >=20
> > I think the way to approach this would be to just submit a patch removi=
ng the=20
> > more extraneous ones and see if anyone complains. Note that some of the=
m that=20
> > aren't used in OE-Core might be used within meta-oe or other OE communi=
ty=20
> > layers, so those might need to stay at least for the time being.
>=20
> Agreed, we should clean some of these up.
>=20
> I would also add that we do have things in OE-Core without direct users
> (at least by default), particularly things like classes but also
> variables. OE-Core is a collaboration and where it makes sense to have
> something defined in one location rather than in many, I'm not adverse
> to that. Some of the mirror definitions do fit into that category.

Is there easy way for layer to define additional MIRRORs with global
scope for layer? e.g. putting them layer.conf?

e.g. FREESMARTPHONE_GIT is used in few recipes in meta-oe and in many in
meta-fso layer and right now is only defined but not used in oe-core.

So moving FREESMARTPHONE_GIT definition from oe-core to meta-oe will add
aditional dependency on meta-oe, but still better then duplicating it in
both layer or even in many .inc files.

I don't see any harm from ADOBE_MIRROR/FREEBSD_MIRROR in oe-core (even
when not used).

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--R+Rs1qz93vBJxC1z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/kg1QACgkQN1Ujt2V2gBxdKACeJgEhm+s/sO2w3e857P4CYUxD
KooAoLXFcaVKDyEU6xKWkxZIufs+8SEs
=RcsX
-----END PGP SIGNATURE-----

--R+Rs1qz93vBJxC1z--
