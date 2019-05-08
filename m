Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id D0FE67DE42
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 17:47:17 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id m20so2414946wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 10:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=wKlUiE2wdXojxnsluN1f3m3CzM3WKk1hi2jyX5FN+no=;
	b=Ya6kC2pZFggrcIEU9qzupvwk85oxjo9f7Y4/suw5Q3u0nKSg/qxu+iBNqG9Sr4d7qW
	F65p8/P21YiZl9ZSe/GJ2eZrLjguaD0hhpuzeIUTjryRjOGyOPDwp8wm8AJDUZTvgojB
	DIbXIAH/i5nxu2ZahtO/nYuD/4ze+y+76lEDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wKlUiE2wdXojxnsluN1f3m3CzM3WKk1hi2jyX5FN+no=;
	b=kJXZ5o93WEnHYjqCDxFNHq7cyebVFyt2xIivoMu7pfzyUGpjb9KhLuokCSN90sg+19
	A0bdNUV0heHO1saqh82iQEQYmANVKM9kyeSU9GLH8Fk4jiw3HSqopONQ8yLX4TYqhoge
	A4M6x2WOyf3FoL1m1Dtpi8BKEAz0tS83zd++gQP8tPHUeWUxr0yW30sqOLXtadBSzf2x
	MTkSAE2mNk3EdPpmiWR94lnPyVIgJm1ym1uST6Kue1pdqZHc0Txe0+QWrPYl0qtk+8tj
	HRodFMyVAZaYRn+wEBBC5vDZ3M0f7i4NubyoCHzyCDCjzPpvayjSL/pen3/Ixa4fyvne
	wE9g==
X-Gm-Message-State: APjAAAXaRyk1HTqPLuN4V/o4sg3jrmMlAdgktkfWnGIa9WZ4E84Zu29v
	KyFA/Dbp8fSCVj7R+F+3XsiHBnAT10Y=
X-Google-Smtp-Source: APXvYqxuyYuxRId3NcyWWtB5Dn9v7I8fWHTuZRm0gWqQiRWiixG/jbl52NqsW9Phb/b0TXl0sqCzvg==
X-Received: by 2002:a1c:f504:: with SMTP id t4mr3881654wmh.121.1557337636237; 
	Wed, 08 May 2019 10:47:16 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g10sm4429732wrw.80.2019.05.08.10.47.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 10:47:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 18:47:05 +0100
Message-Id: <20190508174705.5353-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190508174705.5353-1-richard.purdie@linuxfoundation.org>
References: <20190508174705.5353-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] meta/lib+scripts: Convert to SPDX license headers
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
X-List-Received-Date: Wed, 08 May 2019 17:47:18 -0000
Content-Transfer-Encoding: 8bit

This adds SPDX license headers in place of the wide assortment of things
currently in our script headers. We default to GPL-2.0-only except for the
oeqa code where it was clearly submitted and marked as MIT on the most part
or some scripts which had the "or later" GPL versioning.

The patch also drops other obsolete bits of file headers where they were
encoountered such as editor modelines, obsolete maintainer information or
the phrase "All rights reserved" which is now obsolete and not required in
copyright headers (in this case its actually confusing for licensing as all
rights were not reserved).

More work is needed for OE-Core but this takes care of the bulk of the scripts
and meta/lib directories.

The top level LICENSE files are tweaked to match the new structure and the
SPDX naming.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 LICENSE                                       | 24 +++++---
 meta/COPYING.GPLv2 => LICENSE.GPL-2.0-only    | 61 ++-----------------
 meta-selftest/COPYING.MIT => LICENSE.MIT      | 12 +++-
 meta-skeleton/COPYING.MIT                     | 17 ------
 meta/lib/bblayers/create.py                   |  4 ++
 meta/lib/buildstats.py                        |  3 +
 meta/lib/oe/__init__.py                       |  4 ++
 meta/lib/oe/buildhistory_analysis.py          |  2 +
 meta/lib/oe/cachedpath.py                     |  2 +
 meta/lib/oe/classextend.py                    |  4 ++
 meta/lib/oe/classutils.py                     |  3 +
 meta/lib/oe/copy_buildsystem.py               |  3 +
 meta/lib/oe/data.py                           |  4 ++
 meta/lib/oe/distro_check.py                   |  4 ++
 meta/lib/oe/elf.py                            |  4 ++
 meta/lib/oe/gpg_sign.py                       |  4 ++
 meta/lib/oe/license.py                        |  4 +-
 meta/lib/oe/lsb.py                            |  4 ++
 meta/lib/oe/maketype.py                       |  3 +
 meta/lib/oe/manifest.py                       |  4 ++
 meta/lib/oe/package.py                        |  4 ++
 meta/lib/oe/package_manager.py                |  4 ++
 meta/lib/oe/packagedata.py                    |  4 ++
 meta/lib/oe/packagegroup.py                   |  4 ++
 meta/lib/oe/patch.py                          |  4 ++
 meta/lib/oe/path.py                           |  4 ++
 meta/lib/oe/prservice.py                      |  3 +
 meta/lib/oe/qa.py                             |  4 ++
 meta/lib/oe/recipeutils.py                    |  2 +
 meta/lib/oe/rootfs.py                         |  3 +
 meta/lib/oe/sdk.py                            |  4 ++
 meta/lib/oe/sstatesig.py                      |  3 +
 meta/lib/oe/terminal.py                       |  3 +
 meta/lib/oe/types.py                          |  4 ++
 meta/lib/oe/useradd.py                        |  3 +
 meta/lib/oe/utils.py                          |  4 ++
 meta/lib/oeqa/buildperf/__init__.py           |  8 +--
 meta/lib/oeqa/buildperf/base.py               |  9 +--
 meta/lib/oeqa/buildperf/test_basic.py         |  9 +--
 meta/lib/oeqa/controllers/__init__.py         |  3 +
 meta/lib/oeqa/controllers/masterimage.py      |  4 +-
 meta/lib/oeqa/controllers/testtargetloader.py |  4 ++
 meta/lib/oeqa/core/case.py                    |  5 +-
 .../lib/oeqa/core/cases/example/test_basic.py |  4 +-
 meta/lib/oeqa/core/context.py                 |  6 +-
 meta/lib/oeqa/core/decorator/__init__.py      |  5 +-
 meta/lib/oeqa/core/decorator/data.py          |  5 +-
 meta/lib/oeqa/core/decorator/depends.py       |  5 +-
 meta/lib/oeqa/core/decorator/oetag.py         |  5 +-
 meta/lib/oeqa/core/decorator/oetimeout.py     |  5 +-
 meta/lib/oeqa/core/exception.py               |  5 +-
 meta/lib/oeqa/core/loader.py                  |  5 +-
 meta/lib/oeqa/core/runner.py                  |  5 +-
 meta/lib/oeqa/core/target/__init__.py         |  5 +-
 meta/lib/oeqa/core/target/qemu.py             |  5 +-
 meta/lib/oeqa/core/target/ssh.py              |  5 +-
 meta/lib/oeqa/core/tests/cases/data.py        |  5 +-
 meta/lib/oeqa/core/tests/cases/depends.py     |  5 +-
 .../core/tests/cases/loader/valid/another.py  |  5 +-
 meta/lib/oeqa/core/tests/cases/oetag.py       |  5 +-
 meta/lib/oeqa/core/tests/cases/timeout.py     |  5 +-
 meta/lib/oeqa/core/tests/common.py            |  5 +-
 meta/lib/oeqa/core/tests/test_data.py         |  4 +-
 meta/lib/oeqa/core/tests/test_decorators.py   |  6 +-
 meta/lib/oeqa/core/tests/test_loader.py       |  6 +-
 meta/lib/oeqa/core/tests/test_runner.py       |  6 +-
 meta/lib/oeqa/core/utils/concurrencytest.py   |  2 +
 meta/lib/oeqa/core/utils/misc.py              |  5 +-
 meta/lib/oeqa/core/utils/path.py              |  5 +-
 meta/lib/oeqa/core/utils/test.py              |  5 +-
 meta/lib/oeqa/oetest.py                       |  4 +-
 meta/lib/oeqa/runexported.py                  |  6 +-
 meta/lib/oeqa/runtime/case.py                 |  5 +-
 meta/lib/oeqa/runtime/cases/_qemutiny.py      |  4 ++
 meta/lib/oeqa/runtime/cases/apt.py            |  4 ++
 meta/lib/oeqa/runtime/cases/buildcpio.py      |  4 ++
 .../lib/oeqa/runtime/cases/buildgalculator.py |  4 ++
 meta/lib/oeqa/runtime/cases/buildlzip.py      |  4 ++
 meta/lib/oeqa/runtime/cases/connman.py        |  4 ++
 meta/lib/oeqa/runtime/cases/date.py           |  4 ++
 meta/lib/oeqa/runtime/cases/df.py             |  4 ++
 meta/lib/oeqa/runtime/cases/dnf.py            |  4 ++
 meta/lib/oeqa/runtime/cases/gcc.py            |  4 ++
 meta/lib/oeqa/runtime/cases/gi.py             |  4 ++
 meta/lib/oeqa/runtime/cases/gstreamer.py      |  4 ++
 meta/lib/oeqa/runtime/cases/kernelmodule.py   |  4 ++
 meta/lib/oeqa/runtime/cases/ksample.py        |  4 ++
 meta/lib/oeqa/runtime/cases/ldd.py            |  4 ++
 meta/lib/oeqa/runtime/cases/logrotate.py      |  4 ++
 meta/lib/oeqa/runtime/cases/ltp.py            | 10 +--
 meta/lib/oeqa/runtime/cases/ltp_compliance.py |  9 +--
 meta/lib/oeqa/runtime/cases/multilib.py       |  4 ++
 meta/lib/oeqa/runtime/cases/oe_syslog.py      |  4 ++
 meta/lib/oeqa/runtime/cases/opkg.py           |  4 ++
 meta/lib/oeqa/runtime/cases/pam.py            |  4 ++
 meta/lib/oeqa/runtime/cases/parselogs.py      |  4 ++
 meta/lib/oeqa/runtime/cases/perl.py           |  4 ++
 meta/lib/oeqa/runtime/cases/ping.py           |  4 ++
 meta/lib/oeqa/runtime/cases/ptest.py          |  4 ++
 meta/lib/oeqa/runtime/cases/python.py         |  4 ++
 meta/lib/oeqa/runtime/cases/rpm.py            |  4 ++
 meta/lib/oeqa/runtime/cases/scp.py            |  4 ++
 meta/lib/oeqa/runtime/cases/skeletoninit.py   |  4 ++
 meta/lib/oeqa/runtime/cases/ssh.py            |  4 ++
 meta/lib/oeqa/runtime/cases/stap.py           |  4 ++
 meta/lib/oeqa/runtime/cases/systemd.py        |  4 ++
 meta/lib/oeqa/runtime/cases/x32lib.py         |  4 ++
 meta/lib/oeqa/runtime/cases/xorg.py           |  4 ++
 meta/lib/oeqa/runtime/context.py              |  5 +-
 meta/lib/oeqa/runtime/decorator/package.py    |  5 +-
 meta/lib/oeqa/runtime/loader.py               |  5 +-
 .../oeqa/runtime/utils/targetbuildproject.py  |  5 +-
 meta/lib/oeqa/sdk/case.py                     |  5 +-
 meta/lib/oeqa/sdk/cases/assimp.py             |  4 ++
 meta/lib/oeqa/sdk/cases/buildcpio.py          |  4 ++
 meta/lib/oeqa/sdk/cases/buildepoxy.py         |  4 ++
 meta/lib/oeqa/sdk/cases/buildgalculator.py    |  4 ++
 meta/lib/oeqa/sdk/cases/buildlzip.py          |  4 ++
 meta/lib/oeqa/sdk/cases/gcc.py                |  4 ++
 meta/lib/oeqa/sdk/cases/perl.py               |  4 ++
 meta/lib/oeqa/sdk/cases/python.py             |  4 ++
 meta/lib/oeqa/sdk/context.py                  |  5 +-
 meta/lib/oeqa/sdk/testsdk.py                  |  5 +-
 meta/lib/oeqa/sdk/utils/sdkbuildproject.py    |  5 +-
 meta/lib/oeqa/sdkext/case.py                  |  5 +-
 meta/lib/oeqa/sdkext/cases/devtool.py         |  5 +-
 meta/lib/oeqa/sdkext/context.py               |  5 +-
 meta/lib/oeqa/sdkext/testsdk.py               |  5 +-
 meta/lib/oeqa/selftest/case.py                |  5 +-
 .../selftest/cases/_sstatetests_noauto.py     |  4 ++
 meta/lib/oeqa/selftest/cases/archiver.py      |  4 ++
 meta/lib/oeqa/selftest/cases/bblayers.py      |  4 ++
 meta/lib/oeqa/selftest/cases/bbtests.py       |  4 ++
 meta/lib/oeqa/selftest/cases/buildhistory.py  |  4 ++
 meta/lib/oeqa/selftest/cases/buildoptions.py  |  4 ++
 .../lib/oeqa/selftest/cases/containerimage.py |  4 ++
 meta/lib/oeqa/selftest/cases/devtool.py       |  4 ++
 meta/lib/oeqa/selftest/cases/distrodata.py    |  4 ++
 meta/lib/oeqa/selftest/cases/eSDK.py          |  4 ++
 .../oeqa/selftest/cases/efibootpartition.py   |  2 +
 meta/lib/oeqa/selftest/cases/fetch.py         |  4 ++
 meta/lib/oeqa/selftest/cases/gotoolchain.py   |  4 ++
 meta/lib/oeqa/selftest/cases/image_typedep.py |  4 ++
 meta/lib/oeqa/selftest/cases/imagefeatures.py |  4 ++
 meta/lib/oeqa/selftest/cases/layerappend.py   |  4 ++
 meta/lib/oeqa/selftest/cases/liboe.py         |  4 ++
 meta/lib/oeqa/selftest/cases/lic_checksum.py  |  4 ++
 meta/lib/oeqa/selftest/cases/manifest.py      |  4 ++
 meta/lib/oeqa/selftest/cases/meta_ide.py      |  4 ++
 meta/lib/oeqa/selftest/cases/multiconfig.py   |  4 ++
 .../oeqa/selftest/cases/oelib/buildhistory.py |  4 ++
 meta/lib/oeqa/selftest/cases/oelib/elf.py     |  4 ++
 meta/lib/oeqa/selftest/cases/oelib/license.py |  4 ++
 meta/lib/oeqa/selftest/cases/oelib/path.py    |  4 ++
 meta/lib/oeqa/selftest/cases/oelib/types.py   |  4 ++
 meta/lib/oeqa/selftest/cases/oelib/utils.py   |  4 ++
 meta/lib/oeqa/selftest/cases/oescripts.py     |  4 ++
 meta/lib/oeqa/selftest/cases/package.py       |  4 ++
 meta/lib/oeqa/selftest/cases/pkgdata.py       |  4 ++
 meta/lib/oeqa/selftest/cases/prservice.py     |  4 ++
 meta/lib/oeqa/selftest/cases/recipetool.py    |  4 ++
 meta/lib/oeqa/selftest/cases/recipeutils.py   |  4 ++
 .../oeqa/selftest/cases/resulttooltests.py    |  4 ++
 meta/lib/oeqa/selftest/cases/runcmd.py        |  4 ++
 meta/lib/oeqa/selftest/cases/runqemu.py       |  2 +
 meta/lib/oeqa/selftest/cases/runtime_test.py  |  4 ++
 meta/lib/oeqa/selftest/cases/selftest.py      |  4 ++
 meta/lib/oeqa/selftest/cases/signing.py       |  4 ++
 meta/lib/oeqa/selftest/cases/sstate.py        |  4 ++
 meta/lib/oeqa/selftest/cases/sstatetests.py   |  4 ++
 meta/lib/oeqa/selftest/cases/tinfoil.py       |  4 ++
 meta/lib/oeqa/selftest/cases/wic.py           | 16 +----
 meta/lib/oeqa/selftest/context.py             |  5 +-
 meta/lib/oeqa/targetcontrol.py                |  4 +-
 meta/lib/oeqa/utils/__init__.py               |  3 +
 meta/lib/oeqa/utils/buildproject.py           |  4 +-
 meta/lib/oeqa/utils/commands.py               |  4 +-
 meta/lib/oeqa/utils/decorators.py             |  4 +-
 meta/lib/oeqa/utils/dump.py                   |  4 ++
 meta/lib/oeqa/utils/ftools.py                 |  4 ++
 meta/lib/oeqa/utils/git.py                    |  2 +-
 meta/lib/oeqa/utils/gitarchive.py             |  9 +--
 meta/lib/oeqa/utils/httpserver.py             |  4 ++
 meta/lib/oeqa/utils/logparser.py              |  3 +
 meta/lib/oeqa/utils/metadata.py               |  2 +-
 meta/lib/oeqa/utils/network.py                |  4 ++
 meta/lib/oeqa/utils/package_manager.py        |  4 ++
 meta/lib/oeqa/utils/qemurunner.py             |  4 +-
 meta/lib/oeqa/utils/qemutinyrunner.py         |  4 +-
 meta/lib/oeqa/utils/sshcontrol.py             |  5 +-
 meta/lib/oeqa/utils/subprocesstweak.py        |  3 +
 meta/lib/oeqa/utils/targetbuild.py            |  4 +-
 meta/lib/oeqa/utils/testexport.py             |  4 +-
 meta/lib/rootfspostcommands.py                |  4 ++
 oe-init-build-env                             | 13 +---
 scripts/autobuilder-worker-prereq-tests       |  2 +-
 scripts/bitbake-prserv-tool                   |  3 +
 scripts/bitbake-whatchanged                   | 12 +---
 scripts/buildhistory-collect-srcrevs          | 12 +---
 scripts/buildhistory-diff                     |  3 +
 scripts/buildstats-diff                       | 10 +--
 scripts/combo-layer                           | 12 +---
 scripts/combo-layer-hook-default.sh           |  3 +
 scripts/contrib/bb-perf/bb-matrix-plot.sh     | 15 +----
 scripts/contrib/bb-perf/bb-matrix.sh          | 15 +----
 scripts/contrib/bb-perf/buildstats-plot.sh    | 15 +----
 scripts/contrib/bb-perf/buildstats.sh         | 15 +----
 scripts/contrib/bbvars.py                     | 14 +----
 scripts/contrib/build-perf-test-wrapper.sh    | 10 +--
 scripts/contrib/ddimage                       |  3 +
 scripts/contrib/devtool-stress.py             | 13 +---
 scripts/contrib/dialog-power-control          |  2 +
 scripts/contrib/documentation-audit.sh        |  3 +-
 scripts/contrib/graph-tool                    | 13 +---
 scripts/contrib/list-packageconfig-flags.py   | 15 +----
 scripts/contrib/oe-build-perf-report-email.py | 10 +--
 scripts/contrib/patchreview.py                |  3 +
 scripts/contrib/patchtest.sh                  | 18 +-----
 scripts/contrib/serdevtry                     |  3 +-
 scripts/contrib/test_build_time.sh            | 16 +----
 scripts/contrib/test_build_time_worker.sh     |  4 +-
 scripts/contrib/uncovered                     | 15 +----
 scripts/contrib/verify-homepage.py            |  4 +-
 scripts/cp-noerror                            |  2 +
 scripts/create-pull-request                   | 15 +----
 scripts/crosstap                              | 13 +---
 scripts/devtool                               | 12 +---
 scripts/gen-lockedsig-cache                   |  3 +
 scripts/gen-site-config                       | 12 +---
 scripts/lib/argparse_oe.py                    |  4 ++
 scripts/lib/build_perf/__init__.py            |  9 +--
 scripts/lib/build_perf/html.py                |  9 +--
 scripts/lib/build_perf/report.py              |  9 +--
 scripts/lib/buildstats.py                     |  9 +--
 scripts/lib/checklayer/__init__.py            |  4 +-
 scripts/lib/checklayer/case.py                |  4 +-
 scripts/lib/checklayer/cases/bsp.py           |  4 +-
 scripts/lib/checklayer/cases/common.py        |  4 +-
 scripts/lib/checklayer/cases/distro.py        |  4 +-
 scripts/lib/checklayer/context.py             |  4 +-
 scripts/lib/devtool/__init__.py               | 12 +---
 scripts/lib/devtool/build.py                  | 12 +---
 scripts/lib/devtool/build_image.py            | 12 +---
 scripts/lib/devtool/build_sdk.py              | 12 +---
 scripts/lib/devtool/deploy.py                 | 12 +---
 scripts/lib/devtool/export.py                 | 12 +---
 scripts/lib/devtool/import.py                 | 12 +---
 scripts/lib/devtool/package.py                | 12 +---
 scripts/lib/devtool/runqemu.py                | 12 +---
 scripts/lib/devtool/sdk.py                    | 12 +---
 scripts/lib/devtool/search.py                 | 12 +---
 scripts/lib/devtool/standard.py               | 12 +---
 scripts/lib/devtool/upgrade.py                | 13 +---
 scripts/lib/devtool/utilcmds.py               | 12 +---
 scripts/lib/recipetool/append.py              | 12 +---
 scripts/lib/recipetool/create.py              | 12 +---
 scripts/lib/recipetool/create_buildsys.py     | 12 +---
 .../lib/recipetool/create_buildsys_python.py  | 12 +---
 scripts/lib/recipetool/create_kernel.py       | 12 +---
 scripts/lib/recipetool/create_kmod.py         | 12 +---
 scripts/lib/recipetool/create_npm.py          | 12 +---
 scripts/lib/recipetool/edit.py                | 12 +---
 scripts/lib/recipetool/newappend.py           | 12 +---
 scripts/lib/recipetool/setvar.py              | 12 +---
 scripts/lib/resulttool/log.py                 |  9 +--
 scripts/lib/resulttool/manualexecution.py     | 10 +--
 scripts/lib/resulttool/merge.py               | 10 +--
 scripts/lib/resulttool/regression.py          | 10 +--
 scripts/lib/resulttool/report.py              | 10 +--
 scripts/lib/resulttool/resultutils.py         | 10 +--
 scripts/lib/resulttool/store.py               | 10 +--
 scripts/lib/scriptpath.py                     | 12 +---
 scripts/lib/scriptutils.py                    | 12 +---
 scripts/lib/wic/__init__.py                   | 12 +---
 scripts/lib/wic/engine.py                     | 16 +----
 scripts/lib/wic/filemap.py                    |  9 +--
 scripts/lib/wic/help.py                       | 17 +-----
 scripts/lib/wic/ksparser.py                   | 15 +----
 scripts/lib/wic/misc.py                       | 16 +----
 scripts/lib/wic/partition.py                  | 16 +----
 scripts/lib/wic/pluginbase.py                 | 12 +---
 scripts/lib/wic/plugins/imager/direct.py      | 16 +----
 scripts/lib/wic/plugins/source/bootimg-efi.py | 16 +----
 .../wic/plugins/source/bootimg-partition.py   | 15 +----
 .../lib/wic/plugins/source/bootimg-pcbios.py  | 16 +----
 .../wic/plugins/source/isoimage-isohybrid.py  | 15 +----
 scripts/lib/wic/plugins/source/rawcopy.py     | 15 +----
 scripts/lib/wic/plugins/source/rootfs.py      | 16 +----
 scripts/lnr                                   |  3 +
 scripts/multilib_header_wrapper.h             | 18 +-----
 scripts/native-intercept/chown                |  3 +
 scripts/oe-build-perf-report                  | 10 +--
 scripts/oe-build-perf-test                    | 11 +---
 scripts/oe-buildenv-internal                  | 13 +---
 scripts/oe-check-sstate                       | 12 +---
 scripts/oe-depends-dot                        | 12 +---
 scripts/oe-find-native-sysroot                | 12 +---
 scripts/oe-git-archive                        | 10 +--
 scripts/oe-git-proxy                          |  3 +-
 scripts/oe-gnome-terminal-phonehome           |  2 +
 scripts/oe-pkgdata-util                       | 13 +---
 scripts/oe-publish-sdk                        | 16 +----
 scripts/oe-pylint                             |  2 +
 scripts/oe-run-native                         | 14 +----
 scripts/oe-selftest                           | 12 +---
 scripts/oe-setup-builddir                     | 13 +---
 scripts/oe-test                               |  4 +-
 scripts/oe-trim-schemas                       |  3 +
 scripts/oepydevshell-internal.py              |  3 +
 scripts/opkg-query-helper.py                  | 15 +----
 .../postinst-intercepts/delay_to_first_boot   |  4 ++
 .../postinst-intercepts/postinst_intercept    |  2 +
 scripts/postinst-intercepts/update_font_cache |  3 +
 .../update_gio_module_cache                   |  3 +
 .../update_gtk_immodules_cache                |  3 +
 scripts/postinst-intercepts/update_icon_cache |  3 +
 .../postinst-intercepts/update_pixbuf_cache   |  3 +
 scripts/postinst-intercepts/update_udev_hwdb  |  3 +
 scripts/pythondeps                            |  2 +
 scripts/recipetool                            | 12 +---
 scripts/relocate_sdk.py                       | 13 +---
 scripts/resulttool                            |  9 +--
 scripts/rpm2cpio.sh                           |  1 -
 scripts/runqemu                               | 12 +---
 scripts/runqemu-addptable2image               | 14 +----
 scripts/runqemu-export-rootfs                 | 12 +---
 scripts/runqemu-extract-sdk                   | 12 +---
 scripts/runqemu-gen-tapdevs                   | 12 +---
 scripts/runqemu-ifdown                        | 12 +---
 scripts/runqemu-ifup                          | 12 +---
 scripts/send-error-report                     |  3 +
 scripts/send-pull-request                     | 15 +----
 scripts/sstate-cache-management.sh            | 13 +---
 scripts/sstate-diff-machines.sh               |  4 +-
 scripts/sstate-sysroot-cruft.sh               |  4 +-
 scripts/sysroot-relativelinks.py              |  4 ++
 scripts/task-time                             |  3 +
 scripts/test-reexec                           | 15 +----
 scripts/test-remote-image                     | 14 +----
 scripts/tiny/dirsize.py                       | 16 +----
 scripts/tiny/ksize.py                         | 16 +----
 scripts/tiny/ksum.py                          | 16 +----
 scripts/verify-bashisms                       |  3 +
 scripts/wic                                   | 16 +----
 scripts/yocto-check-layer                     |  4 +-
 scripts/yocto-check-layer-wrapper             |  4 +-
 346 files changed, 973 insertions(+), 1463 deletions(-)
 rename meta/COPYING.GPLv2 => LICENSE.GPL-2.0-only (84%)
 rename meta-selftest/COPYING.MIT => LICENSE.MIT (77%)
 delete mode 100644 meta-skeleton/COPYING.MIT

