Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.8586.1624975708944831203
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jun 2021 07:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k4Rdb/9m;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id v13so10968096ple.9
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Jun 2021 07:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=pa5JFkxKylybi9eh/WEYV3sq18cTiVTRtEaOo4qT8OM=;
        b=k4Rdb/9mFScNIBU7coopvVBTNaOJAvTEbT6MiqiTTrguSk3UR73grv8vEExgbMPY+B
         YZJPAIsdvMt6xViBUsTsGevikyNkcdmloK7zo5uDyGJYml8GqK/jAu3ptOIZoc67qqN9
         Xt4C+z8jwFzSaeoRhzsboMEgt9sXmADULBNWMgvFdgk8f5/wXnDa9QInOiQTIImjdw+L
         QtqD0xadxt/RmdZKWkt/kM2+UBS9dhwEZOxRdNWA9X1+pWRiwAhGcouYVmMygp8Gu3Xt
         GeM2n1TvfaTxIO54OpUNXE2AnktZv03GRZHBNjbCV2ljNk4mMQdR9k711nK7/X5+kGGn
         tzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=pa5JFkxKylybi9eh/WEYV3sq18cTiVTRtEaOo4qT8OM=;
        b=IMD2AVSNjTbWyUuUjHeoxDZctzORjcJq7MefNU5cCmvTh3um4tMk84qTxHeY5TQM9a
         JFfpNR13J2PQc3sBQJZ4kW3nYsG6mIystxaBNMfS1ofI4oC+3RnAPXncTOWFclR6hmVl
         qsYxS9s4CN7KtoTw8lsSDo4d9Gn5rXXsTLIh8Ic0qEfFTifIng3TPK3g7YqMWWxeu3wK
         TBavhz7rLocaDLojHacJMpSVqYBrIlN/A2tqRSn2hDcYssjOCWeQlYcOkXOF4lel+7I5
         Wz9/zL7cq2Z+3xWQNBSe4dSsj7d59xH6bVurB9j3LvNG/u/KQkNOqMEjSujFlqdWctVq
         0UyA==
X-Gm-Message-State: AOAM531H+Z3CI4uXHz/sq/LdjFgqiNRVpPT8WROql3xrkUmoPQvvsk8Z
	M6mqTJRbOUdij2Q2Ue01u2u43lRB+NQcTg==
X-Google-Smtp-Source: ABdhPJzvF0jDy6t1OWy554vWe06vam2n57kcBwUuP4zC00SfA1xx67YMvx4HBi8JyO1h57xPI00BTQ==
X-Received: by 2002:a17:902:9007:b029:129:82a:f11 with SMTP id a7-20020a1709029007b0290129082a0f11mr1644334plp.76.1624975708172;
        Tue, 29 Jun 2021 07:08:28 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:3418:5ced:5b3e:373c])
        by smtp.gmail.com with ESMTPSA id h1sm3383373pji.14.2021.06.29.07.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 07:08:27 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: persianpros@yahoo.com
Subject: [PATCH 0/8] Safe PEP8
Date: Tue, 29 Jun 2021 07:08:18 -0700
Message-Id: <20210629140826.13243-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

I am forwarding a pull request;
https://github.com/openembedded/openembedded-core/pull/71

for inclusion to help the python script comply to PEP8.

