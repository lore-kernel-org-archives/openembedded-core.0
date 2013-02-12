Received: from mail-pa0-f49.google.com ([209.85.220.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1U5LdG-0000mU-ET; Tue, 12 Feb 2013 20:35:34 +0100
Received: by mail-pa0-f49.google.com with SMTP id kp6so254915pab.22
	for <multiple recipients>; Tue, 12 Feb 2013 11:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=QNkgb0yDvnXpieCpgIARUXaKldjFOGa3enOqLbvGVVg=;
	b=uguzsx+2zoadfiOA/a/pYnmCjBowoJHQnrRRZKRRWpLL1yikZ1e6eOxy3pBr1onCVz
	45BxKqpxGaSaGRAM9qtpXIHOx63YO18WGtea3bhQK5UZn87nsHK5VVmaGNOPqqMo3bcS
	B+eHRBdftvdGMjLRwqKqESdj7hDk0r5L2ppoIsl+JtZXRJ6+pN0BxW0pkkC/iHZwEZLc
	hWjaiJgenz8cBGNfZza/BICsXbaa1S935cofkHFn++nurE9pLbgjtlJH/N+N3+bolvqC
	3ncxi2n6pO2sJcZi+c8QzG0oQ7puRL1cmswFQp7RqPydfu2Cm/my/3oKZWmGjD9ZOyx4
	ygvA==
X-Received: by 10.66.80.162 with SMTP id s2mr55123451pax.61.1360696749540;
	Tue, 12 Feb 2013 11:19:09 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id m3sm77153495pav.4.2013.02.12.11.19.06
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 12 Feb 2013 11:19:08 -0800 (PST)
Date: Tue, 12 Feb 2013 20:19:02 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130212191902.GD3300@jama>
References: <2760168.9kFd94gL1F@helios>
MIME-Version: 1.0
In-Reply-To: <2760168.9kFd94gL1F@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: RFC: meta-oe appends and overlayed recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Feb 2013 19:35:37 -0000
X-Groupsio-MsgNum: 35383
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VMt1DrMGOVs3KQwf"
Content-Disposition: inline

--VMt1DrMGOVs3KQwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 11, 2013 at 05:09:01PM +0000, Paul Eggleton wrote:
> Hi all,
>=20
> I'd like to make an attempt to remove all appends and overlayed recipes f=
rom=20
> the meta-oe layer. As I've said previously, I don't believe meta-oe - as =
a=20
> collection of very useful additional recipes that many wish to be able to=
 use=20
> on top of their OE-Core based build configurations - should be making any=
=20
> possibly unexpected changes to those configurations. Any such changes oug=
ht to=20
> be the province of distro layers alone.
>=20
> We've already removed all of the obvious overlayed recipes and the meta-
> systemd split removed most of the pieces that were there for systemd supp=
ort;=20
> there are just a few remaining recipes and appends that need to be dealt =
with.=20
> I'll catalogue these below with my comments.
>=20
> Currently we have the following overlayed recipes:
>=20
> * icon-naming-utils: meta-oe has a newer version (0.8.90 vs OE-Core's 0.8=
=2E7)=20
> and it uses BBCLASSEXTEND rather than OE-Core's native recipe. I would pr=
opose=20
> to just move the meta-oe version to OE-Core since it appears to be superi=
or.
>=20
> * libmad: both layers have the same version. The meta-oe version has some=
=20
> slightly different versions of the MIPS compiler flag fix and -fforce-mem=
 removal=20
> patches but I think these can be ignored, since the OE-Core versions of t=
hese=20
> patches have proper headers and are presumably working. The OE-Core versi=
on=20
> has LICENSE_FLAGS that the meta-oe one doesn't, but is missing an avr32-
> specific optimisation patch that is in the meta-oe version. What would we=
 do=20
> with the latter? Is it appropriate to add to the OE-Core recipe?
>=20
> * tslib: OE-Core has the 1.0 release version, meta-oe has a git recipe th=
at is=20
> ahead of 1.0; the OE-Core version has two patches not in the meta-oe vers=
ion=20
> but that both have been merged upstream in the git revision being used in=
 the=20
> meta-oe version. There is no newer stable release. What do we do here? Sh=
ould=20
> we ask upstream (Chris) for a new stable release?

tslib is also requested on devices where kernel driver returns too much
noise, tslib can filter that, evdev needs separate filter like=20
http://atrey.karlin.mff.cuni.cz/~metan/evfilter/
but that isn't integrated in OE.

> * xserver-nodm-init: the two versions are quite distinct. Not sure I=20
> understand the full history here but perhaps someone else can fill in the=
=20
> blanks...?

The biggest difference is integrated xinput-calibrator and use of
xserver-common_1.34.bb

> As far as bbappends go we have:
>=20
> * meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
> As far as I can tell this just adds an /etc/busybox-syslog.default file=
=20
> containing OPTIONS=3D"-C64" and seems to have been added for systemd supp=
ort.=20
> I'm not sure why this wasn't moved to meta-systemd, but I assume it needs=
 to=20
> be merged into OE-Core now that systemd support is being added there... ?
>=20
> * meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
> Another bbappend apparently for systemd support. Again, this should have =
been=20
> moved to meta-systemd; do we now need to merge it into OE-Core?
>=20
> * meta-oe/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bbap=
pend
> This is adding qwt to the qte toolchain. As far as I am concerned this is=
 a=20
> distro policy decision - Qwt is a third-party library that is not part of=
 Qt.=20
> I believe this should be moved to the layers for whichever distros want t=
his.
>=20
> * meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend
> * meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
> These two add MySQL and PostgreSQL support to Qt and Qt/Embedded. I see t=
his=20
> as a distro policy decision; these should move to the layers for whicheve=
r=20
> distros want this. FWIW, this is particularly egregious if you've already=
=20
> built Qt, then add meta-oe and find Qt is being unexpectedly rebuilt.

MySQL and PostgreSQL are not in oe-core so it cannot be replaced with
simple PACKAGECONFIG option in oe-core recipe, but I also prefer to
share such .bbappend somewhere instead of every distribution reinventing
the wheel when trying to enable something as simple as db in qt.

> * meta-oe/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bbappend
> Builds against external libav instead of using the builtin copy of ffmpeg=
,=20
> apparently for better performance on ARM (and presumably that is not the =
only=20
> benefit). It's less clear to me what should be done with this, but I'd st=
ill=20
> rather it could be eliminated. OE-Core does not have ffmpeg/libav; one wo=
nders=20
> if it should or not.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VMt1DrMGOVs3KQwf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEalaYACgkQN1Ujt2V2gBwA2gCgu2Zsc58NvOsrXzDbVU9qD4rg
l7wAn1Xc64kn6tS2cD7DrnvAETf36l9M
=Sz4t
-----END PGP SIGNATURE-----

--VMt1DrMGOVs3KQwf--
