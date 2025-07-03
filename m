Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96780C83030
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 07:57:24 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web11.17101.1751529439382614229
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jul 2025 00:57:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lbTpyyE5;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06E5C442A1;
	Thu,  3 Jul 2025 07:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751529436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N1t5wU6iAymuA+z95ZLoIYOfreMcrxuCsz1bTqPOFcQ=;
	b=lbTpyyE5gkxxzplnlllXThme4TwSV52ji+E11+MdG71/LwLjetlltWKlDM++Xh1ZilRQnW
	IC/JG3RlOdXvFSthzrxghA8E7Gkw+/fIB6lleKT62llReLWbJ7bIeI8l4ML22HRHYbTrvJ
	u6jlPIARsqZWmPLjwGLHNr5kdNz/LvHGiKlf6aQhJnyK5Xgmk+Zv8NOiB86Zfujmaxgh/8
	3FHZcaKBuy2zw6W4/MkKlbSwxQXR8oVU77VoUuMOovS++lrOK2fKiVv9kmkptsldGcqJRe
	U0wKLMney5y9oxxxI5G3RKbgU3+i3TZn83O/Efbg0uIDXZtVgb4Gayur5UnPcg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Jul 2025 09:57:15 +0200
Message-Id: <DB29D6KE7N6X.EA0WFHWLYJIQ@bootlin.com>
Subject: Re: [PATCH v4 0/7] cmake: Major version bump to 4.0.3
Cc: <alex.kanavin@gmail.com>, <quentin.schulz@cherry.de>,
 <Peter.Marko@siemens.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Moritz Haase" <Moritz.Haase@bmw.de>,
 <openembedded-core@lists.openembedded.org>
References: <20250702123005.1233743-1-Moritz.Haase@bmw.de>
In-Reply-To: <20250702123005.1233743-1-Moritz.Haase@bmw.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduleejgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvfhfjgesthhqredttddtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtfedtiedvveffhfefveejhfffteegvdevvddtieegieejjeehuedtkeeivdeutdenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopefoohhrihhtiidrjfgrrghsvgessghmfidruggvpdhrtghpthhtohepohhpvghnvghmsggvu
 gguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtoheprghlvgigrdhkrghnrghvihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepqhhuvghnthhinhdrshgthhhulhiisegthhgvrhhrhidruggvpdhrtghpthhtoheprfgvthgvrhdrofgrrhhkohesshhivghmvghnshdrtghomh
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 07:57:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219862

