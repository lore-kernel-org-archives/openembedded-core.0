Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sm7ZI-0003QJ-Kx
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 20:11:20 +0200
Received: by wibhq4 with SMTP id hq4so4052828wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2012 11:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Exq2gRLXLV+x8QDX1bYHTYL8KcfUD6yYj+hji/wljdE=;
	b=yIzguIDXmMu4UE9RDYUKE/OqwFmrHBGNlNKcFHat2Zfv7tnAgrVHM9oGsEFAV1EnWp
	hIg0Bg/kuX5IFt0zWj1t60yjp7G8bL+LQCiwLFcv8RIlp+rdvkSzr6WX+yspevGWvhFP
	mq1JpcMCTDPT/fA4DXeGo+5xPg990+QG+L6VpALtiQZcv51SnVrfyvAkslOhszDW4Iqx
	3EA9Z/nT1Z5DLBQumRA27hrT9vzPSfsGUez5FRWpu62hI9UzPA+8qCX0B9L1Ee4kCU0B
	1KDirjHkM1utwDRqzpOnCpp0ymfXp+HjjqmLqQr6zAI2Iu5do7rCNvkWJtYIC+FRI6Oz
	bqgg==
Received: by 10.180.94.4 with SMTP id cy4mr27109650wib.2.1341338418601;
	Tue, 03 Jul 2012 11:00:18 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bg10sm58168036wib.9.2012.07.03.11.00.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Jul 2012 11:00:17 -0700 (PDT)
Date: Tue, 3 Jul 2012 20:00:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120703180017.GE3771@jama.jama.net>
References: <4FF320DD.8090301@palm.com> <4FF32550.6060606@linux.intel.com>
	<4FF329B2.1040101@palm.com> <4FF32D67.7020309@windriver.com>
	<20120703174702.GD3771@jama.jama.net>
	<4FF3310A.6000000@windriver.com>
MIME-Version: 1.0
In-Reply-To: <4FF3310A.6000000@windriver.com>
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
X-List-Received-Date: Tue, 03 Jul 2012 18:11:20 -0000
X-Groupsio-MsgNum: 24587
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kA1LkgxZ0NN7Mz3A"
Content-Disposition: inline

--kA1LkgxZ0NN7Mz3A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 03, 2012 at 12:51:06PM -0500, Mark Hatle wrote:
> On 7/3/12 12:47 PM, Martin Jansa wrote:
> > On Tue, Jul 03, 2012 at 12:35:35PM -0500, Mark Hatle wrote:
> >> On 7/3/12 12:19 PM, Rich Pixley wrote:
> >>> On 7/3/12 10:01 , Saul Wold wrote:
> >>>> On 07/03/2012 09:42 AM, Rich Pixley wrote:
> >>>>> Where can I find a description of the recent changes and what I nee=
d to
> >>>>> do to bring my files back up to current?
> >>>>>
> >>>>> What were the incompatible changes?
> >>>>>
> >>>> For bblayers.conf, we bumped the version becase we moved the BBPATH
> >>>> initial setting into the bblayers.conf to ensure we dont accidently
> >>>> pickup things in . because of the way a :: was being parsed.  See
> >>>> this commit
> >>>> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D5e3a61b4=
0b7b697d83b41e7e247cd1f94eb7673c
> >>>>
> >>>> Not sure what you mean about local.conf, since I am not sure of your
> >>>> starting point.
> >>> Ok, so I *liked* having BBPATH be relative.  The alternative, using
> >>> absolute pathnames, means that you have to bolt absolute path names i=
nto
> >>> all of your binaries, all of your debug symbols, and all of your build
> >>> configurations.  This means that your binary sizes are greater, that
> >>> debug symbols are significantly greater and more difficult to configu=
re
> >>> properly in your debuger, and that working directories cannot be moved
> >>> around or renamed without needing to manually force full rebuilds.  It
> >>> also means that some forms of file system checkpointing can't be used
> >>> since you can't rely on the build to be in the same place on the file
> >>> system every build.
> >>
> >> BBPATH being relative doesn't affect what ends up in debug symbols, et=
c.
> >>
> >> The BBPATH needs to be absolute, within the scope of a single loaded s=
ession to
> >> avoid randomly included items, primarily from the CWD.  This prevents
> >> non-repeatable builds.
> >>
> >> In a layer, the typical BBPATH is something like:
> >>
> >> BBPATH :=3D "${LAYERDIR}:${BBPATH}"
> >
> > No, please append to it, so order of layers in BBPATH is the same as
> > order of layers in BBLAYERS variable in bblayers.conf
>=20
> This affects ordering.. in my expample.. I wanted my layer to take preced=
ence=20
> over the BBPATH is other layers.

