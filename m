Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF02C8302B
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 14:57:40 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.42959.1751295454334115349
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 07:57:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nMamB3b1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05E531FD33;
	Mon, 30 Jun 2025 14:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751295452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gFFIw5y9xtD+XOaqYm8CudY9pZ76K5glUshAxDPVnco=;
	b=nMamB3b1902V4GQC8PgGqvmiLTffZP2Ajb3q4kgrRJ05y+gzGd9wDKy1CX3hPjwrGl/0y6
	y5wlWVrxWczc0uhWl7+gQKCznVzBDENSwjoVXjVE7WYslmowmXvhHrpSwZwW8USTygJP9S
	TD5updxUwRedlYQ74gzivLbT7iklcp8w+dHYjpZRKoi7UMFI4Rh6m379652rGGF4NW9BfT
	H3+9oHLLUYNt0dtlBBHEflwirKHZbDhjGGUaNShA+V6OtjsQOWahsdlzYnpkzw4sszWD58
	I8VHn0moysL1idjKW2m92pbjGtht9rTgMb0ujH/YLuBN5Gs364VNqEbvKmeZLQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Jun 2025 16:57:31 +0200
Message-Id: <DAZYFBTDZ6SU.9Z5XXGYAZXRN@bootlin.com>
Cc: <alex.kanavin@gmail.com>, <quentin.schulz@cherry.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <Moritz.Haase@bmw.de>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 0/3] cmake: Major version bump to 4.0.3
References: <20250630104104.4093207-1-Moritz.Haase@bmw.de>
In-Reply-To: <20250630104104.4093207-1-Moritz.Haase@bmw.de>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkvefhvffufhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdejhfejvddtheeuleduuedtveejheekleeuffevveevfedtjeeiiefhueffveevnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpvddurdgssgdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfegtkedumegvsggrjeemudgskegsmegrhegtledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepofhorhhithiirdfjrggrshgvsegsmhifrdguvgdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhst
 hhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopegrlhgvgidrkhgrnhgrvhhinhesghhmrghilhdrtghomhdprhgtphhtthhopehquhgvnhhtihhnrdhstghhuhhliiestghhvghrrhihrdguvg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 14:57:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219526

On Mon Jun 30, 2025 at 12:41 PM CEST, Moritz Haase via lists.openembedded.o=
rg wrote:
> This patch series bumps CMake to 4.0.3, the most current of the 4.x relea=
ses.
> That bump allows us to drop all of the upstreamable patches for CMake its=
elf
> that we currently carry, which was the motivation for the update as sugge=
sted by
> Alex Kanavin in [0].
>
> Following the preparatory merge of [1] and [2], there are only two compon=
ents
> that require patches to build with the new CMake version. For both create=
repo-c
> and libcomps, those patches have already been merged upstream, but there =
have
> been no subsequent releases yet. Thus, backports of the patches are inclu=
ded. They are to be merged
>
> changes in v2:
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
>
> Moritz Haase (3):
>   libcomps: Backport patch to support builds with CMake 4+
>   createrepo-c: Backport patches to support builds with CMake 4+
>   cmake: upgrade 3.31.6 -> 4.0.3
>
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
>  15 files changed, 499 insertions(+), 309 deletions(-)
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

Hi,

Some builds are failing on the Autobuilder after applying this patchset.

Some recipes fail to configure with this updated version of CMake. For exam=
ple:

| DEBUG: Executing shell function do_configure
| -- The C compiler identification is GNU 15.1.0
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Check for working C compiler: /srv/pokybuild/yocto-worker/musl-qemux86=
/build/build/tmp/work/core2-32-poky-linux-musl/musl-locales/1.0+git/recipe-=
sysroot-native/usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc - skip=
ped
| -- Detecting C compile features
| -- Detecting C compile features - done
| CMake Error at CMakeLists.txt:2 (cmake_minimum_required):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|=20
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syn=
tax
|   to tell CMake that the project requires at least <min> but has been upd=
ated
|   to work with policies introduced by <max> or earlier.
|=20
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 to try configuring anyway.
|=20
|=20
| -- Configuring incomplete, errors occurred!

| ERROR: Task (/srv/pokybuild/yocto-worker/musl-qemux86/build/meta/recipes-=
core/musl/musl-locales_git.bb:do_configure) failed with exit code '1'

An overview of the errors can be found here:
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2837629/raw_inlin=
e

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


