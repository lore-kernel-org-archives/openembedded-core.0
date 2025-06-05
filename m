Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 132F3C5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 06:52:48 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.1330.1749106360056498958
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 23:52:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WmUzYLyG;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66D814392B;
	Thu,  5 Jun 2025 06:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749106358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=umJTnpFsH8ETX8xFUKt5QEn8tnsqG74iX2U3GgReQ2c=;
	b=WmUzYLyGG3I4nnokKVwOpaKp8hbrky31BWA9hE36dW4cgzSMzX6AVyC6K3qbe22kDAyfrr
	KF2DlkRxXOgfGO2r+0lINCkjFQphJYWVbclawNs+r7naK8fkH2JfsELDQdF9ZqamwvnBhq
	eCKrJpb+U1h3Zw8MGqbhMZkIfrN1NX4/7IEHFafDSEC5Z0L2lDEUylMgUNtn0USeMLtUh/
	5mtBsnWDa8h98MzDyMW/VIjEvuYJ55aUQ4RlFLvNehVlGHIvtVJZeBW+u3vS/QQdjgxUaS
	9UGi+cRgyvIVqLf+WQMqFP8CcElINwC0oGuluZB9hx9DRlkovHIgzvfNTR5E4Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Jun 2025 08:52:35 +0200
Message-Id: <DAEEGF2HWXRM.3SE5SAYKVFP61@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>,
 "Joshua Watt" <jpewhacker@gmail.com>
Subject: Re: [OE-core] [PATCH 22/45] libarchive: upgrade 3.7.9 -> 3.8.0
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250604084524.864-1-wangmy@fujitsu.com>
 <20250604084524.864-22-wangmy@fujitsu.com>
In-Reply-To: <20250604084524.864-22-wangmy@fujitsu.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdefvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvhfegfeetvddvgffhhffhlefhveffkefhgeffheffvefhjeeggfefteefkeevvdenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhlihgsrghrtghhihhvvgdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvuddvrddutdehrdduhedtrddvhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdduvddruddthedrudehtddrvdehvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopeifrghnghhmhiesfhhujhhithhsuhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrg
 hdprhgtphhtthhopehjphgvfihhrggtkhgvrhesghhmrghilhdrtghomh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 06:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217988

On Wed Jun 4, 2025 at 10:45 AM CEST, wangmy via lists.openembedded.org wrot=
e:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> License-Update:
>    file in public domain changed from
>    libarchive/archive_getdate.c to libarchive/archive_parse_date.c
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../libarchive/{libarchive_3.7.9.bb =3D> libarchive_3.8.0.bb}   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-extended/libarchive/{libarchive_3.7.9.bb =3D> libarc=
hive_3.8.0.bb} (93%)
>
> diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/=
recipes-extended/libarchive/libarchive_3.8.0.bb
> similarity index 93%
> rename from meta/recipes-extended/libarchive/libarchive_3.7.9.bb
> rename to meta/recipes-extended/libarchive/libarchive_3.8.0.bb
> index d70cdb3d83..0722f26f9f 100644
> --- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
> +++ b/meta/recipes-extended/libarchive/libarchive_3.8.0.bb
> @@ -3,7 +3,7 @@ DESCRIPTION =3D "C library and command-line tools for rea=
ding and writing tar, cpi
>  HOMEPAGE =3D "http://www.libarchive.org/"
>  SECTION =3D "devel"
>  LICENSE =3D "BSD-2-Clause"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd499814247adaee08d88080841cb5=
665"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7ce08437ff7f5e24d72e666313ae4=
084"
> =20
>  DEPENDS =3D "e2fsprogs-native"
> =20
> @@ -31,7 +31,7 @@ EXTRA_OECONF +=3D "--enable-largefile --without-iconv"
> =20
>  SRC_URI =3D "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
> =20
> -SRC_URI[sha256sum] =3D "aa90732c5a6bdda52fda2ad468ac98d75be981c15dde263d=
7b5cf6af66fd009f"
> +SRC_URI[sha256sum] =3D "191b5b24811499d5c2e5efa3248975fa6daa5e6a227700cc=
7b8e54d6d7c06eef"
> =20
>  inherit autotools update-alternatives pkgconfig
> =20

Hi Joshua,

Adding you to the discussion. I believe this patch will require a fix on
meta-mingw side, as the build appears broken on the autobuilder.

ERROR: nativesdk-libarchive-3.8.0-r0 do_compile: oe_runmake failed
ERROR: nativesdk-libarchive-3.8.0-r0 do_compile: Execution of '/srv/pokybui=
ld/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-=
mingw32/nativesdk-libarchive/3.8.0/temp/run.do_compile.581979' failed with =
exit code 1
...
| ../libarchive-3.8.0/libarchive/archive_version_details.c: In function 'ar=
chive_wincrypt_version':
| ../libarchive-3.8.0/libarchive/archive_version_details.c:443:50: error: p=
assing argument 3 of 'CryptGetProvParam' from incompatible pointer type [-W=
incompatible-pointer-types]
|   443 |         if (!CryptGetProvParam(prov, PP_VERSION, &version, &lengt=
h, 0)) {
|       |                                                  ^~~~~~~~
|       |                                                  |
|       |                                                  DWORD * {aka lon=
g unsigned int *}
| In file included from ../libarchive-3.8.0/libarchive/archive_digest_priva=
te.h:179,
|                  from ../libarchive-3.8.0/libarchive/archive_version_deta=
ils.c:86:
| /srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesd=
k-mingw32-w64-mingw32/nativesdk-libarchive/3.8.0/recipe-sysroot/usr/local/o=
e-sdk-hardcoded-buildpath/sysroots/i686-w64-mingw32/usr/include/wincrypt.h:=
826:84: note: expected 'BYTE *' {aka 'unsigned char *'} but argument is of =
type 'DWORD *' {aka 'long unsigned int *'}
|   826 |   WINIMPM WINBOOL WINAPI CryptGetProvParam (HCRYPTPROV hProv, DWO=
RD dwParam, BYTE *pbData, DWORD *pdwDataLen, DWORD dwFlags);
|       |

https://autobuilder.yoctoproject.org/valkyrie/#/builders/7/builds/1815

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


