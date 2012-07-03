Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sm7MT-0002c7-NE
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 19:58:05 +0200
Received: by wgbdr1 with SMTP id dr1so5944513wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2012 10:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IZT62IXcV6YvfB54VSCvGp01//ib170jqDq+m5wa56s=;
	b=Le/s5tj3/pyoJo/F7GkyjvIN7Lp4Igd4HUUXP7SwEZhuvD3SiBmYhJHtekiIWtwjN8
	jp46InqUNe2B87et/YK2aSl1CwUgvHGLsQY4AoZq7UvQaDIh7pi26wN4grWkOw3VbPBL
	rrMPslEmzFKO1N1RjaEjoI53ljhZ2PYx6N91eLnGogt3hediPDEaEL4JJJ8nvEYEvrH4
	sscub0Hlh99o7Aj7hzB79p3yQxrPKrOQ/IdZ6/npchF2A5gZKCF+t1jEnF7hrIPfq6lk
	lW81jxa+Ra6OZGK0NJs7+ExEFvUBbVDlVA18xptczOfS7fuPKbO+JP9+3fkmI8Ls8uU1
	e54w==
Received: by 10.216.228.98 with SMTP id e76mr4130472weq.150.1341337623729;
	Tue, 03 Jul 2012 10:47:03 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y2sm31971897wix.7.2012.07.03.10.47.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Jul 2012 10:47:02 -0700 (PDT)
Date: Tue, 3 Jul 2012 19:47:02 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120703174702.GD3771@jama.jama.net>
References: <4FF320DD.8090301@palm.com> <4FF32550.6060606@linux.intel.com>
	<4FF329B2.1040101@palm.com> <4FF32D67.7020309@windriver.com>
MIME-Version: 1.0
In-Reply-To: <4FF32D67.7020309@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: local.conf & bblayers.conf changes...
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
X-List-Received-Date: Tue, 03 Jul 2012 17:58:05 -0000
X-Groupsio-MsgNum: 24580
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="11Y7aswkeuHtSBEs"
Content-Disposition: inline

--11Y7aswkeuHtSBEs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 03, 2012 at 12:35:35PM -0500, Mark Hatle wrote:
> On 7/3/12 12:19 PM, Rich Pixley wrote:
> > On 7/3/12 10:01 , Saul Wold wrote:
> >> On 07/03/2012 09:42 AM, Rich Pixley wrote:
> >>> Where can I find a description of the recent changes and what I need =
to
> >>> do to bring my files back up to current?
> >>>
> >>> What were the incompatible changes?
> >>>
> >> For bblayers.conf, we bumped the version becase we moved the BBPATH
> >> initial setting into the bblayers.conf to ensure we dont accidently
> >> pickup things in . because of the way a :: was being parsed.  See
> >> this commit
> >> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D5e3a61b40b=
7b697d83b41e7e247cd1f94eb7673c
> >>
> >> Not sure what you mean about local.conf, since I am not sure of your
> >> starting point.
> > Ok, so I *liked* having BBPATH be relative.  The alternative, using
> > absolute pathnames, means that you have to bolt absolute path names into
> > all of your binaries, all of your debug symbols, and all of your build
> > configurations.  This means that your binary sizes are greater, that
> > debug symbols are significantly greater and more difficult to configure
> > properly in your debuger, and that working directories cannot be moved
> > around or renamed without needing to manually force full rebuilds.  It
> > also means that some forms of file system checkpointing can't be used
> > since you can't rely on the build to be in the same place on the file
> > system every build.
>=20
> BBPATH being relative doesn't affect what ends up in debug symbols, etc.
>=20
> The BBPATH needs to be absolute, within the scope of a single loaded sess=
ion to=20
> avoid randomly included items, primarily from the CWD.  This prevents=20
> non-repeatable builds.
>=20
> In a layer, the typical BBPATH is something like:
>=20
> BBPATH :=3D "${LAYERDIR}:${BBPATH}"

No, please append to it, so order of layers in BBPATH is the same as
order of layers in BBLAYERS variable in bblayers.conf

So typical BBPATH in layer.conf should be:
BBPATH .=3D ":${LAYERDIR}"

This is now consistent in all layers I'm using and quick search in
layers I'm not using shows only meta-baryon having it vice versa.

Cheers,

>=20
> LAYERDIR is always the path to the layer being processed at any given tim=
e...=20
> so if a layer also provides addition scripts you can do:
>=20
> # Add scripts to PATH
> PATH :=3D "${PATH}:${LAYERDIR}/scripts"
>=20
>=20
> As for the debug items, the system handles all of the debug symbols for y=
ou.=20
> All target symbols are referenced from the -root- of the target filesyste=
m.  If=20
> this is not happening in your builds, then you've disabled the debug symb=
ol=20
> processing -- or you found a bug in the system...  On the target side, de=
bugging=20
> on the target that is, everything should 'just work' with no manual setti=
ngs.
>=20
> On a remote debug, you just need to tell the system where the relative pa=
th is=20
> to the root of the filesystem you are debugging, gdb should then be able =
to add=20
> the references to the associated sources and .debug split items.
>=20
> This is all unchanged behavior for oe-core from when it was made oe-core =
to present.
>=20
> > I'll try to roll with the current plan, though.
> >
> > In the current arrangement, I'm getting confusing messages about not
> > setting MACHINE, even though MACHINE is set in my local.conf.  I'm
> > guessing that means that the pathing is busted and it's not finding my
> > local.conf.  How is the initial configuration file found?  And which
>=20
> If it says MACHINE isn't configured, then you are lacking a proper BSP/ma=
chine=20
> configuration file.
>=20
> There are a couple of checks, but in the end they resolve down to checkin=
g that=20
> TUNE_ARCH, TARGET_OS, and TUNE_PKGARCH exit and are reasonable, as well a=
s=20
> conf/machine/${MACHINE}.conf can be loaded.
>=20
> Any of the above items not found or not configured properly indicate MACH=
INE=20
> isn't defined, or the conf/machine/${MACHINE}.conf doesn't exist -- or is=
=20
> incorrectly configured.
>=20
> > configuration file is initial?  Is that "./conf/bblayers.conf"?  And if
> > so, does this mean that I need to put my other directory assignments
> > like TOPDIR and TMPDIR in bblayers.conf as well?  And if so, then what's
> > the logical distinction between bblayers.conf and local.conf at this
> > point if build policy needs to go into bblayers.conf?
>=20
> bblayers shouldn't affect your machine files, other then a layer may cont=
ain a=20
> conf/machine/...conf file.  The BBPATH setting of ${LAYERDIR} allows this=
=20
> directory to be automatically scanned when requesting a conf file.
>=20
> --Mark
>=20
> > --rich
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--11Y7aswkeuHtSBEs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/zMBYACgkQN1Ujt2V2gBynUwCgl5ANzHmSpAulusJe9vGT3xRi
8tAAn3honzWamPfqxLfASceUOrBIkUW0
=okzp
-----END PGP SIGNATURE-----

--11Y7aswkeuHtSBEs--
