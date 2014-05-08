Return-Path: <martin.jansa@gmail.com>
X-Greylist: delayed 312 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 08 May 2014 10:50:58 UTC
Received: from mail-pa0-f46.google.com (unknown [209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 85ED8609A7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 10:50:58 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id kx10so2739987pab.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 May 2014 03:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DTqCRdJ2ob4TjlfhOyeVQnaY6M3zC5qHB9SMr0Qvoro=;
	b=JgAILgC/rkCsxKiWAOHzHSAVlXiCHRlEJjd0wSh4/aDKvdXld7s2yyctTyB5eY48hw
	n+ZYE1W/L1HDSo9gxiBb8fYVktuo/HRQuBBn/gZIRrabBT9vWCDEV61g45rkjASu0+OO
	J96IgalcOGQIktAaime83kKQjbrcXzKIRtGqr4w/U9m42PSswp/WHinC6/QTMgbYFzz6
	tWdJwm+QDpHYiXFD8N2UFKxk2xb9hKY0X5EP/CGXVvncZZ3AYyitA3Sfq0FjCxbL3l82
	kBJH1S4nSjImUltiUwAMFamX6D62qi+9d0rTEarbuia7Bgznvw9Usvf+3teiyhfq1XLK
	SLMA==
X-Received: by 10.66.253.33 with SMTP id zx1mr6487400pac.28.1399545947761;
	Thu, 08 May 2014 03:45:47 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	xg4sm1347040pbb.47.2014.05.08.03.45.44 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 May 2014 03:45:45 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 8 May 2014 12:46:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Petter =?iso-8859-1?Q?Mab=E4cker?= <petter@technux.se>
Message-ID: <20140508104606.GM30955@jama>
References: <cover.1399497346.git.petter@technux.se>
	<699098e9da6b5932cce137031ad8dc3604d949a3.1399497346.git.petter@technux.se>
MIME-Version: 1.0
In-Reply-To: <699098e9da6b5932cce137031ad8dc3604d949a3.1399497346.git.petter@technux.se>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/13] trace-cmd: remove usage of FILESPATH
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
X-List-Received-Date: Thu, 08 May 2014 10:50:58 -0000
X-Groupsio-MsgNum: 52969
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oYAXToTM8kn9Ra/9"
Content-Disposition: inline

--oYAXToTM8kn9Ra/9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2014 at 11:19:50PM +0200, Petter Mab=E4cker wrote:
> Fixes [YOCTO #4497]
>=20
> Usage of FILESPATH is discouraged, since it can make recipes harder to
> bbappend. All current patches in trace-cmd are shared, move them to
> files instead, since it's included in base FILESPATH.

FWIW: using "files" is also a bit discouraged, because it's searched
last, so the lookup takes longer (trying ~30 different directories a lot
more with more OVERRIDES).

I don't know what's worse.

> Signed-off-by: Petter Mab=E4cker <petter@technux.se>
> ---
>  .../{trace-cmd =3D> files}/addldflags.patch          |    0
>  .../blktrace-api-compatibility.patch               |    0
>  .../kernelshark-fix-syntax-error-of-shell.patch    |    0
>  .../{trace-cmd =3D> files}/make-docs-optional.patch  |    0
>  ...dd-checks-for-invalid-pointers-to-fix-seg.patch |    0
>  ...o-not-call-stop_threads-if-doing-latency-.patch |    0
>  ...etting-plugin-to-nop-clears-data-before-i.patch |    0
>  .../trace-cmd-fix-syntax-error-of-shell.patch      |    0
>  meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb   |    2 --
>  9 files changed, 2 deletions(-)
>  rename meta/recipes-kernel/trace-cmd/{trace-cmd =3D> files}/addldflags.p=
atch (100%)
>  rename meta/recipes-kernel/trace-cmd/{trace-cmd =3D> files}/blktrace-api=
-compatibility.patch (100%)
>  rename meta/recipes-kernel/trace-cmd/{trace-cmd =3D> files}/kernelshark-=
fix-syntax-error-of-shell.patch (100%)
>  rename meta/recipes-kernel/trace-cmd/{trace-cmd =3D> files}/make-docs-op=
tional.patch (100%)
>  rename meta/recipes-kernel/trace-cmd/{trace-cmd =3D> files}/trace-cmd-Ad=
d-checks-for-invalid-pointers-to-fix-seg.patch (100%)
>  rename meta/recipes-kernel/trace-cmd/{trace-cmd =3D> files}/trace-cmd-Do=
-not-call-stop_threads-if-doing-latency-.patch (100%)
>  rename meta/recipes-kernel/trace-cmd/{trace-cmd =3D> files}/trace-cmd-Se=
tting-plugin-to-nop-clears-data-before-i.patch (100%)
>  rename meta/recipes-kernel/trace-cmd/{trace-cmd =3D> files}/trace-cmd-fi=
x-syntax-error-of-shell.patch (100%)
>=20
> diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/addldflags.patch b/m=
eta/recipes-kernel/trace-cmd/files/addldflags.patch
> similarity index 100%
> rename from meta/recipes-kernel/trace-cmd/trace-cmd/addldflags.patch
> rename to meta/recipes-kernel/trace-cmd/files/addldflags.patch
> diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/blktrace-api-compati=
bility.patch b/meta/recipes-kernel/trace-cmd/files/blktrace-api-compatibili=
ty.patch
> similarity index 100%
> rename from meta/recipes-kernel/trace-cmd/trace-cmd/blktrace-api-compatib=
ility.patch
> rename to meta/recipes-kernel/trace-cmd/files/blktrace-api-compatibility.=
patch
> diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/kernelshark-fix-synt=
ax-error-of-shell.patch b/meta/recipes-kernel/trace-cmd/files/kernelshark-f=
ix-syntax-error-of-shell.patch
> similarity index 100%
> rename from meta/recipes-kernel/trace-cmd/trace-cmd/kernelshark-fix-synta=
x-error-of-shell.patch
> rename to meta/recipes-kernel/trace-cmd/files/kernelshark-fix-syntax-erro=
r-of-shell.patch
> diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/make-docs-optional.p=
atch b/meta/recipes-kernel/trace-cmd/files/make-docs-optional.patch
> similarity index 100%
> rename from meta/recipes-kernel/trace-cmd/trace-cmd/make-docs-optional.pa=
tch
> rename to meta/recipes-kernel/trace-cmd/files/make-docs-optional.patch
> diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Add-checks=
-for-invalid-pointers-to-fix-seg.patch b/meta/recipes-kernel/trace-cmd/file=
s/trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch
> similarity index 100%
> rename from meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Add-checks-=
for-invalid-pointers-to-fix-seg.patch
> rename to meta/recipes-kernel/trace-cmd/files/trace-cmd-Add-checks-for-in=
valid-pointers-to-fix-seg.patch
> diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Do-not-cal=
l-stop_threads-if-doing-latency-.patch b/meta/recipes-kernel/trace-cmd/file=
s/trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch
> similarity index 100%
> rename from meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Do-not-call=
-stop_threads-if-doing-latency-.patch
> rename to meta/recipes-kernel/trace-cmd/files/trace-cmd-Do-not-call-stop_=
threads-if-doing-latency-.patch
> diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Setting-pl=
ugin-to-nop-clears-data-before-i.patch b/meta/recipes-kernel/trace-cmd/file=
s/trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch
> similarity index 100%
> rename from meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Setting-plu=
gin-to-nop-clears-data-before-i.patch
> rename to meta/recipes-kernel/trace-cmd/files/trace-cmd-Setting-plugin-to=
-nop-clears-data-before-i.patch
> diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-fix-syntax=
-error-of-shell.patch b/meta/recipes-kernel/trace-cmd/files/trace-cmd-fix-s=
yntax-error-of-shell.patch
> similarity index 100%
> rename from meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-fix-syntax-=
error-of-shell.patch
> rename to meta/recipes-kernel/trace-cmd/files/trace-cmd-fix-syntax-error-=
of-shell.patch
> diff --git a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb b/meta/reci=
pes-kernel/trace-cmd/kernelshark_1.2.bb
> index d61097d..291c068 100644
> --- a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
> +++ b/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
> @@ -21,8 +21,6 @@ S =3D "${WORKDIR}/git"
> =20
>  EXTRA_OEMAKE =3D "'CC=3D${CC}' 'AR=3D${AR}' 'prefix=3D${prefix}' gui"
> =20
> -FILESPATH =3D "${FILE_DIRNAME}/trace-cmd"
> -
>  do_install() {
>  	oe_runmake CC=3D"${CC}" AR=3D"${AR}" prefix=3D"${prefix}" DESTDIR=3D"${=
D}" install_gui
>  	rm -rf ${D}${datadir}/trace-cmd
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oYAXToTM8kn9Ra/9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNrYG4ACgkQN1Ujt2V2gBy0GQCfT++9O2pn1uLMrD26lfQ1NcvI
IlsAoLnhp8j4+WQtRcXo9JuK6i2DRTwX
=epEO
-----END PGP SIGNATURE-----

--oYAXToTM8kn9Ra/9--
