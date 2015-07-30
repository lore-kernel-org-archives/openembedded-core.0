Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6BDB2764A1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 14:29:56 +0000 (UTC)
Received: by wicmv11 with SMTP id mv11so23591398wic.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 07:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hLb1IvyRfGhG3UmhrmuU5hLqm/lR4yqz1ApZOo9qXGI=;
	b=wbvwHVdbekOfDyWs+hQX90V5KYNO1EhgPiqd0S+V5Vvb77pF3Q6ijJZIU9pnXRBoV/
	rUUOUgSBf783soe7FbwLTV0HIa51jXTrgaheQho/DlhVAJmTY+a5bWsCsdT6rH5SL/XB
	RrWKlskeCiqTBoOD/AYiCPXTqEFp09cIVQS9Xs5Ufcw2QTPh/MHd2oesVrcJ4SSFCriz
	ms5+cuLSbQgbmBUaBKR2bZk7eUn8gttEH0aPZpmcrhW2s/8tILvaHcN1vaFXPUVzevdt
	gcX1YQXe+W8+4I5hAwuZd+k17CluerOt3p6PkXFPN0qZosLNZyyx6VojPLY9IlhssLWY
	4fBw==
X-Received: by 10.194.174.194 with SMTP id bu2mr97507930wjc.76.1438266596193; 
	Thu, 30 Jul 2015 07:29:56 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id qq1sm2187321wjc.0.2015.07.30.07.29.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jul 2015 07:29:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 30 Jul 2015 16:30:11 +0200
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20150730143011.GD2457@jama>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<146f8d7f2da816123d4bfd8f4253938f51727d9d.1438262915.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <146f8d7f2da816123d4bfd8f4253938f51727d9d.1438262915.git.alexander.kanavin@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 03/26] distcc: update SRC_URI to not use Google Code
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
X-List-Received-Date: Thu, 30 Jul 2015 14:29:57 -0000
X-Groupsio-MsgNum: 68733
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sXc4Kmr5FA7axrvy"
Content-Disposition: inline

--sXc4Kmr5FA7axrvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2015 at 04:31:32PM +0300, Alexander Kanavin wrote:
> Google Code is shutting down soon and distcc has moved to github.
>=20
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-devtools/distcc/distcc_3.1.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/distcc/distcc_3.1.bb b/meta/recipes-de=
vtools/distcc/distcc_3.1.bb
> index e4b9313..b598c77 100644
> --- a/meta/recipes-devtools/distcc/distcc_3.1.bb
> +++ b/meta/recipes-devtools/distcc/distcc_3.1.bb
> @@ -17,13 +17,14 @@ PACKAGECONFIG[popt] =3D "--without-included-popt,--wi=
th-included-popt,popt"
> =20
>  RRECOMMENDS_${PN} =3D "avahi-daemon"
> =20
> -SRC_URI =3D "http://distcc.googlecode.com/files/${BPN}-${PV}.tar.bz2 \
> +SRC_URI =3D "git://github.com/distcc/distcc.git \
>             file://separatebuilddir.patch \
>             file://0001-zeroconf-Include-fcntl.h.patch \
>             file://default \
>             file://distccmon-gnome.desktop \
>             file://distcc \
>             file://distcc.service"
> +SRCREV =3D "9a172d3d20042754a30c0cd9a5d63fd1a8120c31"
> =20
>  SRC_URI[md5sum] =3D "a1a9d3853df7133669fffec2a9aab9f3"
>  SRC_URI[sha256sum] =3D "f55dbafd76bed3ce57e1bbcdab1329227808890d90f4c724=
fcd2d53f934ddd89"

drop

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

--sXc4Kmr5FA7axrvy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW6NPIACgkQN1Ujt2V2gBzJhgCggGEVFi7oTwsP9lvDc9Q+aw4G
fJEAoKLyOt8HR+iEXu1mrEChFTz/sBxQ
=X7Gq
-----END PGP SIGNATURE-----

--sXc4Kmr5FA7axrvy--
