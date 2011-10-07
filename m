Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RCE0X-0006CP-4h
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 19:14:49 +0200
Received: by mail-gx0-f175.google.com with SMTP id q1so3019435ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 10:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Wrf0upoZ3Avg+Z6WUs/jvsSNH8O6YYPbj5DBGj5Jamk=;
	b=Xdic0fvT3seahRar7ZNVJ79aCkelrcN02oh2zOYIOKC4ISafXReiR7kPjbboajI7wH
	oBtJkTt6wIXTiiLm5sTfe3LdY/uU1fUXZASlUdvoqtzCsHQC9EkHcax/8f44/EQOFv3W
	dlfXGe9q71MsqiQy6JadyoO8NYs8YflUCAHwY=
Received: by 10.223.17.20 with SMTP id q20mr4065369faa.33.1318007351288;
	Fri, 07 Oct 2011 10:09:11 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f25sm13634935faf.7.2011.10.07.10.09.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 10:09:10 -0700 (PDT)
Date: Fri, 7 Oct 2011 19:09:04 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111007170903.GA11186@jama.jama.net>
References: <cover.1317397204.git.Martin.Jansa@gmail.com>
	<e27a2c33117539c39c8c9961d0e16ca5c0bdff89.1317397204.git.Martin.Jansa@gmail.com>
	<1317999942.8533.5.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1317999942.8533.5.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [WIP][PATCH 8/9] glib: upgrade to 2.30.0
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
X-List-Received-Date: Fri, 07 Oct 2011 17:14:49 -0000
X-Groupsio-MsgNum: 10684
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 07, 2011 at 04:05:34PM +0100, Richard Purdie wrote:
> On Fri, 2011-09-30 at 17:43 +0200, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  ...003-gatomic-proper-pointer-get-cast.patch.patch |   28 ----------
> >  .../0005-glib-mkenums-interpreter.patch.patch      |   25 ---------
> >  .../60_wait-longer-for-threads-to-die.patch        |   24 +++++-----
> >  meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch |    2 -
> >  .../glib-2.0/remove.test.for.qsort_r.patch         |   53 ++++++++++++=
++++++++
> >  meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb      |   23 ---------
> >  meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb      |   41 ++++++++++++=
+++
> >  7 files changed, 106 insertions(+), 90 deletions(-)
> >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0003-gatomic-pr=
oper-pointer-get-cast.patch.patch
> >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0005-glib-mkenu=
ms-interpreter.patch.patch
> >  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/remove.test.for=
=2Eqsort_r.patch
> >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
> >  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb
>=20
> > +DEPENDS +=3D "libffi python-argparse-native"
> > +DEPENDS_virtclass-native +=3D "libffi-native python-argparse-native"
>=20
> Just to be clear on the status of this, the above dependencies present a
> problem for OE-Core :(

python-argparse: import from meta-oe, needed for newer glib
was added on top of jansa/glib branch to resolve this..

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6PMi8ACgkQN1Ujt2V2gByhGwCfTOzCDw7s33NDf8hrmNAeERre
BAYAoLg9vZsZlNHY/KZmDKk3Cm0q7bzD
=3bfr
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
