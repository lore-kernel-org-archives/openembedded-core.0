Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8C07E73E11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 08:26:15 +0000 (UTC)
Received: by pawq9 with SMTP id q9so6008874paw.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 01:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=C0foVuFMG4r67SNAKKNgcLYMsBlTRRXp36aZt15rZ6M=;
	b=ohtAASFd9Wust+/qVCSsWhOoT4L7TD7pCD5O9NJ+NsZpuLIljbJd8vUSgFB3pTmptF
	d0XxqzHu6diJ047xFFofl0ImvJXZ1C798Py1MJsRUWciNlKNDKjR49RUcYDZsofWPGw5
	D7sXYChwhvPnlRITX4Je1j2qEMePvD3CTMP6/Gz8d+QvQK5ViBEvp6m5+gfdtHT0RF4V
	vGyA54Ilcbr8ihcvvDAXgB1iTgzM+kYu89+stSgIeouBVnc1cUXu7Y8l0lLiJa38Giaj
	z/Mc470XmWcODva24+biKm7QyVbOWBglRSUB+RJ333tSnpoJ+6bvVpMjNW+3GEn58pzs
	CdPw==
X-Received: by 10.68.211.42 with SMTP id mz10mr523638pbc.118.1439799975354;
	Mon, 17 Aug 2015 01:26:15 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:651d:a55c:ec3:8575?
	([2601:646:8601:4580:651d:a55c:ec3:8575])
	by smtp.gmail.com with ESMTPSA id q5sm9536814pdc.65.2015.08.17.01.26.14
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Aug 2015 01:26:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <d8436791cacfc94de5b6b55d1ed9510614f806d1.1439799402.git.liezhi.yang@windriver.com>
Date: Mon, 17 Aug 2015 01:26:02 -0700
Message-Id: <B93083F2-C8D8-469C-A52F-FE206797707A@gmail.com>
References: <cover.1439799402.git.liezhi.yang@windriver.com>
	<d8436791cacfc94de5b6b55d1ed9510614f806d1.1439799402.git.liezhi.yang@windriver.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] ncurses: 5.9 -> 6.0
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
X-List-Received-Date: Mon, 17 Aug 2015 08:26:17 -0000
X-Groupsio-MsgNum: 69508
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E975ACAE-0908-4EA6-9E6A-0386C69AC8A3";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_E975ACAE-0908-4EA6-9E6A-0386C69AC8A3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 17, 2015, at 1:17 AM, Robert Yang <liezhi.yang@windriver.com> =
wrote:
>=20
> Use -fPIC to fix when build readline: libtinfo.a(lib_termcap.o):
> relocation R_X86_64_32 against `_nc_globals' can not be used when =
making
> a shared object; recompile with -fPIC

It a progressive change but
FYI, ncurses6 is not intended to be binary compatible with ncurses5 even =
though as of first release its source compatible with 5
its not going to remain that way for long, so as such this change can =
break
a lot of things. but there is a configure option to let nurses6 still =
keep using ncurses5 ABI for some time
so please use --with-abi-version 5 explicitly.

and this needs quite rigorous testing if we have to go with it for 1.9

>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
> meta/recipes-core/ncurses/ncurses.inc              |   11 ++++++++---
> .../ncurses/{ncurses-5.9 =3D> ncurses}/config.cache  |    0
> .../{ncurses-5.9 =3D> ncurses}/tic-hang.patch        |    0
> .../ncurses/{ncurses_5.9.bb =3D> ncurses_6.0.bb}     |    8 +++-----
> 4 files changed, 11 insertions(+), 8 deletions(-)
> rename meta/recipes-core/ncurses/{ncurses-5.9 =3D> =
ncurses}/config.cache (100%)
> rename meta/recipes-core/ncurses/{ncurses-5.9 =3D> =
ncurses}/tic-hang.patch (100%)
> rename meta/recipes-core/ncurses/{ncurses_5.9.bb =3D> ncurses_6.0.bb} =
(41%)
>=20
> diff --git a/meta/recipes-core/ncurses/ncurses.inc =
b/meta/recipes-core/ncurses/ncurses.inc
> index ffd80ee..ea18d41 100644
> --- a/meta/recipes-core/ncurses/ncurses.inc
> +++ b/meta/recipes-core/ncurses/ncurses.inc
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D =
"file://ncurses/base/version.c;beginline=3D1;endline=3D27;md5=3Dcbc
> SECTION =3D "libs"
> DEPENDS =3D "ncurses-native"
> DEPENDS_class-native =3D ""
> -INC_PR =3D "r15"
>=20
> BINCONFIG =3D "${bindir}/ncurses-config"
>=20
> @@ -83,7 +82,7 @@ ncurses_configure() {
> 	        --enable-sigwinch \
> 	        --enable-pc-files \
> 	        --disable-rpath-hack \
> -		${EXCONFIG_ARGS} \
> +	        ${EXCONFIG_ARGS} \
> 	        --with-manpage-format=3Dnormal \
> 	        "$@" || return 1
> 	cd ..
> @@ -206,7 +205,7 @@ do_install() {
>                 test -h $f || continue
>                 rm -f $f
>                 echo '/* GNU ld script */'  >$f
> -                echo "INPUT($i.so.5 AS_NEEDED(-ltinfo))" >>$f
> +                echo "INPUT($i.so.6 AS_NEEDED(-ltinfo))" >>$f
>         done
>=20
>         # Make sure that libcurses is linked so that it gets -ltinfo
> @@ -304,3 +303,9 @@ FILES_${PN}-terminfo-base =3D "\
>=20
> RSUGGESTS_${PN}-libtinfo =3D "${PN}-terminfo"
> RRECOMMENDS_${PN}-libtinfo =3D "${PN}-terminfo-base"
> +
> +# Fixed when build readline:
> +# libtinfo.a(lib_termcap.o): relocation R_X86_64_32 against
> +# `_nc_globals' can not be used when making a shared object; =
recompile
> +# with -fPIC
> +CFLAGS_append =3D " -fPIC"
> diff --git a/meta/recipes-core/ncurses/ncurses-5.9/config.cache =
b/meta/recipes-core/ncurses/ncurses/config.cache
> similarity index 100%
> rename from meta/recipes-core/ncurses/ncurses-5.9/config.cache
> rename to meta/recipes-core/ncurses/ncurses/config.cache
> diff --git a/meta/recipes-core/ncurses/ncurses-5.9/tic-hang.patch =
b/meta/recipes-core/ncurses/ncurses/tic-hang.patch
> similarity index 100%
> rename from meta/recipes-core/ncurses/ncurses-5.9/tic-hang.patch
> rename to meta/recipes-core/ncurses/ncurses/tic-hang.patch
> diff --git a/meta/recipes-core/ncurses/ncurses_5.9.bb =
b/meta/recipes-core/ncurses/ncurses_6.0.bb
> similarity index 41%
> rename from meta/recipes-core/ncurses/ncurses_5.9.bb
> rename to meta/recipes-core/ncurses/ncurses_6.0.bb
> index 54d27a9..e956e3f 100644
> --- a/meta/recipes-core/ncurses/ncurses_5.9.bb
> +++ b/meta/recipes-core/ncurses/ncurses_6.0.bb
> @@ -1,12 +1,10 @@
> require ncurses.inc
>=20
> -REVISION =3D "20150329"
> -
> -PR =3D "${INC_PR}.1"
> +REVISION =3D "20150810"
>=20
> SRC_URI +=3D "file://tic-hang.patch \
>             file://config.cache \
> "
> S =3D "${WORKDIR}/${BP}-${REVISION}"
> -SRC_URI[md5sum] =3D "cee991d09e69e60ebedef424804c52d4"
> -SRC_URI[sha256sum] =3D =
"5b64f40e4dce73e3aa83d15bd9257c6eff8790ec41150f0938bd87c0eb75828f"
> +SRC_URI[md5sum] =3D "78bfcb4634a87b4cda390956586f8f1f"
> +SRC_URI[sha256sum] =3D =
"85d4a615731bc71075416fc3bea15a56740bed42b3596bbb126226af4111c65c"
> --
> 1.7.9.5
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_E975ACAE-0908-4EA6-9E6A-0386C69AC8A3
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXRmqUACgkQuwUzVZGdMxQjVwCcDzcIDy4x2MZtpllYH0sQ8e4w
J+sAniLwyPzlMiX1DlESWMk36ZFRaOXL
=HkuK
-----END PGP SIGNATURE-----

--Apple-Mail=_E975ACAE-0908-4EA6-9E6A-0386C69AC8A3--
