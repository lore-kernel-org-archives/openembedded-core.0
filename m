Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id C896A71CB3;
	Wed, 22 Feb 2017 20:47:35 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id v77so2411963wmv.0;
	Wed, 22 Feb 2017 12:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=sG2ev/NrPo8OfwN5DNuaFYC5rU4aCW6eaEbNaSs1DQE=;
	b=FMHP05ECOgsg2x+57PXczPEbnHJkhp8BbkXPsUNaqGmlaXgr/Qy9x6itj+XqfOiVO6
	zCxHO/OUxjyIUsfh/OrPZfsr2Boqy4r7cvxYEcFDDqPufsPGKDeUkm3FIKBc4mAdwm4o
	CvxqNTNllRH+7f56mR7hIIJnmWFUmxF03ubP7WL1lXSyHigBWOB3b2Ov3m/rokKP+xuO
	M1Ab7jOhYXEQgYrcWXWxwdmd2Vzs7DD9ZWkbm9gGWYcjUzIg6beSEuX/33xfUhX1fQCg
	r/gMzPyV9nBvmVxG1lamV1DadnO1Wdp4LOtaFA3GhBF9D2lPTVGXB4NrhXshb3WqZclD
	Bmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=sG2ev/NrPo8OfwN5DNuaFYC5rU4aCW6eaEbNaSs1DQE=;
	b=Hf+1SJGNkpLe3wM3BiIDNbwqgU5zVOox9uI0T9Xac7EhWtcPOPV3jYmaAO3KPial0f
	Sm7BNDZ6BElnK25JD4F13YVUQqLW9Xgrmg7NjqxvF17VntKX9XQdFafNfTvpJ3idIK09
	NjC038zE7rj1YMZTDTcaNyhHDXCZAoMktvPrcKRGNTa5vsRW3x5T/LcG6I+waHBfUwvq
	TgHKhuuXdrJTkb9YpX55vZOJbMHhEPABWlJwEqU/sbYGTnf+n/O95WWEASZAo6NFaEeB
	1QCEGMwN3CnArQApVKPCfDkQLa4l4hcqwwceykBmcproX/vCkAdpDm3nqA2AvgIB2Iqs
	vW9w==
X-Gm-Message-State: AMke39nMdXqjLWAS+2SguFIiFF8V0l6ldRictpRl/ySZhDYFqAM1EML0ZDUbD3QQ9xfnvA==
X-Received: by 10.28.140.140 with SMTP id o134mr230860wmd.87.1487796456317;
	Wed, 22 Feb 2017 12:47:36 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	h75sm3125995wrh.37.2017.02.22.12.47.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 Feb 2017 12:47:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 22 Feb 2017 21:47:36 +0100
To: Derek Straka <derek@asterius.io>, jose.a.lamego@intel.com,
	michael@yoctoproject.org
Message-ID: <20170222204736.GG3283@jama>
References: <1487785536-13777-1-git-send-email-derek@asterius.io>
MIME-Version: 1.0
In-Reply-To: <1487785536-13777-1-git-send-email-derek@asterius.io>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Patchwork not picking changes from the ML Was: [oe] [meta-python][PATCH] python-paho-mqtt: update to version 1.2
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
X-List-Received-Date: Wed, 22 Feb 2017 20:47:36 -0000
X-Groupsio-MsgNum: 93855
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="D6IIOQQv2Iwyp54J"
Content-Disposition: inline

--D6IIOQQv2Iwyp54J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2017 at 12:45:36PM -0500, Derek Straka wrote:
> Signed-off-by: Derek Straka <derek@asterius.io>

It's not your fault Derek, but most of the patches from today and based
on the pings from today also some earlier patches didn't make it into
patchwork. This one is the only exception.

Michael, Jose: are you aware of some issues with patchwork? Could it be
caused by the default Reply-to change from yesterday (or day before
during OEDAM)?

I know only about issues processing merged changes:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10967
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10759

And also UI issue in patchwork that paging doesn't work, e.g.:
https://patchwork.openembedded.org/bundle/jama/master-next/?submitter=3D&st=
ate=3D&q=3D&archive=3Dboth
shows that there are 5 pages of changes (which should be in most cases
marked as accepted by the hook above), but clicking on 2nd page produces
link which drops the query parameters:
https://patchwork.openembedded.org/bundle/jama/master-next/?page=3D2
so it says "No patches to display"

Regards,

> ---
>  .../python/{python-paho-mqtt_1.1.bb =3D> python-paho-mqtt_1.2.bb}       =
| 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-paho-mqtt_1.1.bb =3D>=
 python-paho-mqtt_1.2.bb} (68%)
>=20
> diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb =
b/meta-python/recipes-devtools/python/python-paho-mqtt_1.2.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb
> rename to meta-python/recipes-devtools/python/python-paho-mqtt_1.2.bb
> index b8f5f3f..c8acfc5 100644
> --- a/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb
> +++ b/meta-python/recipes-devtools/python/python-paho-mqtt_1.2.bb
> @@ -11,5 +11,5 @@ RDEPENDS_${PN} =3D "\
>                 python-threading \
>  "
> =20
> -SRC_URI[md5sum] =3D "a6407b74eb5e5411e157be1de5c11366"
> -SRC_URI[sha256sum] =3D "0f7a629efe6e3a2c61b59d3550aa9f2c4529b5689a65fde4=
5e6f1ac36b9a261e"
> +SRC_URI[md5sum] =3D "241150b3fcb920ddca4d33181f3238b1"
> +SRC_URI[sha256sum] =3D "9100a6aa706ab699d414ec02705a21eb66f436184691d0bf=
1f2a85a6213c6c1f"
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--D6IIOQQv2Iwyp54J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWK345wAKCRA3VSO3ZXaA
HIS+AJ4vZFkVfySuoVDcj1/u83a+Y2INGACbBkhw1KODXtLGzjmVXtLu84N0AH4=
=lLSr
-----END PGP SIGNATURE-----

--D6IIOQQv2Iwyp54J--
