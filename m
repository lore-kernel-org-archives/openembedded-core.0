Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrGaz-0002dN-IU
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 00:50:21 +0200
Received: by weyr6 with SMTP id r6so560594wey.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 15:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3sMuwCAUWYf5mTPPe5rMqTmuJz8uLkQZPyty3nURba8=;
	b=TTqWNLA01f/hKVIddbXum6GwRiNuIoM+gQQP+cVHbMc1Q9nvpKKYGmOOAJxM+Q6o8n
	WAXwWN4gmfLVmHMkipm9S2pFG5ET0ye9WigTPzCcOre5jUt1ktXttlyR0py1p/wVHA9C
	N8vBZE6Os+gJ+FcJRP0vyYHWHBYpqP/A4py8srGBLV8XCAcsICm7tR4E2ULQrPHk3KEU
	5lWfPCyApYLewMtcJqCI09Jj42DruKhp8N46/OaoXjEjJNpJ6K5EP2hGWpBmeJOsfIOh
	2pXg2A2bOVQqUsJJz+oWwWEYmHEX3t+WGW6b8OReYR88GazcZYSlF7oLCMfBA55uNDhQ
	V7QA==
Received: by 10.180.97.106 with SMTP id dz10mr1335410wib.21.1342564741842;
	Tue, 17 Jul 2012 15:39:01 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j6sm43320607wiy.4.2012.07.17.15.39.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 15:39:00 -0700 (PDT)
Date: Wed, 18 Jul 2012 00:39:10 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120717223910.GE22569@jama.jama.net>
References: <1342563792-17634-1-git-send-email-damien.lespiau@gmail.com>
	<20120717222804.GD22569@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120717222804.GD22569@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Damien Lespiau <damien.lespiau@intel.com>
Subject: Re: [PATCH] eglic: Update the svn URL
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
X-List-Received-Date: Tue, 17 Jul 2012 22:50:21 -0000
X-Groupsio-MsgNum: 25565
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hUH5gZbnpyIv7Mn4"
Content-Disposition: inline

--hUH5gZbnpyIv7Mn4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 18, 2012 at 12:28:04AM +0200, Martin Jansa wrote:
> On Tue, Jul 17, 2012 at 11:23:12PM +0100, Damien Lespiau wrote:
> > From: Damien Lespiau <damien.lespiau@intel.com>
> >=20
> > Apparently, you can't be checkout eglibc at this URL anymore:
> >=20
> > STDERR: svn: E170000: URL 'svn://www.eglibc.org/svn/branches/eglibc-2_1=
5' doesn't exist
> >=20
> > eglibc.org does give http access to the repository, but you have to use
> > the http:// scheme.
> >=20
> > So let's change both 2.15 and 2.16 recipes.
>=20
> How did you test this change? svn:// is right (it's checkout from
> subverion), what's wrong is your bitbake version not respecting
> protocol=3Dhttp param to checkout from subversion using http backend.
>=20
> If you change SRC_URI to start with http:// then wget will be used to
> download that and of course it will fail as there is no eglibc source on
> http://www.eglibc.org/svn/branches url.

It's a bit worse.. this patch didn't make it to V2
http://patchwork.openembedded.org/patch/31617/

Apply this to your bitbake:
http://patchwork.openembedded.org/patch/32325/

Cheers,

>=20
> Cheers,
>=20
> >=20
> > Signed-off-by: Damien Lespiau <damien.lespiau@intel.com>
> > ---
> >  meta/recipes-core/eglibc/eglibc_2.15.bb |    2 +-
> >  meta/recipes-core/eglibc/eglibc_2.16.bb |    2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-cor=
e/eglibc/eglibc_2.15.bb
> > index 110febf..16b3fa1 100644
> > --- a/meta/recipes-core/eglibc/eglibc_2.15.bb
> > +++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
> > @@ -7,7 +7,7 @@ PR =3D "r12"
> >  PR_append =3D "+svnr${SRCPV}"
> > =20
> >  EGLIBC_BRANCH=3D"eglibc-2_15"
> > -SRC_URI =3D "svn://www.eglibc.org/svn/branches/;module=3D${EGLIBC_BRAN=
CH};protocol=3Dhttp \
> > +SRC_URI =3D "http://www.eglibc.org/svn/branches/;module=3D${EGLIBC_BRA=
NCH};protocol=3Dhttp \
> >             file://eglibc-svn-arm-lowlevellock-include-tls.patch \
> >             file://IO-acquire-lock-fix.patch \
> >             file://mips-rld-map-check.patch \
> > diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-cor=
e/eglibc/eglibc_2.16.bb
> > index 09f5dbb..bec39cf 100644
> > --- a/meta/recipes-core/eglibc/eglibc_2.16.bb
> > +++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
> > @@ -7,7 +7,7 @@ PR =3D "r0"
> >  PR_append =3D "+svnr${SRCPV}"
> > =20
> >  EGLIBC_BRANCH=3D"eglibc-2_16"
> > -SRC_URI =3D "svn://www.eglibc.org/svn/branches/;module=3D${EGLIBC_BRAN=
CH};protocol=3Dhttp \
> > +SRC_URI =3D "http://www.eglibc.org/svn/branches/;module=3D${EGLIBC_BRA=
NCH};protocol=3Dhttp \
> >             file://eglibc-svn-arm-lowlevellock-include-tls.patch \
> >             file://IO-acquire-lock-fix.patch \
> >             file://mips-rld-map-check.patch \
> > --=20
> > 1.7.10.4
> >=20
> >=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hUH5gZbnpyIv7Mn4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAF6Y4ACgkQN1Ujt2V2gBx6DQCgreKvesrKk9OCNjOsRdRHmPuE
0LEAn2Vn4Zht1uupKSvRidzZDcfERUiI
=GUqD
-----END PGP SIGNATURE-----

--hUH5gZbnpyIv7Mn4--
