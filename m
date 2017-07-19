Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2EB81782E2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 17:21:47 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id c24so5158437wra.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 10:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JOxy8W68nAb2Rt9C7mddpoff6/qdrBSaAUsa/rIKr7U=;
	b=ZFwUeLtNrlAjFCXYsYbsuCJCPOjYHxztDeTehzPRYcen2mOMbwE3kXAWw0jgpajpJ8
	WczBxrJsbnC8BEZm8tx0pclzbpeelppeEmrepDXap4VNRlRXNt+BtXhvsnbsjiQiC73s
	ns7LGHxHxQK2UcHIwbe7Cbaw7KjDN1x/pP5ukH+h3DPk2qMyoVx0JJlW2XwYxla4UuTw
	D09W1t/+/IehRpAL6z4GRRfQwfvxrpp+RFY3Ms5N0dhhc+9kcuv+lvOsksqUbUfhQJZa
	NG1v7hSi8fRcc14O11nb89q16M4wnp6vvGubUA6ucdAOiZKeM5Z67bkQPCFZL7/tFx0m
	WnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JOxy8W68nAb2Rt9C7mddpoff6/qdrBSaAUsa/rIKr7U=;
	b=k7aK7qB/NozPOmemzYk42ciw4UAryEzLtPiwVvUFu7dnAbQBXC+jKkM+c8ghshBc1f
	XxxStHSoRRM7Tp+g5jnPWCMzkfomou4mvz0eswBZbA/taqj3QDnDeddkuz6CK3MfSa2i
	8w/Tft33A3wb2LkMCUSlnqaCsO9fJiAxob1lO9u6ZX9sBygJykDldU9aCAXC2EzosPT8
	LZWBEFjX+UI2yaJEMXHv4+eeJ6aoZuz6z6HMzvbqt+hJY/kU1SClpsSruftaJ/tyl2ZI
	VyH0+jOY54vbI+/wvAbA1mYv+atkOFuSSgVjVoz9XMfIn25txXNEI8UUPN8bzoWllr10
	YdkA==
X-Gm-Message-State: AIVw110qgFDLUGHb5Idqb1V2qOojfQLcJwiBfr3yvSx9JbbFsPnU4A3j
	IrFx0/jt6ROpxEPJNVc6cMSs1gbLow==
X-Received: by 10.223.179.216 with SMTP id x24mr4577385wrd.7.1500483307067;
	Wed, 19 Jul 2017 09:55:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.175.16 with HTTP; Wed, 19 Jul 2017 09:55:06 -0700 (PDT)
In-Reply-To: <cover.1500470150.git.alexander.kanavin@linux.intel.com>
References: <cover.1500470150.git.alexander.kanavin@linux.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 19 Jul 2017 09:55:06 -0700
Message-ID: <CAJ86T=UaW2W6h47H-yVw=8q1rk23ZTj1an220VKrGitOx5Y1dA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] Add openssl 1.1
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
X-List-Received-Date: Wed, 19 Jul 2017 17:21:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 19, 2017 at 6:19 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> This patch series introduces the recipe for openssl 1.1 (openssl 1.0 is preserved
> but renamed to openssl10), and does a few necessary adjustmenets and updates to other
> recipes.
>
> Openssl 1.1 is an opt-out; it has the same recipe name as openssl 1.0 had, and so
> all dependencies are compiled with it by default. If there's an API issue, please
> fix it, or adjust the recipe to depend on 'openssl10' (which is a lesser solution,
> and subject to openssl 1.0 eventually being removed from oe-core).

Are there any -native recipes which still need 1.0? Or could support
for openssl10-native be dropped as part of this patch set?

