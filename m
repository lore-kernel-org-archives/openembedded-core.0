Return-Path: <pbarker@betafive.co.uk>
Received: from crash.betafive.co.uk (crash.betafive.co.uk [37.187.124.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4A85860167
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 17:58:57 +0000 (UTC)
Received: by crash.betafive.co.uk (Postfix, from userid 1000)
	id 7CAB23E110F; Tue, 30 Dec 2014 17:59:15 +0000 (GMT)
Date: Tue, 30 Dec 2014 17:59:15 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <20141230175915.GB18678@crash.betafive.co.uk>
References: <54A2C3B2.9010006@topic.nl>
MIME-Version: 1.0
In-Reply-To: <54A2C3B2.9010006@topic.nl>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: How do I change the "Architecture" of a package?
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
X-List-Received-Date: Tue, 30 Dec 2014 17:59:08 -0000
X-Groupsio-MsgNum: 60907
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wzJLGUyc3ArbnUjN"
Content-Disposition: inline

--wzJLGUyc3ArbnUjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2014 at 04:24:34PM +0100, Mike Looijmans wrote:
> What if the architecture of a package was accidentally left at its
> default, but it should have been "all" for example?
>=20
> Just putting "inherit allarch" or simply PACKAGE_ARCH=3D"all" into the
> recipe is not enough. You get stuck with a "more specific" older
> version, so that no device wants to upgrade to the newer version
> that's "all" architecture compatible.
>

What package manager are you using on the device? If you're using opkg it s=
hould
prioritise by version not arch unless the command line option
'--prefer-arch-to-version' is passed. If you're using opkg and it's not doi=
ng
that, let me know and I'll look into it when I get chance to.

> Only way to fix this was to manually remove the old version from the
> feeds and also manually remove it from the device, and then
> reinstall it. This works for me personally, but what if I want to
> apply this to about a million devices that are already in the field?
>=20
> What can I do to get them to upgrade from the (in this case)
> "mipsel32" to "all" package?

As an absolute hack, you could rename the package and set it to
replace/conflict/provide the old package name. I think there should be bett=
er
solutions though.

>=20
> (and I have a few dozen of these mis-architectured packages...)
>=20
> --=20
> Mike Looijmans
> --=20

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--wzJLGUyc3ArbnUjN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUoufzAAoJEBwoJlo7UPQD3j8H/R8XRw9d9jbmF493J/DMEhr2
3M2htEbLeGSke6noXCWeJk17vhMDZPiTigvD73Vg3SzEHUZANpfeHYM9XCkFp4Rt
2KZXTJcfJReEESzwlUdfLOPNQy/EuHTd09KtkDrIHL+Yi9Skyf656H5Mi5T/Uw1a
nO045JL3KTP+0DhS05WK81TjTtLzZ3ffVxCni0F2hZ+2l3kUIuQdFQ99N2TVnfzi
rNj9Hqe88557TJgfJUvrl1/ySHh1jiT8ADM/PkMYd2uF1Ky3nYASvbuxEL0Nj0XM
qixbUcZY3yxg13BU/+75UB9gnPbqvUE4Sr4DeGk/5OJeqLu+AFCU438ZJNBHBf0=
=3/JK
-----END PGP SIGNATURE-----

--wzJLGUyc3ArbnUjN--
