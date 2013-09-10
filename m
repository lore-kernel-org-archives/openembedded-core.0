Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 56D906BE78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 18:43:16 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h14so4201010eak.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 11:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=p5V892a7OINXHywPcbSNmPWEOb4dMT4yrDM67nlaC40=;
	b=TJmFP/ZNkUsK6lFjANuiamDFr0brQCOj39SVYtYxZnhUGEr/ZkD3IzpOGkyuZUz5kw
	hdcDqMTTMkIhlo7osoUlh5pApYl1CTmKumLcH2KfZshx8eGJ12IJu0nKpw3FAxEa9aVZ
	ryOmtqHRgTQBG1V3S2orrR+3DDnUwfCN38OmCEGHtB5IYJsz+Wggjqp6eu2eonoPYHlC
	z7zt9PktAwUa4zp7TikPiFXBnCRXgBMv/TfXCHBFfE62qJhTDb4o03iNKC/ouqEXkx1z
	ii9irKruDU3Y9fQivhrU+KYvrGWUfb8xy07ND+AavYGrCc44F3iBIKdpJa72oyIU73hB
	SXsg==
X-Received: by 10.14.108.9 with SMTP id p9mr40907560eeg.8.1378838597492;
	Tue, 10 Sep 2013 11:43:17 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	d8sm33568629eeh.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 10 Sep 2013 11:43:16 -0700 (PDT)
Date: Tue, 10 Sep 2013 20:44:42 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Message-ID: <20130910184442.GT11500@jama>
References: <cover.1378824959.git.laurentiu.palcu@intel.com>
	<fd6e252155ed3646c0e474647c214f4dc2fb7136.1378824959.git.laurentiu.palcu@intel.com>
MIME-Version: 1.0
In-Reply-To: <fd6e252155ed3646c0e474647c214f4dc2fb7136.1378824959.git.laurentiu.palcu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] meta-environment: change package name to include MACHINE
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
X-List-Received-Date: Tue, 10 Sep 2013 18:43:17 -0000
X-Groupsio-MsgNum: 44784
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fberPwKQctZF/fXp"
Content-Disposition: inline

--fberPwKQctZF/fXp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2013 at 06:10:46PM +0300, Laurentiu Palcu wrote:
> Currently, the package name contains just the TRANSLATED_TARGET_ARCH.
> When compiling the toolchain for two machines, belonging to the same
> architecture (for example: qemuarm and beagleboard), this package gets
> overwritten and adt-installer repo will contain just one
> meta-environment package... This leads to situations like installing the
> toolchain for qemuarm and end up with meta-environment package with
> beagleboard cpu options.
>=20
> [YOCTO #4783]
>=20
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  meta/recipes-core/meta/meta-environment.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-co=
re/meta/meta-environment.bb
> index 9731300..3a71a9b 100644
> --- a/meta/recipes-core/meta/meta-environment.bb
> +++ b/meta/recipes-core/meta/meta-environment.bb
> @@ -37,7 +37,7 @@ do_install() {
>      install -m 0644 -t ${D}/${SDKPATH} ${SDK_OUTPUT}/${SDKPATH}/*
>  }
> =20
> -PN =3D "meta-environment-${TRANSLATED_TARGET_ARCH}"
> +PN =3D "meta-environment-${MACHINE}"

You should probably change PACKAGE_ARCH as well.

>  PACKAGES =3D "${PN}"
>  FILES_${PN}=3D " \
>      ${SDKPATH}/* \
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fberPwKQctZF/fXp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIvaJoACgkQN1Ujt2V2gBwA/ACgitnTxIHDHRJqf7hDi+dlInOm
ngIAnihaOZ4mfjIYuwVs8fTSLKX/rUVu
=LdbP
-----END PGP SIGNATURE-----

--fberPwKQctZF/fXp--
