Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 099BD60657
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 21:49:58 +0000 (UTC)
Received: by pacdd16 with SMTP id dd16so52241700pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 14:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=t3Y1Dh6ogUGLLR7wG7MqzKtNVBEd8MUaa/KAzW1oyhc=;
	b=XXdgM0v9OqseICEQ+Icue0ysKNaIy1YMQTo1eleOX8R2JFqwvFuHjQanETquuKD3jr
	2rV16ap7FLBUg3r+Q/PBAI7xtm+KG1Wa9bPMJpObQ2j1mb/eddEa/LtGKYAkDtdvWq2r
	NJEIq15DFjTOhMuo2bUQ5VIaSn7vX9CJN36PQ9F6oLrgAX+zqSKqQgZwtwuYJn560LWM
	/9EYyoVE2LQ40kK2yO6BG0/6sumt5MT0fwFEut9IvgbmddMYWMf6r+0j68l2f3r2AaqX
	+JmHqvrwfzXlcr7MTPgRRqUtv9CF8jNwOtGL7j6y9PhGBwTU3iwI9fHVqUAXAsbRW8G/
	fLFA==
X-Received: by 10.68.98.194 with SMTP id ek2mr21045846pbb.152.1440193798708;
	Fri, 21 Aug 2015 14:49:58 -0700 (PDT)
Received: from [10.11.15.192] ([69.84.245.29])
	by smtp.gmail.com with ESMTPSA id
	pg5sm8865603pdb.81.2015.08.21.14.49.56
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 21 Aug 2015 14:49:56 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1440193082-508-1-git-send-email-otavio@ossystems.com.br>
Date: Fri, 21 Aug 2015 14:49:52 -0700
Message-Id: <2ADD7CA4-0184-4D54-9E0B-8A58ACB51DC1@gmail.com>
References: <1440193082-508-1-git-send-email-otavio@ossystems.com.br>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.2104)
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Rename 'BRANCH' variable to 'SRC_BRANCH' for clearness
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
X-List-Received-Date: Fri, 21 Aug 2015 21:49:59 -0000
X-Groupsio-MsgNum: 69831
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9374C928-A814-475A-89BD-992354CF6B14";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9374C928-A814-475A-89BD-992354CF6B14
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 21, 2015, at 2:38 PM, Otavio Salvador <otavio@ossystems.com.br> =
wrote:
>=20
> The 'BRANCH' variable name has no explicit relation with the
> SRC_URI. Using 'SRC_BRANCH' makes it more obvious and easier to
> identify.

Look good to me, just may be avoid =E2=80=98_=E2=80=99 and call it =
SRCBRANCH

>=20
> This patch makes the use consistent across the metadata.
>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>=20
> meta/recipes-core/glibc/cross-localedef-native_2.22.bb | 4 ++--
> meta/recipes-core/glibc/glibc_2.22.bb                  | 4 ++--
> meta/recipes-devtools/mmc/mmc-utils_git.bb             | 4 ++--
> 3 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.22.bb =
b/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
> index 2153ece..869cb3a 100644
> --- a/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
> +++ b/meta/recipes-core/glibc/cross-localedef-native_2.22.bb
> @@ -14,10 +14,10 @@ inherit autotools
>=20
> FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/glibc:"
>=20
> -BRANCH ?=3D "release/${PV}/master"
> +SRC_BRANCH ?=3D "release/${PV}/master"
> GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git"
>=20
> -SRC_URI =3D "${GLIBC_GIT_URI};branch=3D${BRANCH};name=3Dglibc \
> +SRC_URI =3D "${GLIBC_GIT_URI};branch=3D${SRC_BRANCH};name=3Dglibc \
>            =
git://github.com/kraj/localedef;branch=3Dmaster;name=3Dlocaledef;destsuffi=
x=3Dgit/localedef \
>            file://fix_for_centos_5.8.patch \
>            ${EGLIBCPATCHES} \
> diff --git a/meta/recipes-core/glibc/glibc_2.22.bb =
b/meta/recipes-core/glibc/glibc_2.22.bb
> index 6aaf722..c02b6c8 100644
> --- a/meta/recipes-core/glibc/glibc_2.22.bb
> +++ b/meta/recipes-core/glibc/glibc_2.22.bb
> @@ -9,11 +9,11 @@ DEPENDS +=3D "gperf-native kconfig-frontends-native"
>=20
> SRCREV ?=3D "a34d1c6afc86521d6ad17662a3b5362d8481514c"
>=20
> -BRANCH ?=3D "release/${PV}/master"
> +SRC_BRANCH ?=3D "release/${PV}/master"
>=20
> GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git"
>=20
> -SRC_URI =3D "${GLIBC_GIT_URI};branch=3D${BRANCH};name=3Dglibc \
> +SRC_URI =3D "${GLIBC_GIT_URI};branch=3D${SRC_BRANCH};name=3Dglibc \
>            =
file://0004-Backport-https-sourceware.org-ml-libc-ports-2007-12-.patch \
>            =
file://0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch \
>            =
file://0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch \
> diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb =
b/meta/recipes-devtools/mmc/mmc-utils_git.bb
> index 8950360..c6947e8 100644
> --- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
> +++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
> @@ -3,12 +3,12 @@ HOMEPAGE =3D =
"http://git.kernel.org/cgit/linux/kernel/git/cjb/mmc-utils.git/"
> LICENSE =3D "GPLv2"
> LIC_FILES_CHKSUM =3D =
"file://mmc.c;beginline=3D1;endline=3D17;md5=3Dd7747fc87f1eb22b946ef819969=
503f0"
>=20
> -BRANCH ?=3D "master"
> +SRC_BRANCH ?=3D "master"
> SRCREV =3D "f4eb241519f8d500ce6068a70d2389be39ac5189"
>=20
> PV =3D "0.1"
>=20
> -SRC_URI =3D =
"git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=3D=
${BRANCH} \
> +SRC_URI =3D =
"git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=3D=
${SRC_BRANCH} \
>            =
file://0001-mmc.h-don-t-include-asm-generic-int-ll64.h.patch"
>=20
> S =3D "${WORKDIR}/git"
> --
> 2.5.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_9374C928-A814-475A-89BD-992354CF6B14
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXXnQMACgkQuwUzVZGdMxSX4wCfQaieN7nlP5SCuXtGs9fi1Qvv
az4AoI+yT0psJddUeUr3DFobT4gLTzx2
=29NB
-----END PGP SIGNATURE-----

--Apple-Mail=_9374C928-A814-475A-89BD-992354CF6B14--
