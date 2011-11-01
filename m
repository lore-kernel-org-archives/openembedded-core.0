Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RLAls-00008n-5B
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 10:36:40 +0100
Received: by faas16 with SMTP id s16so7020862faa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2011 02:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=32KPJBfuZnAVoV6uW46Cg3U6HzfTZdkNtgszV/xoxwU=;
	b=u0ikoay73fKvsPtbMt2D9ekCe0p60odrdCRlMY7BTl1GsT+OHMoIAxElMBNL/4oAYZ
	cXR/XNRilw1UrERkLvPsr0JNIVusx/1stSeR3oQX82907SFxlLihYu+qJM1pRjspm37f
	np5Bmo9anvH1ggWWiZrgA0kHgVqcyE5J9fB18=
Received: by 10.223.76.197 with SMTP id d5mr5308659fak.13.1320139833938;
	Tue, 01 Nov 2011 02:30:33 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x19sm35989479fag.5.2011.11.01.02.30.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Nov 2011 02:30:31 -0700 (PDT)
Date: Tue, 1 Nov 2011 10:30:24 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111101093024.GD4714@jama.jama.net>
References: <20111018183520.GB556@jama.jama.net>
	<CAMKF1spkExdtaVSXxhVShSXR-UQUx-JML34tCPa6KaaUQb-2Rw@mail.gmail.com>
	<20111018201708.GC556@jama.jama.net>
	<20111021004721.GW26170@denix.org>
MIME-Version: 1.0
In-Reply-To: <20111021004721.GW26170@denix.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Race condition or something when fetching local	files?
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
X-List-Received-Date: Tue, 01 Nov 2011 09:36:40 -0000
X-Groupsio-MsgNum: 11728
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hoZxPH4CaxYzWscb"
Content-Disposition: inline

--hoZxPH4CaxYzWscb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2011 at 08:47:21PM -0400, Denys Dmytriyenko wrote:
> On Tue, Oct 18, 2011 at 10:17:08PM +0200, Martin Jansa wrote:
> > On Tue, Oct 18, 2011 at 01:09:43PM -0700, Khem Raj wrote:
> > > On Tue, Oct 18, 2011 at 11:35 AM, Martin Jansa <martin.jansa@gmail.co=
m> wrote:
> > > > I have noticed that even local patches are stored in downloads dir,
> > > > but today I've noticed that wrong file was used later in do_patch.
> > > > I have latest oe-core/meta-oe + latest bitbake.
> > > >
> > > > Pulseaudio was building here for first time
> > > >
> > > > downloads/buildfix.patch is from previous build of xf86-video-intel=
-2.16.0
> > > > $ head downloads/buildfix.patch
> > >=20
> > > looking in bitbake lib/bb/fetch2/local.py it seems it searches DL_DIR
> > > before other
> >=20
> > Which would be wrong for sure if I have
> > foo_1.0.bb with SRC_URI =3D "file://bar.patch"
> >=20
> > foo-1.0/om-gta02/bar.patch
> > foo-1.0/nokia900/bar.patch
> >=20
> > Then I don't want to use bar.patch from downloads/bar.patch where it's
> > from om-gta02 build when I'm building nokia900 now.
>=20
> Was there any resolution on this one?

NO afaik

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hoZxPH4CaxYzWscb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6vvDAACgkQN1Ujt2V2gByYKwCdH9TfWO/ryod/u6lUDg/GZ/mv
TesAn3UAtc+zVA31PO+bN77Rj4hLaAx2
=vtyq
-----END PGP SIGNATURE-----

--hoZxPH4CaxYzWscb--
