Return-Path: <Kexin.Hao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5A82571D9F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 05:26:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBB5QrVi016802
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 10 Dec 2017 21:26:53 -0800 (PST)
Received: from pek-khao-d1 (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Sun, 10 Dec 2017 21:26:52 -0800
Date: Mon, 11 Dec 2017 13:30:39 +0800
From: Kevin Hao <kexin.hao@windriver.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20171211053039.GC5051@pek-khao-d1>
References: <20171209024546.16918-1-kexin.hao@windriver.com>
	<20171209024546.16918-2-kexin.hao@windriver.com>
	<CAP9ODKqdYcwwz0U2FG_LQ7cX2JpsX3bQ5q-Mnn2-x7b7xfDaqg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqdYcwwz0U2FG_LQ7cX2JpsX3bQ5q-Mnn2-x7b7xfDaqg@mail.gmail.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Originating-IP: [147.11.105.121]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] wic: plugins: rawcopy: Add support to download the raw image from a http server
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
X-List-Received-Date: Mon, 11 Dec 2017 05:26:53 -0000
X-Groupsio-MsgNum: 106055
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jy6Sn24JjFx/iggw"
Content-Disposition: inline

--jy6Sn24JjFx/iggw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 10, 2017 at 10:53:43PM -0200, Otavio Salvador wrote:
> On Sat, Dec 9, 2017 at 12:45 AM, Kevin Hao <kexin.hao@windriver.com> wrot=
e:
> > Some firmwares are critical for the basic functions of the board, and m=
ay
> > be used by the bootloader. Due to the license issue, we can't integrate
> > it. But we do need it when creating a booting image by using WIC.
> > So add the support for the WIC to download a raw file from http
> > server and write it to a specific part. In order to restrict the
> > downloading behaviour, we introduce a "WKS_ALLOW_DOWNLOAD" variable and
> > only do the downloading when this variable is set.
> >
> > Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
>=20
> This does not make much sense.
>=20
> It does not allow to be downloaded? so build system can download it
> and use it as a normal artifact.=20

In some cases, it doesn't make sense to do so. Because:
a) These firmwares are just raw binary files, they don't need any build or
   process. They are only useful when we try to create a bootable image.
b) There firmwares may be licensed under a proprietary license. We may not
   integrate them to a fully open source build system. But we do want to pr=
ovide
   an easy way for the customer to build a bootable image.

Thanks,
Kevin

>Adding another source way seems
> controversial.
>=20
> --=20
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--jy6Sn24JjFx/iggw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJaLhf/AAoJEJNY7TDerrFx9qUH/A/oKtzRms+hn2A9R4A/4kfI
+HYZzgCCkF/aeJ+IuybY45SX0Sj7R3lvv44U24MnAAv3kqKCd7NDDDheEn88NhMK
TyMIJt6CEwetKMrl+MXYEGnGKU0AMaa1gv0Z1ZgV92mmR/Pb00eAAqJ9nu3KWBrj
l29q3sMe4CjJ0ZpdVCwSrIivz+y78hDmjDoxqS+rQEfUb7AJph4OYL2DnXX8sSKe
0aKlU4ayesC4mUtt6zV3wTu26wnjtzQShFh5p6xrt6m1tTWDPgbCf7gVlVGeGKuq
1sWCKXj9DkfBUPL+lhzqvhnHPFhcmb8tNPIoKXGffalXiXjMv0rprBNVZQvNHtk=
=1pvr
-----END PGP SIGNATURE-----

--jy6Sn24JjFx/iggw--
