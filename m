Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SHcCY-0005Fb-J3
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 16:37:46 +0200
Received: by wgbdr12 with SMTP id dr12so4341426wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 07:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dhLXet3mAuxQwiRNfd2cSwF6xnyx+1OyqemgjB1sYE0=;
	b=Woz//xXApOmm1/31hO7jhEGobe3glQ2+/Kh0R7pJ1Sg7ykH2Bj7u3enn5ycbtMfup9
	nlh+WQiJ6XCnQqxNJ9BocLt/+W3Pu4ktB7BSDKs87IIefkXRyz9ABu64nAAYzGtHuLvC
	mlGHf2t1IVZ9MvPVMZ0E+bQd1QzEzGTjjEWx+hTs7R8Xdx9v4R+iP9CQbg+Co6FGC1b3
	k6Ag5rMjph3kjlaeupSFhcUiKxDATeK68AVzpR015395xtr0EY00mrhUEp1nJZsQxxjD
	sraazPo8pE/2TnQ0z8VdYxHgkT1dDWor4T0jWXgwI+UeXS2u1XWlaJx5COzxkyNBr6bn
	KynQ==
Received: by 10.180.100.230 with SMTP id fb6mr8784996wib.3.1334068103623;
	Tue, 10 Apr 2012 07:28:23 -0700 (PDT)
Received: from localhost ([94.230.152.246]) by mx.google.com with ESMTPS id
	ev10sm17691345wid.10.2012.04.10.07.28.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Apr 2012 07:28:22 -0700 (PDT)
Date: Tue, 10 Apr 2012 16:28:22 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120410142822.GF3583@jama.jama.net>
References: <1333626507-32182-1-git-send-email-stefan@herbrechtsmeier.net>
	<4F7E607E.9050101@linux.intel.com>
	<1967D97F-63A7-49DA-930F-A0C6F1F4112F@dominion.thruhere.net>
	<1334065279.10826.14.camel@ted>
	<519A24BF-BBF0-4C58-8418-27F742D03D7F@dominion.thruhere.net>
	<4F84415A.20104@herbrechtsmeier.net>
	<52751372-18B8-47AC-955C-BD3EB17FDD8D@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <52751372-18B8-47AC-955C-BD3EB17FDD8D@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] u-boot: add machine name to spl image name
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
X-List-Received-Date: Tue, 10 Apr 2012 14:37:46 -0000
X-Groupsio-MsgNum: 20509
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hUH5gZbnpyIv7Mn4"
Content-Disposition: inline

--hUH5gZbnpyIv7Mn4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 10, 2012 at 04:22:43PM +0200, Koen Kooi wrote:
>=20
> Op 10 apr. 2012, om 16:19 heeft Stefan Herbrechtsmeier het volgende gesch=
reven:
>=20
> > Am 10.04.2012 15:56, schrieb Koen Kooi:
> >> Op 10 apr. 2012, om 15:41 heeft Richard Purdie het volgende geschreven:
> >>=20
> >>> On Fri, 2012-04-06 at 06:29 -0700, Koen Kooi wrote:
> >>>> Op 5 apr. 2012 om 20:18 heeft Saul Wold<sgw@linux.intel.com>  het vo=
lgende geschreven:
> >>>>=20
> >>>>> On 04/05/2012 04:48 AM, Stefan Herbrechtsmeier wrote:
> >>>>>> Signed-off-by: Stefan Herbrechtsmeier<stefan@herbrechtsmeier.net>
> >>>>>> ---
> >>>>>> meta/recipes-bsp/u-boot/u-boot.inc        |    2 +-
> >>>>>> meta/recipes-bsp/u-boot/u-boot_2011.03.bb |    2 +-
> >>>>>> meta/recipes-bsp/u-boot/u-boot_2011.06.bb |    2 +-
> >>>>>> 3 files changed, 3 insertions(+), 3 deletions(-)
> >>>>>>=20
> >>>>>> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp=
/u-boot/u-boot.inc
> >>>>>> index 700d5d3..0445c34 100644
> >>>>>> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> >>>>>> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> >>>>>> @@ -32,7 +32,7 @@ UBOOT_MAKE_TARGET ?=3D "all"
> >>>>>> # deploy directory.  For those versions they can set the following=
 variables
> >>>>>> # to allow packaging the SPL.
> >>>>>> SPL_BINARY ?=3D ""
> >>>>>> -SPL_IMAGE ?=3D "${SPL_BINARY}-${PV}-${PR}"
> >>>>>> +SPL_IMAGE ?=3D "${SPL_BINARY}-${MACHINE}-${PV}-${PR}"
> >>>>>> SPL_SYMLINK ?=3D "${SPL_BINARY}-${MACHINE}"
> >>>>>>=20
> >>>>>> do_compile () {
> >>>>>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb b/meta/reci=
pes-bsp/u-boot/u-boot_2011.03.bb
> >>>>>> index 1ebdbea..e99bc2c 100644
> >>>>>> --- a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
> >>>>>> +++ b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
> >>>>>> @@ -17,7 +17,7 @@ FILESDIR =3D "${@os.path.dirname(d.getVar('FILE'=
,1))}/u-boot-git/${MACHINE}"
> >>>>>> SRCREV =3D "19b54a701811220221fc4d5089a2bb18892018ca"
> >>>>>>=20
> >>>>>> PV =3D "v2011.03+git${SRCPV}"
> >>>>>> -PR =3D "r5"
> >>>>>> +PR =3D "r6"
> >>>>>>=20
> >>>>>> SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=
=3Dgit"
> >>>>>>=20
> >>>>>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb b/meta/reci=
pes-bsp/u-boot/u-boot_2011.06.bb
> >>>>>> index 8ebdbff..680401f 100644
> >>>>>> --- a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
> >>>>>> +++ b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
> >>>>>> @@ -17,7 +17,7 @@ FILESDIR =3D "${@os.path.dirname(d.getVar('FILE'=
,1))}/u-boot-git/${MACHINE}"
> >>>>>> SRCREV =3D "b1af6f532e0d348b153d5c148369229d24af361a"
> >>>>>>=20
> >>>>>> PV =3D "v2011.06+git${SRCPV}"
> >>>>>> -PR =3D "r0"
> >>>>>> +PR =3D "r1"
> >>>>>>=20
> >>>>>> SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=
=3Dgit"
> >>>>>>=20
> >>>>> Merged into OE-Core
> >>>> wait a minute, why was this merged?
> >>> In retrospect it shouldn't.
> >> Can we back it out? It breaks a ton of buildscripts. SPL_SYMLINK alrea=
dy has the machine.
> > But this means that your SPL_SYMLINK can point to a wrong SPL_IMAGE if =
you don't use machine in the tmpdir path and build more than one machine.
>=20
> I guess I'll have a suggestion for the 1.3 release:
>=20
> [koen@Angstrom-F16-vm-rpm meta-angstrom]$ git grep DEPLOY_DIR_IMAGE
> conf/distro/include/angstrom.inc:DEPLOY_DIR_IMAGE =3D "${DEPLOY_DIR}/imag=
es/${MACHINE}"

Looks good :)
meta-shr/conf/distro/shr.conf:DEPLOY_DIR_IMAGE =3D "${DEPLOY_DIR}/images/${=
MACHINE}"

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hUH5gZbnpyIv7Mn4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+EQ4YACgkQN1Ujt2V2gBzHrgCcD+9MYPmv36Cbav+r6u0RdD/5
XVAAnjAaxKOeLAR7iBjgkzX3lemvEttq
=vpre
-----END PGP SIGNATURE-----

--hUH5gZbnpyIv7Mn4--
