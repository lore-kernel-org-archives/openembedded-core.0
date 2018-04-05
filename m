Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id EF5B1746B7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 14:04:05 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id s24-v6so19233028plq.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Apr 2018 07:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:references:to:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=LTUSbAWD67AY0AT0sj4Qe+/afz3ZHSnhi1QXw1XfhR0=;
	b=spycOTbSMR8s1mSqbtr/9GTHjgPue4dWKJzAuG6EoWXeLP5y3dBdechkC9d/0KVEjF
	0jIdV2T7VUBDDRSJcH5z7ChCbMn7fhnzYafzoPVeijmTWUCjDvNHy+DNiALrcVeB91bb
	b/LI+vxdFvWfimcMjww56qBg+fMPj+ORc36sqeQAbDZTdMYyymtMHE0mSkiMlmSKk56o
	CbgV4XDgNOwQn6g7+ZBKynVMYuKg45baqFj3PhnzKkcbTGGAM3CGOBYHYdg3MePKHY/T
	Jv+eaSAmB37FoxCP+aXmLak8ODWahhSqWfme2fQ9a9q98sliTiEcg1wVTlEAE/yFkal5
	XjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:references:to:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=LTUSbAWD67AY0AT0sj4Qe+/afz3ZHSnhi1QXw1XfhR0=;
	b=er5voDF6odTtYMXtfUmGBm7IybkCEkYLenxTiSYPkzRKvYX9c6fU4wzoKPXaYdhJWx
	tQL+JyKZOz49Powttmgn9lC6Zg1RyJ+eJVPEdWdbJt7Mr2EBfj3IqeYyPF7sone4sP7O
	it6LLIgTZmKr+klh/sz2YDE4NOWIqUum2HfzMaLZDzTN4nQ1IExPSqOBvf5oOv+itZ8P
	BUEgio4FewJbvcuketTlom1tXjMLL4twnv+n+DNui8xyNFl0M1Kq0ucj1CODiJuQwihE
	r7bglIiuisAqxhXgrmAwdL/ti2unxDhppj/a/FDgNGNMNmFo59lJBF4RhmNo7pcCuyEK
	aHlw==
X-Gm-Message-State: AElRT7HXCF794SMUpCAeqjLaPysMbYaTw5eacJQd3F01AFFQZZ8SecDq
	S7iRGgOWxnEzdsbBWRLgwPFCZg==
X-Google-Smtp-Source: AIpwx48LsmEmC42cNkNN/evGDMNAb6MciVr23BMoGujty3WCgErtYOCTgCF4KmyEkVBfUC8m9STQvA==
X-Received: by 10.98.32.80 with SMTP id g77mr17248907pfg.216.1522937046516;
	Thu, 05 Apr 2018 07:04:06 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:9956:e5c2:70f8:aaf8?
	([2601:202:4000:1184:9956:e5c2:70f8:aaf8])
	by smtp.gmail.com with ESMTPSA id
	m10sm13745504pgd.32.2018.04.05.07.04.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Apr 2018 07:04:05 -0700 (PDT)
References: <cover.1522936224.git.akuster808@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <0f6dd972-c052-2ffe-1f3d-323620d6a0af@gmail.com>
Date: Thu, 5 Apr 2018 07:04:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <cover.1522936224.git.akuster808@gmail.com>
Subject: Re: [PATCH 00/38] Morty Next pull request
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
X-List-Received-Date: Thu, 05 Apr 2018 14:04:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Ignore this request.

- armin


On 04/05/2018 06:53 AM, Armin Kuster wrote:
> Please consider these changes for Morty. Clean AB build
>
> This included sdk locale and host glibc 2.27 fixes.

