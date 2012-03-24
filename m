Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SBG7H-0002jc-Q8; Sat, 24 Mar 2012 02:50:03 +0100
Received: by wibhm17 with SMTP id hm17so2220795wib.0
	for <multiple recipients>; Fri, 23 Mar 2012 18:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HKV+c3ZJ0wQkQ2xWsGpF55IN+XIFkKBE3Go9+K3LLAY=;
	b=Gwgxk2LpWJxAc2G0v40jvnd/y9rjg2ENXYKw1nfXUsCPu4hubrZmLk263YE6E+ibZU
	5Jt/TLtxgmxOFSraw2Q+yMHYh9ORsDaHGoyBERvkA2ragAc5hqiDrfNfDxlZ72pz6txz
	ww/NiHQpCSgXXpd22DNpj9js8GMFBNOfZyTN5NoQ1kRjmoa2ZwMOafvbVdTWrx+W2CA3
	bvcgOzWMIug/K27iBcEf6H/MjXG3m5NSV1GWFbaGfQt7vT9glBLZ80QDAENMCJ4WGpex
	+UmtRP5UXnBtwk7GrYBOLLc3kiFuRGaEkJBf6gdHAgGJ7SSKUXgPFyEXiUPPZSbbCE4C
	2e8g==
Received: by 10.216.133.96 with SMTP id p74mr8191741wei.30.1332553266852;
	Fri, 23 Mar 2012 18:41:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b3sm18554633wib.4.2012.03.23.18.41.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 18:41:05 -0700 (PDT)
Date: Sat, 24 Mar 2012 02:41:08 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120324014107.GE4604@jama.jama.net>
References: <20120323175301.787D61032F@opal>
MIME-Version: 1.0
In-Reply-To: <20120323175301.787D61032F@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Andreas Oberritter : procps: use update-alternatives for pwdx, pgrep and watch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 24 Mar 2012 01:50:03 -0000
X-Groupsio-MsgNum: 19654
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5xSkJheCpeK0RUEJ"
Content-Disposition: inline

--5xSkJheCpeK0RUEJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 05:53:01PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 68dc2a3fa30c03a196d650de34d0c657a7b85454
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D68dc2a3fa30c03a196d650de34d0c657a7b85454
>=20
> Author: Andreas Oberritter <obi@opendreambox.org>
> Date:   Fri Mar 23 17:37:36 2012 +0100
>=20
> procps: use update-alternatives for pwdx, pgrep and watch

Good intention but results in this error in opkg upgrade:

update-alternatives: Error: cannot register alternative watch to
/usr/bin/watch since it is already registered to /bin/watch

can you move one of them or move alternative?

fwiw: gentoo also has procps's watch in bindir and busybox's in
base_bindir

Cheers,

>=20
> * pwdx, pgrep and watch may be provided by busybox.
> * Use update-alternatives to avoid conflict.
>=20
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-extended/procps/procps_3.2.8.bb |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-extended/procps/procps_3.2.8.bb b/meta/recipes-=
extended/procps/procps_3.2.8.bb
> index 27d2b5c..683badc 100644
> --- a/meta/recipes-extended/procps/procps_3.2.8.bb
> +++ b/meta/recipes-extended/procps/procps_3.2.8.bb
> @@ -1,11 +1,12 @@
>  require procps.inc
> =20
> -PR =3D "r5"
> +PR =3D "r6"
> =20
>  inherit update-alternatives
> =20
>  ALTERNATIVE_LINKS =3D "${bindir}/top ${bindir}/uptime ${bindir}/free ${b=
indir}/pkill ${bindir}/pmap \
> -                     ${base_bindir}/kill ${base_sbindir}/sysctl ${base_b=
indir}/ps"
> +                     ${base_bindir}/kill ${base_sbindir}/sysctl ${base_b=
indir}/ps \
> +                     ${bindir}/pgrep ${bindir}/pwdx ${bindir}/watch"
>  ALTERNATIVE_PRIORITY =3D "110"
> =20
>  SRC_URI +=3D "file://procmodule.patch \
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5xSkJheCpeK0RUEJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9tJjMACgkQN1Ujt2V2gBzVGgCcC36vDeVR2n9q9wJhaZC7F1e6
QRMAnjE9pH+aLeHmcjJFRhoi+TUnEsZz
=tWte
-----END PGP SIGNATURE-----

--5xSkJheCpeK0RUEJ--