persianpros (8):
  PEP8 double aggressive E401
  PEP8 double aggressive E701, E70 and E502
  PEP8 double aggressive E251 and E252
  PEP8 double aggressive E20 and E211
  PEP8 double aggressive E22, E224, E241, E242 and E27
  PEP8 double aggressive E225 ~ E228 and E231
  PEP8 double aggressive E301 ~ E306
  PEP8 double aggressive W291 ~ W293 and W391

 contrib/git-hooks/sendemail-validate.sample   |   1 -
 meta-selftest/lib/devtool/bbpath.py           |  11 +-
 meta-selftest/lib/devtool/test.py             |   2 +
 .../lib/oeqa/runtime/cases/dnf_runtime.py     |   9 +-
 .../lib/oeqa/runtime/cases/selftest.py        |   1 +
 meta-selftest/lib/oeqa/runtime/cases/virgl.py |   7 +-
 .../lib/oeqa/selftest/cases/external-layer.py |   2 +-
 meta-selftest/lib/recipetool/bbpath.py        |  13 +-
 meta/files/ext-sdk-prepare.py                 |   5 +
 meta/lib/bblayers/create.py                   |   6 +-
 meta/lib/buildstats.py                        |  10 +-
 meta/lib/oe/buildhistory_analysis.py          |  49 +--
 meta/lib/oe/cachedpath.py                     |   7 +-
 meta/lib/oe/classextend.py                    |  14 +-
 meta/lib/oe/classutils.py                     |   3 +
 meta/lib/oe/copy_buildsystem.py               |   9 +-
 meta/lib/oe/cve_check.py                      |  10 +-
 meta/lib/oe/data.py                           |   6 +-
 meta/lib/oe/distro_check.py                   |  37 +-
 meta/lib/oe/elf.py                            | 205 ++++++------
 meta/lib/oe/gpg_sign.py                       |  13 +-
 meta/lib/oe/license.py                        |  23 +-
 meta/lib/oe/lsb.py                            |   9 +-
 meta/lib/oe/maketype.py                       |   7 +
 meta/lib/oe/manifest.py                       |   5 +-
 meta/lib/oe/package.py                        |  23 +-
 meta/lib/oe/package_manager/__init__.py       |  29 +-
 meta/lib/oe/package_manager/deb/__init__.py   |  12 +-
 meta/lib/oe/package_manager/deb/manifest.py   |   1 +
 meta/lib/oe/package_manager/deb/rootfs.py     |   7 +-
 meta/lib/oe/package_manager/deb/sdk.py        |   2 +-
 meta/lib/oe/package_manager/ipk/__init__.py   |   9 +-
 meta/lib/oe/package_manager/ipk/manifest.py   |   2 +
 meta/lib/oe/package_manager/ipk/rootfs.py     |  10 +-
 meta/lib/oe/package_manager/ipk/sdk.py        |   1 +
 meta/lib/oe/package_manager/rpm/__init__.py   |  41 +--
 meta/lib/oe/package_manager/rpm/manifest.py   |   2 +
 meta/lib/oe/package_manager/rpm/rootfs.py     |   3 +-
 meta/lib/oe/package_manager/rpm/sdk.py        |   1 +
 meta/lib/oe/packagedata.py                    |  12 +
 meta/lib/oe/packagegroup.py                   |   6 +
 meta/lib/oe/patch.py                          |  50 +--
 meta/lib/oe/path.py                           |  25 +-
 meta/lib/oe/prservice.py                      |  21 +-
 meta/lib/oe/qa.py                             |  30 +-
 meta/lib/oe/recipeutils.py                    |  28 +-
 meta/lib/oe/reproducible.py                   |   7 +-
 meta/lib/oe/rootfs.py                         |   9 +-
 meta/lib/oe/sdk.py                            |  18 +-
 meta/lib/oe/sstatesig.py                      |  28 +-
 meta/lib/oe/terminal.py                       |  32 +-
 meta/lib/oe/types.py                          |  15 +-
 meta/lib/oe/useradd.py                        |   5 +
 meta/lib/oe/utils.py                          |  59 +++-
 meta/lib/oeqa/buildperf/base.py               |   2 -
 meta/lib/oeqa/buildperf/test_basic.py         |   1 +
 meta/lib/oeqa/controllers/masterimage.py      |   3 +-
 meta/lib/oeqa/controllers/testtargetloader.py |  12 +-
 meta/lib/oeqa/core/case.py                    |  20 +-
 .../lib/oeqa/core/cases/example/test_basic.py |   2 +
 meta/lib/oeqa/core/context.py                 |  12 +-
 meta/lib/oeqa/core/decorator/__init__.py      |   6 +-
 meta/lib/oeqa/core/decorator/data.py          |  19 +-
 meta/lib/oeqa/core/decorator/depends.py       |  11 +-
 meta/lib/oeqa/core/decorator/oetimeout.py     |   2 +
 meta/lib/oeqa/core/exception.py               |   7 +
 meta/lib/oeqa/core/loader.py                  |  26 +-
 meta/lib/oeqa/core/runner.py                  |  33 +-
 meta/lib/oeqa/core/target/__init__.py         |   1 +
 meta/lib/oeqa/core/target/qemu.py             |   5 +-
 meta/lib/oeqa/core/target/ssh.py              |  12 +-
 meta/lib/oeqa/core/tests/cases/data.py        |   3 +-
 meta/lib/oeqa/core/tests/cases/depends.py     |   1 +
 .../core/tests/cases/loader/valid/another.py  |   1 +
 meta/lib/oeqa/core/tests/cases/oetag.py       |   3 +-
 meta/lib/oeqa/core/tests/cases/timeout.py     |   2 +-
 meta/lib/oeqa/core/tests/common.py            |   2 +
 meta/lib/oeqa/core/tests/test_data.py         |   6 +-
 meta/lib/oeqa/core/tests/test_decorators.py   |  12 +-
 meta/lib/oeqa/core/tests/test_loader.py       |   2 +
 meta/lib/oeqa/core/tests/test_runner.py       |   2 +
 meta/lib/oeqa/core/utils/concurrencytest.py   |  41 ++-
 meta/lib/oeqa/core/utils/misc.py              |   7 +
 meta/lib/oeqa/core/utils/path.py              |   3 +-
 meta/lib/oeqa/core/utils/test.py              |  11 +
 meta/lib/oeqa/oetest.py                       |  36 +-
 meta/lib/oeqa/runexported.py                  |  13 +-
 meta/lib/oeqa/runtime/case.py                 |   1 +
 meta/lib/oeqa/runtime/cases/_qemutiny.py      |   1 +
 meta/lib/oeqa/runtime/cases/apt.py            |   4 +-
 meta/lib/oeqa/runtime/cases/boot.py           |   5 +-
 meta/lib/oeqa/runtime/cases/buildcpio.py      |   3 +-
 .../lib/oeqa/runtime/cases/buildgalculator.py |   3 +-
 meta/lib/oeqa/runtime/cases/buildlzip.py      |   4 +-
 meta/lib/oeqa/runtime/cases/connman.py        |   1 +
 meta/lib/oeqa/runtime/cases/date.py           |   1 +
 meta/lib/oeqa/runtime/cases/df.py             |   5 +-
 meta/lib/oeqa/runtime/cases/dnf.py            |  29 +-
 .../oeqa/runtime/cases/ethernet_ip_connman.py |  27 +-
 meta/lib/oeqa/runtime/cases/gcc.py            |   1 +
 meta/lib/oeqa/runtime/cases/gi.py             |   1 +
 meta/lib/oeqa/runtime/cases/gstreamer.py      |   1 +
 meta/lib/oeqa/runtime/cases/kernelmodule.py   |   1 +
 meta/lib/oeqa/runtime/cases/ksample.py        |   5 +-
 meta/lib/oeqa/runtime/cases/ldd.py            |   1 +
 meta/lib/oeqa/runtime/cases/logrotate.py      |  29 +-
 meta/lib/oeqa/runtime/cases/ltp.py            |  21 +-
 meta/lib/oeqa/runtime/cases/ltp_compliance.py |  19 +-
 meta/lib/oeqa/runtime/cases/ltp_stress.py     |  16 +-
 meta/lib/oeqa/runtime/cases/multilib.py       |   1 +
 meta/lib/oeqa/runtime/cases/oe_syslog.py      |  15 +-
 meta/lib/oeqa/runtime/cases/opkg.py           |   8 +-
 meta/lib/oeqa/runtime/cases/pam.py            |   9 +-
 meta/lib/oeqa/runtime/cases/parselogs.py      |  45 +--
 meta/lib/oeqa/runtime/cases/perl.py           |   1 +
 meta/lib/oeqa/runtime/cases/ping.py           |   5 +-
 meta/lib/oeqa/runtime/cases/ptest.py          |   5 +-
 meta/lib/oeqa/runtime/cases/python.py         |   1 +
 meta/lib/oeqa/runtime/cases/rpm.py            |   7 +-
 meta/lib/oeqa/runtime/cases/rtc.py            |   6 +-
 meta/lib/oeqa/runtime/cases/runlevel.py       |   9 +-
 meta/lib/oeqa/runtime/cases/scons.py          |   1 +
 meta/lib/oeqa/runtime/cases/scp.py            |   5 +-
 meta/lib/oeqa/runtime/cases/skeletoninit.py   |   3 +-
 meta/lib/oeqa/runtime/cases/ssh.py            |   1 +
 meta/lib/oeqa/runtime/cases/stap.py           |   1 +
 meta/lib/oeqa/runtime/cases/storage.py        |  28 +-
 meta/lib/oeqa/runtime/cases/suspend.py        |  19 +-
 meta/lib/oeqa/runtime/cases/systemd.py        |  15 +-
 meta/lib/oeqa/runtime/cases/terminal.py       |   5 +-
 meta/lib/oeqa/runtime/cases/usb_hid.py        |  15 +-
 meta/lib/oeqa/runtime/cases/weston.py         |   5 +-
 meta/lib/oeqa/runtime/cases/x32lib.py         |   1 +
 meta/lib/oeqa/runtime/cases/xorg.py           |   3 +-
 meta/lib/oeqa/runtime/context.py              |  13 +-
 meta/lib/oeqa/runtime/decorator/package.py    |   2 +
 meta/lib/oeqa/runtime/loader.py               |   1 +
 .../oeqa/runtime/utils/targetbuildproject.py  |   1 +
 meta/lib/oeqa/sdk/case.py                     |   6 +-
 meta/lib/oeqa/sdk/cases/assimp.py             |   1 +
 meta/lib/oeqa/sdk/cases/buildcpio.py          |   2 +
 meta/lib/oeqa/sdk/cases/buildepoxy.py         |   2 +
 meta/lib/oeqa/sdk/cases/buildgalculator.py    |   4 +-
 meta/lib/oeqa/sdk/cases/buildlzip.py          |   7 +-
 meta/lib/oeqa/sdk/cases/gcc.py                |   7 +-
 meta/lib/oeqa/sdk/cases/perl.py               |   1 +
 meta/lib/oeqa/sdk/cases/python.py             |   5 +-
 meta/lib/oeqa/sdk/context.py                  |  15 +-
 meta/lib/oeqa/sdk/testsdk.py                  |   7 +-
 meta/lib/oeqa/sdk/utils/sdkbuildproject.py    |   1 +
 meta/lib/oeqa/sdkext/case.py                  |   3 +-
 meta/lib/oeqa/sdkext/cases/devtool.py         |  10 +-
 meta/lib/oeqa/sdkext/context.py               |   3 +
 meta/lib/oeqa/sdkext/testsdk.py               |   8 +-
 meta/lib/oeqa/selftest/case.py                |  12 +-
 meta/lib/oeqa/selftest/cases/archiver.py      |  11 +-
 meta/lib/oeqa/selftest/cases/bblayers.py      |  19 +-
 meta/lib/oeqa/selftest/cases/bbtests.py       |  36 +-
 meta/lib/oeqa/selftest/cases/binutils.py      |   5 +-
 meta/lib/oeqa/selftest/cases/buildoptions.py  |  28 +-
 .../lib/oeqa/selftest/cases/containerimage.py |   8 +-
 meta/lib/oeqa/selftest/cases/cve_check.py     |  41 +--
 meta/lib/oeqa/selftest/cases/devtool.py       |  47 ++-
 meta/lib/oeqa/selftest/cases/distrodata.py    |   1 +
 meta/lib/oeqa/selftest/cases/eSDK.py          |   6 +-
 .../oeqa/selftest/cases/efibootpartition.py   |   1 +
 meta/lib/oeqa/selftest/cases/fetch.py         |   1 +
 meta/lib/oeqa/selftest/cases/fitimage.py      |  29 +-
 meta/lib/oeqa/selftest/cases/gcc.py           |  23 +-
 meta/lib/oeqa/selftest/cases/glibc.py         |  11 +-
 meta/lib/oeqa/selftest/cases/gotoolchain.py   |   2 +-
 meta/lib/oeqa/selftest/cases/image_typedep.py |   3 +-
 meta/lib/oeqa/selftest/cases/imagefeatures.py |  10 +-
 .../oeqa/selftest/cases/incompatible_lic.py   |   4 +-
 .../oeqa/selftest/cases/kerneldevelopment.py  |   4 +-
 meta/lib/oeqa/selftest/cases/layerappend.py   |   1 +
 meta/lib/oeqa/selftest/cases/liboe.py         |   1 +
 meta/lib/oeqa/selftest/cases/lic_checksum.py  |   1 +
 meta/lib/oeqa/selftest/cases/manifest.py      |  54 +--
 meta/lib/oeqa/selftest/cases/meta_ide.py      |   5 +-
 meta/lib/oeqa/selftest/cases/multiconfig.py   |   1 +
 .../oeqa/selftest/cases/oelib/buildhistory.py |  25 +-
 meta/lib/oeqa/selftest/cases/oelib/elf.py     |   1 +
 meta/lib/oeqa/selftest/cases/oelib/license.py |   5 +
 meta/lib/oeqa/selftest/cases/oelib/path.py    |  56 ++--
 meta/lib/oeqa/selftest/cases/oelib/types.py   |   2 +
 meta/lib/oeqa/selftest/cases/oelib/utils.py   |   2 +
 meta/lib/oeqa/selftest/cases/oescripts.py     |  15 +-
 meta/lib/oeqa/selftest/cases/package.py       |  26 +-
 meta/lib/oeqa/selftest/cases/pkgdata.py       |  59 ++--
 meta/lib/oeqa/selftest/cases/prservice.py     |   2 +-
 meta/lib/oeqa/selftest/cases/pseudo.py        |   1 +
 meta/lib/oeqa/selftest/cases/recipetool.py    |   3 +-
 meta/lib/oeqa/selftest/cases/recipeutils.py   |  19 +-
 meta/lib/oeqa/selftest/cases/reproducible.py  |   9 +-
 .../oeqa/selftest/cases/resulttooltests.py    |   2 +-
 meta/lib/oeqa/selftest/cases/runcmd.py        |   2 +
 meta/lib/oeqa/selftest/cases/runqemu.py       |   9 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py  |  25 +-
 meta/lib/oeqa/selftest/cases/selftest.py      |   4 +-
 meta/lib/oeqa/selftest/cases/signing.py       |   4 +-
 meta/lib/oeqa/selftest/cases/sstatetests.py   |  40 ++-
 meta/lib/oeqa/selftest/cases/sysroot.py       |   5 +-
 meta/lib/oeqa/selftest/cases/tinfoil.py       |   5 +-
 meta/lib/oeqa/selftest/cases/wic.py           |  90 ++---
 meta/lib/oeqa/selftest/context.py             |  15 +-
 meta/lib/oeqa/targetcontrol.py                |  48 +--
 meta/lib/oeqa/utils/__init__.py               |  19 +-
 meta/lib/oeqa/utils/buildproject.py           |   1 +
 meta/lib/oeqa/utils/commands.py               |  12 +-
 meta/lib/oeqa/utils/decorators.py             |  53 ++-
 meta/lib/oeqa/utils/dump.py                   |   4 +
 meta/lib/oeqa/utils/ftools.py                 |   4 +
 meta/lib/oeqa/utils/git.py                    |   4 +-
 meta/lib/oeqa/utils/gitarchive.py             |  10 +-
 meta/lib/oeqa/utils/httpserver.py             |   7 +-
 meta/lib/oeqa/utils/logparser.py              |   4 +-
 meta/lib/oeqa/utils/metadata.py               |   5 +
 meta/lib/oeqa/utils/network.py                |   3 +-
 meta/lib/oeqa/utils/nfs.py                    |  10 +-
 meta/lib/oeqa/utils/package_manager.py        |  15 +-
 meta/lib/oeqa/utils/qemurunner.py             |  31 +-
 meta/lib/oeqa/utils/qemutinyrunner.py         |  19 +-
 meta/lib/oeqa/utils/sshcontrol.py             |  12 +-
 meta/lib/oeqa/utils/subprocesstweak.py        |   2 +
 meta/lib/oeqa/utils/targetbuild.py            |   2 +
 meta/lib/oeqa/utils/testexport.py             |  42 ++-
 meta/lib/rootfspostcommands.py                |   3 +
 .../glibc/glibc/check-test-wrapper            |   5 +-
 .../systemd/systemd-systemctl/systemctl       |   4 +-
 .../meson/meson/meson-setup.py                |   3 +
 .../python-numpy/files/run-ptest              |   1 -
 .../python3/check_build_completeness.py       |   5 +-
 .../python/python3/create_manifest3.py        |  50 ++-
 .../python/python3/get_module_deps3.py        |  44 +--
 .../python/python3/reformat_sysconfig.py      |   1 -
 .../texinfo-dummy/template.py                 |   4 +-
 .../perf/perf/sort-pmuevents.py               |  47 ++-
 meta/recipes-rt/rt-tests/files/rt_bmark.py    |  70 ++--
 scripts/bitbake-whatchanged                   |  21 +-
 scripts/buildhistory-collect-srcrevs          |  13 +-
 scripts/buildhistory-diff                     |   7 +-
 scripts/buildstats-diff                       |   8 +-
 scripts/combo-layer                           | 113 ++++---
 scripts/contrib/bbvars.py                     |   5 +
 scripts/contrib/devtool-stress.py             |   2 +
 scripts/contrib/graph-tool                    |   1 +
 scripts/contrib/image-manifest                |  25 +-
 scripts/contrib/list-packageconfig-flags.py   |  20 +-
 scripts/contrib/oe-build-perf-report-email.py |   1 +
 scripts/contrib/patchreview.py                |  18 +-
 scripts/contrib/verify-homepage.py            |   7 +-
 scripts/cp-noerror                            |   4 +-
 scripts/crosstap                              |   9 +-
 scripts/devtool                               |   5 +-
 scripts/gen-lockedsig-cache                   |   8 +
 scripts/install-buildtools                    |   4 +-
 scripts/lib/argparse_oe.py                    |   5 +
 scripts/lib/build_perf/__init__.py            |   2 +-
 scripts/lib/build_perf/report.py              |   4 +-
 scripts/lib/buildstats.py                     |   9 +-
 scripts/lib/checklayer/__init__.py            |  20 +-
 scripts/lib/checklayer/case.py                |   1 +
 scripts/lib/checklayer/cases/bsp.py           |  12 +-
 scripts/lib/checklayer/cases/common.py        |   5 +-
 scripts/lib/checklayer/cases/distro.py        |   7 +-
 scripts/lib/checklayer/context.py             |   1 +
 scripts/lib/devtool/__init__.py               |  17 +
 scripts/lib/devtool/build.py                  |   3 +
 scripts/lib/devtool/build_image.py            |   4 +
 scripts/lib/devtool/deploy.py                 |   5 +-
 scripts/lib/devtool/export.py                 |   5 +-
 scripts/lib/devtool/import.py                 |   2 +
 scripts/lib/devtool/menuconfig.py             |  18 +-
 scripts/lib/devtool/package.py                |   2 +
 scripts/lib/devtool/runqemu.py                |   2 +
 scripts/lib/devtool/sdk.py                    |  13 +-
 scripts/lib/devtool/search.py                 |   3 +-
 scripts/lib/devtool/standard.py               |  59 +++-
 scripts/lib/devtool/upgrade.py                |  35 +-
 scripts/lib/devtool/utilcmds.py               |   1 +
 scripts/lib/recipetool/append.py              |  11 +-
 scripts/lib/recipetool/create.py              |  26 +-
 scripts/lib/recipetool/create_buildsys.py     |  11 +-
 .../lib/recipetool/create_buildsys_python.py  |   2 +-
 scripts/lib/recipetool/create_kernel.py       |   3 +
 scripts/lib/recipetool/create_kmod.py         |   2 +
 scripts/lib/recipetool/create_npm.py          |   5 +-
 scripts/lib/recipetool/setvar.py              |   2 +
 scripts/lib/resulttool/log.py                 |   5 +-
 scripts/lib/resulttool/manualexecution.py     |  18 +-
 scripts/lib/resulttool/merge.py               |   2 +
 scripts/lib/resulttool/regression.py          |   7 +-
 scripts/lib/resulttool/report.py              |  19 +-
 scripts/lib/resulttool/resultutils.py         |  17 +-
 scripts/lib/resulttool/store.py               |   5 +-
 scripts/lib/scriptpath.py                     |   2 +
 scripts/lib/scriptutils.py                    |  13 +-
 scripts/lib/wic/__init__.py                   |   1 +
 scripts/lib/wic/engine.py                     |  27 +-
 scripts/lib/wic/filemap.py                    |  15 +-
 scripts/lib/wic/help.py                       |   1 +
 scripts/lib/wic/ksparser.py                   |  18 +-
 scripts/lib/wic/misc.py                       |  19 +-
 scripts/lib/wic/partition.py                  |   4 +-
 scripts/lib/wic/pluginbase.py                 |   4 +
 scripts/lib/wic/plugins/imager/direct.py      |  27 +-
 .../wic/plugins/source/bootimg-biosplusefi.py |   7 +-
 scripts/lib/wic/plugins/source/bootimg-efi.py |   4 +-
 .../wic/plugins/source/bootimg-partition.py   |   5 +-
 .../lib/wic/plugins/source/bootimg-pcbios.py  |   1 +
 scripts/lib/wic/plugins/source/empty.py       |   1 +
 .../wic/plugins/source/isoimage-isohybrid.py  |  11 +-
 scripts/lib/wic/plugins/source/rawcopy.py     |   1 +
 scripts/lib/wic/plugins/source/rootfs.py      |   3 +-
 scripts/lnr                                   |   3 +-
 scripts/oe-build-perf-report                  |   8 +-
 scripts/oe-build-perf-test                    |   2 +-
 scripts/oe-depends-dot                        |  20 +-
 scripts/oe-git-archive                        |   3 +
 scripts/oe-pkgdata-browser                    |  21 +-
 scripts/oe-pkgdata-util                       |  18 +-
 scripts/oe-publish-sdk                        |   3 +
 scripts/oe-selftest                           |   3 +-
 scripts/oe-test                               |   2 +
 scripts/oe-trim-schemas                       |   8 +-
 scripts/oepydevshell-internal.py              |  10 +-
 scripts/opkg-query-helper.py                  |   9 +-
 .../pybootchartgui/pybootchartgui/batch.py    |  22 +-
 scripts/pybootchartgui/pybootchartgui/draw.py | 315 ++++++++++--------
 scripts/pybootchartgui/pybootchartgui/gui.py  |  51 +--
 .../pybootchartgui/pybootchartgui/main.py.in  |  22 +-
 .../pybootchartgui/pybootchartgui/parsing.py  | 156 +++++----
 .../pybootchartgui/process_tree.py            |  21 +-
 .../pybootchartgui/pybootchartgui/samples.py  |  36 +-
 .../pybootchartgui/tests/parser_test.py       |  28 +-
 .../pybootchartgui/tests/process_tree_test.py |   8 +-
 scripts/pythondeps                            |   5 +-
 scripts/recipetool                            |   2 +
 scripts/relocate_sdk.py                       |  28 +-
 scripts/resulttool                            |   2 +
 scripts/runqemu                               |  42 ++-
 scripts/send-error-report                     |  22 +-
 scripts/sysroot-relativelinks.py              |   6 +-
 scripts/task-time                             |  21 +-
 scripts/test-remote-image                     |  10 +-
 scripts/tiny/dirsize.py                       |   3 +-
 scripts/tiny/ksize.py                         |  23 +-
 scripts/tiny/ksum.py                          |  22 +-
 scripts/verify-bashisms                       |  17 +-
 scripts/wic                                   |  48 ++-
 scripts/yocto-check-layer                     |  12 +-
 352 files changed, 3090 insertions(+), 1845 deletions(-)

-- 
2.17.1

