Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2968E6B7CB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 09:16:44 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id k48so2452620wev.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jun 2014 02:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=q2llCNeMF9ToHT9yU6QQBPmKMipkrEX7RLpeCfQch30=;
	b=gSAqbLjYWMuo7diFd+ch4SUZNXjmVFJDHPUyr/ISdO/fRfwjJ7Z4Iz7SCQa8iLTHWl
	jI0ncm3Cpu1FjcgPMTFsMit1pP5x9o0qiEp1cVCTDvGEOtO4e0ceYMyuz7pYr4Cnw2CC
	IktDmCpfNTRHlhVR7Rnabcy9zBGyxOrozKHntOFZZmZ0dZdRvumVNIZ6G75EGflr028a
	OEIs7dMpp/VH8E3YCERvDrSjccvUkDuY8SoqnCMXQs+K1EFgbwXj+5Du93BIt/o0JnAY
	orVxGgDqrBkA06ChoClm8eV8OjmZGaE/qle9BH4Pw0bgejZeKdl396lG4ZDG9WfIJwno
	yyWw==
X-Received: by 10.14.198.197 with SMTP id v45mr170208een.14.1402046205052;
	Fri, 06 Jun 2014 02:16:45 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	h6sm21520794eew.38.2014.06.06.02.16.43 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jun 2014 02:16:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 6 Jun 2014 11:17:00 +0200
To: Yao Xinpan <yaoxp@cn.fujitsu.com>
Message-ID: <20140606091700.GW2426@jama>
References: <1402025177-7694-1-git-send-email-yaoxp@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1402025177-7694-1-git-send-email-yaoxp@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lvm2.inc: EXTRA_OECONF is been overwrited
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
X-List-Received-Date: Fri, 06 Jun 2014 09:16:46 -0000
X-Groupsio-MsgNum: 53894
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6AmSH+YAqnsWd9jO"
Content-Disposition: inline

--6AmSH+YAqnsWd9jO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 05, 2014 at 11:26:17PM -0400, Yao Xinpan wrote:
> EXTRA_OECONF has been assigned before =E2=80=98EXTRA_OECONF =3D "--with-u=
srlibdir=3D${libdir}"=E2=80=99.
>=20
> So, =E2=80=98EXTRA_OECONF =3D "--with-usrlibdir=3D${libdir}"=E2=80=99 sho=
uld be changed to
> =E2=80=98EXTRA_OECONF +=3D "--with-usrlibdir=3D${libdir}"=E2=80=99.
>=20
> Signed-off-by: Yao Xinpan <yaoxp@cn.fujitsu.com>
> ---
>  meta-oe/recipes-support/lvm2/lvm2.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-supp=
ort/lvm2/lvm2.inc
> index c6a9ec0..71f782a 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> @@ -47,4 +47,4 @@ FILES_${PN} +=3D "${libdir}/device-mapper/*.so ${base_l=
ibdir}/udev"
>  FILES_${PN}-dbg +=3D "${libdir}/device-mapper/.debug"
> =20
>  RDEPENDS_${PN} =3D "bash"
> -EXTRA_OECONF =3D "--with-usrlibdir=3D${libdir}"
> +EXTRA_OECONF +=3D "--with-usrlibdir=3D${libdir}"

Please send it to openembedded-devel@lists.openembedded.org with right
subject tag (see README file)

> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6AmSH+YAqnsWd9jO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlORhwwACgkQN1Ujt2V2gBxylgCgkG6ehc3h5Sfe842sYZ+W0XYC
yqYAnifKEtRYE2MkeqYTzS0YxSX/PitN
=Ja7e
-----END PGP SIGNATURE-----

--6AmSH+YAqnsWd9jO--
