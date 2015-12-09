Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7E235601F6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 01:36:13 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so20915429pac.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 17:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=5SMySLqyFSiQb4WUABte3+rnRKZB9yvgqVZpQZK+BfU=;
	b=ono6PTRFzK2OQ1vkcLPSKO5u1niRhaOc3wnshBUDToMiPDa+LmstniGOTLvLbJQC2c
	FAvQ9MjMpP7LYHwpfk87vRBDIcOIN/EO4wgK78hBpTnhdzWXrYEybtMEbye+yvqUE1o3
	3yOu9fijmQhK5lvN1kkxNdrclTBai5Q6zIWZL/gKlMauGV0gIR94i9y1pFtyGadi6Nio
	GwS83zS82inxGLlpgmtFXgiEDBksgV+7DRnAqqVtnOQ1rLDSZ9MtTY/TD8wgEZPRG5q/
	VZFzHTUR7p/GEB8JVwpfJqSwGkn8HO/Qh3ERPPk1ylCsbkpGzgHhXiDREgAQupy+CuF7
	qbag==
X-Received: by 10.66.65.109 with SMTP id w13mr4295315pas.142.1449624973915;
	Tue, 08 Dec 2015 17:36:13 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:79ff:cd90:5118:eafc?
	([2601:646:8802:5d5c:79ff:cd90:5118:eafc])
	by smtp.gmail.com with ESMTPSA id
	dg1sm7487541pad.18.2015.12.08.17.36.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Dec 2015 17:36:12 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <cover.1449562195.git.raj.khem@gmail.com>
Date: Tue, 8 Dec 2015 17:36:07 -0800
Message-Id: <4CA8F027-736D-41A5-95D2-9833ED809000@gmail.com>
References: <cover.1449562195.git.raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Subject: Re: [PATCH 00/13] Add musl to OE-Core
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
X-List-Received-Date: Wed, 09 Dec 2015 01:36:15 -0000
X-Groupsio-MsgNum: 74505
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8E8EFAAD-65CF-4B2B-A016-0421BA8D7811";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_8E8EFAAD-65CF-4B2B-A016-0421BA8D7811
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Dec 8, 2015, at 12:12 AM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> This is a mimimal set of changes brought in from meta-musl
> to OE-Core, with this set one can build core-image-minimal using musl
> by setting
>=20
> TCLIBC=3Dmusl
>=20
> for all supported architectures, eventually we will bring
> more changes to other packages which will enable more complex
> image builds and eventually world.
>=20
> v2: Address review feedback


For some reason create-pull-request does not add the pull branch info =
here the branch is here on github

git://github.com/kraj/openembedded-core kraj/musl

web-ui

https://github.com/kraj/openembedded-core/commits/kraj/musl

