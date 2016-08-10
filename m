Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 191E5771F1;
	Wed, 10 Aug 2016 09:59:16 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id q128so8498493wma.1;
	Wed, 10 Aug 2016 02:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=W31G6JtJMuZ4CX/LLaP07LtROec36+8VuF0U+tsMmA8=;
	b=ejhFzHX84yE4emk0osXQhiZoQHtZsgxtZHauXLs9yH2VcrB2mMxaFibBnuoIg8ehEZ
	99l1eIoUrC2s0SklVM/GBt2KBwtqqxx6KCZcq03N6DRpiygwdiZTrkusCKT3zJunUTC7
	DTNCLlAhZcQNRoKH/N8udX4TYFJZZe5DFjo8I6rWjU4zHUOLUdcF2Z/Zbu6M+TlXCwoD
	JvCi6ZrufkbP1UU4CyCU+V4WESse+CSnBw58frYrgtbChnFov7Mk1lo6qdpDJYE0+9mV
	+v3pnTnxiKncGMmjd4dg5Qqn9iY9paAzCDhLQwOWAoIzudYKPhAhNiqqeF/Rw9mEVypv
	E5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=W31G6JtJMuZ4CX/LLaP07LtROec36+8VuF0U+tsMmA8=;
	b=Nx/kdh0bZqYSdADN7txZrRImLKsxvP/WYY1cbGbU7v+Oh1LRVHPR1/V9Oe4Hhbtngo
	Q1yRSkpQVIAIGEsvd7zHzctCv4/ECjtorlWUDMEhssczaUu3TS+cuvbdP1lm0ZRBybao
	dECm1Zbd02bcrIbFUzeW63/9Tm1siDFD1wumF54pJXi1lqYhIezmZ3R4oCXe77K7BtYV
	qSx5g962WsojSet8h8yGlE4bzBUndCTuU3EM5v+98ePu1l4W9deLgJTmTbsb9lVETfxe
	v3oBTcmssZAIY450z0EBDs8bARjr7OIW5E8fhSNKU5FcJhI5Wilg4FvrPKc8cQ/1BoE4
	ue+Q==
X-Gm-Message-State: AEkoouutFPBKutl0b5reZOYEerpRICNcY77YN36xWJ3kXcbwKKD3wuLbVccWAkp5nZlBCA==
X-Received: by 10.28.191.14 with SMTP id p14mr2202183wmf.39.1470823156895;
	Wed, 10 Aug 2016 02:59:16 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	d80sm7537617wmd.14.2016.08.10.02.59.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 10 Aug 2016 02:59:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 10 Aug 2016 11:59:21 +0200
To: openembedded-core@lists.openembedded.org,
	"Maxin B. John" <maxin.john@intel.com>
Message-ID: <20160810095921.fzwuugxh525z5e4u@jama>
References: <20160810094725.20395.91512@opal.openembedded.org>
	<20160810094727.589E850200@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20160810094727.589E850200@opal.openembedded.org>
User-Agent: Mutt/1.6.2 (2016-06-11)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 01/51: piglit: fix build failure with gold linker
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
X-List-Received-Date: Wed, 10 Aug 2016 09:59:17 -0000
X-Groupsio-MsgNum: 85610
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qt257qdwq6dy2wbb"
Content-Disposition: inline

--qt257qdwq6dy2wbb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 10, 2016 at 09:47:26AM +0000, git@git.openembedded.org wrote:
> rpurdie pushed a commit to branch master
> in repository openembedded-core.
>=20
> commit 79005ff905f8c82a8766af5a927b9a0f8929e24f
> Author: Maxin B. John <maxin.john@intel.com>
> AuthorDate: Mon Aug 1 18:34:49 2016 +0300
>=20
>     piglit: fix build failure with gold linker
>    =20
>     When we use gold linker while DISTRO set to "nodistro", piglit build
>     fails with the following error:
>    =20
>     | ../../../../lib/libpiglitutil_gl.so.0: error: undefined reference to
>     'dlsym'
>     | ../../../../lib/libpiglitutil_gl.so.0: error: undefined reference to
>     'dlerror'
>     | ../../../../lib/libpiglitutil_gl.so.0: error: undefined reference to
>     'dlopen'
>     | collect2: error: ld returned 1 exit status
>    =20
>     Fix it by providing '-ldl' to LDFLAGS.
>    =20
>     [YOCTO #9851]
>    =20
>     Signed-off-by: Maxin B. John <maxin.john@intel.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/piglit/piglit_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-gr=
aphics/piglit/piglit_git.bb
> index 811f7af..df90c4d 100644
> --- a/meta/recipes-graphics/piglit/piglit_git.bb
> +++ b/meta/recipes-graphics/piglit/piglit_git.bb
> @@ -30,6 +30,8 @@ do_compile[dirs] =3D+ "${B}/temp/"
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[freeglut] =3D "-DPIGLIT_USE_GLUT=3D1,-DPIGLIT_USE_GLUT=3D0=
,freeglut,"
> =20
> +LDFLAGS_append =3D " ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold=
', '-ldl', '', d)}"

There was request to fix it properly in piglit code, why was this
version merged instead?

> +
>  do_configure_prepend() {
>     if [ "${@bb.utils.contains('PACKAGECONFIG', 'freeglut', 'yes', 'no', =
d)}" =3D "no" ]; then
>          sed -i -e "/^#.*include <GL\/freeglut_ext.h>$/d" ${S}/src/piglit=
/glut_wrap.h
>=20
> --=20
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qt257qdwq6dy2wbb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleq+vgACgkQN1Ujt2V2gBzBwACfQjvWM5KO6feqXIIeLP6FgjmS
49cAn268BFoxJwtW9eTGXFP8SSfQWK9w
=59XY
-----END PGP SIGNATURE-----

--qt257qdwq6dy2wbb--
