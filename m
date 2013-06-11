Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9AF096A998;
	Tue, 11 Jun 2013 17:06:41 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id l10so3173179eei.2
	for <multiple recipients>; Tue, 11 Jun 2013 10:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2mInRkU95OUkLpPLqd0c0aPQvjuDKAZ+CO9P0iZfBqs=;
	b=AIBuNr0KCvFOz+DWH7LfsGsb0H9/e1wukLKuxmshwoiOjPuT7Uz+74ZwS8di2Cuf+m
	JLRjLLUtEkLsa4mTe6rQDrklhkTeeeOFz0n6UD73jXae1iDllJLUMHoqhagYcktphM1l
	KRtTK/wwD97jcYqW0LGda+aphqF3+qOkIn5aqFz72VfTumVSlaD1AtJQ7Yf1RcglM77W
	fKXgKqoQpIGpkrsYagoXI5kzdtRcAJ6RRU0OOCZqkbgjIkzTIatUatYqDg/fgO9BM4nY
	XSvuJqGjGto4oNbN9Wc9FBOGEQc8sIsC7u7fdusMyoKYqf2Pl3iOnCLwB0IgRcjfsMnc
	tl+Q==
X-Received: by 10.14.178.134 with SMTP id f6mr17292660eem.91.1370970402066;
	Tue, 11 Jun 2013 10:06:42 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	u11sm31570110eev.12.2013.06.11.10.06.41 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 11 Jun 2013 10:06:41 -0700 (PDT)
Date: Tue, 11 Jun 2013 19:07:04 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Christopher Larson <chris_larson@mentor.com>
Message-ID: <20130611170704.GK3233@jama>
References: <20130611144932.08F545048D@opal>
MIME-Version: 1.0
In-Reply-To: <20130611144932.08F545048D@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Christopher Larson : packagegroup-base-vfat: include dosfsprogs
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
X-List-Received-Date: Tue, 11 Jun 2013 17:06:42 -0000
X-Groupsio-MsgNum: 40494
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NhBACjNc9vV+/oop"
Content-Disposition: inline

--NhBACjNc9vV+/oop
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2013 at 02:49:32PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 4ec66dc5f38913056942e1288c0b01a00ea0551f
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D4ec66dc5f38913056942e1288c0b01a00ea0551f
>=20
> Author: Christopher Larson <chris_larson@mentor.com>
> Date:   Mon Jun 10 13:47:06 2013 -0700
>=20
> packagegroup-base-vfat: include dosfsprogs
>=20
> The ext2 group includes e2fsprogs, so this is consistent and should be
> appropriate, I think.
>=20
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Isn't it called dosfstools?

$ find openembedded-core/ -name dos\*
openembedded-core/meta/recipes-devtools/dosfstools
openembedded-core/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
openembedded-core/meta/recipes-devtools/dosfstools/dosfstools
openembedded-core/meta/recipes-devtools/dosfstools/dosfstools/dosfstools-ms=
dos_fs-types.patch

and no RPROVIDES in dosfstools recipe ->

ERROR: Nothing RPROVIDES 'dosfsprogs' (but /OE/shr-core/openembedded-core/m=
eta/recipes-core/packagegroups/packagegroup-base.bb RDEPENDS on or otherwis=
e requires it)
NOTE: Runtime target 'dosfsprogs' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['dosfsprogs']
NOTE: Runtime target 'packagegroup-base-extended' is unbuildable, removing.=
=2E.
Missing or unbuildable dependency chain was: ['packagegroup-base-extended',=
 'dosfsprogs']

>=20
> ---
>=20
>  .../packagegroups/packagegroup-base.bb             |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/=
recipes-core/packagegroups/packagegroup-base.bb
> index 799e12a..061c1a7 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> @@ -179,7 +179,8 @@ RRECOMMENDS_packagegroup-base-vfat =3D "\
>      kernel-module-msdos \
>      kernel-module-vfat \
>      kernel-module-nls-iso8859-1 \
> -    kernel-module-nls-cp437"
> +    kernel-module-nls-cp437 \
> +    dosfsprogs"
> =20
>  SUMMARY_packagegroup-base-alsa =3D "ALSA sound support"
>  RDEPENDS_packagegroup-base-alsa =3D "\
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NhBACjNc9vV+/oop
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlG3WTgACgkQN1Ujt2V2gBzCdQCgsz77pUtFNee2c1QeKF/Zz8Jx
24MAnRGIGM/zPBXAvf8AW7CfDRIuWdz9
=rhy0
-----END PGP SIGNATURE-----

--NhBACjNc9vV+/oop--