On Wed Jul 2, 2025 at 2:29 PM CEST, Moritz Haase wrote:
> This patch series bumps CMake to 4.0.3, the most current of the 4.x relea=
ses.
> That bump allows us to drop all of the upstreamable patches for CMake its=
elf
> that we currently carry, which was the motivation for the update as sugge=
sted by
> Alex Kanavin in [0].
>
> A number of components require (minor) patches to build with the new CMak=
e
> version. In most cases, those are backports of commits that haven't made =
it into
> an upstream release yet.
>
> The bump depends on this patches, but not vice-versa (since we are alread=
y on
> CMake 3.31). Thus, if desired, it would be possible to pull the 'Allow bu=
ilds
> with CMake 4+' patches in in advance of the actual bump.
>
> Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
>
> changes in v4:
> - Fixed broken patch formatting, sorry for that.
>
> changes in v3:
>
> - Updated patch series description.
> - Added four additional commits with patches for build failures seen on
>   Autobuilder. Those should be all be fixed now, apart from the one in
>   meta-virt (yajl-2.1.0), which I don't have set up locally.
> - Fix for test failure seen in SDK tests.
>
> changes in v2:
>
> - Re-ordered / squashed commits to keep bisectability (see [3], [4])
> - Fixed patchtest findings
>
> [0]: https://lists.openembedded.org/g/openembedded-core/message/219113
> [1]: https://git.openembedded.org/openembedded-core/commit/?id=3Dc3efca74=
95889f3682225af8c9e01ceb094b1bb7
> [2]: https://git.openembedded.org/openembedded-core/commit/?id=3Dcb5234ac=
dab200bd43b89416d8d7e9df91af58cc
> [3]: https://lists.openembedded.org/g/openembedded-core/message/219403
> [4]: https://lists.openembedded.org/g/openembedded-core/message/219425
>
> CC: alex.kanavin@gmail.com
> CC: quentin.schulz@cherry.de
> CC: antonin.godard@bootlin.com
> CC: Peter.Marko@siemens.com
>
> Moritz Haase (7):
>   libcomps: Backport patch to support builds with CMake 4+
>   createrepo-c: Backport patches to support builds with CMake 4+
>   apt: Backport patch to support builds with CMake 4+
>   libubootenv: Backport patch to support builds with CMake 4+
>   musl-locales: Add patch to support builds with CMake 4+
>   libwpe: Add patch to support builds with CMake 4+
>   cmake: upgrade 3.31.6 -> 4.0.3
>
>  .../sdkext/files/myapp_cmake/CMakeLists.txt   |   2 +-
>  ...Update-cmake_minimum_required-to-3.5.patch |  50 ++++
>  meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb  |   4 +-
>  ...red-CMake-version-to-3.5-to-allow-bu.patch |  41 ++++
>  meta/recipes-core/musl/musl-locales_git.bb    |   4 +-
>  ...mum_required-to-3.13-to-avoid-warnin.patch |  47 ++++
>  meta/recipes-devtools/apt/apt_2.6.1.bb        |   1 +
>  ...native_3.31.6.bb =3D> cmake-native_4.0.3.bb} |   6 +-
>  meta/recipes-devtools/cmake/cmake.inc         |   8 +-
>  ...mpilerABI-Strip-pipe-from-compile-fl.patch |  63 -----
>  ...xt2fs-ext2_fs.h-by-cmake-s-internal.patch} |   4 +-
>  ...ng-undocumented-type-for-CURLOPT_NET.patch |  30 ---
>  ...trary-characters-in-test-names-of-CT.patch | 202 ----------------
>  ...-CMakeLists.txt-disable-USE_NGHTTP2.patch} |   6 +-
>  .../cmake/{cmake_3.31.6.bb =3D> cmake_4.0.3.bb} |   1 -
>  .../0001-Fix-libname-of-Libs.private.patch    |  22 ++
>  ...ED_TARGET-for-3rd-party-dependencies.patch | 226 ++++++++++++++++++
>  ...-imported-targets-of-turned-off-depe.patch |  53 ++++
>  ...ds-without-Doxygen-being-present-wit.patch |  50 ++++
>  .../createrepo-c/createrepo-c_1.2.1.bb        |   4 +
>  ...libcomps-Support-builds-with-CMake-4.patch | 132 ++++++++++
>  .../libcomps/libcomps_0.1.21.bb               |   1 +
>  ...red-CMake-version-to-3.5-to-allow-bu.patch |  38 +++
>  meta/recipes-sato/webkit/libwpe_1.16.2.bb     |   6 +-
>  24 files changed, 687 insertions(+), 314 deletions(-)
>  create mode 100644 meta/recipes-bsp/u-boot/libubootenv/0001-Update-cmake=
_minimum_required-to-3.5.patch
>  create mode 100644 meta/recipes-core/musl/musl-locales/0001-cmake-Bump-r=
equired-CMake-version-to-3.5-to-allow-bu.patch
>  create mode 100644 meta/recipes-devtools/apt/apt/0001-Raise-cmake_minimu=
m_required-to-3.13-to-avoid-warnin.patch
>  rename meta/recipes-devtools/cmake/{cmake-native_3.31.6.bb =3D> cmake-na=
tive_4.0.3.bb} (90%)
>  delete mode 100644 meta/recipes-devtools/cmake/cmake/0001-CMakeDetermine=
CompilerABI-Strip-pipe-from-compile-fl.patch
>  rename meta/recipes-devtools/cmake/cmake/{0005-Disable-use-of-ext2fs-ext=
2_fs.h-by-cmake-s-internal-.patch =3D> 0001-Disable-use-of-ext2fs-ext2_fs.h=
-by-cmake-s-internal.patch} (90%)
>  delete mode 100644 meta/recipes-devtools/cmake/cmake/0001-cmCurl-Avoid-u=
sing-undocumented-type-for-CURLOPT_NET.patch
>  delete mode 100644 meta/recipes-devtools/cmake/cmake/0001-ctest-Allow-ar=
bitrary-characters-in-test-names-of-CT.patch
>  rename meta/recipes-devtools/cmake/cmake/{0001-CMakeLists.txt-disable-US=
E_NGHTTP2.patch =3D> 0002-CMakeLists.txt-disable-USE_NGHTTP2.patch} (83%)
>  rename meta/recipes-devtools/cmake/{cmake_3.31.6.bb =3D> cmake_4.0.3.bb}=
 (96%)
>  create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0001-=
Fix-libname-of-Libs.private.patch
>  create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0002-=
Use-IMPORTED_TARGET-for-3rd-party-dependencies.patch
>  create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0003-=
Don-t-try-to-use-imported-targets-of-turned-off-depe.patch
>  create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0004-=
cmake-Allow-builds-without-Doxygen-being-present-wit.patch
>  create mode 100644 meta/recipes-devtools/libcomps/libcomps/0001-libcomps=
-Support-builds-with-CMake-4.patch
>  create mode 100644 meta/recipes-sato/webkit/libwpe/0001-cmake-Bump-requi=
red-CMake-version-to-3.5-to-allow-bu.patch

Hi Moritz,

I think we are having another error related to Cmake upgrade:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2045
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2866113/raw_inlin=
e

It looks like libfdti also requires tweaking.

I didn't spot any other issue related to Cmake, so hopefully the last one!

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


