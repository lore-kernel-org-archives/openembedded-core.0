Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QTjJT-00028i-Qr
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 01:34:28 +0200
Received: by wwi18 with SMTP id 18so1899434wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jun 2011 16:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=wWbVx5/Eg629TvanqnEkYQ51w1qM+t05cQH8Js2N45U=;
	b=qXuqjeE4o4g4CJR+v0rnYIvXkHdmxqNEWYmXviX8/5Zwm9ilbXPPmB+DhelDahciKf
	xWfAaEl0U/hkwHikk/jyXA7LbRlaIrkB2IBZD4vGByB1bkdZUpoe0Rei8AtsULrzo1MR
	NR4hDm+21YLk/ajZ43RdcABV3eU9WNTKhiVIY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=fvgwggli2ZSXnra68h2v1/QleMvOQoNsqMPriQZW8VDQtW+fGU8nLgTgsROk8IB74p
	0+TITQLohqw/nSGuoOcSQdPWI23cp7S37XenxdjqjKaTXsZlzle/yKnVCC+iUozORL3E
	0Q3xTgQ+l1PPG27BAZN2qg/lV8/+MLNTfDQUQ=
Received: by 10.216.237.205 with SMTP id y55mr3048452weq.14.1307403071105;
	Mon, 06 Jun 2011 16:31:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.28.19 with HTTP; Mon, 6 Jun 2011 16:30:41 -0700 (PDT)
In-Reply-To: <4afec421e49b3aa5404170b39ae8a95c8362f5a7.1307402014.git.mark.hatle@windriver.com>
References: <cover.1307402014.git.mark.hatle@windriver.com>
	<4afec421e49b3aa5404170b39ae8a95c8362f5a7.1307402014.git.mark.hatle@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Jun 2011 16:30:41 -0700
