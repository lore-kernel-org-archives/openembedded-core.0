Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 78F1E6CEE4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 16:29:17 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id b57so800214eek.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2014 08:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NFL52oPk49FaJv+lFEJUQZdfiyfvO7Hwzhrik+DA3Zc=;
	b=r0FlAPXRVOyPY8q4Vbf7rSrry85KVATED+j8AZT5sI9SPZ7n+HI30Nj/MOKACB+RYf
	Nd3Qe8rWjWlAeX5NxMUBvBwPFjrz9WEcKUvHNXwtlCoWZl0MRy/2MinVCjULbm5qnCeX
	KnVaLlB7D8mrt3pQuESr8tSxrmr+Yx933yEjVbPzK80hTVQ4H1UOND0NLOlty9HqW0Br
	E0AzqGdJTDzN7dI88UVQPDkqd6C7KoYvXTTU2UBeoSthRRSDIj1D3Zqdmna+b4hWyJr2
	g8pI3BoREZnnO1hkgFSg8XA8HRiLvmm83rYx9vIt8Yaufgju2hUgJ12Yx0KbVE6f+Dfy
	Hvlg==
X-Received: by 10.14.115.133 with SMTP id e5mr26848103eeh.91.1389198556956;
	Wed, 08 Jan 2014 08:29:16 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id o13sm9775596eex.19.2014.01.08.08.29.15
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Jan 2014 08:29:15 -0800 (PST)
Date: Wed, 8 Jan 2014 17:29:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20140108162926.GA3709@jama>
References: <52CC470A.9030302@linaro.org>
 <1759035.6JVm74GdRW@helios>
MIME-Version: 1.0
In-Reply-To: <1759035.6JVm74GdRW@helios>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Qt in OE-core
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
X-List-Received-Date: Wed, 08 Jan 2014 16:29:17 -0000
X-Groupsio-MsgNum: 48716
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k/A+UfywgnnvevLW"
Content-Disposition: inline

--k/A+UfywgnnvevLW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 08, 2014 at 03:56:04PM +0000, Paul Eggleton wrote:
> Hi all,
>=20
> On Tuesday 07 January 2014 13:27:22 Trevor Woerner wrote:
> > question:
> > Should some version of Qt be included in openembedded-core, or should
> > all recipes to add Qt be part of their own version-specific Qt layer?
> >=20
> > background:
> > openembedded-core[1] used to include recipes for Qt3, but as Qt3 became
> > old these recipes were replaced with Qt4 and the Qt3 support was broken
> > out into its own layer[2]. We're now at a point where Qt4 is getting old
> > and Qt5 is "current". At some point we'll have to replace the Qt4
> > support in [1] with support for Qt5. But we expect users will still want
> > to use Qt4, so if the Qt4 support in [1] is replaced by support for Qt5,
> > the Qt4 support will need to be broken out into its own layer. Qt5
> > support is currently being developed on it's own layer[3].
> >=20
> > This email thread is *not* to discuss when we should replace Qt4 with
> > Qt5, then question is: should [1] include *any* Qt support, or should Qt
> > be always in its own layer to be added as required by the distribution?
> >=20
> > If we decide [1] should provide some Qt support, then we can discuss
> > when we should replace the Qt4 support with Qt5 in [1]. But for now it
> > would be nice to reach a consensus on whether or not [1] should include
> > any Qt support at all or if it wouldn't just be easier to always have Qt
> > support in its own version-specific layers to be added as required (if
> > needed) by the distribution configuration.
>=20
> I can see some benefits to having Qt in a separate layer, and this is not=
 the=20
> first time this question has come up. However, one concern I have always =
had=20
> with Qt being moved out of OE-Core though is that I very much doubt the s=
ame=20
> will happen with GTK+ and GNOME UI components that we carry, which I thin=
k=20
> will lead to the (perhaps erroneous, but logical) assumption in new users=
'=20
> minds that we support or recommend these more than we do Qt. Given Qt's=
=20
> popularity in the embedded space I don't think this would be the right me=
ssage=20
> to be sending out.
>=20
> Any concrete ideas on how we would address this perception issue?

Link to layerindex in meta/recipes-qt/qt5 directory? :)

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--k/A+UfywgnnvevLW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLNfOYACgkQN1Ujt2V2gBzoZwCgjS4+Na2oymDXk2ReKSAMBtK2
XB8Anion5goAdcvJ9Ux0NwPsf2luX1NK
=Gfeq
-----END PGP SIGNATURE-----

--k/A+UfywgnnvevLW--
