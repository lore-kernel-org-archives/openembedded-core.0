Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 57E006612D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 10:46:52 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id q128so30013291wma.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2016 03:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=NNdlVs1IrAcY5XZaLoOpbwWFqb3XgYG+2YvA87b4SeQ=;
	b=YffCc+dN+6rsST4dGiRJyzuE3e0v+7aIlopINN4UAL3SCV4Yx6qkDiKJBKqrGLcvwh
	+7u0jpgXtYEkC+R5XYd7bNY8vo2NBHeYlwlct96Nr3Wl8LPdgp1C+3iR8VKbkNxAVe6s
	QF3mvYfKQOU146gwLYngaBAdmCSrA79MImf3hgA6dJymjc56D9L21Q7tZrUu4cOal+WT
	Hdt1cF+nm84pkIiZYEraogT2h9Zm0EfTnCm0AEgUUkWfmnvFR5LI3OfQTxFbH6qD6CS+
	PWHCSql820ch9o723xXoMRP5H9i/GY0K2wSERSlzAu/hGz6Ja2vT3vD5sneWarXw6Gtw
	4T0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=NNdlVs1IrAcY5XZaLoOpbwWFqb3XgYG+2YvA87b4SeQ=;
	b=hyGyXZPtcZO/9v3qpIWPoqvZ3vkiQkLJntq2AkZIf9fe4lgHkYy0xBUZOoCrgEnYjB
	OtpKJAwlSrxbgORDHuLegmmWvf4TsFbvjHjjdnPktPgI/hkKu9fsn0OJUTFdwoeTvUUH
	VLAaA+3jvAI2vPw3JTAEjchbpy65a2auP8iA0wiOewRMGO1XeMFBLEAj/1e87UTCr9LW
	WI9u/1ZhTbBRltQ0r5ORUMRBrhNRACCQ1GITy0vCwoCzd1xW72GekCq9TTGGpPsqXHTP
	T0PW/YvbxCyfnX/T+yi5/fmGP11zN3JswTwNftQfF6Fpqhi+psE1+PwamLvSbUjZNwXN
	HILA==
X-Gm-Message-State: AEkoouv8sL2rSrj7cPxR5zFGEQxYt76PXU0Lv48Z/jB17l6xjcc3OLUYHTWrcQ0pj89sFA==
X-Received: by 10.28.163.199 with SMTP id m190mr19096080wme.5.1470134812388;
	Tue, 02 Aug 2016 03:46:52 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	qe2sm1994852wjc.28.2016.08.02.03.46.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Aug 2016 03:46:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 2 Aug 2016 12:46:55 +0200
To: "Maxin B. John" <maxin.john@intel.com>
Message-ID: <20160802104655.bdw5737btwsjzwyo@jama>
References: <1470065689-27089-1-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
In-Reply-To: <1470065689-27089-1-git-send-email-maxin.john@intel.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] piglit: fix build failure with gold linker
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
X-List-Received-Date: Tue, 02 Aug 2016 10:46:53 -0000
X-Groupsio-MsgNum: 85231
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oo72hc2gbrdp6ffq"
Content-Disposition: inline

--oo72hc2gbrdp6ffq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 01, 2016 at 06:34:49PM +0300, Maxin B. John wrote:
> When we use gold linker while DISTRO set to "nodistro", piglit build
> fails with the following error:
>=20
> | ../../../../lib/libpiglitutil_gl.so.0: error: undefined reference to
> 'dlsym'
> | ../../../../lib/libpiglitutil_gl.so.0: error: undefined reference to
> 'dlerror'
> | ../../../../lib/libpiglitutil_gl.so.0: error: undefined reference to
> 'dlopen'
> | collect2: error: ld returned 1 exit status
>=20
> Fix it by providing '-ldl' to LDFLAGS.
>=20
> [YOCTO #9851]
>=20
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
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

Shouldn't this be fixed in piglit itself?

And does it need to be applied only for gold?

>  do_configure_prepend() {
>     if [ "${@bb.utils.contains('PACKAGECONFIG', 'freeglut', 'yes', 'no', =
d)}" =3D "no" ]; then
>          sed -i -e "/^#.*include <GL\/freeglut_ext.h>$/d" ${S}/src/piglit=
/glut_wrap.h
> --=20
> 2.4.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oo72hc2gbrdp6ffq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlegeh4ACgkQN1Ujt2V2gBysJwCgrjSpaipOlSMBVEXK1f4eLsHV
tU8An165wkqHYYWyNKkWRIueaogqIr+R
=9JaY
-----END PGP SIGNATURE-----

--oo72hc2gbrdp6ffq--
