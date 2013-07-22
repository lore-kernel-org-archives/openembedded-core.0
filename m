Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id C676E60629
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 12:41:45 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id b57so3743121eek.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 05:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=sl21VbyKsxmprbqe6K6iUxPB+mIasbhp0Xyq7fT4B6w=;
	b=sXqeVSZwUua6X2SErmMgsP8aV5og/4lCOyMXLdEciPnWwZgoaz9t7Tu17kkxW66BWF
	891HsYc+nAm8FwwzO2TKx2ho8+Du1w4H/4UvLGMWkjxbPX3rR83Q+LNwm2fqwuqhc5Qo
	/dHldNCGgDccxCe7mQp+RC0AuMbbFaz3rAoge5+NY3iMJJh1zbaYvzZP5FqgoruBe2zE
	tcAi2dY5QQXbEz1/6To8RJ/RUe5B4CwbGaI4lUMS9PrDU0W/teuM2V/uYbOivh9Q9O/d
	2Zokm+mgzSxfdP05UuBSUGECFFwBXwhNt1lOiWFFtL1XzfB0ZTdXjpemmzik0SMq1f9A
	4n2g==
X-Received: by 10.14.219.6 with SMTP id l6mr26692860eep.152.1374496905328;
	Mon, 22 Jul 2013 05:41:45 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n45sm50605044eew.1.2013.07.22.05.41.44 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 22 Jul 2013 05:41:44 -0700 (PDT)
Date: Mon, 22 Jul 2013 14:42:04 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130722124204.GI9527@jama>
References: <51ECCF5C.2020505@dresearch-fe.de> <6366141.Q5aULPr4OG@helios>
	<51ED09DD.7040008@dresearch-fe.de> <3148065.skdr24gULv@helios>
MIME-Version: 1.0
In-Reply-To: <3148065.skdr24gULv@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: SRC_URI and latest HEAD revision with git
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Jul 2013 12:41:46 -0000
X-Groupsio-MsgNum: 42272
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="svExV93C05KqedWb"
Content-Disposition: inline

--svExV93C05KqedWb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2013 at 12:08:06PM +0100, Paul Eggleton wrote:
> On Monday 22 July 2013 12:30:53 Steffen Sledz wrote:
> > On 22.07.2013 11:51, Paul Eggleton wrote:
> > > On Monday 22 July 2013 11:46:23 Steffen Sledz wrote:
> > >> On 22.07.2013 11:01, Nicolas Dechesne wrote:
> > >>> On Mon, Jul 22, 2013 at 8:21 AM, Steffen Sledz <sledz@dresearch-fe.=
de
> > >>>=20
> > >>> <mailto:sledz@dresearch-fe.de>> wrote:
> > >>>> After being OE abstinent for some months i'd like to ask what is t=
he
> > >>>> current suggested method for recipes building from the HEAD revisi=
on of
> > >>>> a git repository (we need this for continuous integration).
> > >>>>=20
> > >>>> I read some RFC's in the ml about PKGV/PKGR stuff, but i miss a fi=
nal
> > >>>> decision, documentation and a good example.>
> > >>>=20
> > >>> you can use ${AUTOREV} for this purpose. You can look at poky-bleed=
ing
> > >>> distro config for such an example.
> > >>>=20
> > >>> e.g.
> > >>> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-yocto/conf=
/dist
> > >>> r
> > >>> o/include/poky-floating-revisions.inc
> > >>=20
> > >> Hmmmm? This doesn't seem the work.
> > >>=20
> > >> Here's what i tried in my recipe:
> > >>=20
> > >> ------------> snip <------------
> > >> PR =3D "r3"
> > >>=20
> > >> SRCREV=3D"${AUTOREV}"
> > >> PV =3D "gitr${SRCPV}"
> > >> ------------> snip <------------
> > >>=20
> > >> But i get package versions like
> > >>=20
> > >>   gitr0+53b64e717404d282d0c58b7fa4a4e74ab2ca81ba-r3
> > >>=20
> > >> where SRCPB is always 0. :(
> > >>=20
> > >> A bit more description and/or a complete example would be very helpf=
ul.
> > >=20
> > > If you want these to increment now AIUI you need to be using the PR
> > > server:
> > >=20
> > > https://wiki.yoctoproject.org/wiki/PR_Service
> >=20
> > This seems to be the thing we need.
> >=20
> > But the description is not very helpful from the view of a recipe
> > maintainer. It describes mostly the server part.
> >=20
> > * What do i have to write in my recipe?
>=20
> Nothing special. If you used SRCPV in PV where you are using an SCM in=20
> SRC_URI, that should be enough. The integer at the start of SRCREV will b=
e=20
> incremented automatically if the revision changes, and if it doesn't but =
other=20
> values within the recipe change then PR will automatically be incremented=
=20
> above the initial value set in the recipe.
>=20
> > * What modifications in bitbake.conf, local.conf, ... are necessary?
>=20
> I believe as described in the page I linked above you should only need to=
 set=20
> PRSERV_HOST.

If you need to support upgrade path from old LOCALCOUNT db in
PERSISTENT_DIR then you also need to migrate last numbers to PRSERV db.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--svExV93C05KqedWb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHtKJwACgkQN1Ujt2V2gBz1bACfYcx4hV0jt1l3Xvb6ywukScMe
6XoAn2p0umuSSwE7Bm67GbyEzTpr5zbA
=nV9V
-----END PGP SIGNATURE-----

--svExV93C05KqedWb--
