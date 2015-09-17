Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8FCD376FF2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 15:08:54 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so28307910wic.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 08:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=o9CMx85jqvrmbQVUS2yQcIy6DBxAjm+24Hw8yBAAjng=;
	b=azhchmfBVwFxYIvdYst8YJRnaR3S+XofQLSf4wMC7DVKF5TVDk1L3X16eHMZCjTEWU
	XQTAIjXRlAEujdZtCq+T4pfrRlkN9dWdN8WCJJ4j2fg/lXjW6ZPPZbbeO8B2gxBvy7no
	EM/mcIPt1t8/ggxXmrmm6mfTRplmW6ejcoXnCD9AYKyK43pxXyj9AdMr7vaXdu9NoQkf
	EqxEmlZccPIiFuE6WTuedKyP9C57bHi0Ljmj1060xOCVEIpMt/0mqFg3rx0S1spAIuYl
	5y45dliXIIyDwKZBzvabn4vRp4hRuc7Gez8qJLjD2q2NDEZZEKaehjaHRqSoricC7ej2
	sBmQ==
X-Received: by 10.194.62.48 with SMTP id v16mr1873185wjr.60.1442502533982;
	Thu, 17 Sep 2015 08:08:53 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	o10sm10565753wia.4.2015.09.17.08.08.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Sep 2015 08:08:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 17 Sep 2015 17:09:09 +0200
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Message-ID: <20150917150909.GA2380@jama>
References: <cover.1442494048.git.jussi.kukkonen@intel.com>
	<f0b5037b3efdd8498a6499690009aed1c1273315.1442494048.git.jussi.kukkonen@intel.com>
MIME-Version: 1.0
In-Reply-To: <f0b5037b3efdd8498a6499690009aed1c1273315.1442494048.git.jussi.kukkonen@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] xinput-calibrator: Add a dummy calibration file for qemu
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
X-List-Received-Date: Thu, 17 Sep 2015 15:08:55 -0000
X-Groupsio-MsgNum: 71239
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2015 at 04:00:38PM +0300, Jussi Kukkonen wrote:
> This prevents xinput_calibrator from popping up on every boot in qemu.
>=20
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  .../xinput-calibrator/pointercal-xinput/pointercal-qemu.xinput      | 2 =
++
>  meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb    | 6 =
++++++
>  2 files changed, 8 insertions(+)
>  create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xi=
nput/pointercal-qemu.xinput
>=20
> diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/po=
intercal-qemu.xinput b/meta/recipes-graphics/xinput-calibrator/pointercal-x=
input/pointercal-qemu.xinput
> new file mode 100644
> index 0000000..a816d6d
> --- /dev/null
> +++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointerca=
l-qemu.xinput
> @@ -0,0 +1,2 @@
> +# Dummy pointercal.xinput file to prevent xinput_calibrator
> +# from running on qemu startup

NAK

Just put this in qemuall subdirectory and don't change the recipe.

> diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.=
0.bb b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
> index 65348c3..cab3d14 100644
> --- a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
> +++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
> @@ -5,8 +5,14 @@ LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MI=
T;md5=3D3da9cfbcb788c80a0384
>  PR =3D "r7"
> =20
>  SRC_URI =3D "file://pointercal.xinput"
> +SRC_URI_append_qemuall =3D " file://pointercal-qemu.xinput"
>  S =3D "${WORKDIR}"
> =20
> +do_install_prepend_qemuall () {
> +    install -d ${D}${sysconfdir}/
> +    install -m 0644 ${S}/pointercal-qemu.xinput ${D}${sysconfdir}/pointe=
rcal.xinput
> +}
> +
>  do_install() {
>      # Only install file if it has a contents
>      if [ -s ${S}/pointercal.xinput ] &&\
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlX615MACgkQN1Ujt2V2gBzqwQCfTGKpRfPA8iUOROBjPElUVQMx
G9QAn3CaZnUYepib92Md/RFNWCjrlL92
=IQon
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