>
> The following changes since commit 34b26ec18450a3bc72f7b8a0f2df0bfaae1140dd:
>
>   linux-firmware: Add reference to iwlwifi-8000C firmware (2018-03-19 15:58:33 +0000)
>
> are available in the git repository at:
>
>   git://git.yoctoproject.org/poky-contrib stable/morty-next
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=stable/morty-next
>
> Alexander Kanavin (2):
>   selftest/signing: add --batch to gpg invocation when importing keys
>   populate_sdk_base.bbclass: add documentation packages to SDKs if
>     api-documentation is in DISTRO_FEATURES
>
> Andreas Oberritter (1):
>   libc-package.bbclass: split binary localedata even more if asked to
>
> Armin Kuster (3):
>   lib/oe/terminal.py: use an absolute path to execute
>     oe-gnome-terminal-phonehome
>   distcc: Change SRC_URI
>   package_manager: fix install_glob to use morty sdk pkgdir
>
> Christopher Larson (1):
>   buildhistory: fix latest_srcrev in the common case
>
> Ed Bartosh (1):
>   toolchain-shar-extract: compare SDK and host gcc versions
>
> Gianfranco Costamagna (1):
>   glibc-locale.inc: fix typo in comment
>
> Juro Bystricky (1):
>   glibc-locale.inc: avoid duplicate packages
>
> Linus Wallgren (1):
>   lib/oe/package_manager: .deb pre/postinst args
>
> Martin Jansa (1):
>   package_manager: flush installed_pkgs file before oe-pkgdata-util uses
>     it
>
> Maxin B. John (1):
>   grub-efi: fix build failure
>
> Richard Purdie (4):
>   lib/oe/package_manager/sdk: Ensure do_populate_sdk_ext and
>     do_populate_sdk repos don't conflict
>   glibc: Separate locale files to their own sstate task
>   image/packagegroup/populate_sdk: Drop do_populate_sysroot task
>     properly
>   glibc-package: Avoid race sstate races with do_stash_locale
>
> Ross Burton (15):
>   default-distrovars: don't rename locales for nativesdk
>   glibc: don't use host locales in nativesdk
>   glibc: relocate locale paths in nativesdk
>   lib/oe/package_manager: bail if createrepo can't be found
>   package_manager: don't race on a file when installing complementary
>     packages
>   package_manager: improve install_complementary
>   package-manager: add install_glob()
>   sdk: install specified locales into SDK
>   sdk: only install locales if we're using glibc
>   populate_sdk: install UTF-8 locales in SDKs
>   populate_sdk_base: depend on nativesdk-glibc-locale
>   cross-localedef-native: add way to specify which locale archive to
>     write
>   qemu: fix memfd_create with glibc 2.27
>   sdk: generate locale archive and remove packages
>   sdk: streamline locale removal
>
> Stephano Cetola (1):
>   package_manager: remove strings and migrate to direct arrays
>
> Tanu Kaskinen (4):
>   e2fsprogs: fix compatibility with glibc 2.27
>   libvorbis: CVE-2017-14633
>   libvorbis: CVE-2017-14632
>   libvorbis: CVE-2018-5146
>
> Zhenbo Gao (1):
>   archiver: avoid archiving source for glibc-locale
>
>  meta/classes/archiver.bbclass                      |   6 +
>  meta/classes/buildhistory.bbclass                  |   2 +-
>  meta/classes/image.bbclass                         |   2 +-
>  meta/classes/libc-package.bbclass                  |  39 ++-
>  meta/classes/packagegroup.bbclass                  |   2 +-
>  meta/classes/populate_sdk_base.bbclass             |  11 +-
>  meta/classes/populate_sdk_ext.bbclass              |   3 +-
>  meta/conf/distro/include/default-distrovars.inc    |   1 +
>  meta/files/toolchain-shar-extract.sh               |   8 +
>  meta/lib/oe/package.py                             |  13 +-
>  meta/lib/oe/package_manager.py                     | 328 +++++++++++----------
>  meta/lib/oe/sdk.py                                 |  85 +++++-
>  meta/lib/oe/terminal.py                            |   2 +-
>  meta/lib/oeqa/selftest/signing.py                  |   2 +-
>  ...ix-check-for-sys-sysmacros.h-under-glibc-.patch |  48 +++
>  meta/recipes-bsp/grub/grub-efi_2.00.bb             |   1 +
>  .../glibc/cross-localedef-native_2.24.bb           |   1 +
>  meta/recipes-core/glibc/glibc-collateral.inc       |   2 +-
>  meta/recipes-core/glibc/glibc-initial.inc          |   2 +-
>  meta/recipes-core/glibc/glibc-locale.inc           |   5 +-
>  meta/recipes-core/glibc/glibc-mtrace.inc           |   2 +-
>  meta/recipes-core/glibc/glibc-package.inc          |  45 +--
>  meta/recipes-core/glibc/glibc-scripts.inc          |   2 +-
>  meta/recipes-core/glibc/glibc/archive-path.patch   |  39 +++
>  .../glibc/glibc/relocate-locales.patch             |  33 +++
>  meta/recipes-core/glibc/glibc_2.24.bb              |   7 +-
>  meta/recipes-core/meta/buildtools-tarball.bb       |   1 -
>  meta/recipes-devtools/distcc/distcc_3.2.bb         |   2 +-
>  ...rename-copy_file_range-to-copy_file_chunk.patch |  62 ++++
>  meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb  |   1 +
>  meta/recipes-devtools/qemu/qemu/memfd.patch        |  57 ++++
>  meta/recipes-devtools/qemu/qemu_2.7.0.bb           |   1 +
>  .../libvorbis/libvorbis/CVE-2017-14632.patch       |  62 ++++
>  .../libvorbis/libvorbis/CVE-2017-14633.patch       |  42 +++
>  .../libvorbis/libvorbis/CVE-2018-5146.patch        | 100 +++++++
>  .../libvorbis/libvorbis_1.3.5.bb                   |   6 +-
>  36 files changed, 809 insertions(+), 216 deletions(-)
>  create mode 100644 meta/recipes-bsp/grub/files/0001-configure-fix-check-for-sys-sysmacros.h-under-glibc-.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/archive-path.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/relocate-locales.patch
>  create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-rename-copy_file_range-to-copy_file_chunk.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/memfd.patch
>  create mode 100644 meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14632.patch
>  create mode 100644 meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14633.patch
>  create mode 100644 meta/recipes-multimedia/libvorbis/libvorbis/CVE-2018-5146.patch
>