diff --git a/LICENSE b/LICENSE
index 21fa6e6bdfd..d20dc59fb4f 100644
--- a/LICENSE
+++ b/LICENSE
@@ -1,14 +1,20 @@
 Different components of OpenEmbedded are under different licenses (a mix
-of MIT and GPLv2). Please see:
-
-meta/COPYING.GPLv2 (GPLv2)
-meta/COPYING.MIT (MIT)
-meta-selftest/COPYING.MIT (MIT)
-meta-skeleton/COPYING.MIT (MIT)
+of MIT and GPLv2). See LICENSE.GPL-2.0-only and LICENSE.MIT for further 
+details of the individual licenses.
 
 All metadata is MIT licensed unless otherwise stated. Source code
-included in tree for individual recipes is under the LICENSE stated in
-the associated recipe (.bb file) unless otherwise stated.
+included in tree for individual recipes (e.g. patches) are under 
+the LICENSE stated in the associated recipe (.bb file) unless 
+otherwise stated.
 
 License information for any other files is either explicitly stated 
-or defaults to GPL version 2.
+or defaults to GPL version 2 only.
+
+Individual files contain the following style tags instead of the full license 
+text to identify their license:
+
+    SPDX-License-Identifier: GPL-2.0-only
+    SPDX-License-Identifier: MIT
+
+This enables machine processing of license information based on the SPDX
+License Identifiers that are here available: http://spdx.org/licenses/
diff --git a/meta/COPYING.GPLv2 b/LICENSE.GPL-2.0-only
similarity index 84%
rename from meta/COPYING.GPLv2
rename to LICENSE.GPL-2.0-only
index d511905c164..5db3c0a21cd 100644
--- a/meta/COPYING.GPLv2
+++ b/LICENSE.GPL-2.0-only
@@ -279,61 +279,10 @@ POSSIBILITY OF SUCH DAMAGES.
 
 		     END OF TERMS AND CONDITIONS
 
-	    How to Apply These Terms to Your New Programs
+Note:
+Individual files contain the following tag instead of the full license text.
 
-  If you develop a new program, and you want it to be of the greatest
-possible use to the public, the best way to achieve this is to make it
-free software which everyone can redistribute and change under these terms.
+    SPDX-License-Identifier: GPL-2.0-only
 
