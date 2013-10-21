Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id DE41A6D1B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 11:17:54 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id e50so2109696eek.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 04:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xFm6YnTxsyfmpZAfPz219MkUMuYcFL2iAbtcC8TLUk8=;
	b=jfhZM1BY6TZDvg7bSJGXLo4LLzHFhu5sPCkDtw85jG1sXta9miqp4OZAGEYbSuMA94
	o77QAM10ReWId2ETmL3UwQeSJ6brbOFXGwY0wC18+DRyEQauQvexAnKYWlFIdlshSovB
	MqsKO/crDqcJ0qAJ3uBHXciB8OHF274Mgtjba2EsZ+Vh/sJ3i4LrPM01w/YN4VmayTF7
	i8kf10aGZ0O/iQxxyZK2WsoGmmZyAogGkQdEpybQwJxX4D6aGM5F5K6S5VbK3bmcTCX/
	rIIuDduWFROVl/g8Ini1/07R3OYKm5bj1ksSxncImmhQxYiEMfuEVumy05SXqBThGJyd
	izNw==
X-Received: by 10.14.241.74 with SMTP id f50mr22085584eer.29.1382354276005;
	Mon, 21 Oct 2013 04:17:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id z12sm42559284eev.6.2013.10.21.04.17.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Oct 2013 04:17:55 -0700 (PDT)
Date: Mon, 21 Oct 2013 13:17:57 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Ulf Samuelsson <ulf@emagii.com>
Message-ID: <20131021111757.GE3709@jama>
References: <1382345997-28170-1-git-send-email-ulf@emagii.com>
MIME-Version: 1.0
In-Reply-To: <1382345997-28170-1-git-send-email-ulf@emagii.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Add tune for Cortex-A5 chips
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
X-List-Received-Date: Mon, 21 Oct 2013 11:17:55 -0000
X-Groupsio-MsgNum: 46094
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lIrNkN/7tmsD/ALM"
Content-Disposition: inline

--lIrNkN/7tmsD/ALM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2013 at 10:59:57AM +0200, Ulf Samuelsson wrote:
> Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
> ---
>  meta/conf/machine/include/tune-cortexa5.inc |   24 +++++++++++++++++++++=
+++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta/conf/machine/include/tune-cortexa5.inc
>=20
> diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/conf/mach=
ine/include/tune-cortexa5.inc
> new file mode 100644
> index 0000000..69c945e
> --- /dev/null
> +++ b/meta/conf/machine/include/tune-cortexa5.inc
> @@ -0,0 +1,24 @@
> +DEFAULTTUNE ?=3D "cortexa5thf"

wasn't cortexa5 added already in:

commit 50bc63c5c377d9fbb87b3efefc8c6f5473ba642a
Author: Andy Voltz <andy.voltz@timesys.com>
Date:   Wed Jun 5 11:52:30 2013 -0400

    tune-cortexa5.inc: Add tune file for cortex-a5

I think that one was better, because it had optional neon support and
default DEFAULTTUNE should be something more generic (at least to stay
consistent with other tunes) it's DISTRO decision to select common
denominator (or more specific tunes for each MACHINE) for binary feeds
they want to manage.

see
commit a11bdc36a1be18cc5aa14682b2a2c9ee83141f51
Author: Martin Jansa <Martin.Jansa@gmail.com>
Date:   Tue Oct 2 13:21:08 2012 +0000

    tune-*: define more generic DEFAULTTUNE to share feed between
machines

> +# TUNE_FEATU4RES     =3D "armv7a vfp callconvention-hard"
> +# TARGET_FPU        =3D "vfp"
> +
> +require conf/machine/include/arm/arch-armv7a.inc
> +
> +TUNEVALID[cortexa5] =3D "Enable Cortex-A5 specific processor optimizatio=
ns"
> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "cortexa5", "-mt=
une=3Dcortex-a5", "", d)}"
> +
> +# Little Endian base configs
> +AVAILTUNES +=3D "cortexa5 cortexa5t"
> +TUNE_FEATURES_tune-cortexa5 =3D "${TUNE_FEATURES_tune-armv7a} cortexa5"
> +TUNE_FEATURES_tune-cortexa5t =3D "${TUNE_FEATURES_tune-armv7at} cortexa5"
> +
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5 =3D "${PACKAGE_EXTRA_ARCHS_tune-armv7a=
}"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5t =3D "${PACKAGE_EXTRA_ARCHS_tune-armv7=
at}"
> +
> +# VFP Tunes
> +AVAILTUNES +=3D "cortexa5hf cortexa5thf"
> +TUNE_FEATURES_tune-cortexa5hf ?=3D "${TUNE_FEATURES_tune-armv7ahf} corte=
xa5"
> +TUNE_FEATURES_tune-cortexa5thf ?=3D "${TUNE_FEATURES_tune-armv7athf} cor=
texa5"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5hf =3D "${PACKAGE_EXTRA_ARCHS_tune-armv=
7ahf}"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa5thf =3D "${PACKAGE_EXTRA_ARCHS_tune-arm=
v7athf}"
> +
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lIrNkN/7tmsD/ALM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJlDWUACgkQN1Ujt2V2gBw+rQCfdNf8pm/U5+xeYROU/WGM4vgu
LnQAni6gbcGRFNqzuW6JOy3S5oU+r485
=fLr1
-----END PGP SIGNATURE-----

--lIrNkN/7tmsD/ALM--
