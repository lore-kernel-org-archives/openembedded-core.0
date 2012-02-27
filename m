Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S1zwz-0008Uv-Vl
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 13:45:10 +0100
Received: by eaae1 with SMTP id e1so512237eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 04:36:44 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.119.136 as permitted sender) client-ip=10.14.119.136; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.119.136 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.119.136])
	by 10.14.119.136 with SMTP id n8mr7823081eeh.87.1330346204080 (num_hops
	= 1); Mon, 27 Feb 2012 04:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kz2PHZ5C1n0AsW6PrvH/lbk/tcjQ3BfOGxThJfZF/1s=;
	b=i+9A8GGwJWB0HYB0Dn8eruG69Tagh0vwiHJ65ZDjuu+O5Vh5ULOGXdM0Hdr16+f74F
	Tb2NUS8nTg5kJUSh1Iom3Am/txetTJU1HxHRwfaQM6Z/ujAaPG5Kje5L59v+an7qUjxJ
	JOHgPYzWlcMnzL7V+nh9OPjK1+5l3bj8JLIbA=
Received: by 10.14.119.136 with SMTP id n8mr5918982eeh.87.1330346203936;
	Mon, 27 Feb 2012 04:36:43 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v51sm57613360eef.2.2012.02.27.04.36.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Feb 2012 04:36:43 -0800 (PST)
Date: Mon, 27 Feb 2012 13:36:41 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120227123641.GH3859@jama.jama.net>
References: <20120222221309.69BFD10336@opal>
	<20120227103306.GG3859@jama.jama.net>
	<06A495EB-6F73-4325-A055-EEEBC01D93A4@dominion.thruhere.net>
	<1330344828.4593.14.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1330344828.4593.14.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-commits] Joshua Lock : netbase: remove redundant assignments
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
X-List-Received-Date: Mon, 27 Feb 2012 12:45:10 -0000
X-Groupsio-MsgNum: 18027
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RE3pQJLXZi4fr8Xo"
Content-Disposition: inline

--RE3pQJLXZi4fr8Xo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2012 at 12:13:48PM +0000, Richard Purdie wrote:
> On Mon, 2012-02-27 at 12:31 +0100, Koen Kooi wrote:
> > Op 27 feb. 2012, om 11:33 heeft Martin Jansa het volgende geschreven:
> >=20
> > > On Wed, Feb 22, 2012 at 10:13:09PM +0000, git@git.openembedded.org wr=
ote:
> > >> Module: openembedded-core.git
> > >> Branch: master
> > >> Commit: c3d5800d2850a186f91b5a0db642aa5d1c20156b
> > >> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dc=
ommit;h=3Dc3d5800d2850a186f91b5a0db642aa5d1c20156b
> > >>=20
> > >> Author: Joshua Lock <josh@linux.intel.com>
> > >> Date:   Tue Feb 21 17:46:44 2012 -0800
> > >>=20
> > >> netbase: remove redundant assignments
> > >>=20
> > >> There's no need to explicitly set PACKAGE_ARCH =3D MACHINE_ARCH, bas=
e.bbclass
> > >> takes care of setting this value for us based on the interfaces for =
those
> > >> machines being an OVERRIDE.
> > >=20
> > > do_install () {
> > > ...
> > >        # Disable network manager on machines that commonly do NFS boo=
ting
> > >        case "${MACHINE}" in
> > >                "qemuarm" | "qemux86" | "qemux86-64" | "qemumips" | "q=
emuppc" )
> > >=20
> > > This causes do_install hash to depend on MACHINE variable for all MAC=
HINEs,=20
> > > so making whole recipe MACHINE_ARCH would be more effective then rebu=
ilding=20
> > > TARGET_ARCH package after every MACHINE switch.
> >=20
> > That whole bit needs to go into the specific nfs image recipe, not
> > into the recipe. Unless we decide nfs is the one and only way to boot
> > qemu machines.
>=20
> Clearly the qemu machines boot on non-nfs setups just fine and the
> comment is just a bit stale here.
>=20
> For qemu we expect the IP address to be stable and consistent so we know
> where to find it and we don't expect it to disappear. The problem was
> that if network manager starts poking around the main ethernet
> interface, anything can go wrong (e.g. random QA test failures if
> networkmanager decided to change the interface at the wrong moment). We
> therefore really do know better than network manager when it comes to
> ethernet connectivity into our qemu images.
>=20
> There are a few options here:
>=20
> a) Whitelist the MACHINE variable in hashes apart from the qemu machines
>=20
> b) Change the code to a do_install_append_qemu* which would mean the
> hashes become stable.

I'm fine with this but maybe then return PACKAGE_ARCH setting for them
as we would be assuming that every machine with such append also have
own interfaces file in SRC_URI (this is now true better to see it
explicitly set above do_install_append_qemu* statement IMHO).


>=20
> c) Shove the information into a qemu specific package.=20
>=20
> The trouble with c) before everyone decides its the best is how/when do
> you include that package. It really needs to be present whenever network
> manager is present. I don't want to end up with someone installing it
> from feeds and getting different behaviour as it would be a nightmare to
> debug.

Bit of off-topic, but do we really need
EXTRA_IMAGEDEPENDS +=3D "qemu-native qemu-helper-native"
in meta/conf/machine/include/qemu.inc?

My guess is that in many cases host running builds isn't the same box
where someone is using native qemu to test those images. (e.g. in my
case I'm running builds in minimal chroot, while using distribution qemu
to test resulting images).

Cheers,

>=20
> d) We could also decide we don't care about network manager any more and
> just delete this I guess since we default to connman now.
>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RE3pQJLXZi4fr8Xo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9LeNkACgkQN1Ujt2V2gBztEgCeJuq+5Wm8L6uP2poXoN0XAIQn
35cAmwUmKOhDtWAyMn9v256nx3SoZpq8
=kAyB
-----END PGP SIGNATURE-----

--RE3pQJLXZi4fr8Xo--
