Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E623C36011
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:29:12 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.33381.1743020945984363927
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:29:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iYoIQN6T;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: hiagofranco@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3014ae35534so315111a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 13:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743020945; x=1743625745; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SP8AsTRe5LGKI3YVksI05Wq6HDhmWuOI3QeWkQi+rSM=;
        b=iYoIQN6TSwDNuI4a7lp+vZ8uSj2VQl+myaWCIWelxf8kb0yrlxU7u5J1SPeFx5FQ9k
         9HC6AX7JEyGjRlIdfdrXp8gli9wumcvqO6Ca2unctckBmSm/YczetqyuHVygpp3LSQwi
         gK5P9P6y5Luxt/K9v8RMFooAdkrPV8EKEFZLiNunkpIYg2lPhHqEGWs28PmkkMekdT8y
         phr1J2UzGYB6nLl0aeMtAlrIRJl6EalyTYksS51Dgj8XAbr9XCI/5dsVzTe+gPCW5TJ+
         +2kLhOwMDFqVGvbRPm7QOOXUlBBqxcGRepmnSt0R4/l0KrGmRgBW/caEuRvl+9Qd7Z8Y
         nnhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743020945; x=1743625745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SP8AsTRe5LGKI3YVksI05Wq6HDhmWuOI3QeWkQi+rSM=;
        b=sjKpPAwuLR99nBMtRMevQLtv3GNlnMb6SOO2FTWPxG6bj/sfMuq3x9Ev0gWLVJzvlI
         zXmiuouqbKnxBUOUvFys2gO9GrOKmyFftVITMYwDgFRYlqzlJI3ewL/+rAFlM0BGt3Tt
         l1j33uaS1aQmIZIZcNvoaiNPt92Bcy3hLQYUACkmxbit19UXJtw0cCeqt3gRlwniulmo
         KZ++ipJ1VaHMJOI3JWWotccQrrz8VpjITBVmPujHEiL6nZptcw8US5JSDk3u3Tk2vCrb
         YwAzG/NZnKyt6i4NyZu+6A2jg70FMVGuzXkjoM4ODmOmLtPtfWmjyQnTpaCOuMkyn6oE
         pdiw==
X-Gm-Message-State: AOJu0YxqEsEucYG1ENL+3Wv63+5k7QkUSqC++LdIATb67oSiohpEpWz9
	ypHY+fnYiBzKamU+YkGk5Iv4XhsQddju0WOzTDAgyEM/VUZJxUeoXhyqNGNk
X-Gm-Gg: ASbGncuRRQYVZ99uUiNksMaj3d8Cy4DsfzVyYXG/Hm7xVm3zfrfNAHO7+5mYdbgQeoZ
	UolhyxWgzaPqkSCL/OIMsGMhTZ134A6uidNPonwb6JjGtx38408IY7zx5969yzT9MZrAC5cKjvv
	jIhVapN6zn0qsf3meaWnw2l4maYxPFXQAMHqaFU6nicW6VoRghjB8QTvGCJafe5H1SFhpGtDS1D
	SF55joLrb7ixFQjpljOsU1yHzmMQymxF4iwTT5dl1ZfhY+UfHFqeXou3OeQXCkS0zgVF9iABc0t
	ZA14TuxMoQOCUaDta/SG6f+u20EsGBd6FkpXYQ5WhZQ0qfowi30L86JybsTTLYiqSoUbxtuzMA9
	9ng==
X-Google-Smtp-Source: AGHT+IFmLBNDw6SU3KqUkNmcTifAgCBEX2E6IMvczd+T82V0Vs2sgFOzd+8JgXvw72vwoJ+M5Ib5Mg==
X-Received: by 2002:a17:90b:57c6:b0:2eb:140d:f6df with SMTP id 98e67ed59e1d1-303a7d5b657mr1229541a91.1.1743020944981;
        Wed, 26 Mar 2025 13:29:04 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm661625a91.38.2025.03.26.13.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:29:04 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [styhead][PATCH v2 00/31] linux-firmware: upgrade 20240909 -> 20250311
Date: Wed, 26 Mar 2025 17:27:46 -0300
Message-Id: <20250326202817.64437-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213660

From: Hiago De Franco <hiago.franco@toradex.com>

Update the linux-firmware recipe to the most recent upstream tag.