-  To do so, attach the following notices to the program.  It is safest
-to attach them to the start of each source file to most effectively
-convey the exclusion of warranty; and each file should have at least
-the "copyright" line and a pointer to where the full notice is found.
-
-    <one line to give the program's name and a brief idea of what it does.>
-    Copyright (C) <year>  <name of author>
-
-    This program is free software; you can redistribute it and/or modify
-    it under the terms of the GNU General Public License as published by
-    the Free Software Foundation; either version 2 of the License, or
-    (at your option) any later version.
-
-    This program is distributed in the hope that it will be useful,
-    but WITHOUT ANY WARRANTY; without even the implied warranty of
-    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-    GNU General Public License for more details.
-
-    You should have received a copy of the GNU General Public License along
-    with this program; if not, write to the Free Software Foundation, Inc.,
-    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-
-Also add information on how to contact you by electronic and paper mail.
-
-If the program is interactive, make it output a short notice like this
-when it starts in an interactive mode:
-
-    Gnomovision version 69, Copyright (C) year name of author
-    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
-    This is free software, and you are welcome to redistribute it
-    under certain conditions; type `show c' for details.
-
-The hypothetical commands `show w' and `show c' should show the appropriate
-parts of the General Public License.  Of course, the commands you use may
-be called something other than `show w' and `show c'; they could even be
-mouse-clicks or menu items--whatever suits your program.
-
-You should also get your employer (if you work as a programmer) or your
-school, if any, to sign a "copyright disclaimer" for the program, if
-necessary.  Here is a sample; alter the names:
-
-  Yoyodyne, Inc., hereby disclaims all copyright interest in the program
-  `Gnomovision' (which makes passes at compilers) written by James Hacker.
-
-  <signature of Ty Coon>, 1 April 1989
-  Ty Coon, President of Vice
-
-This General Public License does not permit incorporating your program into
-proprietary programs.  If your program is a subroutine library, you may
-consider it more useful to permit linking proprietary applications with the
-library.  If this is what you want to do, use the GNU Lesser General
-Public License instead of this License.
+This enables machine processing of license information based on the SPDX
+License Identifiers that are here available: http://spdx.org/licenses/
diff --git a/meta-selftest/COPYING.MIT b/LICENSE.MIT
similarity index 77%
rename from meta-selftest/COPYING.MIT
rename to LICENSE.MIT
index 89de354795e..a6919eb7e1f 100644
--- a/meta-selftest/COPYING.MIT
+++ b/LICENSE.MIT
@@ -13,5 +13,13 @@ IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-THE SOFTWARE.
+OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+SOFTWARE.
+
+Note:
+Individual files contain the following tag instead of the full license text.
+
+    SPDX-License-Identifier: MIT
+
+This enables machine processing of license information based on the SPDX
+License Identifiers that are here available: http://spdx.org/licenses/
diff --git a/meta-skeleton/COPYING.MIT b/meta-skeleton/COPYING.MIT
deleted file mode 100644
index fb950dc69fe..00000000000
--- a/meta-skeleton/COPYING.MIT
+++ /dev/null
@@ -1,17 +0,0 @@
-Permission is hereby granted, free of charge, to any person obtaining a copy 
-of this software and associated documentation files (the "Software"), to deal 
-in the Software without restriction, including without limitation the rights 
-to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
-copies of the Software, and to permit persons to whom the Software is 
-furnished to do so, subject to the following conditions:
-
-The above copyright notice and this permission notice shall be included in 
-all copies or substantial portions of the Software.
-
-THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
-IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
-FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
-AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
-LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
-OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
-THE SOFTWARE.
diff --git a/meta/lib/bblayers/create.py b/meta/lib/bblayers/create.py
index 2ebf151ad18..542f31fc813 100644
--- a/meta/lib/bblayers/create.py
+++ b/meta/lib/bblayers/create.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 import logging
 import os
 import sys
diff --git a/meta/lib/buildstats.py b/meta/lib/buildstats.py
index c5d4c73cf52..8627ed3c314 100644
--- a/meta/lib/buildstats.py
+++ b/meta/lib/buildstats.py
@@ -1,3 +1,6 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 # Implements system state sampling. Called by buildstats.bbclass.
 # Because it is a real Python module, it can hold persistent state,
 # like open log files and the time of the last sampling.
diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py
index 3ad9513f40e..4e7c09da04c 100644
--- a/meta/lib/oe/__init__.py
+++ b/meta/lib/oe/__init__.py
@@ -1,2 +1,6 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 from pkgutil import extend_path
 __path__ = extend_path(__path__, __name__)
diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index d3cde4f6509..62c7a2e58ea 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -3,6 +3,8 @@
 # Copyright (C) 2012-2013, 2016-2017 Intel Corporation
 # Author: Paul Eggleton <paul.eggleton@linux.intel.com>
 #
+# SPDX-License-Identifier: GPL-2.0-only
+#
 # Note: requires GitPython 0.3.1+
 #
 # You can use this from the command line by running scripts/buildhistory-diff
diff --git a/meta/lib/oe/cachedpath.py b/meta/lib/oe/cachedpath.py
index 0840cc4c3fc..254257a83f4 100644
--- a/meta/lib/oe/cachedpath.py
+++ b/meta/lib/oe/cachedpath.py
@@ -1,4 +1,6 @@
 #
+# SPDX-License-Identifier: GPL-2.0-only
+#
 # Based on standard python library functions but avoid
 # repeated stat calls. Its assumed the files will not change from under us
 # so we can cache stat calls.
diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
index 662707b8595..e25122e815b 100644
--- a/meta/lib/oe/classextend.py
+++ b/meta/lib/oe/classextend.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 import collections
 
 class ClassExtender(object):
diff --git a/meta/lib/oe/classutils.py b/meta/lib/oe/classutils.py
index 45cd5249bec..08bb66b3652 100644
--- a/meta/lib/oe/classutils.py
+++ b/meta/lib/oe/classutils.py
@@ -1,3 +1,6 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 
 class ClassRegistryMeta(type):
     """Give each ClassRegistry their own registry"""
diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index 7cb784cf8c4..5b96121ddb0 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -1,3 +1,6 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 # This class should provide easy access to the different aspects of the
 # buildsystem such as layers, bitbake location, etc.
 #
diff --git a/meta/lib/oe/data.py b/meta/lib/oe/data.py
index b8901e63f52..602130a9046 100644
--- a/meta/lib/oe/data.py
+++ b/meta/lib/oe/data.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 import json
 import oe.maketype
 
diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index e775c3a6ecd..88e46c354d2 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 def create_socket(url, d):
     import urllib
     from bb.utils import export_proxies
diff --git a/meta/lib/oe/elf.py b/meta/lib/oe/elf.py
index 4cc9a9a0972..2562cea1dd1 100644
--- a/meta/lib/oe/elf.py
+++ b/meta/lib/oe/elf.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 def machine_dict(d):
 #           TARGET_OS  TARGET_ARCH   MACHINE, OSABI, ABIVERSION, Little Endian, 32bit?
     machdata = {
diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index ccd5aee4207..a95d2ba34c6 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 """Helper module for GPG signing"""
 import os
 
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index 04f5b316a9b..c1274a61dec 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -1,4 +1,6 @@
-# vi:sts=4:sw=4:et
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 """Code for parsing OpenEmbedded license strings"""
 
 import ast
diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index 71c0992c5d0..4f2b419edce 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 def get_os_release():
     """Get all key-value pairs from /etc/os-release as a dict"""
     from collections import OrderedDict
diff --git a/meta/lib/oe/maketype.py b/meta/lib/oe/maketype.py
index c36e7b56046..d929c8b3e54 100644
--- a/meta/lib/oe/maketype.py
+++ b/meta/lib/oe/maketype.py
@@ -1,3 +1,6 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 """OpenEmbedded variable typing support
 
 Types are defined in the metadata by name, using the 'type' flag on a
diff --git a/meta/lib/oe/manifest.py b/meta/lib/oe/manifest.py
index 674303c8666..f7c88f9a098 100644
--- a/meta/lib/oe/manifest.py
+++ b/meta/lib/oe/manifest.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 from abc import ABCMeta, abstractmethod
 import os
 import re
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 6e83f01f148..b59513227ba 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 import stat
 import mmap
 import subprocess
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 2835c1ddf8e..06feb4def72 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 from abc import ABCMeta, abstractmethod
 import os
 import glob
diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index 32e5c82a948..cbde380b034 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 import codecs
 import os
 
diff --git a/meta/lib/oe/packagegroup.py b/meta/lib/oe/packagegroup.py
index 4bc5d3e4bb2..2419cbb6d34 100644
--- a/meta/lib/oe/packagegroup.py
+++ b/meta/lib/oe/packagegroup.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 import itertools
 
 def is_optional(feature, d):
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index f43cf047c06..d8e4ef53989 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 import oe.path
 import oe.types
 
diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index c09eda5c424..fa209b9795b 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 import errno
 import glob
 import shutil
diff --git a/meta/lib/oe/prservice.py b/meta/lib/oe/prservice.py
index 32dfc15e884..b1132ccb110 100644
--- a/meta/lib/oe/prservice.py
+++ b/meta/lib/oe/prservice.py
@@ -1,3 +1,6 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 
 def prserv_make_conn(d, check = False):
     import prserv.serv
diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index 59c72ce5807..21066c4dc3b 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 import os, struct, mmap
 
 class NotELFFileError(Exception):
diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 4ca200d8344..1e5b9a49f9d 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -4,6 +4,8 @@
 #
 # Copyright (C) 2013-2017 Intel Corporation
 #
+# SPDX-License-Identifier: GPL-2.0-only
+#
 
 import sys
 import os
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index b7c0b9c24b9..9358f562c80 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -1,3 +1,6 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 from abc import ABCMeta, abstractmethod
 from oe.utils import execute_pre_post_process
 from oe.package_manager import *
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 878ee1647ff..b4fbdb799ef 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 from abc import ABCMeta, abstractmethod
 from oe.utils import execute_pre_post_process
 from oe.manifest import *
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index a83af519ec1..417943db902 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -1,3 +1,6 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 import bb.siggen
 import oe
 
diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index e4045559fc4..9bda3efdc7a 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -1,3 +1,6 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 import logging
 import oe.classutils
 import shlex
diff --git a/meta/lib/oe/types.py b/meta/lib/oe/types.py
index 1eebba5a384..77ee7ee5412 100644
--- a/meta/lib/oe/types.py
+++ b/meta/lib/oe/types.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 import errno
 import re
 import os
diff --git a/meta/lib/oe/useradd.py b/meta/lib/oe/useradd.py
index 179ac76b5e6..bedfe0ecb53 100644
--- a/meta/lib/oe/useradd.py
+++ b/meta/lib/oe/useradd.py
@@ -1,3 +1,6 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 import argparse
 import re
 
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 59251810d43..d686ce1bf61 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 import subprocess
 import multiprocessing
 import traceback
diff --git a/meta/lib/oeqa/buildperf/__init__.py b/meta/lib/oeqa/buildperf/__init__.py
index 605f429eccf..b7ebd036aed 100644
--- a/meta/lib/oeqa/buildperf/__init__.py
+++ b/meta/lib/oeqa/buildperf/__init__.py
@@ -1,13 +1,7 @@
 # Copyright (c) 2016, Intel Corporation.
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms and conditions of the GNU General Public License,
-# version 2, as published by the Free Software Foundation.
 #
-# This program is distributed in the hope it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-# more details.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 """Build performance tests"""
 from .base import (BuildPerfTestCase,
diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index ac6ee15d093..3b2fed549fb 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -1,13 +1,6 @@
 # Copyright (c) 2016, Intel Corporation.
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms and conditions of the GNU General Public License,
-# version 2, as published by the Free Software Foundation.
-#
-# This program is distributed in the hope it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-# more details.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 """Build performance test base classes and functionality"""
 import json
diff --git a/meta/lib/oeqa/buildperf/test_basic.py b/meta/lib/oeqa/buildperf/test_basic.py
index 6d6b01b04b4..2104617ba31 100644
--- a/meta/lib/oeqa/buildperf/test_basic.py
+++ b/meta/lib/oeqa/buildperf/test_basic.py
@@ -1,13 +1,6 @@
 # Copyright (c) 2016, Intel Corporation.
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms and conditions of the GNU General Public License,
-# version 2, as published by the Free Software Foundation.
-#
-# This program is distributed in the hope it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-# more details.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 """Basic set of build performance tests"""
 import os
diff --git a/meta/lib/oeqa/controllers/__init__.py b/meta/lib/oeqa/controllers/__init__.py
index 8eda92763c5..cc3836c4bff 100644
--- a/meta/lib/oeqa/controllers/__init__.py
+++ b/meta/lib/oeqa/controllers/__init__.py
@@ -1,3 +1,6 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 # Enable other layers to have modules in the same named directory
 from pkgutil import extend_path
 __path__ = extend_path(__path__, __name__)
diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index f175e119da2..0435dfa125d 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/masterimage.py
@@ -1,7 +1,7 @@
 # Copyright (C) 2014 Intel Corporation
 #
-# Released under the MIT license (see COPYING.MIT)
-
+# SPDX-License-Identifier: MIT
+#
 # This module adds support to testimage.bbclass to deploy images and run
 # tests using a "master image" - this is a "known good" image that is
 # installed onto the device as part of initial setup and will be booted into
diff --git a/meta/lib/oeqa/controllers/testtargetloader.py b/meta/lib/oeqa/controllers/testtargetloader.py
index b51d04b2131..23101c73717 100644
--- a/meta/lib/oeqa/controllers/testtargetloader.py
+++ b/meta/lib/oeqa/controllers/testtargetloader.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 import types
 import bb
 import os
diff --git a/meta/lib/oeqa/core/case.py b/meta/lib/oeqa/core/case.py
index 917a2aa3f8d..54977c809fb 100644
--- a/meta/lib/oeqa/core/case.py
+++ b/meta/lib/oeqa/core/case.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 import unittest
 
diff --git a/meta/lib/oeqa/core/cases/example/test_basic.py b/meta/lib/oeqa/core/cases/example/test_basic.py
index 11cf3800cca..d77edcdceca 100644
--- a/meta/lib/oeqa/core/cases/example/test_basic.py
+++ b/meta/lib/oeqa/core/cases/example/test_basic.py
@@ -1,5 +1,7 @@
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 from oeqa.core.case import OETestCase
 from oeqa.core.decorator.depends import OETestDepends
diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 821aec8836a..09627044c83 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -1,5 +1,7 @@
-# Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+## Copyright (C) 2016 Intel Corporation
+#
+# SPDX-License-Identifier: MIT
+#
 
 import os
 import sys
diff --git a/meta/lib/oeqa/core/decorator/__init__.py b/meta/lib/oeqa/core/decorator/__init__.py
index 14d7bfcd356..923b2182667 100644
--- a/meta/lib/oeqa/core/decorator/__init__.py
+++ b/meta/lib/oeqa/core/decorator/__init__.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 from functools import wraps
 from abc import abstractmethod, ABCMeta
diff --git a/meta/lib/oeqa/core/decorator/data.py b/meta/lib/oeqa/core/decorator/data.py
index f0f65abb39a..babc9789d62 100644
--- a/meta/lib/oeqa/core/decorator/data.py
+++ b/meta/lib/oeqa/core/decorator/data.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 from oeqa.core.exception import OEQAMissingVariable
 
diff --git a/meta/lib/oeqa/core/decorator/depends.py b/meta/lib/oeqa/core/decorator/depends.py
index 950dbaa67a3..33f0841cab0 100644
--- a/meta/lib/oeqa/core/decorator/depends.py
+++ b/meta/lib/oeqa/core/decorator/depends.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 from unittest import SkipTest
 
diff --git a/meta/lib/oeqa/core/decorator/oetag.py b/meta/lib/oeqa/core/decorator/oetag.py
index ad38ab78a54..8c31138dac7 100644
--- a/meta/lib/oeqa/core/decorator/oetag.py
+++ b/meta/lib/oeqa/core/decorator/oetag.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 from . import OETestFilter, registerDecorator
 from oeqa.core.utils.misc import strToList
diff --git a/meta/lib/oeqa/core/decorator/oetimeout.py b/meta/lib/oeqa/core/decorator/oetimeout.py
index a247583f7f1..df90d1c7987 100644
--- a/meta/lib/oeqa/core/decorator/oetimeout.py
+++ b/meta/lib/oeqa/core/decorator/oetimeout.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 import signal
 from . import OETestDecorator, registerDecorator
diff --git a/meta/lib/oeqa/core/exception.py b/meta/lib/oeqa/core/exception.py
index 732f2efdeb6..05be0ed21ff 100644
--- a/meta/lib/oeqa/core/exception.py
+++ b/meta/lib/oeqa/core/exception.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 class OEQAException(Exception):
     pass
diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index e66de32cb1b..7fea0585c74 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 import os
 import re
diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index ee1fb430283..5f708730eda 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 import os
 import time
diff --git a/meta/lib/oeqa/core/target/__init__.py b/meta/lib/oeqa/core/target/__init__.py
index d2468bc257f..1382aa9b523 100644
--- a/meta/lib/oeqa/core/target/__init__.py
+++ b/meta/lib/oeqa/core/target/__init__.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 from abc import abstractmethod
 
diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/qemu.py
index 7a161a32319..081c627b017 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 import os
 import sys
diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 2adbb3000c8..cf3d44d12d5 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 import os
 import time
diff --git a/meta/lib/oeqa/core/tests/cases/data.py b/meta/lib/oeqa/core/tests/cases/data.py
index 88003a6adc8..0d8de87ae7a 100644
--- a/meta/lib/oeqa/core/tests/cases/data.py
+++ b/meta/lib/oeqa/core/tests/cases/data.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 from oeqa.core.case import OETestCase
 from oeqa.core.decorator.oetag import OETestTag
diff --git a/meta/lib/oeqa/core/tests/cases/depends.py b/meta/lib/oeqa/core/tests/cases/depends.py
index 17cdd90b153..46e7db900de 100644
--- a/meta/lib/oeqa/core/tests/cases/depends.py
+++ b/meta/lib/oeqa/core/tests/cases/depends.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 from oeqa.core.case import OETestCase
 from oeqa.core.decorator.depends import OETestDepends
diff --git a/meta/lib/oeqa/core/tests/cases/loader/valid/another.py b/meta/lib/oeqa/core/tests/cases/loader/valid/another.py
index c9ffd177734..bedc20c8a65 100644
--- a/meta/lib/oeqa/core/tests/cases/loader/valid/another.py
+++ b/meta/lib/oeqa/core/tests/cases/loader/valid/another.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 from oeqa.core.case import OETestCase
 
diff --git a/meta/lib/oeqa/core/tests/cases/oetag.py b/meta/lib/oeqa/core/tests/cases/oetag.py
index 0cae02e75c4..4e1d080985d 100644
--- a/meta/lib/oeqa/core/tests/cases/oetag.py
+++ b/meta/lib/oeqa/core/tests/cases/oetag.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 from oeqa.core.case import OETestCase
 from oeqa.core.decorator.oetag import OETestTag
diff --git a/meta/lib/oeqa/core/tests/cases/timeout.py b/meta/lib/oeqa/core/tests/cases/timeout.py
index 870c3157f76..5dfecc7b7c3 100644
--- a/meta/lib/oeqa/core/tests/cases/timeout.py
+++ b/meta/lib/oeqa/core/tests/cases/timeout.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 from time import sleep
 
diff --git a/meta/lib/oeqa/core/tests/common.py b/meta/lib/oeqa/core/tests/common.py
index 52b18a1c3ea..39efd504c00 100644
--- a/meta/lib/oeqa/core/tests/common.py
+++ b/meta/lib/oeqa/core/tests/common.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 import sys
 import os
diff --git a/meta/lib/oeqa/core/tests/test_data.py b/meta/lib/oeqa/core/tests/test_data.py
index 21b6c68b8a4..50811bb3811 100755
--- a/meta/lib/oeqa/core/tests/test_data.py
+++ b/meta/lib/oeqa/core/tests/test_data.py
@@ -1,7 +1,9 @@
 #!/usr/bin/env python3
 
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 import unittest
 import logging
diff --git a/meta/lib/oeqa/core/tests/test_decorators.py b/meta/lib/oeqa/core/tests/test_decorators.py
index 67dce773bd0..499cd66ff3d 100755
--- a/meta/lib/oeqa/core/tests/test_decorators.py
+++ b/meta/lib/oeqa/core/tests/test_decorators.py
@@ -1,7 +1,9 @@
 #!/usr/bin/env python3
-
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 import signal
 import unittest
diff --git a/meta/lib/oeqa/core/tests/test_loader.py b/meta/lib/oeqa/core/tests/test_loader.py
index 39f2d6e2a7a..519ba960917 100755
--- a/meta/lib/oeqa/core/tests/test_loader.py
+++ b/meta/lib/oeqa/core/tests/test_loader.py
@@ -1,7 +1,9 @@
 #!/usr/bin/env python3
-
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 import os
 import unittest
diff --git a/meta/lib/oeqa/core/tests/test_runner.py b/meta/lib/oeqa/core/tests/test_runner.py
index a3f3861fed3..205464cfae9 100755
--- a/meta/lib/oeqa/core/tests/test_runner.py
+++ b/meta/lib/oeqa/core/tests/test_runner.py
@@ -1,7 +1,9 @@
 #!/usr/bin/env python3
-
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 import unittest
 import logging
diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index e050818f0f4..535b11e2d95 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -1,5 +1,7 @@
 #!/usr/bin/env python3
 #
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
 # Modified for use in OE by Richard Purdie, 2018
 #
 # Modified by: Corey Goldberg, 2013
diff --git a/meta/lib/oeqa/core/utils/misc.py b/meta/lib/oeqa/core/utils/misc.py
index 0b223b5d080..e1a59588eb6 100644
--- a/meta/lib/oeqa/core/utils/misc.py
+++ b/meta/lib/oeqa/core/utils/misc.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 def toList(obj, obj_type, obj_name="Object"):
     if isinstance(obj, obj_type):
diff --git a/meta/lib/oeqa/core/utils/path.py b/meta/lib/oeqa/core/utils/path.py
index a21caad5cb6..c086dcb0b04 100644
--- a/meta/lib/oeqa/core/utils/path.py
+++ b/meta/lib/oeqa/core/utils/path.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 import os
 import sys
diff --git a/meta/lib/oeqa/core/utils/test.py b/meta/lib/oeqa/core/utils/test.py
index 88d5d139817..d38cab8a511 100644
--- a/meta/lib/oeqa/core/utils/test.py
+++ b/meta/lib/oeqa/core/utils/test.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 import os
 import inspect
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index f0423af66c4..9c84466dd02 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -1,6 +1,8 @@
+#
 # Copyright (C) 2013 Intel Corporation
 #
-# Released under the MIT license (see COPYING.MIT)
+# SPDX-License-Identifier: MIT
+#
 
 # Main unittest module used by testimage.bbclass
 # This provides the oeRuntimeTest base class which is inherited by all tests in meta/lib/oeqa/runtime.
diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
index 9cfea0f7abb..7e37213df69 100755
--- a/meta/lib/oeqa/runexported.py
+++ b/meta/lib/oeqa/runexported.py
@@ -1,9 +1,9 @@
 #!/usr/bin/env python3
-
-
+#
 # Copyright (C) 2013 Intel Corporation
 #
-# Released under the MIT license (see COPYING.MIT)
+# SPDX-License-Identifier: MIT
+#
 
 # This script should be used outside of the build system to run image tests.
 # It needs a json file as input as exported by the build.
diff --git a/meta/lib/oeqa/runtime/case.py b/meta/lib/oeqa/runtime/case.py
index 2f190acf151..f036982e1f8 100644
--- a/meta/lib/oeqa/runtime/case.py
+++ b/meta/lib/oeqa/runtime/case.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 from oeqa.core.case import OETestCase
 from oeqa.utils.package_manager import install_package, uninstall_package
diff --git a/meta/lib/oeqa/runtime/cases/_qemutiny.py b/meta/lib/oeqa/runtime/cases/_qemutiny.py
index 7b5b48141fa..6886e365027 100644
--- a/meta/lib/oeqa/runtime/cases/_qemutiny.py
+++ b/meta/lib/oeqa/runtime/cases/_qemutiny.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 from oeqa.runtime.case import OERuntimeTestCase
 
 class QemuTinyTest(OERuntimeTestCase):
diff --git a/meta/lib/oeqa/runtime/cases/apt.py b/meta/lib/oeqa/runtime/cases/apt.py
index 793143f72cf..74a940d80f9 100644
--- a/meta/lib/oeqa/runtime/cases/apt.py
+++ b/meta/lib/oeqa/runtime/cases/apt.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 from oeqa.utils.httpserver import HTTPService
 from oeqa.runtime.case import OERuntimeTestCase
diff --git a/meta/lib/oeqa/runtime/cases/buildcpio.py b/meta/lib/oeqa/runtime/cases/buildcpio.py
index 6a9a408ebea..f4e871e421b 100644
--- a/meta/lib/oeqa/runtime/cases/buildcpio.py
+++ b/meta/lib/oeqa/runtime/cases/buildcpio.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
diff --git a/meta/lib/oeqa/runtime/cases/buildgalculator.py b/meta/lib/oeqa/runtime/cases/buildgalculator.py
index 4ec5fc707bf..6dd1faee0ab 100644
--- a/meta/lib/oeqa/runtime/cases/buildgalculator.py
+++ b/meta/lib/oeqa/runtime/cases/buildgalculator.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
diff --git a/meta/lib/oeqa/runtime/cases/buildlzip.py b/meta/lib/oeqa/runtime/cases/buildlzip.py
index b737ca601b6..bc70b414612 100644
--- a/meta/lib/oeqa/runtime/cases/buildlzip.py
+++ b/meta/lib/oeqa/runtime/cases/buildlzip.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
diff --git a/meta/lib/oeqa/runtime/cases/connman.py b/meta/lib/oeqa/runtime/cases/connman.py
index 55a252ab01d..f0d15fac9b2 100644
--- a/meta/lib/oeqa/runtime/cases/connman.py
+++ b/meta/lib/oeqa/runtime/cases/connman.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
diff --git a/meta/lib/oeqa/runtime/cases/date.py b/meta/lib/oeqa/runtime/cases/date.py
index d31d1b2730b..7750a7293f8 100644
--- a/meta/lib/oeqa/runtime/cases/date.py
+++ b/meta/lib/oeqa/runtime/cases/date.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import re
 
 from oeqa.runtime.case import OERuntimeTestCase
diff --git a/meta/lib/oeqa/runtime/cases/df.py b/meta/lib/oeqa/runtime/cases/df.py
index 2d1ca2a9495..d8d79f32ea2 100644
--- a/meta/lib/oeqa/runtime/cases/df.py
+++ b/meta/lib/oeqa/runtime/cases/df.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/cases/dnf.py
index f235bdd58ae..629b9af3ed1 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 import re
 import subprocess
diff --git a/meta/lib/oeqa/runtime/cases/gcc.py b/meta/lib/oeqa/runtime/cases/gcc.py
index e55eb560d0f..1b6e431bf4b 100644
--- a/meta/lib/oeqa/runtime/cases/gcc.py
+++ b/meta/lib/oeqa/runtime/cases/gcc.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 
 from oeqa.runtime.case import OERuntimeTestCase
diff --git a/meta/lib/oeqa/runtime/cases/gi.py b/meta/lib/oeqa/runtime/cases/gi.py
index 7e16651df74..42bd100a319 100644
--- a/meta/lib/oeqa/runtime/cases/gi.py
+++ b/meta/lib/oeqa/runtime/cases/gi.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 
 from oeqa.runtime.case import OERuntimeTestCase
diff --git a/meta/lib/oeqa/runtime/cases/gstreamer.py b/meta/lib/oeqa/runtime/cases/gstreamer.py
index 128630e1179..f735f82e3b5 100644
--- a/meta/lib/oeqa/runtime/cases/gstreamer.py
+++ b/meta/lib/oeqa/runtime/cases/gstreamer.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.runtime.decorator.package import OEHasPackage
 
diff --git a/meta/lib/oeqa/runtime/cases/kernelmodule.py b/meta/lib/oeqa/runtime/cases/kernelmodule.py
index 36805be302a..47fd2f850c0 100644
--- a/meta/lib/oeqa/runtime/cases/kernelmodule.py
+++ b/meta/lib/oeqa/runtime/cases/kernelmodule.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 
 from oeqa.runtime.case import OERuntimeTestCase
diff --git a/meta/lib/oeqa/runtime/cases/ksample.py b/meta/lib/oeqa/runtime/cases/ksample.py
index 45b926bec8f..a9a1620ebd4 100644
--- a/meta/lib/oeqa/runtime/cases/ksample.py
+++ b/meta/lib/oeqa/runtime/cases/ksample.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 import time
 
diff --git a/meta/lib/oeqa/runtime/cases/ldd.py b/meta/lib/oeqa/runtime/cases/ldd.py
index 39c47f380bb..9c2caa8f65e 100644
--- a/meta/lib/oeqa/runtime/cases/ldd.py
+++ b/meta/lib/oeqa/runtime/cases/ldd.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfNotFeature
diff --git a/meta/lib/oeqa/runtime/cases/logrotate.py b/meta/lib/oeqa/runtime/cases/logrotate.py
index dc3b271445a..8358793a245 100644
--- a/meta/lib/oeqa/runtime/cases/logrotate.py
+++ b/meta/lib/oeqa/runtime/cases/logrotate.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 # This test should cover https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=289 testcase
 # Note that the image under test must have logrotate installed
 
diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cases/ltp.py
index 628494e4531..30548640bcd 100644
--- a/meta/lib/oeqa/runtime/cases/ltp.py
+++ b/meta/lib/oeqa/runtime/cases/ltp.py
@@ -2,15 +2,9 @@
 #
 # Copyright (c) 2019 MontaVista Software, LLC
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms and conditions of the GNU General Public License,
-# version 2, as published by the Free Software Foundation.
-#
-# This program is distributed in the hope it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-# more details.
+# SPDX-License-Identifier: GPL-2.0-only
 #
+
 import time
 import datetime
 import pprint
diff --git a/meta/lib/oeqa/runtime/cases/ltp_compliance.py b/meta/lib/oeqa/runtime/cases/ltp_compliance.py
index be9a9a32af9..ba47c78fd46 100644
--- a/meta/lib/oeqa/runtime/cases/ltp_compliance.py
+++ b/meta/lib/oeqa/runtime/cases/ltp_compliance.py
@@ -2,14 +2,7 @@
 #
 # Copyright (c) 2019 MontaVista Software, LLC
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms and conditions of the GNU General Public License,
-# version 2, as published by the Free Software Foundation.
-#
-# This program is distributed in the hope it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-# more details.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 
 import time
diff --git a/meta/lib/oeqa/runtime/cases/multilib.py b/meta/lib/oeqa/runtime/cases/multilib.py
index 2cf87618f95..62e662b01c3 100644
--- a/meta/lib/oeqa/runtime/cases/multilib.py
+++ b/meta/lib/oeqa/runtime/cases/multilib.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfNotInDataVar
diff --git a/meta/lib/oeqa/runtime/cases/oe_syslog.py b/meta/lib/oeqa/runtime/cases/oe_syslog.py
index 100d026391e..0f5f9f43ca4 100644
--- a/meta/lib/oeqa/runtime/cases/oe_syslog.py
+++ b/meta/lib/oeqa/runtime/cases/oe_syslog.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfDataVar
diff --git a/meta/lib/oeqa/runtime/cases/opkg.py b/meta/lib/oeqa/runtime/cases/opkg.py
index 693f5d68c91..bb8b6d99d20 100644
--- a/meta/lib/oeqa/runtime/cases/opkg.py
+++ b/meta/lib/oeqa/runtime/cases/opkg.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 from oeqa.utils.httpserver import HTTPService
 from oeqa.runtime.case import OERuntimeTestCase
diff --git a/meta/lib/oeqa/runtime/cases/pam.py b/meta/lib/oeqa/runtime/cases/pam.py
index 49ae1f48812..271a1943e30 100644
--- a/meta/lib/oeqa/runtime/cases/pam.py
+++ b/meta/lib/oeqa/runtime/cases/pam.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 # This test should cover https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=287 testcase
 # Note that the image under test must have "pam" in DISTRO_FEATURES
 
diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 41857f5373d..eb2ebb19585 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 
 from subprocess import check_output
diff --git a/meta/lib/oeqa/runtime/cases/perl.py b/meta/lib/oeqa/runtime/cases/perl.py
index de1d8d090cc..2c6b3b78468 100644
--- a/meta/lib/oeqa/runtime/cases/perl.py
+++ b/meta/lib/oeqa/runtime/cases/perl.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 
 from oeqa.runtime.case import OERuntimeTestCase
diff --git a/meta/lib/oeqa/runtime/cases/ping.py b/meta/lib/oeqa/runtime/cases/ping.py
index c32f2159a41..f6603f75ec7 100644
--- a/meta/lib/oeqa/runtime/cases/ping.py
+++ b/meta/lib/oeqa/runtime/cases/ping.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 from subprocess import Popen, PIPE
 
 from oeqa.runtime.case import OERuntimeTestCase
diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index e210099d48a..d8d1e1b344f 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import unittest
 import pprint
 import datetime
diff --git a/meta/lib/oeqa/runtime/cases/python.py b/meta/lib/oeqa/runtime/cases/python.py
index f03e33daa19..ec54f1e1db1 100644
--- a/meta/lib/oeqa/runtime/cases/python.py
+++ b/meta/lib/oeqa/runtime/cases/python.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
index 76176e632eb..d8cabd3640e 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 import fnmatch
 
diff --git a/meta/lib/oeqa/runtime/cases/scp.py b/meta/lib/oeqa/runtime/cases/scp.py
index 43dd7167fad..3a5f2921521 100644
--- a/meta/lib/oeqa/runtime/cases/scp.py
+++ b/meta/lib/oeqa/runtime/cases/scp.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 from tempfile import mkstemp
 
diff --git a/meta/lib/oeqa/runtime/cases/skeletoninit.py b/meta/lib/oeqa/runtime/cases/skeletoninit.py
index 4fad7947208..4779cd6bb4e 100644
--- a/meta/lib/oeqa/runtime/cases/skeletoninit.py
+++ b/meta/lib/oeqa/runtime/cases/skeletoninit.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 # This test should cover https://bugzilla.yoctoproject.org/tr_show_case.cgi?case_id=284
 # testcase. Image under test must have meta-skeleton layer in bblayers and
 # IMAGE_INSTALL_append = " service" in local.conf
diff --git a/meta/lib/oeqa/runtime/cases/ssh.py b/meta/lib/oeqa/runtime/cases/ssh.py
index 26ced881453..60a5fbbfbfd 100644
--- a/meta/lib/oeqa/runtime/cases/ssh.py
+++ b/meta/lib/oeqa/runtime/cases/ssh.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
diff --git a/meta/lib/oeqa/runtime/cases/stap.py b/meta/lib/oeqa/runtime/cases/stap.py
index c149e56f7d5..5342f6ac342 100644
--- a/meta/lib/oeqa/runtime/cases/stap.py
+++ b/meta/lib/oeqa/runtime/cases/stap.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 
 from oeqa.runtime.case import OERuntimeTestCase
diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/runtime/cases/systemd.py
index db9da465ee5..c11fa49b07f 100644
--- a/meta/lib/oeqa/runtime/cases/systemd.py
+++ b/meta/lib/oeqa/runtime/cases/systemd.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import re
 import time
 
diff --git a/meta/lib/oeqa/runtime/cases/x32lib.py b/meta/lib/oeqa/runtime/cases/x32lib.py
index 809dfdf9f4f..ddf220140e9 100644
--- a/meta/lib/oeqa/runtime/cases/x32lib.py
+++ b/meta/lib/oeqa/runtime/cases/x32lib.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfNotInDataVar
diff --git a/meta/lib/oeqa/runtime/cases/xorg.py b/meta/lib/oeqa/runtime/cases/xorg.py
index 421ae565602..d6845587c29 100644
--- a/meta/lib/oeqa/runtime/cases/xorg.py
+++ b/meta/lib/oeqa/runtime/cases/xorg.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfNotFeature
diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index db0482d68d6..77d58eefa71 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 import os
 
diff --git a/meta/lib/oeqa/runtime/decorator/package.py b/meta/lib/oeqa/runtime/decorator/package.py
index aa6ecb68fa4..4c5ca198b0c 100644
--- a/meta/lib/oeqa/runtime/decorator/package.py
+++ b/meta/lib/oeqa/runtime/decorator/package.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 from oeqa.core.decorator import OETestDecorator, registerDecorator
 from oeqa.core.utils.misc import strToSet
diff --git a/meta/lib/oeqa/runtime/loader.py b/meta/lib/oeqa/runtime/loader.py
index 041ef976ebe..7041ddfde82 100644
--- a/meta/lib/oeqa/runtime/loader.py
+++ b/meta/lib/oeqa/runtime/loader.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 from oeqa.core.loader import OETestLoader
 from oeqa.runtime.case import OERuntimeTestCase
diff --git a/meta/lib/oeqa/runtime/utils/targetbuildproject.py b/meta/lib/oeqa/runtime/utils/targetbuildproject.py
index de17ba01f89..f4f4816a9b9 100644
--- a/meta/lib/oeqa/runtime/utils/targetbuildproject.py
+++ b/meta/lib/oeqa/runtime/utils/targetbuildproject.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 from oeqa.utils.buildproject import BuildProject
 
diff --git a/meta/lib/oeqa/sdk/case.py b/meta/lib/oeqa/sdk/case.py
index d8611c8b308..43fc00aaa2a 100644
--- a/meta/lib/oeqa/sdk/case.py
+++ b/meta/lib/oeqa/sdk/case.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 import os
 import subprocess
diff --git a/meta/lib/oeqa/sdk/cases/assimp.py b/meta/lib/oeqa/sdk/cases/assimp.py
index a6000103993..f26b17f2e92 100644
--- a/meta/lib/oeqa/sdk/cases/assimp.py
+++ b/meta/lib/oeqa/sdk/cases/assimp.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 import subprocess
 import tempfile
diff --git a/meta/lib/oeqa/sdk/cases/buildcpio.py b/meta/lib/oeqa/sdk/cases/buildcpio.py
index 9504ee8e053..0a5e68d5fd7 100644
--- a/meta/lib/oeqa/sdk/cases/buildcpio.py
+++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 import tempfile
 import subprocess
diff --git a/meta/lib/oeqa/sdk/cases/buildepoxy.py b/meta/lib/oeqa/sdk/cases/buildepoxy.py
index ef24b4f4ac1..f3d207c6ddd 100644
--- a/meta/lib/oeqa/sdk/cases/buildepoxy.py
+++ b/meta/lib/oeqa/sdk/cases/buildepoxy.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 import subprocess
 import tempfile
diff --git a/meta/lib/oeqa/sdk/cases/buildgalculator.py b/meta/lib/oeqa/sdk/cases/buildgalculator.py
index 47d7580fafd..bbaa5c55c91 100644
--- a/meta/lib/oeqa/sdk/cases/buildgalculator.py
+++ b/meta/lib/oeqa/sdk/cases/buildgalculator.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 import subprocess
 import tempfile
diff --git a/meta/lib/oeqa/sdk/cases/buildlzip.py b/meta/lib/oeqa/sdk/cases/buildlzip.py
index b7483bfea51..515acd2891f 100644
--- a/meta/lib/oeqa/sdk/cases/buildlzip.py
+++ b/meta/lib/oeqa/sdk/cases/buildlzip.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os, tempfile, subprocess, unittest
 from oeqa.sdk.case import OESDKTestCase
 from oeqa.utils.subprocesstweak import errors_have_output
diff --git a/meta/lib/oeqa/sdk/cases/gcc.py b/meta/lib/oeqa/sdk/cases/gcc.py
index 54c6fc488bc..eb08eadd28f 100644
--- a/meta/lib/oeqa/sdk/cases/gcc.py
+++ b/meta/lib/oeqa/sdk/cases/gcc.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 import shutil
 import unittest
diff --git a/meta/lib/oeqa/sdk/cases/perl.py b/meta/lib/oeqa/sdk/cases/perl.py
index b8adc5ac72d..14d76d820f6 100644
--- a/meta/lib/oeqa/sdk/cases/perl.py
+++ b/meta/lib/oeqa/sdk/cases/perl.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import unittest
 from oeqa.sdk.case import OESDKTestCase
 
diff --git a/meta/lib/oeqa/sdk/cases/python.py b/meta/lib/oeqa/sdk/cases/python.py
index b9174fadbaa..a334abce5f6 100644
--- a/meta/lib/oeqa/sdk/cases/python.py
+++ b/meta/lib/oeqa/sdk/cases/python.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import subprocess, unittest
 from oeqa.sdk.case import OESDKTestCase
 
diff --git a/meta/lib/oeqa/sdk/context.py b/meta/lib/oeqa/sdk/context.py
index adc4166fd2d..09e77c19fe3 100644
--- a/meta/lib/oeqa/sdk/context.py
+++ b/meta/lib/oeqa/sdk/context.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 import os
 import sys
diff --git a/meta/lib/oeqa/sdk/testsdk.py b/meta/lib/oeqa/sdk/testsdk.py
index 632ac50d0cb..35e40187bc4 100644
--- a/meta/lib/oeqa/sdk/testsdk.py
+++ b/meta/lib/oeqa/sdk/testsdk.py
@@ -1,5 +1,8 @@
+#
 # Copyright 2018 by Garmin Ltd. or its subsidiaries
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 from oeqa.sdk.context import OESDKTestContext, OESDKTestContextExecutor
 
diff --git a/meta/lib/oeqa/sdk/utils/sdkbuildproject.py b/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
index 6fed73e3505..f57ff5eed04 100644
--- a/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
+++ b/meta/lib/oeqa/sdk/utils/sdkbuildproject.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 import os
 import subprocess
diff --git a/meta/lib/oeqa/sdkext/case.py b/meta/lib/oeqa/sdkext/case.py
index 21b718831c1..668faec9b9a 100644
--- a/meta/lib/oeqa/sdkext/case.py
+++ b/meta/lib/oeqa/sdkext/case.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 import os
 import subprocess
diff --git a/meta/lib/oeqa/sdkext/cases/devtool.py b/meta/lib/oeqa/sdkext/cases/devtool.py
index ab11b2b93a0..5a02add764f 100644
--- a/meta/lib/oeqa/sdkext/cases/devtool.py
+++ b/meta/lib/oeqa/sdkext/cases/devtool.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 import os
 import shutil
diff --git a/meta/lib/oeqa/sdkext/context.py b/meta/lib/oeqa/sdkext/context.py
index 65da4c6e1b5..2ac2bf6ff73 100644
--- a/meta/lib/oeqa/sdkext/context.py
+++ b/meta/lib/oeqa/sdkext/context.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 import os
 from oeqa.sdk.context import OESDKTestContext, OESDKTestContextExecutor
diff --git a/meta/lib/oeqa/sdkext/testsdk.py b/meta/lib/oeqa/sdkext/testsdk.py
index 57b2e0e03f2..785b5dda53a 100644
--- a/meta/lib/oeqa/sdkext/testsdk.py
+++ b/meta/lib/oeqa/sdkext/testsdk.py
@@ -1,5 +1,8 @@
+#
 # Copyright 2018 by Garmin Ltd. or its subsidiaries
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 from oeqa.sdk.testsdk import TestSDKBase
 
diff --git a/meta/lib/oeqa/selftest/case.py b/meta/lib/oeqa/selftest/case.py
index 9c08d595efd..d207a0af0c0 100644
--- a/meta/lib/oeqa/selftest/case.py
+++ b/meta/lib/oeqa/selftest/case.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2013-2017 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 import sys
 import os
diff --git a/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py b/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
index 0e5896234c3..f7c356ad092 100644
--- a/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
+++ b/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 import shutil
 
diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index f450777c8d3..f8672f8abba 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 import glob
 from oeqa.utils.commands import bitbake, get_bb_vars
diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 6ec5fb819e1..954488dfd1e 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 import re
 
diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 1b837419743..e9ad44b027e 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 import re
 
diff --git a/meta/lib/oeqa/selftest/cases/buildhistory.py b/meta/lib/oeqa/selftest/cases/buildhistory.py
index 06792d9146d..d865da6252d 100644
--- a/meta/lib/oeqa/selftest/cases/buildhistory.py
+++ b/meta/lib/oeqa/selftest/cases/buildhistory.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 import re
 import datetime
diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index 953c6e468df..3ad65b40341 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 import re
 import glob as g
diff --git a/meta/lib/oeqa/selftest/cases/containerimage.py b/meta/lib/oeqa/selftest/cases/containerimage.py
index 47d97b75412..c0998e319e0 100644
--- a/meta/lib/oeqa/selftest/cases/containerimage.py
+++ b/meta/lib/oeqa/selftest/cases/containerimage.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 
 from oeqa.selftest.case import OESelftestTestCase
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 48fc042904d..434a7b9dd4b 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 import re
 import shutil
diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index 8962bda011b..68ba556485e 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
 from oeqa.utils.decorators import testcase
diff --git a/meta/lib/oeqa/selftest/cases/eSDK.py b/meta/lib/oeqa/selftest/cases/eSDK.py
index d501238854e..862849af35c 100644
--- a/meta/lib/oeqa/selftest/cases/eSDK.py
+++ b/meta/lib/oeqa/selftest/cases/eSDK.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import tempfile
 import shutil
 import os
diff --git a/meta/lib/oeqa/selftest/cases/efibootpartition.py b/meta/lib/oeqa/selftest/cases/efibootpartition.py
index c6f39d5b162..a61cf9bcb30 100644
--- a/meta/lib/oeqa/selftest/cases/efibootpartition.py
+++ b/meta/lib/oeqa/selftest/cases/efibootpartition.py
@@ -2,6 +2,8 @@
 #
 # Copyright (c) 2017 Wind River Systems, Inc.
 #
+# SPDX-License-Identifier: MIT
+#
 
 import re
 
diff --git a/meta/lib/oeqa/selftest/cases/fetch.py b/meta/lib/oeqa/selftest/cases/fetch.py
index c5de4fd4015..76cbadf2ff9 100644
--- a/meta/lib/oeqa/selftest/cases/fetch.py
+++ b/meta/lib/oeqa/selftest/cases/fetch.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import oe.path
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake
diff --git a/meta/lib/oeqa/selftest/cases/gotoolchain.py b/meta/lib/oeqa/selftest/cases/gotoolchain.py
index 1e23257f4de..3119520f0de 100644
--- a/meta/lib/oeqa/selftest/cases/gotoolchain.py
+++ b/meta/lib/oeqa/selftest/cases/gotoolchain.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import glob
 import os
 import shutil
diff --git a/meta/lib/oeqa/selftest/cases/image_typedep.py b/meta/lib/oeqa/selftest/cases/image_typedep.py
index 9f1f983e1d3..52e1080f130 100644
--- a/meta/lib/oeqa/selftest/cases/image_typedep.py
+++ b/meta/lib/oeqa/selftest/cases/image_typedep.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 
 from oeqa.selftest.case import OESelftestTestCase
diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index a1d9f12dcc2..afc629f29cd 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
 from oeqa.utils.sshcontrol import SSHControl
diff --git a/meta/lib/oeqa/selftest/cases/layerappend.py b/meta/lib/oeqa/selftest/cases/layerappend.py
index 18ccda2df84..05e9426fc68 100644
--- a/meta/lib/oeqa/selftest/cases/layerappend.py
+++ b/meta/lib/oeqa/selftest/cases/layerappend.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 
 from oeqa.selftest.case import OESelftestTestCase
diff --git a/meta/lib/oeqa/selftest/cases/liboe.py b/meta/lib/oeqa/selftest/cases/liboe.py
index 01b2cab7aa7..afe8f8809f7 100644
--- a/meta/lib/oeqa/selftest/cases/liboe.py
+++ b/meta/lib/oeqa/selftest/cases/liboe.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import get_bb_var, get_bb_vars, bitbake, runCmd
 import oe.path
diff --git a/meta/lib/oeqa/selftest/cases/lic_checksum.py b/meta/lib/oeqa/selftest/cases/lic_checksum.py
index 70b4fe27006..bae935d697c 100644
--- a/meta/lib/oeqa/selftest/cases/lic_checksum.py
+++ b/meta/lib/oeqa/selftest/cases/lic_checksum.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 import tempfile
 
diff --git a/meta/lib/oeqa/selftest/cases/manifest.py b/meta/lib/oeqa/selftest/cases/manifest.py
index 799e1fb47db..c0b25ab5d8c 100644
--- a/meta/lib/oeqa/selftest/cases/manifest.py
+++ b/meta/lib/oeqa/selftest/cases/manifest.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 
 from oeqa.selftest.case import OESelftestTestCase
diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py b/meta/lib/oeqa/selftest/cases/meta_ide.py
index 76cbac3c77c..f47bc709172 100644
--- a/meta/lib/oeqa/selftest/cases/meta_ide.py
+++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.sdk.utils.sdkbuildproject import SDKBuildProject
 from oeqa.utils.commands import bitbake, get_bb_vars, runCmd
diff --git a/meta/lib/oeqa/selftest/cases/multiconfig.py b/meta/lib/oeqa/selftest/cases/multiconfig.py
index 3c36f6e5d2e..d21bf0a4110 100644
--- a/meta/lib/oeqa/selftest/cases/multiconfig.py
+++ b/meta/lib/oeqa/selftest/cases/multiconfig.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake
diff --git a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
index f9bec53d4ae..6d808276523 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 from oeqa.selftest.case import OESelftestTestCase
 import tempfile
diff --git a/meta/lib/oeqa/selftest/cases/oelib/elf.py b/meta/lib/oeqa/selftest/cases/oelib/elf.py
index 15c03f4609f..d0a28090f2e 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/elf.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/elf.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 from unittest.case import TestCase
 import oe.qa
 
diff --git a/meta/lib/oeqa/selftest/cases/oelib/license.py b/meta/lib/oeqa/selftest/cases/oelib/license.py
index d7f91fb2f4d..6ebbee589fb 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/license.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/license.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 from unittest.case import TestCase
 import oe.license
 
diff --git a/meta/lib/oeqa/selftest/cases/oelib/path.py b/meta/lib/oeqa/selftest/cases/oelib/path.py
index e0eb8134a90..a1cfa08c09f 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/path.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/path.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 from unittest.case import TestCase
 import oe, oe.path
 import tempfile
diff --git a/meta/lib/oeqa/selftest/cases/oelib/types.py b/meta/lib/oeqa/selftest/cases/oelib/types.py
index 6b53aa64e5b..7eb49e6f95a 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/types.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/types.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 from unittest.case import TestCase
 from oe.maketype import create
 
diff --git a/meta/lib/oeqa/selftest/cases/oelib/utils.py b/meta/lib/oeqa/selftest/cases/oelib/utils.py
index 789c6f78d2d..a7214beb4c0 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/utils.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/utils.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import sys
 from unittest.case import TestCase
 from contextlib import contextmanager
diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index e0b41e64fbe..56b35b59eb8 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.selftest.cases.buildhistory import BuildhistoryBase
 from oeqa.utils.commands import Command, runCmd, bitbake, get_bb_var, get_test_layer
diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index c166c876664..7a007538214 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, get_bb_vars, get_bb_var, runqemu
 import stat
diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py b/meta/lib/oeqa/selftest/cases/pkgdata.py
index 58ec6e0ebc0..833a1803ba6 100644
--- a/meta/lib/oeqa/selftest/cases/pkgdata.py
+++ b/meta/lib/oeqa/selftest/cases/pkgdata.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 import tempfile
 import fnmatch
diff --git a/meta/lib/oeqa/selftest/cases/prservice.py b/meta/lib/oeqa/selftest/cases/prservice.py
index b0a68a0b1fc..fe1f24ea6d6 100644
--- a/meta/lib/oeqa/selftest/cases/prservice.py
+++ b/meta/lib/oeqa/selftest/cases/prservice.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 import re
 import shutil
diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 439d87f834c..f1cb37b53f8 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 import shutil
 import tempfile
diff --git a/meta/lib/oeqa/selftest/cases/recipeutils.py b/meta/lib/oeqa/selftest/cases/recipeutils.py
index 408eb356bf4..747870383b6 100644
--- a/meta/lib/oeqa/selftest/cases/recipeutils.py
+++ b/meta/lib/oeqa/selftest/cases/recipeutils.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 import re
 import time
diff --git a/meta/lib/oeqa/selftest/cases/resulttooltests.py b/meta/lib/oeqa/selftest/cases/resulttooltests.py
index 0a089c0b7f0..10eb9c12d97 100644
--- a/meta/lib/oeqa/selftest/cases/resulttooltests.py
+++ b/meta/lib/oeqa/selftest/cases/resulttooltests.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 import sys
 basepath = os.path.abspath(os.path.dirname(__file__) + '/../../../../../')
diff --git a/meta/lib/oeqa/selftest/cases/runcmd.py b/meta/lib/oeqa/selftest/cases/runcmd.py
index ed4ba8a4652..3755764ee71 100644
--- a/meta/lib/oeqa/selftest/cases/runcmd.py
+++ b/meta/lib/oeqa/selftest/cases/runcmd.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd
 from oeqa.utils import CommandError
diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index 3598104aeb6..b88ae306c0a 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -1,6 +1,8 @@
 #
 # Copyright (c) 2017 Wind River Systems, Inc.
 #
+# SPDX-License-Identifier: MIT
+#
 
 import re
 import tempfile
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 072029ba728..d817b755fed 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars, runqemu
 from oeqa.utils.sshcontrol import SSHControl
diff --git a/meta/lib/oeqa/selftest/cases/selftest.py b/meta/lib/oeqa/selftest/cases/selftest.py
index 7d3a8ce5f62..af080dcf034 100644
--- a/meta/lib/oeqa/selftest/cases/selftest.py
+++ b/meta/lib/oeqa/selftest/cases/selftest.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import importlib
 from oeqa.utils.commands import runCmd
 import oeqa.selftest
diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index cfa87333bca..9c710bd0fff 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
 import os
diff --git a/meta/lib/oeqa/selftest/cases/sstate.py b/meta/lib/oeqa/selftest/cases/sstate.py
index bc2fdbd8ccb..410dec64fcd 100644
--- a/meta/lib/oeqa/selftest/cases/sstate.py
+++ b/meta/lib/oeqa/selftest/cases/sstate.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import datetime
 import unittest
 import os
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 8cae2f74917..2867cb78abb 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 import shutil
 import glob
diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py b/meta/lib/oeqa/selftest/cases/tinfoil.py
index 6c246d53069..42a1b6b4f4d 100644
--- a/meta/lib/oeqa/selftest/cases/tinfoil.py
+++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 import re
 import time
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index f22781d15c0..d16eae58895 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1,22 +1,8 @@
 #!/usr/bin/env python
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
 # Copyright (c) 2015, Intel Corporation.
-# All rights reserved.
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 # AUTHORS
 # Ed Bartosh <ed.bartosh@linux.intel.com>
diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index c56e53dcdd3..d279994ddfd 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -1,5 +1,8 @@
+#
 # Copyright (C) 2017 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 import os
 import time
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 1868ad32066..c742d4759a0 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -1,6 +1,8 @@
+#
 # Copyright (C) 2013 Intel Corporation
 #
-# Released under the MIT license (see COPYING.MIT)
+# SPDX-License-Identifier: MIT
+#
 
 # This module is used by testimage.bbclass for setting up and controlling a target machine.
 
diff --git a/meta/lib/oeqa/utils/__init__.py b/meta/lib/oeqa/utils/__init__.py
index d38a323013c..70fbe7b5523 100644
--- a/meta/lib/oeqa/utils/__init__.py
+++ b/meta/lib/oeqa/utils/__init__.py
@@ -1,3 +1,6 @@
+#
+# SPDX-License-Identifier: MIT
+#
 # Enable other layers to have modules in the same named directory
 from pkgutil import extend_path
 __path__ = extend_path(__path__, __name__)
diff --git a/meta/lib/oeqa/utils/buildproject.py b/meta/lib/oeqa/utils/buildproject.py
index 01a803ab613..e6d80cc8dc1 100644
--- a/meta/lib/oeqa/utils/buildproject.py
+++ b/meta/lib/oeqa/utils/buildproject.py
@@ -1,6 +1,8 @@
+#
 # Copyright (C) 2013-2016 Intel Corporation
 #
-# Released under the MIT license (see COPYING.MIT)
+# SPDX-License-Identifier: MIT
+#
 
 # Provides a class for automating build tests for projects
 
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 2e6a2289cd9..59ebfbe1253 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -1,6 +1,8 @@
+#
 # Copyright (c) 2013-2014 Intel Corporation
 #
-# Released under the MIT license (see COPYING.MIT)
+# SPDX-License-Identifier: MIT
+#
 
 # DESCRIPTION
 # This module is mainly used by scripts/oe-selftest and modules under meta/oeqa/selftest
diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index d8768969214..aabf4110cbe 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -1,6 +1,8 @@
+#
 # Copyright (C) 2013 Intel Corporation
 #
-# Released under the MIT license (see COPYING.MIT)
+# SPDX-License-Identifier: MIT
+#
 
 # Some custom decorators that can be used by unittests
 # Most useful is skipUnlessPassed which can be used for
diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
index 79c22b75c4d..d34e05e2b4b 100644
--- a/meta/lib/oeqa/utils/dump.py
+++ b/meta/lib/oeqa/utils/dump.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 import sys
 import errno
diff --git a/meta/lib/oeqa/utils/ftools.py b/meta/lib/oeqa/utils/ftools.py
index a7233d4ca6e..3093419cc70 100644
--- a/meta/lib/oeqa/utils/ftools.py
+++ b/meta/lib/oeqa/utils/ftools.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 import re
 import errno
diff --git a/meta/lib/oeqa/utils/git.py b/meta/lib/oeqa/utils/git.py
index 757e3f0cbf4..ea35a766eb7 100644
--- a/meta/lib/oeqa/utils/git.py
+++ b/meta/lib/oeqa/utils/git.py
@@ -1,7 +1,7 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# Released under the MIT license (see COPYING.MIT)
+# SPDX-License-Identifier: MIT
 #
 """Git repository interactions"""
 import os
diff --git a/meta/lib/oeqa/utils/gitarchive.py b/meta/lib/oeqa/utils/gitarchive.py
index 9520b2e1261..6e8040eb5c9 100644
--- a/meta/lib/oeqa/utils/gitarchive.py
+++ b/meta/lib/oeqa/utils/gitarchive.py
@@ -4,14 +4,7 @@
 # Copyright (c) 2017, Intel Corporation.
 # Copyright (c) 2019, Linux Foundation
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms and conditions of the GNU General Public License,
-# version 2, as published by the Free Software Foundation.
-#
-# This program is distributed in the hope it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-# more details.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 
 import os
diff --git a/meta/lib/oeqa/utils/httpserver.py b/meta/lib/oeqa/utils/httpserver.py
index a48d4994fd7..aa435590f0e 100644
--- a/meta/lib/oeqa/utils/httpserver.py
+++ b/meta/lib/oeqa/utils/httpserver.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import http.server
 import multiprocessing
 import os
diff --git a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/logparser.py
index 584ad4f2639..cc6d18d94a0 100644
--- a/meta/lib/oeqa/utils/logparser.py
+++ b/meta/lib/oeqa/utils/logparser.py
@@ -1,4 +1,7 @@
 #!/usr/bin/env python
+#
+# SPDX-License-Identifier: MIT
+#
 
 import sys
 import os
diff --git a/meta/lib/oeqa/utils/metadata.py b/meta/lib/oeqa/utils/metadata.py
index e0808ae0ac2..8013aa684dd 100644
--- a/meta/lib/oeqa/utils/metadata.py
+++ b/meta/lib/oeqa/utils/metadata.py
@@ -1,6 +1,6 @@
 # Copyright (C) 2016 Intel Corporation
 #
-# Released under the MIT license (see COPYING.MIT)
+# SPDX-License-Identifier: MIT
 #
 # Functions to get metadata from the testing host used
 # for analytics of test results.
diff --git a/meta/lib/oeqa/utils/network.py b/meta/lib/oeqa/utils/network.py
index 2768f6c5db8..59cbbc4f1bc 100644
--- a/meta/lib/oeqa/utils/network.py
+++ b/meta/lib/oeqa/utils/network.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import socket
 
 def get_free_port():
diff --git a/meta/lib/oeqa/utils/package_manager.py b/meta/lib/oeqa/utils/package_manager.py
index 1495f873210..2d358f7172e 100644
--- a/meta/lib/oeqa/utils/package_manager.py
+++ b/meta/lib/oeqa/utils/package_manager.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
 import os
 import json
 import shutil
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 1abb2c1b6cb..fd386ef5a20 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -1,6 +1,8 @@
+#
 # Copyright (C) 2013 Intel Corporation
 #
-# Released under the MIT license (see COPYING.MIT)
+# SPDX-License-Identifier: MIT
+#
 
 # This module provides a class for starting qemu images using runqemu.
 # It's used by testimage.bbclass.
diff --git a/meta/lib/oeqa/utils/qemutinyrunner.py b/meta/lib/oeqa/utils/qemutinyrunner.py
index 5aa99d0686d..364005bd2d5 100644
--- a/meta/lib/oeqa/utils/qemutinyrunner.py
+++ b/meta/lib/oeqa/utils/qemutinyrunner.py
@@ -1,6 +1,8 @@
+#
 # Copyright (C) 2015 Intel Corporation
 #
-# Released under the MIT license (see COPYING.MIT)
+# SPDX-License-Identifier: MIT
+#
 
 # This module provides a class for starting qemu images of poky tiny.
 # It's used by testimage.bbclass.
diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index d292893c08f..49a07264c67 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -1,7 +1,8 @@
-# -*- coding: utf-8 -*-
+#
 # Copyright (C) 2013 Intel Corporation
 #
-# Released under the MIT license (see COPYING.MIT)
+# SPDX-License-Identifier: MIT
+#
 
 # Provides a class for setting up ssh connections,
 # running commands and copying files to/from a target.
diff --git a/meta/lib/oeqa/utils/subprocesstweak.py b/meta/lib/oeqa/utils/subprocesstweak.py
index 1f7d11b55cb..b47975a4bc0 100644
--- a/meta/lib/oeqa/utils/subprocesstweak.py
+++ b/meta/lib/oeqa/utils/subprocesstweak.py
@@ -1,3 +1,6 @@
+#
+# SPDX-License-Identifier: MIT
+#
 import subprocess
 
 class OETestCalledProcessError(subprocess.CalledProcessError):
diff --git a/meta/lib/oeqa/utils/targetbuild.py b/meta/lib/oeqa/utils/targetbuild.py
index b8db7b2aca0..1055810ca33 100644
--- a/meta/lib/oeqa/utils/targetbuild.py
+++ b/meta/lib/oeqa/utils/targetbuild.py
@@ -1,6 +1,8 @@
+#
 # Copyright (C) 2013 Intel Corporation
 #
-# Released under the MIT license (see COPYING.MIT)
+# SPDX-License-Identifier: MIT
+#
 
 # Provides a class for automating build tests for projects
 
diff --git a/meta/lib/oeqa/utils/testexport.py b/meta/lib/oeqa/utils/testexport.py
index be2a2110fc6..e89d130a9c6 100644
--- a/meta/lib/oeqa/utils/testexport.py
+++ b/meta/lib/oeqa/utils/testexport.py
@@ -1,6 +1,8 @@
+#
 # Copyright (C) 2015 Intel Corporation
 #
-# Released under the MIT license (see COPYING.MIT)
+# SPDX-License-Identifier: MIT
+#
 
 # Provides functions to help with exporting binaries obtained from built targets
 
diff --git a/meta/lib/rootfspostcommands.py b/meta/lib/rootfspostcommands.py
index 4742e0613ce..fdb9f5b8509 100644
--- a/meta/lib/rootfspostcommands.py
+++ b/meta/lib/rootfspostcommands.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 import os
 
 def sort_file(filename, mapping):
diff --git a/oe-init-build-env b/oe-init-build-env
index 861c3e000ed..8c1bd54e57f 100755
--- a/oe-init-build-env
+++ b/oe-init-build-env
@@ -4,19 +4,8 @@
 #
 # Copyright (C) 2006-2011 Linux Foundation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 2 of the License, or
-# (at your option) any later version.
+# SPDX-License-Identifier: GPL-2.0-or-later
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 
 #
 # Normally this is called as '. ./oe-init-build-env <builddir>'
diff --git a/scripts/autobuilder-worker-prereq-tests b/scripts/autobuilder-worker-prereq-tests
index 358dd2beeec..5d7e6e26013 100755
--- a/scripts/autobuilder-worker-prereq-tests
+++ b/scripts/autobuilder-worker-prereq-tests
@@ -3,7 +3,7 @@
 # Script which can be run on new autobuilder workers to check all needed configuration is present.
 # Designed to be run in a repo where bitbake/oe-core are already present.
 #
-
+# SPDX-License-Identifier: GPL-2.0-only
 #
 # Todo
 # Add testtools/subunit import test
diff --git a/scripts/bitbake-prserv-tool b/scripts/bitbake-prserv-tool
index fa31b52584e..e55d98c72e1 100755
--- a/scripts/bitbake-prserv-tool
+++ b/scripts/bitbake-prserv-tool
@@ -1,4 +1,7 @@
 #!/usr/bin/env bash
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 
 help ()
 {
diff --git a/scripts/bitbake-whatchanged b/scripts/bitbake-whatchanged
index 0207777e63c..3095dafa468 100755
--- a/scripts/bitbake-whatchanged
+++ b/scripts/bitbake-whatchanged
@@ -4,18 +4,8 @@
 
 # Copyright (c) 2013 Wind River Systems, Inc.
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
 import os
 import sys
diff --git a/scripts/buildhistory-collect-srcrevs b/scripts/buildhistory-collect-srcrevs
index d375b045d8d..c4d203ff4d9 100755
--- a/scripts/buildhistory-collect-srcrevs
+++ b/scripts/buildhistory-collect-srcrevs
@@ -5,18 +5,8 @@
 # Copyright 2013 Intel Corporation
 # Authored-by:  Paul Eggleton <paul.eggleton@intel.com>
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 import collections
 import os
diff --git a/scripts/buildhistory-diff b/scripts/buildhistory-diff
index 70805b0678b..833f7c33a5b 100755
--- a/scripts/buildhistory-diff
+++ b/scripts/buildhistory-diff
@@ -4,6 +4,9 @@
 #
 # Copyright (C) 2013 Intel Corporation
 # Author: Paul Eggleton <paul.eggleton@linux.intel.com>
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 
 import sys
 import os
diff --git a/scripts/buildstats-diff b/scripts/buildstats-diff
index a128dd324f8..c179c935286 100755
--- a/scripts/buildstats-diff
+++ b/scripts/buildstats-diff
@@ -4,15 +4,9 @@
 #
 # Copyright (c) 2016, Intel Corporation.
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms and conditions of the GNU General Public License,
-# version 2, as published by the Free Software Foundation.
-#
-# This program is distributed in the hope it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-# more details.
+# SPDX-License-Identifier: GPL-2.0-only
 #
+
 import argparse
 import glob
 import logging
diff --git a/scripts/combo-layer b/scripts/combo-layer
index dc40e724044..9b50e9873da 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -7,18 +7,8 @@
 #               Paul Eggleton <paul.eggleton@intel.com>
 #               Richard Purdie <richard.purdie@intel.com>
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 import fnmatch
 import os, sys
diff --git a/scripts/combo-layer-hook-default.sh b/scripts/combo-layer-hook-default.sh
index 1e3a3b9bc8a..11547a98269 100755
--- a/scripts/combo-layer-hook-default.sh
+++ b/scripts/combo-layer-hook-default.sh
@@ -1,4 +1,7 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 # Hook to add source component/revision info to commit message
 # Parameter:
 #   $1 patch-file
diff --git a/scripts/contrib/bb-perf/bb-matrix-plot.sh b/scripts/contrib/bb-perf/bb-matrix-plot.sh
index 136a25570de..e7bd129e9ed 100755
--- a/scripts/contrib/bb-perf/bb-matrix-plot.sh
+++ b/scripts/contrib/bb-perf/bb-matrix-plot.sh
@@ -1,21 +1,8 @@
 #!/bin/bash
 #
 # Copyright (c) 2011, Intel Corporation.
-# All rights reserved.
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 2 of the License, or
-# (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+# SPDX-License-Identifier: GPL-2.0-or-later
 #
 # DESCRIPTION
 # This script operates on the .dat file generated by bb-matrix.sh. It tolerates
diff --git a/scripts/contrib/bb-perf/bb-matrix.sh b/scripts/contrib/bb-perf/bb-matrix.sh
index 106456584dd..b1fff0f3443 100755
--- a/scripts/contrib/bb-perf/bb-matrix.sh
+++ b/scripts/contrib/bb-perf/bb-matrix.sh
@@ -1,21 +1,8 @@
 #!/bin/bash
 #
 # Copyright (c) 2011, Intel Corporation.
-# All rights reserved.
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 2 of the License, or
-# (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+# SPDX-License-Identifier: GPL-2.0-or-later
 #
 # DESCRIPTION
 # This script runs BB_CMD (typically building core-image-sato) for all
diff --git a/scripts/contrib/bb-perf/buildstats-plot.sh b/scripts/contrib/bb-perf/buildstats-plot.sh
index 7e8ae0410e2..898834e5ac2 100755
--- a/scripts/contrib/bb-perf/buildstats-plot.sh
+++ b/scripts/contrib/bb-perf/buildstats-plot.sh
@@ -1,21 +1,8 @@
 #!/usr/bin/env bash
 #
 # Copyright (c) 2011, Intel Corporation.
-# All rights reserved.
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 2 of the License, or
-# (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+# SPDX-License-Identifier: GPL-2.0-or-later
 #
 # DESCRIPTION
 #
diff --git a/scripts/contrib/bb-perf/buildstats.sh b/scripts/contrib/bb-perf/buildstats.sh
index 8d7e2488f03..e9ec2d476a7 100755
--- a/scripts/contrib/bb-perf/buildstats.sh
+++ b/scripts/contrib/bb-perf/buildstats.sh
@@ -1,21 +1,8 @@
 #!/bin/bash
 #
 # Copyright (c) 2011, Intel Corporation.
-# All rights reserved.
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 2 of the License, or
-# (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+# SPDX-License-Identifier: GPL-2.0-or-later
 #
 # DESCRIPTION
 # Given 'buildstats' data (generate by bitbake when setting
diff --git a/scripts/contrib/bbvars.py b/scripts/contrib/bbvars.py
index 286b5a94059..090133600b6 100755
--- a/scripts/contrib/bbvars.py
+++ b/scripts/contrib/bbvars.py
@@ -1,18 +1,6 @@
 #!/usr/bin/env python3
-
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 2 of the License, or
-# (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
 #
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+# SPDX-License-Identifier: GPL-2.0-or-later
 #
 # Copyright (C) Darren Hart <dvhart@linux.intel.com>, 2010
 
diff --git a/scripts/contrib/build-perf-test-wrapper.sh b/scripts/contrib/build-perf-test-wrapper.sh
index 7cbb5d794f1..fa71d4a2e9a 100755
--- a/scripts/contrib/build-perf-test-wrapper.sh
+++ b/scripts/contrib/build-perf-test-wrapper.sh
@@ -4,15 +4,7 @@
 #
 # Copyright (c) 2016, Intel Corporation.
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms and conditions of the GNU General Public License,
-# version 2, as published by the Free Software Foundation.
-#
-# This program is distributed in the hope it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-# more details.
-#
+# SPDX-License-Identifier: GPL-2.0-only
 #
 # This script is a simple wrapper around the actual build performance tester
 # script. This script initializes the build environment, runs
diff --git a/scripts/contrib/ddimage b/scripts/contrib/ddimage
index ab929957a5a..b577d1ca2ab 100755
--- a/scripts/contrib/ddimage
+++ b/scripts/contrib/ddimage
@@ -1,4 +1,7 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 
 # Default to avoiding the first two disks on typical Linux and Mac OS installs
 # Better safe than sorry :-)
diff --git a/scripts/contrib/devtool-stress.py b/scripts/contrib/devtool-stress.py
index d555c51a650..81046ecf49f 100755
--- a/scripts/contrib/devtool-stress.py
+++ b/scripts/contrib/devtool-stress.py
@@ -6,18 +6,7 @@
 #
 # Copyright 2015 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 
 import sys
diff --git a/scripts/contrib/dialog-power-control b/scripts/contrib/dialog-power-control
index 7550ea53be4..ad6070c3693 100755
--- a/scripts/contrib/dialog-power-control
+++ b/scripts/contrib/dialog-power-control
@@ -1,5 +1,7 @@
 #!/bin/sh
 #
+# SPDX-License-Identifier: GPL-2.0-only
+#
 # Simple script to show a manual power prompt for when you want to use
 # automated hardware testing with testimage.bbclass but you don't have a
 # web-enabled power strip or similar to do the power on/off/cycle.
diff --git a/scripts/contrib/documentation-audit.sh b/scripts/contrib/documentation-audit.sh
index 2144aac9360..1191f57a8e3 100755
--- a/scripts/contrib/documentation-audit.sh
+++ b/scripts/contrib/documentation-audit.sh
@@ -1,5 +1,7 @@
 #!/bin/bash
 #
+# SPDX-License-Identifier: GPL-2.0-only
+#
 # Perform an audit of which packages provide documentation and which
 # are missing -doc packages.
 #
@@ -7,7 +9,6 @@
 # this script after source'ing the build environment script, so you're
 # running it from build/ directory.
 #
-# Maintainer: Scott Garman <scott.a.garman@intel.com>
 
 REPORT_DOC_SIMPLE="documentation_exists.txt"
 REPORT_DOC_DETAIL="documentation_exists_detail.txt"
diff --git a/scripts/contrib/graph-tool b/scripts/contrib/graph-tool
index 1df5b8c3459..6d2e68b82e5 100755
--- a/scripts/contrib/graph-tool
+++ b/scripts/contrib/graph-tool
@@ -7,18 +7,7 @@
 #
 # Copyright 2013 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 
 import sys
diff --git a/scripts/contrib/list-packageconfig-flags.py b/scripts/contrib/list-packageconfig-flags.py
index 7ce718624ab..b1d6c852d86 100755
--- a/scripts/contrib/list-packageconfig-flags.py
+++ b/scripts/contrib/list-packageconfig-flags.py
@@ -1,21 +1,10 @@
 #!/usr/bin/env python3
 
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 2 of the License, or
-# (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software Foundation.
-#
 # Copyright (C) 2013 Wind River Systems, Inc.
 # Copyright (C) 2014 Intel Corporation
 #
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
 # - list available recipes which have PACKAGECONFIG flags
 # - list available PACKAGECONFIG flags and all affected recipes
 # - list all recipes and PACKAGECONFIG information
diff --git a/scripts/contrib/oe-build-perf-report-email.py b/scripts/contrib/oe-build-perf-report-email.py
index 913847bbed5..de3862c897e 100755
--- a/scripts/contrib/oe-build-perf-report-email.py
+++ b/scripts/contrib/oe-build-perf-report-email.py
@@ -4,15 +4,9 @@
 #
 # Copyright (c) 2017, Intel Corporation.
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms and conditions of the GNU General Public License,
-# version 2, as published by the Free Software Foundation.
-#
-# This program is distributed in the hope it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-# more details.
+# SPDX-License-Identifier: GPL-2.0-only
 #
+
 import argparse
 import base64
 import logging
diff --git a/scripts/contrib/patchreview.py b/scripts/contrib/patchreview.py
index 072166504da..62c509f51c8 100755
--- a/scripts/contrib/patchreview.py
+++ b/scripts/contrib/patchreview.py
@@ -1,4 +1,7 @@
 #! /usr/bin/env python3
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 
 # TODO
 # - option to just list all broken files
diff --git a/scripts/contrib/patchtest.sh b/scripts/contrib/patchtest.sh
index 7fe566666e1..b1e1ea334b9 100755
--- a/scripts/contrib/patchtest.sh
+++ b/scripts/contrib/patchtest.sh
@@ -1,26 +1,12 @@
 #!/bin/bash
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
 # patchtest: Run patchtest on commits starting at master
 #
 # Copyright (c) 2017, Intel Corporation.
-# All rights reserved.
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 2 of the License, or
-# (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+# SPDX-License-Identifier: GPL-2.0-or-later
 #
+
 set -o errexit
 
 # Default values
diff --git a/scripts/contrib/serdevtry b/scripts/contrib/serdevtry
index 74bd7b7161f..9144730e7ee 100755
--- a/scripts/contrib/serdevtry
+++ b/scripts/contrib/serdevtry
@@ -2,7 +2,8 @@
 
 # Copyright (C) 2014 Intel Corporation
 #
-# Released under the MIT license (see COPYING.MIT)
+# SPDX-License-Identifier: MIT
+#
 
 if [ "$1" = "" -o "$1" = "--help" ] ; then
     echo "Usage: $0 <serial terminal command>"
diff --git a/scripts/contrib/test_build_time.sh b/scripts/contrib/test_build_time.sh
index 9e5725ae54e..23f238adf6e 100755
--- a/scripts/contrib/test_build_time.sh
+++ b/scripts/contrib/test_build_time.sh
@@ -3,22 +3,8 @@
 # Build performance regression test script
 #
 # Copyright 2011 Intel Corporation
-# All rights reserved.
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 2 of the License, or
-# (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 #
+# SPDX-License-Identifier: GPL-2.0-or-later
 #
 # DESCRIPTION
 # This script is intended to be used in conjunction with "git bisect run"
diff --git a/scripts/contrib/test_build_time_worker.sh b/scripts/contrib/test_build_time_worker.sh
index 8e20a9ea7dd..478e8b0d03b 100755
--- a/scripts/contrib/test_build_time_worker.sh
+++ b/scripts/contrib/test_build_time_worker.sh
@@ -1,5 +1,7 @@
 #!/bin/bash
-
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 # This is an example script to be used in conjunction with test_build_time.sh
 
 if [ "$TEST_BUILDDIR" = "" ] ; then
diff --git a/scripts/contrib/uncovered b/scripts/contrib/uncovered
index a8399ad1701..f16128cb7ac 100755
--- a/scripts/contrib/uncovered
+++ b/scripts/contrib/uncovered
@@ -1,23 +1,10 @@
 #!/bin/bash -eur
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
 # Find python modules uncovered by oe-seltest
 #
 # Copyright (c) 2016, Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 # Author: Ed Bartosh <ed.bartosh@linux.intel.com>
 #
diff --git a/scripts/contrib/verify-homepage.py b/scripts/contrib/verify-homepage.py
index cc6e797d8b3..7bffa78e238 100755
--- a/scripts/contrib/verify-homepage.py
+++ b/scripts/contrib/verify-homepage.py
@@ -1,5 +1,7 @@
 #!/usr/bin/env python3
-
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 # This script can be used to verify HOMEPAGE values for all recipes in
 # the current configuration.
 # The result is influenced by network environment, since the timeout of connect url is 5 seconds as default.
diff --git a/scripts/cp-noerror b/scripts/cp-noerror
index 35eb211be31..ab617c5d35a 100755
--- a/scripts/cp-noerror
+++ b/scripts/cp-noerror
@@ -1,5 +1,7 @@
 #!/usr/bin/env python3
 #
+# SPDX-License-Identifier: GPL-2.0-only
+#
 # Allow copying of $1 to $2 but if files in $1 disappear during the copy operation,
 # don't error.
 # Also don't error if $1 disappears.
diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 280880b3f70..3ce03d6c1a0 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -1,21 +1,8 @@
 #!/bin/sh
 #
 # Copyright (c) 2010-2013,  Intel Corporation.
-# All Rights Reserved
-# 
-# This program is free software;  you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 2 of the License, or
-# (at your option) any later version.
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY;  without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
-# the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program;  if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+# SPDX-License-Identifier: GPL-2.0-or-later
 #
 
 #
diff --git a/scripts/crosstap b/scripts/crosstap
index e33fa4ad469..40856bc208d 100755
--- a/scripts/crosstap
+++ b/scripts/crosstap
@@ -17,20 +17,9 @@
 # related to kernel.
 #
 # Copyright (c) 2018, Cisco Systems.
-# All rights reserved.
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
 import sys
 import re
diff --git a/scripts/devtool b/scripts/devtool
index 0e578c0de36..8a4f41bc372 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -4,18 +4,8 @@
 #
 # Copyright (C) 2014-2015 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 import sys
 import os
diff --git a/scripts/gen-lockedsig-cache b/scripts/gen-lockedsig-cache
index 6765891d198..e3076e11a53 100755
--- a/scripts/gen-lockedsig-cache
+++ b/scripts/gen-lockedsig-cache
@@ -1,4 +1,7 @@
 #!/usr/bin/env python3
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 
 import os
 import sys
diff --git a/scripts/gen-site-config b/scripts/gen-site-config
index 7da7a0bd8a2..727b809c0f2 100755
--- a/scripts/gen-site-config
+++ b/scripts/gen-site-config
@@ -1,18 +1,8 @@
 #! /bin/sh
 #  Copyright (c) 2005-2008 Wind River Systems, Inc.
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
 cat << EOF
 AC_PREREQ(2.57)
diff --git a/scripts/lib/argparse_oe.py b/scripts/lib/argparse_oe.py
index 9bdfc1ceca2..94a4ac50110 100644
--- a/scripts/lib/argparse_oe.py
+++ b/scripts/lib/argparse_oe.py
@@ -1,3 +1,7 @@
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 import sys
 import argparse
 from collections import defaultdict, OrderedDict
diff --git a/scripts/lib/build_perf/__init__.py b/scripts/lib/build_perf/__init__.py
index 1f8b7290783..dcbb78042de 100644
--- a/scripts/lib/build_perf/__init__.py
+++ b/scripts/lib/build_perf/__init__.py
@@ -1,14 +1,7 @@
 #
 # Copyright (c) 2017, Intel Corporation.
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms and conditions of the GNU General Public License,
-# version 2, as published by the Free Software Foundation.
-#
-# This program is distributed in the hope it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-# more details.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 """Build performance test library functions"""
 
diff --git a/scripts/lib/build_perf/html.py b/scripts/lib/build_perf/html.py
index 578bb162ee2..d1273c9c501 100644
--- a/scripts/lib/build_perf/html.py
+++ b/scripts/lib/build_perf/html.py
@@ -1,14 +1,7 @@
 #
 # Copyright (c) 2017, Intel Corporation.
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms and conditions of the GNU General Public License,
-# version 2, as published by the Free Software Foundation.
-#
-# This program is distributed in the hope it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-# more details.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 """Helper module for HTML reporting"""
 from jinja2 import Environment, PackageLoader
diff --git a/scripts/lib/build_perf/report.py b/scripts/lib/build_perf/report.py
index d99a36797fd..4e8e2a8a939 100644
--- a/scripts/lib/build_perf/report.py
+++ b/scripts/lib/build_perf/report.py
@@ -1,14 +1,7 @@
 #
 # Copyright (c) 2017, Intel Corporation.
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms and conditions of the GNU General Public License,
-# version 2, as published by the Free Software Foundation.
-#
-# This program is distributed in the hope it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-# more details.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 """Handling of build perf test reports"""
 from collections import OrderedDict, Mapping, namedtuple
diff --git a/scripts/lib/buildstats.py b/scripts/lib/buildstats.py
index f7db3eaf92e..1adab06edf5 100644
--- a/scripts/lib/buildstats.py
+++ b/scripts/lib/buildstats.py
@@ -1,14 +1,7 @@
 #
 # Copyright (c) 2017, Intel Corporation.
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms and conditions of the GNU General Public License,
-# version 2, as published by the Free Software Foundation.
-#
-# This program is distributed in the hope it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-# more details.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 """Functionality for analyzing buildstats"""
 import json
diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index 670f0eea392..8244cf07208 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -1,7 +1,9 @@
 # Yocto Project layer check tool
 #
 # Copyright (C) 2017 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 import os
 import re
diff --git a/scripts/lib/checklayer/case.py b/scripts/lib/checklayer/case.py
index 9dd00412e52..fa9dee384e0 100644
--- a/scripts/lib/checklayer/case.py
+++ b/scripts/lib/checklayer/case.py
@@ -1,5 +1,7 @@
 # Copyright (C) 2017 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 from oeqa.core.case import OETestCase
 
diff --git a/scripts/lib/checklayer/cases/bsp.py b/scripts/lib/checklayer/cases/bsp.py
index b6b611be731..7fd56f5d36c 100644
--- a/scripts/lib/checklayer/cases/bsp.py
+++ b/scripts/lib/checklayer/cases/bsp.py
@@ -1,5 +1,7 @@
 # Copyright (C) 2017 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 import unittest
 
diff --git a/scripts/lib/checklayer/cases/common.py b/scripts/lib/checklayer/cases/common.py
index 1bef61b0487..8ffe028b399 100644
--- a/scripts/lib/checklayer/cases/common.py
+++ b/scripts/lib/checklayer/cases/common.py
@@ -1,5 +1,7 @@
 # Copyright (C) 2017 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 import glob
 import os
diff --git a/scripts/lib/checklayer/cases/distro.py b/scripts/lib/checklayer/cases/distro.py
index df1b3035eb3..f0bee5493c2 100644
--- a/scripts/lib/checklayer/cases/distro.py
+++ b/scripts/lib/checklayer/cases/distro.py
@@ -1,5 +1,7 @@
 # Copyright (C) 2017 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 import unittest
 
diff --git a/scripts/lib/checklayer/context.py b/scripts/lib/checklayer/context.py
index 1bec2c41031..4de8f668fd2 100644
--- a/scripts/lib/checklayer/context.py
+++ b/scripts/lib/checklayer/context.py
@@ -1,5 +1,7 @@
 # Copyright (C) 2017 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 import os
 import sys
diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 8fc7fffcd67..d39c474fbdc 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -4,18 +4,8 @@
 #
 # Copyright (C) 2014 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 """Devtool plugins module"""
 
 import os
diff --git a/scripts/lib/devtool/build.py b/scripts/lib/devtool/build.py
index ba9593f1ad0..7543398d96f 100644
--- a/scripts/lib/devtool/build.py
+++ b/scripts/lib/devtool/build.py
@@ -2,18 +2,8 @@
 #
 # Copyright (C) 2014-2015 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 """Devtool build plugin"""
 
 import os
diff --git a/scripts/lib/devtool/build_image.py b/scripts/lib/devtool/build_image.py
index e5810389beb..9388abbacf6 100644
--- a/scripts/lib/devtool/build_image.py
+++ b/scripts/lib/devtool/build_image.py
@@ -2,18 +2,8 @@
 #
 # Copyright (C) 2015 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 """Devtool plugin containing the build-image subcommand."""
 
diff --git a/scripts/lib/devtool/build_sdk.py b/scripts/lib/devtool/build_sdk.py
index b89d65b0cb8..6fe02fff2a4 100644
--- a/scripts/lib/devtool/build_sdk.py
+++ b/scripts/lib/devtool/build_sdk.py
@@ -2,18 +2,8 @@
 #
 # Copyright (C) 2015-2016 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 import os
 import subprocess
diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index f345f31b7bb..d1ce2309f96 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -2,18 +2,8 @@
 #
 # Copyright (C) 2014-2016 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 """Devtool plugin containing the deploy subcommands"""
 
 import logging
diff --git a/scripts/lib/devtool/export.py b/scripts/lib/devtool/export.py
index 35349e2cda1..01174edae55 100644
--- a/scripts/lib/devtool/export.py
+++ b/scripts/lib/devtool/export.py
@@ -2,18 +2,8 @@
 #
 # Copyright (C) 2014-2017 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 """Devtool export plugin"""
 
 import os
diff --git a/scripts/lib/devtool/import.py b/scripts/lib/devtool/import.py
index 4264b7d8209..6829851669a 100644
--- a/scripts/lib/devtool/import.py
+++ b/scripts/lib/devtool/import.py
@@ -2,18 +2,8 @@
 #
 # Copyright (C) 2014-2017 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 """Devtool import plugin"""
 
 import os
diff --git a/scripts/lib/devtool/package.py b/scripts/lib/devtool/package.py
index af9e8f15f51..c2367342c3a 100644
--- a/scripts/lib/devtool/package.py
+++ b/scripts/lib/devtool/package.py
@@ -2,18 +2,8 @@
 #
 # Copyright (C) 2014-2015 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 """Devtool plugin containing the package subcommands"""
 
 import os
diff --git a/scripts/lib/devtool/runqemu.py b/scripts/lib/devtool/runqemu.py
index e26cf28c2f2..ead978aabc3 100644
--- a/scripts/lib/devtool/runqemu.py
+++ b/scripts/lib/devtool/runqemu.py
@@ -2,18 +2,8 @@
 #
 # Copyright (C) 2015 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 """Devtool runqemu plugin"""
 
diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index 4616753797b..3aa42a14663 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -2,18 +2,8 @@
 #
 # Copyright (C) 2015-2016 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 import os
 import subprocess
diff --git a/scripts/lib/devtool/search.py b/scripts/lib/devtool/search.py
index b4f209b7e3a..d24040df379 100644
--- a/scripts/lib/devtool/search.py
+++ b/scripts/lib/devtool/search.py
@@ -2,18 +2,8 @@
 #
 # Copyright (C) 2015 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 """Devtool search plugin"""
 
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 0a1e329e61e..aca74b1fc66 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -2,18 +2,8 @@
 #
 # Copyright (C) 2014-2017 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 """Devtool standard plugins"""
 
 import os
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 75e765e0195..62ec2f94cbc 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -2,18 +2,7 @@
 #
 # Copyright (C) 2014-2017 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 """Devtool upgrade plugin"""
 
diff --git a/scripts/lib/devtool/utilcmds.py b/scripts/lib/devtool/utilcmds.py
index 7cd139fb8bc..964817766b7 100644
--- a/scripts/lib/devtool/utilcmds.py
+++ b/scripts/lib/devtool/utilcmds.py
@@ -2,18 +2,8 @@
 #
 # Copyright (C) 2015-2016 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 """Devtool utility plugins"""
 
diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index 3f2c134ad51..e9d52bb67b4 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -2,18 +2,8 @@
 #
 # Copyright (C) 2015 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 import sys
 import os
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index dbd74a1ca3d..98277f74c96 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -2,18 +2,8 @@
 #
 # Copyright (C) 2014-2017 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 import sys
 import os
diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index 4743c740cf9..3cb02766c87 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -2,18 +2,8 @@
 #
 # Copyright (C) 2014-2016 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 import re
 import logging
diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index 5bd2aa337c5..1a38bd0b14e 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -2,18 +2,8 @@
 #
 # Copyright (C) 2015 Mentor Graphics Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 import ast
 import codecs
diff --git a/scripts/lib/recipetool/create_kernel.py b/scripts/lib/recipetool/create_kernel.py
index ca4996c7ace..5740589a683 100644
--- a/scripts/lib/recipetool/create_kernel.py
+++ b/scripts/lib/recipetool/create_kernel.py
@@ -2,18 +2,8 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 import re
 import logging
diff --git a/scripts/lib/recipetool/create_kmod.py b/scripts/lib/recipetool/create_kmod.py
index 3982537a4e9..85b5c48e531 100644
--- a/scripts/lib/recipetool/create_kmod.py
+++ b/scripts/lib/recipetool/create_kmod.py
@@ -2,18 +2,8 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 import re
 import logging
diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index 0b09ed0b043..39429ebad3c 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -2,18 +2,8 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 import os
 import sys
diff --git a/scripts/lib/recipetool/edit.py b/scripts/lib/recipetool/edit.py
index c4789a9994c..94bdf7bca4e 100644
--- a/scripts/lib/recipetool/edit.py
+++ b/scripts/lib/recipetool/edit.py
@@ -6,18 +6,8 @@
 #
 # Copyright (C) 2018 Mentor Graphics Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 import argparse
 import errno
diff --git a/scripts/lib/recipetool/newappend.py b/scripts/lib/recipetool/newappend.py
index 76707b4c91b..08e2474dc42 100644
--- a/scripts/lib/recipetool/newappend.py
+++ b/scripts/lib/recipetool/newappend.py
@@ -7,18 +7,8 @@
 #
 # Copyright (C) 2015 Christopher Larson <kergoth@gmail.com>
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 import argparse
 import errno
diff --git a/scripts/lib/recipetool/setvar.py b/scripts/lib/recipetool/setvar.py
index 9de315a0efb..f8e2ee75fbe 100644
--- a/scripts/lib/recipetool/setvar.py
+++ b/scripts/lib/recipetool/setvar.py
@@ -2,18 +2,8 @@
 #
 # Copyright (C) 2015 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 import sys
 import os
diff --git a/scripts/lib/resulttool/log.py b/scripts/lib/resulttool/log.py
index 18830409035..44af40a7c74 100644
--- a/scripts/lib/resulttool/log.py
+++ b/scripts/lib/resulttool/log.py
@@ -2,14 +2,7 @@
 #
 # Copyright (c) 2019 Garmin International
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms and conditions of the GNU General Public License,
-# version 2, as published by the Free Software Foundation.
-#
-# This program is distributed in the hope it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-# more details.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 import resulttool.resultutils as resultutils
 
diff --git a/scripts/lib/resulttool/manualexecution.py b/scripts/lib/resulttool/manualexecution.py
index dc368f36fcc..df28e1d21e8 100755
--- a/scripts/lib/resulttool/manualexecution.py
+++ b/scripts/lib/resulttool/manualexecution.py
@@ -2,15 +2,9 @@
 #
 # Copyright (c) 2018, Intel Corporation.
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms and conditions of the GNU General Public License,
-# version 2, as published by the Free Software Foundation.
-#
-# This program is distributed in the hope it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-# more details.
+# SPDX-License-Identifier: GPL-2.0-only
 #
+
 import argparse
 import json
 import os
diff --git a/scripts/lib/resulttool/merge.py b/scripts/lib/resulttool/merge.py
index 7159463f6ed..70d23a48fdc 100644
--- a/scripts/lib/resulttool/merge.py
+++ b/scripts/lib/resulttool/merge.py
@@ -3,15 +3,9 @@
 # Copyright (c) 2019, Intel Corporation.
 # Copyright (c) 2019, Linux Foundation
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms and conditions of the GNU General Public License,
-# version 2, as published by the Free Software Foundation.
-#
-# This program is distributed in the hope it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-# more details.
+# SPDX-License-Identifier: GPL-2.0-only
 #
+
 import os
 import json
 import resulttool.resultutils as resultutils
diff --git a/scripts/lib/resulttool/regression.py b/scripts/lib/resulttool/regression.py
index fa90ab1e522..9f952951b3f 100644
--- a/scripts/lib/resulttool/regression.py
+++ b/scripts/lib/resulttool/regression.py
@@ -3,15 +3,9 @@
 # Copyright (c) 2019, Intel Corporation.
 # Copyright (c) 2019, Linux Foundation
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms and conditions of the GNU General Public License,
-# version 2, as published by the Free Software Foundation.
-#
-# This program is distributed in the hope it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-# more details.
+# SPDX-License-Identifier: GPL-2.0-only
 #
+
 import resulttool.resultutils as resultutils
 import json
 
diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index b9a8903f4c2..cb6b1cf9487 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -3,15 +3,9 @@
 # Copyright (c) 2019, Intel Corporation.
 # Copyright (c) 2019, Linux Foundation
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms and conditions of the GNU General Public License,
-# version 2, as published by the Free Software Foundation.
-#
-# This program is distributed in the hope it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-# more details.
+# SPDX-License-Identifier: GPL-2.0-only
 #
+
 import os
 import glob
 import json
diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index 8d17c7cd658..813e185d869 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -3,15 +3,9 @@
 # Copyright (c) 2019, Intel Corporation.
 # Copyright (c) 2019, Linux Foundation
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms and conditions of the GNU General Public License,
-# version 2, as published by the Free Software Foundation.
-#
-# This program is distributed in the hope it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-# more details.
+# SPDX-License-Identifier: GPL-2.0-only
 #
+
 import os
 import json
 import scriptpath
diff --git a/scripts/lib/resulttool/store.py b/scripts/lib/resulttool/store.py
index acdfbd94fdf..06505aecc05 100644
--- a/scripts/lib/resulttool/store.py
+++ b/scripts/lib/resulttool/store.py
@@ -3,15 +3,9 @@
 # Copyright (c) 2019, Intel Corporation.
 # Copyright (c) 2019, Linux Foundation
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms and conditions of the GNU General Public License,
-# version 2, as published by the Free Software Foundation.
-#
-# This program is distributed in the hope it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-# more details.
+# SPDX-License-Identifier: GPL-2.0-only
 #
+
 import tempfile
 import os
 import subprocess
diff --git a/scripts/lib/scriptpath.py b/scripts/lib/scriptpath.py
index d00317e18d9..f32326db3a1 100644
--- a/scripts/lib/scriptpath.py
+++ b/scripts/lib/scriptpath.py
@@ -3,18 +3,8 @@
 # Copyright (C) 2012-2014 Intel Corporation
 # Copyright (C) 2011 Mentor Graphics Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 import sys
 import os
diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index 0633c7066e6..e7e7021c245 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -2,18 +2,8 @@
 #
 # Copyright (C) 2014 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 import argparse
 import glob
diff --git a/scripts/lib/wic/__init__.py b/scripts/lib/wic/__init__.py
index 85876b138c7..ba2d6140619 100644
--- a/scripts/lib/wic/__init__.py
+++ b/scripts/lib/wic/__init__.py
@@ -3,18 +3,8 @@
 # Copyright (c) 2007 Red Hat, Inc.
 # Copyright (c) 2011 Intel, Inc.
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms of the GNU General Public License as published by the Free
-# Software Foundation; version 2 of the License
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-# for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc., 59
-# Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 
 class WicError(Exception):
     pass
diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index ab33fa6042e..42e93c3eb82 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -1,21 +1,7 @@
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
 # Copyright (c) 2013, Intel Corporation.
-# All rights reserved.
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 # DESCRIPTION
 
diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index abbf958b8c8..244c07a71cf 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -1,13 +1,8 @@
+#
 # Copyright (c) 2012 Intel, Inc.
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License, version 2,
-# as published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-# General Public License for more details.
 
 """
 This module implements python implements a way to get file block. Two methods
diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 64f08052c7a..3a40fc0ea29 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -1,21 +1,6 @@
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
-#
 # Copyright (c) 2013, Intel Corporation.
-# All rights reserved.
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
 #
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 # DESCRIPTION
 # This module implements some basic help invocation functions along
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 08baf76123e..62048213b30 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -1,21 +1,8 @@
 #!/usr/bin/env python -tt
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
 # Copyright (c) 2016 Intel, Inc.
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms of the GNU General Public License as published by the Free
-# Software Foundation; version 2 of the License
-#
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-# for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc., 59
-# Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 # DESCRIPTION
 # This module provides parser for kickstart format
diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index ee888b478cc..1f199b9f234 100644
--- a/scripts/lib/wic/misc.py
+++ b/scripts/lib/wic/misc.py
@@ -1,21 +1,7 @@
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
 # Copyright (c) 2013, Intel Corporation.
-# All rights reserved.
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 # DESCRIPTION
 # This module provides a place to collect various wic-related utils
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index df31c17c40d..01466b258d4 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -1,21 +1,7 @@
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
 # Copyright (c) 2013-2016 Intel Corporation.
-# All rights reserved.
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 # DESCRIPTION
 # This module provides the OpenEmbedded partition object definitions.
diff --git a/scripts/lib/wic/pluginbase.py b/scripts/lib/wic/pluginbase.py
index 686d2fee3b3..bfb73ca6155 100644
--- a/scripts/lib/wic/pluginbase.py
+++ b/scripts/lib/wic/pluginbase.py
@@ -2,18 +2,8 @@
 #
 # Copyright (c) 2011 Intel, Inc.
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms of the GNU General Public License as published by the Free
-# Software Foundation; version 2 of the License
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-# for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc., 59
-# Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 
 __all__ = ['ImagerPlugin', 'SourcePlugin']
 
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index bb14a334b2c..67addeff3e1 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -1,21 +1,7 @@
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
 # Copyright (c) 2013, Intel Corporation.
-# All rights reserved.
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 # DESCRIPTION
 # This implements the 'direct' imager plugin class for 'wic'
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 83a7e189ed9..3540b08440a 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -1,21 +1,7 @@
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
 # Copyright (c) 2014, Intel Corporation.
-# All rights reserved.
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 # DESCRIPTION
 # This implements the 'bootimg-efi' source plugin class for 'wic'
diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index ddc880be366..138986a71ef 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -1,18 +1,5 @@
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 # DESCRIPTION
 # This implements the 'bootimg-partition' source plugin class for
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index 9347aa7fcb7..6c9f54a8974 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -1,21 +1,7 @@
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
 # Copyright (c) 2014, Intel Corporation.
-# All rights reserved.
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 # DESCRIPTION
 # This implements the 'bootimg-pcbios' source plugin class for 'wic'
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index 170077c22c2..96d07ff629b 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -1,18 +1,5 @@
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
-
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
 #
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 # DESCRIPTION
 # This implements the 'isoimage-isohybrid' source plugin class for 'wic'
diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index e86398ac8fb..df86d6729c6 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -1,18 +1,5 @@
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 
 import logging
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index aec720fb227..e26e95b9913 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -1,21 +1,7 @@
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
 # Copyright (c) 2014, Intel Corporation.
-# All rights reserved.
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 # DESCRIPTION
 # This implements the 'rootfs' source plugin class for 'wic'
diff --git a/scripts/lnr b/scripts/lnr
index 5fed780eb2c..a2ac4fec0f2 100755
--- a/scripts/lnr
+++ b/scripts/lnr
@@ -1,4 +1,7 @@
 #! /usr/bin/env python3
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 
 # Create a *relative* symlink, just like ln --relative does but without needing
 # coreutils 8.16.
diff --git a/scripts/multilib_header_wrapper.h b/scripts/multilib_header_wrapper.h
index 4824790783e..c81e7ee5e89 100644
--- a/scripts/multilib_header_wrapper.h
+++ b/scripts/multilib_header_wrapper.h
@@ -1,23 +1,7 @@
 /*
  * Copyright (C) 2005-2011 by Wind River Systems, Inc.
  *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to deal
- * in the Software without restriction, including without limitation the rights
- * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
- * copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
- * THE SOFTWARE.
+ * SPDX-License-Identifier: MIT
  * 
  */
 
diff --git a/scripts/native-intercept/chown b/scripts/native-intercept/chown
index 4f43271c2b1..399c979f9ac 100755
--- a/scripts/native-intercept/chown
+++ b/scripts/native-intercept/chown
@@ -1,2 +1,5 @@
 #! /bin/sh
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 echo "Intercept $0: $@ -- do nothing"
diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index f6fb458c2eb..21bde7e1561 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -4,15 +4,9 @@
 #
 # Copyright (c) 2017, Intel Corporation.
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms and conditions of the GNU General Public License,
-# version 2, as published by the Free Software Foundation.
-#
-# This program is distributed in the hope it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-# more details.
+# SPDX-License-Identifier: GPL-2.0-only
 #
+
 import argparse
 import json
 import logging
diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
index 669470fa978..0b13f24888a 100755
--- a/scripts/oe-build-perf-test
+++ b/scripts/oe-build-perf-test
@@ -4,16 +4,9 @@
 #
 # Copyright (c) 2016, Intel Corporation.
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms and conditions of the GNU General Public License,
-# version 2, as published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-# more details.
-#
-"""Build performance test script"""
+
 import argparse
 import errno
 import fcntl
diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 52ce32987c0..96bb0c3dc95 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -4,19 +4,8 @@
 #
 # Copyright (C) 2006-2011 Linux Foundation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 2 of the License, or
-# (at your option) any later version.
+# SPDX-License-Identifier: GPL-2.0-or-later
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 
 if ! $(return >/dev/null 2>&1) ; then
     echo 'oe-buildenv-internal: error: this script must be sourced'
diff --git a/scripts/oe-check-sstate b/scripts/oe-check-sstate
index d06efe436a5..ca249ca67b9 100755
--- a/scripts/oe-check-sstate
+++ b/scripts/oe-check-sstate
@@ -5,18 +5,8 @@
 # Copyright 2016 Intel Corporation
 # Authored-by:  Paul Eggleton <paul.eggleton@intel.com>
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 import sys
 import os
diff --git a/scripts/oe-depends-dot b/scripts/oe-depends-dot
index 6c7e9d3383b..5eb3e12769a 100755
--- a/scripts/oe-depends-dot
+++ b/scripts/oe-depends-dot
@@ -2,18 +2,8 @@
 #
 # Copyright (C) 2018 Wind River Systems, Inc.
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
 import os
 import sys
diff --git a/scripts/oe-find-native-sysroot b/scripts/oe-find-native-sysroot
index cc146b3fdbc..5146bbf9999 100755
--- a/scripts/oe-find-native-sysroot
+++ b/scripts/oe-find-native-sysroot
@@ -17,18 +17,8 @@
 #
 # Copyright (c) 2010 Linux Foundation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 if [ "$1" = '--help' -o "$1" = '-h' -o $# -ne 1 ] ; then
     echo 'Usage: oe-find-native-sysroot <recipe> [-h|--help]'
diff --git a/scripts/oe-git-archive b/scripts/oe-git-archive
index ab1c2b9ad4c..9305ed0b0f9 100755
--- a/scripts/oe-git-archive
+++ b/scripts/oe-git-archive
@@ -4,15 +4,9 @@
 #
 # Copyright (c) 2017, Intel Corporation.
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms and conditions of the GNU General Public License,
-# version 2, as published by the Free Software Foundation.
-#
-# This program is distributed in the hope it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-# more details.
+# SPDX-License-Identifier: GPL-2.0-only
 #
+
 import argparse
 import logging
 import os
diff --git a/scripts/oe-git-proxy b/scripts/oe-git-proxy
index 1800942f364..bb2ed2a46e4 100755
--- a/scripts/oe-git-proxy
+++ b/scripts/oe-git-proxy
@@ -13,7 +13,8 @@
 # ALL_PROXY=https://proxy.example.com:8080
 #
 # Copyright (c) 2013, Intel Corporation.
-# All rights reserved.
+#
+# SPDX-License-Identifier: GPL-2.0-only
 #
 # AUTHORS
 # Darren Hart <dvhart@linux.intel.com>
diff --git a/scripts/oe-gnome-terminal-phonehome b/scripts/oe-gnome-terminal-phonehome
index e02354883a2..b6b9a3867b2 100755
--- a/scripts/oe-gnome-terminal-phonehome
+++ b/scripts/oe-gnome-terminal-phonehome
@@ -1,5 +1,7 @@
 #!/bin/sh
 #
+# SPDX-License-Identifier: GPL-2.0-only
+#
 # Gnome terminal won't tell us which PID a given command is run as 
 # or allow a single instance so we can't tell when it completes.
 # This allows us to figure out the PID of the target so we can tell 
diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 53739b0bfc5..9cc78d11049 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -6,18 +6,7 @@
 #
 # Copyright 2012-2015 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 
 import sys
diff --git a/scripts/oe-publish-sdk b/scripts/oe-publish-sdk
index ee33acf902c..4b70f436b1a 100755
--- a/scripts/oe-publish-sdk
+++ b/scripts/oe-publish-sdk
@@ -1,21 +1,11 @@
 #!/usr/bin/env python3
-
+#
 # OpenEmbedded SDK publishing tool
-
-# Copyright (C) 2015-2016 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# Copyright (C) 2015-2016 Intel Corporation
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 import sys
 import os
diff --git a/scripts/oe-pylint b/scripts/oe-pylint
index 74ff4b884de..7cc1ccb010e 100755
--- a/scripts/oe-pylint
+++ b/scripts/oe-pylint
@@ -1,5 +1,7 @@
 #!/bin/bash
 #
+# SPDX-License-Identifier: GPL-2.0-only
+#
 # Run the pylint3 against our common python module spaces and print a report of potential issues
 #
 this_dir=$(dirname $(readlink -f $0))
diff --git a/scripts/oe-run-native b/scripts/oe-run-native
index a29e99438a5..bea5d696d70 100755
--- a/scripts/oe-run-native
+++ b/scripts/oe-run-native
@@ -1,20 +1,8 @@
 #!/bin/bash
 #
 # Copyright (c) 2016,  Intel Corporation.
-# All Rights Reserved
 #
-# This program is free software;  you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 2 of the License, or
-# (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY;  without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
-# the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program;  if not, see <http://www.gnu.org/licenses/>
+# SPDX-License-Identifier: GPL-2.0-or-later
 #
 
 #
diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 1bf860a4155..57662b2f75d 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -2,18 +2,8 @@
 
 # Copyright (c) 2013-2017 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 # DESCRIPTION
 # This script runs tests defined in meta/lib/oeqa/selftest/
diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 55d73ca1e46..30eaa8efbe1 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -4,19 +4,8 @@
 #
 # Copyright (C) 2006-2011 Linux Foundation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 2 of the License, or
-# (at your option) any later version.
+# SPDX-License-Identifier: GPL-2.0-or-later
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 
 if [ -z "$BUILDDIR" ]; then
     echo >&2 "Error: The build directory (BUILDDIR) must be set!"
diff --git a/scripts/oe-test b/scripts/oe-test
index 34d9012d143..55985b0b245 100755
--- a/scripts/oe-test
+++ b/scripts/oe-test
@@ -3,7 +3,9 @@
 # OpenEmbedded test tool
 #
 # Copyright (C) 2016 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 import os
 import sys
diff --git a/scripts/oe-trim-schemas b/scripts/oe-trim-schemas
index 7c199ef1df2..bf77c8cf643 100755
--- a/scripts/oe-trim-schemas
+++ b/scripts/oe-trim-schemas
@@ -1,4 +1,7 @@
 #! /usr/bin/env python3
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 
 import sys
 try:
diff --git a/scripts/oepydevshell-internal.py b/scripts/oepydevshell-internal.py
index 2f7d5d433e8..96c078ef3df 100755
--- a/scripts/oepydevshell-internal.py
+++ b/scripts/oepydevshell-internal.py
@@ -1,4 +1,7 @@
 #!/usr/bin/env python3
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 
 import os
 import sys
diff --git a/scripts/opkg-query-helper.py b/scripts/opkg-query-helper.py
index ce89491f60b..bc3ab43823a 100755
--- a/scripts/opkg-query-helper.py
+++ b/scripts/opkg-query-helper.py
@@ -6,21 +6,8 @@
 #
 # Copyright 2012 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-#
-
 
 import sys
 import fileinput
diff --git a/scripts/postinst-intercepts/delay_to_first_boot b/scripts/postinst-intercepts/delay_to_first_boot
index ecdbef95dde..fa8e1caaf5c 100644
--- a/scripts/postinst-intercepts/delay_to_first_boot
+++ b/scripts/postinst-intercepts/delay_to_first_boot
@@ -1,2 +1,6 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: MIT
+#
+
 exit 1
diff --git a/scripts/postinst-intercepts/postinst_intercept b/scripts/postinst-intercepts/postinst_intercept
index b18e806d431..b91974c8858 100755
--- a/scripts/postinst-intercepts/postinst_intercept
+++ b/scripts/postinst-intercepts/postinst_intercept
@@ -1,5 +1,7 @@
 #!/bin/sh
 #
+# SPDX-License-Identifier: MIT
+#
 # This script is called from inside postinstall scriptlets at do_rootfs time. It
 # actually adds, at the end, the list of packages for which the intercept script
 # is valid. Also, if one wants to pass any variables to the intercept script from
diff --git a/scripts/postinst-intercepts/update_font_cache b/scripts/postinst-intercepts/update_font_cache
index e0ec471964c..3053c7065f4 100644
--- a/scripts/postinst-intercepts/update_font_cache
+++ b/scripts/postinst-intercepts/update_font_cache
@@ -1,4 +1,7 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: MIT
+#
 
 set -e
 
diff --git a/scripts/postinst-intercepts/update_gio_module_cache b/scripts/postinst-intercepts/update_gio_module_cache
index d1f0140947e..c87fa85db9e 100644
--- a/scripts/postinst-intercepts/update_gio_module_cache
+++ b/scripts/postinst-intercepts/update_gio_module_cache
@@ -1,4 +1,7 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: MIT
+#
 
 set -e
 
diff --git a/scripts/postinst-intercepts/update_gtk_immodules_cache b/scripts/postinst-intercepts/update_gtk_immodules_cache
index 395516971e9..9f07ccca6b8 100644
--- a/scripts/postinst-intercepts/update_gtk_immodules_cache
+++ b/scripts/postinst-intercepts/update_gtk_immodules_cache
@@ -1,4 +1,7 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: MIT
+#
 
 set -e
 
diff --git a/scripts/postinst-intercepts/update_icon_cache b/scripts/postinst-intercepts/update_icon_cache
index 9cf2a72a0cf..212209a9daf 100644
--- a/scripts/postinst-intercepts/update_icon_cache
+++ b/scripts/postinst-intercepts/update_icon_cache
@@ -1,4 +1,7 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: MIT
+#
 
 set -e
 
diff --git a/scripts/postinst-intercepts/update_pixbuf_cache b/scripts/postinst-intercepts/update_pixbuf_cache
index ebea07c356a..ea12814474e 100644
--- a/scripts/postinst-intercepts/update_pixbuf_cache
+++ b/scripts/postinst-intercepts/update_pixbuf_cache
@@ -1,4 +1,7 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: MIT
+#
 
 set -e
 
diff --git a/scripts/postinst-intercepts/update_udev_hwdb b/scripts/postinst-intercepts/update_udev_hwdb
index b5cce0a09d1..c4fb2bffcbf 100644
--- a/scripts/postinst-intercepts/update_udev_hwdb
+++ b/scripts/postinst-intercepts/update_udev_hwdb
@@ -1,4 +1,7 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: MIT
+#
 
 set -e
 
diff --git a/scripts/pythondeps b/scripts/pythondeps
index 3e13a587eef..be21dd84ebc 100755
--- a/scripts/pythondeps
+++ b/scripts/pythondeps
@@ -1,5 +1,7 @@
 #!/usr/bin/env python3
 #
+# SPDX-License-Identifier: GPL-2.0-only
+#
 # Determine dependencies of python scripts or available python modules in a search path.
 #
 # Given the -d argument and a filename/filenames, returns the modules imported by those files.
diff --git a/scripts/recipetool b/scripts/recipetool
index 3a3c9b74450..e2d585d2c54 100755
--- a/scripts/recipetool
+++ b/scripts/recipetool
@@ -4,18 +4,8 @@
 #
 # Copyright (C) 2014 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 import sys
 import os
diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
index c752fa2c619..8c0fdb986aa 100755
--- a/scripts/relocate_sdk.py
+++ b/scripts/relocate_sdk.py
@@ -2,18 +2,7 @@
 #
 # Copyright (c) 2012 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+# SPDX-License-Identifier: GPL-2.0-only
 #
 # DESCRIPTION
 # This script is called by the SDK installer script. It replaces the dynamic
diff --git a/scripts/resulttool b/scripts/resulttool
index 9477667a870..fc282bda6c6 100755
--- a/scripts/resulttool
+++ b/scripts/resulttool
@@ -25,14 +25,7 @@
 #
 # Copyright (c) 2019, Intel Corporation.
 #
-# This program is free software; you can redistribute it and/or modify it
-# under the terms and conditions of the GNU General Public License,
-# version 2, as published by the Free Software Foundation.
-#
-# This program is distributed in the hope it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-# more details.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 
 import os
diff --git a/scripts/rpm2cpio.sh b/scripts/rpm2cpio.sh
index cf23472ba95..876c53c5d91 100755
--- a/scripts/rpm2cpio.sh
+++ b/scripts/rpm2cpio.sh
@@ -1,5 +1,4 @@
 #!/bin/sh -efu
-
 # This file comes from rpm 4.x distribution
 
 fatal() {
diff --git a/scripts/runqemu b/scripts/runqemu
index a4fc606e50c..39bed038d5a 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -5,18 +5,8 @@
 # Copyright (C) 2006-2011 Linux Foundation
 # Copyright (c) 2016 Wind River Systems, Inc.
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 import os
 import sys
diff --git a/scripts/runqemu-addptable2image b/scripts/runqemu-addptable2image
index f0195ad8a32..ca29427258c 100755
--- a/scripts/runqemu-addptable2image
+++ b/scripts/runqemu-addptable2image
@@ -4,20 +4,8 @@
 #
 # Copyright (C) 2006-2007 OpenedHand Ltd.
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 2 of the License, or
-# (at your option) any later version.
+# SPDX-License-Identifier: GPL-2.0-or-later
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
-
 
 IMAGE=$1
 IMAGEOUT=$2
diff --git a/scripts/runqemu-export-rootfs b/scripts/runqemu-export-rootfs
index 70cdcdbb13f..384c0917130 100755
--- a/scripts/runqemu-export-rootfs
+++ b/scripts/runqemu-export-rootfs
@@ -2,18 +2,8 @@
 #
 # Copyright (c) 2005-2009 Wind River Systems, Inc.
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
 usage() {
 	echo "Usage: $0 {start|stop|restart} <nfs-export-dir>"
diff --git a/scripts/runqemu-extract-sdk b/scripts/runqemu-extract-sdk
index 4da3eb10a79..8a4ee90a1d6 100755
--- a/scripts/runqemu-extract-sdk
+++ b/scripts/runqemu-extract-sdk
@@ -7,18 +7,8 @@
 #
 # Copyright (c) 2010 Intel Corp.
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
 function usage() {
 	echo "Usage: $0 <image-tarball> <extract-dir>"
diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-gen-tapdevs
index 869fee261d4..a6ee4517dad 100755
--- a/scripts/runqemu-gen-tapdevs
+++ b/scripts/runqemu-gen-tapdevs
@@ -9,18 +9,8 @@
 #
 # Copyright (C) 2010 Intel Corp.
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 uid=`id -u`
 gid=`id -g`
diff --git a/scripts/runqemu-ifdown b/scripts/runqemu-ifdown
index 24869685889..a104c37bf8b 100755
--- a/scripts/runqemu-ifdown
+++ b/scripts/runqemu-ifdown
@@ -13,18 +13,8 @@
 #
 # Copyright (c) 2006-2011 Linux Foundation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 usage() {
 	echo "sudo $(basename $0) <tap-dev> <native-sysroot-basedir>"
diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
index 59a15eaa2e6..bb661740c57 100755
--- a/scripts/runqemu-ifup
+++ b/scripts/runqemu-ifup
@@ -20,18 +20,8 @@
 #
 # Copyright (c) 2006-2011 Linux Foundation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 usage() {
 	echo "sudo $(basename $0) <uid> <gid> <native-sysroot-basedir>"
diff --git a/scripts/send-error-report b/scripts/send-error-report
index 0ed7cc905e6..cfbcaa52cbc 100755
--- a/scripts/send-error-report
+++ b/scripts/send-error-report
@@ -6,6 +6,9 @@
 # Copyright (C) 2013 Intel Corporation
 # Author: Andreea Proca <andreea.b.proca@intel.com>
 # Author: Michael Wood <michael.g.wood@intel.com>
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 
 import urllib.request, urllib.error
 import sys
diff --git a/scripts/send-pull-request b/scripts/send-pull-request
index 883deacb07f..70b5a5cfb2c 100755
--- a/scripts/send-pull-request
+++ b/scripts/send-pull-request
@@ -1,21 +1,8 @@
 #!/bin/bash
 #
 # Copyright (c) 2010-2011,  Intel Corporation.
-# All Rights Reserved
-# 
-# This program is free software;  you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 2 of the License, or
-# (at your option) any later version.
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY;  without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
-# the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program;  if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+# SPDX-License-Identifier: GPL-2.0-or-later
 #
 
 #
diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index 2ab450ab59c..f1706a2229c 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -2,18 +2,7 @@
 
 #  Copyright (c) 2012 Wind River Systems, Inc.
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-# See the GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+# SPDX-License-Identifier: GPL-2.0-only
 #
 
 # Global vars
diff --git a/scripts/sstate-diff-machines.sh b/scripts/sstate-diff-machines.sh
index 27c6a330060..1d721eb87dd 100755
--- a/scripts/sstate-diff-machines.sh
+++ b/scripts/sstate-diff-machines.sh
@@ -1,5 +1,7 @@
 #!/bin/bash
-
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 # Used to compare sstate checksums between MACHINES.
 # Execute script and compare generated list.M files.
 # Using bash to have PIPESTATUS variable.
diff --git a/scripts/sstate-sysroot-cruft.sh b/scripts/sstate-sysroot-cruft.sh
index d9917f5152c..fbf1ca3c431 100755
--- a/scripts/sstate-sysroot-cruft.sh
+++ b/scripts/sstate-sysroot-cruft.sh
@@ -1,5 +1,7 @@
 #!/bin/sh
-
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 # Used to find files installed in sysroot which are not tracked by sstate manifest
 
 # Global vars
diff --git a/scripts/sysroot-relativelinks.py b/scripts/sysroot-relativelinks.py
index ffe254728b5..56e36f3ad54 100755
--- a/scripts/sysroot-relativelinks.py
+++ b/scripts/sysroot-relativelinks.py
@@ -1,4 +1,8 @@
 #!/usr/bin/env python3
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
 import sys
 import os
 
diff --git a/scripts/task-time b/scripts/task-time
index e58040a9b98..bcd1e258175 100755
--- a/scripts/task-time
+++ b/scripts/task-time
@@ -1,4 +1,7 @@
 #!/usr/bin/env python3
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 
 import argparse
 import os
diff --git a/scripts/test-reexec b/scripts/test-reexec
index 30e792c7d9b..fccdac4da63 100755
--- a/scripts/test-reexec
+++ b/scripts/test-reexec
@@ -3,21 +3,8 @@
 # Test Script for task re-execution
 # 
 # Copyright 2012 Intel Corporation
-# All rights reserved.
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 2 of the License, or
-# (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+# SPDX-License-Identifier: GPL-2.0-or-later
 #
 # DESCRIPTION
 # This script is intended to address issues for re-execution of 
diff --git a/scripts/test-remote-image b/scripts/test-remote-image
index 27b1cae38fa..d209d228544 100755
--- a/scripts/test-remote-image
+++ b/scripts/test-remote-image
@@ -1,19 +1,9 @@
 #!/usr/bin/env python3
-
-# Copyright (c) 2014 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# Copyright (c) 2014 Intel Corporation
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 # DESCRIPTION
 # This script is used to test public autobuilder images on remote hardware.
diff --git a/scripts/tiny/dirsize.py b/scripts/tiny/dirsize.py
index ddccc5a8c8f..501516b0d44 100755
--- a/scripts/tiny/dirsize.py
+++ b/scripts/tiny/dirsize.py
@@ -1,22 +1,8 @@
 #!/usr/bin/env python3
 #
 # Copyright (c) 2011, Intel Corporation.
-# All rights reserved.
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 2 of the License, or
-# (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 #
+# SPDX-License-Identifier: GPL-2.0-or-later
 #
 # Display details of the root filesystem size, broken up by directory.
 # Allows for limiting by size to focus on the larger files.
diff --git a/scripts/tiny/ksize.py b/scripts/tiny/ksize.py
index ea1ca7ff235..bc11919f4b3 100755
--- a/scripts/tiny/ksize.py
+++ b/scripts/tiny/ksize.py
@@ -1,22 +1,8 @@
 #!/usr/bin/env python3
 #
 # Copyright (c) 2011, Intel Corporation.
-# All rights reserved.
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 2 of the License, or
-# (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 #
+# SPDX-License-Identifier: GPL-2.0-or-later
 #
 # Display details of the kernel build size, broken up by built-in.o. Sort
 # the objects by size. Run from the top level kernel build directory.
diff --git a/scripts/tiny/ksum.py b/scripts/tiny/ksum.py
index d4f3892156d..f38ae055dbf 100755
--- a/scripts/tiny/ksum.py
+++ b/scripts/tiny/ksum.py
@@ -1,22 +1,8 @@
 #!/usr/bin/env python
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
 # Copyright (c) 2016, Intel Corporation.
-# All rights reserved.
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 # DESCRIPTION 'ksum.py' generates a combined summary of vmlinux and
 # module sizes for a built kernel, as a quick tool for comparing the
diff --git a/scripts/verify-bashisms b/scripts/verify-bashisms
index a979bd29650..fb0cc719ea2 100755
--- a/scripts/verify-bashisms
+++ b/scripts/verify-bashisms
@@ -1,4 +1,7 @@
 #!/usr/bin/env python3
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
 
 import sys, os, subprocess, re, shutil
 
diff --git a/scripts/wic b/scripts/wic
index 017ef99dda5..1d89fb2edac 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -1,22 +1,8 @@
 #!/usr/bin/env python3
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
 #
 # Copyright (c) 2013, Intel Corporation.
-# All rights reserved.
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 # DESCRIPTION 'wic' is the OpenEmbedded Image Creator that users can
 # use to generate bootable images.  Invoking it without any arguments
diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index 106c9552517..010830f842e 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -3,7 +3,9 @@
 # Yocto Project layer checking tool
 #
 # Copyright (C) 2017 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 import os
 import sys
diff --git a/scripts/yocto-check-layer-wrapper b/scripts/yocto-check-layer-wrapper
index b5df9ce9898..2e3b699031e 100755
--- a/scripts/yocto-check-layer-wrapper
+++ b/scripts/yocto-check-layer-wrapper
@@ -6,7 +6,9 @@
 # script to avoid a contaminated environment.
 #
 # Copyright (C) 2017 Intel Corporation
-# Released under the MIT license (see COPYING.MIT)
+#
+# SPDX-License-Identifier: MIT
+#
 
 if [ -z "$BUILDDIR" ]; then
 	echo "Please source oe-init-build-env before run this script."
-- 
2.20.1


