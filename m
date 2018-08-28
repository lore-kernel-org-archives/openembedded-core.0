Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 89D3778A0F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 10:23:22 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id f21-v6so1343568wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 03:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=fUXSnDydJyPqi06I/LId6Q6SIeiFTKXfKFnmZ/NWoaY=;
	b=Wo9hAMp7s1W1EaTVTre7rPyP4IX2rkNSjEIRaIzo4f7WdPcTNbpBtqzF5hj90353oI
	eKBeqvdp+FwqSNXCK7vTatcX/pSPBsT8g3zDX1Tp8R+XibPsJiovrXEPGEWRFgrmmJbP
	D0f+UxeWPpSL9T2fRzuZYRmc2dtqBgKIlC0afES2b/ve4gFJ3ukP+SMcaWykGO3N1WE1
	bSlXYZio2awjKm7u5Mqu6Y3ZHECE8l3G/Ewl+cYhW1Z0mq0Ip6VYqQKJ69O+WceFB9Pe
	vWCeyWsqAvmRp6CnncA1qHW4x3/3eyBfa13oLZieOxR3zUvQ4syVzfWyH0zzYGejEiqj
	f7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=fUXSnDydJyPqi06I/LId6Q6SIeiFTKXfKFnmZ/NWoaY=;
	b=EZhodxev3EhO8Wydd1Y1efr7e9PumRwwmsi53WY7FEANQbMSzxXORTPvo3TK3y7FzO
	BvFV4w4CrvZNfoVIMzA5Q1WnUjG04Pg4SbQafdBu6dM5+umynD3bxcA3ZwKghke7CYIb
	jSJYWoGmgcvaUyhfiX7GCuWbAQoO404KNsYfiiF1jEpcMWOQqBRI84mdvgzDgnDK60qB
	bzROvQNPQStvKA+NFdP1jxRon8OH6x0x4kBVWu8EOlsYVMn5DR/RMeiJu0aeC3yHwunY
	WoTBM55lGy4rmuUsxQHfly6r9rZc7gTEoW9I1QvSPKYfj18hhrkrZFUjRkUIyITxNPBa
	5XNw==
X-Gm-Message-State: APzg51AjLajXxfl57DZGJ5jTbcNx+OyvL1fzwqdtbV6g/2reg+GkocXa
	zquYV4VgzVeEt8gBmBSq35iJvxcc
X-Google-Smtp-Source: ANB0Vda6BK3N8uVwuqhmnata3pJDwNymFeORi9pX/0XUR1rDdr04sg/7tHDJkaV4JqYHJH3ueHFX2w==
X-Received: by 2002:a1c:2d54:: with SMTP id t81-v6mr982799wmt.31.1535451802617;
	Tue, 28 Aug 2018 03:23:22 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	198-v6sm771823wmm.0.2018.08.28.03.23.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Aug 2018 03:23:22 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Aug 2018 12:23:11 +0200
Message-Id: <cover.1535451643.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [RFC PATCH 0/6] openssl 1.1.1 update
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
X-List-Received-Date: Tue, 28 Aug 2018 10:23:22 -0000

This patch series updates openssl to the soon-to-be released 1.1.1 version
(latest news is 11 September), sets it as default, and removes dependencies
on openssl 1.0 entirely from oe-core. openssl 1.0 remains available as openssl10
recipe.

The following changes since commit a8368651ffed1bd6c4715a37dfe9f40c48ca23c4:

  bitbake: fetcher: Fixed remote removal not throwing exception. (2018-08-28 10:32:08 +0100)

are available in the git repository at:

  git://push.yoctoproject.org/poky-contrib akanavin/openssl-1.1.1