> The following changes since commit 50af58cedb3153f058d23a0a9584cf69bdcce81b:
>
>   systemd: refuse to load units with errors (CVE-2017-1000082) (2017-07-19 11:30:16 +0100)
>
> are available in the git repository at:
>
>   git://git.yoctoproject.org/poky-contrib akanavin/openssl-1.1
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/openssl-1.1
>
> Alexander Kanavin (4):
>   openssl: add a 1.1 version
>   openssh: depend on openssl 1.0
>   cryptodev-tests: depend on openssl 1.0
>   gstreamer-plugins-bad: replace openssl dependency with nettle for hls
>     plugin
>
> Otavio Salvador (1):
>   u-boot: Upgrade to 2017.07 release
>
>  meta/conf/distro/include/no-static-libs.inc        |   3 +
>  ...ommon_2017.05.inc => u-boot-common_2017.07.inc} |   2 +-
>  ...utils_2017.05.bb => u-boot-fw-utils_2017.07.bb} |   0
>  ...kimage_2017.05.bb => u-boot-mkimage_2017.07.bb} |   0
>  .../{u-boot_2017.05.bb => u-boot_2017.07.bb}       |   0
>  meta/recipes-connectivity/openssh/openssh_7.5p1.bb |   3 +-
>  ...ve-test-that-requires-running-as-non-root.patch |  49 +++++++
>  ...1-Take-linking-flags-from-LDFLAGS-env-var.patch |  43 ++++++
>  .../recipes-connectivity/openssl/openssl/run-ptest |   4 +-
>  .../openssl/{openssl.inc => openssl10.inc}         |  14 +-
>  ...build-with-clang-using-external-assembler.patch |   0
>  .../{openssl => openssl10}/Makefiles-ptest.patch   |   0
>  .../Use-SHA256-not-MD5-as-default-digest.patch     |   0
>  .../configure-musl-target.patch                    |   0
>  .../{openssl => openssl10}/configure-targets.patch |   0
>  .../debian/c_rehash-compat.patch                   |   0
>  .../openssl/{openssl => openssl10}/debian/ca.patch |   0
>  .../debian/debian-targets.patch                    |   0
>  .../{openssl => openssl10}/debian/man-dir.patch    |   0
>  .../debian/man-section.patch                       |   0
>  .../{openssl => openssl10}/debian/no-rpath.patch   |   0
>  .../debian/no-symbolic.patch                       |   0
>  .../{openssl => openssl10}/debian/pic.patch        |   0
>  .../debian/version-script.patch                    |   0
>  .../debian1.0.2/block_digicert_malaysia.patch      |   0
>  .../debian1.0.2/block_diginotar.patch              |   0
>  .../debian1.0.2/soname.patch                       |   0
>  .../debian1.0.2/version-script.patch               |   0
>  .../engines-install-in-libdir-ssl.patch            |   0
>  .../openssl/{openssl => openssl10}/find.pl         |   0
>  .../{openssl => openssl10}/oe-ldflags.patch        |   0
>  .../openssl-1.0.2a-x32-asm.patch                   |   0
>  .../{openssl => openssl10}/openssl-c_rehash.sh     |   0
>  .../openssl-fix-des.pod-error.patch                |   0
>  .../openssl-util-perlpath.pl-cwd.patch             |   0
>  .../openssl_fix_for_x32.patch                      |   0
>  .../openssl/{openssl => openssl10}/parallel.patch  |   0
>  .../{openssl => openssl10}/ptest-deps.patch        |   0
>  .../ptest_makefile_deps.patch                      |   0
>  .../openssl/openssl10/run-ptest                    |   2 +
>  .../{openssl => openssl10}/shared-libs.patch       |   0
>  .../{openssl_1.0.2l.bb => openssl10_1.0.2l.bb}     |   4 +-
>  .../recipes-connectivity/openssl/openssl_1.1.0f.bb | 146 +++++++++++++++++++++
>  .../cryptodev/cryptodev-tests_1.8.bb               |   2 +-
>  .../gstreamer/gstreamer1.0-plugins-bad.inc         |   4 +-
>  45 files changed, 265 insertions(+), 11 deletions(-)
>  rename meta/recipes-bsp/u-boot/{u-boot-common_2017.05.inc => u-boot-common_2017.07.inc} (88%)
>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.05.bb => u-boot-fw-utils_2017.07.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.05.bb => u-boot-mkimage_2017.07.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot_2017.05.bb => u-boot_2017.07.bb} (100%)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Remove-test-that-requires-running-as-non-root.patch
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Take-linking-flags-from-LDFLAGS-env-var.patch
>  mode change 100755 => 100644 meta/recipes-connectivity/openssl/openssl/run-ptest
>  rename meta/recipes-connectivity/openssl/{openssl.inc => openssl10.inc} (95%)
>  rename meta/recipes-connectivity/openssl/{openssl => openssl10}/0001-Fix-build-with-clang-using-external-assembler.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl => openssl10}/Makefiles-ptest.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl => openssl10}/Use-SHA256-not-MD5-as-default-digest.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl => openssl10}/configure-musl-target.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl => openssl10}/configure-targets.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian/c_rehash-compat.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian/ca.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian/debian-targets.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian/man-dir.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian/man-section.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian/no-rpath.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian/no-symbolic.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian/pic.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian/version-script.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian1.0.2/block_digicert_malaysia.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian1.0.2/block_diginotar.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian1.0.2/soname.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl => openssl10}/debian1.0.2/version-script.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl => openssl10}/engines-install-in-libdir-ssl.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl => openssl10}/find.pl (100%)
>  rename meta/recipes-connectivity/openssl/{openssl => openssl10}/oe-ldflags.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl => openssl10}/openssl-1.0.2a-x32-asm.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl => openssl10}/openssl-c_rehash.sh (100%)
>  rename meta/recipes-connectivity/openssl/{openssl => openssl10}/openssl-fix-des.pod-error.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl => openssl10}/openssl-util-perlpath.pl-cwd.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl => openssl10}/openssl_fix_for_x32.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl => openssl10}/parallel.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl => openssl10}/ptest-deps.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl => openssl10}/ptest_makefile_deps.patch (100%)
>  create mode 100755 meta/recipes-connectivity/openssl/openssl10/run-ptest
>  rename meta/recipes-connectivity/openssl/{openssl => openssl10}/shared-libs.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl_1.0.2l.bb => openssl10_1.0.2l.bb} (96%)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl_1.1.0f.bb
>
> --
> 2.13.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

