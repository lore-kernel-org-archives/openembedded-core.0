Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.7571.1624859967347878360
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 22:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mnp6YYaX;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id p4-20020a17090a9304b029016f3020d867so9696970pjo.3
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 22:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QUA4xEt++SMFYriuIfLU5NSOt33FZSxkZeNbmb4V7bs=;
        b=mnp6YYaXWP8PnjPGmbDzaLgPEpOBLjKCCrDMvFmoS5CKc/0m6rELnwmcCGrMOdTkXa
         +nbQKq9l9iSqr5/dQxfCNxe+jWlGDsxZ8aJ/7YwK/960pLwdDvb/7SHCbSq1g6oKKJqv
         zczpCg6jW/aMGGVZ0Un5VI0ohPf2zfEOADEdOgvGDkrdJfCGC3bgMv+LjkEnhDWWIVeB
         3P3pQHfl3Cgs9NVtLtzBt1QBjAOueYAJh3P5LMk95ft1o8gpmxgn8470zPrTFbg2Dt+K
         /DxmVaR5eRYfIWPJ60ndVCuD4tyzidytu+gvTXbOLqpOPoJDj2RGpJ2f0BlKhw5SG6Wo
         yxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QUA4xEt++SMFYriuIfLU5NSOt33FZSxkZeNbmb4V7bs=;
        b=PSobQKEy04URXAvjDxhXe37C724d1L6mNGNwkfMWWwEsVL5IgiF/KTLa95YdzBrfMY
         bzjqk3UtjP/zNDdoQ08tTBe7yC+6vLECamx+lIlHONmWZmv45d35/nPYcBE4yeAwww1H
         7cbQk53bh6NEurkaxHk8JP9jKFL8nLb7Ifi85j4cghdLWWoKha/Avkyua7+IrzwUVbcg
         bsqlpr8Lo3OuJvYXsOTZowomQAEQd6IKe2rulif7xty33LTBW4k9IrgTfLQVxdGzOnMd
         FlW5Fc4vmbcZCFWJtTymq8GpFV0gIemYUW5bTchKsSAU2iToB9vfcdPGSfpsfBXLKFMh
         Nrpg==
X-Gm-Message-State: AOAM531BfGcOx4RKvbinm+O5rvsfNjauQj0ga6EHTVLIEKlRLZ+8SoMO
	op80KZbxc08gnKWAcncfMAHAxHD24udwLQ==
X-Google-Smtp-Source: ABdhPJyyST3HHIsKV2hKPSrezL9PiRO49l8oIYm5FdjnYfgpcd299aAe9DzMxVTeDvj4Qjm2FUqPow==
X-Received: by 2002:a17:902:ead2:b029:122:55df:e51a with SMTP id p18-20020a170902ead2b029012255dfe51amr21264154pld.54.1624859965756;
        Sun, 27 Jun 2021 22:59:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b522])
        by smtp.gmail.com with ESMTPSA id c18sm12768912pgf.66.2021.06.27.22.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 22:59:24 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: persianpros <persianpros@yahoo.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 7/8] PEP8 double aggressive E301 ~ E306
Date: Sun, 27 Jun 2021 22:59:14 -0700
Message-Id: <20210628055915.1107-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210628055915.1107-1-raj.khem@gmail.com>
References: <20210628055915.1107-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: persianpros <persianpros@yahoo.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-selftest/lib/devtool/bbpath.py           |  7 ++++
 meta-selftest/lib/devtool/test.py             |  2 ++
 .../lib/oeqa/runtime/cases/dnf_runtime.py     |  1 +
 .../lib/oeqa/runtime/cases/selftest.py        |  1 +
 meta-selftest/lib/oeqa/runtime/cases/virgl.py |  1 +
 meta-selftest/lib/recipetool/bbpath.py        |  7 ++++
 meta/files/ext-sdk-prepare.py                 |  5 +++
 meta/lib/bblayers/create.py                   |  3 ++
 meta/lib/buildstats.py                        |  2 +-
 meta/lib/oe/buildhistory_analysis.py          |  7 ++++
 meta/lib/oe/cachedpath.py                     |  1 +
 meta/lib/oe/classextend.py                    |  4 +++
 meta/lib/oe/classutils.py                     |  3 ++
 meta/lib/oe/copy_buildsystem.py               |  7 ++++
 meta/lib/oe/cve_check.py                      |  2 ++
 meta/lib/oe/data.py                           |  2 ++
 meta/lib/oe/distro_check.py                   | 20 ++++++++++-
 meta/lib/oe/elf.py                            |  1 +
 meta/lib/oe/gpg_sign.py                       |  5 ++-
 meta/lib/oe/license.py                        | 19 ++++++++++
 meta/lib/oe/lsb.py                            |  5 +++
 meta/lib/oe/maketype.py                       |  7 ++++
 meta/lib/oe/manifest.py                       |  5 ++-
 meta/lib/oe/package.py                        | 10 ++++++
 meta/lib/oe/package_manager/__init__.py       | 10 +++++-
 meta/lib/oe/package_manager/deb/__init__.py   |  6 ++--
 meta/lib/oe/package_manager/deb/manifest.py   |  1 +
 meta/lib/oe/package_manager/deb/rootfs.py     |  3 +-
 meta/lib/oe/package_manager/deb/sdk.py        |  2 +-
 meta/lib/oe/package_manager/ipk/__init__.py   |  5 +--
 meta/lib/oe/package_manager/ipk/manifest.py   |  2 ++
 meta/lib/oe/package_manager/ipk/rootfs.py     |  6 ++++
 meta/lib/oe/package_manager/ipk/sdk.py        |  1 +
 meta/lib/oe/package_manager/rpm/__init__.py   |  5 +--
 meta/lib/oe/package_manager/rpm/manifest.py   |  2 ++
 meta/lib/oe/package_manager/rpm/rootfs.py     |  3 +-
 meta/lib/oe/package_manager/rpm/sdk.py        |  1 +
 meta/lib/oe/packagedata.py                    | 12 +++++++
 meta/lib/oe/packagegroup.py                   |  6 ++++
 meta/lib/oe/patch.py                          | 13 +++++--
 meta/lib/oe/path.py                           | 17 +++++++++
 meta/lib/oe/prservice.py                      |  5 +++
 meta/lib/oe/qa.py                             |  4 +++
 meta/lib/oe/recipeutils.py                    | 10 +++++-
 meta/lib/oe/reproducible.py                   |  6 ++++
 meta/lib/oe/rootfs.py                         |  7 ++--
 meta/lib/oe/sdk.py                            |  4 +++
 meta/lib/oe/sstatesig.py                      | 18 ++++++++++
 meta/lib/oe/terminal.py                       | 21 +++++++++++
 meta/lib/oe/types.py                          | 13 +++++++
 meta/lib/oe/useradd.py                        |  5 +++
 meta/lib/oe/utils.py                          | 35 +++++++++++++++++++
 meta/lib/oeqa/buildperf/base.py               |  2 --
 meta/lib/oeqa/buildperf/test_basic.py         |  1 +
 meta/lib/oeqa/controllers/masterimage.py      |  1 +
 meta/lib/oeqa/controllers/testtargetloader.py |  2 ++
 meta/lib/oeqa/core/case.py                    |  3 ++
 .../lib/oeqa/core/cases/example/test_basic.py |  2 ++
 meta/lib/oeqa/core/context.py                 |  4 +++
 meta/lib/oeqa/core/decorator/__init__.py      |  5 +++
 meta/lib/oeqa/core/decorator/data.py          | 16 +++++++++
 meta/lib/oeqa/core/decorator/depends.py       |  5 +++
 meta/lib/oeqa/core/decorator/oetimeout.py     |  2 ++
 meta/lib/oeqa/core/exception.py               |  7 ++++
 meta/lib/oeqa/core/loader.py                  |  4 ++-
 meta/lib/oeqa/core/runner.py                  |  7 ++++
 meta/lib/oeqa/core/target/__init__.py         |  1 +
 meta/lib/oeqa/core/target/qemu.py             |  1 +
 meta/lib/oeqa/core/target/ssh.py              |  4 +--
 meta/lib/oeqa/core/tests/cases/data.py        |  1 +
 meta/lib/oeqa/core/tests/cases/depends.py     |  1 +
 .../core/tests/cases/loader/valid/another.py  |  1 +
 meta/lib/oeqa/core/tests/cases/oetag.py       |  2 ++
 meta/lib/oeqa/core/tests/cases/timeout.py     |  2 +-
 meta/lib/oeqa/core/tests/common.py            |  2 ++
 meta/lib/oeqa/core/tests/test_data.py         |  2 ++
 meta/lib/oeqa/core/tests/test_decorators.py   |  4 +++
 meta/lib/oeqa/core/tests/test_loader.py       |  2 ++
 meta/lib/oeqa/core/tests/test_runner.py       |  2 ++
 meta/lib/oeqa/core/utils/concurrencytest.py   | 18 ++++++++++
 meta/lib/oeqa/core/utils/misc.py              |  7 ++++
 meta/lib/oeqa/core/utils/path.py              |  2 ++
 meta/lib/oeqa/core/utils/test.py              | 11 ++++++
 meta/lib/oeqa/oetest.py                       | 16 +++++++++
 meta/lib/oeqa/runexported.py                  |  5 +++
 meta/lib/oeqa/runtime/case.py                 |  1 +
 meta/lib/oeqa/runtime/cases/_qemutiny.py      |  1 +
 meta/lib/oeqa/runtime/cases/apt.py            |  2 ++
 meta/lib/oeqa/runtime/cases/boot.py           |  1 +
 meta/lib/oeqa/runtime/cases/buildcpio.py      |  1 +
 .../lib/oeqa/runtime/cases/buildgalculator.py |  1 +
 meta/lib/oeqa/runtime/cases/buildlzip.py      |  1 +
 meta/lib/oeqa/runtime/cases/connman.py        |  1 +
 meta/lib/oeqa/runtime/cases/date.py           |  1 +
 meta/lib/oeqa/runtime/cases/df.py             |  1 +
 meta/lib/oeqa/runtime/cases/dnf.py            |  3 ++
 .../oeqa/runtime/cases/ethernet_ip_connman.py |  1 +
 meta/lib/oeqa/runtime/cases/gcc.py            |  1 +
 meta/lib/oeqa/runtime/cases/gi.py             |  1 +
 meta/lib/oeqa/runtime/cases/gstreamer.py      |  1 +
 meta/lib/oeqa/runtime/cases/kernelmodule.py   |  1 +
 meta/lib/oeqa/runtime/cases/ksample.py        |  3 ++
 meta/lib/oeqa/runtime/cases/ldd.py            |  1 +
 meta/lib/oeqa/runtime/cases/logrotate.py      |  1 +
 meta/lib/oeqa/runtime/cases/ltp.py            |  3 +-
 meta/lib/oeqa/runtime/cases/ltp_compliance.py |  3 +-
 meta/lib/oeqa/runtime/cases/ltp_stress.py     |  4 +--
 meta/lib/oeqa/runtime/cases/multilib.py       |  1 +
 meta/lib/oeqa/runtime/cases/oe_syslog.py      |  5 ++-
 meta/lib/oeqa/runtime/cases/opkg.py           |  2 ++
 meta/lib/oeqa/runtime/cases/pam.py            |  1 +
 meta/lib/oeqa/runtime/cases/parselogs.py      |  1 +
 meta/lib/oeqa/runtime/cases/perl.py           |  1 +
 meta/lib/oeqa/runtime/cases/ping.py           |  1 +
 meta/lib/oeqa/runtime/cases/ptest.py          |  1 +
 meta/lib/oeqa/runtime/cases/python.py         |  1 +
 meta/lib/oeqa/runtime/cases/rpm.py            |  1 +
 meta/lib/oeqa/runtime/cases/rtc.py            |  1 +
 meta/lib/oeqa/runtime/cases/runlevel.py       |  1 +
 meta/lib/oeqa/runtime/cases/scons.py          |  1 +
 meta/lib/oeqa/runtime/cases/scp.py            |  1 +
 meta/lib/oeqa/runtime/cases/skeletoninit.py   |  1 +
 meta/lib/oeqa/runtime/cases/ssh.py            |  1 +
 meta/lib/oeqa/runtime/cases/stap.py           |  1 +
 meta/lib/oeqa/runtime/cases/storage.py        |  2 +-
 meta/lib/oeqa/runtime/cases/suspend.py        |  1 +
 meta/lib/oeqa/runtime/cases/systemd.py        |  3 ++
 meta/lib/oeqa/runtime/cases/terminal.py       |  1 +
 meta/lib/oeqa/runtime/cases/usb_hid.py        |  1 +
 meta/lib/oeqa/runtime/cases/weston.py         |  1 +
 meta/lib/oeqa/runtime/cases/x32lib.py         |  1 +
 meta/lib/oeqa/runtime/cases/xorg.py           |  1 +
 meta/lib/oeqa/runtime/context.py              |  3 ++
 meta/lib/oeqa/runtime/decorator/package.py    |  2 ++
 meta/lib/oeqa/runtime/loader.py               |  1 +
 .../oeqa/runtime/utils/targetbuildproject.py  |  1 +
 meta/lib/oeqa/sdk/case.py                     |  1 +
 meta/lib/oeqa/sdk/cases/assimp.py             |  1 +
 meta/lib/oeqa/sdk/cases/buildcpio.py          |  2 ++
 meta/lib/oeqa/sdk/cases/buildepoxy.py         |  2 ++
 meta/lib/oeqa/sdk/cases/buildgalculator.py    |  2 ++
 meta/lib/oeqa/sdk/cases/buildlzip.py          |  2 ++
 meta/lib/oeqa/sdk/cases/gcc.py                |  1 +
 meta/lib/oeqa/sdk/cases/perl.py               |  1 +
 meta/lib/oeqa/sdk/cases/python.py             |  2 ++
 meta/lib/oeqa/sdk/context.py                  |  3 ++
 meta/lib/oeqa/sdk/testsdk.py                  |  2 ++
 meta/lib/oeqa/sdk/utils/sdkbuildproject.py    |  1 +
 meta/lib/oeqa/sdkext/case.py                  |  1 +
 meta/lib/oeqa/sdkext/cases/devtool.py         |  2 ++
 meta/lib/oeqa/sdkext/context.py               |  3 ++
 meta/lib/oeqa/sdkext/testsdk.py               |  1 +
 meta/lib/oeqa/selftest/case.py                |  2 ++
 meta/lib/oeqa/selftest/cases/archiver.py      |  3 +-
 meta/lib/oeqa/selftest/cases/bblayers.py      |  1 +
 meta/lib/oeqa/selftest/cases/bbtests.py       |  2 +-
 meta/lib/oeqa/selftest/cases/binutils.py      |  2 ++
 meta/lib/oeqa/selftest/cases/buildoptions.py  |  6 ++++
 .../lib/oeqa/selftest/cases/containerimage.py |  2 ++
 meta/lib/oeqa/selftest/cases/cve_check.py     |  1 +
 meta/lib/oeqa/selftest/cases/devtool.py       | 15 ++++++--
 meta/lib/oeqa/selftest/cases/distrodata.py    |  1 +
 meta/lib/oeqa/selftest/cases/eSDK.py          |  1 +
 .../oeqa/selftest/cases/efibootpartition.py   |  1 +
 meta/lib/oeqa/selftest/cases/fetch.py         |  1 +
 meta/lib/oeqa/selftest/cases/fitimage.py      |  5 +--
 meta/lib/oeqa/selftest/cases/gcc.py           | 16 +++++++++
 meta/lib/oeqa/selftest/cases/glibc.py         |  4 +++
 meta/lib/oeqa/selftest/cases/image_typedep.py |  1 +
 meta/lib/oeqa/selftest/cases/imagefeatures.py |  2 +-
 .../oeqa/selftest/cases/incompatible_lic.py   |  3 ++
 .../oeqa/selftest/cases/kerneldevelopment.py  |  1 +
 meta/lib/oeqa/selftest/cases/layerappend.py   |  1 +
 meta/lib/oeqa/selftest/cases/liboe.py         |  1 +
 meta/lib/oeqa/selftest/cases/lic_checksum.py  |  1 +
 meta/lib/oeqa/selftest/cases/manifest.py      |  4 ++-
 meta/lib/oeqa/selftest/cases/meta_ide.py      |  1 +
 meta/lib/oeqa/selftest/cases/multiconfig.py   |  1 +
 .../oeqa/selftest/cases/oelib/buildhistory.py |  2 ++
 meta/lib/oeqa/selftest/cases/oelib/elf.py     |  1 +
 meta/lib/oeqa/selftest/cases/oelib/license.py |  5 +++
 meta/lib/oeqa/selftest/cases/oelib/path.py    |  1 +
 meta/lib/oeqa/selftest/cases/oelib/types.py   |  2 ++
 meta/lib/oeqa/selftest/cases/oelib/utils.py   |  2 ++
 meta/lib/oeqa/selftest/cases/oescripts.py     |  8 +++--
 meta/lib/oeqa/selftest/cases/package.py       |  3 ++
 meta/lib/oeqa/selftest/cases/pkgdata.py       |  1 +
 meta/lib/oeqa/selftest/cases/prservice.py     |  1 +
 meta/lib/oeqa/selftest/cases/pseudo.py        |  1 +
 meta/lib/oeqa/selftest/cases/recipetool.py    |  3 +-
 meta/lib/oeqa/selftest/cases/recipeutils.py   |  3 --
 meta/lib/oeqa/selftest/cases/reproducible.py  |  8 +++++
 .../oeqa/selftest/cases/resulttooltests.py    |  1 +
 meta/lib/oeqa/selftest/cases/runcmd.py        |  2 ++
 meta/lib/oeqa/selftest/cases/runqemu.py       |  3 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py  |  7 ++--
 meta/lib/oeqa/selftest/cases/selftest.py      |  3 ++
 meta/lib/oeqa/selftest/cases/signing.py       |  2 --
 meta/lib/oeqa/selftest/cases/sstatetests.py   | 10 +++---
 meta/lib/oeqa/selftest/cases/sysroot.py       |  1 +
 meta/lib/oeqa/selftest/cases/tinfoil.py       |  1 +
 meta/lib/oeqa/selftest/cases/wic.py           |  7 ++--
 meta/lib/oeqa/selftest/context.py             |  5 +++
 meta/lib/oeqa/targetcontrol.py                |  2 +-
 meta/lib/oeqa/utils/__init__.py               |  5 +++
 meta/lib/oeqa/utils/buildproject.py           |  1 +
 meta/lib/oeqa/utils/commands.py               |  8 ++++-
 meta/lib/oeqa/utils/decorators.py             | 19 ++++++++++
 meta/lib/oeqa/utils/dump.py                   |  4 +++
 meta/lib/oeqa/utils/ftools.py                 |  4 +++
 meta/lib/oeqa/utils/git.py                    |  2 ++
 meta/lib/oeqa/utils/gitarchive.py             |  7 ++++
 meta/lib/oeqa/utils/httpserver.py             |  4 ++-
 meta/lib/oeqa/utils/logparser.py              |  2 ++
 meta/lib/oeqa/utils/metadata.py               |  5 +++
 meta/lib/oeqa/utils/network.py                |  1 +
 meta/lib/oeqa/utils/nfs.py                    |  1 +
 meta/lib/oeqa/utils/package_manager.py        | 11 ++++++
 meta/lib/oeqa/utils/qemurunner.py             |  5 +--
 meta/lib/oeqa/utils/qemutinyrunner.py         |  3 +-
 meta/lib/oeqa/utils/sshcontrol.py             |  4 +--
 meta/lib/oeqa/utils/subprocesstweak.py        |  2 ++
 meta/lib/oeqa/utils/targetbuild.py            |  2 ++
 meta/lib/oeqa/utils/testexport.py             |  3 ++
 meta/lib/rootfspostcommands.py                |  3 ++
 .../systemd/systemd-systemctl/systemctl       |  2 ++
 .../meson/meson/meson-setup.py                |  3 ++
 .../python/python3/create_manifest3.py        | 11 +++---
 .../python/python3/get_module_deps3.py        |  2 +-
 meta/recipes-rt/rt-tests/files/rt_bmark.py    | 16 +++++++++
 scripts/bitbake-whatchanged                   |  7 ++++
 scripts/buildhistory-collect-srcrevs          |  3 ++
 scripts/buildhistory-diff                     |  3 ++
 scripts/buildstats-diff                       |  2 ++
 scripts/combo-layer                           | 28 ++++++++++++++-
 scripts/contrib/bbvars.py                     |  5 +++
 scripts/contrib/devtool-stress.py             |  2 ++
 scripts/contrib/graph-tool                    |  1 +
 scripts/contrib/image-manifest                | 11 ++++++
 scripts/contrib/list-packageconfig-flags.py   |  8 +++++
 scripts/contrib/oe-build-perf-report-email.py |  1 +
 scripts/contrib/patchreview.py                |  5 +--
 scripts/contrib/verify-homepage.py            |  3 ++
 scripts/cp-noerror                            |  2 ++
 scripts/crosstap                              |  5 +++
 scripts/devtool                               |  5 ++-
 scripts/gen-lockedsig-cache                   |  8 +++++
 scripts/install-buildtools                    |  2 ++
 scripts/lib/argparse_oe.py                    |  5 +++
 scripts/lib/build_perf/__init__.py            |  1 +
 scripts/lib/build_perf/report.py              |  1 +
 scripts/lib/buildstats.py                     |  3 +-
 scripts/lib/checklayer/__init__.py            | 14 ++++++++
 scripts/lib/checklayer/case.py                |  1 +
 scripts/lib/checklayer/cases/bsp.py           |  4 ++-
 scripts/lib/checklayer/cases/common.py        |  1 +
 scripts/lib/checklayer/cases/distro.py        |  1 +
 scripts/lib/checklayer/context.py             |  1 +
 scripts/lib/devtool/__init__.py               | 17 +++++++++
 scripts/lib/devtool/build.py                  |  3 ++
 scripts/lib/devtool/build_image.py            |  4 +++
 scripts/lib/devtool/deploy.py                 |  3 +-
 scripts/lib/devtool/export.py                 |  3 +-
 scripts/lib/devtool/import.py                 |  2 ++
 scripts/lib/devtool/menuconfig.py             |  2 ++
 scripts/lib/devtool/package.py                |  2 ++
 scripts/lib/devtool/runqemu.py                |  2 ++
 scripts/lib/devtool/sdk.py                    |  9 +++++
 scripts/lib/devtool/search.py                 |  3 +-
 scripts/lib/devtool/standard.py               | 23 ++++++++++++
 scripts/lib/devtool/upgrade.py                | 21 +++++++++++
 scripts/lib/devtool/utilcmds.py               |  1 +
 scripts/lib/recipetool/append.py              |  7 ++++
 scripts/lib/recipetool/create.py              | 21 +++++++++++
 scripts/lib/recipetool/create_buildsys.py     |  7 +++-
 scripts/lib/recipetool/create_kernel.py       |  3 ++
 scripts/lib/recipetool/create_kmod.py         |  2 ++
 scripts/lib/recipetool/create_npm.py          |  3 ++
 scripts/lib/recipetool/setvar.py              |  2 ++
 scripts/lib/resulttool/log.py                 |  4 +++
 scripts/lib/resulttool/manualexecution.py     |  4 +++
 scripts/lib/resulttool/merge.py               |  2 ++
 scripts/lib/resulttool/regression.py          |  6 ++++
 scripts/lib/resulttool/report.py              |  3 +-
 scripts/lib/resulttool/resultutils.py         | 16 +++++++++
 scripts/lib/resulttool/store.py               |  1 +
 scripts/lib/scriptpath.py                     |  2 ++
 scripts/lib/scriptutils.py                    |  9 +++++
 scripts/lib/wic/__init__.py                   |  1 +
 scripts/lib/wic/engine.py                     |  8 +++++
 scripts/lib/wic/filemap.py                    |  9 +++++
 scripts/lib/wic/help.py                       |  1 +
 scripts/lib/wic/ksparser.py                   | 10 +++++-
 scripts/lib/wic/misc.py                       |  9 +++++
 scripts/lib/wic/partition.py                  |  1 +
 scripts/lib/wic/pluginbase.py                 |  4 +++
 scripts/lib/wic/plugins/imager/direct.py      |  3 ++
 .../wic/plugins/source/bootimg-biosplusefi.py |  1 +
 scripts/lib/wic/plugins/source/bootimg-efi.py |  2 +-
 .../wic/plugins/source/bootimg-partition.py   |  3 +-
 .../lib/wic/plugins/source/bootimg-pcbios.py  |  1 +
 scripts/lib/wic/plugins/source/empty.py       |  1 +
 .../wic/plugins/source/isoimage-isohybrid.py  |  1 +
 scripts/lib/wic/plugins/source/rawcopy.py     |  1 +
 scripts/lib/wic/plugins/source/rootfs.py      |  1 +
 scripts/oe-build-perf-report                  |  8 ++---
 scripts/oe-build-perf-test                    |  1 +
 scripts/oe-depends-dot                        |  2 ++
 scripts/oe-git-archive                        |  3 ++
 scripts/oe-pkgdata-browser                    | 10 ++++++
 scripts/oe-pkgdata-util                       | 16 +++++++--
 scripts/oe-publish-sdk                        |  3 ++
 scripts/oe-selftest                           |  3 +-
 scripts/oe-test                               |  2 ++
 scripts/oe-trim-schemas                       |  3 ++
 scripts/oepydevshell-internal.py              |  4 +++
 .../pybootchartgui/pybootchartgui/batch.py    |  1 +
 scripts/pybootchartgui/pybootchartgui/draw.py | 27 ++++++++++++++
 scripts/pybootchartgui/pybootchartgui/gui.py  |  3 ++
 .../pybootchartgui/pybootchartgui/main.py.in  |  6 ++++
 .../pybootchartgui/pybootchartgui/parsing.py  | 28 ++++++++++++---
 .../pybootchartgui/process_tree.py            |  1 +
 .../pybootchartgui/pybootchartgui/samples.py  | 10 ++++++
 .../pybootchartgui/tests/parser_test.py       |  4 +++
 .../pybootchartgui/tests/process_tree_test.py |  2 ++
 scripts/pythondeps                            |  1 +
 scripts/recipetool                            |  2 ++
 scripts/relocate_sdk.py                       |  5 +++
 scripts/resulttool                            |  2 ++
 scripts/runqemu                               | 10 +++++-
 scripts/send-error-report                     |  7 ++--
 scripts/sysroot-relativelinks.py              |  2 ++
 scripts/task-time                             |  7 ++++
 scripts/test-remote-image                     | 10 ++++--
 scripts/tiny/dirsize.py                       |  1 +
 scripts/tiny/ksize.py                         |  1 +
 scripts/tiny/ksum.py                          | 10 ++++++
 scripts/verify-bashisms                       |  6 +++-
 scripts/wic                                   | 16 +++++++++
 scripts/yocto-check-layer                     |  4 +++
 340 files changed, 1367 insertions(+), 121 deletions(-)

diff --git a/meta-selftest/lib/devtool/bbpath.py b/meta-selftest/lib/devtool/bbpath.py
index 973ed779af..40be57a69e 100644
--- a/meta-selftest/lib/devtool/bbpath.py
+++ b/meta-selftest/lib/devtool/bbpath.py
@@ -3,27 +3,34 @@ import argparse
 already_loaded = False
 kept_context = None
 
+
 def plugin_name(filename):
     return os.path.splitext(os.path.basename(filename))[0]
 
+
 def plugin_init(plugins):
     global already_loaded
     already_loaded = plugin_name(__file__) in (plugin_name(p.__name__) for p in plugins)
 
+
 def print_name(args, config, basepath, workspace):
     print(__file__)
 
+
 def print_bbdir(args, config, basepath, workspace):
     print(__file__.replace('/lib/devtool/bbpath.py', ''))
 
+
 def print_registered(args, config, basepath, workspace):
     global kept_context
     print(kept_context.loaded)
 
+
 def multiloaded(args, config, basepath, workspace):
     global already_loaded
     print("yes" if already_loaded else "no")
 
+
 def register_commands(subparsers, context):
     global kept_context
     kept_context = context
diff --git a/meta-selftest/lib/devtool/test.py b/meta-selftest/lib/devtool/test.py
index 31190f58e7..eac0d472c1 100644
--- a/meta-selftest/lib/devtool/test.py
+++ b/meta-selftest/lib/devtool/test.py
@@ -1,9 +1,11 @@
 import argparse
 
+
 def selftest_reverse(args, config, basepath, workspace):
     """Reverse the value passed to verify the plugin is executing."""
     print(args.value[::-1])
 
+
 def register_commands(subparsers, context):
     parser_build = subparsers.add_parser('selftest-reverse', help='Reverse value (for selftest)',
                                          formatter_class=argparse.ArgumentDefaultsHelpFormatter)
diff --git a/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
index fcd6ae313c..6507f401b1 100644
--- a/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
+++ b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
@@ -3,6 +3,7 @@ from oeqa.runtime.cases.dnf import DnfTest
 from oeqa.utils.httpserver import HTTPService
 from oeqa.core.decorator.data import skipIfDataVar
 
+
 class DnfSelftest(DnfTest):
 
     @classmethod
diff --git a/meta-selftest/lib/oeqa/runtime/cases/selftest.py b/meta-selftest/lib/oeqa/runtime/cases/selftest.py
index 19de740623..a61ebfc6c5 100644
--- a/meta-selftest/lib/oeqa/runtime/cases/selftest.py
+++ b/meta-selftest/lib/oeqa/runtime/cases/selftest.py
@@ -1,6 +1,7 @@
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 
+
 class Selftest(OERuntimeTestCase):
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
diff --git a/meta-selftest/lib/oeqa/runtime/cases/virgl.py b/meta-selftest/lib/oeqa/runtime/cases/virgl.py
index e3b6fe1d80..346e63cce3 100644
--- a/meta-selftest/lib/oeqa/runtime/cases/virgl.py
+++ b/meta-selftest/lib/oeqa/runtime/cases/virgl.py
@@ -3,6 +3,7 @@ from oeqa.core.decorator.depends import OETestDepends
 import subprocess
 import oe.lsb
 
+
 class VirglTest(OERuntimeTestCase):
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
diff --git a/meta-selftest/lib/recipetool/bbpath.py b/meta-selftest/lib/recipetool/bbpath.py
index d0df800c3d..ae129c62a8 100644
--- a/meta-selftest/lib/recipetool/bbpath.py
+++ b/meta-selftest/lib/recipetool/bbpath.py
@@ -3,28 +3,35 @@ import argparse
 already_loaded = False
 register_count = 0
 
+
 def plugin_name(filename):
     return os.path.splitext(os.path.basename(filename))[0]
 
+
 def plugin_init(plugins):
     global already_loaded
     already_loaded = plugin_name(__file__) in (plugin_name(p.__name__) for p in plugins)
 
+
 def print_name(opts):
     print(__file__)
 
+
 def print_bbdir(opts):
     print(__file__.replace('/lib/recipetool/bbpath.py', ''))
 
+
 def print_registered(opts):
     #global kept_context
     #print(kept_context.loaded)
     print("1")
 
+
 def multiloaded(opts):
     global already_loaded
     print("yes" if already_loaded else "no")
 
+
 def register_commands(subparsers):
     global register_count
     register_count += 1
diff --git a/meta/files/ext-sdk-prepare.py b/meta/files/ext-sdk-prepare.py
index d191e5e19c..2b4a43ead9 100644
--- a/meta/files/ext-sdk-prepare.py
+++ b/meta/files/ext-sdk-prepare.py
@@ -7,9 +7,11 @@ import os
 import subprocess
 import signal
 
+
 def reenable_sigint():
     signal.signal(signal.SIGINT, signal.SIG_DFL)
 
+
 def run_command_interruptible(cmd):
     """
     Run a command with output displayed on the console, but ensure any Ctrl+C is
@@ -22,6 +24,7 @@ def run_command_interruptible(cmd):
         signal.signal(signal.SIGINT, signal.SIG_DFL)
     return ret
 
+
 def get_last_consolelog():
     '''Return the most recent console log file'''
     logdir = os.path.join(os.path.dirname(os.path.realpath(__file__)), 'tmp', 'log', 'cooker')
@@ -35,6 +38,7 @@ def get_last_consolelog():
                 return os.path.join(logdir, logfiles[-1])
     return None
 
+
 def main():
     if len(sys.argv) < 2:
         print('Please specify output log file')
@@ -81,6 +85,7 @@ def main():
             print('ERROR: SDK preparation failed: error log written to %s' % logfile)
             return ret
 
+
 if __name__ == "__main__":
     try:
         ret = main()
diff --git a/meta/lib/bblayers/create.py b/meta/lib/bblayers/create.py
index 06e1f6d342..f5af56f215 100644
--- a/meta/lib/bblayers/create.py
+++ b/meta/lib/bblayers/create.py
@@ -13,15 +13,18 @@ from bblayers.common import LayerPlugin
 
 logger = logging.getLogger('bitbake-layers')
 
+
 def plugin_init(plugins):
     return CreatePlugin()
 
+
 def read_template(template, template_dir='templates'):
     lines = str()
     with open(os.path.join(os.path.dirname(__file__), template_dir, template)) as fd:
         lines = ''.join(fd.readlines())
     return lines
 
+
 class CreatePlugin(LayerPlugin):
     def do_create_layer(self, args):
         """Create a basic layer"""
diff --git a/meta/lib/buildstats.py b/meta/lib/buildstats.py
index 27bff9dda6..b10712886e 100644
--- a/meta/lib/buildstats.py
+++ b/meta/lib/buildstats.py
@@ -9,6 +9,7 @@ import time
 import re
 import bb.event
 
+
 class SystemStats:
     def __init__(self, d):
         bn = d.getVar('BUILDNAME')
@@ -103,7 +104,6 @@ class SystemStats:
         self.diskstats_data = diskdata
         return reduced
 
-
     def _reduce_nop(self, time, data):
         return (time, data)
 
diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index 44b02c1ae0..e74de876e0 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -41,6 +41,7 @@ colours = {
     'colour_remove': '',
 }
 
+
 def init_colours(use_colours):
     global colours
     if use_colours:
@@ -56,6 +57,7 @@ def init_colours(use_colours):
             'colour_remove': '',
         }
 
+
 class ChangeRecord:
     def __init__(self, path, fieldname, oldvalue, newvalue, monitored):
         self.path = path
@@ -206,6 +208,7 @@ class ChangeRecord:
 
         return '%s%s' % (prefix, out) if out else ''
 
+
 class FileChange:
     changetype_add = 'A'
     changetype_remove = 'R'
@@ -257,6 +260,7 @@ class FileChange:
         else:
             return '%s changed (unknown)' % self.path
 
+
 def blob_to_dict(blob):
     alines = [line for line in blob.data_stream.read().decode('utf-8').splitlines()]
     adict = {}
@@ -283,8 +287,10 @@ def file_list_to_dict(lines):
             adict[path] = splitv[0:3]
     return adict
 
+
 numeric_removal = str.maketrans('0123456789', 'XXXXXXXXXX')
 
+
 def compare_file_lists(alines, blines, compare_ownership=True):
     adict = file_list_to_dict(alines)
     bdict = file_list_to_dict(blines)
@@ -523,6 +529,7 @@ def compare_siglists(a_blob, b_blob, taskdiff=False):
     blines = b_blob.data_stream.read().decode('utf-8').splitlines()
     keys = []
     pnmap = {}
+
     def readsigs(lines):
         sigs = {}
         for line in lines:
diff --git a/meta/lib/oe/cachedpath.py b/meta/lib/oe/cachedpath.py
index 607421e29d..a94b03f6d2 100644
--- a/meta/lib/oe/cachedpath.py
+++ b/meta/lib/oe/cachedpath.py
@@ -10,6 +10,7 @@ import os
 import errno
 import stat as statmod
 
+
 class CachedPath(object):
     def __init__(self):
         self.statcache = {}
diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
index d5f252c63e..d7dea36a1b 100644
--- a/meta/lib/oe/classextend.py
+++ b/meta/lib/oe/classextend.py
@@ -4,15 +4,18 @@
 
 import collections
 
+
 def get_packages(d):
     pkgs = d.getVar("PACKAGES_NONML")
     extcls = d.getVar("EXTENDERCLASS")
     return extcls.rename_packages_internal(pkgs)
 
+
 def get_depends(varprefix, d):
     extcls = d.getVar("EXTENDERCLASS")
     return extcls.map_depends_variable(varprefix + "_NONML")
 
+
 class ClassExtender(object):
     def __init__(self, extname, d):
         self.extname = extname
@@ -144,6 +147,7 @@ class ClassExtender(object):
             for subs in variables:
                 self.d.renameVar("%s_%s" % (subs, pkg_mapping[0]), "%s_%s" % (subs, pkg_mapping[1]))
 
+
 class NativesdkClassExtender(ClassExtender):
     def map_depends(self, dep):
         if dep.startswith(self.extname):
diff --git a/meta/lib/oe/classutils.py b/meta/lib/oe/classutils.py
index 08bb66b365..4169baaef3 100644
--- a/meta/lib/oe/classutils.py
+++ b/meta/lib/oe/classutils.py
@@ -2,12 +2,14 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+
 class ClassRegistryMeta(type):
     """Give each ClassRegistry their own registry"""
     def __init__(cls, name, bases, attrs):
         cls.registry = {}
         type.__init__(cls, name, bases, attrs)
 
+
 class ClassRegistry(type, metaclass=ClassRegistryMeta):
     """Maintain a registry of classes, indexed by name.
 
@@ -22,6 +24,7 @@ Subclasses of ClassRegistry may define an 'implemented' property to exert
 control over whether the class will be added to the registry (e.g. to keep
 abstract base classes out of the registry)."""
     priority = 0
+
     def __init__(cls, name, bases, attrs):
         super(ClassRegistry, cls).__init__(name, bases, attrs)
         try:
diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index 5bd087060c..790dcefc5e 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -13,6 +13,7 @@
 import stat
 import shutil
 
+
 def _smart_copy(src, dest):
     import subprocess
     # smart_copy will choose the correct function depending on whether the
@@ -27,6 +28,7 @@ def _smart_copy(src, dest):
         shutil.copyfile(src, dest)
         shutil.copymode(src, dest)
 
+
 class BuildSystem(object):
     def __init__(self, context, d):
         self.d = d
@@ -169,12 +171,14 @@ class BuildSystem(object):
 
         return copied_corebase, layers_copied
 
+
 def generate_locked_sigs(sigfile, d):
     bb.utils.mkdirhier(os.path.dirname(sigfile))
     depd = d.getVar('BB_TASKDEPDATA', False)
     tasks = ['%s:%s' % (v[2], v[1]) for v in depd.values()]
     bb.parse.siggen.dump_lockedsigs(sigfile, tasks)
 
+
 def prune_lockedsigs(excluded_tasks, excluded_targets, lockedsigs, onlynative, pruned_output):
     with open(lockedsigs, 'r') as infile:
         bb.utils.mkdirhier(os.path.dirname(pruned_output))
@@ -197,6 +201,7 @@ def prune_lockedsigs(excluded_tasks, excluded_targets, lockedsigs, onlynative, p
                     invalue = True
                     f.write(line)
 
+
 def merge_lockedsigs(copy_tasks, lockedsigs_main, lockedsigs_extra, merged_output, copy_output=None):
     merged = {}
     arch_order = []
@@ -252,6 +257,7 @@ def merge_lockedsigs(copy_tasks, lockedsigs_main, lockedsigs_extra, merged_outpu
     if merged_output:
         write_sigs_file(merged_output, arch_order, merged)
 
+
 def create_locked_sstate_cache(lockedsigs, input_sstate_cache, output_sstate_cache, d, fixedlsbstring="", filterfile=None):
     import shutil
     bb.note('Generating sstate-cache...')
@@ -273,6 +279,7 @@ def create_locked_sstate_cache(lockedsigs, input_sstate_cache, output_sstate_cac
                         bb.utils.mkdirhier(os.path.dirname(dest))
                         shutil.move(src, dest)
 
+
 def check_sstate_task_list(d, targets, filteroutfile, cmdprefix='', cwd=None, logfile=None):
     import subprocess
 
diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index cb4c86cf29..efeae3db48 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -7,6 +7,7 @@ _Version = collections.namedtuple(
     "_Version", ["release", "patch_l", "pre_l", "pre_v"]
 )
 
+
 @functools.total_ordering
 class Version():
 
@@ -50,6 +51,7 @@ class Version():
             return NotImplemented
         return self._key > other._key
 
+
 def _cmpkey(release, patch_l, pre_l, pre_v):
     # remove leading 0
     _release = tuple(
diff --git a/meta/lib/oe/data.py b/meta/lib/oe/data.py
index a340ce3b1b..995f7166d6 100644
--- a/meta/lib/oe/data.py
+++ b/meta/lib/oe/data.py
@@ -5,6 +5,7 @@
 import json
 import oe.maketype
 
+
 def typed_value(key, d):
     """Construct a value for the specified metadata variable, using its flags
     to determine the type and parameters for construction."""
@@ -21,6 +22,7 @@ def typed_value(key, d):
     except (TypeError, ValueError) as exc:
         bb.msg.fatal("Data", "%s: %s" % (key, str(exc)))
 
+
 def export2json(d, json_file, expand=True, searchString="", replaceString=""):
     data2export = {}
     keys2export = []
diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index 213c9e66e1..24b875d616 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -2,6 +2,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+
 def create_socket(url, d):
     import urllib
     from bb.utils import export_proxies
@@ -9,6 +10,7 @@ def create_socket(url, d):
     export_proxies(d)
     return urllib.request.urlopen(url)
 
+
 def get_links_from_url(url, d):
     "Return all the href links found on the web location"
 
@@ -20,6 +22,7 @@ def get_links_from_url(url, d):
         hyperlinks.append(line['href'].strip('/'))
     return hyperlinks
 
+
 def find_latest_numeric_release(url, d):
     "Find the latest listed numeric release on the given url"
     max = 0
@@ -35,10 +38,12 @@ def find_latest_numeric_release(url, d):
             maxstr = link
     return maxstr
 
+
 def is_src_rpm(name):
     "Check if the link is pointing to a src.rpm file"
     return name.endswith(".src.rpm")
 
+
 def package_name_from_srpm(srpm):
     "Strip out the package name from the src.rpm filename"
 
@@ -47,6 +52,7 @@ def package_name_from_srpm(srpm):
     (name, version, release) = srpm.replace(".src.rpm", "").rsplit("-", 2)
     return name
 
+
 def get_source_package_list_from_url(url, section, d):
     "Return a sectioned list of package names from a URL list"
 
@@ -60,6 +66,7 @@ def get_source_package_list_from_url(url, section, d):
        new_pkgs.add(pkgs + ":" + section)
     return new_pkgs
 
+
 def get_source_package_list_from_url_by_letter(url, section, d):
     import string
     from urllib.error import HTTPError
@@ -73,6 +80,7 @@ def get_source_package_list_from_url_by_letter(url, section, d):
                 raise
     return packages
 
+
 def get_latest_released_fedora_source_package_list(d):
     "Returns list of all the name os packages in the latest fedora distro"
     latest = find_latest_numeric_release("http://archive.fedoraproject.org/pub/fedora/linux/releases/", d)
@@ -80,6 +88,7 @@ def get_latest_released_fedora_source_package_list(d):
     package_names |= get_source_package_list_from_url_by_letter("http://archive.fedoraproject.org/pub/fedora/linux/updates/%s/SRPMS/" % latest, "updates", d)
     return latest, package_names
 
+
 def get_latest_released_opensuse_source_package_list(d):
     "Returns list of all the name os packages in the latest opensuse distro"
     latest = find_latest_numeric_release("http://download.opensuse.org/source/distribution/leap", d)
@@ -88,11 +97,13 @@ def get_latest_released_opensuse_source_package_list(d):
     package_names |= get_source_package_list_from_url("http://download.opensuse.org/update/leap/%s/oss/src/" % latest, "updates", d)
     return latest, package_names
 
+
 def get_latest_released_clear_source_package_list(d):
     latest = find_latest_numeric_release("https://download.clearlinux.org/releases/", d)
     package_names = get_source_package_list_from_url("https://download.clearlinux.org/releases/%s/clear/source/SRPMS/" % latest, "main", d)
     return latest, package_names
 
+
 def find_latest_debian_release(url, d):
     "Find the latest listed debian release on the given url"
 
@@ -105,6 +116,7 @@ def find_latest_debian_release(url, d):
     except:
         return "_NotFound_"
 
+
 def get_debian_style_source_package_list(url, section, d):
     "Return the list of package-names stored in the debian style Sources.gz file"
     import gzip
@@ -116,6 +128,7 @@ def get_debian_style_source_package_list(url, section, d):
             package_names.add(pkg + ":" + section)
     return package_names
 
+
 def get_latest_released_debian_source_package_list(d):
     "Returns list of all the name of packages in the latest debian distro"
     latest = find_latest_debian_release("http://ftp.debian.org/debian/dists/", d)
@@ -125,6 +138,7 @@ def get_latest_released_debian_source_package_list(d):
     package_names |= get_debian_style_source_package_list(url, "updates", d)
     return latest, package_names
 
+
 def find_latest_ubuntu_release(url, d):
     """
     Find the latest listed Ubuntu release on the given ubuntu/dists/ URL.
@@ -139,6 +153,7 @@ def find_latest_ubuntu_release(url, d):
             return distro
     return "_NotFound_"
 
+
 def get_latest_released_ubuntu_source_package_list(d):
     "Returns list of all the name os packages in the latest ubuntu distro"
     latest = find_latest_ubuntu_release("http://archive.ubuntu.com/ubuntu/dists/", d)
@@ -148,6 +163,7 @@ def get_latest_released_ubuntu_source_package_list(d):
     package_names |= get_debian_style_source_package_list(url, "updates", d)
     return latest, package_names
 
+
 def create_distro_packages_list(distro_check_dir, d):
     import shutil
 
@@ -177,6 +193,7 @@ def create_distro_packages_list(distro_check_dir, d):
             for pkg in sorted(package_list):
                 f.write(pkg + "\n")
 
+
 def update_distro_data(distro_check_dir, datetime, d):
     """
     If distro packages list data is old then rebuild it.
@@ -190,7 +207,6 @@ def update_distro_data(distro_check_dir, datetime, d):
         except OSError:
             raise Exception('Unable to create directory %s' % (distro_check_dir))
 
-
     datetime_file = os.path.join(distro_check_dir, "build_datetime")
     saved_datetime = "_invalid_"
     import fcntl
@@ -214,6 +230,7 @@ def update_distro_data(distro_check_dir, datetime, d):
         fcntl.lockf(f, fcntl.LOCK_UN)
         f.close()
 
+
 def compare_in_distro_packages_list(distro_check_dir, d):
     if not os.path.isdir(distro_check_dir):
         raise Exception("compare_in_distro_packages_list: invalid distro_check_dir passed")
@@ -278,6 +295,7 @@ def compare_in_distro_packages_list(distro_check_dir, d):
     bb.note("Matching: %s" % matching_distros)
     return matching_distros
 
+
 def create_log_file(d, logname):
     logpath = d.getVar('LOG_DIR')
     bb.utils.mkdirhier(logpath)
diff --git a/meta/lib/oe/elf.py b/meta/lib/oe/elf.py
index b307e4a651..5e8be92592 100644
--- a/meta/lib/oe/elf.py
+++ b/meta/lib/oe/elf.py
@@ -2,6 +2,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+
 def machine_dict(d):
 #           TARGET_OS  TARGET_ARCH   MACHINE, OSABI, ABIVERSION, Little Endian, 32bit?
     machdata = {
diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index 805cedd963..9cd7968da1 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -9,8 +9,10 @@ import bb
 import subprocess
 import shlex
 
+
 class LocalSigner(object):
     """Class for handling local (on the build host) signing"""
+
     def __init__(self, d):
         self.gpg_bin = d.getVar('GPG_BIN') or \
                   bb.utils.which(os.getenv('PATH'), 'gpg')
@@ -25,7 +27,6 @@ class LocalSigner(object):
         self.rpm_bin = bb.utils.which(os.getenv('PATH'), "rpmsign")
         self.gpg_version = self.get_gpg_version()
 
-
     def export_pubkey(self, output_file, keyid, armor=True):
         """Export GPG public key to a file"""
         cmd = self.gpg_cmd + ["--no-permission-warning", "--batch", "--yes", "--export", "-o", output_file]
@@ -98,7 +99,6 @@ class LocalSigner(object):
             bb.error("OS error (%s): %s" % (e.errno, e.strerror))
             raise Exception("Failed to sign '%s" % input_file)
 
-
     def get_gpg_version(self):
         """Return the gpg version as a tuple of ints"""
         try:
@@ -108,7 +108,6 @@ class LocalSigner(object):
         except subprocess.CalledProcessError as e:
             bb.fatal("Could not get gpg version: %s" % e)
 
-
     def verify(self, sig_file):
         """Verify signature"""
         cmd = self.gpg_cmd + ["--verify", "--no-permission-warning"]
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 7aefeaaae0..98e65c32be 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -7,6 +7,7 @@ import ast
 import re
 from fnmatch import fnmatchcase as fnmatch
 
+
 def license_ok(license, dont_want_licenses):
     """ Return False if License exist in dont_want_licenses else True """
     for dwl in dont_want_licenses:
@@ -14,9 +15,11 @@ def license_ok(license, dont_want_licenses):
             return False
     return True
 
+
 class LicenseError(Exception):
     pass
 
+
 class LicenseSyntaxError(LicenseError):
     def __init__(self, licensestr, exc):
         self.licensestr = licensestr
@@ -26,6 +29,7 @@ class LicenseSyntaxError(LicenseError):
     def __str__(self):
         return "error in '%s': %s" % (self.licensestr, self.exc)
 
+
 class InvalidLicense(LicenseError):
     def __init__(self, license):
         self.license = license
@@ -34,12 +38,15 @@ class InvalidLicense(LicenseError):
     def __str__(self):
         return "invalid characters in license '%s'" % self.license
 
+
 license_operator_chars = '&|() '
 license_operator = re.compile(r'([' + license_operator_chars + '])')
 license_pattern = re.compile(r'[a-zA-Z0-9.+_\-]+$')
 
+
 class LicenseVisitor(ast.NodeVisitor):
     """Get elements based on OpenEmbedded license strings"""
+
     def get_elements(self, licensestr):
         new_elements = []
         elements = list([x for x in license_operator.split(licensestr) if x.strip()])
@@ -56,16 +63,20 @@ class LicenseVisitor(ast.NodeVisitor):
 
     """Syntax tree visitor which can accept elements previously generated with
     OpenEmbedded license string"""
+
     def visit_elements(self, elements):
         self.visit(ast.parse(' '.join(elements)))
 
     """Syntax tree visitor which can accept OpenEmbedded license strings"""
+
     def visit_string(self, licensestr):
         self.visit_elements(self.get_elements(licensestr))
 
+
 class FlattenVisitor(LicenseVisitor):
     """Flatten a license tree (parsed from a string) by selecting one of each
     set of OR options, in the way the user specifies"""
+
     def __init__(self, choose_licenses):
         self.choose_licenses = choose_licenses
         self.licenses = []
@@ -87,6 +98,7 @@ class FlattenVisitor(LicenseVisitor):
         else:
             self.generic_visit(node)
 
+
 def flattened_licenses(licensestr, choose_licenses):
     """Given a license string and choose_licenses function, return a flat list of licenses"""
     flatten = FlattenVisitor(choose_licenses)
@@ -96,6 +108,7 @@ def flattened_licenses(licensestr, choose_licenses):
         raise LicenseSyntaxError(licensestr, exc)
     return flatten.licenses
 
+
 def is_included(licensestr, whitelist=None, blacklist=None):
     """Given a license string and whitelist and blacklist, determine if the
     license string matches the whitelist and does not match the blacklist.
@@ -142,9 +155,11 @@ def is_included(licensestr, whitelist=None, blacklist=None):
     else:
         return True, included
 
+
 class ManifestVisitor(LicenseVisitor):
     """Walk license tree (parsed from a string) removing the incompatible
     licenses specified"""
+
     def __init__(self, dont_want_licenses, canonical_license, d):
         self._dont_want_licenses = dont_want_licenses
         self._canonical_license = canonical_license
@@ -198,6 +213,7 @@ class ManifestVisitor(LicenseVisitor):
 
         self.generic_visit(node)
 
+
 def manifest_licenses(licensestr, dont_want_licenses, canonical_license, d):
     """Given a license string and dont_want_licenses list,
        return license string filtered and a list of licenses"""
@@ -219,14 +235,17 @@ def manifest_licenses(licensestr, dont_want_licenses, canonical_license, d):
 
     return (manifest.licensestr, manifest.licenses)
 
+
 class ListVisitor(LicenseVisitor):
     """Record all different licenses found in the license string"""
+
     def __init__(self):
         self.licenses = set()
 
     def visit_Str(self, node):
         self.licenses.add(node.s)
 
+
 def list_licenses(licensestr):
     """Simply get a list of all licenses mentioned in a license string.
        Binary operators are not applied or taken into account in any way"""
diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index fa540b48b3..f5ccddee3d 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -2,6 +2,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+
 def get_os_release():
     """Get all key-value pairs from /etc/os-release as a dict"""
     from collections import OrderedDict
@@ -17,6 +18,7 @@ def get_os_release():
                 data[key.strip()] = val.strip('"')
     return data
 
+
 def release_dict_osr():
     """ Populate a dict with pertinent values from /etc/os-release """
     data = {}
@@ -28,6 +30,7 @@ def release_dict_osr():
 
     return data
 
+
 def release_dict_lsb():
     """ Return the output of lsb_release -ir as a dictionary """
     from subprocess import PIPE
@@ -57,6 +60,7 @@ def release_dict_lsb():
 
     return data
 
+
 def release_dict_file():
     """ Try to gather release information manually when other methods fail """
     data = {}
@@ -89,6 +93,7 @@ def release_dict_file():
         return {}
     return data
 
+
 def distro_identifier(adjust_hook=None):
     """Return a distro identifier string based upon lsb_release -ri,
        with optional adjustment via a hook"""
diff --git a/meta/lib/oe/maketype.py b/meta/lib/oe/maketype.py
index d929c8b3e5..66d1cf6cce 100644
--- a/meta/lib/oe/maketype.py
+++ b/meta/lib/oe/maketype.py
@@ -19,9 +19,11 @@ except ImportError:
 
 available_types = {}
 
+
 class MissingFlag(TypeError):
     """A particular flag is required to construct the type, but has not been
     provided."""
+
     def __init__(self, flag, type):
         self.flag = flag
         self.type = type
@@ -30,6 +32,7 @@ class MissingFlag(TypeError):
     def __str__(self):
         return "Type '%s' requires flag '%s'" % (self.type, self.flag)
 
+
 def factory(var_type):
     """Return the factory for a specified type."""
     if var_type is None:
@@ -41,6 +44,7 @@ def factory(var_type):
         raise TypeError("Invalid type '%s':\n  Valid types: %s" %
                         (var_type, ', '.join(available_types)))
 
+
 def create(value, var_type, **flags):
     """Create an object of the specified type, given the specified flags and
     string value."""
@@ -55,6 +59,7 @@ def create(value, var_type, **flags):
 
     return obj(value, **objflags)
 
+
 def get_callable_args(obj):
     """Grab all but the first argument of the specified callable, returning
     the list, as well as a list of which of the arguments have default
@@ -76,6 +81,7 @@ def get_callable_args(obj):
         optional |= set(flaglist[-len(defaults):])
     return flaglist, optional
 
+
 def factory_setup(name, obj):
     """Prepare a factory for use."""
     args, optional = get_callable_args(obj)
@@ -89,6 +95,7 @@ def factory_setup(name, obj):
     if not hasattr(obj, 'name'):
         obj.name = name
 
+
 def register(name, factory):
     """Register a type, given its name and a factory callable.
 
diff --git a/meta/lib/oe/manifest.py b/meta/lib/oe/manifest.py
index 1a058dcd73..3f4224fed4 100644
--- a/meta/lib/oe/manifest.py
+++ b/meta/lib/oe/manifest.py
@@ -7,6 +7,7 @@ import os
 import re
 import bb
 
+
 class Manifest(object, metaclass=ABCMeta):
     """
     This is an abstract class. Do not instantiate this directly.
@@ -84,6 +85,7 @@ class Manifest(object, metaclass=ABCMeta):
     This creates a standard initial manifest for core-image-(minimal|sato|sato-sdk).
     This will be used for testing until the class is implemented properly!
     """
+
     def _create_dummy_initial(self):
         image_rootfs = self.d.getVar('IMAGE_ROOTFS')
         pkg_list = dict()
@@ -144,6 +146,7 @@ class Manifest(object, metaclass=ABCMeta):
     The following function parses an initial manifest and returns a dictionary
     object with the must install, attempt only, multilib and language packages.
     """
+
     def parse_initial_manifest(self):
         pkgs = dict()
 
@@ -175,6 +178,7 @@ class Manifest(object, metaclass=ABCMeta):
     This following function parses a full manifest and return a list
     object with packages.
     '''
+
     def parse_full_manifest(self):
         installed_pkgs = list()
         if not os.path.exists(self.full_manifest):
@@ -188,7 +192,6 @@ class Manifest(object, metaclass=ABCMeta):
         return installed_pkgs
 
 
-
 def create_manifest(d, final_manifest=False, manifest_dir=None,
                     manifest_type=Manifest.MANIFEST_TYPE_IMAGE):
     import importlib
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 9dd6aef641..0113f97b83 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -6,6 +6,7 @@ import stat
 import mmap
 import subprocess
 
+
 def runstrip(arg):
     # Function to strip a single file, called from split_and_strip_files below
     # A working 'file' (one which works on the target architecture)
@@ -51,11 +52,15 @@ def runstrip(arg):
         os.chmod(file, origmode)
 
 # Detect .ko module by searching for "vermagic=" string
+
+
 def is_kernel_module(path):
     with open(path) as f:
         return mmap.mmap(f.fileno(), 0, prot=mmap.PROT_READ).find(b"vermagic=") >= 0
 
 # Detect if .ko module is signed
+
+
 def is_kernel_module_signed(path):
     with open(path, "rb") as f:
         f.seek(-28, 2)
@@ -69,6 +74,8 @@ def is_kernel_module_signed(path):
 # 4 - executable
 # 8 - shared library
 # 16 - kernel module
+
+
 def is_elf(path):
     exec_type = 0
     result = subprocess.check_output(["file", "-b", path], stderr=subprocess.STDOUT).decode("utf-8")
@@ -86,6 +93,7 @@ def is_elf(path):
                 exec_type |= 16
     return (path, exec_type)
 
+
 def is_static_lib(path):
     if path.endswith('.a') and not os.path.islink(path):
         with open(path, 'rb') as fh:
@@ -96,6 +104,7 @@ def is_static_lib(path):
             return start == magic
     return False
 
+
 def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, d, qa_already_stripped=False):
     """
     Strip executable code (like executables, shared libraries) _in_place_
@@ -189,6 +198,7 @@ def file_translate(file):
     ft = ft.replace("_", "@underscore@")
     return ft
 
+
 def filedeprunner(arg):
     import re
     import subprocess
diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_manager/__init__.py
index 633c5c4bf2..9feae4b6c0 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -19,6 +19,8 @@ import hashlib
 import fnmatch
 
 # this can be used by all PM backends to create the index files in parallel
+
+
 def create_index(arg):
     index_cmd = arg
 
@@ -27,6 +29,7 @@ def create_index(arg):
     if result:
         bb.note(result)
 
+
 def opkg_query(cmd_output):
     """
     This method parse the output from the package managerand return
@@ -88,12 +91,14 @@ def opkg_query(cmd_output):
 
     return output
 
+
 def failed_postinsts_abort(pkgs, log_path):
     bb.fatal("""Postinstall scriptlets of %s have failed. If the intention is to defer them to first boot,
 then please place them into pkg_postinst_ontarget_${PN} ().
 Deferring to first boot via 'exit 1' is no longer supported.
 Details of the failure are in %s.""" % (pkgs, log_path))
 
+
 def generate_locale_archive(d, rootfs, target_arch, localedir):
     # Pretty sure we don't need this for locale archive generation but
     # keeping it to be safe...
@@ -140,6 +145,7 @@ def generate_locale_archive(d, rootfs, target_arch, localedir):
             cmd += ["--add-to-archive", path]
             subprocess.check_output(cmd, env=env, stderr=subprocess.STDOUT)
 
+
 class Indexer(object, metaclass=ABCMeta):
     def __init__(self, d, deploy_dir):
         self.d = d
@@ -149,6 +155,7 @@ class Indexer(object, metaclass=ABCMeta):
     def write_index(self):
         pass
 
+
 class PkgsList(object, metaclass=ABCMeta):
     def __init__(self, d, rootfs_dir):
         self.d = d
@@ -158,6 +165,7 @@ class PkgsList(object, metaclass=ABCMeta):
     def list_pkgs(self):
         pass
 
+
 class PackageManager(object, metaclass=ABCMeta):
     """
     This is an abstract class. Do not instantiate this directly.
@@ -212,7 +220,6 @@ class PackageManager(object, metaclass=ABCMeta):
                 # call the backend dependent handler
                 self._handle_intercept_failure(registered_pkgs)
 
-
     def run_intercepts(self, populate_sdk=None):
         intercepts_dir = self.intercepts_dir
 
@@ -451,6 +458,7 @@ class PackageManager(object, metaclass=ABCMeta):
             return res
         return _append(uris, base_paths)
 
+
 def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydependencies):
     """
     Go through our do_package_write_X dependencies and hardlink the packages we depend
diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/__init__.py
index 457e936862..9e99074eab 100644
--- a/meta/lib/oe/package_manager/deb/__init__.py
+++ b/meta/lib/oe/package_manager/deb/__init__.py
@@ -6,6 +6,7 @@ import re
 import subprocess
 from oe.package_manager import *
 
+
 class DpkgIndexer(Indexer):
     def _create_configs(self):
         bb.utils.mkdirhier(self.apt_conf_dir)
@@ -79,6 +80,7 @@ class DpkgIndexer(Indexer):
         if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
             raise NotImplementedError('Package feed signing not implementd for dpkg')
 
+
 class PMPkgsList(PkgsList):
 
     def list_pkgs(self):
@@ -96,6 +98,7 @@ class PMPkgsList(PkgsList):
 
         return opkg_query(cmd_output)
 
+
 class OpkgDpkgPM(PackageManager):
     def __init__(self, d, target_rootfs):
         """
@@ -163,6 +166,7 @@ class OpkgDpkgPM(PackageManager):
     def _handle_intercept_failure(self, registered_pkgs):
         self.mark_packages("unpacked", registered_pkgs.split())
 
+
 class DpkgPM(OpkgDpkgPM):
     def __init__(self, d, target_rootfs, archs, base_archs, apt_conf_dir=None, deb_repo_workdir="oe-rootfs-repo", filterbydependencies=True):
         super(DpkgPM, self).__init__(d, target_rootfs)
@@ -308,7 +312,6 @@ class DpkgPM(OpkgDpkgPM):
                     bb.utils.rename(os.path.join(root, file),
                               os.path.join(root, new_file))
 
-
     def remove(self, pkgs, with_dependencies=True):
         if not pkgs:
             return
@@ -348,7 +351,6 @@ class DpkgPM(OpkgDpkgPM):
         if feed_uris == "":
             return
 
-
         sources_conf = os.path.join("%s/etc/apt/sources.list"
                                     % self.target_rootfs)
         if not os.path.exists(os.path.dirname(sources_conf)):
diff --git a/meta/lib/oe/package_manager/deb/manifest.py b/meta/lib/oe/package_manager/deb/manifest.py
index d8eab24a06..23b24b0855 100644
--- a/meta/lib/oe/package_manager/deb/manifest.py
+++ b/meta/lib/oe/package_manager/deb/manifest.py
@@ -4,6 +4,7 @@
 
 from oe.manifest import Manifest
 
+
 class PkgManifest(Manifest):
     def create_initial(self):
         with open(self.initial_manifest, "w+") as manifest:
diff --git a/meta/lib/oe/package_manager/deb/rootfs.py b/meta/lib/oe/package_manager/deb/rootfs.py
index 56ed7e2359..8b293ea201 100644
--- a/meta/lib/oe/package_manager/deb/rootfs.py
+++ b/meta/lib/oe/package_manager/deb/rootfs.py
@@ -10,6 +10,7 @@ from oe.utils import execute_pre_post_process
 from oe.package_manager.deb.manifest import PkgManifest
 from oe.package_manager.deb import DpkgPM
 
+
 class DpkgOpkgRootfs(Rootfs):
     def __init__(self, d, progress_reporter=None, logcatcher=None):
         super(DpkgOpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
@@ -120,6 +121,7 @@ class DpkgOpkgRootfs(Rootfs):
 
             num += 1
 
+
 class PkgRootfs(DpkgOpkgRootfs):
     def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
         super(PkgRootfs, self).__init__(d, progress_reporter, logcatcher)
@@ -136,7 +138,6 @@ class PkgRootfs(DpkgOpkgRootfs):
                          d.getVar('PACKAGE_ARCHS'),
                          d.getVar('DPKG_ARCH'))
 
-
     def _create(self):
         pkgs_to_install = self.manifest.parse_initial_manifest()
         deb_pre_process_cmds = self.d.getVar('DEB_PREPROCESS_COMMANDS')
diff --git a/meta/lib/oe/package_manager/deb/sdk.py b/meta/lib/oe/package_manager/deb/sdk.py
index f4b0b6510a..cb5545e0ce 100644
--- a/meta/lib/oe/package_manager/deb/sdk.py
+++ b/meta/lib/oe/package_manager/deb/sdk.py
@@ -10,6 +10,7 @@ from oe.manifest import Manifest
 from oe.package_manager.deb import DpkgPM
 from oe.package_manager.deb.manifest import PkgManifest
 
+
 class PkgSdk(Sdk):
     def __init__(self, d, manifest_dir=None):
         super(PkgSdk, self).__init__(d, manifest_dir)
@@ -17,7 +18,6 @@ class PkgSdk(Sdk):
         self.target_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET"), "apt")
         self.host_conf_dir = os.path.join(self.d.getVar("APTCONF_TARGET"), "apt-sdk")
 
-
         self.target_manifest = PkgManifest(d, self.manifest_dir,
                                             Manifest.MANIFEST_TYPE_SDK_TARGET)
         self.host_manifest = PkgManifest(d, self.manifest_dir,
diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
index 504830cdec..0cea1b1942 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -7,6 +7,7 @@ import shutil
 import subprocess
 from oe.package_manager import *
 
+
 class OpkgIndexer(Indexer):
     def write_index(self):
         arch_vars = ["ALL_MULTILIB_PACKAGE_ARCHS",
@@ -59,6 +60,7 @@ class OpkgIndexer(Indexer):
                                    self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE'),
                                    armor=is_ascii_sig)
 
+
 class PMPkgsList(PkgsList):
     def __init__(self, d, rootfs_dir):
         super(PMPkgsList, self).__init__(d, rootfs_dir)
@@ -87,7 +89,6 @@ class PMPkgsList(PkgsList):
         return opkg_query(cmd_output)
 
 
-
 class OpkgDpkgPM(PackageManager):
     def __init__(self, d, target_rootfs):
         """
@@ -155,6 +156,7 @@ class OpkgDpkgPM(PackageManager):
     def _handle_intercept_failure(self, registered_pkgs):
         self.mark_packages("unpacked", registered_pkgs.split())
 
+
 class OpkgPM(OpkgDpkgPM):
     def __init__(self, d, target_rootfs, config_file, archs, task_name='target', ipk_repo_workdir="oe-rootfs-repo", filterbydependencies=True, prepare_index=True):
         super(OpkgPM, self).__init__(d, target_rootfs)
@@ -265,7 +267,6 @@ class OpkgPM(OpkgDpkgPM):
                             cfg_file.write("option lists_dir    %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'lists'))
                             cfg_file.write("option status_file  %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'status'))
 
-
     def _create_config(self):
         with open(self.config_file, "w+") as config_file:
             priority = 1
diff --git a/meta/lib/oe/package_manager/ipk/manifest.py b/meta/lib/oe/package_manager/ipk/manifest.py
index ee4b57bcb0..5700d8e2e1 100644
--- a/meta/lib/oe/package_manager/ipk/manifest.py
+++ b/meta/lib/oe/package_manager/ipk/manifest.py
@@ -4,10 +4,12 @@
 
 from oe.manifest import Manifest
 
+
 class PkgManifest(Manifest):
     """
     Returns a dictionary object with mip and mlp packages.
     """
+
     def _split_multilib(self, pkg_list):
         pkgs = dict()
 
diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py b/meta/lib/oe/package_manager/ipk/rootfs.py
index 077c061c91..8033ee2020 100644
--- a/meta/lib/oe/package_manager/ipk/rootfs.py
+++ b/meta/lib/oe/package_manager/ipk/rootfs.py
@@ -11,6 +11,7 @@ from oe.utils import execute_pre_post_process
 from oe.package_manager.ipk.manifest import PkgManifest
 from oe.package_manager.ipk import OpkgPM
 
+
 class DpkgOpkgRootfs(Rootfs):
     def __init__(self, d, progress_reporter=None, logcatcher=None):
         super(DpkgOpkgRootfs, self).__init__(d, progress_reporter, logcatcher)
@@ -121,6 +122,7 @@ class DpkgOpkgRootfs(Rootfs):
 
             num += 1
 
+
 class PkgRootfs(DpkgOpkgRootfs):
     def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
         super(PkgRootfs, self).__init__(d, progress_reporter, logcatcher)
@@ -173,6 +175,7 @@ class PkgRootfs(DpkgOpkgRootfs):
          creation and the file has been changed, so we need to
          prelink the other one and compare them.
     '''
+
     def _file_equal(self, key, f1, f2):
 
         # Both of them are not prelinked
@@ -198,6 +201,7 @@ class PkgRootfs(DpkgOpkgRootfs):
     See commit: "image.bbclass: Added variables for multilib support." by
     Lianhao Lu.
     """
+
     def _multilib_sanity_test(self, dirs):
 
         allow_replace = self.d.getVar("MULTILIBRE_ALLOW_REP")
@@ -259,6 +263,7 @@ class PkgRootfs(DpkgOpkgRootfs):
     unneeded pkgs by comparing the old full manifest in previous existing
     image and the new full manifest in the current image.
     '''
+
     def _remove_extra_packages(self, pkgs_initial_install):
         if self.inc_opkg_image_gen == "1":
             # Parse full manifest in previous existing image creation session
@@ -286,6 +291,7 @@ class PkgRootfs(DpkgOpkgRootfs):
     The conditions include any of 'PACKAGE_EXCLUDE, NO_RECOMMENDATIONS
     and BAD_RECOMMENDATIONS' has been changed.
     '''
+
     def _remove_old_rootfs(self):
         if self.inc_opkg_image_gen != "1":
             return True
diff --git a/meta/lib/oe/package_manager/ipk/sdk.py b/meta/lib/oe/package_manager/ipk/sdk.py
index e2ca415c8e..8c503e4efc 100644
--- a/meta/lib/oe/package_manager/ipk/sdk.py
+++ b/meta/lib/oe/package_manager/ipk/sdk.py
@@ -10,6 +10,7 @@ from oe.package_manager.ipk.manifest import PkgManifest
 from oe.manifest import Manifest
 from oe.package_manager.ipk import OpkgPM
 
+
 class PkgSdk(Sdk):
     def __init__(self, d, manifest_dir=None):
         super(PkgSdk, self).__init__(d, manifest_dir)
diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
index 1a38055891..c28a0aa0ab 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -6,6 +6,7 @@ import shutil
 import subprocess
 from oe.package_manager import *
 
+
 class RpmIndexer(Indexer):
     def write_index(self):
         self.do_write_index(self.deploy_dir)
@@ -30,6 +31,7 @@ class RpmIndexer(Indexer):
                                self.d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE'),
                                armor=is_ascii_sig)
 
+
 class RpmSubdirIndexer(RpmIndexer):
     def write_index(self):
         bb.note("Generating package index for %s" % (self.deploy_dir))
@@ -50,6 +52,7 @@ class PMPkgsList(PkgsList):
     def list_pkgs(self):
         return RpmPM(self.d, self.rootfs_dir, self.d.getVar('TARGET_VENDOR'), needfeed=False).list_installed()
 
+
 class RpmPM(PackageManager):
     def __init__(self,
                  d,
@@ -102,7 +105,6 @@ class RpmPM(PackageManager):
 
         open(oe.path.join(self.target_rootfs, "etc/dnf/dnf.conf"), 'w').write("")
 
-
     def _configure_rpm(self):
         # We need to configure rpm to use our primary package architecture as the installation architecture,
         # and to make it compatible with other package architectures that we use.
@@ -180,7 +182,6 @@ class RpmPM(PackageManager):
         os.environ['INTERCEPT_DIR'] = self.intercepts_dir
         os.environ['NATIVE_ROOT'] = self.d.getVar('STAGING_DIR_NATIVE')
 
-
     def install(self, pkgs, attempt_only=False):
         if len(pkgs) == 0:
             return
diff --git a/meta/lib/oe/package_manager/rpm/manifest.py b/meta/lib/oe/package_manager/rpm/manifest.py
index e6604b301f..6415c81210 100644
--- a/meta/lib/oe/package_manager/rpm/manifest.py
+++ b/meta/lib/oe/package_manager/rpm/manifest.py
@@ -4,10 +4,12 @@
 
 from oe.manifest import Manifest
 
+
 class PkgManifest(Manifest):
     """
     Returns a dictionary object with mip and mlp packages.
     """
+
     def _split_multilib(self, pkg_list):
         pkgs = dict()
 
diff --git a/meta/lib/oe/package_manager/rpm/rootfs.py b/meta/lib/oe/package_manager/rpm/rootfs.py
index 00d07cd9cc..470fec8718 100644
--- a/meta/lib/oe/package_manager/rpm/rootfs.py
+++ b/meta/lib/oe/package_manager/rpm/rootfs.py
@@ -8,6 +8,7 @@ from oe.utils import execute_pre_post_process
 from oe.package_manager.rpm.manifest import PkgManifest
 from oe.package_manager.rpm import RpmPM
 
+
 class PkgRootfs(Rootfs):
     def __init__(self, d, manifest_dir, progress_reporter=None, logcatcher=None):
         super(PkgRootfs, self).__init__(d, progress_reporter, logcatcher)
@@ -36,6 +37,7 @@ class PkgRootfs(Rootfs):
     unneeded pkgs by comparing the new install solution manifest and the
     old installed manifest.
     '''
+
     def _create_incremental(self, pkgs_initial_install):
         if self.inc_rpm_image_gen == "1":
 
@@ -118,7 +120,6 @@ class PkgRootfs(Rootfs):
         if self.progress_reporter:
             self.progress_reporter.next_stage()
 
-
     @staticmethod
     def _depends_list():
         return ['DEPLOY_DIR_RPM', 'INC_RPM_IMAGE_GEN', 'RPM_PREPROCESS_COMMANDS',
diff --git a/meta/lib/oe/package_manager/rpm/sdk.py b/meta/lib/oe/package_manager/rpm/sdk.py
index c5f232431f..da226de092 100644
--- a/meta/lib/oe/package_manager/rpm/sdk.py
+++ b/meta/lib/oe/package_manager/rpm/sdk.py
@@ -9,6 +9,7 @@ from oe.manifest import Manifest
 from oe.package_manager.rpm.manifest import PkgManifest
 from oe.package_manager.rpm import RpmPM
 
+
 class PkgSdk(Sdk):
     def __init__(self, d, manifest_dir=None, rpm_workdir="oe-sdk-repo"):
         super(PkgSdk, self).__init__(d, manifest_dir)
diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index a82085a792..24c93b4f05 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -5,9 +5,11 @@
 import codecs
 import os
 
+
 def packaged(pkg, d):
     return os.access(get_subpkgedata_fn(pkg, d) + '.packaged', os.R_OK)
 
+
 def read_pkgdatafile(fn):
     pkgdata = {}
 
@@ -27,19 +29,24 @@ def read_pkgdatafile(fn):
 
     return pkgdata
 
+
 def get_subpkgedata_fn(pkg, d):
     return d.expand('${PKGDATA_DIR}/runtime/%s' % pkg)
 
+
 def has_subpkgdata(pkg, d):
     return os.access(get_subpkgedata_fn(pkg, d), os.R_OK)
 
+
 def read_subpkgdata(pkg, d):
     return read_pkgdatafile(get_subpkgedata_fn(pkg, d))
 
+
 def has_pkgdata(pn, d):
     fn = d.expand('${PKGDATA_DIR}/%s' % pn)
     return os.access(fn, os.R_OK)
 
+
 def read_pkgdata(pn, d):
     fn = d.expand('${PKGDATA_DIR}/%s' % pn)
     return read_pkgdatafile(fn)
@@ -47,6 +54,8 @@ def read_pkgdata(pn, d):
 #
 # Collapse FOO_pkg variables into FOO
 #
+
+
 def read_subpkgdata_dict(pkg, d):
     ret = {}
     subd = read_pkgdatafile(get_subpkgedata_fn(pkg, d))
@@ -57,6 +66,7 @@ def read_subpkgdata_dict(pkg, d):
         ret[newvar] = subd[var]
     return ret
 
+
 def _pkgmap(d):
     """Return a dictionary mapping package to recipe name."""
 
@@ -81,6 +91,7 @@ def _pkgmap(d):
 
     return pkgmap
 
+
 def pkgmap(d):
     """Return a dictionary mapping package to recipe name.
     Cache the mapping in the metadata"""
@@ -92,6 +103,7 @@ def pkgmap(d):
 
     return pkgmap_data
 
+
 def recipename(pkg, d):
     """Return the recipe name for the given binary package name."""
 
diff --git a/meta/lib/oe/packagegroup.py b/meta/lib/oe/packagegroup.py
index 8fcaecde82..5728fcbc85 100644
--- a/meta/lib/oe/packagegroup.py
+++ b/meta/lib/oe/packagegroup.py
@@ -4,27 +4,33 @@
 
 import itertools
 
+
 def is_optional(feature, d):
     return bool(d.getVarFlag("FEATURE_PACKAGES_%s" % feature, "optional"))
 
+
 def packages(features, d):
     for feature in features:
         packages = d.getVar("FEATURE_PACKAGES_%s" % feature)
         for pkg in (packages or "").split():
             yield pkg
 
+
 def required_packages(features, d):
     req = [feature for feature in features if not is_optional(feature, d)]
     return packages(req, d)
 
+
 def optional_packages(features, d):
     opt = [feature for feature in features if is_optional(feature, d)]
     return packages(opt, d)
 
+
 def active_packages(features, d):
     return itertools.chain(required_packages(features, d),
                            optional_packages(features, d))
 
+
 def active_recipes(features, d):
     import oe.packagedata
 
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 4cab28a215..2bf13ec34b 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -5,6 +5,7 @@
 import oe.path
 import oe.types
 
+
 class NotFoundError(bb.BBHandledException):
     def __init__(self, path):
         self.path = path
@@ -12,6 +13,7 @@ class NotFoundError(bb.BBHandledException):
     def __str__(self):
         return "Error: %s not found." % self.path
 
+
 class CmdError(bb.BBHandledException):
     def __init__(self, command, exitstatus, output):
         self.command = command
@@ -56,6 +58,7 @@ def runcmd(args, dir=None):
         if dir:
             os.chdir(olddir)
 
+
 class PatchError(Exception):
     def __init__(self, msg):
         self.msg = msg
@@ -63,6 +66,7 @@ class PatchError(Exception):
     def __str__(self):
         return "Patch Error: %s" % self.msg
 
+
 class PatchSet(object):
     defaults = {
         "strippath": 1
@@ -290,6 +294,7 @@ class PatchTree(PatchSet):
         """"""
         self.Pop(all=True)
 
+
 class GitApplyTree(PatchTree):
     patch_line_prefix = '%% original patch'
     ignore_commit_prefix = '%% ignore'
@@ -569,7 +574,6 @@ class QuiltTree(PatchSet):
     def _quiltpatchpath(self, file):
         return os.path.join(self.dir, "patches", os.path.basename(file))
 
-
     def __init__(self, dir, d):
         PatchSet.__init__(self, dir, d)
         self.initialized = False
@@ -632,7 +636,6 @@ class QuiltTree(PatchSet):
 
         self.patches.insert(self._current or 0, patch)
 
-
     def Push(self, force=False, all=False, run=True):
         # quilt push [-f]
 
@@ -690,6 +693,7 @@ class QuiltTree(PatchSet):
                 args.append(os.path.basename(self.patches[kwargs["patch"]]["quiltfile"]))
             self._runcmd(args)
 
+
 class Resolver(object):
     def __init__(self, patchset, terminal):
         raise NotImplementedError()
@@ -703,6 +707,7 @@ class Resolver(object):
     def Finalize(self):
         raise NotImplementedError()
 
+
 class NOOPResolver(Resolver):
     def __init__(self, patchset, terminal):
         self.patchset = patchset
@@ -721,6 +726,8 @@ class NOOPResolver(Resolver):
 # Patch resolver which relies on the user doing all the work involved in the
 # resolution, with the exception of refreshing the remote copy of the patch
 # files (the urls).
+
+
 class UserResolver(Resolver):
     def __init__(self, patchset, terminal):
         self.patchset = patchset
@@ -803,6 +810,7 @@ def patch_path(url, fetch, workdir, expand=True):
 
     return local
 
+
 def src_patches(d, all=False, expand=True):
     workdir = d.getVar('WORKDIR')
     fetch = bb.fetch2.Fetch([], d)
@@ -866,7 +874,6 @@ def should_apply(parm, d):
         if "mindate" in parm and parm["mindate"] > srcdate:
             return False, 'is predated'
 
-
     if "minrev" in parm:
         srcrev = d.getVar('SRCREV')
         if srcrev and srcrev < parm["minrev"]:
diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 101ee2d029..1ac9c2cfcf 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -8,10 +8,12 @@ import shutil
 import subprocess
 import os.path
 
+
 def join(*paths):
     """Like os.path.join but doesn't treat absolute RHS specially"""
     return os.path.normpath("/".join(paths))
 
+
 def relative(src, dest):
     """ Return a relative path from src to dest.
 
@@ -27,6 +29,7 @@ def relative(src, dest):
 
     return os.path.relpath(dest, src)
 
+
 def make_relative_symlink(path):
     """ Convert an absolute symlink to a relative one """
     if not os.path.islink(path):
@@ -54,6 +57,7 @@ def make_relative_symlink(path):
     os.remove(path)
     os.symlink(base, path)
 
+
 def replace_absolute_symlinks(basedir, d):
     """
     Walk basedir looking for absolute symlinks and replacing them with relative ones.
@@ -75,6 +79,7 @@ def replace_absolute_symlinks(basedir, d):
             os.remove(path)
             os.symlink(base, path)
 
+
 def format_display(path, metadata):
     """ Prepare a path for display to the user. """
     rel = relative(metadata.getVar("TOPDIR"), path)
@@ -83,6 +88,7 @@ def format_display(path, metadata):
     else:
         return rel
 
+
 def copytree(src, dst):
     # We could use something like shutil.copytree here but it turns out to
     # to be slow. It takes twice as long copying to an empty directory. 
@@ -93,6 +99,7 @@ def copytree(src, dst):
     cmd = "tar --xattrs --xattrs-include='*' -cf - -S -C %s -p . | tar --xattrs --xattrs-include='*' -xf - -C %s" % (src, dst)
     subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
 
+
 def copyhardlinktree(src, dst):
     """Make a tree of hard links when possible, otherwise copy."""
     bb.utils.mkdirhier(dst)
@@ -133,6 +140,7 @@ def copyhardlinktree(src, dst):
     else:
         copytree(src, dst)
 
+
 def copyhardlink(src, dst):
     """Make a hard link when possible, otherwise copy."""
 
@@ -141,6 +149,7 @@ def copyhardlink(src, dst):
     except OSError:
         shutil.copy(src, dst)
 
+
 def remove(path, recurse=True):
     """
     Equivalent to rm -f or rm -rf
@@ -159,6 +168,7 @@ def remove(path, recurse=True):
             elif exc.errno != errno.ENOENT:
                 raise
 
+
 def symlink(source, destination, force=False):
     """Create a symbolic link"""
     try:
@@ -169,6 +179,7 @@ def symlink(source, destination, force=False):
         if e.errno != errno.EEXIST or os.readlink(destination) != source:
             raise
 
+
 def find(dir, **walkoptions):
     """ Given a directory, recurses into that directory,
     returning all files as absolute paths. """
@@ -182,6 +193,7 @@ def find(dir, **walkoptions):
 def __is_path_below(file, root):
     return (file + os.path.sep).startswith(root)
 
+
 def __realpath_rel(start, rel_path, root, loop_cnt, assume_dir):
     """Calculates real path of symlink 'start' + 'rel_path' below
     'root'; no part of 'start' below 'root' must contain symlinks. """
@@ -206,6 +218,7 @@ def __realpath_rel(start, rel_path, root, loop_cnt, assume_dir):
 
     return start
 
+
 def __realpath(file, root, loop_cnt, assume_dir):
     while os.path.islink(file) and len(file) >= len(root):
         if loop_cnt == 0:
@@ -229,6 +242,7 @@ def __realpath(file, root, loop_cnt, assume_dir):
 
     return (file, is_dir)
 
+
 def realpath(file, root, use_physdir=True, loop_cnt=100, assume_dir=False):
     """ Returns the canonical path of 'file' with assuming a
     toplevel 'root' directory. When 'use_physdir' is set, all
@@ -265,6 +279,7 @@ def realpath(file, root, use_physdir=True, loop_cnt=100, assume_dir=False):
 
     return file
 
+
 def is_path_parent(possible_parent, *paths):
     """
     Return True if a path is the parent of another, False otherwise.
@@ -287,6 +302,7 @@ def is_path_parent(possible_parent, *paths):
             return False
     return True
 
+
 def which_wild(pathname, path=None, mode=os.F_OK, *, reverse=False, candidates=False):
     """Search a search path for pathname, supporting wildcards.
 
@@ -320,6 +336,7 @@ def which_wild(pathname, path=None, mode=os.F_OK, *, reverse=False, candidates=F
 
     return files
 
+
 def canonicalize(paths, sep=','):
     """Given a string with paths (separated by commas by default), expand
     each path using os.path.realpath() and return the resulting paths as a
diff --git a/meta/lib/oe/prservice.py b/meta/lib/oe/prservice.py
index d71140980a..30808e362a 100644
--- a/meta/lib/oe/prservice.py
+++ b/meta/lib/oe/prservice.py
@@ -2,6 +2,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+
 def prserv_make_conn(d, check=False):
     import prserv.serv
     host_params = list([_f for _f in (d.getVar("PRSERV_HOST") or '').split(':') if _f])
@@ -17,6 +18,7 @@ def prserv_make_conn(d, check=False):
 
     return conn
 
+
 def prserv_dump_db(d):
     if not d.getVar('PRSERV_HOST'):
         bb.error("Not using network based PR service")
@@ -36,6 +38,7 @@ def prserv_dump_db(d):
     opt_col = ("1" == d.getVar('PRSERV_DUMPOPT_COL'))
     return conn.export(opt_version, opt_pkgarch, opt_checksum, opt_col)
 
+
 def prserv_import_db(d, filter_version=None, filter_pkgarch=None, filter_checksum=None):
     if not d.getVar('PRSERV_HOST'):
         bb.error("Not using network based PR service")
@@ -72,6 +75,7 @@ def prserv_import_db(d, filter_version=None, filter_pkgarch=None, filter_checksu
                imported.append((version, pkgarch, checksum, value))
     return imported
 
+
 def prserv_export_tofile(d, metainfo, datainfo, lockdown, nomax=False):
     import bb.utils
     #initilize the output file
@@ -115,6 +119,7 @@ def prserv_export_tofile(d, metainfo, datainfo, lockdown, nomax=False):
                     f.write("PRAUTO_%s_%s = \"%s\"\n" % (str(datainfo[idx[i]]['version']), str(datainfo[idx[i]]['pkgarch']), str(datainfo[idx[i]]['value'])))
     bb.utils.unlockfile(lf)
 
+
 def prserv_check_avail(d):
     host_params = list([_f for _f in (d.getVar("PRSERV_HOST") or '').split(':') if _f])
     try:
diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index c6aaa0af06..f2310c18be 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -6,9 +6,11 @@ import os
 import struct
 import mmap
 
+
 class NotELFFileError(Exception):
     pass
 
+
 class ELFFile:
     EI_NIDENT = 16
 
@@ -151,6 +153,7 @@ class ELFFile:
             bb.note("%s %s %s failed: %s" % (objdump, cmd, self.name, e))
             return ""
 
+
 def elf_machine_to_string(machine):
     """
     Return the name of a given ELF e_machine field or the hex value as a string
@@ -173,6 +176,7 @@ def elf_machine_to_string(machine):
     except:
         return "Unknown (%s)" % repr(machine)
 
+
 if __name__ == "__main__":
     import sys
 
diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 6842f7387d..610500b6a0 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -232,6 +232,7 @@ def patch_recipe_lines(fromlines, values, trailing_newline=True):
             lines.extend(addlines)
 
     existingnames = []
+
     def patch_recipe_varfunc(varname, origvalue, op, newlines):
         if modifying:
             # Insert anything that should come before this variable
@@ -334,11 +335,13 @@ def localise_file_vars(fn, varfiles, varlist):
 
     return filevars
 
+
 def patch_recipe(d, fn, varvalues, patch=False, relpath='', redirect_output=None):
     """Modify a list of variable values in the specified recipe. Handles inc files if
     used by the recipe.
     """
     overrides = d.getVar('OVERRIDES').split(':')
+
     def override_applicable(hevent):
         op = hevent['op']
         if '[' in op:
@@ -389,7 +392,6 @@ def patch_recipe(d, fn, varvalues, patch=False, relpath='', redirect_output=None
         return None
 
 
-
 def copy_recipe_files(d, tgt_dir, whole_dir=False, download=True, all_variants=False):
     """Copy (local) recipe files, including both files included via include/require,
     and files referred to in the SRC_URI variable."""
@@ -400,6 +402,7 @@ def copy_recipe_files(d, tgt_dir, whole_dir=False, download=True, all_variants=F
 
     uri_values = []
     localpaths = []
+
     def fetch_urls(rdata):
         # Collect the local paths from SRC_URI
         srcuri = rdata.getVar('SRC_URI') or ""
@@ -612,6 +615,7 @@ def get_bbfile_path(d, destdir, extrapathhint=None):
                 return pathoption
     return None
 
+
 def get_bbappend_path(d, destlayerdir, wildcardver=False):
     """Determine how a bbappend for a recipe should be named and located within another layer"""
 
@@ -942,6 +946,7 @@ def replace_dir_vars(path, d):
         path = path.replace(dirpath, '${%s}' % dirvars[dirpath])
     return path
 
+
 def get_recipe_pv_without_srcpv(pv, uri_type):
     """
     Get PV without SRCPV common in SCM's for now only
@@ -969,6 +974,7 @@ def get_recipe_pv_without_srcpv(pv, uri_type):
 
     return (pv, pfx, sfx)
 
+
 def get_recipe_upstream_version(rd):
     """
         Get upstream version of recipe using bb.fetch2 methods with support for
@@ -1048,6 +1054,7 @@ def get_recipe_upstream_version(rd):
 
     return ru
 
+
 def _get_recipe_upgrade_status(data):
     uv = get_recipe_upstream_version(data)
 
@@ -1073,6 +1080,7 @@ def _get_recipe_upgrade_status(data):
 
     return (pn, status, cur_ver, next_ver, maintainer, revision, no_upgrade_reason)
 
+
 def get_recipe_upgrade_status(recipes=None):
     pkgs_list = []
     data_copy_list = []
diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index 204b9bd734..fd9f9354fd 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -5,6 +5,7 @@ import os
 import subprocess
 import bb
 
+
 def get_source_date_epoch_from_known_files(d, sourcedir):
     source_date_epoch = None
     newest_file = None
@@ -21,6 +22,7 @@ def get_source_date_epoch_from_known_files(d, sourcedir):
         bb.debug(1, "SOURCE_DATE_EPOCH taken from: %s" % newest_file)
     return source_date_epoch
 
+
 def find_git_folder(d, sourcedir):
     # First guess: WORKDIR/git
     # This is the default git fetcher unpack path
@@ -46,6 +48,7 @@ def find_git_folder(d, sourcedir):
     bb.warn("Failed to find a git repository in WORKDIR: %s" % workdir)
     return None
 
+
 def get_source_date_epoch_from_git(d, sourcedir):
     if not "git://" in d.getVar('SRC_URI') and not "gitsm://" in d.getVar('SRC_URI'):
         return None
@@ -65,6 +68,7 @@ def get_source_date_epoch_from_git(d, sourcedir):
     p = subprocess.run(['git', '--git-dir', gitpath, 'log', '-1', '--pretty=%ct'], check=True, stdout=subprocess.PIPE)
     return int(p.stdout.decode('utf-8'))
 
+
 def get_source_date_epoch_from_youngest_file(d, sourcedir):
     if sourcedir == d.getVar('WORKDIR'):
        # These sources are almost certainly not from a tarball
@@ -90,6 +94,7 @@ def get_source_date_epoch_from_youngest_file(d, sourcedir):
         bb.debug(1, "Newest file found: %s" % newest_file)
     return source_date_epoch
 
+
 def fixed_source_date_epoch(d):
     bb.debug(1, "No tarball or git repo found to determine SOURCE_DATE_EPOCH")
     source_date_epoch = d.getVar('SOURCE_DATE_EPOCH_FALLBACK')
@@ -98,6 +103,7 @@ def fixed_source_date_epoch(d):
         return int(source_date_epoch)
     return 0
 
+
 def get_source_date_epoch(d, sourcedir):
     return (
         get_source_date_epoch_from_git(d, sourcedir) or
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 0043df18d7..cd4d158570 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -11,6 +11,7 @@ import os
 import subprocess
 import re
 
+
 class Rootfs(object, metaclass=ABCMeta):
     """
     This is an abstract class. Do not instantiate this directly.
@@ -94,7 +95,6 @@ class Rootfs(object, metaclass=ABCMeta):
                 self.d.getVar('PACKAGE_FEED_BASE_PATHS') or "",
                 self.d.getVar('PACKAGE_FEED_ARCHS'))
 
-
     """
     The _cleanup() method should be used to clean-up stuff that we don't really
     want to end up on target. For example, in the case of RPM, the DB locks.
@@ -248,7 +248,6 @@ class Rootfs(object, metaclass=ABCMeta):
         if self.progress_reporter:
             self.progress_reporter.next_stage()
 
-
     def _uninstall_unneeded(self):
         # Remove the run-postinsts package if no delayed postinsts are found
         delayed_postinsts = self._get_delayed_postinsts()
@@ -337,6 +336,7 @@ class Rootfs(object, metaclass=ABCMeta):
     If neither are specified then the default name of files/device_table-minimal.txt
     is searched for in the BBPATH (same as the old version.)
     """
+
     def _create_devfs(self):
         devtable_list = []
         devtable = self.d.getVar('IMAGE_DEVICE_TABLE')
@@ -359,11 +359,13 @@ def get_class_for_type(imgtype):
     mod = importlib.import_module('oe.package_manager.' + imgtype + '.rootfs')
     return mod.PkgRootfs
 
+
 def variable_depends(d, manifest_dir=None):
     img_type = d.getVar('IMAGE_PKGTYPE')
     cls = get_class_for_type(img_type)
     return cls._depends_list()
 
+
 def create_rootfs(d, manifest_dir=None, progress_reporter=None, logcatcher=None):
     env_bkp = os.environ.copy()
 
@@ -385,6 +387,7 @@ def image_list_installed_packages(d, rootfs_dir=None):
     cls = importlib.import_module('oe.package_manager.' + img_type)
     return cls.PMPkgsList(d, rootfs_dir).list_pkgs()
 
+
 if __name__ == "__main__":
     """
     We should be able to run this as a standalone script, from outside bitbake
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index aad3f571da..7dca15b65c 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -9,6 +9,7 @@ from oe.package_manager import *
 import os
 import traceback
 
+
 class Sdk(object, metaclass=ABCMeta):
     def __init__(self, d, manifest_dir):
         self.d = d
@@ -120,6 +121,7 @@ def sdk_list_installed_packages(d, target, rootfs_dir=None):
     cls = importlib.import_module('oe.package_manager.' + img_type)
     return cls.PMPkgsList(d, rootfs_dir).list_pkgs()
 
+
 def populate_sdk(d, manifest_dir=None):
     env_bkp = os.environ.copy()
 
@@ -131,6 +133,7 @@ def populate_sdk(d, manifest_dir=None):
     os.environ.clear()
     os.environ.update(env_bkp)
 
+
 def get_extra_sdkinfo(sstate_dir):
     """
     This function is going to be used for generating the target and host manifest files packages of eSDK.
@@ -150,5 +153,6 @@ def get_extra_sdkinfo(sstate_dir):
                 extra_info['filesizes'][fn] = fsize
     return extra_info
 
+
 if __name__ == "__main__":
     pass
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 560c6a40dd..588332042d 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -5,23 +5,30 @@ import bb.siggen
 import bb.runqueue
 import oe
 
+
 def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCaches):
     # Return True if we should keep the dependency, False to drop it
     def isNative(x):
         return x.endswith("-native")
+
     def isCross(x):
         return "-cross-" in x
+
     def isNativeSDK(x):
         return x.startswith("nativesdk-")
+
     def isKernel(mc, fn):
         inherits = " ".join(dataCaches[mc].inherits[fn])
         return inherits.find("/module-base.bbclass") != -1 or inherits.find("/linux-kernel-base.bbclass") != -1
+
     def isPackageGroup(mc, fn):
         inherits = " ".join(dataCaches[mc].inherits[fn])
         return "/packagegroup.bbclass" in inherits
+
     def isAllArch(mc, fn):
         inherits = " ".join(dataCaches[mc].inherits[fn])
         return "/allarch.bbclass" in inherits
+
     def isImage(mc, fn):
         return "/image.bbclass" in " ".join(dataCaches[mc].inherits[fn])
 
@@ -71,6 +78,7 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCaches):
     # Default to keep dependencies
     return True
 
+
 def sstate_lockedsigs(d):
     sigs = {}
     types = (d.getVar("SIGGEN_LOCKEDSIGS_TYPES") or "").split()
@@ -84,15 +92,19 @@ def sstate_lockedsigs(d):
             sigs[pn][task] = [h, siggen_lockedsigs_var]
     return sigs
 
+
 class SignatureGeneratorOEBasic(bb.siggen.SignatureGeneratorBasic):
     name = "OEBasic"
+
     def init_rundepcheck(self, data):
         self.abisaferecipes = (data.getVar("SIGGEN_EXCLUDERECIPES_ABISAFE") or "").split()
         self.saferecipedeps = (data.getVar("SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS") or "").split()
         pass
+
     def rundep_check(self, fn, recipename, task, dep, depname, dataCaches=None):
         return sstate_rundepfilter(self, fn, recipename, task, dep, depname, dataCaches)
 
+
 class SignatureGeneratorOEBasicHashMixIn(object):
     supports_multiconfig_datacaches = True
 
@@ -301,9 +313,11 @@ class SignatureGeneratorOEBasicHashMixIn(object):
         if error_msgs:
             bb.fatal("\n".join(error_msgs))
 
+
 class SignatureGeneratorOEBasicHash(SignatureGeneratorOEBasicHashMixIn, bb.siggen.SignatureGeneratorBasicHash):
     name = "OEBasicHash"
 
+
 class SignatureGeneratorOEEquivHash(SignatureGeneratorOEBasicHashMixIn, bb.siggen.SignatureGeneratorUniHashMixIn, bb.siggen.SignatureGeneratorBasicHash):
     name = "OEEquivHash"
 
@@ -316,6 +330,7 @@ class SignatureGeneratorOEEquivHash(SignatureGeneratorOEBasicHashMixIn, bb.sigge
         if not self.method:
             bb.fatal("OEEquivHash requires SSTATE_HASHEQUIV_METHOD to be set")
 
+
 # Insert these classes into siggen's namespace so it can see and select them
 bb.siggen.SignatureGeneratorOEBasic = SignatureGeneratorOEBasic
 bb.siggen.SignatureGeneratorOEBasicHash = SignatureGeneratorOEBasicHash
@@ -415,6 +430,7 @@ def find_siginfo(pn, taskname, taskhashlist, d):
     else:
         return filedates
 
+
 bb.siggen.find_siginfo = find_siginfo
 
 
@@ -429,6 +445,7 @@ def sstate_get_manifest_filename(task, d):
         d2.setVar("SSTATE_MANMACH", extrainf)
     return (d2.expand("${SSTATE_MANFILEPREFIX}.%s" % task), d2)
 
+
 def find_sstate_manifest(taskdata, taskdata2, taskname, d, multilibcache):
     d2 = d
     variant = ''
@@ -467,6 +484,7 @@ def find_sstate_manifest(taskdata, taskdata2, taskname, d, multilibcache):
     bb.fatal("Manifest %s not found in %s (variant '%s')?" % (manifest, d2.expand(" ".join(pkgarchs)), variant))
     return None, d2
 
+
 def OEOuthashBasic(path, sigfile, task, d):
     """
     Basic output hash function
diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 4b9c71eea1..965789c14b 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -13,6 +13,7 @@ logger = logging.getLogger('BitBake.OE.Terminal')
 class UnsupportedTerminal(Exception):
     pass
 
+
 class NoSupportedTerminals(Exception):
     def __init__(self, terms):
         self.terms = terms
@@ -48,12 +49,14 @@ class Terminal(Popen, metaclass=Registry):
         else:
             return [element.format(**fmt) for element in self.command]
 
+
 class XTerminal(Terminal):
     def __init__(self, sh_cmd, title=None, env=None, d=None):
         Terminal.__init__(self, sh_cmd, title, env, d)
         if not os.environ.get('DISPLAY'):
             raise UnsupportedTerminal(self.name)
 
+
 class Gnome(XTerminal):
     command = 'gnome-terminal -t "{title}" -- {command}'
     priority = 2
@@ -68,18 +71,22 @@ class Gnome(XTerminal):
 
         XTerminal.__init__(self, sh_cmd, title, env, d)
 
+
 class Mate(XTerminal):
     command = 'mate-terminal --disable-factory -t "{title}" -x {command}'
     priority = 2
 
+
 class Xfce(XTerminal):
     command = 'xfce4-terminal -T "{title}" -e "{command}"'
     priority = 2
 
+
 class Terminology(XTerminal):
     command = 'terminology -T="{title}" -e {command}'
     priority = 2
 
+
 class Konsole(XTerminal):
     command = 'konsole --separate --workdir . -p tabtitle="{title}" -e {command}'
     priority = 2
@@ -95,14 +102,17 @@ class Konsole(XTerminal):
             self.command = 'konsole --nofork --workdir . -p tabtitle="{title}" -e {command}'
         XTerminal.__init__(self, sh_cmd, title, env, d)
 
+
 class XTerm(XTerminal):
     command = 'xterm -T "{title}" -e {command}'
     priority = 1
 
+
 class Rxvt(XTerminal):
     command = 'rxvt -T "{title}" -e {command}'
     priority = 1
 
+
 class Screen(Terminal):
     command = 'screen -D -m -t "{title}" -S devshell {command}'
 
@@ -118,6 +128,7 @@ class Screen(Terminal):
         else:
             logger.warning(msg)
 
+
 class TmuxRunning(Terminal):
     """Open a new pane in the current running tmux window"""
     name = 'tmux-running'
@@ -136,6 +147,7 @@ class TmuxRunning(Terminal):
 
         Terminal.__init__(self, sh_cmd, title, env, d)
 
+
 class TmuxNewWindow(Terminal):
     """Open a new window in the current running tmux session"""
     name = 'tmux-new-window'
@@ -151,6 +163,7 @@ class TmuxNewWindow(Terminal):
 
         Terminal.__init__(self, sh_cmd, title, env, d)
 
+
 class Tmux(Terminal):
     """Start a new tmux session and window"""
     command = 'tmux new -c "{cwd}" -d -s devshell -n devshell "{command}"'
@@ -179,6 +192,7 @@ class Tmux(Terminal):
         else:
             logger.warning(msg)
 
+
 class Custom(Terminal):
     command = 'false' # This is a placeholder
     priority = 3
@@ -198,6 +212,7 @@ class Custom(Terminal):
 def prioritized():
     return Registry.prioritized()
 
+
 def get_cmd_list():
     terms = Registry.prioritized()
     cmds = []
@@ -206,6 +221,7 @@ def get_cmd_list():
             cmds.append(term.command)
     return cmds
 
+
 def spawn_preferred(sh_cmd, title=None, env=None, d=None):
     """Spawn the first supported terminal, by priority"""
     for terminal in prioritized():
@@ -220,6 +236,7 @@ def spawn_preferred(sh_cmd, title=None, env=None, d=None):
     else:
         raise NoSupportedTerminals(get_cmd_list())
 
+
 def spawn(name, sh_cmd, title=None, env=None, d=None):
     """Spawn the specified terminal, by name"""
     logger.debug('Attempting to spawn terminal "%s"', name)
@@ -259,12 +276,14 @@ def spawn(name, sh_cmd, title=None, env=None, d=None):
         except OSError:
            return
 
+
 def check_tmux_version(desired):
     vernum = check_terminal_version("tmux")
     if vernum and LooseVersion(vernum) < desired:
         return False
     return vernum
 
+
 def check_tmux_pane_size(tmux):
     import subprocess as sub
     # On older tmux versions (<1.9), return false. The reason
@@ -286,6 +305,7 @@ def check_tmux_pane_size(tmux):
 
     return size / 2 >= 19
 
+
 def check_terminal_version(terminalName):
     import subprocess as sub
     try:
@@ -317,6 +337,7 @@ def check_terminal_version(terminalName):
             vernum = ver.split()[-1][5:]
     return vernum
 
+
 def distro_name():
     try:
         p = Popen(['lsb_release', '-i'])
diff --git a/meta/lib/oe/types.py b/meta/lib/oe/types.py
index ee7cc0e659..01328537f4 100644
--- a/meta/lib/oe/types.py
+++ b/meta/lib/oe/types.py
@@ -31,6 +31,7 @@ class OEList(list):
     def __str__(self):
         return self.separator.join(self)
 
+
 def choice(value, choices):
     """OpenEmbedded 'choice' type
 
@@ -47,8 +48,10 @@ def choice(value, choices):
                          (value, choices))
     return value
 
+
 class NoMatch(object):
     """Stub python regex pattern object which never matches anything"""
+
     def findall(self, string, flags=0):
         return None
 
@@ -70,8 +73,10 @@ class NoMatch(object):
     def subn(pattern, repl, string, count=0):
         return None
 
+
 NoMatch = NoMatch()
 
+
 def regex(value, regexflags=None):
     """OpenEmbedded 'regex' type
 
@@ -103,6 +108,7 @@ def regex(value, regexflags=None):
         raise ValueError("Invalid regex value '%s': %s" %
                          (value, exc.args[0]))
 
+
 def boolean(value):
     """OpenEmbedded 'boolean' type
 
@@ -125,6 +131,7 @@ def boolean(value):
         return False
     raise ValueError("Invalid boolean value '%s'" % value)
 
+
 def integer(value, numberbase=10):
     """OpenEmbedded 'integer' type
 
@@ -133,7 +140,10 @@ def integer(value, numberbase=10):
 
     return int(value, int(numberbase))
 
+
 _float = float
+
+
 def float(value, fromhex='false'):
     """OpenEmbedded floating point type
 
@@ -146,6 +156,7 @@ def float(value, fromhex='false'):
     else:
         return _float(value)
 
+
 def path(value, relativeto='', normalize='true', mustexist='false'):
     value = os.path.join(relativeto, value)
 
@@ -162,6 +173,7 @@ def path(value, relativeto='', normalize='true', mustexist='false'):
 
     return value
 
+
 def is_x86(arch):
     """
     Check whether arch is x86 or x86_64
@@ -171,6 +183,7 @@ def is_x86(arch):
     else:
         return False
 
+
 def qemu_use_kvm(kvm, target_arch):
     """
     Enable kvm if target_arch == build_arch or both of them are x86 archs.
diff --git a/meta/lib/oe/useradd.py b/meta/lib/oe/useradd.py
index 8fc77568ff..fea843834a 100644
--- a/meta/lib/oe/useradd.py
+++ b/meta/lib/oe/useradd.py
@@ -4,6 +4,7 @@
 import argparse
 import re
 
+
 class myArgumentParser(argparse.ArgumentParser):
     def _print_message(self, message, file=None):
         bb.warn("%s - %s: %s" % (d.getVar('PN'), pkg, message))
@@ -16,16 +17,19 @@ class myArgumentParser(argparse.ArgumentParser):
     def error(self, message):
         bb.fatal(message)
 
+
 def split_commands(params):
     params = re.split('''[ \t]*;[ \t]*(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', params.strip())
     # Remove any empty items
     return [x for x in params if x]
 
+
 def split_args(params):
     params = re.split('''[ \t]+(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', params.strip())
     # Remove any empty items
     return [x for x in params if x]
 
+
 def build_useradd_parser():
     # The following comes from --help on useradd from shadow
     parser = myArgumentParser(prog='useradd')
@@ -55,6 +59,7 @@ def build_useradd_parser():
 
     return parser
 
+
 def build_groupadd_parser():
     # The following comes from --help on groupadd from shadow
     parser = myArgumentParser(prog='groupadd')
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 929ca9c5b1..60cd4cb446 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -6,6 +6,7 @@ import subprocess
 import multiprocessing
 import traceback
 
+
 def read_file(filename):
     try:
         f = open(filename, "r")
@@ -17,18 +18,21 @@ def read_file(filename):
         return data
     return None
 
+
 def ifelse(condition, iftrue=True, iffalse=False):
     if condition:
         return iftrue
     else:
         return iffalse
 
+
 def conditional(variable, checkvalue, truevalue, falsevalue, d):
     if d.getVar(variable) == checkvalue:
         return truevalue
     else:
         return falsevalue
 
+
 def vartrue(var, iftrue, iffalse, d):
     import oe.types
     if oe.types.boolean(d.getVar(var)):
@@ -36,12 +40,14 @@ def vartrue(var, iftrue, iffalse, d):
     else:
         return iffalse
 
+
 def less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
     if float(d.getVar(variable)) <= float(checkvalue):
         return truevalue
     else:
         return falsevalue
 
+
 def version_less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
     result = bb.utils.vercmp_string(d.getVar(variable), checkvalue)
     if result <= 0:
@@ -49,6 +55,7 @@ def version_less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
     else:
         return falsevalue
 
+
 def both_contain(variable1, variable2, checkvalue, d):
     val1 = d.getVar(variable1)
     val2 = d.getVar(variable2)
@@ -63,6 +70,7 @@ def both_contain(variable1, variable2, checkvalue, d):
     else:
         return ""
 
+
 def set_intersect(variable1, variable2, d):
     """
     Expand both variables, interpret them as lists of strings, and return the
@@ -78,6 +86,7 @@ def set_intersect(variable1, variable2, d):
     val2 = set(d.getVar(variable2).split())
     return " ".join(val1 & val2)
 
+
 def prune_suffix(var, suffixes, d):
     # See if var ends with any of the suffixes listed and
     # remove it if found
@@ -91,22 +100,27 @@ def prune_suffix(var, suffixes, d):
 
     return var
 
+
 def str_filter(f, str, d):
     from re import match
     return " ".join([x for x in str.split() if match(f, x, 0)])
 
+
 def str_filter_out(f, str, d):
     from re import match
     return " ".join([x for x in str.split() if not match(f, x, 0)])
 
+
 def build_depends_string(depends, task):
     """Append a taskname to a string of dependencies as used by the [depends] flag"""
     return " ".join(dep + ":" + task for dep in depends.split())
 
+
 def inherits(d, *classes):
     """Return True if the metadata inherits any of the specified classes"""
     return any(bb.data.inherits_class(cls, d) for cls in classes)
 
+
 def features_backfill(var, d):
     # This construct allows the addition of new features to variable specified
     # as var
@@ -128,6 +142,7 @@ def features_backfill(var, d):
     if addfeatures:
         d.appendVar(var, " " + " ".join(addfeatures))
 
+
 def all_distro_features(d, features, truevalue="1", falsevalue=""):
     """
     Returns truevalue if *all* given features are set in DISTRO_FEATURES,
@@ -148,6 +163,7 @@ def all_distro_features(d, features, truevalue="1", falsevalue=""):
     """
     return bb.utils.contains("DISTRO_FEATURES", features, truevalue, falsevalue, d)
 
+
 def any_distro_features(d, features, truevalue="1", falsevalue=""):
     """
     Returns truevalue if at least *one* of the given features is set in DISTRO_FEATURES,
@@ -169,6 +185,7 @@ def any_distro_features(d, features, truevalue="1", falsevalue=""):
     """
     return bb.utils.contains_any("DISTRO_FEATURES", features, truevalue, falsevalue, d)
 
+
 def parallel_make(d, makeinst=False):
     """
     Return the integer value for the number of parallel threads to use when
@@ -195,6 +212,7 @@ def parallel_make(d, makeinst=False):
 
     return ''
 
+
 def parallel_make_argument(d, fmt, limit=None, makeinst=False):
     """
     Helper utility to construct a parallel make argument from the number of
@@ -215,6 +233,7 @@ def parallel_make_argument(d, fmt, limit=None, makeinst=False):
         return fmt % v
     return ''
 
+
 def packages_filter_out_system(d):
     """
     Return a list of packages from PACKAGES with the "system" packages such as
@@ -230,6 +249,7 @@ def packages_filter_out_system(d):
             pkgs.append(pkg)
     return pkgs
 
+
 def getstatusoutput(cmd):
     return subprocess.getstatusoutput(cmd)
 
@@ -248,10 +268,12 @@ def trim_version(version, num_parts=2):
     trimmed = ".".join(parts[:num_parts])
     return trimmed
 
+
 def cpu_count(at_least=1):
     cpus = len(os.sched_getaffinity(0))
     return max(cpus, at_least)
 
+
 def execute_pre_post_process(d, cmds):
     if cmds is None:
         return
@@ -265,6 +287,8 @@ def execute_pre_post_process(d, cmds):
 # For each item in items, call the function 'target' with item as the first 
 # argument, extraargs as the other arguments and handle any exceptions in the
 # parent thread
+
+
 def multiprocess_launch(target, items, d, extraargs=None):
 
     class ProcessLaunch(multiprocessing.Process):
@@ -340,10 +364,12 @@ def multiprocess_launch(target, items, d, extraargs=None):
         bb.fatal("Fatal errors occurred in subprocesses:\n%s" % msg)
     return results
 
+
 def squashspaces(string):
     import re
     return re.sub(r"\s+", " ", string).strip()
 
+
 def format_pkg_list(pkg_dict, ret_format=None):
     output = []
 
@@ -452,11 +478,14 @@ def get_multilib_datastore(variant, d):
 # so implement a version here
 #
 
+
 from queue import Queue
 from threading import Thread
 
+
 class ThreadedWorker(Thread):
     """Thread executing tasks from a given tasks queue"""
+
     def __init__(self, tasks, worker_init, worker_end):
         Thread.__init__(self)
         self.tasks = tasks
@@ -486,8 +515,10 @@ class ThreadedWorker(Thread):
             finally:
                 self.tasks.task_done()
 
+
 class ThreadedPool:
     """Pool of threads consuming tasks from a queue"""
+
     def __init__(self, num_workers, num_tasks, worker_init=None,
             worker_end=None):
         self.tasks = Queue(num_tasks)
@@ -511,6 +542,7 @@ class ThreadedPool:
         for worker in self.workers:
             worker.join()
 
+
 def write_ld_so_conf(d):
     # Some utils like prelink may not have the correct target library paths
     # so write an ld.so.conf to help them
@@ -522,6 +554,7 @@ def write_ld_so_conf(d):
         f.write(d.getVar("base_libdir") + '\n')
         f.write(d.getVar("libdir") + '\n')
 
+
 class ImageQAFailed(Exception):
     def __init__(self, description, name=None, logfile=None):
         self.description = description
@@ -535,10 +568,12 @@ class ImageQAFailed(Exception):
 
         return msg
 
+
 def sh_quote(string):
     import shlex
     return shlex.quote(string)
 
+
 def directory_size(root, blocksize=4096):
     """
     Calculate the size of the directory, taking into account hard links,
diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 5f1805d86c..5c2a87a649 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -142,7 +142,6 @@ class BuildPerfTestResult(unittest.TextTestResult):
                    [('SKIPPED', t, m) for t, m in self.skipped]
         return sorted(compound, key=lambda info: info[1].start_time)
 
-
     def write_buildstats_json(self):
         """Write buildstats file"""
         buildstats = OrderedDict()
@@ -152,7 +151,6 @@ class BuildPerfTestResult(unittest.TextTestResult):
         with open(os.path.join(self.out_dir, 'buildstats.json'), 'w') as fobj:
             json.dump(buildstats, fobj, cls=ResultsJsonEncoder)
 
-
     def write_results_json(self):
         """Write test results into a json-formatted file"""
         results = OrderedDict([('tester_host', self.hostname),
diff --git a/meta/lib/oeqa/buildperf/test_basic.py b/meta/lib/oeqa/buildperf/test_basic.py
index 2104617ba3..0d4537ca24 100644
--- a/meta/lib/oeqa/buildperf/test_basic.py
+++ b/meta/lib/oeqa/buildperf/test_basic.py
@@ -10,6 +10,7 @@ import oe.path
 from oeqa.buildperf import BuildPerfTestCase
 from oeqa.utils.commands import get_bb_var, get_bb_vars
 
+
 class Test1P1(BuildPerfTestCase):
     build_target = 'core-image-sato'
 
diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index c22bc2833d..fab9cde8bd 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/masterimage.py
@@ -24,6 +24,7 @@ from oeqa.utils import CommandError
 
 from abc import ABCMeta, abstractmethod
 
+
 class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta):
 
     supported_image_fstypes = ['tar.gz', 'tar.bz2']
diff --git a/meta/lib/oeqa/controllers/testtargetloader.py b/meta/lib/oeqa/controllers/testtargetloader.py
index 9ef039050e..038d29bd39 100644
--- a/meta/lib/oeqa/controllers/testtargetloader.py
+++ b/meta/lib/oeqa/controllers/testtargetloader.py
@@ -7,6 +7,8 @@ import bb
 import os
 
 # This class is responsible for loading a test target controller
+
+
 class TestTargetLoader:
 
     # Search oeqa.controllers module directory for and return a controller  
diff --git a/meta/lib/oeqa/core/case.py b/meta/lib/oeqa/core/case.py
index 7ddfd07677..afb34a35cf 100644
--- a/meta/lib/oeqa/core/case.py
+++ b/meta/lib/oeqa/core/case.py
@@ -10,6 +10,7 @@ import unittest
 
 from oeqa.core.exception import OEQAMissingVariable
 
+
 def _validate_td_vars(td, td_vars, type_msg):
     if td_vars:
         for v in td_vars:
@@ -17,6 +18,7 @@ def _validate_td_vars(td, td_vars, type_msg):
                 raise OEQAMissingVariable("Test %s need %s variable but"
                         " isn't into td" % (type_msg, v))
 
+
 class OETestCase(unittest.TestCase):
     # TestContext and Logger instance set by OETestLoader.
     tc = None
@@ -57,6 +59,7 @@ class OETestCase(unittest.TestCase):
             d.tearDownDecorator()
         self.tearDownMethod()
 
+
 class OEPTestResultTestCase:
     """
     Mix-in class to provide functions to make interacting with extraresults for
diff --git a/meta/lib/oeqa/core/cases/example/test_basic.py b/meta/lib/oeqa/core/cases/example/test_basic.py
index d77edcdcec..686fbca09e 100644
--- a/meta/lib/oeqa/core/cases/example/test_basic.py
+++ b/meta/lib/oeqa/core/cases/example/test_basic.py
@@ -6,6 +6,7 @@
 from oeqa.core.case import OETestCase
 from oeqa.core.decorator.depends import OETestDepends
 
+
 class OETestExample(OETestCase):
     def test_example(self):
         self.logger.info('IMAGE: %s' % self.td.get('IMAGE'))
@@ -13,6 +14,7 @@ class OETestExample(OETestCase):
         self.logger.info('ARCH: %s' % self.td.get('ARCH'))
         self.assertEqual('x86', self.td.get('ARCH'))
 
+
 class OETestExampleDepend(OETestCase):
     @OETestDepends(['OETestExample.test_example'])
     def test_example_depends(self):
diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 5e647d11c8..995c8ab521 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -15,6 +15,7 @@ from oeqa.core.loader import OETestLoader
 from oeqa.core.runner import OETestRunner
 from oeqa.core.exception import OEQAMissingManifest, OEQATestNotFound
 
+
 class OETestContext(object):
     loaderClass = OETestLoader
     runnerClass = OETestRunner
@@ -49,6 +50,7 @@ class OETestContext(object):
     def skipTests(self, skips):
         if not skips:
             return
+
         def skipfuncgen(skipmsg):
             def func():
                 raise unittest.SkipTest(skipmsg)
@@ -97,6 +99,7 @@ class OETestContext(object):
         self.runner = self.runnerClass(self, verbosity=2)
         return self.runner.list_tests(self.suites, display_type)
 
+
 class OETestContextExecutor(object):
     _context_class = OETestContext
     _script_executor = 'oe-test'
@@ -243,4 +246,5 @@ class OETestContextExecutor(object):
 
         return rc
 
+
 _executor_class = OETestContextExecutor
diff --git a/meta/lib/oeqa/core/decorator/__init__.py b/meta/lib/oeqa/core/decorator/__init__.py
index 1a82518ab6..d581597aba 100644
--- a/meta/lib/oeqa/core/decorator/__init__.py
+++ b/meta/lib/oeqa/core/decorator/__init__.py
@@ -10,10 +10,12 @@ from oeqa.core.utils.misc import strToList
 
 decoratorClasses = set()
 
+
 def registerDecorator(cls):
     decoratorClasses.add(cls)
     return cls
 
+
 class OETestDecorator(object, metaclass=ABCMeta):
     case = None # Reference of OETestCase decorated
     attrs = None # Attributes to be loaded by decorator implementation
@@ -56,6 +58,7 @@ class OETestDecorator(object, metaclass=ABCMeta):
     def tearDownDecorator(self):
         pass
 
+
 class OETestDiscover(OETestDecorator):
 
     # OETestLoader call it after discover test cases
@@ -64,10 +67,12 @@ class OETestDiscover(OETestDecorator):
     def discover(registry):
         return registry['cases']
 
+
 def OETestTag(*tags):
     expandedtags = []
     for tag in tags:
         expandedtags += strToList(tag)
+
     def decorator(item):
         if hasattr(item, "__oeqa_testtags"):
             # do not append, create a new list (to handle classes with inheritance)
diff --git a/meta/lib/oeqa/core/decorator/data.py b/meta/lib/oeqa/core/decorator/data.py
index 23555bc8d3..82aac0b873 100644
--- a/meta/lib/oeqa/core/decorator/data.py
+++ b/meta/lib/oeqa/core/decorator/data.py
@@ -8,6 +8,7 @@ from oeqa.core.exception import OEQAMissingVariable
 
 from . import OETestDecorator, registerDecorator
 
+
 def has_feature(td, feature):
     """
         Checks for feature in DISTRO_FEATURES or IMAGE_FEATURES.
@@ -18,6 +19,7 @@ def has_feature(td, feature):
         return True
     return False
 
+
 def has_machine(td, machine):
     """
         Checks for MACHINE.
@@ -27,6 +29,7 @@ def has_machine(td, machine):
         return True
     return False
 
+
 def is_qemu(td, qemu):
     """
         Checks if MACHINE is qemu.
@@ -38,6 +41,7 @@ def is_qemu(td, qemu):
         return True
     return False
 
+
 @registerDecorator
 class skipIfDataVar(OETestDecorator):
     """
@@ -57,6 +61,7 @@ class skipIfDataVar(OETestDecorator):
         if self.case.td.get(self.var) == self.value:
             self.case.skipTest(self.msg)
 
+
 @registerDecorator
 class skipIfNotDataVar(OETestDecorator):
     """
@@ -76,6 +81,7 @@ class skipIfNotDataVar(OETestDecorator):
         if not self.case.td.get(self.var) == self.value:
             self.case.skipTest(self.msg)
 
+
 @registerDecorator
 class skipIfInDataVar(OETestDecorator):
     """
@@ -83,6 +89,7 @@ class skipIfInDataVar(OETestDecorator):
     """
 
     attrs = ('var', 'value', 'msg')
+
     def setUpDecorator(self):
         msg = ('Checking if %r value contains %r to skip '
               'the test' % (self.var, self.value))
@@ -90,6 +97,7 @@ class skipIfInDataVar(OETestDecorator):
         if self.value in (self.case.td.get(self.var)):
             self.case.skipTest(self.msg)
 
+
 @registerDecorator
 class skipIfNotInDataVar(OETestDecorator):
     """
@@ -97,6 +105,7 @@ class skipIfNotInDataVar(OETestDecorator):
     """
 
     attrs = ('var', 'value', 'msg')
+
     def setUpDecorator(self):
         msg = ('Checking if %r value contains %r to run '
               'the test' % (self.var, self.value))
@@ -104,6 +113,7 @@ class skipIfNotInDataVar(OETestDecorator):
         if not self.value in (self.case.td.get(self.var) or ""):
             self.case.skipTest(self.msg)
 
+
 @registerDecorator
 class OETestDataDepends(OETestDecorator):
     attrs = ('td_depends',)
@@ -116,6 +126,7 @@ class OETestDataDepends(OETestDecorator):
                 raise OEQAMissingVariable("Test case need %s variable but"
                         " isn't into td" % v)
 
+
 @registerDecorator
 class skipIfNotFeature(OETestDecorator):
     """
@@ -134,6 +145,7 @@ class skipIfNotFeature(OETestDecorator):
         if not has_feature(self.case.td, self.value):
             self.case.skipTest(self.msg)
 
+
 @registerDecorator
 class skipIfFeature(OETestDecorator):
     """
@@ -152,6 +164,7 @@ class skipIfFeature(OETestDecorator):
         if has_feature(self.case.td, self.value):
             self.case.skipTest(self.msg)
 
+
 @registerDecorator
 class skipIfNotMachine(OETestDecorator):
     """
@@ -169,6 +182,7 @@ class skipIfNotMachine(OETestDecorator):
         if not has_machine(self.case.td, self.value):
             self.case.skipTest(self.msg)
 
+
 @registerDecorator
 class skipIfMachine(OETestDecorator):
     """
@@ -186,6 +200,7 @@ class skipIfMachine(OETestDecorator):
         if has_machine(self.case.td, self.value):
             self.case.skipTest(self.msg)
 
+
 @registerDecorator
 class skipIfNotQemu(OETestDecorator):
     """
@@ -203,6 +218,7 @@ class skipIfNotQemu(OETestDecorator):
         if not is_qemu(self.case.td, self.value):
             self.case.skipTest(self.msg)
 
+
 @registerDecorator
 class skipIfQemu(OETestDecorator):
     """
diff --git a/meta/lib/oeqa/core/decorator/depends.py b/meta/lib/oeqa/core/decorator/depends.py
index eef5c8f7ab..c75407e419 100644
--- a/meta/lib/oeqa/core/decorator/depends.py
+++ b/meta/lib/oeqa/core/decorator/depends.py
@@ -10,6 +10,7 @@ from oeqa.core.exception import OEQADependency
 
 from . import OETestDiscover, registerDecorator
 
+
 def _add_depends(registry, case, depends):
     module_name = case.__module__
     class_name = case.__class__.__name__
@@ -31,6 +32,7 @@ def _add_depends(registry, case, depends):
         if not depend_id in registry[case_id]:
             registry[case_id].append(depend_id)
 
+
 def _validate_test_case_depends(cases, depends):
     for case in depends:
         if not case in cases:
@@ -40,6 +42,7 @@ def _validate_test_case_depends(cases, depends):
                 raise OEQADependency("TestCase %s depends on %s and isn't available"
                        ", cases available %s." % (case, dep, str(cases.keys())))
 
+
 def _order_test_case_by_depends(cases, depends):
     def _dep_resolve(graph, node, resolved, seen):
         seen.append(node)
@@ -65,6 +68,7 @@ def _order_test_case_by_depends(cases, depends):
 
     return [cases[case_id] for case_id in cases_ordered]
 
+
 def _skipTestDependency(case, depends):
     for dep in depends:
         found = False
@@ -76,6 +80,7 @@ def _skipTestDependency(case, depends):
             raise SkipTest("Test case %s depends on %s but it didn't pass/run."
                         % (case.id(), dep))
 
+
 @registerDecorator
 class OETestDepends(OETestDiscover):
     attrs = ('depends',)
diff --git a/meta/lib/oeqa/core/decorator/oetimeout.py b/meta/lib/oeqa/core/decorator/oetimeout.py
index 5e6873ad48..d2442352f8 100644
--- a/meta/lib/oeqa/core/decorator/oetimeout.py
+++ b/meta/lib/oeqa/core/decorator/oetimeout.py
@@ -8,12 +8,14 @@ import signal
 from . import OETestDecorator, registerDecorator
 from oeqa.core.exception import OEQATimeoutError
 
+
 @registerDecorator
 class OETimeout(OETestDecorator):
     attrs = ('oetimeout',)
 
     def setUpDecorator(self):
         timeout = self.oetimeout
+
         def _timeoutHandler(signum, frame):
             raise OEQATimeoutError("Timed out after %s "
                     "seconds of execution" % timeout)
diff --git a/meta/lib/oeqa/core/exception.py b/meta/lib/oeqa/core/exception.py
index 05be0ed21f..1e649caee4 100644
--- a/meta/lib/oeqa/core/exception.py
+++ b/meta/lib/oeqa/core/exception.py
@@ -4,23 +4,30 @@
 # SPDX-License-Identifier: MIT
 #
 
+
 class OEQAException(Exception):
     pass
 
+
 class OEQATimeoutError(OEQAException):
     pass
 
+
 class OEQAMissingVariable(OEQAException):
     pass
 
+
 class OEQADependency(OEQAException):
     pass
 
+
 class OEQAMissingManifest(OEQAException):
     pass
 
+
 class OEQAPreRun(OEQAException):
     pass
 
+
 class OEQATestNotFound(OEQAException):
     pass
diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index 7f7c96cdd6..3cc1d6b669 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -31,12 +31,14 @@ _failed_test_args = inspect.getfullargspec(unittest.loader._make_failed_test).ar
 exec("""def _make_failed_test(%s): raise exception""" % ', '.join(_failed_test_args))
 unittest.loader._make_failed_test = _make_failed_test
 
+
 def _find_duplicated_modules(suite, directory):
     for module in getSuiteModules(suite):
         path = findFile('%s.py' % module, directory)
         if path:
             raise ImportError("Duplicated %s module found in %s" % (module, path))
 
+
 def _built_modules_dict(modules):
     modules_dict = {}
 
@@ -61,6 +63,7 @@ def _built_modules_dict(modules):
 
     return modules_dict
 
+
 class OETestLoader(unittest.TestLoader):
     caseClass = OETestCase
 
@@ -313,7 +316,6 @@ class OETestLoader(unittest.TestLoader):
 
         return (load_module, load_underscore)
 
-
     # XXX After Python 3.5, remove backward compatibility hacks for
     # use_load_tests deprecation via *args and **kws.  See issue 16662.
     if sys.version_info >= (3, 5):
diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index d2e7ab5462..5672f17adc 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -15,6 +15,7 @@ import sys
 from unittest import TextTestResult as _TestResult
 from unittest import TextTestRunner as _TestRunner
 
+
 class OEStreamLogger(object):
     def __init__(self, logger):
         self.logger = logger
@@ -35,6 +36,7 @@ class OEStreamLogger(object):
         for handler in self.logger.handlers:
             handler.flush()
 
+
 class OETestResult(_TestResult):
     def __init__(self, tc, *args, **kwargs):
         super(OETestResult, self).__init__(*args, **kwargs)
@@ -229,10 +231,12 @@ class OETestResult(_TestResult):
         # Override as we unexpected successes aren't failures for us
         return (len(self.failures) == len(self.errors) == 0)
 
+
 class OEListTestsResult(object):
     def wasSuccessful(self):
         return True
 
+
 class OETestRunner(_TestRunner):
     streamLoggerClass = OEStreamLogger
 
@@ -279,6 +283,7 @@ class OETestRunner(_TestRunner):
         self._walked_cases = 0
 
         curr = {}
+
         def _list_classes(logger, case):
             if not 'module' in curr or curr['module'] != case.__module__:
                 curr['module'] = case.__module__
@@ -298,6 +303,7 @@ class OETestRunner(_TestRunner):
         self._walked_cases = 0
 
         listed = []
+
         def _list_modules(logger, case):
             if not case.__module__ in listed:
                 if case.__module__.startswith('_'):
@@ -319,6 +325,7 @@ class OETestRunner(_TestRunner):
 
         return OEListTestsResult()
 
+
 class OETestResultJSONHelper(object):
 
     testresult_filename = 'testresults.json'
diff --git a/meta/lib/oeqa/core/target/__init__.py b/meta/lib/oeqa/core/target/__init__.py
index 1382aa9b52..765f842938 100644
--- a/meta/lib/oeqa/core/target/__init__.py
+++ b/meta/lib/oeqa/core/target/__init__.py
@@ -6,6 +6,7 @@
 
 from abc import abstractmethod
 
+
 class OETarget(object):
 
     def __init__(self, logger, *args, **kwargs):
diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/qemu.py
index bb93b4ee99..6d6561333b 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -19,6 +19,7 @@ from oeqa.utils.dump import TargetDumper
 
 supported_fstypes = ['ext3', 'ext4', 'cpio.gz', 'wic']
 
+
 class OEQemuTarget(OESSHTarget):
     def __init__(self, logger, server_ip, timeout=300, user='root',
             port=None, machine='', rootfs='', kernel='', kvm=False, slirp=False,
diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 67bbe639d9..c9edf1f602 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -13,6 +13,7 @@ import codecs
 
 from . import OETarget
 
+
 class OESSHTarget(OETarget):
     def __init__(self, logger, ip, server_ip, timeout=300, user='root',
                  port=None, server_port=0, **kwargs):
@@ -169,7 +170,6 @@ class OESSHTarget(OETarget):
 
         self.run(cmd)
 
-
     def deleteDir(self, remotePath):
         """
             Deletes target's remotePath directory.
@@ -178,7 +178,6 @@ class OESSHTarget(OETarget):
         cmd = "rmdir %s" % remotePath
         self.run(cmd)
 
-
     def deleteDirStructure(self, localPath, remotePath):
         """
         Delete recursively localPath structure directory in target's remotePath.
@@ -217,6 +216,7 @@ class OESSHTarget(OETarget):
                 remoteDir = os.path.join(remotePath, tmpDir.lstrip("/"))
                 self.deleteDir(remoteDir)
 
+
 def SSHCall(command, logger, timeout=None, **opts):
 
     def run():
diff --git a/meta/lib/oeqa/core/tests/cases/data.py b/meta/lib/oeqa/core/tests/cases/data.py
index 42baa708bf..c933f9e081 100644
--- a/meta/lib/oeqa/core/tests/cases/data.py
+++ b/meta/lib/oeqa/core/tests/cases/data.py
@@ -8,6 +8,7 @@ from oeqa.core.case import OETestCase
 from oeqa.core.decorator import OETestTag
 from oeqa.core.decorator.data import OETestDataDepends
 
+
 class DataTest(OETestCase):
     data_vars = ['IMAGE', 'ARCH']
 
diff --git a/meta/lib/oeqa/core/tests/cases/depends.py b/meta/lib/oeqa/core/tests/cases/depends.py
index 46e7db900d..a7032ce1dc 100644
--- a/meta/lib/oeqa/core/tests/cases/depends.py
+++ b/meta/lib/oeqa/core/tests/cases/depends.py
@@ -7,6 +7,7 @@
 from oeqa.core.case import OETestCase
 from oeqa.core.decorator.depends import OETestDepends
 
+
 class DependsTest(OETestCase):
 
     def testDependsFirst(self):
diff --git a/meta/lib/oeqa/core/tests/cases/loader/valid/another.py b/meta/lib/oeqa/core/tests/cases/loader/valid/another.py
index bedc20c8a6..834a8b6132 100644
--- a/meta/lib/oeqa/core/tests/cases/loader/valid/another.py
+++ b/meta/lib/oeqa/core/tests/cases/loader/valid/another.py
@@ -6,6 +6,7 @@
 
 from oeqa.core.case import OETestCase
 
+
 class AnotherTest(OETestCase):
 
     def testAnother(self):
diff --git a/meta/lib/oeqa/core/tests/cases/oetag.py b/meta/lib/oeqa/core/tests/cases/oetag.py
index 52f97dfda6..6b89e011e6 100644
--- a/meta/lib/oeqa/core/tests/cases/oetag.py
+++ b/meta/lib/oeqa/core/tests/cases/oetag.py
@@ -7,6 +7,7 @@
 from oeqa.core.case import OETestCase
 from oeqa.core.decorator import OETestTag
 
+
 class TagTest(OETestCase):
     @OETestTag('goodTag')
     def testTagGood(self):
@@ -23,6 +24,7 @@ class TagTest(OETestCase):
     def testTagNone(self):
         self.assertTrue(True, msg='How is this possible?')
 
+
 @OETestTag('classTag')
 class TagClassTest(OETestCase):
     @OETestTag('otherTag')
diff --git a/meta/lib/oeqa/core/tests/cases/timeout.py b/meta/lib/oeqa/core/tests/cases/timeout.py
index 69cf969a67..b793fbfaf9 100644
--- a/meta/lib/oeqa/core/tests/cases/timeout.py
+++ b/meta/lib/oeqa/core/tests/cases/timeout.py
@@ -10,6 +10,7 @@ from oeqa.core.case import OETestCase
 from oeqa.core.decorator.oetimeout import OETimeout
 from oeqa.core.decorator.depends import OETestDepends
 
+
 class TimeoutTest(OETestCase):
 
     @OETimeout(1)
@@ -21,7 +22,6 @@ class TimeoutTest(OETestCase):
         sleep(2)
         self.assertTrue(True, msg='How is this possible?')
 
-
     def testTimeoutSkip(self):
         self.skipTest("This test needs to be skipped, so that testTimeoutDepends()'s OETestDepends kicks in")
 
diff --git a/meta/lib/oeqa/core/tests/common.py b/meta/lib/oeqa/core/tests/common.py
index 88cc758ad3..e513b5b602 100644
--- a/meta/lib/oeqa/core/tests/common.py
+++ b/meta/lib/oeqa/core/tests/common.py
@@ -18,12 +18,14 @@ formatter = logging.Formatter('OEQATest: %(message)s')
 consoleHandler.setFormatter(formatter)
 logger.addHandler(consoleHandler)
 
+
 def setup_sys_path():
     directory = os.path.dirname(os.path.abspath(__file__))
     oeqa_lib = os.path.realpath(os.path.join(directory, '../../../'))
     if not oeqa_lib in sys.path:
         sys.path.insert(0, oeqa_lib)
 
+
 class TestBase(unittest.TestCase):
     def setUp(self):
         self.logger = logger
diff --git a/meta/lib/oeqa/core/tests/test_data.py b/meta/lib/oeqa/core/tests/test_data.py
index 6fddbb4e96..59f0ee4364 100755
--- a/meta/lib/oeqa/core/tests/test_data.py
+++ b/meta/lib/oeqa/core/tests/test_data.py
@@ -15,6 +15,7 @@ setup_sys_path()
 from oeqa.core.exception import OEQAMissingVariable
 from oeqa.core.utils.test import getCaseMethod, getSuiteCasesNames
 
+
 class TestData(TestBase):
     modules = ['data']
 
@@ -51,5 +52,6 @@ class TestData(TestBase):
         tc = self._testLoader(d=d, modules=self.modules)
         self.assertEqual(True, tc.runTests().wasSuccessful())
 
+
 if __name__ == '__main__':
     unittest.main()
diff --git a/meta/lib/oeqa/core/tests/test_decorators.py b/meta/lib/oeqa/core/tests/test_decorators.py
index 5853aa0027..54a2638ba8 100755
--- a/meta/lib/oeqa/core/tests/test_decorators.py
+++ b/meta/lib/oeqa/core/tests/test_decorators.py
@@ -14,6 +14,7 @@ setup_sys_path()
 from oeqa.core.exception import OEQADependency
 from oeqa.core.utils.test import getCaseMethod, getSuiteCasesNames, getSuiteCasesIDs
 
+
 class TestTagDecorator(TestBase):
     def _runTest(self, modules, filterfn, expect):
         tc = self._testLoader(modules=modules, tags_filter=filterfn)
@@ -67,6 +68,7 @@ class TestTagDecorator(TestBase):
                 'oetag.TagClassTest.testTagNone',
                 })
 
+
 class TestDependsDecorator(TestBase):
     modules = ['depends']
 
@@ -112,6 +114,7 @@ class TestDependsDecorator(TestBase):
             msg = 'Expected OEQADependency exception having a circular dependency'
             self.assertTrue(result, msg=msg)
 
+
 class TestTimeoutDecorator(TestBase):
     modules = ['timeout']
 
@@ -139,5 +142,6 @@ class TestTimeoutDecorator(TestBase):
         tc = self._testLoader(modules=self.modules, tests=tests)
         self.assertTrue(tc.runTests().wasSuccessful(), msg=msg)
 
+
 if __name__ == '__main__':
     unittest.main()
diff --git a/meta/lib/oeqa/core/tests/test_loader.py b/meta/lib/oeqa/core/tests/test_loader.py
index cb38ac845e..0f687be480 100755
--- a/meta/lib/oeqa/core/tests/test_loader.py
+++ b/meta/lib/oeqa/core/tests/test_loader.py
@@ -14,6 +14,7 @@ setup_sys_path()
 from oeqa.core.exception import OEQADependency
 from oeqa.core.utils.test import getSuiteModules, getSuiteCasesIDs
 
+
 class TestLoader(TestBase):
     @unittest.skip("invalid directory is missing oetag.py")
     def test_fail_duplicated_module(self):
@@ -59,5 +60,6 @@ class TestLoader(TestBase):
         msg = 'Expected modules from two different paths'
         self.assertEqual(modules, expected_modules, msg=msg)
 
+
 if __name__ == '__main__':
     unittest.main()
diff --git a/meta/lib/oeqa/core/tests/test_runner.py b/meta/lib/oeqa/core/tests/test_runner.py
index 205464cfae..b6bbc08c52 100755
--- a/meta/lib/oeqa/core/tests/test_runner.py
+++ b/meta/lib/oeqa/core/tests/test_runner.py
@@ -14,6 +14,7 @@ setup_sys_path()
 
 from oeqa.core.runner import OEStreamLogger
 
+
 class TestRunner(TestBase):
     def test_stream_logger(self):
         fp = tempfile.TemporaryFile(mode='w+')
@@ -36,5 +37,6 @@ class TestRunner(TestBase):
 
         fp.close()
 
+
 if __name__ == '__main__':
     unittest.main()
diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index 98067c0e8c..089ee8e665 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -46,6 +46,8 @@ _all__ = [
 # Patch the version from testtools to allow access to _test_start and allow
 # computation of timing information and threading progress
 #
+
+
 class BBThreadsafeForwardingResult(ThreadsafeForwardingResult):
 
     def __init__(self, target, semaphore, threadnum, totalinprocess, totaltests, output, finalresult):
@@ -79,6 +81,7 @@ class BBThreadsafeForwardingResult(ThreadsafeForwardingResult):
         self.finalresult._stdout_buffer = io.StringIO()
         super(BBThreadsafeForwardingResult, self)._add_result_with_semaphore(method, test, *args, **kwargs)
 
+
 class ProxyTestResult:
     # a very basic TestResult proxy, in order to modify add* calls
     def __init__(self, target):
@@ -111,6 +114,7 @@ class ProxyTestResult:
     def __getattr__(self, attr):
         return getattr(self.result, attr)
 
+
 class ExtraResultsDecoderTestResult(ProxyTestResult):
     def _addResult(self, method, test, *args, exception=False, **kwargs):
         if "details" in kwargs and "extraresults" in kwargs["details"]:
@@ -125,6 +129,7 @@ class ExtraResultsDecoderTestResult(ProxyTestResult):
                 kwargs["details"]["extraresults"] = extraresults
         return method(test, *args, **kwargs)
 
+
 class ExtraResultsEncoderTestResult(ProxyTestResult):
     def _addResult(self, method, test, *args, exception=False, **kwargs):
         if hasattr(test, "extraresults"):
@@ -147,6 +152,8 @@ class ExtraResultsEncoderTestResult(ProxyTestResult):
 # outside of a running test case. This can happen if classSetUp() fails
 # for a class of tests. This unfortunately has horrible internal knowledge.
 #
+
+
 def outSideTestaddError(self, offset, line):
     """An 'error:' directive has been read."""
     test_name = line[offset:-1].decode('utf8')
@@ -156,12 +163,15 @@ def outSideTestaddError(self, offset, line):
     self.parser._reading_error_details.set_simple()
     self.parser.subunitLineReceived(line)
 
+
 subunit._OutSideTest.addError = outSideTestaddError
 
 # Like outSideTestaddError above, we need an equivalent for skips
 # happening at the setUpClass() level, otherwise we will see "UNKNOWN"
 # as a result for concurrent tests
 #
+
+
 def outSideTestaddSkip(self, offset, line):
     """A 'skip:' directive has been read."""
     test_name = line[offset:-1].decode('utf8')
@@ -171,6 +181,7 @@ def outSideTestaddSkip(self, offset, line):
     self.parser._reading_skip_details.set_simple()
     self.parser.subunitLineReceived(line)
 
+
 subunit._OutSideTest.addSkip = outSideTestaddSkip
 
 #
@@ -178,15 +189,20 @@ subunit._OutSideTest.addSkip = outSideTestaddSkip
 # is available and accepts writes. This allows unittest with buffer=True
 # to interact ok with subunit which wants to access sys.stdout.buffer.
 #
+
+
 class dummybuf(object):
    def __init__(self, parent):
        self.p = parent
+
    def write(self, data):
        self.p.write(data.decode("utf-8"))
 
 #
 # Taken from testtools.ConncurrencyTestSuite but modified for OE use
 #
+
+
 class ConcurrentTestSuite(unittest.TestSuite):
 
     def __init__(self, suite, processes, setupfunc, removefunc):
@@ -236,6 +252,7 @@ class ConcurrentTestSuite(unittest.TestSuite):
         finally:
             queue.put(testserver)
 
+
 def fork_for_tests(concurrency_num, suite):
     testservers = []
     if 'BUILDDIR' in os.environ:
@@ -311,6 +328,7 @@ def fork_for_tests(concurrency_num, suite):
             testservers.append((testserver, numtests, output))
     return testservers, totaltests
 
+
 def partition_tests(suite, count):
     # Keep tests from the same class together but allow tests from modules
     # to go to different processes to aid parallelisation.
diff --git a/meta/lib/oeqa/core/utils/misc.py b/meta/lib/oeqa/core/utils/misc.py
index e1a59588eb..5f1e63a1dc 100644
--- a/meta/lib/oeqa/core/utils/misc.py
+++ b/meta/lib/oeqa/core/utils/misc.py
@@ -4,6 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
+
 def toList(obj, obj_type, obj_name="Object"):
     if isinstance(obj, obj_type):
         return [obj]
@@ -12,6 +13,7 @@ def toList(obj, obj_type, obj_name="Object"):
     else:
         raise TypeError("%s must be %s or list" % (obj_name, obj_type))
 
+
 def toSet(obj, obj_type, obj_name="Object"):
     if isinstance(obj, obj_type):
         return {obj}
@@ -22,15 +24,19 @@ def toSet(obj, obj_type, obj_name="Object"):
     else:
         raise TypeError("%s must be %s or set" % (obj_name, obj_type))
 
+
 def strToList(obj, obj_name="Object"):
     return toList(obj, str, obj_name)
 
+
 def strToSet(obj, obj_name="Object"):
     return toSet(obj, str, obj_name)
 
+
 def intToList(obj, obj_name="Object"):
     return toList(obj, int, obj_name)
 
+
 def dataStoteToDict(d, variables):
     data = {}
 
@@ -39,6 +45,7 @@ def dataStoteToDict(d, variables):
 
     return data
 
+
 def updateTestData(d, td, variables):
     """
     Updates variables with values of data store to test data.
diff --git a/meta/lib/oeqa/core/utils/path.py b/meta/lib/oeqa/core/utils/path.py
index c086dcb0b0..803601ddf7 100644
--- a/meta/lib/oeqa/core/utils/path.py
+++ b/meta/lib/oeqa/core/utils/path.py
@@ -7,6 +7,7 @@
 import os
 import sys
 
+
 def findFile(file_name, directory):
     """
         Search for a file in directory and returns its complete path.
@@ -16,6 +17,7 @@ def findFile(file_name, directory):
             return os.path.join(r, file_name)
     return None
 
+
 def remove_safe(path):
     if os.path.exists(path):
         os.remove(path)
diff --git a/meta/lib/oeqa/core/utils/test.py b/meta/lib/oeqa/core/utils/test.py
index d38cab8a51..21d5e5ed04 100644
--- a/meta/lib/oeqa/core/utils/test.py
+++ b/meta/lib/oeqa/core/utils/test.py
@@ -8,6 +8,7 @@ import os
 import inspect
 import unittest
 
+
 def getSuiteCases(suite):
     """
         Returns individual test from a test suite.
@@ -22,6 +23,7 @@ def getSuiteCases(suite):
 
     return tests
 
+
 def getSuiteModules(suite):
     """
         Returns modules in a test suite.
@@ -31,6 +33,7 @@ def getSuiteModules(suite):
         modules.add(getCaseModule(test))
     return modules
 
+
 def getSuiteCasesInfo(suite, func):
     """
         Returns test case info from suite. Info is fetched from func.
@@ -40,48 +43,56 @@ def getSuiteCasesInfo(suite, func):
         tests.append(func(test))
     return tests
 
+
 def getSuiteCasesNames(suite):
     """
         Returns test case names from suite.
     """
     return getSuiteCasesInfo(suite, getCaseMethod)
 
+
 def getSuiteCasesIDs(suite):
     """
         Returns test case ids from suite.
     """
     return getSuiteCasesInfo(suite, getCaseID)
 
+
 def getSuiteCasesFiles(suite):
     """
         Returns test case files paths from suite.
     """
     return getSuiteCasesInfo(suite, getCaseFile)
 
+
 def getCaseModule(test_case):
     """
         Returns test case module name.
     """
     return test_case.__module__
 
+
 def getCaseClass(test_case):
     """
         Returns test case class name.
     """
     return test_case.__class__.__name__
 
+
 def getCaseID(test_case):
     """
         Returns test case complete id.
     """
     return test_case.id()
 
+
 def getCaseFile(test_case):
     """
         Returns test case file path.
     """
     return inspect.getsourcefile(test_case.__class__)
 
+
 def getCaseMethod(test_case):
     """
         Returns test case method name.
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 815f2a4c02..0776b54d2a 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -34,6 +34,7 @@ from oeqa.utils.decorators import LogResults, gettag, getResults
 
 logger = logging.getLogger("BitBake")
 
+
 def getVar(obj):
     #extend form dict, if a variable didn't exists, need find it in testcase
     class VarDict(dict):
@@ -41,9 +42,11 @@ def getVar(obj):
             return gettag(obj, key)
     return VarDict()
 
+
 def checkTags(tc, tagexp):
     return eval(tagexp, None, getVar(tc))
 
+
 def filterByTagExp(testsuite, tagexp):
     if not tagexp:
         return testsuite
@@ -56,6 +59,7 @@ def filterByTagExp(testsuite, tagexp):
             caseList.append(filterByTagExp(each, tagexp))
     return testsuite.__class__(caseList)
 
+
 @LogResults
 class oeTest(unittest.TestCase):
 
@@ -88,6 +92,7 @@ class oeTest(unittest.TestCase):
         else:
             return False
 
+
 class oeRuntimeTest(oeTest):
     def __init__(self, methodName='runTest'):
         self.target = oeRuntimeTest.tc.target
@@ -132,6 +137,7 @@ class oeRuntimeTest(oeTest):
     def tearDownLocal(self):
         pass
 
+
 def getmodule(pos=2):
     # stack returns a list of tuples containg frame information
     # First element of the list the is current frame, caller is 1
@@ -140,6 +146,7 @@ def getmodule(pos=2):
     #modname = inspect.getmodule(frameinfo[0]).__name__
     return modname
 
+
 def skipModule(reason, pos=2):
     modname = getmodule(pos)
     if modname not in oeTest.tc.testsrequired:
@@ -149,17 +156,22 @@ def skipModule(reason, pos=2):
                 "\nTest was required in TEST_SUITES, so either the condition for skipping is wrong"
                 "\nor the image really doesn't have the required feature/package when it should." % (modname, reason))
 
+
 def skipModuleIf(cond, reason):
 
     if cond:
         skipModule(reason, 3)
 
+
 def skipModuleUnless(cond, reason):
 
     if not cond:
         skipModule(reason, 3)
 
+
 _buffer_logger = ""
+
+
 def custom_verbose(msg, *args, **kwargs):
     global _buffer_logger
     if msg[-1] != "\n":
@@ -172,6 +184,7 @@ def custom_verbose(msg, *args, **kwargs):
             logger.info(_buffer_logger.rstrip("\n"), *args, **kwargs)
         _buffer_logger = ""
 
+
 class TestContext(object):
     def __init__(self, d, exported=False):
         self.d = d
@@ -361,6 +374,7 @@ class TestContext(object):
 
         return runner.run(self.suite)
 
+
 class RuntimeTestContext(TestContext):
     def __init__(self, d, target, exported=False):
         super(RuntimeTestContext, self).__init__(d, exported)
@@ -569,6 +583,7 @@ class RuntimeTestContext(TestContext):
             elif not install and rm:
                 self.target.connection.delete_dir_structure(src_dir, "/")
 
+
 class ImageTestContext(RuntimeTestContext):
     def __init__(self, d, target, host_dumper):
         super(ImageTestContext, self).__init__(d, target)
@@ -594,6 +609,7 @@ class ImageTestContext(RuntimeTestContext):
         pkg_dir = self.d.getVar("TEST_EXTRACTED_DIR")
         super(ImageTestContext, self).install_uninstall_packages(test_id, pkg_dir, install)
 
+
 class ExportTestContext(RuntimeTestContext):
     def __init__(self, d, target, exported=False, parsedArgs={}):
         """
diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
index fa0ec0ccf6..84276be8a0 100755
--- a/meta/lib/oeqa/runexported.py
+++ b/meta/lib/oeqa/runexported.py
@@ -37,6 +37,8 @@ from oeqa.utils.sshcontrol import SSHControl
 # this isn't pretty but we need a fake target object
 # for running the tests externally as we don't care
 # about deploy/start we only care about the connection methods (run, copy)
+
+
 class FakeTarget(object):
     def __init__(self, d):
         self.connection = None
@@ -69,6 +71,7 @@ class MyDataDict(dict):
     def getVar(self, key, unused=None):
         return self.get(key, "")
 
+
 def main():
 
     parser = argparse.ArgumentParser()
@@ -124,6 +127,7 @@ def main():
 
     return 0
 
+
 def extract_sdk(d):
     """
     Extract SDK if needed
@@ -143,6 +147,7 @@ def extract_sdk(d):
                 env_file = os.path.join(extract_path, f)
                 updateEnv(env_file)
 
+
 if __name__ == "__main__":
     try:
         ret = main()
diff --git a/meta/lib/oeqa/runtime/case.py b/meta/lib/oeqa/runtime/case.py
index f036982e1f..db463ef1d6 100644
--- a/meta/lib/oeqa/runtime/case.py
+++ b/meta/lib/oeqa/runtime/case.py
@@ -7,6 +7,7 @@
 from oeqa.core.case import OETestCase
 from oeqa.utils.package_manager import install_package, uninstall_package
 
+
 class OERuntimeTestCase(OETestCase):
     # target instance set by OERuntimeTestLoader.
     target = None
diff --git a/meta/lib/oeqa/runtime/cases/_qemutiny.py b/meta/lib/oeqa/runtime/cases/_qemutiny.py
index 6886e36502..cb2a115872 100644
--- a/meta/lib/oeqa/runtime/cases/_qemutiny.py
+++ b/meta/lib/oeqa/runtime/cases/_qemutiny.py
@@ -4,6 +4,7 @@
 
 from oeqa.runtime.case import OERuntimeTestCase
 
+
 class QemuTinyTest(OERuntimeTestCase):
 
     def test_boot_tiny(self):
diff --git a/meta/lib/oeqa/runtime/cases/apt.py b/meta/lib/oeqa/runtime/cases/apt.py
index 1e01138760..7842540423 100644
--- a/meta/lib/oeqa/runtime/cases/apt.py
+++ b/meta/lib/oeqa/runtime/cases/apt.py
@@ -8,6 +8,7 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.data import skipIfNotDataVar, skipIfNotFeature
 from oeqa.runtime.decorator.package import OEHasPackage
 
+
 class AptTest(OERuntimeTestCase):
 
     def pkg(self, command, expected=0):
@@ -17,6 +18,7 @@ class AptTest(OERuntimeTestCase):
         self.assertEqual(status, expected, message)
         return output
 
+
 class AptRepoTest(AptTest):
 
     @classmethod
diff --git a/meta/lib/oeqa/runtime/cases/boot.py b/meta/lib/oeqa/runtime/cases/boot.py
index 03a1d4b501..286dd7bc7d 100644
--- a/meta/lib/oeqa/runtime/cases/boot.py
+++ b/meta/lib/oeqa/runtime/cases/boot.py
@@ -10,6 +10,7 @@ from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.oetimeout import OETimeout
 from oeqa.core.decorator.data import skipIfQemu
 
+
 class BootTest(OERuntimeTestCase):
 
     @OETimeout(120)
diff --git a/meta/lib/oeqa/runtime/cases/buildcpio.py b/meta/lib/oeqa/runtime/cases/buildcpio.py
index 095a82c10b..01f7400a72 100644
--- a/meta/lib/oeqa/runtime/cases/buildcpio.py
+++ b/meta/lib/oeqa/runtime/cases/buildcpio.py
@@ -8,6 +8,7 @@ from oeqa.runtime.decorator.package import OEHasPackage
 
 from oeqa.runtime.utils.targetbuildproject import TargetBuildProject
 
+
 class BuildCpioTest(OERuntimeTestCase):
 
     @classmethod
diff --git a/meta/lib/oeqa/runtime/cases/buildgalculator.py b/meta/lib/oeqa/runtime/cases/buildgalculator.py
index f7af48c3be..5066d15cf3 100644
--- a/meta/lib/oeqa/runtime/cases/buildgalculator.py
+++ b/meta/lib/oeqa/runtime/cases/buildgalculator.py
@@ -8,6 +8,7 @@ from oeqa.runtime.decorator.package import OEHasPackage
 
 from oeqa.runtime.utils.targetbuildproject import TargetBuildProject
 
+
 class GalculatorTest(OERuntimeTestCase):
 
     @classmethod
diff --git a/meta/lib/oeqa/runtime/cases/buildlzip.py b/meta/lib/oeqa/runtime/cases/buildlzip.py
index ef4c9cebac..78c1661968 100644
--- a/meta/lib/oeqa/runtime/cases/buildlzip.py
+++ b/meta/lib/oeqa/runtime/cases/buildlzip.py
@@ -8,6 +8,7 @@ from oeqa.runtime.decorator.package import OEHasPackage
 
 from oeqa.runtime.utils.targetbuildproject import TargetBuildProject
 
+
 class BuildLzipTest(OERuntimeTestCase):
 
     @classmethod
diff --git a/meta/lib/oeqa/runtime/cases/connman.py b/meta/lib/oeqa/runtime/cases/connman.py
index f0d15fac9b..919905a22b 100644
--- a/meta/lib/oeqa/runtime/cases/connman.py
+++ b/meta/lib/oeqa/runtime/cases/connman.py
@@ -6,6 +6,7 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
 
+
 class ConnmanTest(OERuntimeTestCase):
 
     def service_status(self, service):
diff --git a/meta/lib/oeqa/runtime/cases/date.py b/meta/lib/oeqa/runtime/cases/date.py
index e14322911d..aeb3e15560 100644
--- a/meta/lib/oeqa/runtime/cases/date.py
+++ b/meta/lib/oeqa/runtime/cases/date.py
@@ -8,6 +8,7 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
 
+
 class DateTest(OERuntimeTestCase):
 
     def setUp(self):
diff --git a/meta/lib/oeqa/runtime/cases/df.py b/meta/lib/oeqa/runtime/cases/df.py
index e7822af3b4..87687c3850 100644
--- a/meta/lib/oeqa/runtime/cases/df.py
+++ b/meta/lib/oeqa/runtime/cases/df.py
@@ -7,6 +7,7 @@ from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfDataVar, skipIfInDataVar
 from oeqa.runtime.decorator.package import OEHasPackage
 
+
 class DfTest(OERuntimeTestCase):
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/cases/dnf.py
index 18d562176f..70fbd270f2 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -12,6 +12,7 @@ from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfNotDataVar, skipIfNotFeature, skipIfInDataVar, skipIfNotInDataVar
 from oeqa.runtime.decorator.package import OEHasPackage
 
+
 class DnfTest(OERuntimeTestCase):
 
     def dnf(self, command, expected=0):
@@ -21,6 +22,7 @@ class DnfTest(OERuntimeTestCase):
         self.assertEqual(status, expected, message)
         return output
 
+
 class DnfBasicTest(DnfTest):
 
     @skipIfNotFeature('package-management',
@@ -48,6 +50,7 @@ class DnfBasicTest(DnfTest):
     def test_dnf_history(self):
         self.dnf('history')
 
+
 class DnfRepoTest(DnfTest):
 
     @classmethod
diff --git a/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py b/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py
index 40ac36493b..3c71a7c600 100644
--- a/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py
+++ b/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py
@@ -2,6 +2,7 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfQemu
 
+
 class Ethernet_Test(OERuntimeTestCase):
 
     def set_ip(self, x): 
diff --git a/meta/lib/oeqa/runtime/cases/gcc.py b/meta/lib/oeqa/runtime/cases/gcc.py
index 1b6e431bf4..ab5b9001d4 100644
--- a/meta/lib/oeqa/runtime/cases/gcc.py
+++ b/meta/lib/oeqa/runtime/cases/gcc.py
@@ -8,6 +8,7 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
 
+
 class GccCompileTest(OERuntimeTestCase):
 
     @classmethod
diff --git a/meta/lib/oeqa/runtime/cases/gi.py b/meta/lib/oeqa/runtime/cases/gi.py
index 42bd100a31..de84873638 100644
--- a/meta/lib/oeqa/runtime/cases/gi.py
+++ b/meta/lib/oeqa/runtime/cases/gi.py
@@ -8,6 +8,7 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
 
+
 class GObjectIntrospectionTest(OERuntimeTestCase):
 
     @OETestDepends(["ssh.SSHTest.test_ssh"])
diff --git a/meta/lib/oeqa/runtime/cases/gstreamer.py b/meta/lib/oeqa/runtime/cases/gstreamer.py
index f735f82e3b..2647d8a8d3 100644
--- a/meta/lib/oeqa/runtime/cases/gstreamer.py
+++ b/meta/lib/oeqa/runtime/cases/gstreamer.py
@@ -5,6 +5,7 @@
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.runtime.decorator.package import OEHasPackage
 
+
 class GstreamerCliTest(OERuntimeTestCase):
 
     @OEHasPackage(['gstreamer1.0'])
diff --git a/meta/lib/oeqa/runtime/cases/kernelmodule.py b/meta/lib/oeqa/runtime/cases/kernelmodule.py
index 47fd2f850c..88ec39e7a0 100644
--- a/meta/lib/oeqa/runtime/cases/kernelmodule.py
+++ b/meta/lib/oeqa/runtime/cases/kernelmodule.py
@@ -9,6 +9,7 @@ from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfNotFeature
 from oeqa.runtime.decorator.package import OEHasPackage
 
+
 class KernelModuleTest(OERuntimeTestCase):
 
     @classmethod
diff --git a/meta/lib/oeqa/runtime/cases/ksample.py b/meta/lib/oeqa/runtime/cases/ksample.py
index 1ad6ba8fc8..7508bbf596 100644
--- a/meta/lib/oeqa/runtime/cases/ksample.py
+++ b/meta/lib/oeqa/runtime/cases/ksample.py
@@ -11,6 +11,8 @@ from oeqa.core.decorator.data import skipIfNotFeature
 
 # need some kernel fragments
 # echo "KERNEL_FEATURES_append += \" features\/kernel\-sample\/kernel\-sample.scc\"" >> local.conf
+
+
 class KSample(OERuntimeTestCase):
     def cmd_and_check(self, cmd='', match_string=''):
         status, output = self.target.run(cmd)
@@ -97,6 +99,7 @@ class KSample(OERuntimeTestCase):
         # rmmod
         self.cmd_and_check("rmmod %s" % module_prename)
 
+
 class KSampleTest(KSample):
     # kfifo
     @OETestDepends(['ssh.SSHTest.test_ssh'])
diff --git a/meta/lib/oeqa/runtime/cases/ldd.py b/meta/lib/oeqa/runtime/cases/ldd.py
index 9c2caa8f65..48aa0770e3 100644
--- a/meta/lib/oeqa/runtime/cases/ldd.py
+++ b/meta/lib/oeqa/runtime/cases/ldd.py
@@ -7,6 +7,7 @@ from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfNotFeature
 from oeqa.runtime.decorator.package import OEHasPackage
 
+
 class LddTest(OERuntimeTestCase):
 
     @OEHasPackage(["ldd"])
diff --git a/meta/lib/oeqa/runtime/cases/logrotate.py b/meta/lib/oeqa/runtime/cases/logrotate.py
index 7d7dbb7afb..9f88f2dbc0 100644
--- a/meta/lib/oeqa/runtime/cases/logrotate.py
+++ b/meta/lib/oeqa/runtime/cases/logrotate.py
@@ -9,6 +9,7 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
 
+
 class LogrotateTest(OERuntimeTestCase):
 
     @classmethod
diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cases/ltp.py
index 9fe9cb8def..4bf2f11a19 100644
--- a/meta/lib/oeqa/runtime/cases/ltp.py
+++ b/meta/lib/oeqa/runtime/cases/ltp.py
@@ -14,6 +14,7 @@ from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
 from oeqa.utils.logparser import LtpParser
 
+
 class LtpTestBase(OERuntimeTestCase):
 
     @classmethod
@@ -42,7 +43,6 @@ class LtpTestBase(OERuntimeTestCase):
         cls.extras = cls.tc.extraresults
         cls.extras['ltpresult.rawlogs'] = {'log': ""}
 
- 
     @classmethod
     def ltp_finishup(cls):
         cls.extras['ltpresult.sections'] = cls.sections
@@ -55,6 +55,7 @@ class LtpTestBase(OERuntimeTestCase):
         if cls.failmsg:
             cls.fail(cls.failmsg)
 
+
 class LtpTest(LtpTestBase):
 
     ltp_groups = ["math", "syscalls", "dio", "io", "mm", "ipc", "sched", "nptl", "pty", "containers", "controllers", "filecaps", "cap_bounds", "fcntl-locktests", "connectors", "commands", "net.ipv6_lib", "input", "fs_perms_simple"]
diff --git a/meta/lib/oeqa/runtime/cases/ltp_compliance.py b/meta/lib/oeqa/runtime/cases/ltp_compliance.py
index c56c3e6fcf..8b0f8a2cdd 100644
--- a/meta/lib/oeqa/runtime/cases/ltp_compliance.py
+++ b/meta/lib/oeqa/runtime/cases/ltp_compliance.py
@@ -14,6 +14,7 @@ from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
 from oeqa.utils.logparser import LtpComplianceParser
 
+
 class LtpPosixBase(OERuntimeTestCase):
 
     @classmethod
@@ -42,7 +43,6 @@ class LtpPosixBase(OERuntimeTestCase):
         cls.extras = cls.tc.extraresults
         cls.extras['ltpposixresult.rawlogs'] = {'log': ""}
 
- 
     @classmethod
     def ltp_finishup(cls):
         cls.extras['ltpposixresult.sections'] = cls.sections
@@ -56,6 +56,7 @@ class LtpPosixBase(OERuntimeTestCase):
         if cls.failmsg:
             cls.fail(cls.failmsg)
 
+
 class LtpPosixTest(LtpPosixBase):
     posix_groups = ["AIO", "MEM", "MSG", "SEM", "SIG", "THR", "TMR", "TPS"]
 
diff --git a/meta/lib/oeqa/runtime/cases/ltp_stress.py b/meta/lib/oeqa/runtime/cases/ltp_stress.py
index d97595e94e..beb47710e4 100644
--- a/meta/lib/oeqa/runtime/cases/ltp_stress.py
+++ b/meta/lib/oeqa/runtime/cases/ltp_stress.py
@@ -15,6 +15,7 @@ from oeqa.runtime.decorator.package import OEHasPackage
 from oeqa.core.decorator.data import skipIfQemu
 from oeqa.utils.logparser import LtpParser
 
+
 class LtpStressBase(OERuntimeTestCase):
 
     @classmethod
@@ -43,7 +44,6 @@ class LtpStressBase(OERuntimeTestCase):
         cls.extras = cls.tc.extraresults
         cls.extras['ltpstressresult.rawlogs'] = {'log': ""}
 
- 
     @classmethod
     def ltp_finishup(cls):
         cls.extras['ltpstressresult.sections'] = cls.sections
@@ -57,6 +57,7 @@ class LtpStressBase(OERuntimeTestCase):
         if cls.failmsg:
             cls.fail(cls.failmsg)
 
+
 class LtpStressTest(LtpStressBase):
 
     def runltp(self, stress_group):
@@ -90,7 +91,6 @@ class LtpStressTest(LtpStressBase):
     # LTP stress runtime tests
     #
     @skipIfQemu('qemuall', 'Test only runs on real hardware')
-
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(["ltp"])
     def test_ltp_stress(self):
diff --git a/meta/lib/oeqa/runtime/cases/multilib.py b/meta/lib/oeqa/runtime/cases/multilib.py
index 0d1b9ae2c9..9dffb0401a 100644
--- a/meta/lib/oeqa/runtime/cases/multilib.py
+++ b/meta/lib/oeqa/runtime/cases/multilib.py
@@ -9,6 +9,7 @@ from oeqa.runtime.decorator.package import OEHasPackage
 
 import subprocess
 
+
 class MultilibTest(OERuntimeTestCase):
 
     def archtest(self, binary, arch):
diff --git a/meta/lib/oeqa/runtime/cases/oe_syslog.py b/meta/lib/oeqa/runtime/cases/oe_syslog.py
index 2e1a8f153d..45d815baf7 100644
--- a/meta/lib/oeqa/runtime/cases/oe_syslog.py
+++ b/meta/lib/oeqa/runtime/cases/oe_syslog.py
@@ -8,6 +8,7 @@ from oeqa.core.decorator.data import skipIfDataVar
 from oeqa.runtime.decorator.package import OEHasPackage
 import time
 
+
 class SyslogTest(OERuntimeTestCase):
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
@@ -20,6 +21,7 @@ class SyslogTest(OERuntimeTestCase):
         hasdaemon = "syslogd" in output or "syslog-ng" in output or "svlogd" in output
         self.assertTrue(hasdaemon, msg=msg)
 
+
 class SyslogTestConfig(OERuntimeTestCase):
 
     def verif_not_running(self, pids):
@@ -39,7 +41,6 @@ class SyslogTestConfig(OERuntimeTestCase):
             pids.append(pid)
         return 0, pids
 
-
     def restart_sanity(self, names, restart_cmd, pidchange=True):
         status, original_pids = self.verify_running(names)
         if status:
@@ -98,7 +99,6 @@ class SyslogTestConfig(OERuntimeTestCase):
                ' Output: %s ' % output)
         self.assertEqual(status, 0, msg=msg)
 
-
     @OETestDepends(['oe_syslog.SyslogTest.test_syslog_running'])
     def test_syslog_restart(self):
         if self.restart_sanity(['systemd-journald'], 'systemctl restart syslog.service', pidchange=False):
@@ -110,7 +110,6 @@ class SyslogTestConfig(OERuntimeTestCase):
         else:
             self.logger.info("No syslog found to restart, ignoring")
 
-
     @OETestDepends(['oe_syslog.SyslogTestConfig.test_syslog_logger'])
     @OEHasPackage(["busybox-syslog"])
     @skipIfDataVar('VIRTUAL-RUNTIME_init_manager', 'systemd',
diff --git a/meta/lib/oeqa/runtime/cases/opkg.py b/meta/lib/oeqa/runtime/cases/opkg.py
index de96b3ff3a..c810575180 100644
--- a/meta/lib/oeqa/runtime/cases/opkg.py
+++ b/meta/lib/oeqa/runtime/cases/opkg.py
@@ -8,6 +8,7 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.data import skipIfNotDataVar, skipIfNotFeature, skipIfFeature
 from oeqa.runtime.decorator.package import OEHasPackage
 
+
 class OpkgTest(OERuntimeTestCase):
 
     def pkg(self, command, expected=0):
@@ -17,6 +18,7 @@ class OpkgTest(OERuntimeTestCase):
         self.assertEqual(status, expected, message)
         return output
 
+
 class OpkgRepoTest(OpkgTest):
 
     @classmethod
diff --git a/meta/lib/oeqa/runtime/cases/pam.py b/meta/lib/oeqa/runtime/cases/pam.py
index 4cd5325201..250c0f9c71 100644
--- a/meta/lib/oeqa/runtime/cases/pam.py
+++ b/meta/lib/oeqa/runtime/cases/pam.py
@@ -10,6 +10,7 @@ from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfNotFeature
 from oeqa.runtime.decorator.package import OEHasPackage
 
+
 class PamBasicTest(OERuntimeTestCase):
 
     @skipIfNotFeature('pam', 'Test requires pam to be in DISTRO_FEATURES')
diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index c61969d3f2..2d24090c9e 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -197,6 +197,7 @@ ignore_errors = {
 
 log_locations = ["/var/log/", "/var/log/dmesg", "/tmp/dmesg_output.log"]
 
+
 class ParseLogsTest(OERuntimeTestCase):
 
     @classmethod
diff --git a/meta/lib/oeqa/runtime/cases/perl.py b/meta/lib/oeqa/runtime/cases/perl.py
index 2c6b3b7846..5b6facd08f 100644
--- a/meta/lib/oeqa/runtime/cases/perl.py
+++ b/meta/lib/oeqa/runtime/cases/perl.py
@@ -8,6 +8,7 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
 
+
 class PerlTest(OERuntimeTestCase):
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['perl'])
diff --git a/meta/lib/oeqa/runtime/cases/ping.py b/meta/lib/oeqa/runtime/cases/ping.py
index da40204614..9e5a8dc722 100644
--- a/meta/lib/oeqa/runtime/cases/ping.py
+++ b/meta/lib/oeqa/runtime/cases/ping.py
@@ -7,6 +7,7 @@ from subprocess import Popen, PIPE
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.oetimeout import OETimeout
 
+
 class PingTest(OERuntimeTestCase):
 
     @OETimeout(30)
diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index a8a4d17003..0c42ea995b 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -13,6 +13,7 @@ from oeqa.core.decorator.data import skipIfNotFeature
 from oeqa.runtime.decorator.package import OEHasPackage
 from oeqa.utils.logparser import PtestParser
 
+
 class PtestRunnerTest(OERuntimeTestCase):
 
     @skipIfNotFeature('ptest', 'Test requires ptest to be in DISTRO_FEATURES')
diff --git a/meta/lib/oeqa/runtime/cases/python.py b/meta/lib/oeqa/runtime/cases/python.py
index ec54f1e1db..043bc22442 100644
--- a/meta/lib/oeqa/runtime/cases/python.py
+++ b/meta/lib/oeqa/runtime/cases/python.py
@@ -6,6 +6,7 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
 
+
 class PythonTest(OERuntimeTestCase):
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['python3-core'])
diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
index df0a373c59..9c7a50c567 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -12,6 +12,7 @@ from oeqa.core.decorator.data import skipIfDataVar
 from oeqa.runtime.decorator.package import OEHasPackage
 from oeqa.core.utils.path import findFile
 
+
 class RpmBasicTest(OERuntimeTestCase):
 
     @OEHasPackage(['rpm'])
diff --git a/meta/lib/oeqa/runtime/cases/rtc.py b/meta/lib/oeqa/runtime/cases/rtc.py
index c4e6681324..43de30a23f 100644
--- a/meta/lib/oeqa/runtime/cases/rtc.py
+++ b/meta/lib/oeqa/runtime/cases/rtc.py
@@ -4,6 +4,7 @@ from oeqa.runtime.decorator.package import OEHasPackage
 
 import re
 
+
 class RTCTest(OERuntimeTestCase):
 
     def setUp(self):
diff --git a/meta/lib/oeqa/runtime/cases/runlevel.py b/meta/lib/oeqa/runtime/cases/runlevel.py
index aa31adf0b7..8dbb2e4f13 100644
--- a/meta/lib/oeqa/runtime/cases/runlevel.py
+++ b/meta/lib/oeqa/runtime/cases/runlevel.py
@@ -3,6 +3,7 @@ from oeqa.core.decorator.depends import OETestDepends
 
 import time
 
+
 class RunLevel_Test(OERuntimeTestCase):
     
     @OETestDepends(['ssh.SSHTest.test_ssh'])
diff --git a/meta/lib/oeqa/runtime/cases/scons.py b/meta/lib/oeqa/runtime/cases/scons.py
index 3c7c7f7270..60f77c499b 100644
--- a/meta/lib/oeqa/runtime/cases/scons.py
+++ b/meta/lib/oeqa/runtime/cases/scons.py
@@ -8,6 +8,7 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
 
+
 class SconsCompileTest(OERuntimeTestCase):
 
     @classmethod
diff --git a/meta/lib/oeqa/runtime/cases/scp.py b/meta/lib/oeqa/runtime/cases/scp.py
index fdf058d948..faee8852dc 100644
--- a/meta/lib/oeqa/runtime/cases/scp.py
+++ b/meta/lib/oeqa/runtime/cases/scp.py
@@ -9,6 +9,7 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
 
+
 class ScpTest(OERuntimeTestCase):
 
     @classmethod
diff --git a/meta/lib/oeqa/runtime/cases/skeletoninit.py b/meta/lib/oeqa/runtime/cases/skeletoninit.py
index 5f3b6b353a..2da4b4e340 100644
--- a/meta/lib/oeqa/runtime/cases/skeletoninit.py
+++ b/meta/lib/oeqa/runtime/cases/skeletoninit.py
@@ -10,6 +10,7 @@ from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfDataVar
 from oeqa.runtime.decorator.package import OEHasPackage
 
+
 class SkeletonBasicTest(OERuntimeTestCase):
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
diff --git a/meta/lib/oeqa/runtime/cases/ssh.py b/meta/lib/oeqa/runtime/cases/ssh.py
index 60a5fbbfbf..d946bf58a9 100644
--- a/meta/lib/oeqa/runtime/cases/ssh.py
+++ b/meta/lib/oeqa/runtime/cases/ssh.py
@@ -6,6 +6,7 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
 
+
 class SSHTest(OERuntimeTestCase):
 
     @OETestDepends(['ping.PingTest.test_ping'])
diff --git a/meta/lib/oeqa/runtime/cases/stap.py b/meta/lib/oeqa/runtime/cases/stap.py
index 5342f6ac34..df4afe58fc 100644
--- a/meta/lib/oeqa/runtime/cases/stap.py
+++ b/meta/lib/oeqa/runtime/cases/stap.py
@@ -9,6 +9,7 @@ from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfNotFeature
 from oeqa.runtime.decorator.package import OEHasPackage
 
+
 class StapTest(OERuntimeTestCase):
 
     @classmethod
diff --git a/meta/lib/oeqa/runtime/cases/storage.py b/meta/lib/oeqa/runtime/cases/storage.py
index f6f9130d20..cd640e214e 100644
--- a/meta/lib/oeqa/runtime/cases/storage.py
+++ b/meta/lib/oeqa/runtime/cases/storage.py
@@ -9,6 +9,7 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfQemu
 
+
 class StorageBase(OERuntimeTestCase):
     def storage_mount(cls, tmo=1):
 
@@ -29,7 +30,6 @@ class StorageBase(OERuntimeTestCase):
         msg = ('Failed to cleanup files @ %s/*' % cls.test_dir)
         cls.assertFalse(output, msg=msg)
 
-
     def storage_basic(cls):
         # create file on device
         (status, output) = cls.target.run('touch %s/%s' % (cls.test_dir, cls.test_file))
diff --git a/meta/lib/oeqa/runtime/cases/suspend.py b/meta/lib/oeqa/runtime/cases/suspend.py
index 708e6ac7e5..84e2e3f710 100644
--- a/meta/lib/oeqa/runtime/cases/suspend.py
+++ b/meta/lib/oeqa/runtime/cases/suspend.py
@@ -4,6 +4,7 @@ from oeqa.core.decorator.data import skipIfQemu
 import threading
 import time
 
+
 class Suspend_Test(OERuntimeTestCase):
 
     def test_date(self): 
diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/runtime/cases/systemd.py
index a465eaa0b7..7328bb439c 100644
--- a/meta/lib/oeqa/runtime/cases/systemd.py
+++ b/meta/lib/oeqa/runtime/cases/systemd.py
@@ -11,6 +11,7 @@ from oeqa.core.decorator.data import skipIfDataVar, skipIfNotDataVar
 from oeqa.runtime.decorator.package import OEHasPackage
 from oeqa.core.decorator.data import skipIfNotFeature, skipIfFeature
 
+
 class SystemdTest(OERuntimeTestCase):
 
     def systemctl(self, action='', target='', expected=0, verbose=False):
@@ -53,6 +54,7 @@ class SystemdTest(OERuntimeTestCase):
                     % l_match_units)
         return output
 
+
 class SystemdBasicTests(SystemdTest):
 
     def settle(self):
@@ -134,6 +136,7 @@ class SystemdServiceTests(SystemdTest):
             status = self.target.run('mount -oro,remount /')[0]
             self.assertTrue(status == 0, msg='Remounting / as r/o failed')
 
+
 class SystemdJournalTests(SystemdTest):
 
     @OETestDepends(['systemd.SystemdBasicTests.test_systemd_basic'])
diff --git a/meta/lib/oeqa/runtime/cases/terminal.py b/meta/lib/oeqa/runtime/cases/terminal.py
index 8fcca99f47..fe1cd68118 100644
--- a/meta/lib/oeqa/runtime/cases/terminal.py
+++ b/meta/lib/oeqa/runtime/cases/terminal.py
@@ -5,6 +5,7 @@ from oeqa.runtime.decorator.package import OEHasPackage
 import threading
 import time
 
+
 class TerminalTest(OERuntimeTestCase):
 
     @OEHasPackage(['matchbox-terminal'])
diff --git a/meta/lib/oeqa/runtime/cases/usb_hid.py b/meta/lib/oeqa/runtime/cases/usb_hid.py
index a42c856f6a..e8451b4658 100644
--- a/meta/lib/oeqa/runtime/cases/usb_hid.py
+++ b/meta/lib/oeqa/runtime/cases/usb_hid.py
@@ -3,6 +3,7 @@ from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfQemu
 from oeqa.runtime.decorator.package import OEHasPackage
 
+
 class USB_HID_Test(OERuntimeTestCase):
 
     def keyboard_mouse_simulation(self): 
diff --git a/meta/lib/oeqa/runtime/cases/weston.py b/meta/lib/oeqa/runtime/cases/weston.py
index 3456803adb..6e8fa0e3f6 100644
--- a/meta/lib/oeqa/runtime/cases/weston.py
+++ b/meta/lib/oeqa/runtime/cases/weston.py
@@ -9,6 +9,7 @@ from oeqa.runtime.decorator.package import OEHasPackage
 import threading
 import time
 
+
 class WestonTest(OERuntimeTestCase):
     weston_log_file = '/tmp/weston.log'
 
diff --git a/meta/lib/oeqa/runtime/cases/x32lib.py b/meta/lib/oeqa/runtime/cases/x32lib.py
index f419c8f181..1ffe2388b9 100644
--- a/meta/lib/oeqa/runtime/cases/x32lib.py
+++ b/meta/lib/oeqa/runtime/cases/x32lib.py
@@ -8,6 +8,7 @@ from oeqa.core.decorator.data import skipIfNotInDataVar
 
 import subprocess
 
+
 class X32libTest(OERuntimeTestCase):
 
     @skipIfNotInDataVar('DEFAULTTUNE', 'x86-64-x32',
diff --git a/meta/lib/oeqa/runtime/cases/xorg.py b/meta/lib/oeqa/runtime/cases/xorg.py
index 0bbef023d9..65b8f3ae30 100644
--- a/meta/lib/oeqa/runtime/cases/xorg.py
+++ b/meta/lib/oeqa/runtime/cases/xorg.py
@@ -7,6 +7,7 @@ from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfNotFeature
 from oeqa.runtime.decorator.package import OEHasPackage
 
+
 class XorgTest(OERuntimeTestCase):
 
     @skipIfNotFeature('x11-base',
diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index 0ea67bee2f..af5639b3b8 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -13,6 +13,7 @@ from oeqa.utils.dump import HostDumper
 
 from oeqa.runtime.loader import OERuntimeTestLoader
 
+
 class OERuntimeTestContext(OETestContext):
     loaderClass = OERuntimeTestLoader
     runtime_files_dir = os.path.join(
@@ -35,6 +36,7 @@ class OERuntimeTestContext(OETestContext):
         if 'procps' in self.image_packages:
             self.target_cmds['ps'] = self.target_cmds['ps'] + ' -ef'
 
+
 class OERuntimeTestContextExecutor(OETestContextExecutor):
     _context_class = OERuntimeTestContext
 
@@ -224,4 +226,5 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
                         args.packages_manifest)
         self.tc_kwargs['init']['extract_dir'] = args.extract_dir
 
+
 _executor_class = OERuntimeTestContextExecutor
diff --git a/meta/lib/oeqa/runtime/decorator/package.py b/meta/lib/oeqa/runtime/decorator/package.py
index 2d7e174dbf..687556a6d7 100644
--- a/meta/lib/oeqa/runtime/decorator/package.py
+++ b/meta/lib/oeqa/runtime/decorator/package.py
@@ -7,6 +7,7 @@
 from oeqa.core.decorator import OETestDecorator, registerDecorator
 from oeqa.core.utils.misc import strToSet
 
+
 @registerDecorator
 class OEHasPackage(OETestDecorator):
     """
@@ -58,6 +59,7 @@ class OEHasPackage(OETestDecorator):
     def _decorator_fail(self, msg):
         self.case.skipTest(msg)
 
+
 @registerDecorator
 class OERequirePackage(OEHasPackage):
     """
diff --git a/meta/lib/oeqa/runtime/loader.py b/meta/lib/oeqa/runtime/loader.py
index 7041ddfde8..ecad20087f 100644
--- a/meta/lib/oeqa/runtime/loader.py
+++ b/meta/lib/oeqa/runtime/loader.py
@@ -7,6 +7,7 @@
 from oeqa.core.loader import OETestLoader
 from oeqa.runtime.case import OERuntimeTestCase
 
+
 class OERuntimeTestLoader(OETestLoader):
     caseClass = OERuntimeTestCase
 
diff --git a/meta/lib/oeqa/runtime/utils/targetbuildproject.py b/meta/lib/oeqa/runtime/utils/targetbuildproject.py
index f4f4816a9b..214f4cce55 100644
--- a/meta/lib/oeqa/runtime/utils/targetbuildproject.py
+++ b/meta/lib/oeqa/runtime/utils/targetbuildproject.py
@@ -6,6 +6,7 @@
 
 from oeqa.utils.buildproject import BuildProject
 
+
 class TargetBuildProject(BuildProject):
 
     def __init__(self, target, uri, foldername=None, dl_dir=None):
diff --git a/meta/lib/oeqa/sdk/case.py b/meta/lib/oeqa/sdk/case.py
index 6b8eab3258..9b05f33dfb 100644
--- a/meta/lib/oeqa/sdk/case.py
+++ b/meta/lib/oeqa/sdk/case.py
@@ -9,6 +9,7 @@ import subprocess
 
 from oeqa.core.case import OETestCase
 
+
 class OESDKTestCase(OETestCase):
     def _run(self, cmd):
         return subprocess.check_output(". %s > /dev/null; %s;" %
diff --git a/meta/lib/oeqa/sdk/cases/assimp.py b/meta/lib/oeqa/sdk/cases/assimp.py
index f166758e49..3afe203141 100644
--- a/meta/lib/oeqa/sdk/cases/assimp.py
+++ b/meta/lib/oeqa/sdk/cases/assimp.py
@@ -11,6 +11,7 @@ from oeqa.sdk.case import OESDKTestCase
 from oeqa.utils.subprocesstweak import errors_have_output
 errors_have_output()
 
+
 class BuildAssimp(OESDKTestCase):
     """
     Test case to build a project using cmake.
diff --git a/meta/lib/oeqa/sdk/cases/buildcpio.py b/meta/lib/oeqa/sdk/cases/buildcpio.py
index e7fc211a47..6ad4bb3404 100644
--- a/meta/lib/oeqa/sdk/cases/buildcpio.py
+++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
@@ -11,10 +11,12 @@ from oeqa.sdk.case import OESDKTestCase
 from oeqa.utils.subprocesstweak import errors_have_output
 errors_have_output()
 
+
 class BuildCpioTest(OESDKTestCase):
     """
     Check that autotools will cross-compile correctly.
     """
+
     def test_cpio(self):
         with tempfile.TemporaryDirectory(prefix="cpio-", dir=self.tc.sdk_dir) as testdir:
             tarball = self.fetch(testdir, self.td["DL_DIR"], "https://ftp.gnu.org/gnu/cpio/cpio-2.13.tar.gz")
diff --git a/meta/lib/oeqa/sdk/cases/buildepoxy.py b/meta/lib/oeqa/sdk/cases/buildepoxy.py
index 385f8ccca8..6f4b430030 100644
--- a/meta/lib/oeqa/sdk/cases/buildepoxy.py
+++ b/meta/lib/oeqa/sdk/cases/buildepoxy.py
@@ -11,10 +11,12 @@ from oeqa.sdk.case import OESDKTestCase
 from oeqa.utils.subprocesstweak import errors_have_output
 errors_have_output()
 
+
 class EpoxyTest(OESDKTestCase):
     """
     Test that Meson builds correctly.
     """
+
     def setUp(self):
         if not (self.tc.hasHostPackage("nativesdk-meson")):
             raise unittest.SkipTest("GalculatorTest class: SDK doesn't contain Meson")
diff --git a/meta/lib/oeqa/sdk/cases/buildgalculator.py b/meta/lib/oeqa/sdk/cases/buildgalculator.py
index c6de032b29..b7fe32be2b 100644
--- a/meta/lib/oeqa/sdk/cases/buildgalculator.py
+++ b/meta/lib/oeqa/sdk/cases/buildgalculator.py
@@ -11,10 +11,12 @@ from oeqa.sdk.case import OESDKTestCase
 from oeqa.utils.subprocesstweak import errors_have_output
 errors_have_output()
 
+
 class GalculatorTest(OESDKTestCase):
     """
     Test that autotools and GTK+ 3 compiles correctly.
     """
+
     def setUp(self):
         if not (self.tc.hasTargetPackage("gtk+3", multilib=True) or
                 self.tc.hasTargetPackage("libgtk-3.0", multilib=True)):
diff --git a/meta/lib/oeqa/sdk/cases/buildlzip.py b/meta/lib/oeqa/sdk/cases/buildlzip.py
index 04c4a0ec16..fb894d4183 100644
--- a/meta/lib/oeqa/sdk/cases/buildlzip.py
+++ b/meta/lib/oeqa/sdk/cases/buildlzip.py
@@ -10,10 +10,12 @@ from oeqa.sdk.case import OESDKTestCase
 from oeqa.utils.subprocesstweak import errors_have_output
 errors_have_output()
 
+
 class BuildLzipTest(OESDKTestCase):
     """
     Test that "plain" compilation works, using just $CC $CFLAGS etc.
     """
+
     def test_lzip(self):
         with tempfile.TemporaryDirectory(prefix="lzip", dir=self.tc.sdk_dir) as testdir:
             tarball = self.fetch(testdir, self.td["DL_DIR"], "http://downloads.yoctoproject.org/mirror/sources/lzip-1.19.tar.gz")
diff --git a/meta/lib/oeqa/sdk/cases/gcc.py b/meta/lib/oeqa/sdk/cases/gcc.py
index 7146f368e9..f943cd3fe3 100644
--- a/meta/lib/oeqa/sdk/cases/gcc.py
+++ b/meta/lib/oeqa/sdk/cases/gcc.py
@@ -12,6 +12,7 @@ from oeqa.sdk.case import OESDKTestCase
 from oeqa.utils.subprocesstweak import errors_have_output
 errors_have_output()
 
+
 class GccCompileTest(OESDKTestCase):
     td_vars = ['MACHINE']
 
diff --git a/meta/lib/oeqa/sdk/cases/perl.py b/meta/lib/oeqa/sdk/cases/perl.py
index 14d76d820f..1259a09963 100644
--- a/meta/lib/oeqa/sdk/cases/perl.py
+++ b/meta/lib/oeqa/sdk/cases/perl.py
@@ -8,6 +8,7 @@ from oeqa.sdk.case import OESDKTestCase
 from oeqa.utils.subprocesstweak import errors_have_output
 errors_have_output()
 
+
 class PerlTest(OESDKTestCase):
     def setUp(self):
         if not (self.tc.hasHostPackage("nativesdk-perl") or
diff --git a/meta/lib/oeqa/sdk/cases/python.py b/meta/lib/oeqa/sdk/cases/python.py
index 2848481f33..76d3dbabed 100644
--- a/meta/lib/oeqa/sdk/cases/python.py
+++ b/meta/lib/oeqa/sdk/cases/python.py
@@ -9,6 +9,7 @@ from oeqa.sdk.case import OESDKTestCase
 from oeqa.utils.subprocesstweak import errors_have_output
 errors_have_output()
 
+
 class Python2Test(OESDKTestCase):
     def setUp(self):
         if not (self.tc.hasHostPackage("nativesdk-python-core") or
@@ -20,6 +21,7 @@ class Python2Test(OESDKTestCase):
         output = self._run(cmd)
         self.assertEqual(output, "Hello, world\n")
 
+
 class Python3Test(OESDKTestCase):
     def setUp(self):
         if not (self.tc.hasHostPackage("nativesdk-python3-core") or
diff --git a/meta/lib/oeqa/sdk/context.py b/meta/lib/oeqa/sdk/context.py
index b3cd7d0a5b..4e4eb8e5fa 100644
--- a/meta/lib/oeqa/sdk/context.py
+++ b/meta/lib/oeqa/sdk/context.py
@@ -11,6 +11,7 @@ import re
 
 from oeqa.core.context import OETestContext, OETestContextExecutor
 
+
 class OESDKTestContext(OETestContext):
     sdk_files_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), "files")
 
@@ -48,6 +49,7 @@ class OESDKTestContext(OETestContext):
                     pkg = ml + '-' + pkg
         return self._hasPackage(self.target_pkg_manifest, pkg, regex=regex)
 
+
 class OESDKTestContextExecutor(OETestContextExecutor):
     _context_class = OESDKTestContext
 
@@ -150,4 +152,5 @@ class OESDKTestContextExecutor(OETestContextExecutor):
         self.sdk_env = sdk_envs[args.sdk_env]
         return super(OESDKTestContextExecutor, self).run(logger, args)
 
+
 _executor_class = OESDKTestContextExecutor
diff --git a/meta/lib/oeqa/sdk/testsdk.py b/meta/lib/oeqa/sdk/testsdk.py
index 18e03cb8ef..80c2002ecd 100644
--- a/meta/lib/oeqa/sdk/testsdk.py
+++ b/meta/lib/oeqa/sdk/testsdk.py
@@ -6,6 +6,7 @@
 
 from oeqa.sdk.context import OESDKTestContext, OESDKTestContextExecutor
 
+
 class TestSDKBase(object):
     @staticmethod
     def get_sdk_configuration(d, test_type):
@@ -34,6 +35,7 @@ class TestSDKBase(object):
     def get_sdk_result_id(configuration):
         return '%s_%s_%s_%s_%s' % (configuration['TEST_TYPE'], configuration['IMAGE_BASENAME'], configuration['SDKMACHINE'], configuration['MACHINE'], configuration['STARTTIME'])
 
+
 class TestSDK(TestSDKBase):
     context_executor_class = OESDKTestContextExecutor
     context_class = OESDKTestContext
diff --git a/meta/lib/oeqa/sdk/utils/sdkbuildproject.py b/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
index 32f5e3310d..aaaeebf762 100644
--- a/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
+++ b/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
@@ -9,6 +9,7 @@ import subprocess
 
 from oeqa.utils.buildproject import BuildProject
 
+
 class SDKBuildProject(BuildProject):
     def __init__(self, testpath, sdkenv, uri, testlogdir, builddatetime,
             foldername=None, dl_dir=None):
diff --git a/meta/lib/oeqa/sdkext/case.py b/meta/lib/oeqa/sdkext/case.py
index 8a36c1f8ce..bf832cf8c8 100644
--- a/meta/lib/oeqa/sdkext/case.py
+++ b/meta/lib/oeqa/sdkext/case.py
@@ -10,6 +10,7 @@ import subprocess
 from oeqa.utils import avoid_paths_in_environ
 from oeqa.sdk.case import OESDKTestCase
 
+
 class OESDKExtTestCase(OESDKTestCase):
     def _run(self, cmd):
         # extensible sdk shows a warning if found bitbake in the path
diff --git a/meta/lib/oeqa/sdkext/cases/devtool.py b/meta/lib/oeqa/sdkext/cases/devtool.py
index 4567795027..f0fb75a3af 100644
--- a/meta/lib/oeqa/sdkext/cases/devtool.py
+++ b/meta/lib/oeqa/sdkext/cases/devtool.py
@@ -14,6 +14,7 @@ from oeqa.utils.httpserver import HTTPService
 from oeqa.utils.subprocesstweak import errors_have_output
 errors_have_output()
 
+
 class DevtoolTest(OESDKExtTestCase):
     @classmethod
     def setUpClass(cls):
@@ -95,6 +96,7 @@ class DevtoolTest(OESDKExtTestCase):
         finally:
             self._run('devtool reset %s ' % package_nodejs)
 
+
 class SdkUpdateTest(OESDKExtTestCase):
     @classmethod
     def setUpClass(self):
diff --git a/meta/lib/oeqa/sdkext/context.py b/meta/lib/oeqa/sdkext/context.py
index 2ac2bf6ff7..63a7cd7c6b 100644
--- a/meta/lib/oeqa/sdkext/context.py
+++ b/meta/lib/oeqa/sdkext/context.py
@@ -7,6 +7,7 @@
 import os
 from oeqa.sdk.context import OESDKTestContext, OESDKTestContextExecutor
 
+
 class OESDKExtTestContext(OESDKTestContext):
     esdk_files_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), "files")
 
@@ -18,6 +19,7 @@ class OESDKExtTestContext(OESDKTestContext):
             return True
         return self._hasPackage(self.host_pkg_manifest, pkg)
 
+
 class OESDKExtTestContextExecutor(OESDKTestContextExecutor):
     _context_class = OESDKExtTestContext
 
@@ -29,4 +31,5 @@ class OESDKExtTestContextExecutor(OESDKTestContextExecutor):
             [os.path.join(os.path.abspath(os.path.dirname(__file__)), 'cases')]
     default_test_data = None
 
+
 _executor_class = OESDKExtTestContextExecutor
diff --git a/meta/lib/oeqa/sdkext/testsdk.py b/meta/lib/oeqa/sdkext/testsdk.py
index 963531dfc6..6d552a8edf 100644
--- a/meta/lib/oeqa/sdkext/testsdk.py
+++ b/meta/lib/oeqa/sdkext/testsdk.py
@@ -6,6 +6,7 @@
 
 from oeqa.sdk.testsdk import TestSDKBase
 
+
 class TestSDKExt(TestSDKBase):
     def run(self, d):
         import os
diff --git a/meta/lib/oeqa/selftest/case.py b/meta/lib/oeqa/selftest/case.py
index 3d30618b97..b084831e0d 100644
--- a/meta/lib/oeqa/selftest/case.py
+++ b/meta/lib/oeqa/selftest/case.py
@@ -16,6 +16,7 @@ from oeqa.core.case import OETestCase
 
 import bb.utils
 
+
 class OESelftestTestCase(OETestCase):
     def __init__(self, methodName="runTest"):
         self._extra_tear_down_commands = []
@@ -229,6 +230,7 @@ class OESelftestTestCase(OETestCase):
         except OSError as e:
             if e.errno != errno.ENOENT:
                 raise
+
     def write_bblayers_config(self, data):
         """Write to <builddir>/conf/bblayers.inc"""
         self.logger.debug("Writing to: %s\n%s\n" % (self.testinc_bblayers_path, data))
diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index dce77281c9..e283163dc9 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -7,6 +7,7 @@ import glob
 from oeqa.utils.commands import bitbake, get_bb_vars
 from oeqa.selftest.case import OESelftestTestCase
 
+
 class Archiver(OESelftestTestCase):
 
     def test_archiver_allows_to_filter_on_recipe_name(self):
@@ -117,8 +118,6 @@ class Archiver(OESelftestTestCase):
         excluded_present = len(glob.glob(src_path_target + '/%s-*' % target_recipes[1]))
         self.assertFalse(excluded_present, 'Recipe %s was not excluded.' % target_recipes[1])
 
-
-
     def test_archiver_srpm_mode(self):
         """
         Test that in srpm mode, the added recipe dependencies at least exist/work [YOCTO #11121]
diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 139c65978f..0fe0971193 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -10,6 +10,7 @@ from oeqa.utils.commands import runCmd, get_bb_var, get_bb_vars
 
 from oeqa.selftest.case import OESelftestTestCase
 
+
 class BitbakeLayers(OESelftestTestCase):
 
     def test_bitbakelayers_layerindexshowdepends(self):
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index d196bb16cf..4eb5cb1cad 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -10,6 +10,7 @@ from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
 
 from oeqa.selftest.case import OESelftestTestCase
 
+
 class BitbakeTests(OESelftestTestCase):
 
     def getline(self, res, line):
@@ -36,7 +37,6 @@ class BitbakeTests(OESelftestTestCase):
         os.chdir("/tmp/")
         self.assertEqual(bitbake('-e', env=my_env).status, 0, msg="bitbake couldn't run from /tmp/")
 
-
     def test_event_handler(self):
         self.write_config("INHERIT += \"test_events\"")
         result = bitbake('m4-native')
diff --git a/meta/lib/oeqa/selftest/cases/binutils.py b/meta/lib/oeqa/selftest/cases/binutils.py
index 2f6aeadffc..87b0e8b438 100644
--- a/meta/lib/oeqa/selftest/cases/binutils.py
+++ b/meta/lib/oeqa/selftest/cases/binutils.py
@@ -8,6 +8,7 @@ from oeqa.core.case import OEPTestResultTestCase
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars
 
+
 def parse_values(content):
     for i in content:
         for v in ["PASS", "FAIL", "XPASS", "XFAIL", "UNRESOLVED", "UNSUPPORTED", "UNTESTED", "ERROR", "WARNING"]:
@@ -15,6 +16,7 @@ def parse_values(content):
                 yield i[len(v) + 2:].strip(), v
                 break
 
+
 @OETestTag("toolchain-user", "toolchain-system")
 class BinutilsCrossSelfTest(OESelftestTestCase, OEPTestResultTestCase):
     def test_binutils(self):
diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index dcc95e38ff..77740d98e8 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -12,6 +12,7 @@ from oeqa.selftest.cases.buildhistory import BuildhistoryBase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
 import oeqa.utils.ftools as ftools
 
+
 class ImageOptionsTests(OESelftestTestCase):
 
     def test_incremental_image_generation(self):
@@ -55,6 +56,7 @@ class ImageOptionsTests(OESelftestTestCase):
         bitbake("core-image-sato core-image-weston")
         # do_image will fail if there are any pending postinsts
 
+
 class DiskMonTest(OESelftestTestCase):
 
     def test_stoptask_behavior(self):
@@ -70,6 +72,7 @@ class DiskMonTest(OESelftestTestCase):
         res = bitbake("delay -c delay")
         self.assertTrue('WARNING: The free space' in res.output, msg="A warning should have been displayed for disk monitor is set to WARN: %s" % res.output)
 
+
 class SanityOptionsTest(OESelftestTestCase):
     def getline(self, res, line):
         for l in res.output.split('\n'):
@@ -148,6 +151,7 @@ class BuildhistoryTests(BuildhistoryBase):
         self.run_buildhistory_operation(target, target_config="PR = \"r1\"", change_bh_location=True)
         self.run_buildhistory_operation(target, target_config="PR = \"r0\"", change_bh_location=False, expect_error=True, error_regex=error)
 
+
 class ArchiverTest(OESelftestTestCase):
     def test_arch_work_dir_and_export_source(self):
         """
@@ -162,6 +166,7 @@ class ArchiverTest(OESelftestTestCase):
         tar_file_glob = str(pkgs_path[0]) + "/xcursor*.tar.gz"
         self.assertTrue((g.glob(src_file_glob) and g.glob(tar_file_glob)), "Couldn't find .src.rpm and .tar.gz files under %s/allarch*/xcursor*" % deploy_dir_src)
 
+
 class ToolchainOptions(OESelftestTestCase):
     def test_toolchain_fortran(self):
         """
@@ -172,6 +177,7 @@ class ToolchainOptions(OESelftestTestCase):
         self.write_config(features)
         bitbake('fortran-helloworld')
 
+
 class SourceMirroring(OESelftestTestCase):
     # Can we download everything from the Yocto Sources Mirror over http only
     def test_yocto_source_mirror(self):
diff --git a/meta/lib/oeqa/selftest/cases/containerimage.py b/meta/lib/oeqa/selftest/cases/containerimage.py
index 730ffe42c9..9911b19d2e 100644
--- a/meta/lib/oeqa/selftest/cases/containerimage.py
+++ b/meta/lib/oeqa/selftest/cases/containerimage.py
@@ -20,6 +20,8 @@ from oeqa.utils.commands import bitbake, get_bb_vars, runCmd
 # of them, but this test is more to catch if other packages get added by
 # default other than what is in ROOTFS_BOOTSTRAP_INSTALL.
 #
+
+
 class ContainerImageTests(OESelftestTestCase):
 
     # Verify that when specifying a IMAGE_TYPEDEP_ of the form "foo.bar" that
diff --git a/meta/lib/oeqa/selftest/cases/cve_check.py b/meta/lib/oeqa/selftest/cases/cve_check.py
index bd89e9335f..c843b19d04 100644
--- a/meta/lib/oeqa/selftest/cases/cve_check.py
+++ b/meta/lib/oeqa/selftest/cases/cve_check.py
@@ -1,6 +1,7 @@
 from oe.cve_check import Version
 from oeqa.selftest.case import OESelftestTestCase
 
+
 class CVECheck(OESelftestTestCase):
 
     def test_version_compare(self):
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index b90aac72bd..d79e705963 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -16,6 +16,7 @@ from oeqa.utils.commands import get_bb_vars, runqemu, get_test_layer
 
 oldmetapath = None
 
+
 def setUpModule():
     import bb.utils
 
@@ -67,9 +68,11 @@ def setUpModule():
             return layerpath
     bb.utils.edit_bblayers_conf(bblayers_conf, None, None, bblayers_edit_cb)
 
+
 def tearDownModule():
     if oldmetapath:
         edited_layers = []
+
         def bblayers_edit_cb(layerpath, canonical_layerpath):
             if not edited_layers and canonical_layerpath.endswith('/meta'):
                 edited_layers.append(layerpath)
@@ -80,6 +83,7 @@ def tearDownModule():
         bb.utils.edit_bblayers_conf(bblayers_conf, None, None, bblayers_edit_cb)
     shutil.rmtree(templayerdir)
 
+
 class DevtoolBase(OESelftestTestCase):
 
     @classmethod
@@ -173,7 +177,6 @@ class DevtoolBase(OESelftestTestCase):
                             value = set(value.split())
                     self.assertEqual(value, needvalue, 'values for %s do not match' % var)
 
-
         missingvars = {}
         for var, value in checkvars.items():
             if value is not None:
@@ -261,6 +264,7 @@ class DevtoolTests(DevtoolBase):
         self.assertNotIn(tempdir, result.output)
         self.assertIn(self.workspacedir, result.output)
 
+
 class DevtoolAddTests(DevtoolBase):
 
     def test_devtool_add(self):
@@ -536,6 +540,7 @@ class DevtoolAddTests(DevtoolBase):
         # Test devtool build
         result = runCmd('devtool build %s' % pn)
 
+
 class DevtoolModifyTests(DevtoolBase):
 
     def test_devtool_modify(self):
@@ -599,6 +604,7 @@ class DevtoolModifyTests(DevtoolBase):
         def assertFile(path, *paths):
             f = os.path.join(path, *paths)
             self.assertExists(f)
+
         def assertNoFile(path, *paths):
             f = os.path.join(path, *paths)
             self.assertNotExists(f)
@@ -697,6 +703,7 @@ class DevtoolModifyTests(DevtoolBase):
 
         self.assertTrue(bbclassextended, 'None of these recipes are BBCLASSEXTENDed to native - need to adjust testrecipes list: %s' % ', '.join(testrecipes))
         self.assertTrue(inheritnative, 'None of these recipes do "inherit native" - need to adjust testrecipes list: %s' % ', '.join(testrecipes))
+
     def test_devtool_modify_localfiles_only(self):
         # Check preconditions
         testrecipe = 'base-files'
@@ -824,6 +831,7 @@ class DevtoolModifyTests(DevtoolBase):
 
         self._check_src_repo(tempdir)
         source = os.path.join(tempdir, "source")
+
         def check(branch, expected):
             runCmd('git -C %s checkout %s' % (tempdir, branch))
             with open(source, "rt") as f:
@@ -834,6 +842,7 @@ class DevtoolModifyTests(DevtoolBase):
         check('devtool-override-qemuarm', 'This is a test for qemuarm\n')
         check('devtool-override-qemux86', 'This is a test for qemux86\n')
 
+
 class DevtoolUpdateTests(DevtoolBase):
 
     def test_devtool_update_recipe(self):
@@ -1295,6 +1304,7 @@ class DevtoolUpdateTests(DevtoolBase):
         expected_status = []
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
+
 class DevtoolExtractTests(DevtoolBase):
 
     def test_devtool_extract(self):
@@ -1461,6 +1471,7 @@ class DevtoolExtractTests(DevtoolBase):
         if reqpkgs:
             self.fail('The following packages were not present in the image as expected: %s' % ', '.join(reqpkgs))
 
+
 class DevtoolUpgradeTests(DevtoolBase):
 
     def test_devtool_upgrade(self):
@@ -1667,7 +1678,6 @@ class DevtoolUpgradeTests(DevtoolBase):
         self.assertIn("0002-Add-a-comment-to-the-code.patch", newcontent, "New patch should have been added to the recipe but wasn't")
         self.assertIn("http://www.ivarch.com/programs/sources/pv-${PV}.tar.gz", newcontent, "New recipe no longer has upstream source in SRC_URI")
 
-
     def test_devtool_finish_upgrade_otherlayer(self):
         recipe, oldrecipefile, recipedir, olddir, newversion, patchfn, backportedpatchfn = self._setup_test_devtool_finish_upgrade()
         # Ensure the recipe is where we think it should be (so that cleanup doesn't trash things)
@@ -1789,6 +1799,7 @@ class DevtoolUpgradeTests(DevtoolBase):
         recipever = '3.1.2'
         recipefile = os.path.join(self.workspacedir, 'recipes', recipename, '%s_%s.bb' % (recipename, recipever))
         url = 'http://downloads.yoctoproject.org/mirror/sources/i2c-tools-%s.tar.bz2' % recipever
+
         def add_recipe():
             result = runCmd('devtool add %s' % url)
             self.assertExists(recipefile, 'Expected recipe file not created')
diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index 0ad6e1ef91..186b3e19e7 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -9,6 +9,7 @@ from oeqa.utils.ftools import write_file
 
 import oe.recipeutils
 
+
 class Distrodata(OESelftestTestCase):
 
     def test_checkpkg(self):
diff --git a/meta/lib/oeqa/selftest/cases/eSDK.py b/meta/lib/oeqa/selftest/cases/eSDK.py
index 1d185935e4..d40ff86c4a 100644
--- a/meta/lib/oeqa/selftest/cases/eSDK.py
+++ b/meta/lib/oeqa/selftest/cases/eSDK.py
@@ -10,6 +10,7 @@ import time
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
 
+
 class oeSDKExtSelfTest(OESelftestTestCase):
     """
     # Bugzilla Test Plan: 6033
diff --git a/meta/lib/oeqa/selftest/cases/efibootpartition.py b/meta/lib/oeqa/selftest/cases/efibootpartition.py
index a61cf9bcb3..189f5193cb 100644
--- a/meta/lib/oeqa/selftest/cases/efibootpartition.py
+++ b/meta/lib/oeqa/selftest/cases/efibootpartition.py
@@ -10,6 +10,7 @@ import re
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, runqemu, get_bb_var
 
+
 class GenericEFITest(OESelftestTestCase):
     """EFI booting test class"""
 
diff --git a/meta/lib/oeqa/selftest/cases/fetch.py b/meta/lib/oeqa/selftest/cases/fetch.py
index cd15f65129..561b581618 100644
--- a/meta/lib/oeqa/selftest/cases/fetch.py
+++ b/meta/lib/oeqa/selftest/cases/fetch.py
@@ -9,6 +9,7 @@ import oe.path
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake
 
+
 class Fetch(OESelftestTestCase):
     def test_git_mirrors(self):
         """
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 67000bb1c1..42f6756996 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -8,6 +8,7 @@ import os
 import json
 import re
 
+
 class FitImageTests(OESelftestTestCase):
 
     def test_fit_image(self):
@@ -87,7 +88,6 @@ FIT_DESC = "A model description"
                 "Fields in Image Tree Source File %s did not match, error in finding %s"
                 % (fitimage_its_path, its_field_check[field_index]))
 
-
     def test_sign_fit_image(self):
         """
         Summary:     Check if FIT image and Image Tree Source (its) are created
@@ -397,7 +397,6 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart U-Boot comment'"
                 "Fields in Image Tree Source File %s did not match, error in finding %s"
                 % (fitimage_its_path, its_field_check[field_index]))
 
-
     def test_sign_standalone_uboot_fit_image(self):
         """
         Summary:     Check if U-Boot FIT image and Image Tree Source (its) are
@@ -697,8 +696,6 @@ FIT_SIGN_INDIVIDUAL = "1"
         result = runCmd('grep "### uboot-mkimage signing wrapper message" %s/log.do_uboot_assemble_fitimage' % tempdir, ignore_status=True)
         self.assertEqual(result.status, 0, 'UBOOT_MKIMAGE_SIGN did not work')
 
-
-
     def test_initramfs_bundle(self):
         """
         Summary:     Verifies the content of the initramfs bundle node in the FIT Image Tree Source (its)
diff --git a/meta/lib/oeqa/selftest/cases/gcc.py b/meta/lib/oeqa/selftest/cases/gcc.py
index 46fd9813d6..843746418f 100644
--- a/meta/lib/oeqa/selftest/cases/gcc.py
+++ b/meta/lib/oeqa/selftest/cases/gcc.py
@@ -5,6 +5,7 @@ from oeqa.core.case import OEPTestResultTestCase
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, runqemu, Command
 
+
 def parse_values(content):
     for i in content:
         for v in ["PASS", "FAIL", "XPASS", "XFAIL", "UNRESOLVED", "UNSUPPORTED", "UNTESTED", "ERROR", "WARNING"]:
@@ -12,6 +13,7 @@ def parse_values(content):
                 yield i[len(v) + 2:].strip(), v
                 break
 
+
 class GccSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
     def check_skip(self, suite):
         targets = get_bb_var("RUNTIMETARGET", "gcc-runtime").split()
@@ -76,74 +78,88 @@ class GccSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
 
             return self.run_check(*args, ssh=qemu.ip, **kwargs)
 
+
 @OETestTag("toolchain-user")
 class GccCrossSelfTest(GccSelfTestBase):
     def test_cross_gcc(self):
         self.run_check("gcc")
 
+
 @OETestTag("toolchain-user")
 class GxxCrossSelfTest(GccSelfTestBase):
     def test_cross_gxx(self):
         self.run_check("g++")
 
+
 @OETestTag("toolchain-user")
 class GccLibAtomicSelfTest(GccSelfTestBase):
     def test_libatomic(self):
         self.run_check("libatomic")
 
+
 @OETestTag("toolchain-user")
 class GccLibGompSelfTest(GccSelfTestBase):
     def test_libgomp(self):
         self.run_check("libgomp")
 
+
 @OETestTag("toolchain-user")
 class GccLibStdCxxSelfTest(GccSelfTestBase):
     def test_libstdcxx(self):
         self.run_check("libstdc++-v3")
 
+
 @OETestTag("toolchain-user")
 class GccLibSspSelfTest(GccSelfTestBase):
     def test_libssp(self):
         self.check_skip("libssp")
         self.run_check("libssp")
 
+
 @OETestTag("toolchain-user")
 class GccLibItmSelfTest(GccSelfTestBase):
     def test_libitm(self):
         self.check_skip("libitm")
         self.run_check("libitm")
 
+
 @OETestTag("toolchain-system")
 class GccCrossSelfTestSystemEmulated(GccSelfTestBase):
     def test_cross_gcc(self):
         self.run_check_emulated("gcc")
 
+
 @OETestTag("toolchain-system")
 class GxxCrossSelfTestSystemEmulated(GccSelfTestBase):
     def test_cross_gxx(self):
         self.run_check_emulated("g++")
 
+
 @OETestTag("toolchain-system")
 class GccLibAtomicSelfTestSystemEmulated(GccSelfTestBase):
     def test_libatomic(self):
         self.run_check_emulated("libatomic")
 
+
 @OETestTag("toolchain-system")
 class GccLibGompSelfTestSystemEmulated(GccSelfTestBase):
     def test_libgomp(self):
         self.run_check_emulated("libgomp")
 
+
 @OETestTag("toolchain-system")
 class GccLibStdCxxSelfTestSystemEmulated(GccSelfTestBase):
     def test_libstdcxx(self):
         self.run_check_emulated("libstdc++-v3")
 
+
 @OETestTag("toolchain-system")
 class GccLibSspSelfTestSystemEmulated(GccSelfTestBase):
     def test_libssp(self):
         self.check_skip("libssp")
         self.run_check_emulated("libssp")
 
+
 @OETestTag("toolchain-system")
 class GccLibItmSelfTestSystemEmulated(GccSelfTestBase):
     def test_libitm(self):
diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selftest/cases/glibc.py
index 852c8635df..842b663bdc 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -7,6 +7,7 @@ from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, runqemu, Command
 from oeqa.utils.nfs import unfs_server
 
+
 def parse_values(content):
     for i in content:
         for v in ["PASS", "FAIL", "XPASS", "XFAIL", "UNRESOLVED", "UNSUPPORTED", "UNTESTED", "ERROR", "WARNING"]:
@@ -14,6 +15,7 @@ def parse_values(content):
                 yield i[len(v) + 2:].strip(), v
                 break
 
+
 class GlibcSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
     def run_check(self, ssh=None):
         # configure ssh target
@@ -77,11 +79,13 @@ class GlibcSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
 
             self.run_check(ssh=qemu.ip)
 
+
 @OETestTag("toolchain-user")
 class GlibcSelfTest(GlibcSelfTestBase):
     def test_glibc(self):
         self.run_check()
 
+
 @OETestTag("toolchain-system")
 class GlibcSelfTestSystemEmulated(GlibcSelfTestBase):
     def test_glibc(self):
diff --git a/meta/lib/oeqa/selftest/cases/image_typedep.py b/meta/lib/oeqa/selftest/cases/image_typedep.py
index 269fd556b7..13bddd10d2 100644
--- a/meta/lib/oeqa/selftest/cases/image_typedep.py
+++ b/meta/lib/oeqa/selftest/cases/image_typedep.py
@@ -7,6 +7,7 @@ import os
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake
 
+
 class ImageTypeDepTests(OESelftestTestCase):
 
     # Verify that when specifying a IMAGE_TYPEDEP_ of the form "foo.bar" that
diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 07e46d5cfd..6f982b52c2 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -9,6 +9,7 @@ import glob
 import os
 import json
 
+
 class ImageFeatures(OESelftestTestCase):
 
     test_user = 'tester'
@@ -67,7 +68,6 @@ class ImageFeatures(OESelftestTestCase):
                 else:
                     self.assertEqual(status, 0, 'ssh to user tester failed with %s' % output)
 
-
     def test_wayland_support_in_image(self):
         """
         Summary:     Check Wayland support in image
diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index 152da6332a..22a38a3f1a 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -1,6 +1,7 @@
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake
 
+
 class IncompatibleLicenseTests(OESelftestTestCase):
 
     def lic_test(self, pn, pn_lic, lic):
@@ -82,6 +83,7 @@ class IncompatibleLicenseTests(OESelftestTestCase):
     def test_incompatible_nonspdx_license(self):
         self.lic_test('incompatible-nonspdx-license', 'FooLicense', 'FooLicense')
 
+
 class IncompatibleLicensePerImageTests(OESelftestTestCase):
     def default_config(self):
         return """
@@ -115,6 +117,7 @@ INCOMPATIBLE_LICENSE_pn-core-image-minimal = "GPL-3.0 LGPL-3.0"
 
         bitbake('core-image-minimal')
 
+
 class NoGPL3InImagesTests(OESelftestTestCase):
     def test_core_image_minimal(self):
         self.write_config("""
diff --git a/meta/lib/oeqa/selftest/cases/kerneldevelopment.py b/meta/lib/oeqa/selftest/cases/kerneldevelopment.py
index 697f6a94a5..5e35a0ba82 100644
--- a/meta/lib/oeqa/selftest/cases/kerneldevelopment.py
+++ b/meta/lib/oeqa/selftest/cases/kerneldevelopment.py
@@ -3,6 +3,7 @@ from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, get_bb_var
 from oeqa.utils.git import GitRepo
 
+
 class KernelDev(OESelftestTestCase):
 
     @classmethod
diff --git a/meta/lib/oeqa/selftest/cases/layerappend.py b/meta/lib/oeqa/selftest/cases/layerappend.py
index 05e9426fc6..96f02f38d5 100644
--- a/meta/lib/oeqa/selftest/cases/layerappend.py
+++ b/meta/lib/oeqa/selftest/cases/layerappend.py
@@ -8,6 +8,7 @@ from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 import oeqa.utils.ftools as ftools
 
+
 class LayerAppendTests(OESelftestTestCase):
     layerconf = """
 # We have a conf and classes directory, append to BBPATH
diff --git a/meta/lib/oeqa/selftest/cases/liboe.py b/meta/lib/oeqa/selftest/cases/liboe.py
index afe8f8809f..40b049782d 100644
--- a/meta/lib/oeqa/selftest/cases/liboe.py
+++ b/meta/lib/oeqa/selftest/cases/liboe.py
@@ -7,6 +7,7 @@ from oeqa.utils.commands import get_bb_var, get_bb_vars, bitbake, runCmd
 import oe.path
 import os
 
+
 class LibOE(OESelftestTestCase):
 
     @classmethod
diff --git a/meta/lib/oeqa/selftest/cases/lic_checksum.py b/meta/lib/oeqa/selftest/cases/lic_checksum.py
index bae935d697..9264ab048b 100644
--- a/meta/lib/oeqa/selftest/cases/lic_checksum.py
+++ b/meta/lib/oeqa/selftest/cases/lic_checksum.py
@@ -9,6 +9,7 @@ from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake
 from oeqa.utils import CommandError
 
+
 class LicenseTests(OESelftestTestCase):
 
     # Verify that changing a license file that has an absolute path causes
diff --git a/meta/lib/oeqa/selftest/cases/manifest.py b/meta/lib/oeqa/selftest/cases/manifest.py
index c7ba0ae5b7..f29cf4ae91 100644
--- a/meta/lib/oeqa/selftest/cases/manifest.py
+++ b/meta/lib/oeqa/selftest/cases/manifest.py
@@ -7,12 +7,15 @@ import os
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import get_bb_var, get_bb_vars, bitbake
 
+
 class ManifestEntry:
     '''A manifest item of a collection able to list missing packages'''
+
     def __init__(self, entry):
         self.file = entry
         self.missing = []
 
+
 class VerifyManifest(OESelftestTestCase):
     '''Tests for the manifest files and contents of an image'''
 
@@ -77,7 +80,6 @@ class VerifyManifest(OESelftestTestCase):
             self.skipTest("{}: Cannot setup testing scenario"
                     .format(self.classname))
 
-
         pkgdata_dir = reverse_dir = {}
         mfilename = mpath = m_entry = {}
         # get manifest location based on target to query about
diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py b/meta/lib/oeqa/selftest/cases/meta_ide.py
index 3c6371fba8..cf111fa781 100644
--- a/meta/lib/oeqa/selftest/cases/meta_ide.py
+++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
@@ -9,6 +9,7 @@ from oeqa.core.decorator import OETestTag
 import tempfile
 import shutil
 
+
 @OETestTag("machine")
 class MetaIDE(OESelftestTestCase):
 
diff --git a/meta/lib/oeqa/selftest/cases/multiconfig.py b/meta/lib/oeqa/selftest/cases/multiconfig.py
index 39b92f2439..0b95cbc7ff 100644
--- a/meta/lib/oeqa/selftest/cases/multiconfig.py
+++ b/meta/lib/oeqa/selftest/cases/multiconfig.py
@@ -7,6 +7,7 @@ import textwrap
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake
 
+
 class MultiConfig(OESelftestTestCase):
 
     def test_multiconfig(self):
diff --git a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
index ad4ae8ccef..18a877ee72 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
@@ -8,6 +8,7 @@ import tempfile
 import operator
 from oeqa.utils.commands import get_bb_var
 
+
 class TestBlobParsing(OESelftestTestCase):
 
     def setUp(self):
@@ -99,6 +100,7 @@ class TestBlobParsing(OESelftestTestCase):
 
         self.assertEqual(defaultmap, var_changes, "Defaults not set properly")
 
+
 class TestFileListCompare(OESelftestTestCase):
 
     def test_compare_file_lists(self):
diff --git a/meta/lib/oeqa/selftest/cases/oelib/elf.py b/meta/lib/oeqa/selftest/cases/oelib/elf.py
index 5a5f9b4fdf..7788e82fd7 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/elf.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/elf.py
@@ -5,6 +5,7 @@
 from unittest.case import TestCase
 import oe.qa
 
+
 class TestElf(TestCase):
     def test_machine_name(self):
         """
diff --git a/meta/lib/oeqa/selftest/cases/oelib/license.py b/meta/lib/oeqa/selftest/cases/oelib/license.py
index 6ebbee589f..8536a80bfe 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/license.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/license.py
@@ -5,6 +5,7 @@
 from unittest.case import TestCase
 import oe.license
 
+
 class SeenVisitor(oe.license.LicenseVisitor):
     def __init__(self):
         self.seen = []
@@ -13,6 +14,7 @@ class SeenVisitor(oe.license.LicenseVisitor):
     def visit_Str(self, node):
         self.seen.append(node.s)
 
+
 class TestSingleLicense(TestCase):
     licenses = [
         "GPLv2",
@@ -41,6 +43,7 @@ class TestSingleLicense(TestCase):
                 self.parse(license)
             self.assertEqual(cm.exception.license, license)
 
+
 class TestSimpleCombinations(TestCase):
     tests = {
         "FOO&BAR": ["FOO", "BAR"],
@@ -62,6 +65,7 @@ class TestSimpleCombinations(TestCase):
             licenses = oe.license.flattened_licenses(license, choose)
             self.assertListEqual(licenses, expected)
 
+
 class TestComplexCombinations(TestSimpleCombinations):
     tests = {
         "FOO & (BAR | BAZ)&MOO": ["FOO", "BAR", "MOO"],
@@ -71,6 +75,7 @@ class TestComplexCombinations(TestSimpleCombinations):
     }
     preferred = ["BAR", "OMEGA", "BETA", "GPL-2.0"]
 
+
 class TestIsIncluded(TestCase):
     tests = {
         ("FOO | BAR", None, None):
diff --git a/meta/lib/oeqa/selftest/cases/oelib/path.py b/meta/lib/oeqa/selftest/cases/oelib/path.py
index 5cfacfbd35..b5c8ea9ff4 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/path.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/path.py
@@ -10,6 +10,7 @@ import os
 import errno
 import shutil
 
+
 class TestRealPath(TestCase):
     DIRS = ["a", "b", "etc", "sbin", "usr", "usr/bin", "usr/binX", "usr/sbin", "usr/include", "usr/include/gdbm"]
     FILES = ["etc/passwd", "b/file"]
diff --git a/meta/lib/oeqa/selftest/cases/oelib/types.py b/meta/lib/oeqa/selftest/cases/oelib/types.py
index 7eb49e6f95..edaf7a3e01 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/types.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/types.py
@@ -5,6 +5,7 @@
 from unittest.case import TestCase
 from oe.maketype import create
 
+
 class TestBooleanType(TestCase):
     def test_invalid(self):
         self.assertRaises(ValueError, create, '', 'boolean')
@@ -35,6 +36,7 @@ class TestBooleanType(TestCase):
         self.assertEqual(create('y', 'boolean'), True)
         self.assertNotEqual(create('y', 'boolean'), False)
 
+
 class TestList(TestCase):
     def assertListEqual(self, value, valid, sep=None):
         obj = create(value, 'list', separator=sep)
diff --git a/meta/lib/oeqa/selftest/cases/oelib/utils.py b/meta/lib/oeqa/selftest/cases/oelib/utils.py
index a7214beb4c..426f94b258 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/utils.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/utils.py
@@ -8,6 +8,7 @@ from contextlib import contextmanager
 from io import StringIO
 from oe.utils import packages_filter_out_system, trim_version, multiprocess_launch
 
+
 class TestPackagesFilterOutSystem(TestCase):
     def test_filter(self):
         """
@@ -70,6 +71,7 @@ class TestMultiprocessLaunch(TestCase):
 
         def dummyerror(msg):
             print("ERROR: %s" % msg)
+
         def dummyfatal(msg):
             print("ERROR: %s" % msg)
             raise bb.BBHandledException()
diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index 7b20d374dd..cf432d9d35 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -11,6 +11,7 @@ from oeqa.selftest.cases.buildhistory import BuildhistoryBase
 from oeqa.utils.commands import Command, runCmd, bitbake, get_bb_var, get_test_layer
 from oeqa.utils import CommandError
 
+
 class BuildhistoryDiffTests(BuildhistoryBase):
 
     def test_buildhistory_diff(self):
@@ -34,6 +35,7 @@ class BuildhistoryDiffTests(BuildhistoryBase):
         if expected_endlines:
             self.fail('Missing expected line endings:\n  %s' % '\n  '.join(expected_endlines))
 
+
 @unittest.skipUnless(importlib.util.find_spec("cairo"), "Python cairo module is not present")
 class OEScriptTests(OESelftestTestCase):
 
@@ -47,6 +49,7 @@ class OEScriptTests(OESelftestTestCase):
 
     scripts_dir = os.path.join(get_bb_var('COREBASE'), 'scripts')
 
+
 class OEPybootchartguyTests(OEScriptTests):
 
     def test_pybootchartguy_help(self):
@@ -122,12 +125,14 @@ class OEGitproxyTests(OESelftestTestCase):
             self.skipTest("No \"dash\" found on test system.")
         self.run_oegitproxy(custom_shell=dash)
 
+
 class OeRunNativeTest(OESelftestTestCase):
     def test_oe_run_native(self):
         bitbake("qemu-helper-native -c addto_recipe_sysroot")
         result = runCmd("oe-run-native qemu-helper-native tunctl -h")
         self.assertIn("Delete: tunctl -d device-name [-f tun-clone-device]", result.output)
 
+
 class OEListPackageconfigTests(OEScriptTests):
     #oe-core.scripts.List_all_the_PACKAGECONFIG's_flags
     def check_endlines(self, results, expected_endlines): 
@@ -140,8 +145,8 @@ class OEListPackageconfigTests(OEScriptTests):
         if expected_endlines:
             self.fail('Missing expected listings:\n  %s' % '\n  '.join(expected_endlines))
 
-
     #oe-core.scripts.List_all_the_PACKAGECONFIG's_flags
+
     def test_packageconfig_flags_help(self):
         runCmd('%s/contrib/list-packageconfig-flags.py -h' % self.scripts_dir)
 
@@ -154,7 +159,6 @@ class OEListPackageconfigTests(OEScriptTests):
 
         self.check_endlines(results, expected_endlines)
 
-
     def test_packageconfig_flags_option_flags(self):
         results = runCmd('%s/contrib/list-packageconfig-flags.py -f' % self.scripts_dir)
         expected_endlines = []
diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index eb39136b43..6770dcaea1 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -10,6 +10,7 @@ import os
 import oe.path
 import re
 
+
 class VersionOrdering(OESelftestTestCase):
     # version1, version2, sort order
     tests = (
@@ -88,6 +89,7 @@ class VersionOrdering(OESelftestTestCase):
             self.assertIn(status, (99, 100, 101))
             self.assertEqual(status - 100, sort, "%s %s (%d) failed" % (ver1, ver2, sort))
 
+
 class PackageTests(OESelftestTestCase):
     # Verify that a recipe which sets up hardlink files has those preserved into split packages
     # Also test file sparseness is preserved
@@ -159,6 +161,7 @@ class PackageTests(OESelftestTestCase):
         bitbake("core-image-minimal")
 
         sysconfdir = get_bb_var('sysconfdir', 'selftest-chown')
+
         def check_ownership(qemu, gid, uid, path):
             self.logger.info("Check ownership of %s", path)
             status, output = qemu.run_serial(r'/bin/stat -c "%U %G" ' + path, timeout=60)
diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py b/meta/lib/oeqa/selftest/cases/pkgdata.py
index fb8b412848..c1a12cb438 100644
--- a/meta/lib/oeqa/selftest/cases/pkgdata.py
+++ b/meta/lib/oeqa/selftest/cases/pkgdata.py
@@ -9,6 +9,7 @@ import fnmatch
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
 
+
 class OePkgdataUtilTests(OESelftestTestCase):
 
     @classmethod
diff --git a/meta/lib/oeqa/selftest/cases/prservice.py b/meta/lib/oeqa/selftest/cases/prservice.py
index 578b2b4dd9..0b248addda 100644
--- a/meta/lib/oeqa/selftest/cases/prservice.py
+++ b/meta/lib/oeqa/selftest/cases/prservice.py
@@ -12,6 +12,7 @@ from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 from oeqa.utils.network import get_free_port
 
+
 class BitbakePrTests(OESelftestTestCase):
 
     @classmethod
diff --git a/meta/lib/oeqa/selftest/cases/pseudo.py b/meta/lib/oeqa/selftest/cases/pseudo.py
index 33593d5ce9..6b705d6261 100644
--- a/meta/lib/oeqa/selftest/cases/pseudo.py
+++ b/meta/lib/oeqa/selftest/cases/pseudo.py
@@ -8,6 +8,7 @@ import shutil
 from oeqa.utils.commands import bitbake, get_test_layer
 from oeqa.selftest.case import OESelftestTestCase
 
+
 class Pseudo(OESelftestTestCase):
 
     def test_pseudo_pyc_creation(self):
diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 9d56e9e1e3..679a3b61dc 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -13,6 +13,7 @@ from oeqa.selftest.cases import devtool
 
 templayerdir = None
 
+
 def setUpModule():
     global templayerdir
     templayerdir = tempfile.mkdtemp(prefix='recipetoolqa')
@@ -652,8 +653,6 @@ class RecipetoolAppendsrcBase(RecipetoolBase):
         self.assertIn(filesdir, filesextrapaths)
 
 
-
-
 class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
 
     def test_recipetool_appendsrcfile_basic(self):
diff --git a/meta/lib/oeqa/selftest/cases/recipeutils.py b/meta/lib/oeqa/selftest/cases/recipeutils.py
index 747870383b..4883d15b51 100644
--- a/meta/lib/oeqa/selftest/cases/recipeutils.py
+++ b/meta/lib/oeqa/selftest/cases/recipeutils.py
@@ -61,7 +61,6 @@ class RecipeUtilsTests(OESelftestTestCase):
         self.maxDiff = None
         self.assertEqual(''.join(patchlines).strip(), expected_patch.strip())
 
-
     def test_patch_recipe_singleappend(self):
         import oe.recipeutils
         rd = tinfoil.parse_recipe('recipeutils-test')
@@ -88,7 +87,6 @@ class RecipeUtilsTests(OESelftestTestCase):
                 patchlines.append(line)
         self.assertEqual(''.join(patchlines).strip(), expected_patch.strip())
 
-
     def test_patch_recipe_appends(self):
         import oe.recipeutils
         rd = tinfoil.parse_recipe('recipeutils-test')
@@ -113,7 +111,6 @@ class RecipeUtilsTests(OESelftestTestCase):
                 patchlines.append(line)
         self.assertEqual(''.join(patchlines).strip(), expected_patch.strip())
 
-
     def test_validate_pn(self):
         import oe.recipeutils
         expected_results = {
diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index a62757399b..d2053b1473 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -36,6 +36,7 @@ exclude_packages = [
 	'ruby-ri-docs'
 	]
 
+
 def is_excluded(package):
     package_name = os.path.basename(package)
     for i in exclude_packages:
@@ -43,10 +44,12 @@ def is_excluded(package):
             return i
     return None
 
+
 MISSING = 'MISSING'
 DIFFERENT = 'DIFFERENT'
 SAME = 'SAME'
 
+
 @functools.total_ordering
 class CompareResult(object):
     def __init__(self):
@@ -60,6 +63,7 @@ class CompareResult(object):
     def __lt__(self, other):
         return (self.status, self.test) < (other.status, other.test)
 
+
 class PackageCompareResults(object):
     def __init__(self):
         self.total = []
@@ -96,6 +100,7 @@ class PackageCompareResults(object):
     def unused_exclusions(self):
         return sorted(set(exclude_packages) - self.active_exclusions)
 
+
 def compare_file(reference, test, diffutils_sysroot):
     result = CompareResult()
     result.reference = reference
@@ -114,10 +119,12 @@ def compare_file(reference, test, diffutils_sysroot):
     result.status = SAME
     return result
 
+
 def run_diffoscope(a_dir, b_dir, html_dir, **kwargs):
     return runCmd(['diffoscope', '--no-default-limits', '--exclude-directory-metadata', 'yes', '--html-dir', html_dir, a_dir, b_dir],
                 **kwargs)
 
+
 class DiffoscopeTests(OESelftestTestCase):
     diffoscope_test_files = os.path.join(os.path.dirname(os.path.abspath(__file__)), "diffoscope")
 
@@ -140,6 +147,7 @@ class DiffoscopeTests(OESelftestTestCase):
             self.assertNotEqual(r.status, 0, msg="diffoscope was successful when an error was expected")
             self.assertTrue(os.path.exists(os.path.join(tmpdir, 'index.html')), "HTML index not found!")
 
+
 class ReproducibleTests(OESelftestTestCase):
     # Test the reproducibility of whatever is built between sstate_targets and targets
 
diff --git a/meta/lib/oeqa/selftest/cases/resulttooltests.py b/meta/lib/oeqa/selftest/cases/resulttooltests.py
index dac5c46801..aa3b87c031 100644
--- a/meta/lib/oeqa/selftest/cases/resulttooltests.py
+++ b/meta/lib/oeqa/selftest/cases/resulttooltests.py
@@ -12,6 +12,7 @@ from resulttool import regression as regression
 from resulttool import resultutils as resultutils
 from oeqa.selftest.case import OESelftestTestCase
 
+
 class ResultToolTests(OESelftestTestCase):
     base_results_data = {'base_result1': {'configuration': {"TEST_TYPE": "runtime",
                                                             "TESTSERIES": "series1",
diff --git a/meta/lib/oeqa/selftest/cases/runcmd.py b/meta/lib/oeqa/selftest/cases/runcmd.py
index fa6113d7fa..bef723c588 100644
--- a/meta/lib/oeqa/selftest/cases/runcmd.py
+++ b/meta/lib/oeqa/selftest/cases/runcmd.py
@@ -11,6 +11,7 @@ import threading
 import time
 import signal
 
+
 class MemLogger(object):
     def __init__(self):
         self.info_msgs = []
@@ -22,6 +23,7 @@ class MemLogger(object):
     def error(self, msg):
         self.error_msgs.append(msg)
 
+
 class RunCmdTests(OESelftestTestCase):
     """ Basic tests for runCmd() utility function """
 
diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index b7656296f2..0b2ed88a1a 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -12,6 +12,7 @@ from oeqa.core.decorator import OETestTag
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, runqemu, get_bb_var, runCmd
 
+
 class RunqemuTests(OESelftestTestCase):
     """Runqemu test class"""
 
@@ -72,7 +73,6 @@ SYSLINUX_TIMEOUT = "10"
             with open(qemu.qemurunnerlog) as f:
                 self.assertTrue(qemu.runner.logged, "Failed: %s, %s" % (cmd, f.read()))
 
-
     def test_boot_recipe_image_vmdk(self):
         """Test runqemu recipe-image vmdk"""
         cmd = "%s %s wic.vmdk" % (self.cmd_common, self.recipe)
@@ -94,7 +94,6 @@ SYSLINUX_TIMEOUT = "10"
             with open(qemu.qemurunnerlog) as f:
                 self.assertTrue(qemu.runner.logged, "Failed: %s, %s" % (cmd, f.read()))
 
-
     def test_boot_deploy_hddimg(self):
         """Test runqemu deploy_dir_image hddimg"""
         cmd = "%s %s hddimg" % (self.cmd_common, self.deploy_dir_image)
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 02eaf213cb..95c37e2ec9 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -12,6 +12,7 @@ import shutil
 import oe.lsb
 from oeqa.core.decorator.data import skipIfNotQemu
 
+
 class TestExport(OESelftestTestCase):
 
     def test_testexport_basic(self):
@@ -235,6 +236,7 @@ class TestImage(OESelftestTestCase):
         bitbake('core-image-minimal')
         bitbake('-c testimage core-image-minimal')
 
+
 class Postinst(OESelftestTestCase):
 
     def init_manager_loop(self, init_manager):
@@ -273,8 +275,6 @@ class Postinst(OESelftestTestCase):
                         status, output = qemu.run_serial("test -f %s && echo found" % os.path.join(targettestdir, filename))
                         self.assertIn("found", output, "%s was not present on boot" % filename)
 
-
-
     @skipIfNotQemu('qemuall', 'Test only runs in qemu')
     def test_postinst_rootfs_and_boot_sysvinit(self):
         """
@@ -295,7 +295,6 @@ class Postinst(OESelftestTestCase):
         """
         self.init_manager_loop("sysvinit")
 
-
     @skipIfNotQemu('qemuall', 'Test only runs in qemu')
     def test_postinst_rootfs_and_boot_systemd(self):
         """
@@ -317,7 +316,6 @@ class Postinst(OESelftestTestCase):
 
         self.init_manager_loop("systemd")
 
-
     def test_failing_postinst(self):
         """
         Summary:        The purpose of this test case is to verify that post-installation
@@ -352,6 +350,7 @@ class Postinst(OESelftestTestCase):
                 self.assertFalse(os.path.isfile(os.path.join(hosttestdir, "rootfs-after-failure")),
                                     "rootfs-after-failure file was created")
 
+
 class SystemTap(OESelftestTestCase):
         """
         Summary:        The purpose of this test case is to verify native crosstap
diff --git a/meta/lib/oeqa/selftest/cases/selftest.py b/meta/lib/oeqa/selftest/cases/selftest.py
index af080dcf03..a5d9a06d36 100644
--- a/meta/lib/oeqa/selftest/cases/selftest.py
+++ b/meta/lib/oeqa/selftest/cases/selftest.py
@@ -7,6 +7,7 @@ from oeqa.utils.commands import runCmd
 import oeqa.selftest
 from oeqa.selftest.case import OESelftestTestCase
 
+
 class ExternalLayer(OESelftestTestCase):
 
     def test_list_imported(self):
@@ -33,6 +34,7 @@ class ExternalLayer(OESelftestTestCase):
         found_method = search_method(test_module, method_name)
         self.assertTrue(method_name, msg="Can't find %s method" % method_name)
 
+
 def search_test_file(file_name):
     for layer_path in oeqa.selftest.__path__:
         for _, _, files in os.walk(layer_path):
@@ -41,6 +43,7 @@ def search_test_file(file_name):
                     return True
     return False
 
+
 def search_method(module, method):
     modlib = importlib.import_module(module)
     for var in vars(modlib):
diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index a28c7eb19a..865a71e93e 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -34,7 +34,6 @@ class Signing(OESelftestTestCase):
         runCmd('gpg --agent-program=`which gpg-agent`\|--auto-expand-secmem --batch --homedir %s --import %s %s' % (self.gpg_dir, self.pub_key_path, self.secret_key_path), native_sysroot=nsysroot)
         return nsysroot + get_bb_var("bindir_native")
 
-
     @contextmanager
     def create_new_builddir(self, builddir, newbuilddir):
         bb.utils.mkdirhier(newbuilddir)
@@ -120,7 +119,6 @@ class Signing(OESelftestTestCase):
         bitbake('-c clean core-image-minimal')
         bitbake('core-image-minimal')
 
-
     def test_signing_sstate_archive(self):
         """
         Summary:     Test that sstate archives can be signed
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index c3846f6771..175ce6a26d 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -14,6 +14,7 @@ from oeqa.selftest.cases.sstate import SStateBase
 
 import bb.siggen
 
+
 class SStateTests(SStateBase):
     def test_autorev_sstate_works(self):
         # Test that a git repository which changes is correctly handled by SRCREV = ${AUTOREV}
@@ -53,8 +54,8 @@ class SStateTests(SStateBase):
         result = runCmd('git add bar.txt; git commit -asm "add bar"', cwd=srcdir)
         bitbake("dbus-wait-test -c unpack")
 
-
     # Test sstate files creation and their location
+
     def run_test_sstate_creation(self, targets, distro_specific=True, distro_nonspecific=True, temp_sstate_location=True, should_pass=True):
         self.config_sstate(temp_sstate_location, [self.sstate_path])
 
@@ -121,8 +122,8 @@ class SStateTests(SStateBase):
         targets.append('linux-libc-headers')
         self.run_test_cleansstate_task(targets, distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
 
-
     # Test rebuilding of distro-specific sstate files
+
     def run_test_rebuild_distro_specific_sstate(self, targets, temp_sstate_location=True):
         self.config_sstate(temp_sstate_location, [self.sstate_path])
 
@@ -163,9 +164,9 @@ class SStateTests(SStateBase):
     def test_rebuild_distro_specific_sstate_native_target(self):
         self.run_test_rebuild_distro_specific_sstate(['binutils-native'], temp_sstate_location=True)
 
-
     # Test the sstate-cache-management script. Each element in the global_config list is used with the corresponding element in the target_config list
     # global_config elements are expected to not generate any sstate files that would be removed by sstate-cache-management.sh (such as changing the value of MACHINE)
+
     def run_test_sstate_cache_management_script(self, target, global_config=[''], target_config=[''], ignore_patterns=[]):
         self.assertTrue(global_config)
         self.assertTrue(target_config)
@@ -291,7 +292,6 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
         self.maxDiff = None
         self.assertCountEqual(files1, files2)
 
-
     def test_sstate_nativelsbstring_same_hash(self):
         """
         The sstate checksums should be independent of whichever NATIVELSBSTRING is
@@ -448,7 +448,6 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
         self.maxDiff = None
         self.assertCountEqual(files1, files2)
 
-
     def test_sstate_multilib_or_not_native_samesigs(self):
         """The sstate checksums of two native recipes (and their dependencies)
         where the target is using multilib in one but not the other
@@ -488,7 +487,6 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
         self.maxDiff = None
         self.assertCountEqual(files1, files2)
 
-
     def test_sstate_noop_samesigs(self):
         """
         The sstate checksums of two builds with these variables changed or
diff --git a/meta/lib/oeqa/selftest/cases/sysroot.py b/meta/lib/oeqa/selftest/cases/sysroot.py
index c884488025..937bc49af6 100644
--- a/meta/lib/oeqa/selftest/cases/sysroot.py
+++ b/meta/lib/oeqa/selftest/cases/sysroot.py
@@ -7,6 +7,7 @@ import uuid
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake
 
+
 class SysrootTests(OESelftestTestCase):
     def test_sysroot_cleanup(self):
         """
diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py b/meta/lib/oeqa/selftest/cases/tinfoil.py
index a51c6048d3..01c2ffe5ee 100644
--- a/meta/lib/oeqa/selftest/cases/tinfoil.py
+++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
@@ -11,6 +11,7 @@ import bb.tinfoil
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd
 
+
 class TinfoilTests(OESelftestTestCase):
     """ Basic tests for the tinfoil API """
 
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index e2b2d28b25..36ab91c4f2 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -44,6 +44,7 @@ def only_for_arch(archs, image='core-image-minimal'):
         return wrapped_f
     return wrapper
 
+
 def extract_files(debugfs_output):
     """
     extract file names from the output of debugfs -R 'ls -p',
@@ -62,6 +63,7 @@ def extract_files(debugfs_output):
     return [line.split('/')[5].strip() for line in
             debugfs_output.strip().split('/\n')]
 
+
 def files_own_by_root(debugfs_output):
     for line in debugfs_output.strip().split('/\n'):
         if line.split('/')[3:5] != ['0', '0']:
@@ -69,6 +71,7 @@ def files_own_by_root(debugfs_output):
             return False
     return True
 
+
 class WicTestCase(OESelftestTestCase):
     """Wic test class."""
 
@@ -110,6 +113,7 @@ class WicTestCase(OESelftestTestCase):
             WicTestCase.wicenv_cache[image] = os.path.join(stdir, machine, 'imgdata')
         return WicTestCase.wicenv_cache[image]
 
+
 class Wic(WicTestCase):
 
     def test_version(self):
@@ -685,6 +689,7 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
                                       % (wks_file, self.resultdir), ignore_status=True).status)
         os.remove(wks_file)
 
+
 class Wic2(WicTestCase):
 
     def test_bmap_short(self):
@@ -1220,7 +1225,6 @@ class Wic2(WicTestCase):
                     os.path.basename(testfile.name), dest, sysroot))
             self.assertTrue(os.path.exists(dest))
 
-
     def test_wic_rm(self):
         """Test removing files and directories from the the wic image."""
         runCmd("wic create mkefidisk "
@@ -1369,7 +1373,6 @@ class Wic2(WicTestCase):
             runCmd("wic cp %s:2/etc/fstab %s -n %s" % (images[0], testfile.name, sysroot))
             self.assertTrue(os.stat(testfile.name).st_size > 0)
 
-
     def test_wic_rm_ext(self):
         """Test removing files from the ext partition."""
         runCmd("wic create mkefidisk "
diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 21c5004ad7..e4d3d88b54 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -22,6 +22,7 @@ from oeqa.core.exception import OEQAPreRun, OEQATestNotFound
 
 from oeqa.utils.commands import runCmd, get_bb_vars, get_test_layer
 
+
 class NonConcurrentTestSuite(unittest.TestSuite):
     def __init__(self, suite, processes, setupfunc, removefunc):
         super().__init__([suite])
@@ -37,6 +38,7 @@ class NonConcurrentTestSuite(unittest.TestSuite):
         if newbuilddir and ret.wasSuccessful() and self.removefunc:
             self.removefunc(newbuilddir)
 
+
 def removebuilddir(d):
     delay = 5
     while delay and os.path.exists(d + "/bitbake.lock"):
@@ -53,6 +55,7 @@ def removebuilddir(d):
             pass
     bb.utils.prunedir(d, ionice=True)
 
+
 class OESelftestTestContext(OETestContext):
     def __init__(self, td=None, logger=None, machines=None, config_paths=None, newbuilddir=None, keep_builddir=None):
         super(OESelftestTestContext, self).__init__(td, logger)
@@ -140,6 +143,7 @@ class OESelftestTestContext(OETestContext):
     def listTests(self, display_type, machine=None):
         return super(OESelftestTestContext, self).listTests(display_type)
 
+
 class OESelftestTestContextExecutor(OETestContextExecutor):
     _context_class = OESelftestTestContext
     _script_executor = 'oe-selftest'
@@ -409,4 +413,5 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
 
         return rc
 
+
 _executor_class = OESelftestTestContextExecutor
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 49c9f5ad92..ab0dd3fac3 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -21,6 +21,7 @@ from oeqa.utils.dump import MonitorDumper
 from oeqa.controllers.testtargetloader import TestTargetLoader
 from abc import ABCMeta, abstractmethod
 
+
 class BaseTarget(object, metaclass=ABCMeta):
 
     supported_image_fstypes = []
@@ -87,7 +88,6 @@ class BaseTarget(object, metaclass=ABCMeta):
         return self.connection.copy_from(remotepath, localpath)
 
 
-
 class QemuTarget(BaseTarget):
 
     supported_image_fstypes = ['ext3', 'ext4', 'cpio.gz', 'wic']
diff --git a/meta/lib/oeqa/utils/__init__.py b/meta/lib/oeqa/utils/__init__.py
index fb81c136f0..40af6e73f8 100644
--- a/meta/lib/oeqa/utils/__init__.py
+++ b/meta/lib/oeqa/utils/__init__.py
@@ -7,14 +7,17 @@ __path__ = extend_path(__path__, __name__)
 
 # Borrowed from CalledProcessError
 
+
 class CommandError(Exception):
     def __init__(self, retcode, cmd, output=None):
         self.retcode = retcode
         self.cmd = cmd
         self.output = output
+
     def __str__(self):
         return "Command '%s' returned non-zero exit status %d with output: %s" % (self.cmd, self.retcode, self.output)
 
+
 def avoid_paths_in_environ(paths):
     """
         Searches for every path in os.environ['PATH']
@@ -39,6 +42,7 @@ def avoid_paths_in_environ(paths):
     new_path = new_path[:-1]
     return new_path
 
+
 def make_logger_bitbake_compatible(logger):
     import logging
 
@@ -53,6 +57,7 @@ def make_logger_bitbake_compatible(logger):
 
     return logger
 
+
 def load_test_components(logger, executor):
     import sys
     import os
diff --git a/meta/lib/oeqa/utils/buildproject.py b/meta/lib/oeqa/utils/buildproject.py
index e6d80cc8dc..1bea6057b9 100644
--- a/meta/lib/oeqa/utils/buildproject.py
+++ b/meta/lib/oeqa/utils/buildproject.py
@@ -14,6 +14,7 @@ import tempfile
 
 from abc import ABCMeta, abstractmethod
 
+
 class BuildProject(metaclass=ABCMeta):
     def __init__(self, uri, foldername=None, tmpdir=None, dl_dir=None):
         self.uri = uri
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 3f297967ab..1b13c5df22 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -9,7 +9,6 @@
 # It provides a class and methods for running commands on the host in a convienent way for tests.
 
 
-
 import os
 import sys
 import signal
@@ -27,6 +26,7 @@ try:
 except ImportError:
     pass
 
+
 class Command(object):
     def __init__(self, command, bg=False, timeout=None, data=None, output_log=None, **options):
 
@@ -238,6 +238,7 @@ def get_bb_env(target=None, postconfig=None):
     else:
         return bitbake("-e", postconfig=postconfig).output
 
+
 def get_bb_vars(variables=None, target=None, postconfig=None):
     """Get values of multiple bitbake variables"""
     bbenv = get_bb_env(target, postconfig=postconfig)
@@ -277,9 +278,11 @@ def get_bb_vars(variables=None, target=None, postconfig=None):
             values[var] = None
     return values
 
+
 def get_bb_var(var, target=None, postconfig=None):
     return get_bb_vars([var], target, postconfig)[var]
 
+
 def get_test_layer():
     layers = get_bb_var("BBLAYERS").split()
     testlayer = None
@@ -291,6 +294,7 @@ def get_test_layer():
             break
     return testlayer
 
+
 def create_temp_layer(templayerdir, templayername, priority=999, recipepathspec='recipes-*/*'):
     os.makedirs(os.path.join(templayerdir, 'conf'))
     with open(os.path.join(templayerdir, 'conf', 'layer.conf'), 'w') as f:
@@ -303,6 +307,7 @@ def create_temp_layer(templayerdir, templayername, priority=999, recipepathspec=
         f.write('BBFILE_PATTERN_IGNORE_EMPTY_%s = "1"\n' % templayername)
         f.write('LAYERSERIES_COMPAT_%s = "${LAYERSERIES_COMPAT_core}"\n' % templayername)
 
+
 @contextlib.contextmanager
 def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None, qemuparams=None, overrides={}, discard_writes=True):
     """
@@ -361,6 +366,7 @@ def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None,
         targetlogger.removeHandler(handler)
         qemu.stop()
 
+
 def updateEnv(env_file):
     """
     Source a file and update environment.
diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index 752e4e6208..498b41dced 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -17,6 +17,8 @@ import signal
 from functools import wraps
 
 #get the "result" object from one of the upper frames provided that one of these upper frames is a unittest.case frame
+
+
 class getResults(object):
     def __init__(self):
         #dynamically determine the unittest.case frame and use it to get the name of the test method
@@ -53,6 +55,7 @@ class getResults(object):
     def getSkipList(self):
         return self.skiplist
 
+
 class skipIfFailure(object):
 
     def __init__(self, testcase):
@@ -68,6 +71,7 @@ class skipIfFailure(object):
         wrapped_f.__name__ = f.__name__
         return wrapped_f
 
+
 class skipIfSkipped(object):
 
     def __init__(self, testcase):
@@ -83,6 +87,7 @@ class skipIfSkipped(object):
         wrapped_f.__name__ = f.__name__
         return wrapped_f
 
+
 class skipUnlessPassed(object):
 
     def __init__(self, testcase):
@@ -101,6 +106,7 @@ class skipUnlessPassed(object):
         wrapped_f._depends_on = self.testcase
         return wrapped_f
 
+
 class testcase(object):
     def __init__(self, test_case):
         self.test_case = test_case
@@ -113,12 +119,15 @@ class testcase(object):
         wrapped_f.__name__ = func.__name__
         return wrapped_f
 
+
 class NoParsingFilter(logging.Filter):
     def filter(self, record):
         return record.levelno == 100
 
+
 import inspect
 
+
 def LogResults(original_class):
     orig_method = original_class.run
 
@@ -215,15 +224,18 @@ def LogResults(original_class):
 
     return original_class
 
+
 class TimeOut(BaseException):
     pass
 
+
 def timeout(seconds):
     def decorator(fn):
         if hasattr(signal, 'alarm'):
             @wraps(fn)
             def wrapped_f(*args, **kw):
                 current_frame = sys._getframe()
+
                 def raiseTimeOut(signal, frame):
                     if frame is not current_frame:
                         raise TimeOut('%s seconds' % seconds)
@@ -239,7 +251,10 @@ def timeout(seconds):
             return fn
     return decorator
 
+
 __tag_prefix = "tag__"
+
+
 def tag(*args, **kwargs):
     """Decorator that adds attributes to classes or functions
     for use with the Attribute (-a) plugin.
@@ -252,6 +267,7 @@ def tag(*args, **kwargs):
         return ob
     return wrap_ob
 
+
 def gettag(obj, key, default=None):
     key = __tag_prefix + key
     if not isinstance(obj, unittest.TestCase):
@@ -260,6 +276,7 @@ def gettag(obj, key, default=None):
     ret = getattr(tc_method, key, getattr(obj, key, default))
     return ret
 
+
 def getAllTags(obj):
     def __gettags(o):
         r = {k[len(__tag_prefix):]: getattr(o, k) for k in dir(o) if k.startswith(__tag_prefix)}
@@ -271,12 +288,14 @@ def getAllTags(obj):
     ret.update(__gettags(tc_method))
     return ret
 
+
 def timeout_handler(seconds):
     def decorator(fn):
         if hasattr(signal, 'alarm'):
             @wraps(fn)
             def wrapped_f(self, *args, **kw):
                 current_frame = sys._getframe()
+
                 def raiseTimeOut(signal, frame):
                     if frame is not current_frame:
                         try:
diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
index 843e19fe8a..5d195dd50c 100644
--- a/meta/lib/oeqa/utils/dump.py
+++ b/meta/lib/oeqa/utils/dump.py
@@ -10,6 +10,7 @@ import datetime
 import itertools
 from .commands import runCmd
 
+
 class BaseDumper(object):
     """ Base class to dump commands from host/target """
 
@@ -68,6 +69,7 @@ class BaseDumper(object):
             with open(fullname, 'w') as dump_file:
                 dump_file.write(output)
 
+
 class HostDumper(BaseDumper):
     """ Class to get dumps from the host running the tests """
 
@@ -84,6 +86,7 @@ class HostDumper(BaseDumper):
             result = runCmd(cmd, ignore_status=True, env=env)
             self._write_dump(cmd.split()[0], result.output)
 
+
 class TargetDumper(BaseDumper):
     """ Class to get dumps from target, it only works with QemuRunner """
 
@@ -104,6 +107,7 @@ class TargetDumper(BaseDumper):
                         "serial console failed")
                 print("Failed CMD: %s" % (cmd))
 
+
 class MonitorDumper(BaseDumper):
     """ Class to get dumps via the Qemu Monitor, it only works with QemuRunner """
 
diff --git a/meta/lib/oeqa/utils/ftools.py b/meta/lib/oeqa/utils/ftools.py
index 3093419cc7..d5f9ce2f59 100644
--- a/meta/lib/oeqa/utils/ftools.py
+++ b/meta/lib/oeqa/utils/ftools.py
@@ -6,6 +6,7 @@ import os
 import re
 import errno
 
+
 def write_file(path, data):
     # In case data is None, return immediately
     if data is None:
@@ -14,6 +15,7 @@ def write_file(path, data):
     with open(path, "w") as f:
         f.write(wdata)
 
+
 def append_file(path, data):
     # In case data is None, return immediately
     if data is None:
@@ -22,12 +24,14 @@ def append_file(path, data):
     with open(path, "a") as f:
             f.write(wdata)
 
+
 def read_file(path):
     data = None
     with open(path) as f:
         data = f.read()
     return data
 
+
 def remove_from_file(path, data):
     # In case data is None, return immediately
     if data is None:
diff --git a/meta/lib/oeqa/utils/git.py b/meta/lib/oeqa/utils/git.py
index ea35a766eb..b3d96d1562 100644
--- a/meta/lib/oeqa/utils/git.py
+++ b/meta/lib/oeqa/utils/git.py
@@ -13,8 +13,10 @@ class GitError(Exception):
     """Git error handling"""
     pass
 
+
 class GitRepo(object):
     """Class representing a Git repository clone"""
+
     def __init__(self, path, is_topdir=False):
         git_dir = self._run_git_cmd_at(['rev-parse', '--git-dir'], path)
         git_dir = git_dir if os.path.isabs(git_dir) else os.path.join(path, git_dir)
diff --git a/meta/lib/oeqa/utils/gitarchive.py b/meta/lib/oeqa/utils/gitarchive.py
index 271f42770c..13713d9eca 100644
--- a/meta/lib/oeqa/utils/gitarchive.py
+++ b/meta/lib/oeqa/utils/gitarchive.py
@@ -14,9 +14,11 @@ from operator import attrgetter
 from collections import namedtuple
 from oeqa.utils.git import GitRepo, GitError
 
+
 class ArchiveError(Exception):
     """Internal error handling of this script"""
 
+
 def format_str(string, fields):
     """Format string using the given fields (dict)"""
     try:
@@ -127,6 +129,7 @@ def expand_tag_strings(repo, name_pattern, msg_subj_pattern, msg_body_pattern,
     msg_body = format_str(msg_body_pattern, keyws)
     return tag_name, msg_subj + '\n\n' + msg_body
 
+
 def gitarchive(data_dir, git_dir, no_create, bare, commit_msg_subject, commit_msg_body, branch_name, no_tag, tagname, tag_msg_subject, tag_msg_body, exclude, notes, push, keywords, log):
 
     if not os.path.isdir(data_dir):
@@ -166,9 +169,11 @@ def gitarchive(data_dir, git_dir, no_create, bare, commit_msg_subject, commit_ms
         log.info("Pushing data to remote")
         data_repo.run_cmd(cmd)
 
+
 # Container class for tester revisions
 TestedRev = namedtuple('TestedRev', 'commit commit_number tags')
 
+
 def get_test_runs(log, repo, tag_name, **kwargs):
     """Get a sorted list of test runs, matching given pattern"""
     # First, get field names from the tag name pattern
@@ -205,6 +210,7 @@ def get_test_runs(log, repo, tag_name, **kwargs):
     # Return field names and a sorted list of revs
     return undef_fields, sorted(revs)
 
+
 def get_test_revs(log, repo, tag_name, **kwargs):
     """Get list of all tested revisions"""
     fields, runs = get_test_runs(log, repo, tag_name, **kwargs)
@@ -228,6 +234,7 @@ def get_test_revs(log, repo, tag_name, **kwargs):
               "\n    ".join(['{} ({})'.format(rev.commit_number, rev.commit) for rev in revs]))
     return revs
 
+
 def rev_find(revs, attr, val):
     """Search from a list of TestedRev"""
     for i, rev in enumerate(revs):
diff --git a/meta/lib/oeqa/utils/httpserver.py b/meta/lib/oeqa/utils/httpserver.py
index 58d3c3b3f8..3bdccbf2ed 100644
--- a/meta/lib/oeqa/utils/httpserver.py
+++ b/meta/lib/oeqa/utils/httpserver.py
@@ -9,17 +9,20 @@ import traceback
 import signal
 from socketserver import ThreadingMixIn
 
+
 class HTTPServer(ThreadingMixIn, http.server.HTTPServer):
 
     def server_start(self, root_dir, logger):
         os.chdir(root_dir)
         self.serve_forever()
 
+
 class HTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
 
     def log_message(self, format_str, *args):
         pass
 
+
 class HTTPService(object):
 
     def __init__(self, root_dir, host='', port=0, logger=None):
@@ -49,7 +52,6 @@ class HTTPService(object):
         if self.logger:
             self.logger.info("Started HTTPService on %s:%s" % (self.host, self.port))
 
-
     def stop(self):
         if hasattr(self, "server"):
             self.server.server_close()
diff --git a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/logparser.py
index 6da2f6945a..7e78ef74c0 100644
--- a/meta/lib/oeqa/utils/logparser.py
+++ b/meta/lib/oeqa/utils/logparser.py
@@ -7,6 +7,8 @@ import os
 import re
 
 # A parser that can be used to identify weather a line is a test result or a section statement.
+
+
 class PtestParser(object):
     def __init__(self):
         self.results = {}
diff --git a/meta/lib/oeqa/utils/metadata.py b/meta/lib/oeqa/utils/metadata.py
index 8013aa684d..32f85410fe 100644
--- a/meta/lib/oeqa/utils/metadata.py
+++ b/meta/lib/oeqa/utils/metadata.py
@@ -47,6 +47,7 @@ def metadata_from_bb():
         info_dict['config'][var] = data_dict[var]
     return info_dict
 
+
 def metadata_from_data_store(d):
     """ Returns test's metadata as OrderedDict.
 
@@ -56,6 +57,7 @@ def metadata_from_data_store(d):
     # be useful when running within bitbake.
     pass
 
+
 def git_rev_info(path):
     """Get git revision information as a dict"""
     info = OrderedDict()
@@ -89,6 +91,7 @@ def git_rev_info(path):
         info['branch'] = '(nobranch)'
     return info
 
+
 def get_layers(layers):
     """Returns layer information in dict format"""
     layer_dict = OrderedDict()
@@ -97,6 +100,7 @@ def get_layers(layers):
         layer_dict[layer_name] = git_rev_info(layer)
     return layer_dict
 
+
 def write_metadata_file(file_path, metadata):
     """ Writes metadata to a XML file in directory. """
 
@@ -105,6 +109,7 @@ def write_metadata_file(file_path, metadata):
     with open(file_path, 'w') as f:
         f.write(xml_doc.toprettyxml())
 
+
 def dict_to_XML(tag, dictionary, **kwargs):
     """ Return XML element converting dicts recursively. """
 
diff --git a/meta/lib/oeqa/utils/network.py b/meta/lib/oeqa/utils/network.py
index 0436d27582..5bf2c68c18 100644
--- a/meta/lib/oeqa/utils/network.py
+++ b/meta/lib/oeqa/utils/network.py
@@ -4,6 +4,7 @@
 
 import socket
 
+
 def get_free_port(udp=False):
     s = socket.socket(socket.AF_INET, socket.SOCK_STREAM if not udp else socket.SOCK_DGRAM)
     s.bind(('', 0))
diff --git a/meta/lib/oeqa/utils/nfs.py b/meta/lib/oeqa/utils/nfs.py
index 1dd65588bb..745168985f 100644
--- a/meta/lib/oeqa/utils/nfs.py
+++ b/meta/lib/oeqa/utils/nfs.py
@@ -7,6 +7,7 @@ import socket
 from oeqa.utils.commands import bitbake, get_bb_var, Command
 from oeqa.utils.network import get_free_port
 
+
 @contextlib.contextmanager
 def unfs_server(directory, logger=None):
     unfs_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "unfs3-native")
diff --git a/meta/lib/oeqa/utils/package_manager.py b/meta/lib/oeqa/utils/package_manager.py
index e763d93c43..8d5e0682d7 100644
--- a/meta/lib/oeqa/utils/package_manager.py
+++ b/meta/lib/oeqa/utils/package_manager.py
@@ -8,6 +8,7 @@ import shutil
 
 from oeqa.core.utils.test import getCaseFile, getCaseMethod
 
+
 def get_package_manager(d, root_path):
     """
     Returns an OE package manager that can install packages in root_path.
@@ -43,6 +44,7 @@ def get_package_manager(d, root_path):
 
     return pm
 
+
 def find_packages_to_extract(test_suite):
     """
     Returns packages to extract required by runtime tests.
@@ -59,6 +61,7 @@ def find_packages_to_extract(test_suite):
 
     return needed_packages
 
+
 def _get_json_file(module_path):
     """
     Returns the path of the JSON file for a module, empty if doesn't exitst.
@@ -70,6 +73,7 @@ def _get_json_file(module_path):
     else:
         return ''
 
+
 def _get_needed_packages(json_file, test=None):
     """
     Returns a dict with needed packages based on a JSON file.
@@ -91,6 +95,7 @@ def _get_needed_packages(json_file, test=None):
 
     return needed_packages
 
+
 def extract_packages(d, needed_packages):
     """
     Extract packages that will be needed during runtime.
@@ -133,6 +138,7 @@ def extract_packages(d, needed_packages):
                 #logger.debug('Copying %s' % pkg)
                 _copy_package(d, pkg)
 
+
 def _extract_in_tmpdir(d, pkg):
     """"
     Returns path to a temp directory where the package was
@@ -148,6 +154,7 @@ def _extract_in_tmpdir(d, pkg):
 
     return extract_dir
 
+
 def _copy_package(d, pkg):
     """
     Copy the RPM, DEB or IPK package to dst_dir
@@ -163,6 +170,7 @@ def _copy_package(d, pkg):
     shutil.copy2(file_path, dst_dir)
     shutil.rmtree(pkg_path)
 
+
 def install_package(test_case):
     """
     Installs package in DUT if required.
@@ -171,6 +179,7 @@ def install_package(test_case):
     if needed_packages:
         _install_uninstall_packages(needed_packages, test_case, True)
 
+
 def uninstall_package(test_case):
     """
     Uninstalls package in DUT if required.
@@ -179,6 +188,7 @@ def uninstall_package(test_case):
     if needed_packages:
         _install_uninstall_packages(needed_packages, test_case, False)
 
+
 def test_needs_package(test_case):
     """
     Checks if a test case requires to install/uninstall packages.
@@ -194,6 +204,7 @@ def test_needs_package(test_case):
 
     return None
 
+
 def _install_uninstall_packages(needed_packages, test_case, install=True):
     """
     Install/Uninstall packages in the DUT without using a package manager
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 0e4fff2346..59caf5b1fc 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -31,6 +31,7 @@ control_chars = [chr(x) for x in control_range
                 if chr(x) not in string.printable]
 re_control_char = re.compile('[%s]' % re.escape("".join(control_chars)))
 
+
 class QemuRunner:
 
     def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, boottime, dump_dir, dump_host_cmds,
@@ -125,7 +126,6 @@ class QemuRunner:
         fcntl.fcntl(o, fcntl.F_SETFL, fl | os.O_NONBLOCK)
         return os.read(o.fileno(), 1000000).decode("utf-8")
 
-
     def handleSIGCHLD(self, signum, frame):
         if self.runqemu and self.runqemu.poll():
             if self.runqemu.returncode:
@@ -653,7 +653,6 @@ class QemuRunner:
                     status = 1
         return (status, str(data))
 
-
     def _dump_host(self):
         self.host_dumper.create_dir("qemu")
         self.logger.warning("Qemu ended unexpectedly, dump data from host"
@@ -664,6 +663,8 @@ class QemuRunner:
 # to be processed. It's completely event driven and has a straightforward
 # event loop. The mechanism for stopping the thread is a simple pipe which
 # will wake up the poll and allow for tearing everything down.
+
+
 class LoggingThread(threading.Thread):
     def __init__(self, logfunc, sock, logger):
         self.connection_established = threading.Event()
diff --git a/meta/lib/oeqa/utils/qemutinyrunner.py b/meta/lib/oeqa/utils/qemutinyrunner.py
index dc4efae9a0..e77fdd24eb 100644
--- a/meta/lib/oeqa/utils/qemutinyrunner.py
+++ b/meta/lib/oeqa/utils/qemutinyrunner.py
@@ -17,6 +17,7 @@ import select
 import bb
 from .qemurunner import QemuRunner
 
+
 class QemuTinyRunner(QemuRunner):
 
     def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, kernel, boottime, logger, tmpfsdir=None):
@@ -45,7 +46,6 @@ class QemuTinyRunner(QemuRunner):
         self.kernel = kernel
         self.logger = logger
 
-
     def create_socket(self):
         tries = 3
         while tries > 0:
@@ -87,7 +87,6 @@ class QemuTinyRunner(QemuRunner):
         if self.tmpfsdir:
             env["RUNQEMU_TMPFS_DIR"] = self.tmpfsdir
 
-
         # Set this flag so that Qemu doesn't do any grabs as SDL grabs interact
         # badly with screensavers.
         os.environ["QEMU_DONT_GRAB"] = "1"
diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index a1f71a8d38..4c5f883c56 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -97,6 +97,7 @@ class SSHProcess(object):
             raise
         return (self.status, self.output)
 
+
 class SSHControl(object):
     def __init__(self, ip, logfile=None, timeout=300, user='root', port=None):
         self.ip = ip
@@ -179,7 +180,6 @@ class SSHControl(object):
                 src_file = os.path.join(root, f)
                 self.copy_to(src_file, dst_file)
 
-
     def delete_files(self, remotepath, files):
         """
         Delete files in target's remote path.
@@ -194,7 +194,6 @@ class SSHControl(object):
 
         self.run(cmd)
 
-
     def delete_dir(self, remotepath):
         """
         Delete remotepath directory in target.
@@ -203,7 +202,6 @@ class SSHControl(object):
         cmd = "rmdir %s" % remotepath
         self.run(cmd)
 
-
     def delete_dir_structure(self, localpath, remotepath):
         """
         Delete recursively localpath structure directory in target's remotepath.
diff --git a/meta/lib/oeqa/utils/subprocesstweak.py b/meta/lib/oeqa/utils/subprocesstweak.py
index b47975a4bc..c5e20c8e5d 100644
--- a/meta/lib/oeqa/utils/subprocesstweak.py
+++ b/meta/lib/oeqa/utils/subprocesstweak.py
@@ -3,6 +3,7 @@
 #
 import subprocess
 
+
 class OETestCalledProcessError(subprocess.CalledProcessError):
     def __str__(self):
         def strify(o):
@@ -18,5 +19,6 @@ class OETestCalledProcessError(subprocess.CalledProcessError):
             s = s + "\nStandard Error: " + strify(self.stderr)
         return s
 
+
 def errors_have_output():
     subprocess.CalledProcessError = OETestCalledProcessError
diff --git a/meta/lib/oeqa/utils/targetbuild.py b/meta/lib/oeqa/utils/targetbuild.py
index 1055810ca3..0ba14ce0d3 100644
--- a/meta/lib/oeqa/utils/targetbuild.py
+++ b/meta/lib/oeqa/utils/targetbuild.py
@@ -13,6 +13,7 @@ import subprocess
 import tempfile
 from abc import ABCMeta, abstractmethod
 
+
 class BuildProject(metaclass=ABCMeta):
 
     def __init__(self, d, uri, foldername=None, tmpdir=None):
@@ -75,6 +76,7 @@ class BuildProject(metaclass=ABCMeta):
         subprocess.check_call('rm -f %s' % self.localarchive, shell=True)
         pass
 
+
 class TargetBuildProject(BuildProject):
 
     def __init__(self, target, d, uri, foldername=None):
diff --git a/meta/lib/oeqa/utils/testexport.py b/meta/lib/oeqa/utils/testexport.py
index 141ba2e25a..ae95ecd34a 100644
--- a/meta/lib/oeqa/utils/testexport.py
+++ b/meta/lib/oeqa/utils/testexport.py
@@ -21,12 +21,15 @@ except ImportError:
     class my_log():
         def __init__(self):
             pass
+
         def plain(self, msg):
             if msg:
                 print(msg)
+
         def warn(self, msg):
             if msg:
                 print("WARNING: " + msg)
+
         def fatal(self, msg):
             if msg:
                 print("FATAL:" + msg)
diff --git a/meta/lib/rootfspostcommands.py b/meta/lib/rootfspostcommands.py
index fdb9f5b850..29c611a5d5 100644
--- a/meta/lib/rootfspostcommands.py
+++ b/meta/lib/rootfspostcommands.py
@@ -4,6 +4,7 @@
 
 import os
 
+
 def sort_file(filename, mapping):
     """
     Sorts a passwd or group file based on the numeric ID in the third column.
@@ -33,6 +34,7 @@ def sort_file(filename, mapping):
         f.write(b''.join(lines))
     return new_mapping
 
+
 def remove_backup(filename):
     """
     Removes the backup file for files like /etc/passwd.
@@ -41,6 +43,7 @@ def remove_backup(filename):
     if os.path.exists(backup_filename):
         os.unlink(backup_filename)
 
+
 def sort_passwd(sysconfdir):
     """
     Sorts passwd and group files in a rootfs /etc directory by ID.
diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index e8c3d2d1ee..00ccbcd1b8 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -25,6 +25,7 @@ locations = list()
 
 class SystemdFile():
     """Class representing a single systemd configuration file"""
+
     def __init__(self, root, path):
         self.sections = dict()
         self._parse(root, path)
@@ -95,6 +96,7 @@ class SystemdFile():
 
 class Presets():
     """Class representing all systemd presets"""
+
     def __init__(self, scope, root):
         self.directives = list()
         self._collect_presets(scope, root)
diff --git a/meta/recipes-devtools/meson/meson/meson-setup.py b/meta/recipes-devtools/meson/meson/meson-setup.py
index 7ac4e3ad47..292c95be9b 100755
--- a/meta/recipes-devtools/meson/meson/meson-setup.py
+++ b/meta/recipes-devtools/meson/meson/meson-setup.py
@@ -4,9 +4,11 @@ import os
 import string
 import sys
 
+
 class Template(string.Template):
     delimiter = "@"
 
+
 class Environ():
     def __getitem__(self, name):
         val = os.environ[name]
@@ -19,6 +21,7 @@ class Environ():
             val = "'%s'" % val.pop()
         return val
 
+
 try:
     sysroot = os.environ['OECORE_NATIVE_SYSROOT']
 except KeyError:
diff --git a/meta/recipes-devtools/python/python3/create_manifest3.py b/meta/recipes-devtools/python/python3/create_manifest3.py
index 9a76e86d47..b936d8406e 100644
--- a/meta/recipes-devtools/python/python3/create_manifest3.py
+++ b/meta/recipes-devtools/python/python3/create_manifest3.py
@@ -70,6 +70,7 @@ wildcards = []
 hasfolders = []
 allfolders = []
 
+
 def isFolder(value):
     value = value.replace('${PYTHON_MAJMIN}', pyversion)
     if os.path.isdir(value.replace('${libdir}', nativelibfolder + '/usr/lib')) or os.path.isdir(value.replace('${libdir}', nativelibfolder + '/usr/lib64')) or os.path.isdir(value.replace('${libdir}', nativelibfolder + '/usr/lib32')):
@@ -77,18 +78,21 @@ def isFolder(value):
     else:
         return False
 
+
 def isCached(item):
     if '__pycache__' in item:
         return True
     else:
         return False
 
+
 def prepend_comments(comments, json_manifest):
     with open(json_manifest, 'r+') as manifest:
         json_contents = manifest.read()
         manifest.seek(0, 0)
         manifest.write(comments + json_contents)
 
+
 def print_indent(msg, offset):
     for l in msg.splitlines():
         msg = ' ' * offset + l
@@ -171,7 +175,6 @@ for filedep in old_manifest['core']['files']:
     print_indent('The following dependencies were found for module %s:\n' % pymodule, 4)
     print_indent(output, 6)
 
-
     for pymodule_dep in output.split():
         pymodule_dep = pymodule_dep.replace(pyversion, '${PYTHON_MAJMIN}')
 
@@ -201,7 +204,6 @@ for pypkg in old_manifest:
                 allfolders.append(filedep)
 
 
-
 # This is the main loop that will handle each package.
 # It works in a similar fashion than the step before, but
 # we will now be updating a new dictionary that will eventually
@@ -282,8 +284,6 @@ for pypkg in old_manifest:
             else:
                 pymodule = path
 
-
-
         # We now know that were dealing with a python module, so we can import it
         # and check what its dependencies are.
         # We launch a separate task for each module for deterministic behavior.
@@ -347,8 +347,6 @@ for pypkg in old_manifest:
             if inFolders:
                 continue
 
-
-
             # No directories beyond this point
             # We might already have this module on the dictionary since it could depend on a (previously checked) module
             if pymodule_dep not in new_manifest[pypkg]['files'] and pymodule_dep not in new_manifest[pypkg]['cached']:
@@ -370,7 +368,6 @@ for pypkg in old_manifest:
                             repeated.append(pymodule_dep)
                 else:
 
-
                     # Last step: Figure out if we this belongs to FILES or RDEPENDS
                     # We check if this module is already contained on another package, so we add that one
                     # as an RDEPENDS, or if its not, it means it should be contained on the current
diff --git a/meta/recipes-devtools/python/python3/get_module_deps3.py b/meta/recipes-devtools/python/python3/get_module_deps3.py
index 62629c6870..b9cf5068df 100644
--- a/meta/recipes-devtools/python/python3/get_module_deps3.py
+++ b/meta/recipes-devtools/python/python3/get_module_deps3.py
@@ -25,6 +25,7 @@ import importlib
 
 core_deps = set(sys.modules)
 
+
 def fix_path(dep_path):
     import os
     # We DONT want the path on our HOST system
@@ -140,7 +141,6 @@ for item in dif:
     # Prints out result, which is what will be used by create_manifest
     print(dep_path)
 
-
     cpython_tag = sys.implementation.cache_tag
     cached = ''
     # Theres no naive way to find *.pyc files on python3
diff --git a/meta/recipes-rt/rt-tests/files/rt_bmark.py b/meta/recipes-rt/rt-tests/files/rt_bmark.py
index 0b7dff1712..1980872817 100755
--- a/meta/recipes-rt/rt-tests/files/rt_bmark.py
+++ b/meta/recipes-rt/rt-tests/files/rt_bmark.py
@@ -88,6 +88,7 @@ has_hung_task_detection = True
 
 #-------------------------------------------------------------------------------
 
+
 class TestFail(Exception):
         def __init__(self, msg):
                 self.msg = msg
@@ -97,6 +98,7 @@ class TestFail(Exception):
 
 #-------------------------------------------------------------------------------
 
+
 def tc_name(sub_name):
         return "rt_bmark.intlat." + sub_name
 
@@ -104,6 +106,7 @@ def tc_name(sub_name):
 # log() does the same job as print except that a '#' is added at the beginning
 # of each line. This causes TEFEL to ignore it
 
+
 def log(*msg):
         tmp = "".join(map(str, msg)) # 'map(str, ...' allows numbers
         for line in tmp.splitlines():
@@ -112,6 +115,7 @@ def log(*msg):
 #-------------------------------------------------------------------------------
 # Like log(), but with a timestamp added
 
+
 def log_ts(*msg):
         ts = time.localtime()
         stamp = "%2d:%02d:%02d: " % (ts.tm_hour, ts.tm_min, ts.tm_sec)
@@ -119,6 +123,7 @@ def log_ts(*msg):
 
 #-------------------------------------------------------------------------------
 
+
 def log_test_header(seq_no, nr_of_tests, name):
         log("=" * 78)
         log()
@@ -129,6 +134,7 @@ def log_test_header(seq_no, nr_of_tests, name):
 
 #-------------------------------------------------------------------------------
 
+
 def start_stress(*args):
         stress_cmd = ["stress-ng"]
         added_stress_types = []
@@ -177,6 +183,7 @@ def start_stress(*args):
 
 #-------------------------------------------------------------------------------
 
+
 def end_stress(p):
         if p is None:
                 # The value None indicates that no stress scenario was started
@@ -190,6 +197,7 @@ def end_stress(p):
 
 #-------------------------------------------------------------------------------
 
+
 def us2hms_str(us):
         s = (us + 500000) // 1000000 # Round microseconds to s
         m = s // 60
@@ -204,6 +212,7 @@ def us2hms_str(us):
 # cyclictest (cyclictest starves stress). To avoid that, the supervision
 # is temporarily disabled
 
+
 def set_hung_tmo(new_tmo):
         global has_hung_task_detection
 
@@ -229,6 +238,7 @@ def set_hung_tmo(new_tmo):
 
 #-------------------------------------------------------------------------------
 
+
 def gen_minmax_list(max_list):
         res = [min(max_list)]
 
@@ -253,6 +263,7 @@ def gen_minmax_list(max_list):
 #    -t: (without argument) Set number of threads to the number
 #         of cpus
 
+
 interval_core_0 = 100     # Timer interval on core 0 [us]
 interval_delta = 20      # Interval increment for each core [us]
 loop_count = 30000   # Number of loops (on core 0).
@@ -267,6 +278,7 @@ cmd = ("cyclictest",
        )
 rex = re.compile(b"C:\s*(\d+).*Min:\s*(\d+).*Avg:\s*(\d+).*Max:\s*(\d+)")
 
+
 def run_cyclictest_once():
         res = subprocess.check_output(cmd)
 
@@ -298,12 +310,14 @@ def run_cyclictest_once():
 # A precondition for the tracking of min-max values is that
 # the suite size os a power of 2.
 
+
 N = 5
 suite_size = 2**N
 
 est_exec_time_once = interval_core_0 * loop_count
 est_exec_time_suite = suite_size * est_exec_time_once
 
+
 def run_cyclictest_suite():
         log("Starting cyclictest")
         log("  Command          : ", " ".join(cmd))
@@ -353,6 +367,7 @@ def run_cyclictest_suite():
 
 #-------------------------------------------------------------------------------
 
+
 class cyclictest_runner:
         def run_test(self, seq_no, nr_of_tests, name, stressparams):
 
@@ -397,6 +412,7 @@ class cyclictest_runner:
 
 #-------------------------------------------------------------------------------
 
+
 runner = cyclictest_runner()
 
 tests = (("no_stress", []),
diff --git a/scripts/bitbake-whatchanged b/scripts/bitbake-whatchanged
index 8c4486ee62..51d824c033 100755
--- a/scripts/bitbake-whatchanged
+++ b/scripts/bitbake-whatchanged
@@ -41,6 +41,7 @@ import bb.process
 stamp_re = re.compile("(?P<pv>.*)-(?P<pr>r\d+)\.(?P<task>do_\w+)\.(?P<hash>[^\.]*)")
 sigdata_re = re.compile(".*\.sigdata\..*")
 
+
 def gen_dict(stamps):
     """
     Generate the dict from the stamps dir.
@@ -73,6 +74,8 @@ def gen_dict(stamps):
     return d
 
 # Re-construct the dict
+
+
 def recon_dict(dict_in):
     """
     The output dict format is:
@@ -96,6 +99,7 @@ def recon_dict(dict_in):
 
     return dict_out
 
+
 def split_pntask(s):
     """
     Split the pn_task in to (pn, task) and return it
@@ -137,6 +141,7 @@ def print_added(d_new=None, d_old=None):
 
     return counter
 
+
 def print_vrchanged(d_new=None, d_old=None, vr=None):
     """
     Print the pv or pr changed tasks.
@@ -165,6 +170,7 @@ def print_vrchanged(d_new=None, d_old=None, vr=None):
 
     return counter
 
+
 def print_depchanged(d_new=None, d_old=None, verbose=False):
     """
     Print the dependency changes
@@ -316,5 +322,6 @@ Note:
             print("Removing the newly generated stamps dir ...")
             shutil.rmtree(new_stampsdir)
 
+
 if __name__ == "__main__":
     sys.exit(main())
diff --git a/scripts/buildhistory-collect-srcrevs b/scripts/buildhistory-collect-srcrevs
index 653972a969..c3bf13abbe 100755
--- a/scripts/buildhistory-collect-srcrevs
+++ b/scripts/buildhistory-collect-srcrevs
@@ -14,6 +14,7 @@ import sys
 import optparse
 import logging
 
+
 def logger_create():
     logger = logging.getLogger("buildhistory")
     loggerhandler = logging.StreamHandler()
@@ -22,8 +23,10 @@ def logger_create():
     logger.setLevel(logging.INFO)
     return logger
 
+
 logger = logger_create()
 
+
 def main():
     parser = optparse.OptionParser(
         description="Collects the recorded SRCREV values from buildhistory and reports on them.",
diff --git a/scripts/buildhistory-diff b/scripts/buildhistory-diff
index 025243ea6e..5c9dee6fad 100755
--- a/scripts/buildhistory-diff
+++ b/scripts/buildhistory-diff
@@ -20,6 +20,7 @@ except ImportError:
     print("Please install GitPython (python3-git) 0.3.4 or later in order to use this script")
     sys.exit(1)
 
+
 def get_args_parser():
     description = "Reports significant differences in the buildhistory repository."
 
@@ -68,6 +69,7 @@ def get_args_parser():
                         help=argparse.SUPPRESS)
     return parser
 
+
 def main():
 
     parser = get_args_parser()
@@ -135,5 +137,6 @@ def main():
 
     sys.exit(0)
 
+
 if __name__ == "__main__":
     main()
diff --git a/scripts/buildstats-diff b/scripts/buildstats-diff
index bef1cf9cd7..d304b8a1b7 100755
--- a/scripts/buildstats-diff
+++ b/scripts/buildstats-diff
@@ -269,6 +269,7 @@ Script for comparing buildstats of two separate builds."""
 
     return args
 
+
 def main(argv=None):
     """Script entry point"""
     args = parse_args(argv)
@@ -298,5 +299,6 @@ def main(argv=None):
         return 1
     return 0
 
+
 if __name__ == "__main__":
     sys.exit(main())
diff --git a/scripts/combo-layer b/scripts/combo-layer
index 81d9badbc0..4b44a0d7b4 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -28,6 +28,7 @@ from functools import reduce
 
 __version__ = "0.2.1"
 
+
 def logger_create():
     logger = logging.getLogger("")
     loggerhandler = logging.StreamHandler()
@@ -36,8 +37,10 @@ def logger_create():
     logger.setLevel(logging.INFO)
     return logger
 
+
 logger = logger_create()
 
+
 def get_current_branch(repodir=None):
     try:
         if not os.path.exists(os.path.join(repodir if repodir else '', ".git")):
@@ -50,6 +53,7 @@ def get_current_branch(repodir=None):
     except subprocess.CalledProcessError:
         return ""
 
+
 class Configuration(object):
     """
     Manages the configuration
@@ -57,6 +61,7 @@ class Configuration(object):
     For an example config file, see combo-layer.conf.example
 
     """
+
     def __init__(self, options):
         for key, val in options.__dict__.items():
             setattr(self, key, val)
@@ -169,6 +174,7 @@ class Configuration(object):
             logger.error("ERROR: patchutils package is missing, please install it (e.g. # apt-get install patchutils)")
             sys.exit(1)
 
+
 def runcmd(cmd, destdir=None, printerr=True, out=None, env=None):
     """
         execute command, raise CalledProcessError if fail
@@ -193,6 +199,7 @@ def runcmd(cmd, destdir=None, printerr=True, out=None, env=None):
     logger.debug("output: %s" % output.replace(chr(0), '\\0'))
     return output
 
+
 def action_init(conf, args):
     """
         Clone component repositories
@@ -253,6 +260,7 @@ def action_init(conf, args):
                 extract_dir = os.getcwd()
             file_filter = repo.get('file_filter', "")
             exclude_patterns = repo.get('file_exclude', '').split()
+
             def copy_selected_files(initialrev, extract_dir, file_filter, exclude_patterns, ldir,
                                     subdir=""):
                 # When working inside a filtered branch which had the
@@ -474,6 +482,7 @@ def check_repo_clean(repodir):
         logger.error("git repo %s is dirty, please fix it first", repodir)
         sys.exit(1)
 
+
 def check_patch(patchfile):
     f = open(patchfile, 'rb')
     ln = f.readline()
@@ -511,6 +520,7 @@ def check_patch(patchfile):
         of.close()
         bb.utils.rename(patchfile + '.tmp', patchfile)
 
+
 def drop_to_shell(workdir=None):
     if not sys.stdin.isatty():
         print("Not a TTY so can't drop to shell for resolution, exiting.")
@@ -528,6 +538,7 @@ def drop_to_shell(workdir=None):
     else:
         return True
 
+
 def check_rev_branch(component, repodir, rev, branch):
     try:
         actualbranch = runcmd("git branch --contains %s" % rev, repodir, printerr=False)
@@ -551,6 +562,7 @@ def check_rev_branch(component, repodir, rev, branch):
         return False
     return True
 
+
 def get_repos(conf, repo_names):
     repos = []
     for name in repo_names:
@@ -568,6 +580,7 @@ def get_repos(conf, repo_names):
 
     return repos
 
+
 def action_pull(conf, args):
     """
         update the component repos only
@@ -604,6 +617,7 @@ def action_pull(conf, args):
             runcmd("git checkout %s" % branch, ldir)
             runcmd("git reset --hard FETCH_HEAD", ldir)
 
+
 def action_update(conf, args):
     """
         update the component repos
@@ -653,6 +667,7 @@ def action_update(conf, args):
     else:
         update_with_patches(conf, components, revisions, repos)
 
+
 def update_with_patches(conf, components, revisions, repos):
     import uuid
     patch_dir = "patch-%s" % uuid.uuid4()
@@ -737,6 +752,7 @@ def update_with_patches(conf, components, revisions, repos):
     # Step 7: commit the updated config file if it's being tracked
     commit_conf_file(conf, components)
 
+
 def conf_commit_msg(conf, components):
     # create the "components" string
     component_str = "all components"
@@ -749,6 +765,7 @@ def conf_commit_msg(conf, components):
     msg = template.substitute(components=component_str)
     return msg
 
+
 def commit_conf_file(conf, components, commit=True):
     relpath = os.path.relpath(conf.conffile)
     try:
@@ -767,6 +784,7 @@ def commit_conf_file(conf, components, commit=True):
             return True
     return False
 
+
 def apply_patchlist(conf, repos):
     """
         apply the generated patch list to combo repo
@@ -844,6 +862,7 @@ def apply_patchlist(conf, repos):
         if lastrev != repo['last_revision']:
             conf.update(name, "last_revision", lastrev)
 
+
 def action_splitpatch(conf, args):
     """
         generate the commit patch and
@@ -883,6 +902,7 @@ def action_splitpatch(conf, args):
         else:
             logger.info(patch_filename)
 
+
 def update_with_history(conf, components, revisions, repos):
     '''Update all components with full history.
 
@@ -998,7 +1018,6 @@ def update_with_history(conf, components, revisions, repos):
                 else:
                     index += 1
 
-
         # Generate the revision list.
         logger.info("Analyzing commits from %s..." % name)
         top_revision = revision or branch
@@ -1046,6 +1065,7 @@ def update_with_history(conf, components, revisions, repos):
 
         # Now import each revision.
         logger.info("Importing commits from %s..." % name)
+
         def import_rev(rev):
             global scanned_revs
 
@@ -1198,6 +1218,8 @@ def update_with_history(conf, components, revisions, repos):
 
 
 scanned_revs = False
+
+
 def find_revs(old2new, head):
     '''Construct mapping from original commit hash to commit hash in
     combined repo by looking at the commit messages. Depends on the
@@ -1295,9 +1317,11 @@ def apply_commit(parent, rev, largs, wargs, dest_dir, file_filter=None):
                 path = os.path.join(dest_dir, path)
         runcmd("git rm -f --ignore-unmatch".split() + [os.path.join(dest_dir, x) for x in delete], **wargs)
 
+
 def action_error(conf, args):
     logger.info("invalid action %s" % args[0])
 
+
 actions = {
     "init": action_init,
     "update": action_update,
@@ -1305,6 +1329,7 @@ actions = {
     "splitpatch": action_splitpatch,
 }
 
+
 def main():
     parser = optparse.OptionParser(
         version="Combo Layer Repo Tool version %s" % __version__,
@@ -1357,6 +1382,7 @@ Action:
         confdata.sanity_check(initmode)
         actions.get(args[1], action_error)(confdata, args[1:])
 
+
 if __name__ == "__main__":
     try:
         ret = main()
diff --git a/scripts/contrib/bbvars.py b/scripts/contrib/bbvars.py
index 090133600b..bc518198dc 100755
--- a/scripts/contrib/bbvars.py
+++ b/scripts/contrib/bbvars.py
@@ -19,6 +19,7 @@ import scriptpath
 scriptpath.add_bitbake_lib_path()
 import bb.tinfoil
 
+
 def usage():
     print('Usage: %s -d FILENAME [-d FILENAME]*' % os.path.basename(sys.argv[0]))
     print('  -d FILENAME         documentation file to search')
@@ -26,6 +27,7 @@ def usage():
     print('  -t FILENAME         documentation config file (for doc tags)')
     print('  -T                  Only display variables with doc tags (requires -t)')
 
+
 def bbvar_is_documented(var, documented_vars):
     ''' Check if variable (var) is in the list of documented variables(documented_vars) '''
     if var in documented_vars:
@@ -33,6 +35,7 @@ def bbvar_is_documented(var, documented_vars):
     else:
         return False
 
+
 def collect_documented_vars(docfiles):
     ''' Walk the docfiles and collect the documented variables '''
     documented_vars = []
@@ -44,6 +47,7 @@ def collect_documented_vars(docfiles):
 
     return documented_vars
 
+
 def bbvar_doctag(var, docconf):
     prog = re.compile('^%s\[doc\] *= *"(.*)"' % (var))
     if docconf == "":
@@ -62,6 +66,7 @@ def bbvar_doctag(var, docconf):
     f.close()
     return ""
 
+
 def main():
     docfiles = []
     bbvars = set()
diff --git a/scripts/contrib/devtool-stress.py b/scripts/contrib/devtool-stress.py
index 81046ecf49..35fdf4e10a 100755
--- a/scripts/contrib/devtool-stress.py
+++ b/scripts/contrib/devtool-stress.py
@@ -27,6 +27,7 @@ import scriptutils
 import argparse_oe
 logger = scriptutils.logger_create('devtool-stress')
 
+
 def select_recipes(args):
     import bb.tinfoil
     tinfoil = bb.tinfoil.Tinfoil()
@@ -241,5 +242,6 @@ def main():
 
     ret = args.func(args)
 
+
 if __name__ == "__main__":
     main()
diff --git a/scripts/contrib/graph-tool b/scripts/contrib/graph-tool
index 26488930e0..96cb9f26d1 100755
--- a/scripts/contrib/graph-tool
+++ b/scripts/contrib/graph-tool
@@ -27,6 +27,7 @@ def get_path_networkx(dotfile, fromnode, tonode):
         sys.exit(1)
 
     graph = networkx.DiGraph(networkx.nx_pydot.read_dot(dotfile))
+
     def node_missing(node):
         import difflib
         close_matches = difflib.get_close_matches(node, graph.nodes(), cutoff=0.7)
diff --git a/scripts/contrib/image-manifest b/scripts/contrib/image-manifest
index f342e6b5dd..6868de1dc6 100755
--- a/scripts/contrib/image-manifest
+++ b/scripts/contrib/image-manifest
@@ -39,6 +39,7 @@ import bb.utils
 import oe.utils
 import oe.recipeutils
 
+
 def get_pkg_list(manifest):
     pkglist = []
     with open(manifest, 'r') as f:
@@ -52,11 +53,13 @@ def get_pkg_list(manifest):
                 pkglist.append(linesplit[0])
     return sorted(pkglist)
 
+
 def list_packages(args):
     pkglist = get_pkg_list(args.manifest)
     for pkg in pkglist:
         print('%s' % pkg)
 
+
 def pkg2recipe(tinfoil, pkg):
     if "-native" in pkg:
         logger.info('skipping %s' % pkg)
@@ -75,6 +78,7 @@ def pkg2recipe(tinfoil, pkg):
         logger.warning('%s is missing' % pkgdatafile)
         return None
 
+
 def get_recipe_list(manifest, tinfoil):
     pkglist = get_pkg_list(manifest)
     recipelist = []
@@ -86,6 +90,7 @@ def get_recipe_list(manifest, tinfoil):
 
     return sorted(recipelist)
 
+
 def list_recipes(args):
     import bb.tinfoil
     with bb.tinfoil.Tinfoil() as tinfoil:
@@ -95,6 +100,7 @@ def list_recipes(args):
         for recipe in sorted(recipelist):
             print('%s' % recipe)
 
+
 def list_layers(args):
 
     def find_git_repo(pth):
@@ -173,6 +179,7 @@ def list_layers(args):
 
     json.dump(layers, args.output, indent=2)
 
+
 def get_recipe(args):
     with bb.tinfoil.Tinfoil() as tinfoil:
         tinfoil.logger.setLevel(logger.getEffectiveLevel())
@@ -181,6 +188,7 @@ def get_recipe(args):
         recipe = pkg2recipe(tinfoil, args.package)
         print(' %s package provided by %s' % (args.package, recipe))
 
+
 def pkg_dependencies(args):
     def get_recipe_info(tinfoil, recipe):
         try:
@@ -262,6 +270,7 @@ def pkg_dependencies(args):
                 if "cross" in data.pn:
                     print(" %s(%s)" % (data.pn, p))
 
+
 def default_config():
     vlist = OrderedDict()
     vlist['PV'] = 'yes'
@@ -295,12 +304,14 @@ def default_config():
     clist['packagedir'] = 'no'
     return clist
 
+
 def dump_config(args):
     config = default_config()
     f = open('default_config.json', 'w')
     json.dump(config, f, indent=2)
     logger.info('Default config list dumped to default_config.json')
 
+
 def export_manifest_info(args):
 
     def handle_value(value):
diff --git a/scripts/contrib/list-packageconfig-flags.py b/scripts/contrib/list-packageconfig-flags.py
index fda0b35e9d..5e018b8e7d 100755
--- a/scripts/contrib/list-packageconfig-flags.py
+++ b/scripts/contrib/list-packageconfig-flags.py
@@ -30,6 +30,7 @@ import bb.cooker
 import bb.providers
 import bb.tinfoil
 
+
 def get_fnlist(bbhandler, pkg_pn, preferred):
     ''' Get all recipe file names '''
     if preferred:
@@ -44,6 +45,7 @@ def get_fnlist(bbhandler, pkg_pn, preferred):
 
     return fn_list
 
+
 def get_recipesdata(bbhandler, preferred):
     ''' Get data of all available recipes which have PACKAGECONFIG flags '''
     pkg_pn = bbhandler.cooker.recipecaches[''].pkg_pn
@@ -58,6 +60,7 @@ def get_recipesdata(bbhandler, preferred):
 
     return data_dict
 
+
 def collect_pkgs(data_dict):
     ''' Collect available pkgs in which have PACKAGECONFIG flags '''
     # pkg_dict = {'pkg1': ['flag1', 'flag2',...]}
@@ -70,6 +73,7 @@ def collect_pkgs(data_dict):
 
     return pkg_dict
 
+
 def collect_flags(pkg_dict):
     ''' Collect available PACKAGECONFIG flags and all affected pkgs '''
     # flag_dict = {'flag': ['pkg1', 'pkg2',...]}
@@ -83,6 +87,7 @@ def collect_flags(pkg_dict):
 
     return flag_dict
 
+
 def display_pkgs(pkg_dict):
     ''' Display available pkgs which have PACKAGECONFIG flags '''
     pkgname_len = len("RECIPE NAME") + 1
@@ -109,6 +114,7 @@ def display_flags(flag_dict):
     for flag in sorted(flag_dict):
         print('%-*s%s' % (flag_len, flag, '  '.join(sorted(flag_dict[flag]))))
 
+
 def display_all(data_dict):
     ''' Display all pkgs and PACKAGECONFIG information '''
     print(str("").ljust(50, '='))
@@ -126,6 +132,7 @@ def display_all(data_dict):
             print('PACKAGECONFIG[%s] %s' % (flag, flag_val))
         print('')
 
+
 def main():
     pkg_dict = {}
     flag_dict = {}
@@ -163,5 +170,6 @@ def main():
         elif options.listtype == 'all':
             display_all(data_dict)
 
+
 if __name__ == "__main__":
     main()
diff --git a/scripts/contrib/oe-build-perf-report-email.py b/scripts/contrib/oe-build-perf-report-email.py
index de3862c897..81594309bc 100755
--- a/scripts/contrib/oe-build-perf-report-email.py
+++ b/scripts/contrib/oe-build-perf-report-email.py
@@ -177,6 +177,7 @@ def scrape_html_report(report, outdir, phantomjs_extra_args=None):
     finally:
         shutil.rmtree(tmpdir)
 
+
 def send_email(text_fn, html_fn, image_fns, subject, recipients, copy=[],
                blind_copy=[]):
     """Send email"""
diff --git a/scripts/contrib/patchreview.py b/scripts/contrib/patchreview.py
index b987374d57..879814d437 100755
--- a/scripts/contrib/patchreview.py
+++ b/scripts/contrib/patchreview.py
@@ -10,6 +10,7 @@
 
 status_values = ("accepted", "pending", "inappropriate", "backport", "submitted", "denied")
 
+
 class Result:
     # Whether the patch has an Upstream-Status or not
     missing_upstream_status = False
@@ -28,6 +29,7 @@ class Result:
     # Whether a patch looks like a CVE but doesn't have a CVE tag
     missing_cve = False
 
+
 def blame_patch(patch):
     """
     From a patch filename, return a list of "commit summary (author name <author
@@ -39,6 +41,7 @@ def blame_patch(patch):
                                     "--format=%s (%aN <%aE>)",
                                     "--", patch)).decode("utf-8").splitlines()
 
+
 def patchreview(path, patches):
     import re
     import os.path
@@ -71,7 +74,6 @@ def patchreview(path, patches):
         else:
             result.missing_sob = True
 
-
         # Find the Upstream-Status tag
         match = status_re.search(content)
         if match:
@@ -188,7 +190,6 @@ Patches in Pending state: %s""" % (total_patches,
                                    percent(pending_patches)))
 
 
-
 def histogram(results):
     from toolz import recipes, dicttoolz
     import math
diff --git a/scripts/contrib/verify-homepage.py b/scripts/contrib/verify-homepage.py
index 84503b84d1..e2f8cbccc7 100755
--- a/scripts/contrib/verify-homepage.py
+++ b/scripts/contrib/verify-homepage.py
@@ -26,6 +26,7 @@ import bb.tinfoil
 
 logger = scriptutils.logger_create('verify_homepage')
 
+
 def wgetHomepage(pn, homepage):
     result = subprocess.call('wget ' + '-q -T 5 -t 1 --spider ' + homepage, shell=True)
     if result:
@@ -34,6 +35,7 @@ def wgetHomepage(pn, homepage):
     else:
         return 0
 
+
 def verifyHomepage(bbhandler):
     pkg_pn = bbhandler.cooker.recipecaches[''].pkg_pn
     pnlist = sorted(pkg_pn)
@@ -55,6 +57,7 @@ def verifyHomepage(bbhandler):
             checked.append(realfn)
     return count
 
+
 if __name__ == '__main__':
     with bb.tinfoil.Tinfoil() as bbhandler:
         bbhandler.prepare()
diff --git a/scripts/cp-noerror b/scripts/cp-noerror
index ab617c5d35..99fce16a10 100755
--- a/scripts/cp-noerror
+++ b/scripts/cp-noerror
@@ -11,6 +11,7 @@ import sys
 import os
 import shutil
 
+
 def copytree(src, dst, symlinks=False, ignore=None):
     """Based on shutil.copytree"""
     names = os.listdir(src)
@@ -46,6 +47,7 @@ def copytree(src, dst, symlinks=False, ignore=None):
     if errors:
         raise shutil.Error(errors)
 
+
 try:
     copytree(sys.argv[1], sys.argv[2])
 except shutil.Error:
diff --git a/scripts/crosstap b/scripts/crosstap
index b8c3923793..d6d366600b 100755
--- a/scripts/crosstap
+++ b/scripts/crosstap
@@ -27,6 +27,7 @@ import subprocess
 import os
 import optparse
 
+
 class Stap(object):
     def __init__(self, script, module, remote):
         self.script = script
@@ -111,10 +112,12 @@ class Stap(object):
             print("export %s=\"%s\"" % (e, additional_env[e]))
         print(" ".join(command))
 
+
 class BitbakeEnvInvocationException(Exception):
     def __init__(self, message):
         self.message = message
 
+
 class BitbakeEnv(object):
     BITBAKE = "bitbake"
 
@@ -169,6 +172,7 @@ class BitbakeEnv(object):
 
         return ret
 
+
 class ParamDiscovery(object):
     SYMBOLS_CHECK_MESSAGE = """
 WARNING: image '%s' does not have dbg-pkgs IMAGE_FEATURES enabled and no
@@ -455,4 +459,5 @@ IMAGE_INSTALL_append = " systemtap"
 
                 os.execve(cmd[0], cmd, env)
 
+
 main()
diff --git a/scripts/devtool b/scripts/devtool
index 8a4f41bc37..588d9195b1 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -69,7 +69,6 @@ class ConfigHandler(object):
         self.workspace_path = self.get('General', 'workspace_path', os.path.join(basepath, 'workspace'))
         return True
 
-
     def write(self):
         logger.debug('writing to config file %s' % self.config_file)
         self.config_obj.set('General', 'workspace_path', self.workspace_path)
@@ -81,6 +80,7 @@ class ConfigHandler(object):
             self.config_obj.add_section(section)
         self.config_obj.set(section, option, value)
 
+
 class Context:
     def __init__(self, **kwargs):
         self.__dict__.update(kwargs)
@@ -128,6 +128,7 @@ def read_workspace():
                 logger.debug('Found recipe %s' % pnvalues)
                 workspace[pn] = pnvalues
 
+
 def create_workspace(args, config, basepath, workspace):
     if args.layerpath:
         workspacedir = os.path.abspath(args.layerpath)
@@ -137,6 +138,7 @@ def create_workspace(args, config, basepath, workspace):
     if not args.create_only:
         _enable_workspace_layer(workspacedir, config, basepath)
 
+
 def _create_workspace(workspacedir, config, basepath):
     import bb
 
@@ -174,6 +176,7 @@ def _create_workspace(workspacedir, config, basepath):
             f.write('layer. If you prefer it to be elsewhere you can specify the source\n')
             f.write('tree path on the command line.\n')
 
+
 def _enable_workspace_layer(workspacedir, config, basepath):
     """Ensure the workspace layer is in bblayers.conf"""
     import bb
diff --git a/scripts/gen-lockedsig-cache b/scripts/gen-lockedsig-cache
index cd8f9a4356..c1054ebbbf 100755
--- a/scripts/gen-lockedsig-cache
+++ b/scripts/gen-lockedsig-cache
@@ -9,6 +9,7 @@ import shutil
 import errno
 import time
 
+
 def mkdir(d):
     try:
         os.makedirs(d)
@@ -17,11 +18,15 @@ def mkdir(d):
             raise e
 
 # extract the hash from past the last colon to last underscore
+
+
 def extract_sha(filename):
     return filename.split(':')[7].split('_')[0]
 
 # get all files in a directory, extract hash and make
 # a map from hash to list of file with that hash
+
+
 def map_sha_to_files(dir_, prefix, sha_map):
     sstate_prefix_path = dir_ + '/' + prefix + '/'
     if not os.path.exists(sstate_prefix_path):
@@ -37,6 +42,8 @@ def map_sha_to_files(dir_, prefix, sha_map):
             continue
 
 # given a prefix build a map of hash to list of files
+
+
 def build_sha_cache(prefix):
     sha_map = {}
 
@@ -48,6 +55,7 @@ def build_sha_cache(prefix):
 
     return sha_map
 
+
 if len(sys.argv) < 5:
     print("Incorrect number of arguments specified")
     print("syntax: gen-lockedsig-cache <locked-sigs.inc> <input-cachedir> <output-cachedir> <nativelsbstring> [filterfile]")
diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 213edb5b15..8571505d65 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -73,6 +73,7 @@ if not (sys.version_info.major == 3 and sys.version_info.minor >= 4):
 # to run on versions of python earlier than what bitbake
 # supports (e.g. less than Python 3.5 for YP 3.1 release)
 
+
 def _hasher(method, filename):
     import mmap
 
@@ -94,6 +95,7 @@ def md5_file(filename):
     import hashlib
     return _hasher(hashlib.md5(), filename)
 
+
 def sha256_file(filename):
     """
     Return the hex string representation of the 256-bit SHA checksum of
diff --git a/scripts/lib/argparse_oe.py b/scripts/lib/argparse_oe.py
index 94a4ac5011..2f72954690 100644
--- a/scripts/lib/argparse_oe.py
+++ b/scripts/lib/argparse_oe.py
@@ -6,14 +6,18 @@ import sys
 import argparse
 from collections import defaultdict, OrderedDict
 
+
 class ArgumentUsageError(Exception):
     """Exception class you can raise (and catch) in order to show the help"""
+
     def __init__(self, message, subcommand=None):
         self.message = message
         self.subcommand = subcommand
 
+
 class ArgumentParser(argparse.ArgumentParser):
     """Our own version of argparse's ArgumentParser"""
+
     def __init__(self, *args, **kwargs):
         kwargs.setdefault('formatter_class', OeHelpFormatter)
         self._subparser_groups = OrderedDict()
@@ -172,6 +176,7 @@ class OeHelpFormatter(argparse.HelpFormatter):
         else:
             return super(OeHelpFormatter, self)._format_action(action)
 
+
 def int_positive(value):
     ivalue = int(value)
     if ivalue <= 0:
diff --git a/scripts/lib/build_perf/__init__.py b/scripts/lib/build_perf/__init__.py
index dcbb78042d..0bc0d74206 100644
--- a/scripts/lib/build_perf/__init__.py
+++ b/scripts/lib/build_perf/__init__.py
@@ -5,6 +5,7 @@
 #
 """Build performance test library functions"""
 
+
 def print_table(rows, row_fmt=None):
     """Print data table"""
     if not rows:
diff --git a/scripts/lib/build_perf/report.py b/scripts/lib/build_perf/report.py
index dde4616974..fc8bba7cd7 100644
--- a/scripts/lib/build_perf/report.py
+++ b/scripts/lib/build_perf/report.py
@@ -293,6 +293,7 @@ class SizeVal(MeasurementVal):
             return "null"
         return self / 1024
 
+
 def measurement_stats(meas, prefix=''):
     """Get statistics of a measurement"""
     if not meas:
diff --git a/scripts/lib/buildstats.py b/scripts/lib/buildstats.py
index 3b251a697b..6dbcefab04 100644
--- a/scripts/lib/buildstats.py
+++ b/scripts/lib/buildstats.py
@@ -144,6 +144,7 @@ class BSTaskAggregate(object):
 
 class BSRecipe(object):
     """Class representing buildstats of one recipe"""
+
     def __init__(self, name, epoch, version, revision):
         self.name = name
         self.epoch = epoch
@@ -209,7 +210,6 @@ class BuildStats(dict):
             bs_json = json.load(fobj)
         return BuildStats.from_json(bs_json)
 
-
     @staticmethod
     def split_nevr(nevr):
         """Split name and version information from recipe "nevr" string"""
@@ -312,6 +312,7 @@ def diff_buildstats(bs1, bs2, stat_attr, min_val=None, min_absdiff=None, only_ta
 
 class BSVerDiff(object):
     """Class representing recipe version differences between two buildstats"""
+
     def __init__(self, bs1, bs2):
         RecipeVerDiff = namedtuple('RecipeVerDiff', 'left right')
 
diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index b849843154..2817b168d1 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -12,6 +12,7 @@ from enum import Enum
 
 import bb.tinfoil
 
+
 class LayerType(Enum):
     BSP = 0
     DISTRO = 1
@@ -19,6 +20,7 @@ class LayerType(Enum):
     ERROR_NO_LAYER_CONF = 98
     ERROR_BSP_DISTRO = 99
 
+
 def _get_configurations(path):
     configs = []
 
@@ -28,6 +30,7 @@ def _get_configurations(path):
             configs.append(f[:-5]) # strip .conf
     return configs
 
+
 def _get_layer_collections(layer_path, lconf=None, data=None):
     import bb.parse
     import bb.data
@@ -71,6 +74,7 @@ def _get_layer_collections(layer_path, lconf=None, data=None):
 
     return collections
 
+
 def _detect_layer(layer_path):
     """
         Scans layer directory to detect what type of layer
@@ -121,6 +125,7 @@ def _detect_layer(layer_path):
 
     return layer
 
+
 def detect_layers(layer_directories, no_auto):
     layers = []
 
@@ -146,6 +151,7 @@ def detect_layers(layer_directories, no_auto):
 
     return layers
 
+
 def _find_layer_depends(depend, layers):
     for layer in layers:
         if 'collections' not in layer:
@@ -156,6 +162,7 @@ def _find_layer_depends(depend, layers):
                 return layer
     return None
 
+
 def add_layer_dependencies(bblayersconf, layer, layers, logger):
     def recurse_dependencies(depends, layer, layers, logger, ret=[]):
         logger.debug('Processing dependencies %s for layer %s.' %
@@ -210,6 +217,7 @@ def add_layer_dependencies(bblayersconf, layer, layers, logger):
 
     return True
 
+
 def add_layers(bblayersconf, layers, logger):
     # Don't add a layer that is already present.
     added = set()
@@ -229,6 +237,7 @@ def add_layers(bblayersconf, layers, logger):
                 f.write("\nBBLAYERS += \"%s\"\n" % path)
     return True
 
+
 def check_bblayers(bblayersconf, layer_path, logger):
     '''
     If layer_path found in BBLAYERS return True
@@ -243,6 +252,7 @@ def check_bblayers(bblayersconf, layer_path, logger):
 
     return False
 
+
 def check_command(error_msg, cmd, cwd=None):
     '''
     Run a command under a shell, capture stdout and stderr in a single stream,
@@ -256,6 +266,7 @@ def check_command(error_msg, cmd, cwd=None):
         raise RuntimeError(msg)
     return output
 
+
 def get_signatures(builddir, failsafe=False, machine=None):
     import re
 
@@ -318,6 +329,7 @@ def get_signatures(builddir, failsafe=False, machine=None):
 
     return (sigs, tune2tasks)
 
+
 def get_depgraph(targets=['world'], failsafe=False):
     '''
     Returns the dependency graph for the given target(s).
@@ -353,6 +365,7 @@ def get_depgraph(targets=['world'], failsafe=False):
         raise RuntimeError('Could not retrieve the depgraph.')
     return depgraph
 
+
 def compare_signatures(old_sigs, curr_sigs):
     '''
     Compares the result of two get_signatures() calls. Returns None if no
@@ -376,6 +389,7 @@ def compare_signatures(old_sigs, curr_sigs):
     def sig2graph(task):
         pn, taskname = task.rsplit(':', 1)
         return pn + '.' + taskname
+
     def graph2sig(task):
         pn, taskname = task.rsplit('.', 1)
         return pn + ':' + taskname
diff --git a/scripts/lib/checklayer/case.py b/scripts/lib/checklayer/case.py
index fa9dee384e..aad22efd0c 100644
--- a/scripts/lib/checklayer/case.py
+++ b/scripts/lib/checklayer/case.py
@@ -5,5 +5,6 @@
 
 from oeqa.core.case import OETestCase
 
+
 class OECheckLayerTestCase(OETestCase):
     pass
diff --git a/scripts/lib/checklayer/cases/bsp.py b/scripts/lib/checklayer/cases/bsp.py
index bd80f1132a..c80200426d 100644
--- a/scripts/lib/checklayer/cases/bsp.py
+++ b/scripts/lib/checklayer/cases/bsp.py
@@ -8,6 +8,7 @@ import unittest
 from checklayer import LayerType, get_signatures, check_command, get_depgraph
 from checklayer.case import OECheckLayerTestCase
 
+
 class BSPCheckLayer(OECheckLayerTestCase):
     @classmethod
     def setUpClass(self):
@@ -27,7 +28,6 @@ class BSPCheckLayer(OECheckLayerTestCase):
                 msg="Layer %s modified machine %s -> %s" %
                     (self.tc.layer['name'], self.td['bbvars']['MACHINE'], machine))
 
-
     def test_machine_world(self):
         '''
         "bitbake world" is expected to work regardless which machine is selected.
@@ -111,6 +111,7 @@ class BSPCheckLayer(OECheckLayerTestCase):
             BLACK = 3
             color = {}
             found = set()
+
             def visit(task):
                 color[task] = GRAY
                 for dep in depends.get(task, ()):
@@ -126,6 +127,7 @@ class BSPCheckLayer(OECheckLayerTestCase):
                     visit(task)
 
         taskname_order = dict([(task, index) for index, task in enumerate(taskname_list)])
+
         def task_key(task):
             pn, taskname = task.rsplit(':', 1)
             return (pn, taskname_order.get(taskname, len(taskname_list)), taskname)
diff --git a/scripts/lib/checklayer/cases/common.py b/scripts/lib/checklayer/cases/common.py
index 3c3562c931..5562835ba2 100644
--- a/scripts/lib/checklayer/cases/common.py
+++ b/scripts/lib/checklayer/cases/common.py
@@ -9,6 +9,7 @@ import unittest
 from checklayer import get_signatures, LayerType, check_command, get_depgraph, compare_signatures
 from checklayer.case import OECheckLayerTestCase
 
+
 class CommonCheckLayer(OECheckLayerTestCase):
     def test_readme(self):
         # The top-level README file may have a suffix (like README.rst or README.txt).
diff --git a/scripts/lib/checklayer/cases/distro.py b/scripts/lib/checklayer/cases/distro.py
index 4efde4b44a..decac32ffd 100644
--- a/scripts/lib/checklayer/cases/distro.py
+++ b/scripts/lib/checklayer/cases/distro.py
@@ -8,6 +8,7 @@ import unittest
 from checklayer import LayerType
 from checklayer.case import OECheckLayerTestCase
 
+
 class DistroCheckLayer(OECheckLayerTestCase):
     @classmethod
     def setUpClass(self):
diff --git a/scripts/lib/checklayer/context.py b/scripts/lib/checklayer/context.py
index 4de8f668fd..460557f747 100644
--- a/scripts/lib/checklayer/context.py
+++ b/scripts/lib/checklayer/context.py
@@ -10,6 +10,7 @@ import re
 
 from oeqa.core.context import OETestContext
 
+
 class CheckLayerTestContext(OETestContext):
     def __init__(self, td=None, logger=None, layer=None, test_software_layer_signatures=True):
         super(CheckLayerTestContext, self).__init__(td, logger)
diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 702db669de..beb61a3705 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -17,8 +17,10 @@ import codecs
 
 logger = logging.getLogger('devtool')
 
+
 class DevtoolError(Exception):
     """Exception for handling devtool errors"""
+
     def __init__(self, message, exitcode=1):
         super(DevtoolError, self).__init__(message)
         self.exitcode = exitcode
@@ -48,6 +50,7 @@ def exec_build_env_command(init_path, builddir, cmd, watch=False, **options):
     else:
         return bb.process.run('%s%s' % (init_prefix, cmd), **options)
 
+
 def exec_watch(cmd, **options):
     """Run program with stdout shown on sys.stdout"""
     import bb
@@ -74,6 +77,7 @@ def exec_watch(cmd, **options):
 
     return buf, None
 
+
 def exec_fakeroot(d, cmd, **kwargs):
     """Run a command under fakeroot (pseudo, in fact) so that it picks up the appropriate file permissions"""
     # Grab the command and check it actually exists
@@ -90,6 +94,7 @@ def exec_fakeroot(d, cmd, **kwargs):
             newenv[splitval[0]] = splitval[1]
     return subprocess.call("%s %s" % (fakerootcmd, cmd), env=newenv, **kwargs)
 
+
 def setup_tinfoil(config_only=False, basepath=None, tracking=False):
     """Initialize tinfoil api from bitbake"""
     import scriptpath
@@ -117,6 +122,7 @@ def setup_tinfoil(config_only=False, basepath=None, tracking=False):
         os.chdir(orig_cwd)
     return tinfoil
 
+
 def parse_recipe(config, tinfoil, pn, appends, filter_workspace=True):
     """Parse the specified recipe"""
     try:
@@ -139,6 +145,7 @@ def parse_recipe(config, tinfoil, pn, appends, filter_workspace=True):
         return None
     return rd
 
+
 def check_workspace_recipe(workspace, pn, checksrc=True, bbclassextend=False):
     """
     Check that a recipe is in the workspace and (optionally) that source
@@ -169,6 +176,7 @@ def check_workspace_recipe(workspace, pn, checksrc=True, bbclassextend=False):
 
     return workspacepn
 
+
 def use_external_build(same_dir, no_same_dir, d):
     """
     Determine if we should use B!=S (separate build and source directories) or not
@@ -187,6 +195,7 @@ def use_external_build(same_dir, no_same_dir, d):
         b_is_s = False
     return b_is_s
 
+
 def setup_git_repo(repodir, version, devbranch, basetag='devtool-base', d=None):
     """
     Set up the git repository for the source tree
@@ -233,6 +242,7 @@ def setup_git_repo(repodir, version, devbranch, basetag='devtool-base', d=None):
     bb.process.run('git checkout -b %s' % devbranch, cwd=repodir)
     bb.process.run('git tag -f %s' % basetag, cwd=repodir)
 
+
 def recipe_to_append(recipefile, config, wildcard=False):
     """
     Convert a recipe file to a bbappend file path within the workspace.
@@ -247,6 +257,7 @@ def recipe_to_append(recipefile, config, wildcard=False):
     appendfile = os.path.join(appendpath, appendname + '.bbappend')
     return appendfile
 
+
 def get_bbclassextend_targets(recipefile, pn):
     """
     Cheap function to get BBCLASSEXTEND and then convert that to the
@@ -255,6 +266,7 @@ def get_bbclassextend_targets(recipefile, pn):
     import bb.utils
 
     values = {}
+
     def get_bbclassextend_varfunc(varname, origvalue, op, newlines):
         values[varname] = origvalue
         return origvalue, None, 0, True
@@ -271,6 +283,7 @@ def get_bbclassextend_targets(recipefile, pn):
                 targets.append('%s-%s' % (pn, variant))
     return targets
 
+
 def replace_from_file(path, old, new):
     """Replace strings on a file"""
 
@@ -325,6 +338,7 @@ def update_unlockedsigs(basepath, workspace, fixed_setup, extra=None):
 
     # Get current unlocked list if any
     values = {}
+
     def get_unlockedsigs_varfunc(varname, origvalue, op, newlines):
         values[varname] = origvalue
         return origvalue, None, 0, True
@@ -348,6 +362,7 @@ def update_unlockedsigs(basepath, workspace, fixed_setup, extra=None):
                 f.write('    ' + pn)
             f.write('"')
 
+
 def check_prerelease_version(ver, operation):
     if 'pre' in ver or 'rc' in ver:
         logger.warning('Version "%s" looks like a pre-release version. '
@@ -361,11 +376,13 @@ def check_prerelease_version(ver, operation):
                        'the version after %s succeeds using "devtool rename" '
                        'with -V/--version.' % (ver, operation))
 
+
 def check_git_repo_dirty(repodir):
     """Check if a git repository is clean or not"""
     stdout, _ = bb.process.run('git status --porcelain', cwd=repodir)
     return stdout
 
+
 def check_git_repo_op(srctree, ignoredirs=None):
     """Check if a git repository is in the middle of a rebase"""
     stdout, _ = bb.process.run('git rev-parse --show-toplevel', cwd=srctree)
diff --git a/scripts/lib/devtool/build.py b/scripts/lib/devtool/build.py
index 935ffab46c..cc38846222 100644
--- a/scripts/lib/devtool/build.py
+++ b/scripts/lib/devtool/build.py
@@ -37,10 +37,12 @@ def _set_file_values(fn, values):
             f.writelines(newlines)
     return updated
 
+
 def _get_build_tasks(config):
     tasks = config.get('Build', 'build_task', 'populate_sysroot,packagedata').split(',')
     return ['do_%s' % task.strip() for task in tasks]
 
+
 def build(args, config, basepath, workspace):
     """Entry point for the devtool 'build' subcommand"""
     workspacepn = check_workspace_recipe(workspace, args.recipename, bbclassextend=True)
@@ -81,6 +83,7 @@ def build(args, config, basepath, workspace):
 
     return 0
 
+
 def register_commands(subparsers, context):
     """Register devtool subcommands from this plugin"""
     parser_build = subparsers.add_parser('build', help='Build a recipe',
diff --git a/scripts/lib/devtool/build_image.py b/scripts/lib/devtool/build_image.py
index 9388abbacf..dd5d59f7a6 100644
--- a/scripts/lib/devtool/build_image.py
+++ b/scripts/lib/devtool/build_image.py
@@ -16,9 +16,11 @@ from devtool import exec_build_env_command, setup_tinfoil, parse_recipe, Devtool
 
 logger = logging.getLogger('devtool')
 
+
 class TargetNotImageError(Exception):
     pass
 
+
 def _get_packages(tinfoil, workspace, config):
     """Get list of packages from recipes in the workspace."""
     result = []
@@ -32,6 +34,7 @@ def _get_packages(tinfoil, workspace, config):
                                "package with the same name", recipe)
     return result
 
+
 def build_image(args, config, basepath, workspace):
     """Entry point for the devtool 'build-image' subcommand."""
 
@@ -62,6 +65,7 @@ def build_image(args, config, basepath, workspace):
                     % (image, outputdir))
     return result
 
+
 def build_image_task(config, basepath, workspace, image, add_packages=None, task=None, extra_append=None):
     # remove <image>.bbappend to make sure setup_tinfoil doesn't
     # break because of it
diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 31b029eaf8..ba2ecd68e4 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -22,6 +22,7 @@ logger = logging.getLogger('devtool')
 
 deploylist_path = '/.devtool'
 
+
 def _prepare_remote_script(deploy, verbose=False, dryrun=False, undeployall=False, nopreserve=False, nocheckspace=False):
     """
     Prepare a shell script for running on the target to
@@ -134,7 +135,6 @@ def _prepare_remote_script(deploy, verbose=False, dryrun=False, undeployall=Fals
     return '\n'.join(lines)
 
 
-
 def deploy(args, config, basepath, workspace):
     """Entry point for the devtool 'deploy' subcommand"""
     import math
@@ -267,6 +267,7 @@ def deploy(args, config, basepath, workspace):
 
     return 0
 
+
 def undeploy(args, config, basepath, workspace):
     """Entry point for the devtool 'undeploy' subcommand"""
     if args.all and args.recipename:
diff --git a/scripts/lib/devtool/export.py b/scripts/lib/devtool/export.py
index 8e8800c0aa..39ab29beca 100644
--- a/scripts/lib/devtool/export.py
+++ b/scripts/lib/devtool/export.py
@@ -19,6 +19,7 @@ logger = logging.getLogger('devtool')
 default_arcname_prefix = "workspace-export"
 metadata = '.export_metadata'
 
+
 def export(args, config, basepath, workspace):
     """Entry point for the devtool 'export' subcommand"""
 
@@ -46,7 +47,6 @@ def export(args, config, basepath, workspace):
         for name, arcname in arcnames:
             tar.add(name, arcname=arcname)
 
-
     # Make sure workspace is non-empty and possible listed include/excluded recipes are in workspace
     if not workspace:
         logger.info('Workspace contains no recipes, nothing to export')
@@ -94,6 +94,7 @@ def export(args, config, basepath, workspace):
     logger.info('Tar archive created at %s with the following recipes: %s' % (name, ', '.join(exported)))
     return 0
 
+
 def register_commands(subparsers, context):
     """Register devtool export subcommands"""
     parser = subparsers.add_parser('export',
diff --git a/scripts/lib/devtool/import.py b/scripts/lib/devtool/import.py
index 6829851669..a74fa4daa8 100644
--- a/scripts/lib/devtool/import.py
+++ b/scripts/lib/devtool/import.py
@@ -18,6 +18,7 @@ from devtool import export
 
 logger = logging.getLogger('devtool')
 
+
 def devimport(args, config, basepath, workspace):
     """Entry point for the devtool 'import' subcommand"""
 
@@ -123,6 +124,7 @@ def devimport(args, config, basepath, workspace):
 
     return 0
 
+
 def register_commands(subparsers, context):
     """Register devtool import subcommands"""
     parser = subparsers.add_parser('import',
diff --git a/scripts/lib/devtool/menuconfig.py b/scripts/lib/devtool/menuconfig.py
index 9275ba7c52..d32a347371 100644
--- a/scripts/lib/devtool/menuconfig.py
+++ b/scripts/lib/devtool/menuconfig.py
@@ -28,6 +28,7 @@ from devtool import setup_tinfoil, parse_recipe, DevtoolError, standard, exec_bu
 from devtool import check_workspace_recipe
 logger = logging.getLogger('devtool')
 
+
 def menuconfig(args, config, basepath, workspace):
     """Entry point for the devtool 'menuconfig' subcommand"""
 
@@ -72,6 +73,7 @@ def menuconfig(args, config, basepath, workspace):
 
     return 0
 
+
 def register_commands(subparsers, context):
     """register devtool subcommands from this plugin"""
     parser_menuconfig = subparsers.add_parser('menuconfig', help='Alter build-time configuration for a recipe', description='Launches the make menuconfig command (for recipes where do_menuconfig is available), allowing users to make changes to the build-time configuration. Creates a config fragment corresponding to changes made.', group='advanced')
diff --git a/scripts/lib/devtool/package.py b/scripts/lib/devtool/package.py
index c2367342c3..af40b2630a 100644
--- a/scripts/lib/devtool/package.py
+++ b/scripts/lib/devtool/package.py
@@ -14,6 +14,7 @@ from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recip
 
 logger = logging.getLogger('devtool')
 
+
 def package(args, config, basepath, workspace):
     """Entry point for the devtool 'package' subcommand"""
     check_workspace_recipe(workspace, args.recipename)
@@ -39,6 +40,7 @@ def package(args, config, basepath, workspace):
 
     return 0
 
+
 def register_commands(subparsers, context):
     """Register devtool subcommands from the package plugin"""
     if context.fixed_setup:
diff --git a/scripts/lib/devtool/runqemu.py b/scripts/lib/devtool/runqemu.py
index ead978aabc..91956beee7 100644
--- a/scripts/lib/devtool/runqemu.py
+++ b/scripts/lib/devtool/runqemu.py
@@ -16,6 +16,7 @@ from devtool import exec_build_env_command, setup_tinfoil, DevtoolError
 
 logger = logging.getLogger('devtool')
 
+
 def runqemu(args, config, basepath, workspace):
     """Entry point for the devtool 'runqemu' subcommand"""
 
@@ -52,6 +53,7 @@ def runqemu(args, config, basepath, workspace):
 
     return 0
 
+
 def register_commands(subparsers, context):
     """Register devtool subcommands from this plugin"""
     if context.fixed_setup:
diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index 5e22f91507..bbe9560a04 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -18,6 +18,7 @@ from devtool import exec_build_env_command, setup_tinfoil, parse_recipe, Devtool
 
 logger = logging.getLogger('devtool')
 
+
 def parse_locked_sigs(sigfile_path):
     """Return <pn:task>:<hash> dictionary"""
     sig_dict = {}
@@ -29,6 +30,7 @@ def parse_locked_sigs(sigfile_path):
                 sig_dict[taskkey.strip()] = hashval.split()[0]
     return sig_dict
 
+
 def generate_update_dict(sigfile_new, sigfile_old):
     """Return a dict containing <pn:task>:<hash> which indicates what need to be updated"""
     update_dict = {}
@@ -43,6 +45,7 @@ def generate_update_dict(sigfile_new, sigfile_old):
             continue
     return update_dict
 
+
 def get_sstate_objects(update_dict, sstate_dir):
     """Return a list containing sstate objects which are to be installed"""
     sstate_objects = []
@@ -61,6 +64,7 @@ def get_sstate_objects(update_dict, sstate_dir):
 
     return sstate_objects
 
+
 def mkdir(d):
     try:
         os.makedirs(d)
@@ -68,6 +72,7 @@ def mkdir(d):
         if e.errno != errno.EEXIST:
             raise e
 
+
 def install_sstate_objects(sstate_objects, src_sdk, dest_sdk):
     """Install sstate objects into destination SDK"""
     sstate_dir = os.path.join(dest_sdk, 'sstate-cache')
@@ -81,6 +86,7 @@ def install_sstate_objects(sstate_objects, src_sdk, dest_sdk):
         logger.debug("Copying %s to %s" % (sb, dst))
         shutil.copy(sb, dst)
 
+
 def check_manifest(fn, basepath):
     import bb.utils
     changedfiles = []
@@ -96,6 +102,7 @@ def check_manifest(fn, basepath):
                     changedfiles.append(fpath)
     return changedfiles
 
+
 def sdk_update(args, config, basepath, workspace):
     """Entry point for devtool sdk-update command"""
     updateserver = args.updateserver
@@ -238,6 +245,7 @@ def sdk_update(args, config, basepath, workspace):
             return -1
     return 0
 
+
 def sdk_install(args, config, basepath, workspace):
     """Entry point for the devtool sdk-install command"""
 
@@ -250,6 +258,7 @@ def sdk_install(args, config, basepath, workspace):
 
     tasks = ['do_populate_sysroot', 'do_packagedata']
     stampprefixes = {}
+
     def checkstamp(recipe):
         stampprefix = stampprefixes[recipe]
         stamps = glob.glob(stampprefix + '*')
diff --git a/scripts/lib/devtool/search.py b/scripts/lib/devtool/search.py
index d24040df37..c66e7e41d4 100644
--- a/scripts/lib/devtool/search.py
+++ b/scripts/lib/devtool/search.py
@@ -16,6 +16,7 @@ from devtool import setup_tinfoil, parse_recipe, DevtoolError
 
 logger = logging.getLogger('devtool')
 
+
 def search(args, config, basepath, workspace):
     """Entry point for the devtool 'search' subcommand"""
 
@@ -35,7 +36,6 @@ def search(args, config, basepath, workspace):
                 summary = ''
             print("%s  %s" % (pn.ljust(20), summary))
 
-
         matches = []
         if os.path.exists(pkgdata_dir):
             for fn in os.listdir(pkgdata_dir):
@@ -99,6 +99,7 @@ def search(args, config, basepath, workspace):
 
     return 0
 
+
 def register_commands(subparsers, context):
     """Register devtool subcommands from this plugin"""
     parser_search = subparsers.add_parser('search', help='Search available recipes',
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 27f50b7ab1..0f6d60a860 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -329,6 +329,7 @@ def _check_compatible_recipe(pn, d):
                            "from working. You will need to disable this "
                            "first." % pn)
 
+
 def _dry_run_copy(src, dst, dry_run_outdir, base_outdir):
     """Common function for copying a file to the dry run output directory"""
     relpath = os.path.relpath(dst, base_outdir)
@@ -344,6 +345,7 @@ def _dry_run_copy(src, dst, dry_run_outdir, base_outdir):
     if not os.path.exists(dst):
         shutil.copy(src, dst)
 
+
 def _move_file(src, dst, dry_run_outdir=None, base_outdir=None):
     """Move a file. Creates all the directory components of destination path."""
     dry_run_suffix = ' (dry-run)' if dry_run_outdir else ''
@@ -357,6 +359,7 @@ def _move_file(src, dst, dry_run_outdir=None, base_outdir=None):
             bb.utils.mkdirhier(dst_d)
         shutil.move(src, dst)
 
+
 def _copy_file(src, dst, dry_run_outdir=None):
     """Copy a file. Creates all the directory components of destination path."""
     dry_run_suffix = ' (dry-run)' if dry_run_outdir else ''
@@ -369,6 +372,7 @@ def _copy_file(src, dst, dry_run_outdir=None):
             bb.utils.mkdirhier(dst_d)
         shutil.copy(src, dst)
 
+
 def _git_ls_tree(repodir, treeish='HEAD', recursive=False):
     """List contents of a git treeish"""
     import bb
@@ -384,6 +388,7 @@ def _git_ls_tree(repodir, treeish='HEAD', recursive=False):
                 ret[split[3]] = split[0:3]
     return ret
 
+
 def _git_exclude_path(srctree, path):
     """Return pathspec (list of paths) that excludes certain path"""
     # NOTE: "Filtering out" files/paths in this way is not entirely reliable -
@@ -400,6 +405,7 @@ def _git_exclude_path(srctree, path):
     else:
         return ['.']
 
+
 def _ls_tree(directory):
     """Recursive listing of files in a directory"""
     ret = []
@@ -433,6 +439,7 @@ def extract(args, config, basepath, workspace):
     finally:
         tinfoil.shutdown()
 
+
 def sync(args, config, basepath, workspace):
     """Entry point for the devtool 'sync' subcommand"""
     import bb
@@ -457,6 +464,7 @@ def sync(args, config, basepath, workspace):
     finally:
         tinfoil.shutdown()
 
+
 def symlink_oelocal_files_srctree(rd, srctree):
     import oe.patch
     if os.path.abspath(rd.getVar('S')) == os.path.abspath(rd.getVar('WORKDIR')):
@@ -697,6 +705,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
             shutil.rmtree(tempdir)
     return initial_rev, srcsubdir_rel
 
+
 def _add_md5(config, recipename, filename):
     """Record checksum of a file (or recursively for a directory) to the md5-file of the workspace"""
     import bb.utils
@@ -716,6 +725,7 @@ def _add_md5(config, recipename, filename):
     else:
         addfile(filename)
 
+
 def _check_preserve(config, recipename):
     """Check if a file was manually changed and needs to be saved in 'attic'
        directory"""
@@ -748,6 +758,7 @@ def _check_preserve(config, recipename):
                     tf.write(line)
     bb.utils.rename(newfile, origfile)
 
+
 def get_staging_kver(srcdir):
     # Kernel version from work-shared
     kerver = []
@@ -760,6 +771,7 @@ def get_staging_kver(srcdir):
             staging_kerVer = ".".join(kerver)
     return staging_kerVer
 
+
 def get_staging_kbranch(srcdir):
     staging_kbranch = ""
     if os.path.exists(srcdir) and os.listdir(srcdir):
@@ -767,6 +779,7 @@ def get_staging_kbranch(srcdir):
         staging_kbranch = "".join(branch.split('\n')[0])
     return staging_kbranch
 
+
 def modify(args, config, basepath, workspace):
     """Entry point for the devtool 'modify' subcommand"""
     import bb
@@ -1236,6 +1249,7 @@ def _get_patchset_revs(srctree, recipe_path, initial_rev=None, force_patch_refre
 
     return initial_rev, update_rev, changed_revs, patches
 
+
 def _remove_file_entries(srcuri, filelist):
     """Remove file:// entries from SRC_URI"""
     remaining = filelist[:]
@@ -1251,6 +1265,7 @@ def _remove_file_entries(srcuri, filelist):
                 break
     return entries, remaining
 
+
 def _replace_srcuri_entry(srcuri, filename, newentry):
     """Replace entry corresponding to specified file with a new entry"""
     basename = os.path.basename(filename)
@@ -1260,6 +1275,7 @@ def _replace_srcuri_entry(srcuri, filename, newentry):
             srcuri.insert(i, newentry)
             break
 
+
 def _remove_source_files(append, files, destpath, no_report_remove=False, dry_run=False):
     """Unlink existing patch files"""
 
@@ -1597,6 +1613,7 @@ def _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wi
     _remove_source_files(appendlayerdir, remove_files, destpath, no_report_remove, dry_run=dry_run_outdir)
     return True, appendfile, remove_files
 
+
 def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wildcard_version, no_remove, no_report_remove, initial_rev, dry_run_outdir=None, force_patch_refresh=False):
     """Implement the 'patch' mode of update-recipe"""
     import bb
@@ -1739,6 +1756,7 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
     _remove_source_files(appendlayerdir, remove_files, destpath, no_report_remove, dry_run=dry_run_outdir)
     return True, appendfile, remove_files
 
+
 def _guess_recipe_update_mode(srctree, rdata):
     """Guess the recipe update mode to use"""
     src_uri = (rdata.getVar('SRC_URI') or '').split()
@@ -1761,6 +1779,7 @@ def _guess_recipe_update_mode(srctree, rdata):
 
     return 'patch'
 
+
 def _update_recipe(recipename, workspace, rd, mode, appendlayerdir, wildcard_version, no_remove, initial_rev, no_report_remove=False, dry_run_outdir=None, no_overrides=False, force_patch_refresh=False):
     srctree = workspace[recipename]['srctree']
     if mode == 'auto':
@@ -1829,6 +1848,7 @@ def _update_recipe(recipename, workspace, rd, mode, appendlayerdir, wildcard_ver
 
     return anyupdated, appendfile, allremoved
 
+
 def update_recipe(args, config, basepath, workspace):
     """Entry point for the devtool 'update-recipe' subcommand"""
     check_workspace_recipe(workspace, args.recipename)
@@ -1937,6 +1957,7 @@ def _reset(recipes, no_clean, remove_work, config, basepath, workspace):
             os.remove(appendfile)
 
         preservepath = os.path.join(config.workspace_path, 'attic', pn, pn)
+
         def preservedir(origdir):
             if os.path.exists(origdir):
                 for root, dirs, files in os.walk(origdir):
@@ -1973,6 +1994,7 @@ def _reset(recipes, no_clean, remove_work, config, basepath, workspace):
 
         clean_preferred_provider(pn, config.workspace_path)
 
+
 def reset(args, config, basepath, workspace):
     """Entry point for the devtool 'reset' subcommand"""
     import bb
@@ -2211,6 +2233,7 @@ def get_default_srctree(config, recipename=''):
     else:
         return os.path.join(srctreeparent, 'sources')
 
+
 def register_commands(subparsers, context):
     """Register devtool subcommands from this plugin"""
 
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 0605a01f87..d5ed52be33 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -26,10 +26,12 @@ from devtool import exec_build_env_command, setup_tinfoil, DevtoolError, parse_r
 
 logger = logging.getLogger('devtool')
 
+
 def _run(cmd, cwd=''):
     logger.debug("Running command %s> %s" % (cwd, cmd))
     return bb.process.run('%s' % cmd, cwd=cwd)
 
+
 def _get_srctree(tmpdir):
     srctree = tmpdir
     dirs = scriptutils.filter_src_subdirs(tmpdir)
@@ -37,6 +39,7 @@ def _get_srctree(tmpdir):
         srctree = os.path.join(tmpdir, dirs[0])
     return srctree
 
+
 def _copy_source_code(orig, dest):
     for path in standard._ls_tree(orig):
         dest_dir = os.path.join(dest, os.path.dirname(path))
@@ -44,11 +47,13 @@ def _copy_source_code(orig, dest):
         dest_path = os.path.join(dest, path)
         shutil.move(os.path.join(orig, path), dest_path)
 
+
 def _remove_patch_dirs(recipefolder):
     for root, dirs, files in os.walk(recipefolder):
         for d in dirs:
             shutil.rmtree(os.path.join(root, d))
 
+
 def _recipe_contains(rd, var):
     rf = rd.getVar('FILE')
     varfiles = oe.recipeutils.get_var_files(rf, [var], rd)
@@ -57,6 +62,7 @@ def _recipe_contains(rd, var):
             return True
     return False
 
+
 def _rename_recipe_dirs(oldpv, newpv, path):
     for root, dirs, files in os.walk(path):
         # Rename directories with the version in their name
@@ -74,6 +80,7 @@ def _rename_recipe_dirs(oldpv, newpv, path):
                         bb.utils.rename(os.path.join(path, oldfile),
                               os.path.join(path, newfile))
 
+
 def _rename_recipe_file(oldrecipe, bpn, oldpv, newpv, path):
     oldrecipe = os.path.basename(oldrecipe)
     if oldrecipe.endswith('_%s.bb' % oldpv):
@@ -84,10 +91,12 @@ def _rename_recipe_file(oldrecipe, bpn, oldpv, newpv, path):
         newrecipe = oldrecipe
     return os.path.join(path, newrecipe)
 
+
 def _rename_recipe_files(oldrecipe, bpn, oldpv, newpv, path):
     _rename_recipe_dirs(oldpv, newpv, path)
     return _rename_recipe_file(oldrecipe, bpn, oldpv, newpv, path)
 
+
 def _write_append(rc, srctree, same_dir, no_same_dir, rev, copied, workspace, d):
     """Writes an append file"""
     if not os.path.exists(rc):
@@ -119,6 +128,7 @@ def _write_append(rc, srctree, same_dir, no_same_dir, rev, copied, workspace, d)
             f.write('# original_files: %s\n' % ' '.join(copied))
     return af
 
+
 def _cleanup_on_error(rf, srctree):
     rfp = os.path.split(rf)[0] # recipe folder
     rfpp = os.path.split(rfp)[0] # recipes folder
@@ -130,6 +140,7 @@ def _cleanup_on_error(rf, srctree):
     if os.path.exists(srctree):
         shutil.rmtree(srctree)
 
+
 def _upgrade_error(e, rf, srctree, keep_failure=False, extramsg=None):
     if rf and not keep_failure:
         _cleanup_on_error(rf, srctree)
@@ -140,6 +151,7 @@ def _upgrade_error(e, rf, srctree, keep_failure=False, extramsg=None):
         logger.info('Preserving failed upgrade files (--keep-failure)')
     sys.exit(1)
 
+
 def _get_uri(rd):
     srcuris = rd.getVar('SRC_URI').split()
     if not len(srcuris):
@@ -163,6 +175,7 @@ def _get_uri(rd):
             srcuri = rev_re.sub('', srcuri)
     return srcuri, srcrev
 
+
 def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, keep_temp, tinfoil, rd):
     """Extract sources of a recipe with a new version"""
 
@@ -286,6 +299,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
 
     return (rev, md5, sha256, srcbranch, srcsubdir_rel)
 
+
 def _add_license_diff_to_recipe(path, diff):
     notice_text = """# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
 # The following is the difference between the old and the new license text.
@@ -305,6 +319,7 @@ def _add_license_diff_to_recipe(path, diff):
         f.write("\n#\n\n".encode())
         f.write(orig_content)
 
+
 def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, srcsubdir_old, srcsubdir_new, workspace, tinfoil, rd, license_diff, new_licenses, srctree, keep_failure):
     """Creates the new recipe under workspace"""
 
@@ -452,6 +467,7 @@ def _check_git_config():
     if configerr:
         raise DevtoolError('Your git configuration is incomplete which will prevent rebases from working:\n' + '\n'.join(configerr))
 
+
 def _extract_licenses(srcpath, recipe_licenses):
     licenses = []
     for url in recipe_licenses.split():
@@ -478,6 +494,7 @@ def _extract_licenses(srcpath, recipe_licenses):
         licenses.append(license)
     return licenses
 
+
 def _generate_license_diff(old_licenses, new_licenses):
     need_diff = False
     for l in new_licenses:
@@ -494,6 +511,7 @@ def _generate_license_diff(old_licenses, new_licenses):
             diff = diff + line
     return diff
 
+
 def upgrade(args, config, basepath, workspace):
     """Entry point for the devtool 'upgrade' subcommand"""
 
@@ -578,6 +596,7 @@ def upgrade(args, config, basepath, workspace):
         tinfoil.shutdown()
     return 0
 
+
 def latest_version(args, config, basepath, workspace):
     """Entry point for the devtool 'latest_version' subcommand"""
     tinfoil = setup_tinfoil(basepath=basepath, tracking=True)
@@ -598,6 +617,7 @@ def latest_version(args, config, basepath, workspace):
         tinfoil.shutdown()
     return 0
 
+
 def check_upgrade_status(args, config, basepath, workspace):
     if not args.recipe:
         logger.info("Checking the upstream status for all recipes may take a few minutes")
@@ -612,6 +632,7 @@ def check_upgrade_status(args, config, basepath, workspace):
                                                                result[5] if result[5] != 'N/A' else "",
                                                                "cannot be updated due to: %s" % (result[6]) if result[6] else ""))
 
+
 def register_commands(subparsers, context):
     """Register devtool subcommands from this plugin"""
 
diff --git a/scripts/lib/devtool/utilcmds.py b/scripts/lib/devtool/utilcmds.py
index 964817766b..dbe69b03b2 100644
--- a/scripts/lib/devtool/utilcmds.py
+++ b/scripts/lib/devtool/utilcmds.py
@@ -20,6 +20,7 @@ from devtool import parse_recipe
 
 logger = logging.getLogger('devtool')
 
+
 def _find_recipe_path(args, config, basepath, workspace):
     if args.any_recipe:
         logger.warning('-a/--any-recipe option is now always active, and thus the option will be removed in a future release')
diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index ce91c3713c..8955664706 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -23,6 +23,7 @@ logger = logging.getLogger('recipetool')
 
 tinfoil = None
 
+
 def tinfoil_init(instance):
     global tinfoil
     tinfoil = instance
@@ -34,6 +35,7 @@ def tinfoil_init(instance):
 class InvalidTargetFileError(Exception):
     pass
 
+
 def find_target_file(targetpath, d, pkglist=None):
     """Find the recipe installing the specified target path, optionally limited to a select list of packages"""
     import json
@@ -87,6 +89,7 @@ def find_target_file(targetpath, d, pkglist=None):
                             recipes[targetpath].append('!%s' % pn)
     return recipes
 
+
 def _parse_recipe(pn, tinfoil):
     try:
         rd = tinfoil.parse_recipe(pn)
@@ -95,6 +98,7 @@ def _parse_recipe(pn, tinfoil):
         return None
     return rd
 
+
 def determine_file_source(targetpath, rd):
     """Assuming we know a file came from a specific recipe, figure out exactly where it came from"""
     import oe.recipeutils
@@ -144,6 +148,7 @@ def determine_file_source(targetpath, rd):
 
     return (srcfile, elements, modpatches)
 
+
 def get_source_path(cmdelements):
     """Find the source path specified within a command"""
     command = cmdelements[0]
@@ -178,6 +183,7 @@ def get_source_path(cmdelements):
     else:
         raise Exception('get_source_path: no handling for command "%s"')
 
+
 def get_func_deps(func, d):
     """Find the function dependencies of a shell function"""
     deps = bb.codeparser.ShellParser(func, logger).parse_shell(d.getVar(func))
@@ -188,6 +194,7 @@ def get_func_deps(func, d):
             funcdeps.append(dep)
     return funcdeps
 
+
 def check_do_install(rd, targetpath):
     """Look at do_install for a command that installs/copies the specified target path"""
     instpath = os.path.abspath(os.path.join(rd.getVar('D'), targetpath.lstrip('/')))
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 9d531948e5..cd8ac24af4 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -22,27 +22,32 @@ logger = logging.getLogger('recipetool')
 tinfoil = None
 plugins = None
 
+
 def log_error_cond(message, debugonly):
     if debugonly:
         logger.debug(message)
     else:
         logger.error(message)
 
+
 def log_info_cond(message, debugonly):
     if debugonly:
         logger.debug(message)
     else:
         logger.info(message)
 
+
 def plugin_init(pluginlist):
     # Take a reference to the list so we can use it later
     global plugins
     plugins = pluginlist
 
+
 def tinfoil_init(instance):
     global tinfoil
     tinfoil = instance
 
+
 class RecipeHandler(object):
     recipelibmap = {}
     recipeheadermap = {}
@@ -264,6 +269,7 @@ def validate_pv(pv):
         return False
     return True
 
+
 def determine_from_filename(srcfile):
     """Determine name and version from a filename"""
     if is_package(srcfile):
@@ -311,6 +317,7 @@ def determine_from_filename(srcfile):
     logger.debug('determine_from_filename: name = "%s" version = "%s"' % (pn, pv))
     return (pn, pv)
 
+
 def determine_from_url(srcuri):
     """Determine name and version from a URL"""
     pn = None
@@ -345,6 +352,7 @@ def determine_from_url(srcuri):
     logger.debug('Determined from source URL: name = "%s", version = "%s"' % (pn, pv))
     return (pn, pv)
 
+
 def supports_srcrev(uri):
     localdata = bb.data.createCopy(tinfoil.config_data)
     # This is a bit sad, but if you don't have this set there can be some
@@ -363,6 +371,7 @@ def supports_srcrev(uri):
             return True
     return False
 
+
 def reformat_git_uri(uri):
     '''Convert any http[s]://....git URI into git://...;protocol=http[s]'''
     checkuri = uri.split(';', 1)[0]
@@ -395,6 +404,7 @@ def reformat_git_uri(uri):
     else:
         return uri
 
+
 def is_package(url):
     '''Check if a URL points to a package'''
     checkurl = url.split(';', 1)[0]
@@ -402,6 +412,7 @@ def is_package(url):
         return True
     return False
 
+
 def create_recipe(args):
     import bb.process
     import tempfile
@@ -904,6 +915,7 @@ def create_recipe(args):
 
     return 0
 
+
 def check_single_file(fn, fetchuri):
     """Determine if a single downloaded file is something we can't handle"""
     with open(fn, 'r', errors='surrogateescape') as f:
@@ -911,12 +923,14 @@ def check_single_file(fn, fetchuri):
             logger.error('Fetching "%s" returned a single HTML page - check the URL is correct and functional' % fetchuri)
             sys.exit(1)
 
+
 def split_value(value):
     if isinstance(value, str):
         return value.split()
     else:
         return value
 
+
 def handle_license_vars(srctree, lines_before, handled, extravalues, d):
     lichandled = [x for x in handled if x[0] == 'license']
     if lichandled:
@@ -1002,6 +1016,7 @@ def handle_license_vars(srctree, lines_before, handled, extravalues, d):
     handled.append(('license', licvalues))
     return licvalues
 
+
 def get_license_md5sums(d, static_only=False):
     import bb.utils
     md5sums = {}
@@ -1053,6 +1068,7 @@ def get_license_md5sums(d, static_only=False):
     md5sums['bfe1f75d606912a4111c90743d6c7325'] = 'MPL-1.1'
     return md5sums
 
+
 def crunch_license(licfile):
     '''
     Remove non-material text from a license file and then check
@@ -1127,6 +1143,7 @@ def crunch_license(licfile):
     license = crunched_md5sums.get(md5val, None)
     return license, md5val, lictext
 
+
 def guess_license(srctree, d):
     import bb
     md5sums = get_license_md5sums(d)
@@ -1154,6 +1171,7 @@ def guess_license(srctree, d):
 
     return licenses
 
+
 def split_pkg_licenses(licvalues, packages, outlines, fallback_licenses=None, pn='${PN}'):
     """
     Given a list of (license, path, md5sum) as returned by guess_license(),
@@ -1181,6 +1199,7 @@ def split_pkg_licenses(licvalues, packages, outlines, fallback_licenses=None, pn
         outlicenses[pkgname] = license.split()
     return outlicenses
 
+
 def read_pkgconfig_provides(d):
     pkgdatadir = d.getVar('PKGDATA_DIR')
     pkgmap = {}
@@ -1198,6 +1217,7 @@ def read_pkgconfig_provides(d):
                         recipemap[pc] = line.split(':', 1)[1].strip()
     return recipemap
 
+
 def convert_debian(debpath):
     value_map = {'Package': 'PN',
                  'Version': 'PV',
@@ -1268,6 +1288,7 @@ def convert_debian(debpath):
 
     return values
 
+
 def convert_rpm_xml(xmlfile):
     '''Converts the output from rpm -qp --xml to a set of variable values'''
     import xml.etree.ElementTree as ElementTree
diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index 44b398d792..3a040b74be 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -15,11 +15,13 @@ logger = logging.getLogger('recipetool')
 tinfoil = None
 plugins = None
 
+
 def plugin_init(pluginlist):
     # Take a reference to the list so we can use it later
     global plugins
     plugins = pluginlist
 
+
 def tinfoil_init(instance):
     global tinfoil
     tinfoil = instance
@@ -279,6 +281,7 @@ class CmakeRecipeHandler(RecipeHandler):
 
 class CmakeExtensionHandler(object):
     '''Base class for CMake extension handlers'''
+
     def process_line(self, srctree, fn, line, libdeps, pcdeps, deps, outlines, inherits, values):
         '''
         Handle a line parsed out of an CMake file.
@@ -300,7 +303,6 @@ class CmakeExtensionHandler(object):
         return
 
 
-
 class SconsRecipeHandler(RecipeHandler):
     def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
         if 'buildsystem' in handled:
@@ -435,6 +437,7 @@ class AutotoolsRecipeHandler(RecipeHandler):
         version_re = re.compile('([0-9.]+)')
 
         defines = {}
+
         def subst_defines(value):
             newvalue = value
             for define, defval in defines.items():
@@ -703,6 +706,7 @@ class AutotoolsRecipeHandler(RecipeHandler):
 
 class AutotoolsExtensionHandler(object):
     '''Base class for Autotools extension handlers'''
+
     def process_macro(self, srctree, keyword, value, process_value, libdeps, pcdeps, deps, outlines, inherits, values):
         '''
         Handle a macro parsed out of an autotools file. Note that if you want this to be called
@@ -862,6 +866,7 @@ class SpecFileRecipeHandler(RecipeHandler):
                 lines_before.append(liccomment)
         extravalues.update(foundvalues)
 
+
 def register_recipe_handlers(handlers):
     # Set priorities with some gaps so that other plugins can insert
     # their own handlers (so avoid changing these numbers)
diff --git a/scripts/lib/recipetool/create_kernel.py b/scripts/lib/recipetool/create_kernel.py
index 5740589a68..a1fa5e6247 100644
--- a/scripts/lib/recipetool/create_kernel.py
+++ b/scripts/lib/recipetool/create_kernel.py
@@ -13,6 +13,7 @@ logger = logging.getLogger('recipetool')
 
 tinfoil = None
 
+
 def tinfoil_init(instance):
     global tinfoil
     tinfoil = instance
@@ -32,6 +33,7 @@ class KernelRecipeHandler(RecipeHandler):
         del lines_after[:]
         del classes[:]
         template = os.path.join(tinfoil.config_data.getVar('COREBASE'), 'meta-skeleton', 'recipes-kernel', 'linux', 'linux-yocto-custom.bb')
+
         def handle_var(varname, origvalue, op, newlines):
             if varname in ['SRCREV', 'SRCREV_machine']:
                 while newlines[-1].startswith('#'):
@@ -85,5 +87,6 @@ class KernelRecipeHandler(RecipeHandler):
 
         return True
 
+
 def register_recipe_handlers(handlers):
     handlers.append((KernelRecipeHandler(), 100))
diff --git a/scripts/lib/recipetool/create_kmod.py b/scripts/lib/recipetool/create_kmod.py
index 85b5c48e53..3e8217561e 100644
--- a/scripts/lib/recipetool/create_kmod.py
+++ b/scripts/lib/recipetool/create_kmod.py
@@ -13,6 +13,7 @@ logger = logging.getLogger('recipetool')
 
 tinfoil = None
 
+
 def tinfoil_init(instance):
     global tinfoil
     tinfoil = instance
@@ -138,5 +139,6 @@ class KernelModuleRecipeHandler(RecipeHandler):
 
         return False
 
+
 def register_recipe_handlers(handlers):
     handlers.append((KernelModuleRecipeHandler(), 15))
diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index 4f24d621a7..448081735f 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -19,11 +19,13 @@ from recipetool.create import split_pkg_licenses
 
 TINFOIL = None
 
+
 def tinfoil_init(instance):
     """Initialize tinfoil"""
     global TINFOIL
     TINFOIL = instance
 
+
 class NpmRecipeHandler(RecipeHandler):
     """Class to handle the npm recipe creation"""
 
@@ -254,6 +256,7 @@ class NpmRecipeHandler(RecipeHandler):
 
         return True
 
+
 def register_recipe_handlers(handlers):
     """Register the npm handler"""
     handlers.append((NpmRecipeHandler(), 60))
diff --git a/scripts/lib/recipetool/setvar.py b/scripts/lib/recipetool/setvar.py
index f8e2ee75fb..b789254793 100644
--- a/scripts/lib/recipetool/setvar.py
+++ b/scripts/lib/recipetool/setvar.py
@@ -19,10 +19,12 @@ logger = logging.getLogger('recipetool')
 tinfoil = None
 plugins = None
 
+
 def tinfoil_init(instance):
     global tinfoil
     tinfoil = instance
 
+
 def setvar(args):
     import oe.recipeutils
 
diff --git a/scripts/lib/resulttool/log.py b/scripts/lib/resulttool/log.py
index eb3927ec82..c46d5b4b5c 100644
--- a/scripts/lib/resulttool/log.py
+++ b/scripts/lib/resulttool/log.py
@@ -7,6 +7,7 @@
 import os
 import resulttool.resultutils as resultutils
 
+
 def show_ptest(result, ptest, logger):
     logdata = resultutils.ptestresult_get_log(result, ptest)
     if logdata is not None:
@@ -16,6 +17,7 @@ def show_ptest(result, ptest, logger):
     print("ptest '%s' log not found" % ptest)
     return 1
 
+
 def show_reproducible(result, reproducible, logger):
     try:
         print(result['reproducible'][reproducible]['diffoscope.text'])
@@ -25,6 +27,7 @@ def show_reproducible(result, reproducible, logger):
         print("reproducible '%s' not found" % reproducible)
         return 1
 
+
 def log(args, logger):
     results = resultutils.load_resultsdata(args.source)
 
@@ -78,6 +81,7 @@ def log(args, logger):
             if not show_reproducible(r, reproducible, logger):
                 return 1
 
+
 def register_commands(subparsers):
     """Register subcommands from this plugin"""
     parser = subparsers.add_parser('log', help='show logs',
diff --git a/scripts/lib/resulttool/manualexecution.py b/scripts/lib/resulttool/manualexecution.py
index 2bd4f6f136..9bf51dd047 100755
--- a/scripts/lib/resulttool/manualexecution.py
+++ b/scripts/lib/resulttool/manualexecution.py
@@ -19,11 +19,13 @@ def load_json_file(f):
     with open(f, "r") as filedata:
         return json.load(filedata)
 
+
 def write_json_file(f, json_data):
     os.makedirs(os.path.dirname(f), exist_ok=True)
     with open(f, 'w') as filedata:
         filedata.write(json.dumps(json_data, sort_keys=True, indent=4))
 
+
 class ManualTestRunner(object):
 
     def _get_test_module(self, case_file):
@@ -205,6 +207,7 @@ class ManualTestRunner(object):
         write_json_file(testcase_config_file, new_testcase_config)
         logger.info('Testcase Configuration file created at %s' % testcase_config_file)
 
+
 def manualexecution(args, logger):
     testrunner = ManualTestRunner()
     if args.make_config_options_file:
@@ -218,6 +221,7 @@ def manualexecution(args, logger):
     resultjsonhelper.dump_testresult_file(write_dir, configurations, result_id, test_results)
     return 0
 
+
 def register_commands(subparsers):
     """Register subcommands from this plugin"""
     parser_build = subparsers.add_parser('manualexecution', help='helper script for results populating during manual test execution.',
diff --git a/scripts/lib/resulttool/merge.py b/scripts/lib/resulttool/merge.py
index 18b4825a18..05d0b0ed13 100644
--- a/scripts/lib/resulttool/merge.py
+++ b/scripts/lib/resulttool/merge.py
@@ -10,6 +10,7 @@ import os
 import json
 import resulttool.resultutils as resultutils
 
+
 def merge(args, logger):
     configvars = {}
     if not args.not_add_testseries:
@@ -30,6 +31,7 @@ def merge(args, logger):
 
     return 0
 
+
 def register_commands(subparsers):
     """Register subcommands from this plugin"""
     parser_build = subparsers.add_parser('merge', help='merge test result files/directories/URLs',
diff --git a/scripts/lib/resulttool/regression.py b/scripts/lib/resulttool/regression.py
index 9f952951b3..c1f9460f2e 100644
--- a/scripts/lib/resulttool/regression.py
+++ b/scripts/lib/resulttool/regression.py
@@ -12,6 +12,7 @@ import json
 from oeqa.utils.git import GitRepo
 import oeqa.utils.gitarchive as gitarchive
 
+
 def compare_result(logger, base_name, target_name, base_result, target_result):
     base_result = base_result.get('result')
     target_result = target_result.get('result')
@@ -35,15 +36,18 @@ def compare_result(logger, base_name, target_name, base_result, target_result):
         resultstring = "Match: %s\n       %s" % (base_name, target_name)
     return result, resultstring
 
+
 def get_results(logger, source):
     return resultutils.load_resultsdata(source, configmap=resultutils.regression_map)
 
+
 def regression(args, logger):
     base_results = get_results(logger, args.base_result)
     target_results = get_results(logger, args.target_result)
 
     regression_common(args, logger, base_results, target_results)
 
+
 def regression_common(args, logger, base_results, target_results):
     if args.base_result_id:
         base_results = resultutils.filter_resultsdata(base_results, args.base_result_id)
@@ -82,6 +86,7 @@ def regression_common(args, logger, base_results, target_results):
 
     return 0
 
+
 def regression_git(args, logger):
     base_results = {}
     target_results = {}
@@ -147,6 +152,7 @@ def regression_git(args, logger):
 
     return 0
 
+
 def register_commands(subparsers):
     """Register subcommands from this plugin"""
 
diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index a4f1d11bef..8c74f51b58 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -23,7 +23,6 @@ class ResultsTextReport(object):
                              'failed': ['FAILED', 'failed', 'FAIL', 'ERROR', 'error', 'UNKNOWN', 'XPASS'],
                              'skipped': ['SKIPPED', 'skipped', 'UNSUPPORTED', 'UNTESTED', 'UNRESOLVED']}
 
-
     def handle_ptest_result(self, k, status, result, machine):
         if machine not in self.ptests:
             self.ptests[machine] = {}
@@ -284,12 +283,14 @@ class ResultsTextReport(object):
                 test_count_reports.append(test_count_report)
         self.print_test_report('test_report_full_text.txt', test_count_reports)
 
+
 def report(args, logger):
     report = ResultsTextReport()
     report.view_test_report(logger, args.source_dir, args.branch, args.commit, args.tag, args.use_regression_map,
                             args.raw_test_only, args.selected_test_case_only)
     return 0
 
+
 def register_commands(subparsers):
     """Register subcommands from this plugin"""
     parser_build = subparsers.add_parser('report', help='summarise test results',
diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index 8917022d36..d882b6d322 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -38,17 +38,21 @@ store_map = {
     "manual": ['TEST_TYPE', 'TEST_MODULE', 'MACHINE', 'IMAGE_BASENAME']
 }
 
+
 def is_url(p):
     """
     Helper for determining if the given path is a URL
     """
     return p.startswith('http://') or p.startswith('https://')
 
+
 extra_configvars = {'TESTSERIES': ''}
 
 #
 # Load the json file and append the results data into the provided results dict
 #
+
+
 def append_resultsdata(results, f, configmap=store_map, configvars=extra_configvars):
     if type(f) is str:
         if is_url(f):
@@ -83,6 +87,8 @@ def append_resultsdata(results, f, configmap=store_map, configvars=extra_configv
 # Walk a directory and find/load results data
 # or load directly from a file
 #
+
+
 def load_resultsdata(source, configmap=store_map, configvars=extra_configvars):
     results = {}
     if is_url(source) or os.path.isfile(source):
@@ -95,6 +101,7 @@ def load_resultsdata(source, configmap=store_map, configvars=extra_configvars):
                 append_resultsdata(results, f, configmap, configvars)
     return results
 
+
 def filter_resultsdata(results, resultid):
     newresults = {}
     for r in results:
@@ -104,6 +111,7 @@ def filter_resultsdata(results, resultid):
                  newresults[r][i] = results[r][i]
     return newresults
 
+
 def strip_ptestresults(results):
     newresults = copy.deepcopy(results)
     #for a in newresults2:
@@ -119,6 +127,7 @@ def strip_ptestresults(results):
                     del newresults[res]['result']['ptestresult.sections'][i]['log']
     return newresults
 
+
 def decode_log(logdata):
     if isinstance(logdata, str):
         return logdata
@@ -130,6 +139,7 @@ def decode_log(logdata):
             return data.decode("utf-8", errors='ignore')
     return None
 
+
 def generic_get_log(sectionname, results, section):
     if sectionname not in results:
         return None
@@ -141,9 +151,11 @@ def generic_get_log(sectionname, results, section):
         return None
     return decode_log(ptest['log'])
 
+
 def ptestresult_get_log(results, section):
     return generic_get_log('ptestresuls.sections', results, section)
 
+
 def generic_get_rawlogs(sectname, results):
     if sectname not in results:
         return None
@@ -151,9 +163,11 @@ def generic_get_rawlogs(sectname, results):
         return None
     return decode_log(results[sectname]['log'])
 
+
 def ptestresult_get_rawlogs(results):
     return generic_get_rawlogs('ptestresult.rawlogs', results)
 
+
 def save_resultsdata(results, destdir, fn="testresults.json", ptestjson=False, ptestlogs=False):
     for res in results:
         if res:
@@ -180,6 +194,7 @@ def save_resultsdata(results, destdir, fn="testresults.json", ptestjson=False, p
                             with open(dst.replace(fn, "ptest-%s.log" % i), "w+") as f:
                                 f.write(sectionlog)
 
+
 def git_get_result(repo, tags, configmap=store_map):
     git_objs = []
     for tag in tags:
@@ -207,6 +222,7 @@ def git_get_result(repo, tags, configmap=store_map):
 
     return results
 
+
 def test_run_results(results):
     """
     Convenient generator function that iterates over all test runs that have a
diff --git a/scripts/lib/resulttool/store.py b/scripts/lib/resulttool/store.py
index baec9e27f9..f082b0ef77 100644
--- a/scripts/lib/resulttool/store.py
+++ b/scripts/lib/resulttool/store.py
@@ -82,6 +82,7 @@ def store(args, logger):
 
     return 0
 
+
 def register_commands(subparsers):
     """Register subcommands from this plugin"""
     parser_build = subparsers.add_parser('store', help='store test results into a git repository',
diff --git a/scripts/lib/scriptpath.py b/scripts/lib/scriptpath.py
index f32326db3a..e8eb458290 100644
--- a/scripts/lib/scriptpath.py
+++ b/scripts/lib/scriptpath.py
@@ -10,11 +10,13 @@ import sys
 import os
 import os.path
 
+
 def add_oe_lib_path():
     basepath = os.path.abspath(os.path.dirname(__file__) + '/../..')
     newpath = basepath + '/meta/lib'
     sys.path.insert(0, newpath)
 
+
 def add_bitbake_lib_path():
     basepath = os.path.abspath(os.path.dirname(__file__) + '/../..')
     bitbakepath = None
diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index 50c9c95cd6..3e0415ae10 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -20,6 +20,7 @@ import threading
 import importlib
 from importlib import machinery
 
+
 class KeepAliveStreamHandler(logging.StreamHandler):
     def __init__(self, keepalive=True, **kwargs):
         super().__init__(**kwargs)
@@ -55,6 +56,7 @@ class KeepAliveStreamHandler(logging.StreamHandler):
         with self._timeout:
             self._timeout.notify()
 
+
 def logger_create(name, stream=None, keepalive=None):
     logger = logging.getLogger(name)
     if keepalive is not None:
@@ -66,6 +68,7 @@ def logger_create(name, stream=None, keepalive=None):
     logger.setLevel(logging.INFO)
     return logger
 
+
 def logger_setup_color(logger, color='auto'):
     from bb.msg import BBLogFormatter
 
@@ -109,6 +112,7 @@ def git_convert_standalone_clone(repodir):
             bb.process.run('git repack -a', cwd=repodir)
             os.remove(alternatesfile)
 
+
 def _get_temp_recipe_dir(d):
     # This is a little bit hacky but we need to find a place where we can put
     # the recipe so that bitbake can find it. We're going to delete it at the
@@ -125,12 +129,15 @@ def _get_temp_recipe_dir(d):
                     break
     return fetchrecipedir
 
+
 class FetchUrlFailure(Exception):
     def __init__(self, url):
         self.url = url
+
     def __str__(self):
         return "Failed to fetch URL %s" % self.url
 
+
 def fetch_url(tinfoil, srcuri, srcrev, destdir, logger, preserve_tmp=False, mirrors=False):
     """
     Fetch the specified URL using normal do_fetch and do_unpack tasks, i.e.
@@ -255,6 +262,7 @@ def run_editor(fn, logger=None):
         logger.error("Execution of '%s' failed: %s" % (editor, exc))
         return 1
 
+
 def is_src_url(param):
     """
     Check if a parameter is a URL and return True if so
@@ -268,6 +276,7 @@ def is_src_url(param):
         return True
     return False
 
+
 def filter_src_subdirs(pth):
     """
     Filter out subdirectories of initial unpacked source trees that we do not care about.
diff --git a/scripts/lib/wic/__init__.py b/scripts/lib/wic/__init__.py
index 85567934ae..d54a0e886d 100644
--- a/scripts/lib/wic/__init__.py
+++ b/scripts/lib/wic/__init__.py
@@ -6,5 +6,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+
 class WicError(Exception):
     pass
diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index cef201aec8..c3e9a5d408 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -31,6 +31,7 @@ from wic.misc import get_bitbake_var, exec_cmd
 
 logger = logging.getLogger('wic')
 
+
 def verify_build_env():
     """
     Verify that the build environment is sane.
@@ -47,6 +48,7 @@ CANNED_IMAGE_DIR = "lib/wic/canned-wks" # relative to scripts
 SCRIPTS_CANNED_IMAGE_DIR = "scripts/" + CANNED_IMAGE_DIR
 WIC_DIR = "wic"
 
+
 def build_canned_image_list(path):
     layers_path = get_bitbake_var("BBLAYERS")
     canned_wks_layer_dirs = []
@@ -63,6 +65,7 @@ def build_canned_image_list(path):
 
     return canned_wks_layer_dirs
 
+
 def find_canned_image(scripts_path, wks_file):
     """
     Find a .wks file with the given name in the canned files dir.
@@ -553,6 +556,7 @@ class Disk:
                 elif part['type'] != 'f':
                     logger.warning("skipping partition {}: unsupported fstype {}".format(pnum, fstype))
 
+
 def wic_ls(args, native_sysroot):
     """List contents of partitioned image or vfat partition."""
     disk = Disk(args.path.image, native_sysroot)
@@ -567,6 +571,7 @@ def wic_ls(args, native_sysroot):
         path = args.path.path or '/'
         print(disk.dir(args.path.part, path))
 
+
 def wic_cp(args, native_sysroot):
     """
     Copy file or directory to/from the vfat/ext partition of
@@ -587,6 +592,7 @@ def wic_rm(args, native_sysroot):
     disk = Disk(args.path.image, native_sysroot)
     disk.remove(args.path.part, args.path.path, args.recursive_delete)
 
+
 def wic_write(args, native_sysroot):
     """
     Write image to a target device.
@@ -594,6 +600,7 @@ def wic_write(args, native_sysroot):
     disk = Disk(args.image, native_sysroot, ('fat', 'ext', 'linux-swap'))
     disk.write(args.target, args.expand)
 
+
 def find_canned(scripts_path, file_name):
     """
     Find a file either by its path or by name in the canned files dir.
@@ -611,6 +618,7 @@ def find_canned(scripts_path, file_name):
                     fullpath = os.path.join(canned_wks_dir, fname)
                     return fullpath
 
+
 def get_custom_config(boot_file):
     """
     Get the custom configuration to be used for the bootloader.
diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index 6f733d5365..e25c66a223 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -25,6 +25,7 @@ import fcntl
 import tempfile
 import logging
 
+
 def get_block_size(file_obj):
     """
     Returns block size for file object 'file_obj'. Errors are indicated by the
@@ -48,6 +49,7 @@ def get_block_size(file_obj):
             raise IOError("Unable to determine block size")
     return bsize
 
+
 class ErrorNotSupp(Exception):
     """
     An exception of this type is raised when the 'FIEMAP' or 'SEEK_HOLE' feature
@@ -55,6 +57,7 @@ class ErrorNotSupp(Exception):
     """
     pass
 
+
 class Error(Exception):
     """A class for all the other exceptions raised by this module."""
     pass
@@ -160,6 +163,7 @@ class _FilemapBase(object):
 _SEEK_DATA = 3
 _SEEK_HOLE = 4
 
+
 def _lseek(file_obj, offset, whence):
     """This is a helper function which invokes 'os.lseek' for file object
     'file_obj' and with specified 'offset' and 'whence'. The 'whence'
@@ -180,6 +184,7 @@ def _lseek(file_obj, offset, whence):
         else:
             raise
 
+
 class FilemapSeek(_FilemapBase):
     """
     This class uses the 'SEEK_HOLE' and 'SEEK_DATA' to find file block mapping.
@@ -304,6 +309,7 @@ _FIEMAP_FLAG_SYNC = 0x00000001
 # FIEMAP ioctl will be invoked.
 _FIEMAP_BUFFER_SIZE = 256 * 1024
 
+
 class FilemapFiemap(_FilemapBase):
     """
     This class provides API to the FIEMAP ioctl. Namely, it allows to iterate
@@ -469,6 +475,7 @@ class FilemapFiemap(_FilemapBase):
                         % (first_prev, last_prev))
         yield (first_prev, last_prev)
 
+
 class FilemapNobmap(_FilemapBase):
     """
     This class is used when both the 'SEEK_DATA/HOLE' and FIEMAP are not
@@ -492,6 +499,7 @@ class FilemapNobmap(_FilemapBase):
                         % (start, count, start + count - 1))
         yield (start, start + count - 1)
 
+
 def filemap(image, log=None):
     """
     Create and return an instance of a Filemap class - 'FilemapFiemap' or
@@ -510,6 +518,7 @@ def filemap(image, log=None):
         except ErrorNotSupp:
             return FilemapNobmap(image, log)
 
+
 def sparse_copy(src_fname, dst_fname, skip=0, seek=0,
                 length=0, api=None):
     """
diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 991e5094bb..30c6c0e8d5 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -17,6 +17,7 @@ from wic.pluginbase import PluginMgr, PLUGIN_TYPES
 
 logger = logging.getLogger('wic')
 
+
 def subcommand_error(args):
     logger.info("invalid subcommand %s", args[0])
 
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index b644e68da3..866aab371e 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -27,6 +27,7 @@ logger = logging.getLogger('wic')
 
 __expand_var_regexp__ = re.compile(r"\${[^{}@\n\t :]+}")
 
+
 def expand_line(line):
     while True:
         m = __expand_var_regexp__.search(line)
@@ -39,18 +40,22 @@ def expand_line(line):
             return line
         line = line[:m.start()] + val + line[m.end():]
 
+
 class KickStartError(Exception):
     """Custom exception."""
     pass
 
+
 class KickStartParser(ArgumentParser):
     """
     This class overwrites error method to throw exception
     instead of producing usage message(default argparse behavior).
     """
+
     def error(self, message):
         raise ArgumentError(None, message)
 
+
 def sizetype(default, size_in_bytes=False):
     def f(arg):
         """
@@ -67,7 +72,6 @@ def sizetype(default, size_in_bytes=False):
             except ValueError:
                 raise ArgumentTypeError("Invalid size: %r" % arg)
 
-
         if size_in_bytes:
             if suffix == 's' or suffix == 'S':
                 return size * 512
@@ -85,6 +89,7 @@ def sizetype(default, size_in_bytes=False):
         raise ArgumentTypeError("Invalid size: %r" % arg)
     return f
 
+
 def overheadtype(arg):
     """
     Custom type for ArgumentParser
@@ -100,6 +105,7 @@ def overheadtype(arg):
 
     return result
 
+
 def cannedpathtype(arg):
     """
     Custom type for ArgumentParser
@@ -111,6 +117,7 @@ def cannedpathtype(arg):
         raise ArgumentTypeError("file not found: %s" % arg)
     return result
 
+
 def systemidtype(arg):
     """
     Custom type for ArgumentParser
@@ -129,6 +136,7 @@ def systemidtype(arg):
 
     return arg
 
+
 class KickStart():
     """Kickstart parser implementation."""
 
diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index 92d289fbf6..786457bd7f 100644
--- a/scripts/lib/wic/misc.py
+++ b/scripts/lib/wic/misc.py
@@ -50,6 +50,7 @@ NATIVE_RECIPES = {"bmaptool": "bmap-tools",
                   "tar": "tar"
                  }
 
+
 def runtool(cmdln_or_args):
     """ wrapper for most of the subprocess calls
     input:
@@ -83,6 +84,7 @@ def runtool(cmdln_or_args):
 
     return process.returncode, out
 
+
 def _exec_cmd(cmd_and_args, as_shell=False):
     """
     Execute command, catching stderr, stdout
@@ -114,6 +116,7 @@ def exec_cmd(cmd_and_args, as_shell=False):
     """
     return _exec_cmd(cmd_and_args, as_shell)[1]
 
+
 def find_executable(cmd, paths):
     recipe = cmd
     if recipe in NATIVE_RECIPES:
@@ -124,6 +127,7 @@ def find_executable(cmd, paths):
 
     return spawn.find_executable(cmd, paths)
 
+
 def exec_native_cmd(cmd_and_args, native_sysroot, pseudo=""):
     """
     Execute native command, catching stderr, stdout
@@ -174,12 +178,15 @@ def exec_native_cmd(cmd_and_args, native_sysroot, pseudo=""):
 
     return ret, out
 
+
 BOOTDD_EXTRA_SPACE = 16384
 
+
 class BitbakeVars(defaultdict):
     """
     Container for Bitbake variables.
     """
+
     def __init__(self):
         defaultdict.__init__(self, dict)
 
@@ -253,9 +260,11 @@ class BitbakeVars(defaultdict):
 
         return result
 
+
 # Create BB_VARS singleton
 BB_VARS = BitbakeVars()
 
+
 def get_bitbake_var(var, image=None, cache=True):
     """
     Provide old get_bitbake_var API by wrapping
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index d4ca39a09e..5f5af5f70c 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -20,6 +20,7 @@ from wic.pluginbase import PluginMgr
 
 logger = logging.getLogger('wic')
 
+
 class Partition():
 
     def __init__(self, args, lineno):
diff --git a/scripts/lib/wic/pluginbase.py b/scripts/lib/wic/pluginbase.py
index d9b4e57747..621fcaf66b 100644
--- a/scripts/lib/wic/pluginbase.py
+++ b/scripts/lib/wic/pluginbase.py
@@ -24,6 +24,7 @@ logger = logging.getLogger('wic')
 
 PLUGINS = defaultdict(dict)
 
+
 class PluginMgr:
     _plugin_dirs = []
 
@@ -58,6 +59,7 @@ class PluginMgr:
 
         return PLUGINS.get(ptype)
 
+
 class PluginMeta(type):
     def __new__(cls, name, bases, attrs):
         class_type = type.__new__(cls, name, bases, attrs)
@@ -66,6 +68,7 @@ class PluginMeta(type):
 
         return class_type
 
+
 class ImagerPlugin(metaclass=PluginMeta):
     wic_plugin_type = "imager"
 
@@ -73,6 +76,7 @@ class ImagerPlugin(metaclass=PluginMeta):
         raise WicError("Method %s.do_create is not implemented" %
                        self.__class__.__name__)
 
+
 class SourcePlugin(metaclass=PluginMeta):
     wic_plugin_type = "source"
     """
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 9ae3f52dea..ea5f542be6 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -29,6 +29,7 @@ from wic.misc import get_bitbake_var, exec_cmd, exec_native_cmd
 
 logger = logging.getLogger('wic')
 
+
 class DirectPlugin(ImagerPlugin):
     """
     Install a system into a file containing a partitioned disk image.
@@ -279,6 +280,7 @@ class DirectPlugin(ImagerPlugin):
         if not self.debug:
             shutil.rmtree(self.workdir, ignore_errors=True)
 
+
 # Overhead of the MBR partitioning scheme (just one sector)
 MBR_OVERHEAD = 1
 
@@ -288,6 +290,7 @@ GPT_OVERHEAD = 34
 # Size of a sector in bytes
 SECTOR_SIZE = 512
 
+
 class PartitionedImage():
     """
     Partitioned image in a file.
diff --git a/scripts/lib/wic/plugins/source/bootimg-biosplusefi.py b/scripts/lib/wic/plugins/source/bootimg-biosplusefi.py
index 8c6c645c39..c097181f8c 100644
--- a/scripts/lib/wic/plugins/source/bootimg-biosplusefi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-biosplusefi.py
@@ -23,6 +23,7 @@ import types
 from wic.pluginbase import SourcePlugin
 from importlib.machinery import SourceFileLoader
 
+
 class BootimgBiosPlusEFIPlugin(SourcePlugin):
     """
     Create MBR + EFI boot partition
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index d4f2f928d9..fc980a20eb 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -25,6 +25,7 @@ from wic.misc import (exec_cmd, exec_native_cmd,
 
 logger = logging.getLogger('wic')
 
+
 class BootimgEFIPlugin(SourcePlugin):
     """
     Create EFI boot partition.
@@ -189,7 +190,6 @@ class BootimgEFIPlugin(SourcePlugin):
         cfg.write(boot_conf)
         cfg.close()
 
-
     @classmethod
     def do_configure_partition(cls, part, source_params, creator, cr_workdir,
                                oe_builddir, bootimg_dir, kernel_dir,
diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index c59b476661..27745357c5 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -23,6 +23,7 @@ from wic.misc import exec_cmd, get_bitbake_var
 
 logger = logging.getLogger('wic')
 
+
 class BootimgPartitionPlugin(SourcePlugin):
     """
     Create an image of boot partition, copying over files
@@ -159,7 +160,6 @@ class BootimgPartitionPlugin(SourcePlugin):
         cfg.write(extlinux_conf)
         cfg.close()
 
-
     @classmethod
     def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
                              oe_builddir, bootimg_dir, kernel_dir,
@@ -180,7 +180,6 @@ class BootimgPartitionPlugin(SourcePlugin):
 
         logger.debug('Kernel dir: %s', bootimg_dir)
 
-
         for task in cls.install_task:
             src_path, dst_path = task
             logger.debug('Install %s as %s', src_path, dst_path)
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index f2639e7004..ad9d9e36e8 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -22,6 +22,7 @@ from wic.misc import (exec_cmd, exec_native_cmd,
 
 logger = logging.getLogger('wic')
 
+
 class BootimgPcbiosPlugin(SourcePlugin):
     """
     Create MBR boot partition and install syslinux on it.
diff --git a/scripts/lib/wic/plugins/source/empty.py b/scripts/lib/wic/plugins/source/empty.py
index 041617d648..7cae4ba82a 100644
--- a/scripts/lib/wic/plugins/source/empty.py
+++ b/scripts/lib/wic/plugins/source/empty.py
@@ -14,6 +14,7 @@ from wic.pluginbase import SourcePlugin
 
 logger = logging.getLogger('wic')
 
+
 class EmptyPartitionPlugin(SourcePlugin):
     """
     Populate unformatted empty partition.
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index 3645d07990..21e66a8a03 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -20,6 +20,7 @@ from wic.misc import exec_cmd, exec_native_cmd, get_bitbake_var
 
 logger = logging.getLogger('wic')
 
+
 class IsoImagePlugin(SourcePlugin):
     """
     Create a bootable ISO image
diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index fa7b1eb8ac..a8f4c884ce 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -12,6 +12,7 @@ from wic.filemap import sparse_copy
 
 logger = logging.getLogger('wic')
 
+
 class RawCopyPlugin(SourcePlugin):
     """
     Populate partition content from raw image file.
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 03b642f4fa..176902f39b 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -25,6 +25,7 @@ from wic.misc import get_bitbake_var, exec_native_cmd
 
 logger = logging.getLogger('wic')
 
+
 class RootfsPlugin(SourcePlugin):
     """
     Populate partition content from a rootfs directory.
diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index 7812ea4540..4595ae0fc0 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -38,6 +38,7 @@ import oeqa.utils.gitarchive as gitarchive
 logging.basicConfig(level=logging.INFO, format="%(levelname)s: %(message)s")
 log = logging.getLogger('oe-build-perf-report')
 
+
 def list_test_revs(repo, tag_name, verbosity, **kwargs):
     """Get list of all tested revisions"""
     valid_kwargs = dict([(k, v) for k, v in kwargs.items() if v is not None])
@@ -63,7 +64,6 @@ def list_test_revs(repo, tag_name, verbosity, **kwargs):
         # Only use fields that we want to print
         cols = [rev[i] for i in print_fields]
 
-
         if cols != prev:
             commit_cnt = 1
             test_run_cnt = 1
@@ -87,6 +87,7 @@ def list_test_revs(repo, tag_name, verbosity, **kwargs):
 
     print_table(rows)
 
+
 def is_xml_format(repo, commit):
     """Check if the commit contains xml (or json) data"""
     if repo.rev_parse(commit + ':results.xml'):
@@ -96,6 +97,7 @@ def is_xml_format(repo, commit):
         log.debug("No xml report in %s, assuming json formatted results", commit)
         return False
 
+
 def read_results(repo, tags, xml=True):
     """Read result files from repo"""
 
@@ -195,7 +197,6 @@ def print_diff_report(metadata_l, data_l, metadata_r, data_r):
             rows.append([val['title'] + ':', val['value'], val['value_old']])
     print_table(rows, row_fmt)
 
-
     # Print test results
     print("\nTEST RESULTS:\n=============")
 
@@ -316,7 +317,6 @@ def print_html_report(data, id_comp, buildstats):
             else:
                 new_test['message'] = test_r['message']
 
-
         # Generate the list of measurements
         for meas in test_r['measurements'].keys():
             meas_r = test_r['measurements'][meas]
@@ -358,7 +358,6 @@ def print_html_report(data, id_comp, buildstats):
                 new_meas['buildstats'] = BSSummary(buildstats[comp_rev][bs_key],
                                                    buildstats[rev][bs_key])
 
-
             new_test['measurements'].append(new_meas)
         tests.append(new_test)
 
@@ -611,5 +610,6 @@ def main(argv=None):
 
     return 0
 
+
 if __name__ == "__main__":
     sys.exit(main())
diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
index 00e00b4ce9..280eef261d 100755
--- a/scripts/oe-build-perf-test
+++ b/scripts/oe-build-perf-test
@@ -66,6 +66,7 @@ def pre_run_sanity_check():
         return False
     return True
 
+
 def setup_file_logging(log_file):
     """Setup loggin to file"""
     log_dir = os.path.dirname(log_file)
diff --git a/scripts/oe-depends-dot b/scripts/oe-depends-dot
index 15620240c4..a0b57f0fb0 100755
--- a/scripts/oe-depends-dot
+++ b/scripts/oe-depends-dot
@@ -11,6 +11,7 @@ import argparse
 import logging
 import re
 
+
 class Dot(object):
     def __init__(self):
         parser = argparse.ArgumentParser(
@@ -146,6 +147,7 @@ class Dot(object):
             print('Because: %s' % ' '.join(reverse_deps))
             Dot.print_dep_chains(self.args.key, reverse_deps, depends)
 
+
 if __name__ == "__main__":
     try:
         dot = Dot()
diff --git a/scripts/oe-git-archive b/scripts/oe-git-archive
index 9305ed0b0f..9fd0942358 100755
--- a/scripts/oe-git-archive
+++ b/scripts/oe-git-archive
@@ -81,6 +81,7 @@ def parse_args(argv):
                         help="Data to commit")
     return parser.parse_args(argv)
 
+
 def get_nested(d, list_of_keys):
     try:
         for k in list_of_keys:
@@ -89,6 +90,7 @@ def get_nested(d, list_of_keys):
     except KeyError:
         return ""
 
+
 def main(argv=None):
     args = parse_args(argv)
     if args.debug:
@@ -114,5 +116,6 @@ def main(argv=None):
 
     return 0
 
+
 if __name__ == "__main__":
     sys.exit(main())
diff --git a/scripts/oe-pkgdata-browser b/scripts/oe-pkgdata-browser
index dc6178beb4..2c8b20ac44 100755
--- a/scripts/oe-pkgdata-browser
+++ b/scripts/oe-pkgdata-browser
@@ -25,6 +25,8 @@ PackageColumns = enum.IntEnum("PackageColumns", {"Package": 0, "Size": 1})
 FileColumns = enum.IntEnum("FileColumns", {"Filename": 0, "Size": 1})
 
 import time
+
+
 def timeit(f):
     def timed(*args, **kw):
         ts = time.time()
@@ -36,6 +38,7 @@ def timeit(f):
         return result
     return timed
 
+
 def human_size(nbytes):
     import math
     suffixes = ['B', 'kB', 'MB', 'GB', 'TB', 'PB']
@@ -48,6 +51,7 @@ def human_size(nbytes):
     f = ('%.2f' % human).rstrip('0').rstrip('.')
     return '%s %s' % (f, suffixes[rank])
 
+
 def load(filename, suffix=None):
     from configparser import ConfigParser
     from itertools import chain
@@ -63,6 +67,7 @@ def load(filename, suffix=None):
     # values to ints?
     return parser["fake"]
 
+
 def find_pkgdata():
     import subprocess
     output = subprocess.check_output(("bitbake", "-e"), universal_newlines=True)
@@ -72,6 +77,7 @@ def find_pkgdata():
     # TODO exception or something
     return None
 
+
 def packages_in_recipe(pkgdata, recipe):
     """
     Load the recipe pkgdata to determine the list of runtime packages.
@@ -80,13 +86,16 @@ def packages_in_recipe(pkgdata, recipe):
     packages = data["PACKAGES"].split()
     return packages
 
+
 def load_runtime_package(pkgdata, package):
     return load(os.path.join(pkgdata, "runtime", package), suffix=package)
 
+
 def recipe_from_package(pkgdata, package):
     data = load(os.path.join(pkgdata, "runtime", package), suffix=package)
     return data["PN"]
 
+
 def summary(data):
     s = ""
     s += "{0[PKG]} {0[PKGV]}-{0[PKGR]}\n{0[LICENSE]}\n{0[SUMMARY]}\n".format(data)
@@ -243,6 +252,7 @@ class PkgUi():
             if os.path.isfile(os.path.join(pkgdata, recipe)):
                 self.recipe_iters[recipe] = self.recipe_store.append([recipe])
 
+
 if __name__ == "__main__":
     import argparse
 
diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index aef04a18c0..fa107843d5 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -25,6 +25,7 @@ import scriptutils
 import argparse_oe
 logger = scriptutils.logger_create('pkgdatautil')
 
+
 def tinfoil_init():
     import bb.tinfoil
     import logging
@@ -82,8 +83,10 @@ def glob(args):
             # Define some functions
             def revpkgdata(pkgn):
                 return os.path.join(args.pkgdata_dir, "runtime-reverse", pkgn)
+
             def fwdpkgdata(pkgn):
                 return os.path.join(args.pkgdata_dir, "runtime", pkgn)
+
             def readpn(pkgdata_file):
                 pn = ""
                 with open(pkgdata_file, 'r') as f:
@@ -91,6 +94,7 @@ def glob(args):
                         if line.startswith("PN:"):
                             pn = line.split(': ')[1].rstrip()
                 return pn
+
             def readrenamed(pkgdata_file):
                 renamed = ""
                 pn = os.path.basename(pkgdata_file)
@@ -146,6 +150,7 @@ def glob(args):
 
     print("\n".join(mappedpkgs - skippedpkgs))
 
+
 def read_value(args):
     # Handle both multiple arguments and multiple values within an arg (old syntax)
     packages = []
@@ -197,6 +202,7 @@ def read_value(args):
         else:
             logger.debug("revlink %s does not exist", revlink)
 
+
 def lookup_pkglist(pkgs, pkgdata_dir, reverse):
     if reverse:
         mappings = OrderedDict()
@@ -218,6 +224,7 @@ def lookup_pkglist(pkgs, pkgdata_dir, reverse):
                             break
     return mappings
 
+
 def lookup_pkg(args):
     # Handle both multiple arguments and multiple values within an arg (old syntax)
     pkgs = []
@@ -240,6 +247,7 @@ def lookup_pkg(args):
 
     print('\n'.join(items))
 
+
 def lookup_recipe(args):
     def parse_pkgdatafile(pkgdatafile):
         with open(pkgdatafile, 'r') as f:
@@ -277,6 +285,7 @@ def lookup_recipe(args):
                 logger.error("The following packages could not be found: %s" % pkg)
                 sys.exit(1)
 
+
 def package_info(args):
     def parse_pkgdatafile(pkgdatafile):
         vars = ['PKGV', 'PKGE', 'PKGR', 'PN', 'PV', 'PE', 'PR', 'PKGSIZE']
@@ -339,6 +348,7 @@ def package_info(args):
             sys.exit(1)
         parse_pkgdatafile(pkgdatafile)
 
+
 def get_recipe_pkgs(pkgdata_dir, recipe, unpackaged):
     recipedatafile = os.path.join(pkgdata_dir, recipe)
     if not os.path.exists(recipedatafile):
@@ -361,6 +371,7 @@ def get_recipe_pkgs(pkgdata_dir, recipe, unpackaged):
     else:
         return packages
 
+
 def list_pkgs(args):
     found = False
 
@@ -423,8 +434,10 @@ def list_pkgs(args):
             logger.error("No packages found")
         sys.exit(1)
 
+
 def list_pkg_files(args):
     import json
+
     def parse_pkgdatafile(pkgdatafile, long=False):
         with open(pkgdatafile, 'r') as f:
             found = False
@@ -445,7 +458,6 @@ def list_pkg_files(args):
                 logger.error("Unable to find FILES_INFO entry in %s" % pkgdatafile)
                 sys.exit(1)
 
-
     if args.recipe:
         if args.pkg:
             logger.error("list-pkg-files: If -p/--recipe is specified then a package name cannot be specified")
@@ -491,6 +503,7 @@ def list_pkg_files(args):
                 sys.exit(1)
             parse_pkgdatafile(pkgdatafile, args.long)
 
+
 def find_path(args):
     import json
 
@@ -585,7 +598,6 @@ def main():
     parser_glob.add_argument('-x', '--exclude', help='Exclude packages matching specified regex from the glob operation')
     parser_glob.set_defaults(func=glob)
 
-
     args = parser.parse_args()
 
     if args.debug:
diff --git a/scripts/oe-publish-sdk b/scripts/oe-publish-sdk
index deb8ae1807..44dbbe5da1 100755
--- a/scripts/oe-publish-sdk
+++ b/scripts/oe-publish-sdk
@@ -24,6 +24,7 @@ import scriptutils
 import argparse_oe
 logger = scriptutils.logger_create('sdktool')
 
+
 def mkdir(d):
     try:
         os.makedirs(d)
@@ -31,6 +32,7 @@ def mkdir(d):
         if e.errno != errno.EEXIST:
             raise e
 
+
 def publish(args):
     logger.debug("In publish function")
     target_sdk = args.sdk
@@ -139,6 +141,7 @@ def main():
     ret = args.func(args)
     return ret
 
+
 if __name__ == "__main__":
     try:
         ret = main()
diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 18ac0f5869..bde1c8b5e8 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -15,7 +15,6 @@
 # E.g: "oe-selftest -r bblayers.BitbakeLayers" will run just the BitbakeLayers class from meta/lib/oeqa/selftest/bblayers.py
 
 
-
 import os
 import sys
 import argparse
@@ -35,6 +34,7 @@ from oeqa.core.exception import OEQAPreRun
 
 logger = scriptutils.logger_create('oe-selftest', stream=sys.stdout, keepalive=True)
 
+
 def main():
     description = "Script that runs unit tests against bitbake and other Yocto related tools. The goal is to validate tools functionality and metadata integrity. Refer to https://wiki.yoctoproject.org/wiki/Oe-selftest for more information."
     parser = argparse_oe.ArgumentParser(description=description)
@@ -55,6 +55,7 @@ def main():
 
     return ret
 
+
 if __name__ == '__main__':
     try:
         ret = main()
diff --git a/scripts/oe-test b/scripts/oe-test
index 55985b0b24..9fea769ff2 100755
--- a/scripts/oe-test
+++ b/scripts/oe-test
@@ -31,6 +31,7 @@ from oeqa.core.exception import OEQAPreRun
 
 logger = scriptutils.logger_create('oe-test', stream=sys.stdout)
 
+
 def main():
     parser = argparse_oe.ArgumentParser(description="OpenEmbedded test tool",
                                         add_help=False,
@@ -73,6 +74,7 @@ def main():
 
     return ret
 
+
 if __name__ == '__main__':
     try:
         ret = main()
diff --git a/scripts/oe-trim-schemas b/scripts/oe-trim-schemas
index 596da2d849..7bf5b7bdeb 100755
--- a/scripts/oe-trim-schemas
+++ b/scripts/oe-trim-schemas
@@ -9,18 +9,21 @@ try:
 except:
     import xml.etree.ElementTree as etree
 
+
 def child(elem, name):
     for e in elem.getchildren():
         if e.tag == name:
             return e
     return None
 
+
 def children(elem, name=None):
     l = elem.getchildren()
     if name:
         l = [e for e in l if e.tag == name]
     return l
 
+
 if len(sys.argv) < 2 or sys.argv[1] in ('-h', '--help'):
     print('oe-trim-schemas: error: the following arguments are required: schema\n'
           'Usage: oe-trim-schemas schema\n\n'
diff --git a/scripts/oepydevshell-internal.py b/scripts/oepydevshell-internal.py
index 7fcc4043d2..e54d84982b 100755
--- a/scripts/oepydevshell-internal.py
+++ b/scripts/oepydevshell-internal.py
@@ -12,19 +12,23 @@ import termios
 import readline
 import signal
 
+
 def nonblockingfd(fd):
     fcntl.fcntl(fd, fcntl.F_SETFL, fcntl.fcntl(fd, fcntl.F_GETFL) | os.O_NONBLOCK)
 
+
 def echonocbreak(fd):
     old = termios.tcgetattr(fd)
     old[3] = old[3] | termios.ECHO | termios.ICANON
     termios.tcsetattr(fd, termios.TCSADRAIN, old)
 
+
 def cbreaknoecho(fd):
     old = termios.tcgetattr(fd)
     old[3] = old[3] & ~ termios.ECHO & ~ termios.ICANON
     termios.tcsetattr(fd, termios.TCSADRAIN, old)
 
+
 if len(sys.argv) != 3 or sys.argv[1] in ('-h', '--help'):
     print('oepydevshell-internal.py: error: the following arguments are required: pty, pid\n'
           'Usage: oepydevshell-internal.py pty pid\n\n'
diff --git a/scripts/pybootchartgui/pybootchartgui/batch.py b/scripts/pybootchartgui/pybootchartgui/batch.py
index 1b9df3c1cd..6d9fbce830 100644
--- a/scripts/pybootchartgui/pybootchartgui/batch.py
+++ b/scripts/pybootchartgui/pybootchartgui/batch.py
@@ -17,6 +17,7 @@ import cairo
 from . import draw
 from .draw import RenderOptions
 
+
 def render(writer, trace, app_options, filename):
     handlers = {
         "png": (lambda w, h: cairo.ImageSurface(cairo.FORMAT_ARGB32, w, h),
diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/pybootchartgui/pybootchartgui/draw.py
index 7572b59b8d..e2ece14faf 100644
--- a/scripts/pybootchartgui/pybootchartgui/draw.py
+++ b/scripts/pybootchartgui/pybootchartgui/draw.py
@@ -22,6 +22,7 @@ import colorsys
 import functools
 from operator import itemgetter
 
+
 class RenderOptions:
 
     def __init__(self, app_options):
@@ -37,6 +38,7 @@ class RenderOptions:
         else:
             return trace.proc_tree
 
+
 # Process tree background color.
 BACK_COLOR = (1.0, 1.0, 1.0, 1.0)
 
@@ -160,35 +162,43 @@ STAT_TYPE_CPU = 0
 STAT_TYPE_IO = 1
 
 # Convert ps process state to an int
+
+
 def get_proc_state(flag):
     return "RSDTZXW".find(flag) + 1
 
+
 def draw_text(ctx, text, color, x, y):
     ctx.set_source_rgba(*color)
     ctx.move_to(x, y)
     ctx.show_text(text)
 
+
 def draw_fill_rect(ctx, color, rect):
     ctx.set_source_rgba(*color)
     ctx.rectangle(*rect)
     ctx.fill()
 
+
 def draw_rect(ctx, color, rect):
     ctx.set_source_rgba(*color)
     ctx.rectangle(*rect)
     ctx.stroke()
 
+
 def draw_legend_box(ctx, label, fill_color, x, y, s):
     draw_fill_rect(ctx, fill_color, (x, y - s, s, s))
     draw_rect(ctx, PROC_BORDER_COLOR, (x, y - s, s, s))
     draw_text(ctx, label, TEXT_COLOR, x + s + 5, y)
 
+
 def draw_legend_line(ctx, label, fill_color, x, y, s):
     draw_fill_rect(ctx, fill_color, (x, y - s / 2, s + 1, 3))
     ctx.arc(x + (s + 1) / 2.0, y - (s - 3) / 2.0, 2.5, 0, 2.0 * math.pi)
     ctx.fill()
     draw_text(ctx, label, TEXT_COLOR, x + s + 5, y)
 
+
 def draw_label_in_box(ctx, color, label, x, y, w, maxx):
     label_w = ctx.text_extents(label)[2]
     label_x = x + w / 2 - label_w / 2
@@ -198,6 +208,7 @@ def draw_label_in_box(ctx, color, label, x, y, w, maxx):
         label_x = x - label_w - 5
     draw_text(ctx, label, color, label_x, y)
 
+
 def draw_sec_labels(ctx, options, rect, sec_w, nsecs):
     ctx.set_font_size(AXIS_FONT_SIZE)
     prev_x = 0
@@ -213,6 +224,7 @@ def draw_sec_labels(ctx, options, rect, sec_w, nsecs):
                 draw_text(ctx, label, TEXT_COLOR, x, rect[1] - 2)
                 prev_x = x + label_w
 
+
 def draw_box_ticks(ctx, rect, sec_w):
     draw_rect(ctx, BORDER_COLOR, tuple(rect))
 
@@ -236,6 +248,7 @@ def draw_box_ticks(ctx, rect, sec_w):
 
     ctx.set_line_cap(cairo.LINE_CAP_BUTT)
 
+
 def draw_annotations(ctx, proc_tree, times, rect):
     ctx.set_line_cap(cairo.LINE_CAP_SQUARE)
     ctx.set_source_rgba(*ANNOTATION_COLOR)
@@ -252,6 +265,7 @@ def draw_annotations(ctx, proc_tree, times, rect):
     ctx.set_line_cap(cairo.LINE_CAP_BUTT)
     ctx.set_dash([])
 
+
 def draw_chart(ctx, color, fill, chart_bounds, data, proc_tree, data_range):
     ctx.set_line_width(0.5)
     x_shift = proc_tree.start_time
@@ -299,6 +313,7 @@ def draw_chart(ctx, color, fill, chart_bounds, data, proc_tree, data_range):
         ctx.stroke()
     ctx.set_line_width(1.0)
 
+
 bar_h = 55
 meminfo_bar_h = 2 * bar_h
 header_h = 60
@@ -311,6 +326,7 @@ MIN_IMG_W = 800
 CUML_HEIGHT = 2000 # Increased value to accommodate CPU and I/O Graphs
 OPTIONS = None
 
+
 def extents(options, xscale, trace):
     start = min(trace.start.keys())
     end = start
@@ -348,6 +364,7 @@ def extents(options, xscale, trace):
 
     return (w, h)
 
+
 def clip_visible(clip, rect):
     xmax = max(clip[0], rect[0])
     ymax = max(clip[1], rect[1])
@@ -355,6 +372,7 @@ def clip_visible(clip, rect):
     ymin = min(clip[1] + clip[3], rect[1] + rect[3])
     return (xmin > xmax and ymin > ymax)
 
+
 def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
     proc_tree = options.proc_tree(trace)
 
@@ -493,6 +511,7 @@ def render_charts(ctx, options, clip, trace, curr_y, w, h, sec_w):
 
     return curr_y
 
+
 def render_processes_chart(ctx, options, trace, curr_y, w, h, sec_w):
     chart_rect = [off_x, curr_y + header_h, w, h - curr_y - 1 * off_y - header_h]
 
@@ -562,6 +581,8 @@ def render_processes_chart(ctx, options, trace, curr_y, w, h, sec_w):
 #
 # Render the chart.
 #
+
+
 def render(ctx, options, xscale, trace):
     (w, h) = extents(options, xscale, trace)
     global OPTIONS
@@ -621,6 +642,7 @@ def render(ctx, options, xscale, trace):
         if clip_visible(clip, cuml_rect):
             draw_cuml_graph(ctx, proc_tree, cuml_rect, duration, sec_w, STAT_TYPE_IO)
 
+
 def draw_process_bar_chart(ctx, clip, options, proc_tree, times, curr_y, w, h, sec_w):
     header_size = 0
     if not options.kernel_only:
@@ -684,6 +706,7 @@ def draw_header(ctx, headers, duration):
 
     return header_y
 
+
 def draw_processes_recursively(ctx, proc, proc_tree, y, proc_h, rect, clip):
     x = rect[0] + ((proc.start_time - proc_tree.start_time) * rect[2] / proc_tree.duration)
     w = ((proc.duration) * rect[2] / proc_tree.duration)
@@ -752,6 +775,7 @@ def draw_process_activity_colors(ctx, proc, proc_tree, x, y, w, proc_h, rect, cl
 
         draw_fill_rect(ctx, color, (tx, y, tw, proc_h))
 
+
 def draw_process_connecting_lines(ctx, px, py, x, y, proc_h):
     ctx.set_source_rgba(*DEP_COLOR)
     ctx.set_dash([2, 2])
@@ -770,9 +794,12 @@ def draw_process_connecting_lines(ctx, px, py, x, y, proc_h):
     ctx.set_dash([])
 
 # elide the bootchart collector - it is quite distorting
+
+
 def elide_bootchart(proc):
     return proc.cmd == 'bootchartd' or proc.cmd == 'bootchart-colle'
 
+
 class CumlSample:
     def __init__(self, proc):
         self.cmd = proc.cmd
diff --git a/scripts/pybootchartgui/pybootchartgui/gui.py b/scripts/pybootchartgui/pybootchartgui/gui.py
index b1a399240a..6a59b2f222 100644
--- a/scripts/pybootchartgui/pybootchartgui/gui.py
+++ b/scripts/pybootchartgui/pybootchartgui/gui.py
@@ -24,6 +24,7 @@ from gi.repository import GObject
 from . import draw
 from .draw import RenderOptions
 
+
 class PyBootchartWidget(gtk.DrawingArea, gtk.Scrollable):
     __gsignals__ = {
             'clicked': (gobject.SIGNAL_RUN_LAST, gobject.TYPE_NONE, (gobject.TYPE_STRING, Gdk.Event)),
@@ -237,6 +238,7 @@ class PyBootchartWidget(gtk.DrawingArea, gtk.Scrollable):
         #self.hadj.value_changed()
         self.vadj.set_value(y * self.zoom_ratio)
 
+
 class PyBootchartShell(gtk.VBox):
     ui = '''
     <ui>
@@ -251,6 +253,7 @@ class PyBootchartShell(gtk.VBox):
             </toolbar>
     </ui>
     '''
+
     def __init__(self, window, trace, options, xscale):
         gtk.VBox.__init__(self)
 
diff --git a/scripts/pybootchartgui/pybootchartgui/main.py.in b/scripts/pybootchartgui/pybootchartgui/main.py.in
index c905205c8e..cc9471dc21 100644
--- a/scripts/pybootchartgui/pybootchartgui/main.py.in
+++ b/scripts/pybootchartgui/pybootchartgui/main.py.in
@@ -23,6 +23,7 @@ import optparse
 from . import parsing
 from . import batch
 
+
 def _mk_options_parser():
 	"""Make an options parser."""
 	usage = "%prog [options] /path/to/tmp/buildstats/<recipe-machine>/<BUILDNAME>/"
@@ -67,6 +68,7 @@ def _mk_options_parser():
 			  help="display the full time regardless of which processes are currently shown")
 	return parser
 
+
 class Writer:
 	def __init__(self, write, options):
 		self.write = write
@@ -87,11 +89,13 @@ class Writer:
 		if not self.options.quiet:
 			self.write(msg)
 
+
 def _mk_writer(options):
 	def write(s):
 		print(s)
 	return Writer(write, options)
 	
+
 def _get_filename(path):
 	"""Construct a usable filename for outputs"""
 	dname = "."
@@ -103,6 +107,7 @@ def _get_filename(path):
 			fname = path
 	return os.path.join(dname, fname)
 
+
 def main(argv=None):
 	try:
 		if argv is None:
@@ -161,6 +166,7 @@ def main(argv=None):
 				else:
 					f = filename + s % n + options.format
 					n = n + 1
+
 				def render():
 					batch.render(writer, r, options, f)
 				if options.profile:
diff --git a/scripts/pybootchartgui/pybootchartgui/parsing.py b/scripts/pybootchartgui/pybootchartgui/parsing.py
index 2de03937ce..937bd89f2f 100644
--- a/scripts/pybootchartgui/pybootchartgui/parsing.py
+++ b/scripts/pybootchartgui/pybootchartgui/parsing.py
@@ -30,6 +30,7 @@ if sys.version_info >= (3, 0):
 
 # Parsing produces as its end result a 'Trace'
 
+
 class Trace:
     def __init__(self, writer, paths, options):
         self.processes = {}
@@ -60,10 +61,10 @@ class Trace:
                 self.min = min(self.start.keys())
                 self.max = max(self.end.keys())
 
-
         # Rendering system charts depends on start and end
         # time. Provide them where the original drawing code expects
         # them, i.e. in proc_tree.
+
         class BitbakeProcessTree:
             def __init__(self, start_time, end_time):
                 self.start_time = start_time
@@ -72,7 +73,6 @@ class Trace:
         self.proc_tree = BitbakeProcessTree(min(self.start.keys()),
                                             max(self.end.keys()))
 
-
         return
 
         # Turn that parsed information into something more useful
@@ -187,6 +187,7 @@ class Trace:
                 return True
             else:
                 return False
+
         def is_idle(util, start):
             for j in range(0, len(util)):
                 if util[j][0] < start:
@@ -204,7 +205,6 @@ class Trace:
         if proc is None:
             writer.warn("no selected crop proc '%s' in list" % crop_after)
 
-
         cpu_util = [(sample.time, sample.user + sample.sys + sample.io) for sample in self.cpu_stats]
         disk_util = [(sample.time, sample.util) for sample in self.disk_stats]
 
@@ -248,15 +248,16 @@ class Trace:
         return idle
 
 
-
 class ParseError(Exception):
     """Represents errors during parse of the bootchart."""
+
     def __init__(self, value):
         self.value = value
 
     def __str__(self):
         return self.value
 
+
 def _parse_headers(file):
     """Parses the headers of the bootchart."""
     def parse(acc, line):
@@ -269,6 +270,7 @@ def _parse_headers(file):
         return headers, last
     return reduce(parse, file.read().split('\n'), (defaultdict(str), ''))[0]
 
+
 def _parse_timed_blocks(file):
     """Parses (ie., splits) a file into so-called timed-blocks. A
     timed-block consists of a timestamp on a line by itself followed
@@ -284,6 +286,7 @@ def _parse_timed_blocks(file):
     blocks = file.read().split('\n\n')
     return [parse(block) for block in blocks if block.strip() and not block.endswith(' not running\n')]
 
+
 def _parse_proc_ps_log(writer, file):
     """
      * See proc(5) for details.
@@ -334,6 +337,7 @@ def _parse_proc_ps_log(writer, file):
 
     return ProcessStats(writer, processMap, len(timed_blocks), avgSampleLength, startTime, ltime)
 
+
 def _parse_taskstats_log(writer, file):
     """
      * See bootchart-collector.c for details.
@@ -421,6 +425,7 @@ def _parse_taskstats_log(writer, file):
 
     return ProcessStats(writer, processMap, len(timed_blocks), avgSampleLength, startTime, ltime)
 
+
 def _parse_proc_stat_log(file):
     samples = []
     ltimes = None
@@ -444,12 +449,14 @@ def _parse_proc_stat_log(file):
         # skip the rest of statistics lines
     return samples
 
+
 def _parse_reduced_log(file, sample_class):
     samples = []
     for time, lines in _parse_timed_blocks(file):
         samples.append(sample_class(time, *[float(x) for x in lines[0].split()]))
     return samples
 
+
 def _parse_proc_disk_stat_log(file):
     """
     Parse file for disk stats, but only look at the whole device, eg. sda,
@@ -491,6 +498,7 @@ def _parse_proc_disk_stat_log(file):
 
     return disk_stats
 
+
 def _parse_reduced_proc_meminfo_log(file):
     """
     Parse file for global memory statistics with
@@ -510,6 +518,7 @@ def _parse_reduced_proc_meminfo_log(file):
 
     return mem_stats
 
+
 def _parse_proc_meminfo_log(file):
     """
     Parse file for global memory statistics.
@@ -534,6 +543,7 @@ def _parse_proc_meminfo_log(file):
 
     return mem_stats
 
+
 def _parse_monitor_disk_log(file):
     """
     Parse file with information about amount of diskspace used.
@@ -640,6 +650,8 @@ def _parse_dmesg(writer, file):
 # Parse binary pacct accounting file output if we have one
 # cf. /usr/include/linux/acct.h
 #
+
+
 def _parse_pacct(writer, file):
     # read LE int32
     def _read_le_int32(file):
@@ -664,6 +676,7 @@ def _parse_pacct(writer, file):
         file.seek(16, 1)         # acct_comm
     return parent_map
 
+
 def _parse_paternity_log(writer, file):
     parent_map = {}
     parent_map[0] = 0
@@ -678,6 +691,7 @@ def _parse_paternity_log(writer, file):
             print("Odd paternity line '%s'" % (line))
     return parent_map
 
+
 def _parse_cmdline_log(writer, file):
     cmdLines = {}
     for block in file.read().split('\n\n'):
@@ -693,6 +707,7 @@ def _parse_cmdline_log(writer, file):
             cmdLines[pid] = values
     return cmdLines
 
+
 def _parse_bitbake_buildstats(writer, state, filename, file):
     paths = filename.split("/")
     task = paths[-1]
@@ -707,6 +722,7 @@ def _parse_bitbake_buildstats(writer, state, filename, file):
     if start and end:
         state.add_process(pn + ":" + task, start, end)
 
+
 def get_num_cpus(headers):
     """Get the number of CPUs from the system.cpu header property. As the
     CPU utilization graphs are relative, the number of CPUs currently makes
@@ -723,6 +739,7 @@ def get_num_cpus(headers):
         return 1
     return max(int(mat.group(1)), 1)
 
+
 def _do_parse(writer, state, filename, file):
     writer.info("parsing '%s'" % filename)
     t1 = time.process_time()
@@ -749,6 +766,7 @@ def _do_parse(writer, state, filename, file):
     writer.info("  %s seconds" % str(t2 - t1))
     return state
 
+
 def parse_file(writer, state, filename):
     if state.filename is None:
         state.filename = filename
@@ -756,6 +774,7 @@ def parse_file(writer, state, filename):
     with open(filename, "r") as file:
         return _do_parse(writer, state, filename, file)
 
+
 def parse_paths(writer, state, paths):
     for path in paths:
         if state.filename is None:
@@ -789,6 +808,7 @@ def parse_paths(writer, state, paths):
             state = parse_file(writer, state, path)
     return state
 
+
 def split_res(res, options):
     """ Split the res into n pieces """
     res_list = []
diff --git a/scripts/pybootchartgui/pybootchartgui/process_tree.py b/scripts/pybootchartgui/pybootchartgui/process_tree.py
index 3e94db3f3a..35ee8f080c 100644
--- a/scripts/pybootchartgui/pybootchartgui/process_tree.py
+++ b/scripts/pybootchartgui/pybootchartgui/process_tree.py
@@ -13,6 +13,7 @@
 #  You should have received a copy of the GNU General Public License
 #  along with pybootchartgui. If not, see <http://www.gnu.org/licenses/>.
 
+
 class ProcessTree:
     """ProcessTree encapsulates a process tree.  The tree is built from log files
        retrieved during the boot process.  When building the process tree, it is
diff --git a/scripts/pybootchartgui/pybootchartgui/samples.py b/scripts/pybootchartgui/pybootchartgui/samples.py
index 301583e9aa..2b4cf15cb4 100644
--- a/scripts/pybootchartgui/pybootchartgui/samples.py
+++ b/scripts/pybootchartgui/pybootchartgui/samples.py
@@ -18,9 +18,11 @@ class DiskStatSample:
     def __init__(self, time):
         self.time = time
         self.diskdata = [0, 0, 0]
+
     def add_diskdata(self, new_diskdata):
         self.diskdata = [a + b for a, b in zip(self.diskdata, new_diskdata)]
 
+
 class CPUSample:
     def __init__(self, time, user, sys, io=0.0, swap=0.0):
         self.time = time
@@ -37,6 +39,7 @@ class CPUSample:
         return str(self.time) + "\t" + str(self.user) + "\t" + \
                str(self.sys) + "\t" + str(self.io) + "\t" + str(self.swap)
 
+
 class MemSample:
     used_values = ('MemTotal', 'MemFree', 'Buffers', 'Cached', 'SwapTotal', 'SwapFree',)
 
@@ -53,12 +56,14 @@ class MemSample:
         # discard incomplete samples
         return [v for v in MemSample.used_values if v not in keys] == []
 
+
 class DrawMemSample:
     """
     Condensed version of a MemSample with exactly the values used by the drawing code.
     Initialized either from a valid MemSample or
     a tuple/list of buffer/used/cached/swap values.
     """
+
     def __init__(self, mem_sample):
         self.time = mem_sample.time
         if isinstance(mem_sample, MemSample):
@@ -69,6 +74,7 @@ class DrawMemSample:
         else:
             self.buffers, self.used, self.cached, self.swap = mem_sample
 
+
 class DiskSpaceSample:
     def __init__(self, time):
         self.time = time
@@ -80,6 +86,7 @@ class DiskSpaceSample:
     def valid(self):
         return bool(self.records)
 
+
 class ProcessSample:
     def __init__(self, time, state, cpu_sample):
         self.time = time
@@ -89,6 +96,7 @@ class ProcessSample:
     def __str__(self):
         return str(self.time) + "\t" + str(self.state) + "\t" + str(self.cpu_sample)
 
+
 class ProcessStats:
     def __init__(self, writer, process_map, sample_count, sample_period, start_time, end_time):
         self.process_map = process_map
@@ -99,6 +107,7 @@ class ProcessStats:
         writer.info("%d samples, avg. sample length %f" % (self.sample_count, self.sample_period))
         writer.info("process list size: %d" % len(self.process_map.values()))
 
+
 class Process:
     def __init__(self, writer, pid, cmd, ppid, start_time):
         self.writer = writer
@@ -166,6 +175,7 @@ class Process:
     def get_end_time(self):
         return self.start_time + self.duration
 
+
 class DiskSample:
     def __init__(self, time, read, write, util):
         self.time = time
diff --git a/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py b/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
index 3ea3592441..2890091488 100644
--- a/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
+++ b/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
@@ -14,14 +14,17 @@ import pybootchartgui.main as main
 
 debug = False
 
+
 def floatEq(f1, f2):
 	return math.fabs(f1 - f2) < 0.00001
 
+
 bootchart_dir = os.path.join(os.path.dirname(sys.argv[0]), '../../examples/1/')
 parser = main._mk_options_parser()
 options, args = parser.parse_args(['--q', bootchart_dir])
 writer = main._mk_writer(options)
 
+
 class TestBCParser(unittest.TestCase):
     
 	def setUp(self):
@@ -105,6 +108,7 @@ class TestBCParser(unittest.TestCase):
 			self.assert_(floatEq(float(tokens[3]), sample.io))
 		stat_data.close()
 
+
 if __name__ == '__main__':
     unittest.main()
 
diff --git a/scripts/pybootchartgui/pybootchartgui/tests/process_tree_test.py b/scripts/pybootchartgui/pybootchartgui/tests/process_tree_test.py
index f9f49cc340..03cde2ef32 100644
--- a/scripts/pybootchartgui/pybootchartgui/tests/process_tree_test.py
+++ b/scripts/pybootchartgui/pybootchartgui/tests/process_tree_test.py
@@ -11,6 +11,7 @@ import pybootchartgui.main as main
 if sys.version_info >= (3, 0):
     long = int
 
+
 class TestProcessTree(unittest.TestCase):
 
     def setUp(self):
@@ -88,5 +89,6 @@ class TestProcessTree(unittest.TestCase):
         process_tree = self.processtree.process_tree
         self.checkAgainstJavaExtract(self.mk_fname('extract.processtree.3e.log'), process_tree)
 
+
 if __name__ == '__main__':
     unittest.main()
diff --git a/scripts/pythondeps b/scripts/pythondeps
index 7b41c336a1..eb36abdd2e 100755
--- a/scripts/pythondeps
+++ b/scripts/pythondeps
@@ -22,6 +22,7 @@ logger = logging.getLogger('pythondeps')
 
 suffixes = importlib.machinery.all_suffixes()
 
+
 class PythonDepError(Exception):
     pass
 
diff --git a/scripts/recipetool b/scripts/recipetool
index e2d585d2c5..79d82c954e 100755
--- a/scripts/recipetool
+++ b/scripts/recipetool
@@ -22,6 +22,7 @@ logger = scriptutils.logger_create('recipetool')
 
 plugins = []
 
+
 def tinfoil_init(parserecipes):
     import bb.tinfoil
     import logging
@@ -30,6 +31,7 @@ def tinfoil_init(parserecipes):
     tinfoil.prepare(not parserecipes)
     return tinfoil
 
+
 def main():
 
     if not os.environ.get('BUILDDIR', ''):
diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
index 4269eacb34..b4a46a8d51 100755
--- a/scripts/relocate_sdk.py
+++ b/scripts/relocate_sdk.py
@@ -29,6 +29,7 @@ else:
 
 old_prefix = re.compile(b("##DEFAULT_INSTALL_DIR##"))
 
+
 def get_arch():
     f.seek(0)
     e_ident = f.read(16)
@@ -42,6 +43,7 @@ def get_arch():
     elif ei_class == 2:
         return 64
 
+
 def parse_elf_header():
     global e_type, e_machine, e_version, e_entry, e_phoff, e_shoff, e_flags,\
            e_ehsize, e_phentsize, e_phnum, e_shentsize, e_shnum, e_shstrndx
@@ -62,6 +64,7 @@ def parse_elf_header():
     e_ehsize, e_phentsize, e_phnum, e_shentsize, e_shnum, e_shstrndx =\
         struct.unpack(hdr_fmt, elf_header[16:hdr_size])
 
+
 def change_interpreter(elf_file_name):
     if arch == 32:
         ph_fmt = "<IIIIIIII"
@@ -103,6 +106,7 @@ def change_interpreter(elf_file_name):
             f.write(dl_path)
             break
 
+
 def change_dl_sysdirs(elf_file_name):
     if arch == 32:
         sh_fmt = "<IIIIIIIIII"
@@ -200,6 +204,7 @@ def change_dl_sysdirs(elf_file_name):
         f.seek(sysdirslen_off)
         f.write(sysdirslen)
 
+
 # MAIN
 if len(sys.argv) < 4:
     sys.exit(-1)
diff --git a/scripts/resulttool b/scripts/resulttool
index fc282bda6c..b0ba87df95 100755
--- a/scripts/resulttool
+++ b/scripts/resulttool
@@ -45,6 +45,7 @@ import resulttool.manualexecution
 import resulttool.log
 logger = scriptutils.logger_create('resulttool')
 
+
 def main():
     parser = argparse_oe.ArgumentParser(description="OEQA test result manipulation tool.",
                                         epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
@@ -74,5 +75,6 @@ def main():
         parser.error_subcommand(ae.message, ae.subcommand)
     return ret
 
+
 if __name__ == "__main__":
     sys.exit(main())
diff --git a/scripts/runqemu b/scripts/runqemu
index 259d32cd2a..c5fc7fcf5a 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -20,12 +20,15 @@ import configparser
 import signal
 import time
 
+
 class RunQemuError(Exception):
     """Custom exception to raise on known errors."""
     pass
 
+
 class OEPathError(RunQemuError):
     """Custom Exception to give better guidance on missing binaries"""
+
     def __init__(self, message):
         super().__init__("In order for this script to dynamically infer paths\n \
 kernels or filesystem images, you either need bitbake in your PATH\n \
@@ -53,8 +56,10 @@ def create_logger():
 
     return logger
 
+
 logger = create_logger()
 
+
 def print_usage():
     print("""
 Usage: you can run this script with any valid combination
@@ -105,6 +110,7 @@ Examples:
   runqemu path/to/<image>-<machine>.wic.vhd
 """)
 
+
 def check_tun():
     """Check /dev/net/tun"""
     dev_tun = '/dev/net/tun'
@@ -114,6 +120,7 @@ def check_tun():
     if not os.access(dev_tun, os.W_OK):
         raise RunQemuError("TUN control device %s is not writable, please fix (e.g. sudo chmod 666 %s)" % (dev_tun, dev_tun))
 
+
 def get_first_file(cmds):
     """Return first file found in wildcard cmds"""
     for cmd in cmds:
@@ -124,6 +131,7 @@ def get_first_file(cmds):
                     return f
     return ''
 
+
 class BaseConfig(object):
     def __init__(self):
         # The self.d saved vars from self.set(), part of them are from qemuboot.conf
@@ -769,7 +777,6 @@ class BaseConfig(object):
         if not os.path.exists(self.bios):
             raise RunQemuError("KERNEL %s not found" % self.bios)
 
-
     def check_mem(self):
         """
         Both qemu and kernel needs memory settings, so check QB_MEM and set it
@@ -1595,5 +1602,6 @@ def main():
         # Deliberately ignore the return code of 'tput smam'.
         subprocess.call(["tput", "smam"])
 
+
 if __name__ == "__main__":
     sys.exit(main())
diff --git a/scripts/send-error-report b/scripts/send-error-report
index 3fa03af2cf..39b3fbd576 100755
--- a/scripts/send-error-report
+++ b/scripts/send-error-report
@@ -28,6 +28,7 @@ version = "0.3"
 log = logging.getLogger("send-error-report")
 logging.basicConfig(format='%(levelname)s: %(message)s')
 
+
 def getPayloadLimit(url):
     req = urllib.request.Request(url, None)
     try:
@@ -46,12 +47,14 @@ def getPayloadLimit(url):
 
     return 0
 
+
 def ask_for_contactdetails():
     print("Please enter your name and your email (optionally), they'll be saved in the file you send.")
     username = input("Name (required): ")
     email = input("E-mail (not required): ")
     return username, email
 
+
 def edit_content(json_file_path):
     edit = input("Review information before sending? (y/n): ")
     if 'y' in edit or 'Y' in edit:
@@ -64,6 +67,7 @@ def edit_content(json_file_path):
         return True
     return False
 
+
 def prepare_data(args):
     # attempt to get the max_log_size from the server's settings
     max_log_size = getPayloadLimit(args.protocol + args.server + "/ClientPost/JSON")
@@ -123,7 +127,6 @@ def prepare_data(args):
         if data:
             json_fp.write(data)
 
-
     if args.assume_yes == False and edit_content(args.error_file):
         #We'll need to re-read the content if we edited it
         with open(args.error_file, 'r') as json_fp:
@@ -196,8 +199,6 @@ if __name__ == '__main__':
                            dest="protocol",
                            action="store_const", const="http://", default="https://")
 
-
-
     args = arg_parse.parse_args()
 
     if (args.json == False):
diff --git a/scripts/sysroot-relativelinks.py b/scripts/sysroot-relativelinks.py
index 667d95404b..a28acb7e4e 100755
--- a/scripts/sysroot-relativelinks.py
+++ b/scripts/sysroot-relativelinks.py
@@ -16,6 +16,7 @@ if len(sys.argv) != 2:
 topdir = sys.argv[1]
 topdir = os.path.abspath(topdir)
 
+
 def handlelink(filep, subdir):
     link = os.readlink(filep)
     if link[0] != "/":
@@ -27,6 +28,7 @@ def handlelink(filep, subdir):
     os.unlink(filep)
     os.symlink(os.path.relpath(topdir + link, subdir), filep)
 
+
 for subdir, dirs, files in os.walk(topdir):
     for f in dirs + files:
         filep = os.path.join(subdir, f)
diff --git a/scripts/task-time b/scripts/task-time
index a008a0ea3d..ece4f3d898 100755
--- a/scripts/task-time
+++ b/scripts/task-time
@@ -51,6 +51,7 @@ field_regexes = (("elapsed", ".*Elapsed time: ([0-9.]+)"),
 # buildstat file and <dict> maps fields from the file to their values
 task_infos = []
 
+
 def save_times_for_task(path):
     """Saves information for the buildstat file 'path' in 'task_infos'."""
 
@@ -77,6 +78,7 @@ def save_times_for_task(path):
 
         task_infos.append((path, fields))
 
+
 def save_times_for_dir(path):
     """Runs save_times_for_task() for each file in path and its subdirs, recursively."""
 
@@ -88,21 +90,26 @@ def save_times_for_dir(path):
         for fname in files:
             save_times_for_task(os.path.join(root, fname))
 
+
 for path in args.paths:
     if os.path.isfile(path):
         save_times_for_task(path)
     else:
         save_times_for_dir(path)
 
+
 def elapsed_time(task_info):
     return task_info[1]["elapsed"]
 
+
 def tot_user_time(task_info):
     return task_info[1]["user"] + task_info[1]["child user"]
 
+
 def tot_sys_time(task_info):
     return task_info[1]["sys"] + task_info[1]["child sys"]
 
+
 if args.sort != "none":
     sort_fn = {"real": elapsed_time, "user": tot_user_time, "sys": tot_sys_time}
     task_infos.sort(key=sort_fn[args.sort], reverse=True)
diff --git a/scripts/test-remote-image b/scripts/test-remote-image
index d209d22854..35e388c598 100755
--- a/scripts/test-remote-image
+++ b/scripts/test-remote-image
@@ -47,6 +47,8 @@ if not bitbakepath:
     sys.exit(1)
 
 # create a logger
+
+
 def logger_create():
     log = logging.getLogger('hwauto')
     log.setLevel(logging.DEBUG)
@@ -66,6 +68,7 @@ def logger_create():
 
     return log
 
+
 # instantiate the logger
 log = logger_create()
 
@@ -82,6 +85,7 @@ def get_args_parser():
     parser.add_argument('--skip-download', required=False, action="store_true", dest="skip_download", default=False, help='Skip downloading the images completely. This needs the correct files to be present in the directory specified by the target profile.')
     return parser
 
+
 class BaseTargetProfile(object, metaclass=ABCMeta):
     """
     This class defines the meta profile for a specific target (MACHINE type + image type).
@@ -123,6 +127,7 @@ class BaseTargetProfile(object, metaclass=ABCMeta):
 
         return files_dict
 
+
 class AutoTargetProfile(BaseTargetProfile):
 
     def __init__(self, image_type):
@@ -201,6 +206,7 @@ class BaseRepoProfile(object, metaclass=ABCMeta):
     def fetch(self, file_name, localname=None):
         pass
 
+
 class PublicAB(BaseRepoProfile):
 
     def __init__(self, repolink, localdir=None):
@@ -225,7 +231,6 @@ class PublicAB(BaseRepoProfile):
         path += distro.replace('poky', machine) + '/'
         return path
 
-
     def fetch(self, file_name, localname=None):
         repo_path = self.get_repo_path()
         link = self.repolink + repo_path + file_name
@@ -244,6 +249,7 @@ class PublicAB(BaseRepoProfile):
         wget_cmd += " -P %s '%s'" % (localdir, link)
         runCmd(wget_cmd)
 
+
 class HwAuto():
 
     def __init__(self, image_types, repolink, required_packages, targetprofile, repoprofile, skip_download):
@@ -327,7 +333,6 @@ class HwAuto():
             sys.exit(1)
 
 
-
 def main():
 
     parser = get_args_parser()
@@ -337,6 +342,7 @@ def main():
 
     hwauto.run()
 
+
 if __name__ == "__main__":
     try:
         ret = main()
diff --git a/scripts/tiny/dirsize.py b/scripts/tiny/dirsize.py
index 8e41126183..c37b9499b3 100755
--- a/scripts/tiny/dirsize.py
+++ b/scripts/tiny/dirsize.py
@@ -14,6 +14,7 @@ import os
 import sys
 import stat
 
+
 class Record:
     def create(path):
         r = Record(path)
diff --git a/scripts/tiny/ksize.py b/scripts/tiny/ksize.py
index dbdff0714f..f122b892c7 100755
--- a/scripts/tiny/ksize.py
+++ b/scripts/tiny/ksize.py
@@ -15,6 +15,7 @@ import getopt
 import os
 from subprocess import *
 
+
 def usage():
     prog = os.path.basename(sys.argv[0])
     print('Usage: %s [OPTION]...' % prog)
diff --git a/scripts/tiny/ksum.py b/scripts/tiny/ksum.py
index e1ca4033f5..fb96e1910d 100755
--- a/scripts/tiny/ksum.py
+++ b/scripts/tiny/ksum.py
@@ -23,6 +23,7 @@ import sys
 import getopt
 from subprocess import *
 
+
 def usage():
     prog = os.path.basename(sys.argv[0])
     print('Usage: %s [OPTION]...' % prog)
@@ -31,6 +32,7 @@ def usage():
     print('')
     print('Run %s from the top-level Linux kernel build directory.' % prog)
 
+
 verbose = False
 
 n_ko_files = 0
@@ -49,6 +51,7 @@ vmlinux_data = 0
 vmlinux_bss = 0
 vmlinux_total = 0
 
+
 def is_vmlinux_file(filename):
     global vmlinux_level
     if filename == ("vmlinux") and vmlinux_level == 0:
@@ -56,11 +59,13 @@ def is_vmlinux_file(filename):
         return True
     return False
 
+
 def is_ko_file(filename):
     if filename.endswith(".ko"):
         return True
     return False
 
+
 def collect_object_files():
     print("Collecting object files recursively from %s..." % os.getcwd())
     for dirpath, dirs, files in os.walk(os.getcwd()):
@@ -72,6 +77,7 @@ def collect_object_files():
                 vmlinux_file = os.path.join(dirpath, filename)
     print("Collecting object files [DONE]")
 
+
 def add_ko_file(filename):
         p = Popen("size -t " + filename, shell=True, stdout=PIPE, stderr=PIPE)
         output = p.communicate()[0].splitlines()
@@ -88,6 +94,7 @@ def add_ko_file(filename):
             ko_total += int(sizes[3])
             n_ko_files += 1
 
+
 def get_vmlinux_totals():
         p = Popen("size -t " + vmlinux_file, shell=True, stdout=PIPE, stderr=PIPE)
         output = p.communicate()[0].splitlines()
@@ -103,10 +110,12 @@ def get_vmlinux_totals():
             vmlinux_bss += int(sizes[2])
             vmlinux_total += int(sizes[3])
 
+
 def sum_ko_files():
     for ko_file in ko_file_list:
         add_ko_file(ko_file)
 
+
 def main():
     try:
         opts, args = getopt.getopt(sys.argv[1:], "vh", ["help"])
@@ -144,6 +153,7 @@ def main():
         (vmlinux_text + ko_text, vmlinux_data + ko_data,
          vmlinux_bss + ko_bss, vmlinux_total + ko_total))
 
+
 if __name__ == "__main__":
     try:
         ret = main()
diff --git a/scripts/verify-bashisms b/scripts/verify-bashisms
index 7e44af3410..8f6a2abf1b 100755
--- a/scripts/verify-bashisms
+++ b/scripts/verify-bashisms
@@ -23,15 +23,18 @@ whitelist = (
     '. $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE'
     )
 
+
 def is_whitelisted(s):
     for w in whitelist:
         if w in s:
             return True
     return False
 
+
 SCRIPT_LINENO_RE = re.compile(r' line (\d+) ')
 BASHISM_WARNING = re.compile(r'^(possible bashism in.*)$', re.MULTILINE)
 
+
 def process(filename, function, lineno, script):
     import tempfile
 
@@ -83,6 +86,7 @@ def process(filename, function, lineno, script):
         else:
             return None
 
+
 def get_tinfoil():
     scripts_path = os.path.dirname(os.path.realpath(__file__))
     lib_path = scripts_path + '/lib'
@@ -95,6 +99,7 @@ def get_tinfoil():
     # tinfoil.logger.setLevel(logging.WARNING)
     return tinfoil
 
+
 if __name__ == '__main__':
     import argparse
     import shutil
@@ -155,7 +160,6 @@ if __name__ == '__main__':
                             attributes = (filename or realfn, key, lineno)
                             scripts.setdefault(attributes, script)
 
-
     print("Scanning scripts...\n")
     for result in pool.imap(func, scripts.items()):
         if result:
diff --git a/scripts/wic b/scripts/wic
index 6c62f9e84e..ccfd61cea8 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -72,8 +72,10 @@ def wic_logger():
 
     return logger
 
+
 logger = wic_logger()
 
+
 def rootfs_dir_to_args(krootfs_dir):
     """
     Get a rootfs_dir dict and serialize to string
@@ -236,6 +238,7 @@ def wic_ls_subcommand(args, usage_str):
     """
     engine.wic_ls(args, args.native_sysroot)
 
+
 def wic_cp_subcommand(args, usage_str):
     """
     Command-line handling for copying files/dirs to images.
@@ -243,6 +246,7 @@ def wic_cp_subcommand(args, usage_str):
     """
     engine.wic_cp(args, args.native_sysroot)
 
+
 def wic_rm_subcommand(args, usage_str):
     """
     Command-line handling for removing files/dirs from images.
@@ -250,6 +254,7 @@ def wic_rm_subcommand(args, usage_str):
     """
     engine.wic_rm(args, args.native_sysroot)
 
+
 def wic_write_subcommand(args, usage_str):
     """
     Command-line handling for writing images.
@@ -257,6 +262,7 @@ def wic_write_subcommand(args, usage_str):
     """
     engine.wic_write(args, args.native_sysroot)
 
+
 def wic_help_subcommand(args, usage_str):
     """
     Command-line handling for help subcommand to keep the current
@@ -360,6 +366,7 @@ def wic_init_parser_list(subparser):
                              "defined inside the .wks file")
     return
 
+
 def imgtype(arg):
     """
     Custom type for ArgumentParser
@@ -380,18 +387,21 @@ def imgtype(arg):
 
     return namedtuple('ImgType', 'image part path')(image, part, path)
 
+
 def wic_init_parser_ls(subparser):
     subparser.add_argument("path", type=imgtype,
                         help="image spec: <image>[:<vfat partition>[<path>]]")
     subparser.add_argument("-n", "--native-sysroot",
                         help="path to the native sysroot containing the tools")
 
+
 def imgpathtype(arg):
     img = imgtype(arg)
     if img.part is None:
         raise argparse.ArgumentTypeError("partition number is not specified")
     return img
 
+
 def wic_init_parser_cp(subparser):
     subparser.add_argument("src",
                         help="image spec: <image>:<vfat partition>[<path>] or <file>")
@@ -400,6 +410,7 @@ def wic_init_parser_cp(subparser):
     subparser.add_argument("-n", "--native-sysroot",
                         help="path to the native sysroot containing the tools")
 
+
 def wic_init_parser_rm(subparser):
     subparser.add_argument("path", type=imgpathtype,
                         help="path: <image>:<vfat partition><path>")
@@ -409,6 +420,7 @@ def wic_init_parser_rm(subparser):
                         help="remove directories and their contents recursively, "
                         " this only applies to ext* partition")
 
+
 def expandtype(rules):
     """
     Custom type for ArgumentParser
@@ -440,6 +452,7 @@ def expandtype(rules):
 
     return result
 
+
 def wic_init_parser_write(subparser):
     subparser.add_argument("image",
                         help="path to the wic image")
@@ -450,6 +463,7 @@ def wic_init_parser_write(subparser):
     subparser.add_argument("-n", "--native-sysroot",
                         help="path to the native sysroot containing the tools")
 
+
 def wic_init_parser_help(subparser):
     helpparsers = subparser.add_subparsers(dest='help_topic', help=hlp.wic_usage)
     for helptopic in helptopics:
@@ -500,10 +514,12 @@ def init_parser(parser):
         subparser = subparsers.add_parser(subcmd, help=subcommands[subcmd][2])
         subcommands[subcmd][3](subparser)
 
+
 class WicArgumentParser(argparse.ArgumentParser):
      def format_help(self):
          return hlp.wic_help
 
+
 def main(argv):
     parser = WicArgumentParser(
         description="wic version %s" % __version__)
diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index 58f180e889..fd68c1a230 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -32,6 +32,7 @@ CASES_PATHS = [os.path.join(os.path.abspath(os.path.dirname(__file__)),
                 'lib', 'checklayer', 'cases')]
 logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
+
 def test_layer(td, layer, test_software_layer_signatures):
     from checklayer.context import CheckLayerTestContext
     logger.info("Starting to analyze: %s" % layer['name'])
@@ -41,6 +42,7 @@ def test_layer(td, layer, test_software_layer_signatures):
     tc.loadTests(CASES_PATHS)
     return tc.runTests()
 
+
 def main():
     parser = argparse.ArgumentParser(
             description="Yocto Project layer checking tool",
@@ -122,6 +124,7 @@ def main():
         return 1
 
     shutil.copyfile(bblayersconf, bblayersconf + '.backup')
+
     def cleanup_bblayers(signum, frame):
         shutil.copyfile(bblayersconf + '.backup', bblayersconf)
         os.unlink(bblayersconf + '.backup')
@@ -217,6 +220,7 @@ def main():
 
     return ret
 
+
 if __name__ == '__main__':
     try:
         ret = main()
-- 
2.32.0

