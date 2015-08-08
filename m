Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id BB021767F3
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Aug 2015 19:48:46 +0000 (UTC)
Received: by pdco4 with SMTP id o4so56834979pdc.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Aug 2015 12:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=WG4q85wDFuMbmcla1lHrAibV9QPrjp1SfjjDYPu+tBU=;
	b=A2bY/Z4wEbBIfLgB+dj2LBta6U6hv2+SmNCP+8azRwxwHQJBrYjF4tn4n8UPTICoxc
	iEBHfYBIZlAvKHLiGsrBb6gMCsDwcWLqcIyk03u8Eyq6UGKJA/NuPJo+GdBBw/bpxcnn
	uNayHL41QCympd6avkSm94ZZN1oZpQCb87MeTwXno9hucwOCtvu8U5uQ/Xhc3elk0Mxm
	uUt7ftnsoZkBFv88w7mXtMN981NQZ7pO1kvyVrORX4TiYcFsQzAqWa8+Va5GYS1OrbHI
	SB0gWIYetdtJQxrdAX+AcF/diGrB5s2Hy4NLTQV/mh/rSr5gzlVxVVH5XhNADqCQqJyE
	/40g==
X-Received: by 10.70.45.134 with SMTP id n6mr29210669pdm.124.1439063327032;
	Sat, 08 Aug 2015 12:48:47 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:61b5:b56b:3665:2b08?
	([2601:646:8601:4580:61b5:b56b:3665:2b08])
	by smtp.gmail.com with ESMTPSA id
	tt8sm3190712pbc.49.2015.08.08.12.48.46
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 08 Aug 2015 12:48:46 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <45936f059111b38f8850d5972db1ea1485dee82a.1438956967.git.alexander.kanavin@linux.intel.com>
Date: Sat, 8 Aug 2015 12:48:44 -0700
Message-Id: <7FCE78C2-85DC-44BF-8C64-7912AB432468@gmail.com>
References: <cover.1438956967.git.alexander.kanavin@linux.intel.com>
	<cover.1438956967.git.alexander.kanavin@linux.intel.com>
	<45936f059111b38f8850d5972db1ea1485dee82a.1438956967.git.alexander.kanavin@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/7] gptfdisk: update to 1.0.0
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
X-List-Received-Date: Sat, 08 Aug 2015 19:48:48 -0000
X-Groupsio-MsgNum: 69159
Content-Type: multipart/signed;
	boundary="Apple-Mail=_186904FE-5098-403B-906D-C75A69E31F2A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_186904FE-5098-403B-906D-C75A69E31F2A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 7, 2015, at 7:28 AM, Alexander Kanavin =
<alexander.kanavin@linux.intel.com> wrote:
>=20
> Also, use tarballs instead of git for fetching source code.
> git repository does not have version tags, so upstream version check
> cannot be performed.
>=20
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
> .../recipes-devtools/fdisk/{gptfdisk_git.bb =3D> gptfdisk_1.0.0.bb} | =
8 +++-----
> 1 file changed, 3 insertions(+), 5 deletions(-)
> rename meta/recipes-devtools/fdisk/{gptfdisk_git.bb =3D> =
gptfdisk_1.0.0.bb} (75%)
>=20
> diff --git a/meta/recipes-devtools/fdisk/gptfdisk_git.bb =
b/meta/recipes-devtools/fdisk/gptfdisk_1.0.0.bb
> similarity index 75%
> rename from meta/recipes-devtools/fdisk/gptfdisk_git.bb
> rename to meta/recipes-devtools/fdisk/gptfdisk_1.0.0.bb
> index 477c1d9..f4b0e32 100644
> --- a/meta/recipes-devtools/fdisk/gptfdisk_git.bb
> +++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.0.bb
> @@ -5,11 +5,9 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552"
>=20
> DEPENDS =3D "util-linux popt ncurses"
>=20
> -PV =3D "0.8.10+git${SRCPV}=E2=80=9D

its always preferable to have PV contain SRCPV for recipes using SCM =
based fetch mechanism. Don=E2=80=99t drop it

> -SRCREV =3D "a920398fa393f9d6301b32b191bc01e086ab8bc8"
> -SRC_URI =3D "git://git.code.sf.net/p/gptfdisk/code"
> -
> -S =3D "${WORKDIR}/git"
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz"
> +SRC_URI[md5sum] =3D "2061f917af084215898d4fea04d8388f"
> +SRC_URI[sha256sum] =3D =
"5b66956743a799fc0471cdb032665c1391e82f9c5b3f1d7d726d29fe2ba01d6c"
>=20
> do_install() {
>     install -d ${D}${sbindir}
> --
> 2.1.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_186904FE-5098-403B-906D-C75A69E31F2A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXGXR0ACgkQuwUzVZGdMxRLvQCfa7tOM2nrGkKHLEv5Ue6My6cU
toMAoIJHh5BQdtCnZoXWBdO6+++Y50wG
=1Ev7
-----END PGP SIGNATURE-----

--Apple-Mail=_186904FE-5098-403B-906D-C75A69E31F2A--
