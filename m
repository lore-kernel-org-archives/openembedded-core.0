Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9113D71ADD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 06:22:48 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id h4-v6so13433039qtj.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 23:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DB6hfaw0ciS+JLkfUU9WgxREJNJrwxD7S8D8U/pOfjg=;
	b=C4uqaxORWOF2R/wxjFataVIiNzqwwF4I5P2X5i6VaX7wnG3OhKeu7n1kL964CAhoJp
	TxX7kIZPELNL/rsYYR/PXa/r4Bf8EEUi8TzTOMK3WeVNBpEeAQAKxnYjg9QMF5KTXcs5
	OA9VdVufXWT92IBWqCbNioLE9l+be/OSLIABNoEP1PxO+qQUD+JXYcd9JldZVIiMZFA7
	tfrJrjsGwUl5jmkxsvkvLjNC8k1p/9zdA9k0/Dct1RaxQLeydoWZeQLNP836J/Dll7o4
	VJ1L2qEhmROXSk3Vdj7NLsA3isnJiITcC66xvlP27B0MjIMhgmnQ/5fTu0kZfLx72Qkg
	f15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DB6hfaw0ciS+JLkfUU9WgxREJNJrwxD7S8D8U/pOfjg=;
	b=Uk7hNxKQOnVnSoL6CApHHEbNbc7ilI4jVKxnWk8wJIvnd2LlaYkYyR6UEyyRa6HHqI
	qbb9GWosf0xqrExxeQgvdKY4jh2XDQ9fOh9cLh80wY6lm0+nCP8Y0kl2dVgb/cuvSZf9
	c+/C9e7Tyk6vVVCkxbqlOm8RF+eX/oktC8pYEmW0zGVq19i6hHtm40AwLv4OTw57HRX2
	+CNqtk81pj0RI2FdJqSk5NhcQkdotkrdd6wypvNm2rjD2uJKtUnkM7B45/vAWzFWxYKf
	MnUb9gulqiStIh5gqJM1qB/qbI9M68k6MAQeVknS9Ci4SsZVsfLvqig5LO5SjatoQdXk
	te6Q==
X-Gm-Message-State: APzg51CZUhoET5AF78hr/bNnGwhaqGYL3xliPp/UsoQ5TnFLih25SVoq
	X1na/RtYbfdudtOfqzKJP5ZN1VQszqnimr9/X2E=
X-Google-Smtp-Source: ANB0VdZgO0UAWczfRBYco64T8IJhSz4Yac2ONy6Z+sV9jtaZ6ucql94ccqAMa7/pLl9ddc4QB42z/Coq7qpHmfMzVgo=
X-Received: by 2002:a0c:87f8:: with SMTP id
	53-v6mr14413585qvk.228.1535696569339; 
	Thu, 30 Aug 2018 23:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1535451643.git.alex.kanavin@gmail.com>
In-Reply-To: <cover.1535451643.git.alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 Aug 2018 23:22:23 -0700
Message-ID: <CAMKF1sqLt9FpEhhL977egq7DjKJDj7PvBV6MJ-jszjfzHgTyrA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 0/6] openssl 1.1.1 update
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
X-List-Received-Date: Fri, 31 Aug 2018 06:22:48 -0000
Content-Type: text/plain; charset="UTF-8"

musl/mips seems to fail due to this see

