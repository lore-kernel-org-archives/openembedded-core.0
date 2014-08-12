Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id C9DED609C0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 11:30:35 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id p10so9977641wes.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 04:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Ldx23pgUTwdqR2SfEN8FWw72Rm9K7tyh4zNFRBE5hzg=;
	b=O3UM8hY+BH6WH0Na9ngYQQSvGvi6WqLXbcTBxUGrEI0sdCD/01FB3RxiwkhlcA9sNu
	RGtcEk9c/nJtaKmoIGEruxn9rFroKaeVswLAQ1l2f2Zt0o/nE3PRgplAlAse2uKgbG8O
	bvcaQYTIgvI5lT1vsB5FMWICZhBKbnJVfQ9J7oC91Kk/ipei36mZK4OhIktMocd7kujw
	qpnxkLtauU0xQdFvOK3r2wuCebG5rKZFt/uWhVuVRZxqanoPuaCgQTvfgwfOuAqd/2DI
	K2CAPK8Vvhdr38E2taHV0Nkj4J0R3IWkBOQS7/MExcExx7vWEAZaDRYzWWM4jVf2arjY
	OJXg==
X-Received: by 10.180.91.111 with SMTP id cd15mr31367187wib.69.1407843036037; 
	Tue, 12 Aug 2014 04:30:36 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ek3sm8665623wjd.17.2014.08.12.04.30.35 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Aug 2014 04:30:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 12 Aug 2014 13:31:11 +0200
To: Yasir Khan <yasir_khan@mentor.com>
Message-ID: <20140812113111.GF14848@jama>
References: <1407766170-39252-1-git-send-email-yasir_khan@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1407766170-39252-1-git-send-email-yasir_khan@mentor.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lttng-ust: update to version 2.5.0
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
X-List-Received-Date: Tue, 12 Aug 2014 11:30:41 -0000
X-Groupsio-MsgNum: 56348
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lhCGTQ23j+ufNnvZ"
Content-Disposition: inline

--lhCGTQ23j+ufNnvZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2014 at 07:09:30PM +0500, Yasir Khan wrote:
> From: Yasir-Khan <yasir_khan@mentor.com>
>=20
> update to latest stable-2.5 revision
>=20
> Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
> ---
>  .../{lttng-ust_2.4.0.bb =3D> lttng-ust_2.5.0.bb}     |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-kernel/lttng/{lttng-ust_2.4.0.bb =3D> lttng-ust_2.5.=
0.bb} (87%)
>=20
> diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.4.0.bb b/meta/recipes-=
kernel/lttng/lttng-ust_2.5.0.bb
> similarity index 87%
> rename from meta/recipes-kernel/lttng/lttng-ust_2.4.0.bb
> rename to meta/recipes-kernel/lttng/lttng-ust_2.5.0.bb
> index 1629554..1595627 100644
> --- a/meta/recipes-kernel/lttng/lttng-ust_2.4.0.bb
> +++ b/meta/recipes-kernel/lttng/lttng-ust_2.5.0.bb
> @@ -17,11 +17,11 @@ RPROVIDES_${PN} =3D "lttng2-ust"
>  RREPLACES_${PN} =3D "lttng2-ust"
>  RCONFLICTS_${PN} =3D "lttng2-ust"
> =20
> -SRCREV =3D "5ba5bf7fba804d2de773ae1c71106a8ed856c56a"
> -PV =3D "2.4.0"
> +SRCREV =3D "ce59a997afdb7dc8af02b464430bb7e35549fa66"
> +PV =3D "2.5.0"
>  PE =3D "2"

Please fix the LICENSE, see:
https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg54=
629.html

> =20
> -SRC_URI =3D "git://git.lttng.org/lttng-ust.git;branch=3Dstable-2.4 \
> +SRC_URI =3D "git://git.lttng.org/lttng-ust.git;branch=3Dstable-2.5 \
>             file://lttng-ust-doc-examples-disable.patch \
>  	   "
> =20
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

--lhCGTQ23j+ufNnvZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPp+v8ACgkQN1Ujt2V2gByhlQCfazBYHVZTqvRYHNCCP2QGaZjl
INgAnRLIn2POp0Twol+GIRnvKunHOOEr
=8/Jg
-----END PGP SIGNATURE-----

--lhCGTQ23j+ufNnvZ--
