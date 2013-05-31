Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 07E526098F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 11:01:01 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id t60so1088563wes.39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 04:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZmtzDDi+UyRrrTF1chRfhvH6C1B57JRaKPcx4m/IMY4=;
	b=HLMyb+NAPCldtPJqfDpGIhaDjuVZuRm/+C/JtNtk+Sbs7UMBScmoIkZ6HceDdzwYCc
	FLeLtC2waD0XO/EIV80gxmeOJk649AO+r3I63iOsWDJw0FgVIiJ5nctd7PlQg0qUzoza
	XBrujS/iv8Ldnb/SMK8eOaLsQq8pDsB20z99ZrRSOhyqewVvcfNbzcUfGLJtOATEnwi2
	bUkjeyxH09W00JnUuyQ3sigxeyBqDNnpMTybhLEoXOG/lMSD+rpnR7+8WMgXEkYZ+Tno
	327qlXj7ezuzDY5S6odpLHKaI0+xY63fjR1TF4gKZ9WFz5ZjugjFUhlgUv4766lrSAEM
	Z/Rw==
X-Received: by 10.194.134.161 with SMTP id pl1mr8862093wjb.31.1369998062272;
	Fri, 31 May 2013 04:01:02 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b11sm3085886wiv.10.2013.05.31.04.01.00 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 31 May 2013 04:01:01 -0700 (PDT)
Date: Fri, 31 May 2013 13:01:13 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20130531110113.GA23802@jama>
References: <1369997391-28957-1-git-send-email-ross.burton@intel.com>
	<1369997391-28957-2-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1369997391-28957-2-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] mesa: update git recipe to 9.1.3 release
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
X-List-Received-Date: Fri, 31 May 2013 11:01:02 -0000
X-Groupsio-MsgNum: 40037
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline

--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2013 at 11:49:51AM +0100, Ross Burton wrote:
> It's not bleeding edge but it's better than the previous pre-9.1 commit.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/mesa/mesa-git.inc |    9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa-git.inc b/meta/recipes-graph=
ics/mesa/mesa-git.inc
> index ee9a552..aa2f2c3 100644
> --- a/meta/recipes-graphics/mesa/mesa-git.inc
> +++ b/meta/recipes-graphics/mesa/mesa-git.inc
> @@ -1,11 +1,12 @@
> -# Current pre-9.1 commit
> -SRCREV =3D "1665af3066f3d58c42e9d5b13098f13615a7672c"
> -PV =3D "9.1~git${SRCPV}"
> +# 9.1.3 commit
> +SRCREV =3D "f32ec82a8cfcabc5b7596796f36afe7986651f02"
> +PV =3D "9.1.3~git${SRCPV}"

Why '~' and not '+' like other git recipes? Maybe it matches 9.1.3 now
but with first SRCREV bump or with AUTOREV used '+' would be more
appropriate.

Cheers,

> =20
>  LIC_FILES_CHKSUM =3D "file://docs/license.html;md5=3D42d77d95cba529a3637=
129be87d6555d"
> =20
>  SRC_URI =3D "git://anongit.freedesktop.org/git/mesa/mesa;protocol=3Dgit \
> -           file://0002-cross-compile.patch \
> +           file://EGL-Mutate-NativeDisplayType-depending-on-config.patch=
 \
> +           file://fix-glsl-cross.patch \
>             "
> =20
>  S =3D "${WORKDIR}/git"
> --=20
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGogvkACgkQN1Ujt2V2gBxmPwCgs4IuHRGDOrtCnWOGJhk2Y5I2
emcAn35/vAEtrp8Nax/PMG1ymZKNrDmH
=UHDd
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
