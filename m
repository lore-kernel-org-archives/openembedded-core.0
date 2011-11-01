Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RLLI7-00075r-EJ
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 21:50:39 +0100
Received: by faas16 with SMTP id s16so7687324faa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2011 13:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=v8OlE0voLZ3k7q4Fo9VjcWxsYLSR18x1j1xC7wRCWmI=;
	b=tibexmHY0voBBdwN7XajvaFcooEreg4x8vlYSpS0REDjTg/3YPBj8Vq29dtDaYqEdm
	/ScY192bZ8yhnUFnD8e2vugiowvODPaoulQxIs3kRvXAPvoQ4J6ybfBoUYuvay2KiiM3
	ck0YZYrQk9f3+hBoONgkRC3lzitrrHy6a/GSY=
Received: by 10.223.63.206 with SMTP id c14mr3136605fai.3.1320180273090;
	Tue, 01 Nov 2011 13:44:33 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k26sm880170fab.8.2011.11.01.13.44.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Nov 2011 13:44:31 -0700 (PDT)
Date: Tue, 1 Nov 2011 21:44:25 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111101204424.GA9949@jama.jama.net>
References: <20111018183520.GB556@jama.jama.net>
	<CAMKF1spkExdtaVSXxhVShSXR-UQUx-JML34tCPa6KaaUQb-2Rw@mail.gmail.com>
	<20111018201708.GC556@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20111018201708.GC556@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Race condition or something when fetching local files?
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
X-List-Received-Date: Tue, 01 Nov 2011 20:50:39 -0000
X-Groupsio-MsgNum: 11761
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline

--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2011 at 10:17:08PM +0200, Martin Jansa wrote:
> On Tue, Oct 18, 2011 at 01:09:43PM -0700, Khem Raj wrote:
> > On Tue, Oct 18, 2011 at 11:35 AM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
> > > I have noticed that even local patches are stored in downloads dir,
> > > but today I've noticed that wrong file was used later in do_patch.
> > > I have latest oe-core/meta-oe + latest bitbake.
> > >
> > > Pulseaudio was building here for first time
> > >
> > > downloads/buildfix.patch is from previous build of xf86-video-intel-2=
=2E16.0
> > > $ head downloads/buildfix.patch
> >=20
> > looking in bitbake lib/bb/fetch2/local.py it seems it searches DL_DIR
> > before other
>=20
> Which would be wrong for sure if I have
> foo_1.0.bb with SRC_URI =3D "file://bar.patch"
>=20
> foo-1.0/om-gta02/bar.patch
> foo-1.0/nokia900/bar.patch
>=20
> Then I don't want to use bar.patch from downloads/bar.patch where it's
> from om-gta02 build when I'm building nokia900 now.
>=20
> Regards,
>=20
> > search paths. cleansstate might not have information that the patch
> > was downloaded
> > and not applied from local metadata after the recipe is updated.

Reported in
http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1710

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6wWigACgkQN1Ujt2V2gBx8OACeNRARCDEEttVakM71rmYHbBsA
KLkAoJMGN7hYNPtUlTsg8al2gz1fA+J1
=wi+1
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