Message-ID: <BANLkTimfBmiA4ioLJN3tfNxvQpAor-AW5Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] pseudo: Update pseudo to 1.1.1 version
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Jun 2011 23:34:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 6, 2011 at 4:15 PM, Mark Hatle <mark.hatle@windriver.com> wrote=
:
> Update both the core and pseudo_git packages to the latest 1.1.1 verison.
>
> This fixes an issues where the call system() was not wrapped. =C2=A0This =
could
> lead to issues where certain spawned commands broke out of a pseudo-chroo=
t
> and created files in the wrong place.
>
> Also the update the 1.0 -> 1.1.1 adds additional capabilities such as
> beginning support for MacOS X.
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
> =C2=A0meta/recipes-devtools/pseudo/pseudo.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 10 +++++-----
> =C2=A0.../pseudo/{pseudo_1.0.bb =3D> pseudo_1.1.1.bb} =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 =C2=A04 ++--
> =C2=A0meta/recipes-devtools/pseudo/pseudo_git.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A06 +++---
> =C2=A03 files changed, 10 insertions(+), 10 deletions(-)
> =C2=A0rename meta/recipes-devtools/pseudo/{pseudo_1.0.bb =3D> pseudo_1.1.=
1.bb} (51%)
>
> diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devto=
ols/pseudo/pseudo.inc
> index a458dcc..df09b0d 100644
> --- a/meta/recipes-devtools/pseudo/pseudo.inc
> +++ b/meta/recipes-devtools/pseudo/pseudo.inc
> @@ -18,7 +18,7 @@ NO32LIBS ??=3D "0"
>
> =C2=A0# Compile for the local machine arch...
> =C2=A0do_compile () {
> - =C2=A0 =C2=A0 =C2=A0 ${S}/configure --prefix=3D${prefix} --with-sqlite=
=3D${STAGING_DIR_TARGET}${exec_prefix} --bits=3D${SITEINFO_BITS}
> + =C2=A0 =C2=A0 =C2=A0 ${S}/configure --prefix=3D${prefix} --libdir=3D${p=
refix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite=3D${STAGING_DIR_TARGET}=
${exec_prefix} # --bits=3D${SITEINFO_BITS}

Just curious why is it a 32bit binary


> =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake 'LIB=3Dlib/pseudo/lib$(MARK64)'
> =C2=A0}
>
> @@ -28,8 +28,8 @@ do_compile () {
> =C2=A0do_compile_prepend_virtclass-native () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ "${SITEINFO_BITS}" =3D=3D "64" -a -e "/us=
r/include/gnu/stubs-32.h" -a "${PN}" =3D=3D "pseudo-native" -a "${NO32LIBS}=
" !=3D "1" ]; then
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# We need the 32-b=
it libpseudo on a 64-bit machine...
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./configure --prefix=
=3D${prefix} --with-sqlite=3D${STAGING_DIR_TARGET}${exec_prefix} --bits=3D3=
2
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake 'CFLAGS=3D-=
m32' 'LIB=3Dlib/pseudo/lib' libpseudo
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./configure --prefix=
=3D${prefix} --libdir=3D${prefix}/lib/pseudo/lib --with-sqlite=3D${STAGING_=
DIR_TARGET}${exec_prefix} # --bits=3D32
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake 'CFLAGS=3D-=
m32' libpseudo 'LIB=3Dlib/pseudo/lib$(MARK64)'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# prevent it from =
removing the lib, but remove everything else
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0make 'LIB=3Dfoo' d=
istclean
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> @@ -38,8 +38,8 @@ do_compile_prepend_virtclass-native () {
> =C2=A0do_compile_prepend_virtclass-nativesdk () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ "${SITEINFO_BITS}" =3D=3D "64" -a -e "/us=
r/include/gnu/stubs-32.h" -a "${PN}" =3D=3D "pseudo-native" -a "${NO32LIBS}=
" !=3D "1" ]; then
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# We need the 32-b=
it libpseudo on a 64-bit machine...
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./configure --prefix=
=3D${prefix} --with-sqlite=3D${STAGING_DIR_TARGET}${exec_prefix} --bits=3D3=
2
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake 'CFLAGS=3D-=
m32' 'LIB=3Dlib/pseudo/lib' libpseudo
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./configure --prefix=
=3D${prefix} --libdir=3D${prefix}/lib/pseudo/lib --with-sqlite=3D${STAGING_=
DIR_TARGET}${exec_prefix} # --bits=3D32
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake 'CFLAGS=3D-=
m32' libpseudo 'LIB=3Dlib/pseudo/lib$(MARK64)'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# prevent it from =
removing the lib, but remove everything else
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0make 'LIB=3Dfoo' d=
istclean
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> diff --git a/meta/recipes-devtools/pseudo/pseudo_1.0.bb b/meta/recipes-de=
vtools/pseudo/pseudo_1.1.1.bb
> similarity index 51%
> rename from meta/recipes-devtools/pseudo/pseudo_1.0.bb
> rename to meta/recipes-devtools/pseudo/pseudo_1.1.1.bb
> index e750e8a..8bf6d07 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_1.0.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_1.1.1.bb
> @@ -5,5 +5,5 @@ PR =3D "r0"
> =C2=A0SRC_URI =3D "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${=
PV}.tar.bz2 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://static_sqlite.patch"
>
> -SRC_URI[md5sum] =3D "a329bd00ba78711bcacd48fc1982af6a"
> -SRC_URI[sha256sum] =3D "cb41c97094044144ef4027ab9dbba009f3cb1c23e6bec964=
0f29d530524ad60f"
> +SRC_URI[md5sum] =3D "dd59766c17e199fe6144fce8a2c67802"
> +SRC_URI[sha256sum] =3D "c697f643577d661c3ce826504b9dcd11fa98e78a5d10e3c8=
3931da8942f6bfad"
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-de=
vtools/pseudo/pseudo_git.bb
> index 2b9fe70..cf3b191 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -1,8 +1,8 @@
> =C2=A0require pseudo.inc
>
> -SRCREV =3D "5434325fc887817ebb2bad36313d8277992cef1d"
> -PV =3D "1.0+git${SRCPV}"
> -PR =3D "r18"
> +SRCREV =3D "1d3e67cb168c3459e67a0b29f071ca30ed17dadc"
> +PV =3D "1.1.1+git${SRCPV}"
> +PR =3D "r19"
>
> =C2=A0DEFAULT_PREFERENCE =3D "-1"
>
> --
> 1.7.3.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


