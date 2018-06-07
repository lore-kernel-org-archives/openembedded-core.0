Return-Path: <Kexin.Hao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2850E770FF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 12:09:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w57C9esD006077
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 7 Jun 2018 05:09:40 -0700 (PDT)
Received: from pek-khao-d2 (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Thu, 7 Jun 2018 05:09:39 -0700
Date: Thu, 7 Jun 2018 20:08:39 +0800
From: Kevin Hao <kexin.hao@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20180607120839.GK11934@pek-khao-d2>
References: <cover.1528320772.git.raj.khem@gmail.com>
	<CADkTA4OwmjAJwxauPDWpxsoxENxSHpiNWkSm-Y8Gi9_CNdrMqg@mail.gmail.com>
	<8224f706c78b5e41ce6a3673d221a983ccbffe77.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <8224f706c78b5e41ce6a3673d221a983ccbffe77.camel@linuxfoundation.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Originating-IP: [147.11.105.121]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 00/12] Add GCC 8 recipes
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
X-List-Received-Date: Thu, 07 Jun 2018 12:09:42 -0000
X-Groupsio-MsgNum: 112300
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iSeZnk6FyAS3EJ1y"
Content-Disposition: inline

--iSeZnk6FyAS3EJ1y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 07, 2018 at 11:42:08AM +0100, Richard Purdie wrote:
> On Wed, 2018-06-06 at 20:45 -0400, Bruce Ashfield wrote:
> >=20
> >=20
> > On Wed, Jun 6, 2018 at 5:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > > This changeset is including the review feedback from last patchset
> > >=20
> > > - Fixes ppc such that we dont have to change machine options so it
> > > remains backward compatible and folks can still use gcc7
> > > - Tweaks arm tunes to set -mtune instead of -mcpu, this avoids
> > > conflicts between -march/-mcpu
> > > - Removes workarounds to avoid these conflicts in valgrind
> > > - Add mips 74kc tune files
> > > - Linux yocto changes are also part of Bruce's kernel updates but
> > > this makes it complete until those changes are pulled in
> >=20
> > Correct. I have all of the gcc8 patches in linux-yocto 4.12/4.14/4.15
> > and linux-yocto-dev.
> >=20
> > They should have been covered by my last set of SRCREV updates, and I
> > noticed that
> > some are in, and some not.
> >=20
> > I'll resubmit my SRCREV queue tomorrow, and that will cover the gcc8
> > angle.
>=20
> Thanks. Khem's series failed since it doesn't cover 4.14, Bruce's
> patchset helped a lot.
>=20
> It looks like we have kernel failures with:
>=20
> MACHINE=3D"mpc8315e-rdb" DISTRO=3D"poky-lsb" in linux-yocto 4.14
> https://autobuilder.yocto.io/builders/nightly-ppc-lsb/builds/1051/steps/B=
uildImages_1/logs/stdio
>=20
> MACHINE=3D"mpc8315e-rdb" DISTRO=3D"poky" in linux-yocto 4.15
> https://autobuilder.yocto.io/builders/nightly-ppc/builds/1066/steps/Build=
Images_1/logs/stdio
>=20
> MACHINE=3D"edgerouter" DISTRO=3D"poky-lsb" in linux-yocto 4.14:
> https://autobuilder.yocto.io/builders/nightly-mips-lsb/builds/1040/steps/=
BuildImages_1/logs/stdio
>=20
> MACHINE=3D"edgerouter" DISTRO=3D"poky" in linux-yocto 4.15:
> https://autobuilder.yocto.io/builders/nightly-mips/builds/1044/steps/Buil=
dImages_1/logs/stdio
>=20
> I realised the above may be due to missing BSP SRCREV updates (cc Kevin)?

I will update the SRCREV for these boards ASAP.

Thanks,
Kevin

>=20
> With gcc 8, it seems we have a problem with meta-mingw:
>=20
> https://autobuilder.yocto.io/builders/nightly-qa-extras/builds/1062/steps=
/BuildImages_3/logs/stdio
>=20
> The build isn't finished but I'm hoping these are the main remaining
> issues.
>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
>=20
>=20
>=20
>=20
>=20

--iSeZnk6FyAS3EJ1y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEHc6qFoLCZqgJD98Zk1jtMN6usXEFAlsZIEcACgkQk1jtMN6u
sXGXSggAvB5/+AGZ9JESNaHseAS4qqgbQvsBx+gDF5MJiLmxYTETyrTewKo1GjkP
Kl2D0993La0F78Z52H+Rvaf6098mi+eev2vWB6uCYLlvg3NinmjcFqPVSoGGQ3FQ
ZA7/M7q8xaTjl0/zwzFx5OL8/hm0VrQO0WvkVTZoERxlh56tGlPSVgMHCx+qmOu3
PEFClukedJoD4xFiZWAT08vLFXnrzqiq43VzqH42SxVGDpJ/D4XhDPGKqgGH1fkA
51JYuuCtxduy/HBGS8ag0YL7JFNJ3D25BCsJjstykdF6jRTUAnhvr3y7cUXtySJM
kySgE1x+gxL2qR4m+Fbaq+FYTYWZHg==
=HNA4
-----END PGP SIGNATURE-----

--iSeZnk6FyAS3EJ1y--
