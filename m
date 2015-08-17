Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6883575D4F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 05:15:19 +0000 (UTC)
Received: by pawq9 with SMTP id q9so2489802paw.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Aug 2015 22:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=IJ/3k2/nGr+7jwpDJVTKEWViTLoXigQaX/l4PrBWjsY=;
	b=t29JUnrFNgq5AzDr6KGPKjGBkDWtnkKj+B5hQUwQPqvqz/a1Yf33BvrlD5ml+qKXmL
	2ZI1DpEj8csCnbEbLZzm09sNMzudjYJpqecxQhsPsv7+erBORLfIIlK2W+5Ml/OgMWex
	lHPfsKadoo6py2lyxi6VnxYL76O0T3wb7AxFhU4MuUOVMoy9GfI/gScvRw6fp6Zy9Drb
	v75dUQ1lm2x2DnSoUoMJ4xU2L/3w51fzsMwSsUuV8ZUJM/e9Nksg5q3AZUZ06/P/LHQt
	Czcm1shiOjtBgJfZer99ZILO3uEnZP5bAf7YsPCfnOAB50fg7TLyYhNt1TupP1M1kiae
	f/MA==
X-Received: by 10.68.143.40 with SMTP id sb8mr111575906pbb.21.1439788519640;
	Sun, 16 Aug 2015 22:15:19 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:7956:a468:cec5:d8ae?
	([2601:646:8601:4580:7956:a468:cec5:d8ae])
	by smtp.gmail.com with ESMTPSA id
	u16sm13056943pdl.71.2015.08.16.22.15.18
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 16 Aug 2015 22:15:19 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <cover.1439318387.git.jussi.kukkonen@intel.com>
Date: Sun, 16 Aug 2015 22:15:14 -0700
Message-Id: <E8CC593E-A8EA-434A-8E13-09370E39E498@gmail.com>
References: <cover.1439318387.git.jussi.kukkonen@intel.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Upgrades: openssh, nss, nfs-utils, rsvg
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
X-List-Received-Date: Mon, 17 Aug 2015 05:15:22 -0000
X-Groupsio-MsgNum: 69500
Content-Type: multipart/signed;
	boundary="Apple-Mail=_69960BCF-F550-433D-B50E-E68610CA35A7";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_69960BCF-F550-433D-B50E-E68610CA35A7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 11, 2015, at 12:12 PM, Jussi Kukkonen =
<jussi.kukkonen@intel.com> wrote:
>=20
> The openssh upgrade adds a test that currently fails: that looks
> like a failure in our test setup, I've filed a bug for that.


openssl 7.0 has now been released,
see
http://www.openssh.com/txt/release-7.0

it deprecates few things e.g. dsa is disabled by default but its good in =
general
one can still add PubkeyAcceptedKeyTypes=3D+ssh-dss to ssh config files =
keep going. but in general it will be improvement



>=20
>=20
>=20
> The following changes since commit =
a16e0b4014173af46ef80d643bb71055219b0dab:
>=20
>  bitbake: toaster: reduced amount of instance attributes (2015-08-10 =
13:58:02 -0700)
>=20
> are available in the git repository at:
>=20
>  git://git.yoctoproject.org/poky-contrib jku/nss-openssh-nfsutils
>  =
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Djku/nss-openssh=
-nfsutils
>=20
> Jussi Kukkonen (4):
>  openssh: Upgrade 6.8p1 -> 6.9p1
>  nss: Upgrade 3.19.1 -> 3.19.2
>  nfs-utils: Upgrade 1.3.1 -> 1.3.2
>  librsvg: Upgrade 2.40.9 -> 2.40.10
>=20
> .../nfs-utils/{nfs-utils_1.3.1.bb =3D> nfs-utils_1.3.2.bb}    |  7 =
+++----
> .../openssh/{openssh_6.8p1.bb =3D> openssh_6.9p1.bb}          |  4 =
++--
> meta/recipes-gnome/librsvg/librsvg/gtk-option.patch         | 13 =
++++++-------
> .../librsvg/{librsvg_2.40.9.bb =3D> librsvg_2.40.10.bb}       |  4 =
++--
> meta/recipes-support/nss/{nss_3.19.1.bb =3D> nss_3.19.2.bb}   |  6 =
+++---
> 5 files changed, 16 insertions(+), 18 deletions(-)
> rename meta/recipes-connectivity/nfs-utils/{nfs-utils_1.3.1.bb =3D> =
nfs-utils_1.3.2.bb} (95%)
> rename meta/recipes-connectivity/openssh/{openssh_6.8p1.bb =3D> =
openssh_6.9p1.bb} (97%)
> rename meta/recipes-gnome/librsvg/{librsvg_2.40.9.bb =3D> =
librsvg_2.40.10.bb} (91%)
> rename meta/recipes-support/nss/{nss_3.19.1.bb =3D> nss_3.19.2.bb} =
(97%)
>=20
> --
> 2.1.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_69960BCF-F550-433D-B50E-E68610CA35A7
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXRbeYACgkQuwUzVZGdMxR7agCfVckmi5c51sSG2gZhkbBSKQjN
/p8AnAjr3YUy5UkwVzUCGEVpRUAl/Bqg
=HBx7
-----END PGP SIGNATURE-----

--Apple-Mail=_69960BCF-F550-433D-B50E-E68610CA35A7--