Alexander Kanavin (6):
  openssl: rename openssl 1.0.x to openssl10 and make openssl 1.1.x the
    default version
  cryptodev-tests: port to openssl 1.1
  openssl: update to 1.1.1
  libressl: add a recipe to support openssh
  openssh: depend on libressl
  ca-certificates: update to 20180409

 meta/conf/distro/include/default-versions.inc      |   3 -
 meta/conf/distro/include/maintainers.inc           |   2 +
 ...c-libraries-with-their-library-dependenci.patch |  73 +++++++++++++++
 .../libressl/libressl_2.8.0.bb                     |  35 +++++++
 meta/recipes-connectivity/openssh/openssh_7.7p1.bb |   2 +-
 .../{openssl => files}/environment.d-openssl.sh    |   0
 ...1-Take-linking-flags-from-LDFLAGS-env-var.patch |  43 ---------
 ...SLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch |  39 --------
 ...build-with-clang-using-external-assembler.patch |   0
 .../0001-allow-manpages-to-be-disabled.patch       |   0
 ...penssl-force-soft-link-to-avoid-rare-race.patch |   0
 .../Makefiles-ptest.patch                          |   0
 .../Use-SHA256-not-MD5-as-default-digest.patch     |   0
 .../configure-musl-target.patch                    |   0
 .../configure-targets.patch                        |   0
 .../debian/c_rehash-compat.patch                   |   0
 .../debian/debian-targets.patch                    |   0
 .../debian/man-dir.patch                           |   0
 .../debian/man-section.patch                       |   0
 .../debian/no-rpath.patch                          |   0
 .../debian/no-symbolic.patch                       |   0
 .../{openssl-1.0.2p => openssl10}/debian/pic.patch |   0
 .../debian1.0.2/block_digicert_malaysia.patch      |   0
 .../debian1.0.2/block_diginotar.patch              |   0
 .../debian1.0.2/soname.patch                       |   0
 .../debian1.0.2/version-script.patch               |   0
 .../engines-install-in-libdir-ssl.patch            |   0
 .../{openssl-1.0.2p => openssl10}/oe-ldflags.patch |   0
 .../openssl-c_rehash.sh                            |   0
 .../openssl-fix-des.pod-error.patch                |   0
 .../openssl_fix_for_x32.patch                      |   0
 .../{openssl-1.0.2p => openssl10}/parallel.patch   |   0
 .../{openssl-1.0.2p => openssl10}/ptest-deps.patch |   0
 .../ptest_makefile_deps.patch                      |   0
 .../reproducible-cflags.patch                      |   0
 .../reproducible-mkbuildinf.patch                  |   0
 .../{openssl-1.0.2p => openssl10}/run-ptest        |   0
 .../shared-libs.patch                              |   0
 .../{openssl_1.0.2p.bb => openssl10_1.0.2p.bb}     |  31 +++++--
 .../{openssl_1.1.0i.bb => openssl_1.1.1-pre9.bb}   |  23 +++--
 .../cryptodev/cryptodev-tests_1.9.bb               |   3 +-
 .../files/0001-Port-tests-to-openssl-1.1.patch     | 103 +++++++++++++++++++++
 ...tes_20170717.bb => ca-certificates_20180409.bb} |   4 +-
 43 files changed, 255 insertions(+), 106 deletions(-)
 create mode 100644 meta/recipes-connectivity/libressl/libressl/0001-Link-dynamic-libraries-with-their-library-dependenci.patch
 create mode 100644 meta/recipes-connectivity/libressl/libressl_2.8.0.bb
 rename meta/recipes-connectivity/openssl/{openssl => files}/environment.d-openssl.sh (100%)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Take-linking-flags-from-LDFLAGS-env-var.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-allow-OPENSSLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/0001-Fix-build-with-clang-using-external-assembler.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/0001-allow-manpages-to-be-disabled.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/0001-openssl-force-soft-link-to-avoid-rare-race.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/Makefiles-ptest.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/Use-SHA256-not-MD5-as-default-digest.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/configure-musl-target.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/configure-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/c_rehash-compat.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/debian-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/man-dir.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/man-section.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/no-rpath.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/no-symbolic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/pic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian1.0.2/block_digicert_malaysia.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian1.0.2/block_diginotar.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian1.0.2/soname.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian1.0.2/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/engines-install-in-libdir-ssl.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/oe-ldflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/openssl-c_rehash.sh (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/openssl-fix-des.pod-error.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/openssl_fix_for_x32.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/parallel.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/ptest-deps.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/ptest_makefile_deps.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/reproducible-cflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/reproducible-mkbuildinf.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/run-ptest (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/shared-libs.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2p.bb => openssl10_1.0.2p.bb} (91%)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.0i.bb => openssl_1.1.1-pre9.bb} (83%)
 create mode 100644 meta/recipes-kernel/cryptodev/files/0001-Port-tests-to-openssl-1.1.patch
 rename meta/recipes-support/ca-certificates/{ca-certificates_20170717.bb => ca-certificates_20180409.bb} (95%)

-- 
2.7.4


