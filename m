Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id A23F374242;
	Thu, 24 Sep 2015 05:55:37 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so12827809wic.1;
	Wed, 23 Sep 2015 22:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7pY13YZZ9SOq6eRWhUVNe9b7OkZxOnHpZab1DvKuUA4=;
	b=zgDqePmcye2U0fLzkJTwznaXD3oE1jOIdXR1FSgZCEV6l+8Zpx/qHqeMJKENh1dEto
	hIz7es5K4dBLP0zYy/TZFRrH4f7627LgVi0hgW27SCtEBcUvAUThn1IP+XIyNOQlIK5x
	WlcbvbDLTzZTTjtIyP5SwGCLcGbqL8HtD6SPzX2nPVcUe8GSPFfjVB5DcbdzHVrd/CNe
	dgJMj7uFLJik47qTIGZ9FSMGLrUIM7qEgk6jAvcQnL7tT0vp3rge09/o++RuBB9Gcx9u
	guKXweweSCXrHMYrERO9JaxFxyYxI9f4Rzj8k8DKm8CuFWDBafyuTfMnHxTdSEAFd4aD
	SqTA==
X-Received: by 10.194.246.102 with SMTP id xv6mr37594637wjc.58.1443074137872; 
	Wed, 23 Sep 2015 22:55:37 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ry1sm10586834wjb.24.2015.09.23.22.55.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Sep 2015 22:55:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 24 Sep 2015 07:55:52 +0200
To: openembedded-core@lists.openembedded.org,
	Ross Burton <ross.burton@intel.com>
Message-ID: <20150924055552.GB2404@jama>
References: <20150923214627.8E23A50582@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150923214627.8E23A50582@opal.openembedded.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Ross Burton : Revert "systemd: disable problematic GCC 5.2 optimizations"
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
X-List-Received-Date: Thu, 24 Sep 2015 05:55:39 -0000
X-Groupsio-MsgNum: 71524
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wq9mPyueHGvFACwf"
Content-Disposition: inline

--wq9mPyueHGvFACwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2015 at 09:46:27PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master-next
> Commit: e5e69130c3cf20a95bab1561716d7e54db0fe1ee
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3De5e69130c3cf20a95bab1561716d7e54db0fe1ee
>=20
> Author: Ross Burton <ross.burton@intel.com>
> Date:   Tue Sep 22 10:05:23 2015 +0100
>=20
> Revert "systemd: disable problematic GCC 5.2 optimizations"

Please put at least some explanation why it was reverted.

> This reverts commit d347bd8b672fbd614a6267f640133cf399b9645f.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-core/systemd/systemd_225.bb | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_225.bb b/meta/recipes-core=
/systemd/systemd_225.bb
> index 4a19ff4..f7d4c7d 100644
> --- a/meta/recipes-core/systemd/systemd_225.bb
> +++ b/meta/recipes-core/systemd/systemd_225.bb
> @@ -123,9 +123,6 @@ EXTRA_OECONF =3D " --with-rootprefix=3D${rootprefix} \
>  # uclibc does not have NSS
>  EXTRA_OECONF_append_libc-uclibc =3D " --disable-myhostname "
> =20
> -# disable problematic GCC 5.2 optimizations [YOCTO #8291]
> -FULL_OPTIMIZATION +=3D "-fno-schedule-insns -fno-schedule-insns2"
> -
>  do_configure_prepend() {
>  	export NM=3D"${HOST_PREFIX}gcc-nm"
>  	export AR=3D"${HOST_PREFIX}gcc-ar"
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wq9mPyueHGvFACwf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYDkGcACgkQN1Ujt2V2gBydYACeNaFawEydFcZjgyygCucqqOZd
roEAn3bCnKEFq7fUMD4MoAg/IQZ9qCUs
=nA9q
-----END PGP SIGNATURE-----

--wq9mPyueHGvFACwf--
