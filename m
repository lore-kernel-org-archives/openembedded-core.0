Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S212z-0001n9-Cz
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 14:55:25 +0100
Received: by eekc1 with SMTP id c1so409620eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 05:46:59 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.17.203 as permitted sender) client-ip=10.213.17.203; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.17.203 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.17.203])
	by 10.213.17.203 with SMTP id t11mr4199851eba.127.1330350419200
	(num_hops = 1); Mon, 27 Feb 2012 05:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=T5xwjYjW0ilL+VPL2oRx5iCtfuUxss88wZKV5GB9zZA=;
	b=rw+ycc3ggBrWhUJZC5CRuDSWgRzIkeicote22df/3J+TMum02dG+xrxWysPqa90bFm
	vr16GWZepW+8CXPxdphGRXRk+Dl5GwiFpMnP9caWz9zxbkgZ8qYX/SlkgvkFO/RWaw5S
	Sd9R46WUeSFKx3rgJCI1Mut6g3C4s0wZ9cEnA=
Received: by 10.213.17.203 with SMTP id t11mr3130508eba.127.1330350418919;
	Mon, 27 Feb 2012 05:46:58 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y14sm58154055eef.10.2012.02.27.05.46.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Feb 2012 05:46:57 -0800 (PST)
Date: Mon, 27 Feb 2012 14:46:55 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120227134655.GA30780@jama.jama.net>
References: <20120222221309.69BFD10336@opal>
	<20120227103306.GG3859@jama.jama.net>
	<06A495EB-6F73-4325-A055-EEEBC01D93A4@dominion.thruhere.net>
	<1330344828.4593.14.camel@ted>
	<20120227123641.GH3859@jama.jama.net>
	<1330346833.4593.22.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1330346833.4593.22.camel@ted>
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
X-List-Received-Date: Mon, 27 Feb 2012 13:55:25 -0000
X-Groupsio-MsgNum: 18037
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline

--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2012 at 12:47:13PM +0000, Richard Purdie wrote:
> On Mon, 2012-02-27 at 13:36 +0100, Martin Jansa wrote:
> > On Mon, Feb 27, 2012 at 12:13:48PM +0000, Richard Purdie wrote:
> > > On Mon, 2012-02-27 at 12:31 +0100, Koen Kooi wrote:
> > > > Op 27 feb. 2012, om 11:33 heeft Martin Jansa het volgende geschreve=
n:
> > > >=20
> > > > > On Wed, Feb 22, 2012 at 10:13:09PM +0000, git@git.openembedded.or=
g wrote:
> > > > >> Module: openembedded-core.git
> > > > >> Branch: master
> > > > >> Commit: c3d5800d2850a186f91b5a0db642aa5d1c20156b
> > > > >> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=
=3Dcommit;h=3Dc3d5800d2850a186f91b5a0db642aa5d1c20156b
> > > > >>=20
> > > > >> Author: Joshua Lock <josh@linux.intel.com>
> > > > >> Date:   Tue Feb 21 17:46:44 2012 -0800
> > > > >>=20
> > > > >> netbase: remove redundant assignments
> > > > >>=20
> > > > >> There's no need to explicitly set PACKAGE_ARCH =3D MACHINE_ARCH,=
 base.bbclass
> > > > >> takes care of setting this value for us based on the interfaces =
for those
> > > > >> machines being an OVERRIDE.
> > > > >=20
> > > > > do_install () {
> > > > > ...
> > > > >        # Disable network manager on machines that commonly do NFS=
 booting
> > > > >        case "${MACHINE}" in
> > > > >                "qemuarm" | "qemux86" | "qemux86-64" | "qemumips" =
| "qemuppc" )
> > > > >=20
> > > > > This causes do_install hash to depend on MACHINE variable for all=
 MACHINEs,=20
> > > > > so making whole recipe MACHINE_ARCH would be more effective then =
rebuilding=20
> > > > > TARGET_ARCH package after every MACHINE switch.
> > > >=20
> > > > That whole bit needs to go into the specific nfs image recipe, not
> > > > into the recipe. Unless we decide nfs is the one and only way to bo=
ot
> > > > qemu machines.
> > >=20
> > > Clearly the qemu machines boot on non-nfs setups just fine and the
> > > comment is just a bit stale here.
> > >=20
> > > For qemu we expect the IP address to be stable and consistent so we k=
now
> > > where to find it and we don't expect it to disappear. The problem was
> > > that if network manager starts poking around the main ethernet
> > > interface, anything can go wrong (e.g. random QA test failures if
> > > networkmanager decided to change the interface at the wrong moment). =
We
> > > therefore really do know better than network manager when it comes to
> > > ethernet connectivity into our qemu images.
> > >=20
> > > There are a few options here:
> > >=20
> > > a) Whitelist the MACHINE variable in hashes apart from the qemu machi=
nes
> > >=20
> > > b) Change the code to a do_install_append_qemu* which would mean the
> > > hashes become stable.
> >=20
> > I'm fine with this but maybe then return PACKAGE_ARCH setting for them
> > as we would be assuming that every machine with such append also have
> > own interfaces file in SRC_URI (this is now true better to see it
> > explicitly set above do_install_append_qemu* statement IMHO).
>=20
> Agreed.
>=20
> > > c) Shove the information into a qemu specific package.=20
> > >=20
> > > The trouble with c) before everyone decides its the best is how/when =
do
> > > you include that package. It really needs to be present whenever netw=
ork
> > > manager is present. I don't want to end up with someone installing it
> > > from feeds and getting different behaviour as it would be a nightmare=
 to
> > > debug.
> >=20
> > Bit of off-topic, but do we really need
> > EXTRA_IMAGEDEPENDS +=3D "qemu-native qemu-helper-native"
> > in meta/conf/machine/include/qemu.inc?
> >=20
> > My guess is that in many cases host running builds isn't the same box
> > where someone is using native qemu to test those images. (e.g. in my
> > case I'm running builds in minimal chroot, while using distribution qemu
> > to test resulting images).
>=20
> We have a lot of manuals and user expectation that:
>=20
> bitbake some-image
> runqemu some-image
>=20
> 'just works'. That dependency is the only way we can ensure it :/

Isn't "bitbake meta-ide-support" also expected to be executed before
runqemu? At least runqemu-export-rootfs assumes it is and
meta-ide-support already depends on qemu-helper-native which in turn
RDEPENDS on qemu-native.

Or we can add mesa-native to provide libgl-native :).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9LiU8ACgkQN1Ujt2V2gBzmNwCguwHO/R0jEKrH4jceyb8qdgn6
6pgAoI1lt1C7UqXOLqy4x7K3V5gqyzuK
=3tYw
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
