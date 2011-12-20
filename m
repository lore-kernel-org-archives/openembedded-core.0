Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RcuJu-0002af-VF
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Dec 2011 08:41:07 +0100
Received: by eeit10 with SMTP id t10so2324084eei.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 23:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rgebcNE+X2bXlyqRDWcY22/o8OFnLi8kWhYK9m6rIa0=;
	b=IHVY7RcOP8TQMZRYMUDmzjiQi1wO0h2Nea1D6l34mtPQMtwEXtQ4MQzEb3e8YdYHqV
	OmiYMIclM6/WI+og1vXdRPXpxOo9T2PT0HJSw6Of4awOLBQRARNl3+HeeYVPHAvIiag5
	XlJC4l1gtkwyuxFIjHlwVHYo+f3J4J9JJuDew=
Received: by 10.14.9.164 with SMTP id 36mr417395eet.127.1324366443389;
	Mon, 19 Dec 2011 23:34:03 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y12sm2217951eeb.11.2011.12.19.23.34.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Dec 2011 23:34:01 -0800 (PST)
Date: Tue, 20 Dec 2011 08:33:50 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111220073349.GA3946@jama.jama.net>
References: <cover.1324316137.git.paul.eggleton@linux.intel.com>
	<1817157.LPoMfdErnK@helios>
	<7B929D63-E14F-44F8-81B2-49AA90181BA0@dominion.thruhere.net>
	<4077851.vBmcQh9dAf@helios>
	<756581D3-FAA6-48FC-9ECE-0B7CC1262A5D@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <756581D3-FAA6-48FC-9ECE-0B7CC1262A5D@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/2] psplash fixes
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
X-List-Received-Date: Tue, 20 Dec 2011 07:41:07 -0000
X-Groupsio-MsgNum: 14508
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline

--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2011 at 07:48:48PM +0100, Koen Kooi wrote:
>=20
> Op 19 dec. 2011, om 19:32 heeft Paul Eggleton het volgende geschreven:
>=20
> > On Monday 19 December 2011 19:27:06 Koen Kooi wrote:
> >> Op 19 dec. 2011, om 19:22 heeft Paul Eggleton het volgende geschreven:
> >>> On Monday 19 December 2011 18:50:35 Koen Kooi wrote:
> >>>> Op 19 dec. 2011, om 18:43 heeft Paul Eggleton het volgende geschreve=
n:
> >>>>> Set the default psplash image to the OpenEmbedded logo, and provide
> >>>>> a
> >>>>> script to allow people to use their own custom image.
> >>>>=20
> >>>> What I did in OE-classic and meta-angstrom is to use
> >>>> update-alternatives to provide different psplash images. This way you
> >>>> can choose a different splash for each image instead of having a
> >>>> distro wide one. Is something like that suitable for oe-core as well?
> >>>=20
> >>> Sounds like a useful capability, however, does this mean that when you
> >>> want to override it in the image you end up with both psplash versions
> >>> installed?
> >> in a splashless image you can just do 'IMAGE_INSTALL +=3D psplash-angs=
trom and
> >> it will only install that one. If you want to reuse an existing, unmod=
ified
> >> image with psplash and add your own, then you will end up with both.
> >=20
> > Although I guess another way to do it would be to do a VIRTUAL-RUNTIME =
type=20
> > thing like we do for other such selections. At the moment in OE-core, p=
splash=20
> > is brought in via task-core-console, and whilst it is a separate variab=
le that=20
> > could be overridden it's a task which once built really makes it imposs=
ible to=20
> > customise per-image.
> >=20
> > What about a "splash" IMAGE_FEATURE and then a VIRTUAL-RUNTIME_splash t=
o=20
> > select which psplash to install?
>=20
> I will say again: I absolutely HATE that virtual-runtime nonsense. If you=
 need to change a task, change the task, don't introduce things that make i=
t non deterministic. Guess what happens when you change a virtual-runtime *=
after* you have built the task already.

The advantage of virtual-runtime is that something like initscripts, is
pulled by more than one recipe, so in order to change initscripts pulled
to distro images you have to change 3-4 recipes by .bbappend and bump PR
in all.

With VIRTUAL-RUNTIME you have to select VIRTUAL-RUNTIME_initscripts by
distro config and add .bbappends only with PRINC bumps for recipes using
this variable (easy to find with git grep).
And if someone else adds new recipe also using initscripts then he
should use right one wrt VIRTUAL-RUNTIME_initscripts not expecting you
to notice that other recipe pulling initscripts is there (I've used
BLACKLIST to notice those before, but VIRTUAL-RUNTIME is better).

And it's like DISTRO_FEATURES, nobody should change VIRTUAL-RUNTIME
settings without at least PRINC bumps.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7wOl0ACgkQN1Ujt2V2gBwYFACfcR8dMjHbrhhBRmoBsS/u5qFV
dqgAoK1ozcSQ2ewI0KDdgDMpQ+uy0j0v
=9rYc
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
