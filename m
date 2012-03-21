Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SAVRR-000659-Fa
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 00:59:45 +0100
Received: by wibhj13 with SMTP id hj13so63273wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 16:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RoPXpnVHIf9ugFb61iwTMgvhTJCzLs3pxwwNx5zrmhE=;
	b=lQdizGO3SFDXkCDZBiVhIYXGFB6GTI9D6gs/bze2dBZnhSdy3Ce/dcgsYYg5KWZIUE
	V0b1fvpZVtHMj38TZdWswVLoJkUoRA+8YzBl8tXL70rVloRetm6gPbJEN9EPA88BWOrv
	rjoQQWlYDCw4Pah5jxr7ADct7PsBjUIyctnD25C7hRlLdFTk3ygiiIBeYA4UgWwyQUJP
	vpSPHr6jGetUGO0Xaf6OgA8pSSLGbgtSrJ/QcrZu+uR6sJDcU3um1OvGfQksZjwT/TNZ
	SR1O7wx6LTX4/x9TmMR6g8J89hWTrDb96lIuzLYx6CURAJpbzZ+JsSURDQZKvLNtsSzi
	XmnQ==
Received: by 10.216.132.169 with SMTP id o41mr3280786wei.121.1332373851145;
	Wed, 21 Mar 2012 16:50:51 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n8sm998232wix.10.2012.03.21.16.50.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 16:50:50 -0700 (PDT)
Date: Thu, 22 Mar 2012 00:50:49 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120321235049.GA4010@jama.jama.net>
References: <2ec6e0c134d708687c5d3d439b31607cda478dfc.1332365336.git.Martin.Jansa@gmail.com>
	<f21ffad75e377042ebb9d59a01d6b424c6bba711.1332365336.git.Martin.Jansa@gmail.com>
	<1332371476.9740.218.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1332371476.9740.218.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 06/13] gtk+: import native support from meta-oe
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
X-List-Received-Date: Wed, 21 Mar 2012 23:59:45 -0000
X-Groupsio-MsgNum: 19369
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline

--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 21, 2012 at 11:11:16PM +0000, Richard Purdie wrote:
> On Wed, 2012-03-21 at 22:36 +0100, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-gnome/gtk+/gtk+.inc |    4 ++++
> >  1 files changed, 4 insertions(+), 0 deletions(-)
>=20
> I really don't like the message having a gtk+-native around sends out.
> Why do we need this?

See cover letter if you haven't already.

>=20
> Cheers,
>=20
> Richard
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9qaVkACgkQN1Ujt2V2gBz4GACgrO/+HuwopEhSRZAqgu1SkN+v
VkIAnRHHAx4iSdAro+pFSxGoGqvU2E+S
=MJHo
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
