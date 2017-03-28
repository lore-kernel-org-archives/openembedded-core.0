Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id CE0D577A87
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 18:12:35 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 81so23077485pgh.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 11:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=1CYBLr/ujnvQeAbZ/9+8Gk4vd0xLXMPCl4wUQ8kgiUU=;
	b=qBeP12n1jzzIlahiqpuQLCXiLUK0XO+p2/7R8unij9NHPbOfu2YnCoWlhHQjswKJM5
	7sI3fKnmlf5GoU/9S3S8ME9pOBpppWJtdrtYseOIXkkuoIUvLNOSAtVhO+lasPlwiuH6
	KZWTIoL0vtJZl5x+cLhJStqewU9W+YWm5W2BQE51nfY+iDEpQZ0X1LwOpEaU1BVon/uH
	fL+UD7oQlVSXxzqT11KolRa6WUV72q2J4yDVhX7sxMOoWxTUX2399l5y1vcSYmHY32dY
	ZuJsbi8AhUmvFEMtc55rw+wmyFoTdfZNdRR57X/w63Kzp1digXmMMMZSId6H06xltwiY
	Zb3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=1CYBLr/ujnvQeAbZ/9+8Gk4vd0xLXMPCl4wUQ8kgiUU=;
	b=Pn/Kg/mXfqXk6Sl6XyMqlRfNeqYqYy0N1y/dDOea+eXeeTW15CCIt1TfSlyyXQ5SzN
	2sxNE7kQhcM+k/wv3v9uxCsUZE5BwNovy9FbZDOLzEtUtIFMLZOtoNZDjdyNDfUDB+XZ
	6AgQdAM+UleBCZ1qRQ4Hs4wtUCCkaH3QMVO858fCanen9eCUzhL+aiBhucuya3OdX55V
	IjQN+6iE+jof2V1RGCEeLmSDk0gJG6A6vxjuVIXu6xINu+yOCFhRvwWJqNL5JtzhZfWf
	EHODK5XssfRtcHvh8xYjCRzStEr4Uqaq8pX+TYjZjudbOnxsGvTaSW0X5hEShVPEaGNw
	hlSw==
X-Gm-Message-State: AFeK/H1PJUVJPZAoqSbMjpnpOTBPrncLmck0/YM1ku988CT985YKDdSe8e78PLMl3dZTuQ==
X-Received: by 10.99.56.88 with SMTP id h24mr31398396pgn.108.1490724756247;
	Tue, 28 Mar 2017 11:12:36 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:647:4c00:23ec:1153:8bec:b665:1636])
	by smtp.gmail.com with ESMTPSA id
	11sm8731881pgf.28.2017.03.28.11.12.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Mar 2017 11:12:34 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <20170328040201.20341-1-jonathan.yong@intel.com>
	<20170328040201.20341-3-jonathan.yong@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <245d8d7c-2198-b3e0-bb34-7543b24808e9@gmail.com>
Date: Tue, 28 Mar 2017 11:12:28 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170328040201.20341-3-jonathan.yong@intel.com>
Subject: Re: [PATCH] f2fs-tools: Update to Version 1.8.0
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
X-List-Received-Date: Tue, 28 Mar 2017 18:12:36 -0000
X-Groupsio-MsgNum: 95393
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="8MqjarO5rnlv189CEtnh0xh2mepKK1pSu"

--8MqjarO5rnlv189CEtnh0xh2mepKK1pSu
Content-Type: multipart/mixed; boundary="UnVFwtTVL7cfFAr3V34cREKmUbQ8vjHbb";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <245d8d7c-2198-b3e0-bb34-7543b24808e9@gmail.com>
Subject: Re: [OE-core] [PATCH] f2fs-tools: Update to Version 1.8.0
References: <20170328040201.20341-1-jonathan.yong@intel.com>
 <20170328040201.20341-3-jonathan.yong@intel.com>
In-Reply-To: <20170328040201.20341-3-jonathan.yong@intel.com>

