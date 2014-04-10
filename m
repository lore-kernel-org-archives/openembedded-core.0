Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id D4CFA65E66
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 09:07:14 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e53so2757428eek.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 02:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=eKhBPYWXg/Tvs1Qz4Jc/lemQfmptKd6b76/3PQnlcms=;
	b=qLx2nhfoMqIlplzUWRaKIZdgJ57LqvcGttCG+GkG5q2luMemAEDOa9r8aSbHKAh0Pw
	4l/7evIrhOBt6QdbfAaY/3A917uE5t1g9/SHIkLDskwRw0jDIXiZZ2dW+o7SQKk6XNdj
	XZUjNRqPBMfKyjieuwMg/k9jX7ABSrw5wkxSw5Z/rWhxObPFsgwSLCbOzb4DDV0PQ8S+
	obJ3UE50UoosENZOP/O7fmVFWzJcjIpPAUILG3oVjFtMmFW9BXGxotoZCqjKbKpctFwj
	AICU7eMXuazoZeqDf+mompouZRh6kHHsIL7fEP+dQPLjYoJNCyOjNLJZjjXCaIN3ZYVz
	28qw==
X-Received: by 10.15.44.3 with SMTP id y3mr2018853eev.58.1397120835188;
	Thu, 10 Apr 2014 02:07:15 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id y7sm8449922eev.5.2014.04.10.02.07.13
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Apr 2014 02:07:14 -0700 (PDT)
Date: Thu, 10 Apr 2014 11:07:22 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: =?iso-8859-1?Q?S=F8ren?= Holm <sgh@sgh.dk>
Message-ID: <20140410090722.GQ2132@jama>
References: <1396946890-16295-1-git-send-email-sgh@sgh.dk>
MIME-Version: 1.0
In-Reply-To: <1396946890-16295-1-git-send-email-sgh@sgh.dk>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wvstreams: Set optimization to -O0 to avoid breaking stack protection.
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
X-List-Received-Date: Thu, 10 Apr 2014 09:07:18 -0000
X-Groupsio-MsgNum: 52335
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="foM9DbudB2CcldhH"
Content-Disposition: inline

--foM9DbudB2CcldhH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 08, 2014 at 10:48:10AM +0200, S=F8ren Holm wrote:
> A description of the bug is here :
> See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D674006

Wrong ML, this belongs to openembedded-devel@lists.openembedded.org
> ---
>  meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/met=
a-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> index ce2b337..869402b 100644
> --- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> +++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> @@ -19,6 +19,8 @@ SRC_URI[sha256sum] =3D "8403f5fbf83aa9ac0c6ce15d97fd856=
07488152aa84e007b7d0621b8eb
>  inherit autotools pkgconfig
> =20
>  PARALLEL_MAKE =3D ""
> +TARGET_CFLAGS_append =3D " -O0"
> +TARGET_CXXFLAGS_append =3D " -O0"
> =20
>  LDFLAGS_append =3D " -Wl,-rpath-link,${CROSS_DIR}/${TARGET_SYS}/lib"
> =20
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--foM9DbudB2CcldhH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNGX0oACgkQN1Ujt2V2gBzerwCfadmBHYdb7nyRRC0Eo7/0f9/b
GTcAniTCguPpjSB9JTdqG7M/DnYmoicD
=KcXv
-----END PGP SIGNATURE-----

--foM9DbudB2CcldhH--
