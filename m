Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0jSN-0000ZV-EX
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 01:56:19 +0100
Received: by eekd41 with SMTP id d41so875483eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 16:47:57 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.28.75 as permitted sender) client-ip=10.213.28.75; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.28.75 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.28.75])
	by 10.213.28.75 with SMTP id l11mr32935ebc.47.1330044477792 (num_hops =
	1); Thu, 23 Feb 2012 16:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tPosQfpmaunK4E5Cm55UAZZfCf/58ohni3b+ShOkpYU=;
	b=ueQ8a5D1Rf78ivykT6EfffNmlIaby66AldrJXGQeVffyHlu+3yS21LxajxtGDdJcaf
	e+JO4qM3yzD8hEIskZINGuTYqH9GvOZC2d1C2oVFCoFueGok96uVotARrdNWw261liIB
	vO/ydvDoE3yMOSBpBaR1OWKc3KWIplTfqmT+Y=
Received: by 10.213.28.75 with SMTP id l11mr21757ebc.47.1330044474263;
	Thu, 23 Feb 2012 16:47:54 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u11sm4326902eeb.1.2012.02.23.16.47.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 16:47:53 -0800 (PST)
Date: Fri, 24 Feb 2012 01:47:51 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120224004751.GD3769@jama.jama.net>
References: <cover.1329993620.git.Martin.Jansa@gmail.com>
	<9ea9d5b7ab46d2c4ea8c0b18d24a341b54248011.1329993620.git.Martin.Jansa@gmail.com>
	<1330044007.25226.16.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1330044007.25226.16.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 2/7] bitbake.conf: use weak assignment for BB_CONSOLELOG
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
X-List-Received-Date: Fri, 24 Feb 2012 00:56:19 -0000
X-Groupsio-MsgNum: 17866
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nDtE8k2pYjsRXajv"
Content-Disposition: inline

--nDtE8k2pYjsRXajv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2012 at 12:40:07AM +0000, Richard Purdie wrote:
> On Thu, 2012-02-23 at 11:43 +0100, Martin Jansa wrote:
> > * some people prefer subdirectory like /cooker/.log
>=20
> I think we should probably change that to the default actually...

But that would need to implement that directory creation if it doesn't
exist. (I have to create it manually for each build from scratch). And
because it's in bitbake then we can make this default only after
increasing required bitbake version (which we should anyway for latest
sstate changes..).

Cheers,

> Cheers,
>=20
> Richard
>=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/conf/bitbake.conf |    3 ++-
> >  1 files changed, 2 insertions(+), 1 deletions(-)
> >=20
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 90e5f7a..869b409 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -723,7 +723,8 @@ DISTRO[unexport] =3D "1"
> >  # Used by canadian-cross to handle string conversions on TARGET_ARCH w=
here needed
> >  TRANSLATED_TARGET_ARCH ??=3D "${@d.getVar('TARGET_ARCH', True).replace=
("_", "-")}"
> > =20
> > -BB_CONSOLELOG =3D "${TMPDIR}/cooker.log.${DATETIME}"
> > +# Complete output from bitbake, if you're changing it, make sure to us=
e existing directory
> > +BB_CONSOLELOG ?=3D "${TMPDIR}/cooker.log.${DATETIME}"
> > =20
> >  # Setup our default hash policy
> >  BB_SIGNATURE_HANDLER ?=3D "OEBasic"
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nDtE8k2pYjsRXajv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9G3jcACgkQN1Ujt2V2gBznaQCdEfRKi/UG6PYbGvmcQBXfek9t
CPYAn09nuRXQQ2Z5Iu/QdnB3k0zl5X1m
=BDHH
-----END PGP SIGNATURE-----

--nDtE8k2pYjsRXajv--
