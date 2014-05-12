Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f175.google.com (unknown [209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0A89A65FCE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 11:31:11 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id l4so7251962lbv.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 04:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xdzyNeQux/ncYLlnZ+9ejg59xHh1pDb2VsOGg19NT/g=;
	b=IQYI84mJumEPUvkdpX/tGbiief6LFTLfAojUI7kK2KCDSur3Iem3fpKZ/LPdctC3eL
	t3ARH9yEnepKNwtRRHlwR670OtV/DeDgvbH8Kmpa/pyZ8AqtxvscYro1e9MwWHXRCy8c
	XTww+2dpjzEtxJoV4IrtCTv5gdC3tXKXM5uxxNsTrMOr4qG//a4dQljCGckt80rFkItc
	d0cJ+b9NyJveEoNkhZ2xs/vHCQ45FmH8NzRgfMCOPotYP4b4xS3WPRBxPzU+anpqe9q6
	04X1AxDF2dI8e4I5vAfa8ly5V9PL4yhBKiui1VdRZBe4oIL4Rm1bz6e2c+PvWR5Z0trB
	F5vQ==
X-Received: by 10.152.43.194 with SMTP id y2mr703108lal.72.1399894271889;
	Mon, 12 May 2014 04:31:11 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dl4sm13577848lbc.4.2014.05.12.04.31.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 May 2014 04:31:10 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 12 May 2014 13:31:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Andrew Blackburn <andyblac@icloud.com>
Message-ID: <20140512113138.GH22774@jama>
References: <874B01E8-8A61-442E-981C-3FCE0763854E@icloud.com>
	<CAMKF1so70jmiMNdfT_sBvnfHRd5zQNS-6LL3JufMs5H__+765A@mail.gmail.com>
	<1E758580-2234-4832-B3F7-2848343DFA89@icloud.com>
	<CAMKF1srUPfNFCVNVunUTbyzx1B3te3WVnCsUkTncgrc-p3Fh7w@mail.gmail.com>
	<D6AFE305-EC4A-46FD-AF51-9714F2AE1FDE@icloud.com>
MIME-Version: 1.0
In-Reply-To: <D6AFE305-EC4A-46FD-AF51-9714F2AE1FDE@icloud.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: talloc build error
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
X-List-Received-Date: Mon, 12 May 2014 11:31:12 -0000
X-Groupsio-MsgNum: 53091
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VSaCG/zfRnOiPJtU"
Content-Disposition: inline

--VSaCG/zfRnOiPJtU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2014 at 11:05:43AM +0100, Andrew Blackburn wrote:
> hi,=20
>=20
> sure, here you go.

Please read README file and send it with git send-email to oe-devel ML.

Thanks

>=20
> andy.
>=20
> diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb b/met=
a-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> index 501e40a..7e3581b 100644
> --- a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> +++ b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> @@ -3,11 +3,11 @@ SECTION =3D "base"
>  LICENSE =3D "GPL-2.0"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317=
bb3"
> =20
> -PR =3D "r6"
> +PR =3D "r7"
> =20
>  DEPENDS +=3D "libtirpc flex-native bison-native"
> =20
> -inherit autotools systemd
> +inherit autotools-brokensep systemd
> =20
>  SRC_URI =3D "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.ta=
r.bz2 \
>             file://autofs-5.0.7-fix-nobind-sun-escaped-map-entries.patch \
> diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/met=
a-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> index 00df2b8..55e3092 100644
> --- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> +++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> @@ -4,6 +4,8 @@ SUMMARY =3D "WvStreams is a network programming library i=
n C++"
>  LICENSE =3D "LGPLv2"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D55ca817ccb7d5b5b66355690e9abc=
605"
> =20
> +PR =3D "r1"
> +
>  DEPENDS =3D "zlib openssl (>=3D 0.9.8)"
> =20
>  SRC_URI =3D "http://${PN}.googlecode.com/files/${PN}-${PV}.tar.gz \
> @@ -16,7 +18,7 @@ SRC_URI =3D "http://${PN}.googlecode.com/files/${PN}-${=
PV}.tar.gz \
>  SRC_URI[md5sum] =3D "2760dac31a43d452a19a3147bfde571c"
>  SRC_URI[sha256sum] =3D "8403f5fbf83aa9ac0c6ce15d97fd85607488152aa84e007b=
7d0621b8ebc07633"
> =20
> -inherit autotools pkgconfig
> +inherit autotools-brokensep pkgconfig
> =20
>  PARALLEL_MAKE =3D ""
> =20
> diff --git a/meta-oe/recipes-support/talloc/talloc_2.0.1.bb b/meta-oe/rec=
ipes-support/talloc/talloc_2.0.1.bb
> index 6b7e4f1..b6bf2cd 100644
> --- a/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
> +++ b/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://talloc.samba.org"
>  LICENSE =3D "LGPL-3.0"
>  LIC_FILES_CHKSUM =3D "file://NEWS;md5=3D5fe776b23a711c9153ee94bc87e47334"
> =20
> -inherit autotools pkgconfig
> +inherit autotools-brokensep pkgconfig
> =20
>  SRC_URI =3D "http://samba.org/ftp/${BPN}/${BPN}-${PV}.tar.gz \
>             file://install-swig-interface-in-SWINGLIBDIR.patch \
> @@ -13,7 +13,7 @@ SRC_URI[sha256sum] =3D "5b810527405f29d54f50efd78bf2c89=
e318f2cd8bed001f22f2a1412fd
> =20
>  TARGET_CC_ARCH +=3D "${LDFLAGS}"
> =20
> -PR =3D "r2"
> +PR =3D "r3"
> =20
>  # autoreconf doesn't work well while reconfiguring included libreplace
>  do_configure () {
>=20
>=20
> On 12 May 2014, at 06:03, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> >=20
> >=20
> > On Sunday, May 11, 2014, Andrew Blackburn <andyblac@icloud.com> wrote:
> > cheers guy=E2=80=99s
> >=20
> > thats worked using autotools-brokensep instead of autotools, =E2=80=98w=
vstreams_4.6.1.bb=E2=80=99 also needed this too.
> >=20
> >=20
> > Care to submit patch ?
> > =20
> > best regards
> >=20
> > andy.
> >=20
> > On 11 May 2014, at 23:46, Khem Raj <raj.khem@gmail.com> wrote:
> >=20
> > > On Sun, May 11, 2014 at 9:29 AM, Andrew Blackburn <andyblac@icloud.co=
m> wrote:
> > >> hi all,
> > >>
> > >> i recently merged =E2=80=98meta-openembedded=E2=80=99 master into my=
 branch, but i am now getting a build error with tallow, below is the erro =
i am getting, can anyone help on how to fix.
> > >
> > > It could be that S !=3D B change might be impacting this recipe. Can =
you
> > > change the recipe to inherit autotools-brokensep instead of autotools
> > > class.
> > >
> > >>
> > >>
> > >> NOTE: Preparing runqueue
> > >> NOTE: Executing SetScene Tasks
> > >> NOTE: Executing RunQueue Tasks
> > >> ERROR: Function failed: do_configure (log file is located at /home/v=
ix/oe-alliance/builds/openvix/tmp/work/mips32el-oe-linux/talloc/talloc-2.0.=
1-r2/temp/log.do_configure.9168)
> > >> ERROR: Logfile of failure stored in: /home/vix/oe-alliance/builds/op=
envix/tmp/work/mips32el-oe-linux/talloc/talloc-2.0.1-r2/temp/log.do_configu=
re.9168
> > >> Log data follows:
> > >> | DEBUG: Executing python function sysroot_cleansstate
> > >> | DEBUG: Python function sysroot_cleansstate finished
> > >> | DEBUG: SITE files ['endian-little', 'bit-32', 'mips-common', 'comm=
on-linux', 'common-glibc', 'mipsel-linux', 'common']
> > >> | DEBUG: Executing shell function autotools_preconfigure
> > >> | DEBUG: Shell function autotools_preconfigure finished
> > >> | DEBUG: Executing python function autotools_copy_aclocals
> > >> | DEBUG: Python function autotools_copy_aclocals finished
> > >> | DEBUG: Executing shell function do_configure
> > >> | gnu-configize: 'configure.ac' or 'configure.in' is required
> > >> | WARNING: /home/vix/oe-alliance/builds/openvix/tmp/work/mips32el-oe=
-linux/talloc/talloc-2.0.1-r2/temp/run.do_configure.9168:1 exit 1 from
> > >> |   gnu-configize
> > >> | ERROR: Function failed: do_configure (log file is located at /home=
/vix/oe-alliance/builds/openvix/tmp/work/mips32el-oe-linux/talloc/talloc-2.=
0.1-r2/temp/log.do_configure.9168)
> > >> ERROR: Task 4967 (/home/vix/oe-alliance/meta-openembedded/meta-oe/re=
cipes-support/talloc/talloc_2.0.1.bb, do_configure) failed with exit code =
=E2=80=981'
> > >>
> > >>
> > >>
> > >> hope someone can help
> > >>
> > >>
> > >> cheers
> > >> Andy.
> > >> --
> > >> _______________________________________________
> > >> Openembedded-core mailing list
> > >> Openembedded-core@lists.openembedded.org
> > >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >=20
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20

> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VSaCG/zfRnOiPJtU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNwsRoACgkQN1Ujt2V2gBwsjwCfcfvHNbX0sK/BzFego53joLIo
W5UAnjLTuzKyz4vUw5ZuMryWtXvffpDW
=mUVc
-----END PGP SIGNATURE-----

--VSaCG/zfRnOiPJtU--