This is basically a backport of the commits from master into styhead,
related to the linux-firmware recipe.

Commit 30ea609d3357 ("meta/meta-selftest: Fix variable assignment
whitespace") changes a lot of files (linux-firmware included), but they
are all related to missing whitespaces to improve redability, this is
the reason I have decided to cherry-pick this commit as well.

v2:
  - As requested, I converted the v1 patch into backports from oe-core master.
v1:
  - https://lore.kernel.org/openembedded-core/20250325215115.10430-1-hiagofranco@gmail.com/

Alex Kiernan (1):
  linux-firmware: Add RTL8723DS blobs into ${PN}-rtl8723

Dmitry Baryshkov (16):
  linux-firmware: add battmgr.jsn to ${PN}-qcom-qcm6490-audio
  linux-firmware: split qcm6490 ZAP shader to separate package
  linux-firmware: split sa8775p ZAP shader to separate package
  linux-firmware: make ${PN}-qcom-adreno-a663 depend on -a660
  linux-firmware: package IPA firmware for Qualcomm QCM6490 platforms
  linux-firmware: RPROVIDE qcs6490 firmware packages by qcm6490 ones
  linux-firmware: upgrade 20241017 -> 20241110
  linux-firmware: package Qualcomm X1 Elite audio DSP firmware
  linux-firmware: package QCS615 Adreno ZAP shader
  linux-firmware: upgrade 20241110 -> 20241210
  linux-firmware: package firmware for Qualcomm AIC100 and QDU100
  linux-firmware: upgrade 20241210 -> 20250109
  linux-firmware: split the qca6390 firmware
  linux-firmware: further split qca61x4 package
  linux-firmware: fix qca-qca61x4-usb package contents
  linux-firmware: make linux-firmware-qcom-qcm6490-wifi provide
    -qcs6490-

Marc Ferland (5):
  linux-firmware: split ath10k firmwares in separate packages
  linux-firmware: split ath11k firmwares in separate packages
  linux-firmware: split amdgpu firmwares in separate packages
  linux-firmware: split ath12k firmwares in separate packages
  linux-firmware: split qca firmwares in separate packages

Richard Purdie (1):
  meta/meta-selftest: Fix variable assignment whitespace

Vivek Puar (6):
  linux-firmware: add new fw file to ${PN}-qcom-adreno-a660
  linux-firmware: Add qcom-qcm6490-{audio,compute} firmware packages
  linux-firmware: Add qcom-adreno-a663 package
  linux-firmware: upgrade 20250109 -> 20250211
  linux-firmware: upgrade 20250211 -> 20250311
  linux-firmware: update qca-qca61x4-usb package contents

Zoltan Boszormenyi (1):
  linux-firmware: Fix packaging of some subpackages

Zoltán Böszörményi (1):
  linux-firmware: Upgrade to 20241017 and allow compressing firmware

 .../sysdig/sysdig-selftest_0.28.0.bb          |   2 +-
 .../bbclasses/systemd-and-sysvinit.bb         |   2 +-
 .../recipes-test/bbclasses/systemd-only.bb    |   2 +-
 .../recipes-test/gitrepotest/gitrepotest.bb   |   2 +-
 .../selftest-users/acreategroup.bb            |   2 +-
 .../selftest-users/bcreategroup.bb            |   2 +-
 .../selftest-users/ccreategroup.bb            |   2 +-
 .../selftest-users/dcreategroup.bb            |   2 +-
 meta/classes-global/base.bbclass              |   2 +-
 meta/classes-recipe/autotools.bbclass         |   2 +-
 meta/classes-recipe/cargo.bbclass             |   2 +-
 meta/classes-recipe/go.bbclass                |   4 +-
 meta/classes-recipe/gtk-icon-cache.bbclass    |   2 +-
 meta/classes-recipe/kernel.bbclass            |   2 +-
 meta/classes-recipe/python3native.bbclass     |   6 +-
 meta/classes-recipe/python_pyo3.bbclass       |  12 +-
 meta/classes-recipe/rust.bbclass              |   8 +-
 meta/classes-recipe/setuptools3.bbclass       |   2 +-
 .../classes-recipe/setuptools3_legacy.bbclass |   2 +-
 meta/conf/documentation.conf                  |   2 +-
 meta/recipes-bsp/u-boot/u-boot-tools.inc      |   2 +-
 meta/recipes-connectivity/connman/connman.inc |   4 +-
 .../inetutils/inetutils_2.5.bb                |   2 +-
 meta/recipes-core/coreutils/coreutils_9.5.bb  |   2 +-
 meta/recipes-core/glibc/glibc-package.inc     |   2 +-
 .../glibc/glibc-y2038-tests_2.40.bb           |   2 +-
 meta/recipes-core/meta/meta-environment.bb    |   2 +-
 meta/recipes-core/musl/musl_git.bb            |   2 +-
 meta/recipes-core/newlib/newlib.inc           |   2 +-
 meta/recipes-core/os-release/os-release.bb    |   2 +-
 meta/recipes-core/ovmf/ovmf-shell-image.bb    |   2 +-
 meta/recipes-core/ovmf/ovmf_git.bb            |   6 +-
 .../packagegroup-rust-cross-canadian.bb       |   2 +-
 meta/recipes-core/picolibc/picolibc.inc       |   2 +-
 .../binutils/binutils-2.43.1.inc              |   2 +-
 meta/recipes-devtools/cmake/cmake_3.30.2.bb   |   2 +-
 .../nativesdk-icecc-toolchain_0.1.bb          |   2 +-
 .../libtool/libtool-2.5.2.inc                 |   2 +-
 .../perl/libxml-parser-perl_2.47.bb           |   2 +-
 .../python/python3-attrs_24.2.0.bb            |   2 +-
 .../python/python3-pygobject_3.48.2.bb        |   2 +-
 .../recipes-devtools/python/python3_3.12.9.bb |   2 +-
 meta/recipes-devtools/rust/rust_1.79.0.bb     |   2 +-
 .../asciidoc/asciidoc_10.2.1.bb               |   2 +-
 .../baremetal-helloworld_git.bb               |   2 +-
 .../go-examples/go-helloworld_0.1.bb          |   2 +-
 meta/recipes-extended/gzip/gzip.inc           |   4 +-
 .../logrotate/logrotate_3.22.0.bb             |   2 +-
 .../perl/libxml-namespacesupport-perl_1.12.bb |   2 +-
 meta/recipes-extended/shadow/shadow.inc       |   2 +-
 meta/recipes-extended/timezone/timezone.inc   |   2 +-
 .../libadwaita/libadwaita_1.5.3.bb            |   2 +-
 meta/recipes-graphics/mesa/mesa.inc           |  26 +-
 .../xorg-lib/xcb-util-errors_1.0.1.bb         |   2 +-
 .../xorg-proto/xorgproto_2024.1.bb            |   2 +-
 .../cryptodev/cryptodev-module_1.14.bb        |   2 +-
 .../cryptodev/cryptodev-tests_1.14.bb         |   2 +-
 ...20240909.bb => linux-firmware_20250311.bb} | 869 +++++++++++++-----
 meta/recipes-kernel/linux/kernel-devsrc.bb    |   2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb  |   6 +-
 .../linux/linux-yocto-rt_6.10.bb              |   6 +-
 .../linux/linux-yocto-rt_6.6.bb               |   6 +-
 meta/recipes-kernel/linux/linux-yocto.inc     |   4 +-
 meta/recipes-kernel/linux/linux-yocto_6.10.bb |  12 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  |  12 +-
 .../lttng/lttng-modules_2.13.14.bb            |   2 +-
 .../make-mod-scripts/make-mod-scripts_1.0.bb  |   2 +-
 meta/recipes-kernel/perf/perf.bb              |   2 +-
 .../gstreamer/gstreamer1.0-meta-base.bb       |   4 +-
 meta/recipes-sato/l3afpad/l3afpad_git.bb      |   2 +-
 meta/recipes-support/apr/apr_1.7.5.bb         |   2 +-
 meta/recipes-support/gnutls/gnutls_3.8.6.bb   |   2 +-
 meta/recipes-support/gpgme/gpgme_1.23.2.bb    |   2 +-
 meta/recipes-support/vte/vte_0.76.3.bb        |   4 +-
 74 files changed, 783 insertions(+), 324 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20240909.bb => linux-firmware_20250311.bb} (66%)

-- 
2.39.5


