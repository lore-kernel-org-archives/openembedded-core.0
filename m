Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 86D2365DEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 15:48:38 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id em10so3813077wid.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 08:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dSjGWnOWD9HHLgHWfb1/vb+lSsw3fNJCtVS/kzGle4o=;
	b=ry/guqlWPu6IsQAJ+b8HAVMRjOw5hugwKLb8duRmyTLPIRxy5rSP9Qtteba5s/f2av
	N/dNSE/0dlyC55wnprSSwNBxKn0Mrsrvwd/7Xw927QdZKKTrsYIB+Czz7ZtINS2eDBeX
	n90MhoOL38Xls9WzqUXItcXKnZVbhSj2v+TLenSuDPSeCaFhn44/39GnALvO/ayJMlg1
	vNtlWbmEEbedh5kojuk88FstSc/Vi46ng8GAxNedqx/6wSpIDul7kJ12tuynkfzdsdEU
	7eDiAt4RoYWQAQgDddN2noNIu7xkeuwJlq+2gm8zKCqGzMeFloUWx4+zKnaF/VImc31M
	t/NQ==
X-Received: by 10.194.171.37 with SMTP id ar5mr53323764wjc.69.1412092118933;
	Tue, 30 Sep 2014 08:48:38 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bt9sm19603531wjc.44.2014.09.30.08.48.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Sep 2014 08:48:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 30 Sep 2014 17:49:31 +0200
To: "Noor, Ahsan" <noor_ahsan@mentor.com>
Message-ID: <20140930154931.GB25706@jama>
References: <1412087104-1560-1-git-send-email-noor_ahsan@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1412087104-1560-1-git-send-email-noor_ahsan@mentor.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sysprof: Creats x11 PACKAGECONFIG.
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
X-List-Received-Date: Tue, 30 Sep 2014 15:48:41 -0000
X-Groupsio-MsgNum: 58247
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gz4FNQG/2iJjJcgR"
Content-Disposition: inline

--gz4FNQG/2iJjJcgR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2014 at 07:25:04PM +0500, Noor, Ahsan wrote:
> From: Noor <noor_ahsan@mentor.com>
>=20
> * gtk+ and libglade is required to have graphical version of sysprof.
>   Created x11 packageconfig and added these two packages in that config
>   and removed from DEPENDS.
>=20
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
>  meta/recipes-kernel/sysprof/sysprof_git.bb |    7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes-ke=
rnel/sysprof/sysprof_git.bb
> index ef1e270..d3fb97a 100644
> --- a/meta/recipes-kernel/sysprof/sysprof_git.bb
> +++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
> @@ -2,8 +2,6 @@ SUMMARY =3D "System-wide Performance Profiler for Linux"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> =20
> -DEPENDS =3D "gtk+ libglade"
> -
>  SRCREV =3D "cd44ee6644c3641507fb53b8a2a69137f2971219"
>  PV =3D "1.2.0+git${SRCPV}"
> =20
> @@ -18,3 +16,8 @@ SRC_URI_append_mips64 =3D " file://rmb-mips.patch"
>  S =3D "${WORKDIR}/git"
> =20
>  inherit autotools pkgconfig
> +
> +PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11'=
, '', d)}"
> +
> +PACKAGECONFIG[x11] =3D ",,gtk+ libglade"

Is this deterministic? I don't think so, You need to add option to
explicitly disable it even when gtk+ and libglade get built because of
some other recipe (or user just having them in sysroot from earlier
builds).

> +
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

--gz4FNQG/2iJjJcgR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQq0QsACgkQN1Ujt2V2gByxZQCfcP9UzAAlvkZpr0oPWEXYGa5V
BkYAoKJdWDmjNhrpLYtrtIgofjkMi7T8
=V8r+
-----END PGP SIGNATURE-----

--gz4FNQG/2iJjJcgR--
