Return-Path: <pbarker@betafive.co.uk>
X-Greylist: delayed 477 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 13 Dec 2014 13:01:33 UTC
Received: from crash.betafive.co.uk (crash.betafive.co.uk [37.187.124.48])
	by mail.openembedded.org (Postfix) with ESMTP id E95A471F23
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Dec 2014 13:01:33 +0000 (UTC)
Received: by crash.betafive.co.uk (Postfix, from userid 1000)
	id B00E13E110E; Sat, 13 Dec 2014 12:54:15 +0000 (GMT)
Date: Sat, 13 Dec 2014 12:54:15 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20141213125415.GB4969@crash.betafive.co.uk>
References: <CANyK_8eZHwtww6AL7L5f34R5Nc7mhSQALaez1NCnHvmUpHWcXw@mail.gmail.com>
	<1417004047.12520.10.camel@linuxfoundation.org>
	<CANyK_8dxvZU8wnqFQGWL=DgFxOdgdq-yaaOkOJrR60w7_M6pfg@mail.gmail.com>
	<20141126151708.GA2460@jama>
MIME-Version: 1.0
In-Reply-To: <20141126151708.GA2460@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg, opkg-config-base and opkg-collateral
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
X-List-Received-Date: Sat, 13 Dec 2014 13:01:41 -0000
X-Groupsio-MsgNum: 60473
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UHN/qo2QbUvPLonB"
Content-Disposition: inline

--UHN/qo2QbUvPLonB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2014 at 04:17:08PM +0100, Martin Jansa wrote:
> On Wed, Nov 26, 2014 at 01:50:38PM +0000, Paul Barker wrote:
> >=20
> > I'd keep three, but refactor them as I've described above:
> > - opkg: Includes '/etc/opkg/opkg.conf'
> > - opkg-arch-config: Includes '/etc/opkg/arch.conf', machine specific
> > - opkg-feed-config: Includes '/etc/opkg/feeds.conf', distro and
> > possibly machine specific
>=20
> Please also check
> http://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-core/m=
eta/distro-feed-configs.bb
>=20
> + filtering the architectures
>=20
> https://github.com/shr-distribution/meta-smartphone/blob/master/meta-shr-=
distro/recipes-core/meta/distro-feed-configs.bbappend
>=20
> + stricter filter for individual MACHINEs based on selected DEFAULTTUNE
>=20
> https://github.com/shr-distribution/meta-smartphone/blob/master/meta-shr-=
distro/conf/distro/include/defaulttunes.inc
>=20

Thanks for the pointer Martin, I forgot to check outside oe-core. Also, sor=
ry
for the late reply, been rather busy recently!

I suggest we drop poky-feed-config-opkg from oe-core as it isn't really usa=
ble
as-is and the Yocto Project manual recommends using distro-feed-config anyw=
ay
(http://www.yoctoproject.org/docs/1.7/mega-manual/mega-manual.html#runtime-=
package-management-build).

I still think the opkg and opkg-collateral recipes should be refactored as I
proposed in my previous email. I'll try to throw together some RFC patches =
this
week.

We could also consider moving distro-feed-config to oe-core if it is the
recommended way to setup opkg feeds. I do think that a unified way of
configuring ipk/deb/rpm feeds would be good to have in the long term, but w=
e can
at least tidy up the opkg configuration for now.

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--UHN/qo2QbUvPLonB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUjDb3AAoJEBwoJlo7UPQDpCkH/0cwE1SxtboLjtlrjDhq79wH
2K1lJxWhufbVMf+Wny4qFIIFgOy+bOIrGq8+N3MV1M9YJhOgbQI/jxlioP47qnDz
doemtkX7KMtlpbXmiEhAPOMSMWpQ6CxkcA9ihrdYzXYBJwJc9UvOfwd9F+/djaSw
ytO5gKh2tyPGjr64YLaMldjIjLwhL7bnWWYvADt8t2+1nPdzpiqChogI0d6Et0io
dzuR0qZOatYuKZmIb50nuOGkHqNWooIFJge/gFc9cMtsVy+9C+deKbdcP3bhPndK
85r9vkrgfbCXVGiHHaA3TUqdrfERq6J/wwB2crzKrpv/pI4iX70KlGjg+Y8b81U=
=oWq2
-----END PGP SIGNATURE-----

--UHN/qo2QbUvPLonB--