Then move your layer in BBLAYERS variable.

What if someone else would like your layer but doesn't want it to take
precedence? If you use append then he can adjust it's priority by adding
it in right place in BBLAYER, otherwise he needs to change layer.conf..

> > So typical BBPATH in layer.conf should be:
> > BBPATH .=3D ":${LAYERDIR}"
>=20
> It has to be :=3D and not .=3D.  If it's not immediately resolved, then $=
{LAYERDIR}=20
> will go to undefined later.
>=20
> If .=3D is working, I'm surprised.. the semantics may be different when p=
rocessing=20
> BBPATH then other variables.

Yes it is or do you suggest that all layers I'm using are not in my
BBPATH? :)

>=20
> > This is now consistent in all layers I'm using and quick search in
> > layers I'm not using shows only meta-baryon having it vice versa.
>=20
> --Mark
>=20
> > Cheers,
> >
> >>
> >> LAYERDIR is always the path to the layer being processed at any given =
time...
> >> so if a layer also provides addition scripts you can do:
> >>
> >> # Add scripts to PATH
> >> PATH :=3D "${PATH}:${LAYERDIR}/scripts"
> >>
> >>
> >> As for the debug items, the system handles all of the debug symbols fo=
r you.
> >> All target symbols are referenced from the -root- of the target filesy=
stem.  If
> >> this is not happening in your builds, then you've disabled the debug s=
ymbol
> >> processing -- or you found a bug in the system...  On the target side,=
 debugging
> >> on the target that is, everything should 'just work' with no manual se=
ttings.
> >>
> >> On a remote debug, you just need to tell the system where the relative=
 path is
> >> to the root of the filesystem you are debugging, gdb should then be ab=
le to add
> >> the references to the associated sources and .debug split items.
> >>
> >> This is all unchanged behavior for oe-core from when it was made oe-co=
re to present.
> >>
> >>> I'll try to roll with the current plan, though.
> >>>
> >>> In the current arrangement, I'm getting confusing messages about not
> >>> setting MACHINE, even though MACHINE is set in my local.conf.  I'm
> >>> guessing that means that the pathing is busted and it's not finding my
> >>> local.conf.  How is the initial configuration file found?  And which
> >>
> >> If it says MACHINE isn't configured, then you are lacking a proper BSP=
/machine
> >> configuration file.
> >>
> >> There are a couple of checks, but in the end they resolve down to chec=
king that
> >> TUNE_ARCH, TARGET_OS, and TUNE_PKGARCH exit and are reasonable, as wel=
l as
> >> conf/machine/${MACHINE}.conf can be loaded.
> >>
> >> Any of the above items not found or not configured properly indicate M=
ACHINE
> >> isn't defined, or the conf/machine/${MACHINE}.conf doesn't exist -- or=
 is
> >> incorrectly configured.
> >>
> >>> configuration file is initial?  Is that "./conf/bblayers.conf"?  And =
if
> >>> so, does this mean that I need to put my other directory assignments
> >>> like TOPDIR and TMPDIR in bblayers.conf as well?  And if so, then wha=
t's
> >>> the logical distinction between bblayers.conf and local.conf at this
> >>> point if build policy needs to go into bblayers.conf?
> >>
> >> bblayers shouldn't affect your machine files, other then a layer may c=
ontain a
> >> conf/machine/...conf file.  The BBPATH setting of ${LAYERDIR} allows t=
his
> >> directory to be automatically scanned when requesting a conf file.
> >>
> >> --Mark
> >>
> >>> --rich
> >>>
> >>> _______________________________________________
> >>> Openembedded-core mailing list
> >>> Openembedded-core@lists.openembedded.org
> >>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >>>
> >>
> >>
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
> >
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

--kA1LkgxZ0NN7Mz3A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/zMzEACgkQN1Ujt2V2gBx30ACfTN0z1PHFOjg/hvCD1o5u6RN+
QTYAn3s63JgvzsZ6V3NzBcidPUYKYuWM
=7/LU
-----END PGP SIGNATURE-----

--kA1LkgxZ0NN7Mz3A--
