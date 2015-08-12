Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id BF2A1767F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 01:50:24 +0000 (UTC)
Received: by pawu10 with SMTP id u10so2902102paw.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 18:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=7GymgCIEIkp32dNSCKDv6ehSiveC62eVxQe7Rehu5PU=;
	b=WHqGCOoMxue9PK32L5FgyJ6BDOxW2c+xM6U4NbU9ZrdX53rORI1tK1OU5P0AUpvkye
	O17f3vsIyLlXqR2to1VNt0sxtAzpgjJFXCk0Zv3Ht1aRSVWnLarEWLJnUI0VUSCEnh5P
	NU/4fWKjiys4cibl5uJTPDjvY4QfvV1SnYH4cZr2hFQi+k2kcz/21hGWLOgHGAXA7Pxy
	n21mO6opYZAEFZPnt7i035BCQMDWMke/xaPR4/i5b9Vu80akhTVh/xx3D5U06aP2kzS/
	BPSii7Uoe0jaCwErh2+ASMGAUhRRsZQt1h0hrKZOVgEaTrPj+WMLfLG4QWaYF5bnUKbl
	VvYw==
X-Received: by 10.68.184.225 with SMTP id ex1mr14169952pbc.75.1439344224736;
	Tue, 11 Aug 2015 18:50:24 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:157:79f9:ef5c:d3d0?
	([2601:646:8601:4580:157:79f9:ef5c:d3d0])
	by smtp.gmail.com with ESMTPSA id v8sm4222052pdm.89.2015.08.11.18.50.23
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Aug 2015 18:50:24 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <6591f1a55a50b6417755e7e6720750818dab6532.1439318387.git.jussi.kukkonen@intel.com>
Date: Tue, 11 Aug 2015 18:50:21 -0700
Message-Id: <CE58424F-B08C-41D9-B302-D4C4C2C3D074@gmail.com>
References: <65f10f6264c7a8d751c5d0a56a38c920e02236b2.1439318387.git.jussi.kukkonen@intel.com>
	<cover.1439318387.git.jussi.kukkonen@intel.com>
	<6591f1a55a50b6417755e7e6720750818dab6532.1439318387.git.jussi.kukkonen@intel.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] nfs-utils: Upgrade 1.3.1 -> 1.3.2
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
X-List-Received-Date: Wed, 12 Aug 2015 01:50:27 -0000
X-Groupsio-MsgNum: 69325
Content-Type: multipart/signed;
	boundary="Apple-Mail=_01ADDE59-F3A6-48AF-B9E4-C663F61A1058";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_01ADDE59-F3A6-48AF-B9E4-C663F61A1058
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 11, 2015, at 12:13 PM, Jussi Kukkonen =
<jussi.kukkonen@intel.com> wrote:
>=20
> Let "--enable-tirpc" be selected in configure by default: it is
> a requirement for ipv6 support. This should not grow a typical
> image size as libtirpc is a rpcbind dependency already.
>=20

ideally you would want to define a PACKAGECONFIG for this which is =
enabled/disabled with ipv6 distro feature knob.

> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
> .../nfs-utils/{nfs-utils_1.3.1.bb =3D> nfs-utils_1.3.2.bb}           | =
7 +++----
> 1 file changed, 3 insertions(+), 4 deletions(-)
> rename meta/recipes-connectivity/nfs-utils/{nfs-utils_1.3.1.bb =3D> =
nfs-utils_1.3.2.bb} (95%)
>=20
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb =
b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.2.bb
> similarity index 95%
> rename from meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
> rename to meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.2.bb
> index 6da8509..59252c5 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.2.bb
> @@ -8,7 +8,7 @@ LICENSE =3D "MIT & GPLv2+ & BSD"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D95f3a93a5c3c7888de623b46ea085a84"
>=20
> # util-linux for libblkid
> -DEPENDS =3D "libcap libnfsidmap libevent util-linux sqlite3"
> +DEPENDS =3D "libcap libnfsidmap libevent libtirpc util-linux sqlite3"
> RDEPENDS_${PN}-client =3D "rpcbind bash"
> RDEPENDS_${PN} =3D "${PN}-client bash"
> RRECOMMENDS_${PN} =3D "kernel-module-nfsd"
> @@ -33,8 +33,8 @@ SRC_URI =3D =
"${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
>            file://nfs-utils-debianize-start-statd.patch \
> "
>=20
> -SRC_URI[md5sum] =3D "8de676b9ff34b8f9addc1d0800fabdf8"
> -SRC_URI[sha256sum] =3D =
"ff79d70b7b58b2c8f9b798c58721127e82bb96022adc04a5c4cb251630e696b8"
> +SRC_URI[md5sum] =3D "4cdffb2c7f7fd2bdceaba55ab1b881da"
> +SRC_URI[sha256sum] =3D =
"2966bb431c06e9ba35a54f48f89db03a5132bc2d8ed8084ac8ccb34e25a9b739"
>=20
> # Only kernel-module-nfsd is required here (but can be built-in)  - =
the nfsd module will
> # pull in the remainder of the dependencies.
> @@ -58,7 +58,6 @@ EXTRA_OECONF =3D "--with-statduser=3Drpcuser \
>                 --disable-nfsv41 \
>                 --enable-uuid \
>                 --disable-gss \
> -                --disable-tirpc \
>                 --disable-nfsdcltrack \
>                 --with-statdpath=3D/var/lib/nfs/statd \
>                "
> --
> 2.1.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_01ADDE59-F3A6-48AF-B9E4-C663F61A1058
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXKpl0ACgkQuwUzVZGdMxQiHACeJaYYGcu4Yzfg4hhyzDArW2bz
nRQAoIUeQzj+yy2lI6TjU7UIQWBxjsGY
=uMod
-----END PGP SIGNATURE-----

--Apple-Mail=_01ADDE59-F3A6-48AF-B9E4-C663F61A1058--
