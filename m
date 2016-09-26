Return-Path: <anibal.limon@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id DB2346074F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 15:57:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 26 Sep 2016 08:57:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,400,1470726000"; 
	d="asc'?scan'208";a="1046072585"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.35]) ([10.219.5.35])
	by fmsmga001.fm.intel.com with ESMTP; 26 Sep 2016 08:57:51 -0700
To: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <20160923200859.21433-1-edwin.plauchu.camacho@linux.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <57E945AE.2000103@linux.intel.com>
Date: Mon, 26 Sep 2016 10:58:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20160923200859.21433-1-edwin.plauchu.camacho@linux.intel.com>
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
Subject: Re: [PATCH] ptest-runner: recipe update related to minor fix.
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
X-List-Received-Date: Mon, 26 Sep 2016 15:57:50 -0000
X-Groupsio-MsgNum: 87546
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="BHORK6KUHhhwKpo1h5jvlJhrSUeedMh3f"

--BHORK6KUHhhwKpo1h5jvlJhrSUeedMh3f
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Edwin,

Please write a better explanation about the changes also you need to
bump the version to 2.0.1.

	alimon

On 09/23/2016 03:08 PM, Edwin Plauchu wrote:
> From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
>=20
> A minor fix has been published regarding the need of a user
> of being noticed when some run-ptest script fails.
>=20
> [YOCTO #9752]
>=20
> Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
> ---
>  meta/recipes-support/ptest-runner/ptest-runner_2.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb b/me=
ta/recipes-support/ptest-runner/ptest-runner_2.0.bb
> index aaa7c59..34d360e 100644
> --- a/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
> +++ b/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
> @@ -7,7 +7,7 @@ HOMEPAGE =3D "http://git.yoctoproject.org/cgit/cgit.cgi=
/ptest-runner2/about/"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D751419260aa954499f7abaabaa8=
82bbe"
> =20
> -SRCREV =3D "8bfdf946e784f4d5757bebee1fbc4b4a3d7a95c4"
> +SRCREV =3D "e2aa4256745377b784c8691f546041b59f6e046b"
>  PV =3D "2.0+git${SRCPV}"
> =20
>  SRC_URI =3D "git://git.yoctoproject.org/ptest-runner2"
>=20


--BHORK6KUHhhwKpo1h5jvlJhrSUeedMh3f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJX6UWwAAoJEGJqcE9h3glgriYP/0kBSWyI/5u7vX5VObj19z/n
9K0O1DsXegXOdC97wt4XzTuoI/lxOD7Zij5r5u+o1TX4nQCBY2Adz6hcTDEr1anv
s/6uNj50rSj/7oW/7mHlqrWDLUSsKAbuPn0DHs7Xhi0Lk5WJF30QKjBSQBfAs6Ux
/DZr5RBxv4cyeMeLQ+Lqqw+iXRss8/H2PYgckCGglB8sysSOSs5aMU2JJXmLO2HW
YKPB0DvF1Erfqa3XNk7F9V2gjmOV9TnQ5je0FixPr6ONV/EAT6ASo1WRDh4e3bIQ
leYsOc0CT4hoXx9EifEJlDPye8YVidBdJLDMw7qwjIFkOXOmmVN3FrYCGrMvaILp
fF+DMrI266Dhm71B+2nsEpwfKOcutO/Re7bzVXM77sECDI4Fw3Si1zpcXDWYatsv
ogD9GPXYJiV1HnQ59ngmbEwk78lzl03Jg6VnemBaYzVJGvrejEaq112zFVhJXUze
neRjnbd9XN2591sP/s8XssNmmBk3PbDB8mZ+f3r6tPvtAfVHMPaTkvbyQiI4kfSp
DoRzPGO5nLWK7RRohWVAxyldPxfseOgQh3pOcRxH1hhu8I/YvfvHpP1LbHxXVnyW
SCdE/lxeOCVYrlqJ8Df5g3jf5I/l7Rl3YLYZVnxKOMhKDYwkEcE60IoJH2DusFa5
NOXzCJJR43Fk5LlXsNFi
=V2nD
-----END PGP SIGNATURE-----

--BHORK6KUHhhwKpo1h5jvlJhrSUeedMh3f--
