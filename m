Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0B165619DD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 12:41:55 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id q10so3724828eaj.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2013 05:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=U+DFCmhT7hty1BsnFcf35Va6n+fWsE2zgTndQCnAI4w=;
	b=tdFx9wCnbfjLVIOZOM7mhMCP+oEW2sbnYxIFY29ulaY2EBA3Bz9b6gLqikNpGFnMBQ
	lpWfxYMEZ42OKiXa/EfvaNac5fd8xwx2lFlRhzFL7VBxZ5NdrTBmaIDBw/FQe1OPfbjB
	5AHbFhBPq7uHo6djxse4tgYCSUhOUyv2hnWihF1XDP69tlkySmT31Pc/YKPFLIdzqofK
	KGaZmhBT/Q+wd4GDw8T5kb9SHuNrcvEIXuESpyCWNVHZrL1KOXhwfNVPz8wROqmZan/u
	i/yiPAnOTi+GgRksbXr8Gm0YJqCkaCNhxmI3MhAbbn9L7rwzsnBqjvlQ24sBP1uqO1sX
	hbZg==
X-Received: by 10.15.51.202 with SMTP id n50mr30126009eew.39.1373373716064;
	Tue, 09 Jul 2013 05:41:56 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n45sm50856216eew.1.2013.07.09.05.41.55 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 09 Jul 2013 05:41:55 -0700 (PDT)
Date: Tue, 9 Jul 2013 14:42:05 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20130709124205.GU3288@jama>
References: <cover.1373372649.git.hongxu.jia@windriver.com>
	<626ac2f7b8f351240a6eae4a75a632914eb28207.1373372649.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <626ac2f7b8f351240a6eae4a75a632914eb28207.1373372649.git.hongxu.jia@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] nspr-native: add version 4.10
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
X-List-Received-Date: Tue, 09 Jul 2013 12:41:56 -0000
X-Groupsio-MsgNum: 41667
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UC+RhZhEc8lcmajv"
Content-Disposition: inline

--UC+RhZhEc8lcmajv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 09, 2013 at 08:30:36PM +0800, Hongxu Jia wrote:
> It is required by nss-native.

Shouldn't the subject say something like
nspr: add native version
or is there some other version of nspr-native?

>=20
> [YOCTO #4096]
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-support/nspr/nspr_4.10.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-support/nspr/nspr_4.10.bb b/meta/recipes-suppor=
t/nspr/nspr_4.10.bb
> index 3936d67..fcecb95 100644
> --- a/meta/recipes-support/nspr/nspr_4.10.bb
> +++ b/meta/recipes-support/nspr/nspr_4.10.bb
> @@ -173,3 +173,5 @@ FILES_${PN} =3D "${libdir}/lib*.so"
>  FILES_${PN}-dev =3D "${bindir}/* ${libdir}/nspr/tests/* ${libdir}/pkgcon=
fig \
>                  ${includedir}/* ${datadir}/aclocal/* "
>  FILES_${PN}-dbg +=3D "${libdir}/nspr/tests/.debug/*"
> +
> +BBCLASSEXTEND =3D "native"
> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UC+RhZhEc8lcmajv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHcBR0ACgkQN1Ujt2V2gBzgKwCgnjB2irdSDIiWJTFfyYG8NhCX
+AQAmgP+SBsacP/TO6QnY0mP9nP0sfvw
=JUUr
-----END PGP SIGNATURE-----

--UC+RhZhEc8lcmajv--
