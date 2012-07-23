Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1StH1X-0002eK-99; Mon, 23 Jul 2012 13:42:03 +0200
Received: by bkcik5 with SMTP id ik5so3980988bkc.6
	for <multiple recipients>; Mon, 23 Jul 2012 04:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MlrEswqLRTmDph/KNZiIcQ8GjB8CnrCycsjDYk85Thc=;
	b=XRtGlAPZwCe5L0Q+oEpVbvFBMpKbUwwOmJpJ2yu2FfD7PGZwXZeOlON7xYg+s3i/Zq
	ZgWgfRwyiSTYoJw1POEtvdCuKsd4BR4xIsQdgz9iNwv+hMJNT6+uckwvxGhJDqqOSf4h
	2coH7/lThH+1wyxUb6YaCX1yePzagfsd8BcTaqadoJLQKefpqmooRiS1xRVrv96OdliE
	xRgVzDfBY0EpgMaJwxGpSmp4dZHtSvzyZdKdsVIELCGtlKcfwPr8lNXSsGpahVUXnZgN
	CiPInZxLoWTSh6rczFTfg9MGRlK74qMA3DfKucCbVqBa1dLEAANbPVP0P51e81quSQ38
	r3MA==
Received: by 10.204.154.73 with SMTP id n9mr7449298bkw.113.1343043036432;
	Mon, 23 Jul 2012 04:30:36 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 14sm7077944bkq.12.2012.07.23.04.30.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jul 2012 04:30:35 -0700 (PDT)
Date: Mon, 23 Jul 2012 13:30:34 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120723113034.GD3271@jama.jama.net>
References: <20120722104320.C057610218@opal>
	<20120723081543.GA3271@jama.jama.net>
	<CAJTo0LYK43FiO-iJ3wQf3Dsid14ckSkW9cAGhKtBUV8sDACd2Q@mail.gmail.com>
	<20120723091809.GC3271@jama.jama.net>
	<CAJTo0LbGnXz1UeVv6etPOsTVpi_mtFhBNLSDHeKK1Ci10zKOwg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbGnXz1UeVv6etPOsTVpi_mtFhBNLSDHeKK1Ci10zKOwg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Ross Burton : Add gtk-doc-stub
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
X-List-Received-Date: Mon, 23 Jul 2012 11:42:03 -0000
X-Groupsio-MsgNum: 25992
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eqp4TxRxnD4KrmFZ"
Content-Disposition: inline

--eqp4TxRxnD4KrmFZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 23, 2012 at 10:40:39AM +0100, Burton, Ross wrote:
> On 23 July 2012 10:18, Martin Jansa <martin.jansa@gmail.com> wrote:
> > For some reason non-native gtk-doc-stub is pulled to image dependency
> > tree for me after last oe-core changes. I'll check dep graph.. if that's
> > not expected.
>=20
> It's not in the core-image-sato dependencies according to depexp.  If
> you could see what pulls it in for you that would be much appreciated
> (I suspect some development task).

That's probably because of one of those:
OE @ ~/meta-openembedded $ git grep DEPENDS.*gtk-doc
meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.3.bb:DEPENDS =3D "libgnome=
canvas libbonobo libgnome glib-2.0 gtk-doc gconf libxml2 libglade"
meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb:DEPENDS =3D "libidl popt =
gtk-doc ${IDL_COMPILER_DEPENDS}"
meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb:DEPENDS_virtclass-native =
=3D "libidl-native popt-native gtk-doc-native"
meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb:DEPENDS =3D "g=
tk+ cairo libxinerama libxcomposite libxrender gtk-doc"

In my case it was libgpewidget which is dependency of fbreader..

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eqp4TxRxnD4KrmFZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlANNdoACgkQN1Ujt2V2gBzl6gCgpqYhvNAMbphOSve1rtfizS9P
b8wAoJu5nheLdZY8hUJfzv1oEmvQh/0t
=Kf5Y
-----END PGP SIGNATURE-----

--eqp4TxRxnD4KrmFZ--
