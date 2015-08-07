Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 396D676769
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 07:21:51 +0000 (UTC)
Received: by pdrh1 with SMTP id h1so24147194pdr.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Aug 2015 00:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=dGKccscXS8xWqdnziBPiAwgepuaVRvmQx7S8u3PNTwY=;
	b=J8Cj9zSIoJQEMcn4ViwIGvFlXY5bxUYsuxjjoys0oRngObE95rZZEMXWMKOU3FAkKA
	2oPMw+bon2O2V1DeJJvphEAPkLPUAOZZ2KjVxDB9o56gEJX2hRG5Tl4qWleTs/HneMCz
	bjZCXuvGmSqFF0ZCE0+t0Nu54hVayV48W0l/iWBL+goIVrseY9r743ZD19r5sByqxquZ
	T8YvO+opFMRdTq7yUyKj4G7g99N8zyCazpXOIPsKi9lxFnSBZZ8VeA7WPK3tSMDpVIQt
	2KZ9dvPXeUeS4h5ozIYFpOUf1EDSZjeDhQjEgQ65RdbRwWbIzZEg2Dc9It963FKctNx7
	+3hA==
X-Received: by 10.70.91.38 with SMTP id cb6mr11883240pdb.104.1438932111456;
	Fri, 07 Aug 2015 00:21:51 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:4ec:fbce:7a8:43c9?
	([2601:646:8601:4580:4ec:fbce:7a8:43c9])
	by smtp.gmail.com with ESMTPSA id sp1sm8960155pab.4.2015.08.07.00.21.50
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 07 Aug 2015 00:21:50 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <e5437695391e1dd4fe0ecad10dec483cb0e3a8bc.1438262915.git.alexander.kanavin@linux.intel.com>
Date: Fri, 7 Aug 2015 00:21:49 -0700
Message-Id: <120CC689-4105-4DE2-8602-96A9BF548DEE@gmail.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<e5437695391e1dd4fe0ecad10dec483cb0e3a8bc.1438262915.git.alexander.kanavin@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 09/26] lsb: set PV to 1.4 to match upstream tarball version
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
X-List-Received-Date: Fri, 07 Aug 2015 07:21:53 -0000
X-Groupsio-MsgNum: 69104
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C474B32F-DC83-4C59-BBEE-6D111BC77465";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C474B32F-DC83-4C59-BBEE-6D111BC77465
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jul 30, 2015, at 6:31 AM, Alexander Kanavin =
<alexander.kanavin@linux.intel.com> wrote:
>=20
> This allows upstream version check to work
>=20
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
> meta/recipes-extended/lsb/lsb_4.1.bb | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb =
b/meta/recipes-extended/lsb/lsb_4.1.bb
> index 6215b62..171a6c8 100644
> --- a/meta/recipes-extended/lsb/lsb_4.1.bb
> +++ b/meta/recipes-extended/lsb/lsb_4.1.bb
> @@ -21,6 +21,7 @@ SRC_URI =3D =
"${SOURCEFORGE_MIRROR}/project/lsb/lsb_release/1.4/lsb-release-1.4.tar
>            file://lsb_pidofproc \
>            file://lsb_start_daemon \
>            "
> +PV =3D =E2=80=9C1.4=E2=80=9D
>=20

it will send version backwards, why is this needed ?


> SRC_URI[md5sum] =3D "30537ef5a01e0ca94b7b8eb6a36bb1e4"
> SRC_URI[sha256sum] =3D =
"99321288f8d62e7a1d485b7c6bdccf06766fb8ca603c6195806e4457fdf17172"
> --
> 2.1.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_C474B32F-DC83-4C59-BBEE-6D111BC77465
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXEXI0ACgkQuwUzVZGdMxSKxgCggPJSb8g7j3Nzh4P2YU7KhEAW
omoAni2D+YUlpkGV95JWbij9spXkejy/
=oDqu
-----END PGP SIGNATURE-----

--Apple-Mail=_C474B32F-DC83-4C59-BBEE-6D111BC77465--
