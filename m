Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 869DA6098F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 07:02:19 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id kp12so2530963pab.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 00:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=K8BkRWdeIW476hmZpkCZzpwzWgoTGy3kaNRQc8d6+fw=;
	b=FFJVK0dJHYtQLZ+ZxEtZIYxkq49zFOcpaH1kodSBvNY4r2KpwngW3/m1pkq7ltxyP7
	8fvxynwFEuMsVoEOkvcEt2VyjB4lN7gdNZQw9zRY3F8EpzM2mz80B42F7ZL+TxDdY0Fj
	4eFZQejqEwaD55IdJDYV0+mqDqfU7aCya5/J4o5f3phoLc2sQBC6a4eaaYwrIcjNvEF8
	34Uucyu5Dl6Ja1lw6ER1CYKj2LbV1W0etciw5CZoC4MxnVPKoOLrbqol9U17y38TrKb8
	Vtwzlx0l32y5FLZYd6tCITrRhib7ePTGEppK569SnH7SnGDuKRHPNSzNcKp+gOesJOlc
	Dcvw==
X-Received: by 10.66.165.97 with SMTP id yx1mr11485793pab.82.1371452540545;
	Mon, 17 Jun 2013 00:02:20 -0700 (PDT)
Received: from laurenf-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	qp4sm12672892pbc.41.2013.06.17.00.02.18 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Jun 2013 00:02:19 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1371450622-3850-1-git-send-email-jackie.huang@windriver.com>
Date: Mon, 17 Jun 2013 00:02:17 -0700
Message-Id: <C5D1E420-8F11-410E-B763-C631248F2113@gmail.com>
References: <1371450622-3850-1-git-send-email-jackie.huang@windriver.com>
To: jackie.huang@windriver.com
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libproxy_0.4.7 do_unpack failed of qemuppc_world
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
X-List-Received-Date: Mon, 17 Jun 2013 07:02:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jun 16, 2013, at 11:30 PM, jackie.huang@windriver.com wrote:

> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> The tarball from upstream shows many lines of....
>=20
>   tar: Ignoring unknown extended header keyword
>      `LIBARCHIVE.xattr.security.selinux'
>   tar: Ignoring unknown extended header keyword `SCHILY.dev'
>   tar: Ignoring unknown extended header keyword `SCHILY.ino'
>   tar: Ignoring unknown extended header keyword `SCHILY.nlink'
>=20
> Replacing it with the .zip file from upstream

maybe now it would better to add zip-native to DEPENDS ?

>=20
> Signed-off-by: Amy Fong <amy.fong@windriver.com>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
> meta/recipes-support/libproxy/libproxy_0.4.7.bb |    8 ++++----
> 1 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-support/libproxy/libproxy_0.4.7.bb =
b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
> index 89f22b8..30abc27 100644
> --- a/meta/recipes-support/libproxy/libproxy_0.4.7.bb
> +++ b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
> @@ -8,16 +8,16 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D7d7044444a7b1b116e8783edcdb44ff4 \
>=20
> DEPENDS =3D "gconf glib-2.0"
>=20
> -PR =3D "r5"
> +PR =3D "r6"
>=20
> -SRC_URI =3D =
"http://libproxy.googlecode.com/files/libproxy-${PV}.tar.gz \
> +SRC_URI =3D "http://libproxy.googlecode.com/files/libproxy-${PV}.zip =
\
>            file://g++-namepace.patch \
>            file://libproxy_fix_for_gcc4.7.patch \
>            file://libproxy-0.4.7-CVE-2012-4504.patch \
>           "
>=20
> -SRC_URI[md5sum] =3D "509e03a488a61cd62bfbaf3ab6a2a7a5"
> -SRC_URI[sha256sum] =3D =
"8fe0a58810139ba3c2e186deccf3e68adcd127aa0e972b0862b30b3dde493797"
> +SRC_URI[md5sum] =3D "62585570de17d10f03a5a63b701ffd52"
> +SRC_URI[sha256sum] =3D =
"429a19c57d9990349d622beecc805b23051caa62a478066bff5d9a312a8937be"
>=20
> inherit cmake pkgconfig
>=20
> --
> 1.7.4.1
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