http://errors.yoctoproject.org/Errors/Details/188615/
On Tue, Aug 28, 2018 at 3:23 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> This patch series updates openssl to the soon-to-be released 1.1.1 version
> (latest news is 11 September), sets it as default, and removes dependencies
> on openssl 1.0 entirely from oe-core. openssl 1.0 remains available as openssl10
> recipe.
>
> The following changes since commit a8368651ffed1bd6c4715a37dfe9f40c48ca23c4:
>
>   bitbake: fetcher: Fixed remote removal not throwing exception. (2018-08-28 10:32:08 +0100)
>
> are available in the git repository at:
>
>   git://push.yoctoproject.org/poky-contrib akanavin/openssl-1.1.1
>
> Alexander Kanavin (6):
>   openssl: rename openssl 1.0.x to openssl10 and make openssl 1.1.x the
>     default version
>   cryptodev-tests: port to openssl 1.1
>   openssl: update to 1.1.1
>   libressl: add a recipe to support openssh
>   openssh: depend on libressl
>   ca-certificates: update to 20180409
>
>  meta/conf/distro/include/default-versions.inc      |   3 -
>  meta/conf/distro/include/maintainers.inc           |   2 +
>  ...c-libraries-with-their-library-dependenci.patch |  73 +++++++++++++++
>  .../libressl/libressl_2.8.0.bb                     |  35 +++++++
>  meta/recipes-connectivity/openssh/openssh_7.7p1.bb |   2 +-
>  .../{openssl => files}/environment.d-openssl.sh    |   0
>  ...1-Take-linking-flags-from-LDFLAGS-env-var.patch |  43 ---------
>  ...SLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch |  39 --------
>  ...build-with-clang-using-external-assembler.patch |   0
>  .../0001-allow-manpages-to-be-disabled.patch       |   0
>  ...penssl-force-soft-link-to-avoid-rare-race.patch |   0
>  .../Makefiles-ptest.patch                          |   0
>  .../Use-SHA256-not-MD5-as-default-digest.patch     |   0
>  .../configure-musl-target.patch                    |   0
>  .../configure-targets.patch                        |   0
>  .../debian/c_rehash-compat.patch                   |   0
>  .../debian/debian-targets.patch                    |   0
>  .../debian/man-dir.patch                           |   0
>  .../debian/man-section.patch                       |   0
>  .../debian/no-rpath.patch                          |   0
>  .../debian/no-symbolic.patch                       |   0
>  .../{openssl-1.0.2p => openssl10}/debian/pic.patch |   0
>  .../debian1.0.2/block_digicert_malaysia.patch      |   0
>  .../debian1.0.2/block_diginotar.patch              |   0
>  .../debian1.0.2/soname.patch                       |   0
>  .../debian1.0.2/version-script.patch               |   0
>  .../engines-install-in-libdir-ssl.patch            |   0
>  .../{openssl-1.0.2p => openssl10}/oe-ldflags.patch |   0
>  .../openssl-c_rehash.sh                            |   0
>  .../openssl-fix-des.pod-error.patch                |   0
>  .../openssl_fix_for_x32.patch                      |   0
>  .../{openssl-1.0.2p => openssl10}/parallel.patch   |   0
>  .../{openssl-1.0.2p => openssl10}/ptest-deps.patch |   0
>  .../ptest_makefile_deps.patch                      |   0
>  .../reproducible-cflags.patch                      |   0
>  .../reproducible-mkbuildinf.patch                  |   0
>  .../{openssl-1.0.2p => openssl10}/run-ptest        |   0
>  .../shared-libs.patch                              |   0
>  .../{openssl_1.0.2p.bb => openssl10_1.0.2p.bb}     |  31 +++++--
>  .../{openssl_1.1.0i.bb => openssl_1.1.1-pre9.bb}   |  23 +++--
>  .../cryptodev/cryptodev-tests_1.9.bb               |   3 +-
>  .../files/0001-Port-tests-to-openssl-1.1.patch     | 103 +++++++++++++++++++++
>  ...tes_20170717.bb => ca-certificates_20180409.bb} |   4 +-
>  43 files changed, 255 insertions(+), 106 deletions(-)
>  create mode 100644 meta/recipes-connectivity/libressl/libressl/0001-Link-dynamic-libraries-with-their-library-dependenci.patch
>  create mode 100644 meta/recipes-connectivity/libressl/libressl_2.8.0.bb
>  rename meta/recipes-connectivity/openssl/{openssl => files}/environment.d-openssl.sh (100%)
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Take-linking-flags-from-LDFLAGS-env-var.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-allow-OPENSSLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/0001-Fix-build-with-clang-using-external-assembler.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/0001-allow-manpages-to-be-disabled.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/0001-openssl-force-soft-link-to-avoid-rare-race.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/Makefiles-ptest.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/Use-SHA256-not-MD5-as-default-digest.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/configure-musl-target.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/configure-targets.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/c_rehash-compat.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/debian-targets.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/man-dir.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/man-section.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/no-rpath.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/no-symbolic.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/pic.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian1.0.2/block_digicert_malaysia.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian1.0.2/block_diginotar.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian1.0.2/soname.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian1.0.2/version-script.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/engines-install-in-libdir-ssl.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/oe-ldflags.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/openssl-c_rehash.sh (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/openssl-fix-des.pod-error.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/openssl_fix_for_x32.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/parallel.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/ptest-deps.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/ptest_makefile_deps.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/reproducible-cflags.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/reproducible-mkbuildinf.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/run-ptest (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/shared-libs.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl_1.0.2p.bb => openssl10_1.0.2p.bb} (91%)
>  rename meta/recipes-connectivity/openssl/{openssl_1.1.0i.bb => openssl_1.1.1-pre9.bb} (83%)
>  create mode 100644 meta/recipes-kernel/cryptodev/files/0001-Port-tests-to-openssl-1.1.patch
>  rename meta/recipes-support/ca-certificates/{ca-certificates_20170717.bb => ca-certificates_20180409.bb} (95%)
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

