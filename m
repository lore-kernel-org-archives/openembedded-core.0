Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id CFA426AC7B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 22:01:52 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id d1so28236wiv.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 15:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rEhlLMwxPUeQD6G2snjNGLxmSd0eUb1DLnntksrlSDI=;
	b=njpaK6h/q3yy20daVfmncE8vkco4EPc9TFgcu/Den7WmMz9NNSGna4FDlXG7Ij10j7
	02kBJAYXrNeg9WLdA6ha35VcVtZRnOWHPSaM66VoLHrjoG7Y5hnTKK9qh5+HCOu3QA76
	OysJNp3WCriu2F0ldGRIpFSKiam5l3lUHvvyEZO3nYLOPzzjhh1XcMrQy62cjigDYbyB
	Fi76DZG7UDK7ae26lclyBFy1SzZKSYdZCyzjjl7IIqyHJ9xCdd0RBKRvuR094ku3f8Xu
	JAuQ9VC1RWlUNNRrTPB2LFXeHPqLnUV4yYYTGDS25t4r8VCO9KDBiOZcbZ1yabKI1dbA
	nTcg==
X-Received: by 10.194.238.231 with SMTP id vn7mr15635654wjc.99.1406239313291; 
	Thu, 24 Jul 2014 15:01:53 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	lk7sm19383568wjb.24.2014.07.24.15.01.51 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Jul 2014 15:01:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 25 Jul 2014 00:02:10 +0200
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20140724220210.GO2492@jama>
References: <cover.1406234258.git.bruce.ashfield@windriver.com>
	<67ae6f8074e50a768143cac6a40fd8d16e2f5965.1406234258.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
In-Reply-To: <67ae6f8074e50a768143cac6a40fd8d16e2f5965.1406234258.git.bruce.ashfield@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/8] lttng-modules: re-enable ARM builds
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
X-List-Received-Date: Thu, 24 Jul 2014 22:01:55 -0000
X-Groupsio-MsgNum: 55535
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8N5nZmKALFZnI1Hj"
Content-Disposition: inline

--8N5nZmKALFZnI1Hj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2014 at 04:41:52PM -0400, Bruce Ashfield wrote:
> With lttng 2.4.2 and gcc 4.9, we can now enable lttng-modules for ARM.
>=20
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb b/meta/reci=
pes-kernel/lttng/lttng-modules_2.5.0.bb
> index 5a99a5adae8b..d87374163556 100644
> --- a/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
> @@ -12,8 +12,7 @@ inherit module
> =20
>  SRCREV =3D "789fd1d06d07aeb9a403bdce1b3318560cfc6eca"
> =20
> -# lttng currently blacklists arm with gcc-4.8
> -COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|aarch64|mips).*-linux'
> +COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|aarch64|mips|arm).*-linux'

Please squash this to 2/8 otherwise there is no arm version between 2/8
and 6/8.

>  SRC_URI =3D "git://git.lttng.org/lttng-modules.git;branch=3Dstable-2.5 \
>             file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
> --=20
> 1.8.1.2
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8N5nZmKALFZnI1Hj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPRgmIACgkQN1Ujt2V2gBwJSACfeswKOFRnIMn35nhkbq/gnpyq
NhwAoLC1YtNQeiWhktOVkFnAu8ORCs3F
=Y3er
-----END PGP SIGNATURE-----

--8N5nZmKALFZnI1Hj--
