Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 698047319F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 11:23:40 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id i5so35813028wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Aug 2016 04:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=wXWhBEjXiGidAn5hVNf5jLtqCHkYyGdU/DBv4QSuyhs=;
	b=j51Jzng9LtzeNbbq0f2eBsM4xyczdtBgCgQewOnrcFT171QOuccKI4vcwmFEsapv1H
	gYkZ6dLaWmMBZ20/mM8JStkGLL3Ynr6LOfZIHzjPC1GHnG/apYd442KR7wmTgetjrVZP
	Ua/0aFmgjnPLkDVEmZQ66Pe51wvgL53DXzVYCrhx+J+mBH4Mi4fb3T9sGzhnyib/0LGV
	dU6S+6XVSr+C2RDf9eflYYkc516gYakNvf/CBPKopEiv5Nk5/UdCKh1pe3ztxUAw9k5C
	imnLh2BJNoNzwDh7Fz7DQyMjxnusaV+d0U29Qp/39sgfRQDtVDYUYhz9jOzi9tVElmMF
	cW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=wXWhBEjXiGidAn5hVNf5jLtqCHkYyGdU/DBv4QSuyhs=;
	b=lsMR+32GGQEj4vZuQGlpepkskVRMnJU9ho6glaobTknF8NTqywTwjenqXiGA82vpb0
	K/jZrlOrShDWWLXfi1+VIusWiqOZFTyaxX+GnegvngxfHxOiRsveyBN4POnx1B59Uw8z
	KYPnVWikSrM9LSHqJ1wEHkoCUhs1vL7PgNZOEfTXsoYqKQz0UssbH5hdPjqAtNj8nd3s
	o6cKDfVcyr0aQkS7bRoi8IBL3w5et6dC+40t96ypeFra+a6GW4toAdb07KcdcjhXj3pc
	M9/ckFHEvYE6sw18eghgEcS2cZ6W3GsHHyPd+Q8JhFVJEDO1PduFzoO7YjSwcxEnA86P
	AHAw==
X-Gm-Message-State: AEkoout+3/kQ30Kdc3bbRPfO5LLpsMlVLOFU4oVoExT4r3zF/0NHwjnfesPMVVaFdchnCQ==
X-Received: by 10.28.169.203 with SMTP id s194mr68016970wme.95.1470223420681; 
	Wed, 03 Aug 2016 04:23:40 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id s6sm7249462wjm.25.2016.08.03.04.23.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 03 Aug 2016 04:23:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 3 Aug 2016 13:23:45 +0200
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20160803112345.mfppse5vkopmimsb@jama>
References: <1470168159-1748-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1470168159-1748-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pointercal-xinput: set ALLOW_EMPTY
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
X-List-Received-Date: Wed, 03 Aug 2016 11:23:42 -0000
X-Groupsio-MsgNum: 85274
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bntgv6f4x6qasliz"
Content-Disposition: inline

--bntgv6f4x6qasliz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 02, 2016 at 09:02:39PM +0100, Ross Burton wrote:
> Many BSPs don't have pointer calibration, so set ALLOW_EMPTY so the packa=
ge
> still exists (for dependencies) even if there isn't a calibration file to
> package.

And what's the point of that empty package?

xinput-calibrator is already using RRECOMMENDS for it to work correctly
when there isn't pointercal-xinput for given BSP and the packagegroup
change isn't needed (as you don't need pointercal-xinput without
xinput-calibrator)

xinput-calibrator_git.bb:RRECOMMENDS_${PN} =3D "pointercal-xinput"

>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.=
0.bb b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
> index 65348c3..71756c3 100644
> --- a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
> +++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
> @@ -17,4 +17,5 @@ do_install() {
>  }
> =20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +ALLOW_EMPTY_${PN} =3D "1"
>  CONFFILES_${PN} =3D "${sysconfdir}/pointercal.xinput"
> --=20
> 2.8.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bntgv6f4x6qasliz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleh1CgACgkQN1Ujt2V2gBxR3QCeJ8LlEY4AIANZGxs8ZzX3VSEW
LPoAn1crnS7Wm8PR/OI4n0Dh/fo9oXOi
=Xktg
-----END PGP SIGNATURE-----

--bntgv6f4x6qasliz--