>=20
> Khem Raj (13):
>  gcc: Add support for building musl configuration
>  autoconf: Add musl support
>  gdb: Fix build with musl
>  mtd-utils: Backport and create patches to support musl
>  squashfs-tools: Define FNM_EXTMATCH if not defined
>  mtools: Use proper glibc override to add glibc packages to
>    recommendations
>  musl: Add recipe
>  sysvinit: Fix build with musl
>  gettext: Delete libintl.h and charset.alias
>  busybox: Add config for musl
>  openssl: Add musl configuration support
>  libpam: Fix build with musl
>  attr: Add patch to account for use of internal glibc header
>=20
> meta/recipes-connectivity/openssl/openssl.inc      |   4 +-
> .../openssl/openssl/configure-musl-target.patch    |  27 +++
> .../recipes-connectivity/openssl/openssl_1.0.2d.bb |   1 +
> ...user-use-POSIX-getpwent-instead-of-getpwe.patch |  71 ++++++
> meta/recipes-core/busybox/busybox/musl.cfg         |  12 +
> meta/recipes-core/busybox/busybox_1.24.1.bb        |   2 +
> meta/recipes-core/gettext/gettext_0.16.1.bb        |   5 +
> meta/recipes-core/gettext/gettext_0.19.4.bb        |   4 +
> meta/recipes-core/musl/musl.inc                    |  26 ++
> meta/recipes-core/musl/musl_git.bb                 |  58 +++++
> meta/recipes-core/sysvinit/sysvinit/realpath.patch |  78 ++++++
> meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |   1 +
> .../autoconf/autoconf/add_musl_config.patch        |  26 ++
> meta/recipes-devtools/autoconf/autoconf_2.69.bb    |   1 +
> meta/recipes-devtools/gcc/gcc-4.9.inc              |   4 +
> .../gcc/gcc-4.9/0067-gcc-musl-support.patch        | 267 =
+++++++++++++++++++++
> .../gcc/gcc-4.9/0068-musl-dynamic-linker.patch     | 205 =
++++++++++++++++
> .../gcc/gcc-4.9/0069-musl-no-fixincludes.patch     |  21 ++
> .../gcc/gcc-4.9/0070-libstdc-musl.patch            |  32 +++
> meta/recipes-devtools/gcc/gcc-5.2.inc              |   4 +
> .../gcc/gcc-5.2/0043-libstdc-musl.patch            |  32 +++
> .../gcc/gcc-5.2/0044-gcc-musl-support.patch        | 267 =
+++++++++++++++++++++
> .../gcc/gcc-5.2/0045-musl-dynamic-linker.patch     | 198 =
+++++++++++++++
> .../gcc/gcc-5.2/0046-musl-no-fixincludes.patch     |  22 ++
> meta/recipes-devtools/gdb/gdb.inc                  |   1 +
> ...0001-Use-exported-definitions-of-SIGRTMIN.patch |  54 +++++
> .../mtd/mtd-utils/0001-Fix-build-with-musl.patch   |  53 ++++
> ...ibfec-use-standard-C-type-instead-of-u_lo.patch |  56 +++++
> .../mtd/mtd-utils/010-fix-rpmatch.patch            |  24 ++
> meta/recipes-devtools/mtd/mtd-utils_git.bb         |   4 +
> meta/recipes-devtools/mtools/mtools_4.0.18.bb      |   4 +-
> .../squashfs-tools/squashfs-tools/fix-compat.patch |  63 +++++
> .../squashfs-tools/squashfs-tools_git.bb           |   1 +
> ...upport-for-defining-missing-funcitonality.patch |  68 ++++++
> .../pam/libpam/include_paths_header.patch          |  59 +++++
> meta/recipes-extended/pam/libpam_1.2.1.bb          |   5 +-
> meta/recipes-support/attr/attr_2.4.47.bb           |   4 +-
> .../attr/files/dont-use-decl-macros.patch          |  56 +++++
> 38 files changed, 1815 insertions(+), 5 deletions(-)
> create mode 100644 =
meta/recipes-connectivity/openssl/openssl/configure-musl-target.patch
> create mode 100644 =
meta/recipes-core/busybox/busybox/0001-linedit-deluser-use-POSIX-getpwent-=
instead-of-getpwe.patch
> create mode 100644 meta/recipes-core/busybox/busybox/musl.cfg
> create mode 100644 meta/recipes-core/musl/musl.inc
> create mode 100644 meta/recipes-core/musl/musl_git.bb
> create mode 100644 meta/recipes-core/sysvinit/sysvinit/realpath.patch
> create mode 100644 =
meta/recipes-devtools/autoconf/autoconf/add_musl_config.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.9/0067-gcc-musl-support.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.9/0068-musl-dynamic-linker.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.9/0069-musl-no-fixincludes.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-4.9/0070-libstdc-musl.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-5.2/0043-libstdc-musl.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-5.2/0044-gcc-musl-support.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-5.2/0045-musl-dynamic-linker.patch
> create mode 100644 =
meta/recipes-devtools/gcc/gcc-5.2/0046-musl-no-fixincludes.patch
> create mode 100644 =
meta/recipes-devtools/gdb/gdb/0001-Use-exported-definitions-of-SIGRTMIN.pa=
tch
> create mode 100644 =
meta/recipes-devtools/mtd/mtd-utils/0001-Fix-build-with-musl.patch
> create mode 100644 =
meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-libfec-use-standard-C-t=
ype-instead-of-u_lo.patch
> create mode 100644 =
meta/recipes-devtools/mtd/mtd-utils/010-fix-rpmatch.patch
> create mode 100644 =
meta/recipes-devtools/squashfs-tools/squashfs-tools/fix-compat.patch
> create mode 100644 =
meta/recipes-extended/pam/libpam/0001-Add-support-for-defining-missing-fun=
citonality.patch
> create mode 100644 =
meta/recipes-extended/pam/libpam/include_paths_header.patch
> create mode 100644 =
meta/recipes-support/attr/files/dont-use-decl-macros.patch
>=20
> --
> 2.6.3
>=20


--Apple-Mail=_8E8EFAAD-65CF-4B2B-A016-0421BA8D7811
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZnhYsACgkQuwUzVZGdMxQcQQCfc3HJQLQ3t68+MKXZu6RCnrrp
UzYAoIP40CqaGVyhSr3X6hV2Z7uYExOK
=ZkJK
-----END PGP SIGNATURE-----

--Apple-Mail=_8E8EFAAD-65CF-4B2B-A016-0421BA8D7811--
