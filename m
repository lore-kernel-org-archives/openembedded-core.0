Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4CA49731D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 16:37:51 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 128so11603565wmz.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 08:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4xqYpZGVcy1QnEytt2CZ7D02RgrxRw6zcLfqzULmvjs=;
	b=fEc1mC+x05Dcrx5Y0+Ov62MM/TFBLZqmHYmPds5kXipZwlZw+n85kNLJKG+uvdOYQD
	x2sBvRu8vRK6alJy797P/5GOw2fnnhcLakXY/szVFZLm63usNtgLUhfAlCQnhCVZB8u7
	dEVSEJuBFL7gkF8SnAQI75DmCGXE4V/HsrFXYRHRuumqvQaBkOaQjpepr9MjubMcX1yI
	sj6pbtUoz8ShjCqzMTCsVP6oghZ9jj3zV3Od/VD3MFzKHdZj773JzD+N6dqc67GCI3ke
	uonxXA7U93vEOrxCQQB06TFynxeA20X4dLD/QDfP1WHh5MSfFk+jZxEDp/WFUvbcQ0lF
	lcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=4xqYpZGVcy1QnEytt2CZ7D02RgrxRw6zcLfqzULmvjs=;
	b=g9GF7kkcnDukf4CXTR0Kyo+HWEZU44m9BQLEZ0i2bZiC704tzJrw9blJl4dsVQgmFZ
	cYtunvuQbAN5UZiw99D/iQj0k9rN9qQwJfLSG3MvI3ObhszWfr1vPstOvSnHvS8XniP8
	0UbBhbnk4dR+PN2+K25/EAoQd3xnKknUcWlswfD9LY5B1/HrfFiH7VF6Rft8yFmW/I43
	O/KS2sqUBR+1IiPZJJduJUdSqmEm/ZDPjM+osHSxru4mFvRmdowCzZk13QMWXToXYZRV
	p9vAamVTbNapSkQqHbhmAQ1+vtnkOLOOJRQ287F3Kvq4bFopHdG66GYuzPzXpZdrhr6e
	3fNQ==
X-Gm-Message-State: AG10YOQhE+oHPZtT+/kyrn2SpxT7HruxrJ8o9j6YKJGm4B4oefYmBSOH8QyA9ds/4IFiwQ==
X-Received: by 10.194.157.165 with SMTP id wn5mr54258480wjb.41.1455208671297; 
	Thu, 11 Feb 2016 08:37:51 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	e194sm8808119wma.19.2016.02.11.08.37.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Feb 2016 08:37:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 11 Feb 2016 17:41:54 +0100
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Message-ID: <20160211164154.GB2595@jama>
References: <1455203936-28150-1-git-send-email-adrian.ratiu@ni.com>
MIME-Version: 1.0
In-Reply-To: <1455203936-28150-1-git-send-email-adrian.ratiu@ni.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] tune-cortexa9.inc: add vfpv3 tunes
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
X-List-Received-Date: Thu, 11 Feb 2016 16:37:52 -0000
X-Groupsio-MsgNum: 78013
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0eh6TmSyL6TZE2Uz"
Content-Disposition: inline

--0eh6TmSyL6TZE2Uz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2016 at 05:18:56PM +0200, Ioan-Adrian Ratiu wrote:
> From: Richard Tollerton <rich.tollerton@ni.com>
>=20
> Define tunnings to enable 32 register VFPv3 for cortexa9 processor cores

Can you execute the test from:
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/tune2-=
test
just to verify that all these new combinations work ok and to update the
test results for next person modifying the tune files?

Thanks

> More details: http://www.arm.com/products/processors/technologies/vector-=
floating-point.php
>=20
> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  meta/conf/machine/include/tune-cortexa9.inc | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/mach=
ine/include/tune-cortexa9.inc
> index 965f2d9..3d8dc1d 100644
> --- a/meta/conf/machine/include/tune-cortexa9.inc
> +++ b/meta/conf/machine/include/tune-cortexa9.inc
> @@ -34,3 +34,18 @@ PACKAGE_EXTRA_ARCHS_tune-cortexa9hf             =3D "$=
{PACKAGE_EXTRA_ARCHS_tune-ar
>  PACKAGE_EXTRA_ARCHS_tune-cortexa9thf            =3D "${PACKAGE_EXTRA_ARC=
HS_tune-armv7athf} cortexa9hf-vfp cortexa9t2hf-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-neon        =3D "${PACKAGE_EXTRA_ARC=
HS_tune-armv7ahf-neon}  cortexa9hf-vfp cortexa9hf-neon"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa9thf-neon       =3D "${PACKAGE_EXTRA_ARC=
HS_tune-armv7athf-neon} cortexa9hf-vfp cortexa9hf-neon cortexa9t2hf-vfp cor=
texa9t2hf-neon"
> +
> +# VFPv3 Tunes
> +AVAILTUNES +=3D "cortexa9-vfpv3 cortexa9t-vfpv3 cortexa9hf-vfpv3 cortexa=
9thf-vfpv3"
> +ARMPKGARCH_tune-cortexa9-vfpv3          =3D "cortexa9"
> +ARMPKGARCH_tune-cortexa9t-vfpv3         =3D "cortexa9"
> +ARMPKGARCH_tune-cortexa9hf-vfpv3        =3D "cortexa9"
> +ARMPKGARCH_tune-cortexa9thf-vfpv3       =3D "cortexa9"
> +TUNE_FEATURES_tune-cortexa9-vfpv3           =3D "${TUNE_FEATURES_tune-ar=
mv7a-vfpv3}          cortexa9"
> +TUNE_FEATURES_tune-cortexa9t-vfpv3          =3D "${TUNE_FEATURES_tune-ar=
mv7at-vfpv3}         cortexa9"
> +TUNE_FEATURES_tune-cortexa9hf-vfpv3         =3D "${TUNE_FEATURES_tune-ar=
mv7ahf-vfpv3}        cortexa9"
> +TUNE_FEATURES_tune-cortexa9thf-vfpv3        =3D "${TUNE_FEATURES_tune-ar=
mv7athf-vfpv3}       cortexa9"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa9-vfpv3           =3D "${PACKAGE_EXTRA_A=
RCHS_tune-armv7a-vfpv3}  cortexa9-vfp cortexa9-vfpv3"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa9t-vfpv3          =3D "${PACKAGE_EXTRA_A=
RCHS_tune-armv7at-vfpv3} cortexa9-vfp cortexa9-vfpv3 cortexa9t2-vfp cortexa=
9t2-vfpv3"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa9hf-vfpv3         =3D "${PACKAGE_EXTRA_A=
RCHS_tune-armv7ahf-vfpv3}  cortexa9hf-vfp cortexa9hf-vfpv3"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa9thf-vfpv3        =3D "${PACKAGE_EXTRA_A=
RCHS_tune-armv7athf-vfpv3} cortexa9hf-vfp cortexa9hf-vfpv3 cortexa9t2hf-vfp=
 cortexa9t2hf-vfpv3"
> --=20
> 2.7.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0eh6TmSyL6TZE2Uz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAla8udEACgkQN1Ujt2V2gByKhgCgudbZxQ8gJzaWjxlYpZZVj6ei
Gq8AnjaiwoKFMti4b943Edcvkhci/n02
=PAW5
-----END PGP SIGNATURE-----

--0eh6TmSyL6TZE2Uz--
