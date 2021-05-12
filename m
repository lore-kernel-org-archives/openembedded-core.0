Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.1287.1620784830685177856
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 May 2021 19:00:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.196, mailfrom: robert.joslyn@redrectangle.org)
X-Originating-IP: 173.197.191.182
Received: from smtpclient.apple (rrcs-173-197-191-182.west.biz.rr.com [173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 58186E0005
	for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 02:00:17 +0000 (UTC)
From: "Robert Joslyn" <robert.joslyn@redrectangle.org>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: [OE-core] [PATCH] btrfs-tools: Update to 5.12
Date: Tue, 11 May 2021 19:00:15 -0700
References: <167DEB824CA2E117.28983@lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
In-Reply-To: <167DEB824CA2E117.28983@lists.openembedded.org>
Message-Id: <12D3BB43-799A-4BEA-A43C-1E15E76B4D39@redrectangle.org>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Looks like this update causes btrfs-tools-native to fail to build with olde=
r kernels. I think it just needs a new PACKAGECONFIG, but I=E2=80=99ll take=
 a look and send a v2.

Thanks,
Robert

> On May 10, 2021, at 10:18 PM, Robert Joslyn <robert.joslyn@redrectangle.=
org> wrote:
>=20
> License-Update: libbtrfsutil was relicensed to LGPLv2.1+: https://git.ke=
rnel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git/commit/?id=3D9e30f7=
79e3cbf12a88ebe309ee371851fdfd3aa0
>=20
> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> ---
> .../{btrfs-tools_5.11.1.bb =3D> btrfs-tools_5.12.bb}          | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
> rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.11.1.bb =3D> btr=
fs-tools_5.12.bb} (94%)
>=20
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb b/m=
eta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.bb
> similarity index 94%
> rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb
> rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.bb
> index b5e0561c15..82ff3abfc8 100644
> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb
> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.bb
> @@ -7,10 +7,10 @@ btrfs and an utility (btrfs-convert) to make a btrfs f=
ilesystem from an ext3."
>=20
> HOMEPAGE =3D "https://btrfs.wiki.kernel.org"
>=20
> -LICENSE =3D "GPLv2 & LGPLv3+"
> +LICENSE =3D "GPLv2 & LGPLv2.1+"
> LIC_FILES_CHKSUM =3D " \
>     file://COPYING;md5=3Dfcb02dc552a041dee27e4b85c7396067 \
> -    file://libbtrfsutil/COPYING.LESSER;md5=3D3000208d539ec061b899bce1d9=
ce9404 \
> +    file://libbtrfsutil/COPYING;md5=3D4fbd65380cdd255951079008b364516c =
\
> "
> SECTION =3D "base"
> DEPENDS =3D "lzo util-linux zlib"
> @@ -19,7 +19,7 @@ DEPENDS_append_class-target =3D " udev"
> SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-p=
rogs.git \
>            file://0001-Add-a-possibility-to-specify-where-python-modules=
-ar.patch \
>            "
> -SRCREV =3D "8d5051f279f7994fb80536ef8f846f06d121d898"
> +SRCREV =3D "b16b0a766f06138de2ee32d4d84b7110e469ff49"
> S =3D "${WORKDIR}/git"
>=20
> PACKAGECONFIG ??=3D " \
> --=20
> 2.26.3
>=20
>=20
>=20
>=20