--UnVFwtTVL7cfFAr3V34cREKmUbQ8vjHbb
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 3/27/17 9:02 PM, Yong, Jonathan wrote:
> Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
> ---
>  .../0002-Fix-mkfs-out-of-tree-builds.patch         | 27 ++++++++++++++=
++++++++
>  .../{f2fs-tools_1.4.0.bb =3D> f2fs-tools_1.8.0.bb}   |  5 ++--
>  2 files changed, 30 insertions(+), 2 deletions(-)
>  create mode 100644 meta-filesystems/recipes-utils/f2fs-tools/f2fs-tool=
s/0002-Fix-mkfs-out-of-tree-builds.patch
>  rename meta-filesystems/recipes-utils/f2fs-tools/{f2fs-tools_1.4.0.bb =
=3D> f2fs-tools_1.8.0.bb} (81%)
>=20
> diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0002-=
Fix-mkfs-out-of-tree-builds.patch b/meta-filesystems/recipes-utils/f2fs-t=
ools/f2fs-tools/0002-Fix-mkfs-out-of-tree-builds.patch
> new file mode 100644
> index 0000000..3aadf3c
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0002-Fix-mkf=
s-out-of-tree-builds.patch
> @@ -0,0 +1,27 @@
> +From 1d4f6b6a945eabb364a2035d5ef0b69f68a87f74 Mon Sep 17 00:00:00 2001=

> +From: "Yong, Jonathan" <jonathan.yong@intel.com>
> +Date: Mon, 27 Mar 2017 08:34:06 +0000
> +Subject: [PATCH] Fix mkfs out of tree builds
> +
> +Libraries are built in builddir, not srcdir, fix Makefile.am
> +accordingly.

This patch should also be upstreamed into f2fs

> +
> +Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
> +---
> + mkfs/Makefile.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/mkfs/Makefile.am b/mkfs/Makefile.am
> +index 8b4c16c..ae211b2 100644
> +--- a/mkfs/Makefile.am
> ++++ b/mkfs/Makefile.am
> +@@ -10,5 +10,5 @@ lib_LTLIBRARIES =3D libf2fs_format.la
> + libf2fs_format_la_SOURCES =3D f2fs_format_main.c f2fs_format.c f2fs_f=
ormat_utils.c
> + libf2fs_format_la_CFLAGS =3D -DWITH_BLKDISCARD
> + libf2fs_format_la_CPPFLAGS =3D -I$(top_srcdir)/include
> +-libf2fs_format_la_LDFLAGS =3D -luuid -L$(top_srcdir)/lib -lf2fs \
> ++libf2fs_format_la_LDFLAGS =3D -luuid -L$(top_builddir)/lib -lf2fs \
> + 	-version-info $(FMT_CURRENT):$(FMT_REVISION):$(FMT_AGE)
> +--=20
> +2.10.2
> +
> diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.4.0=
=2Ebb b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.8.0.bb
> similarity index 81%
> rename from meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.4.0.=
bb
> rename to meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.8.0.bb=

> index 1a558e7..691cb6e 100644
> --- a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.4.0.bb
> +++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.8.0.bb
> @@ -7,9 +7,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D362b4b2594c=
d362b874a97718faa51d3"
>  # to provide libuuid
>  DEPENDS =3D "util-linux"
> =20
> -SRCREV =3D "baac4b4e6f41ceb02511da49dd3707674f3fea21"
> +SRCREV =3D "1e7aedf99b85d16f94d1d8ad2fcf846403bb2174"
>  SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2f=
s-tools.git \
> -    file://0001-Remove-AC_CHECK_FILE-for-cross-compilation.patch"
> +    file://0001-Remove-AC_CHECK_FILE-for-cross-compilation.patch \
> +    file://0002-Fix-mkfs-out-of-tree-builds.patch"
>  S =3D "${WORKDIR}/git"
> =20
>  inherit pkgconfig autotools
>=20


--UnVFwtTVL7cfFAr3V34cREKmUbQ8vjHbb--

--8MqjarO5rnlv189CEtnh0xh2mepKK1pSu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAljap5EACgkQuwUzVZGdMxSF+QCgiA1hw3QVBn9y60zWoK/Ykjok
TlIAn1T8VuypKhOjTIkYQ4f443F7B5rQ
=mPI8
-----END PGP SIGNATURE-----

--8MqjarO5rnlv189CEtnh0xh2mepKK1pSu--
