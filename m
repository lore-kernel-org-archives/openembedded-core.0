Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D86C433FE
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 15:59:05 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.14398.1635263943689041253
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 08:59:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="290783247"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="290783247"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:58:58 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="578786295"
Received: from wandsuan-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.17])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:58:56 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 00/37] Review request
Date: Tue, 26 Oct 2021 23:57:31 +0800
Message-Id: <cover.1635257336.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 15:59:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157403

Please review these changes for honister. No issues seen while testing
on autobuilder.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2810

Thanks,

Anuj

The following changes since commit bb1dea6806f084364b6017db2567f438e805aef0:

  build-appliance-image: Update to honister head revision (2021-10-11 11:06:36 +0100)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/honister

Alexander Kanavin (5):
  lttng-tools: replace ad hoc ptest fixup with upstream fixes
  ca-certificates: update 20210119 -> 20211016
  ovmf: update 202105 -> 202108
  linux-firmware: upgrade 20210818 -> 20210919
  wireless-regdb: upgrade 2021.07.14 -> 2021.08.28

Alexandre Belloni (1):
  oeqa/selftest/sstatetests: fix typo ware -> were

Andrej Valek (1):
  busybox: 1.34.0 -> 1.34.1

Andres Beltran (1):
  buildhistory: Fix package output files for SDKs

Jose Quaresma (14):
  gstreamer1.0-plugins-base: 1.18.4 -> 1.18.5
  gstreamer1.0-plugins-good: 1.18.4 -> 1.18.5
  gstreamer1.0-plugins-bad: 1.18.4 -> 1.18.5
  gstreamer1.0-plugins-ugly: 1.18.4 -> 1.18.5
  gstreamer1.0-rtsp-server: 1.18.4 -> 1.18.5
  gstreamer1.0-libav: 1.18.4 -> 1.18.5
  gstreamer1.0-vaapi: 1.18.4 -> 1.18.5
  gstreamer1.0-omx: 1.18.4 -> 1.18.5
  gstreamer1.0-python: 1.18.4 -> 1.18.5
  gst-devtools: 1.18.4 -> 1.18.5
  gst-examples: 1.18.4 -> 1.18.5
  gstreamer1.0: 1.18.4 -> 1.18.5
  patch.bbclass: when the patch fails show more info on the fatal error
  sstate: fix touching files inside pseudo

Khem Raj (1):
  mesa: Enable svga for x86 only

Kiran Surendran (1):
  ffmpeg: fix CVE-2021-38114

Oleksandr Kravchuk (1):
  python3: update to 3.9.7

Pablo Saavedra Rodi?o (1):
  mesa: upgrade 21.2.1 -> 21.2.4

Ralph Siemsen (1):
  tar: filter CVEs using vendor name

Richard Purdie (5):
  libxml2: Use python3targetconfig to fix reproducibility issue
  libnewt: Use python3targetconfig to fix reproducibility issue
  linux-yocto-dev: Ensure DEPENDS matches recent 5.14 kernel changes
  oeqa: Update cleanup code to wait for hashserv exit
  bootchart2: Don't compile python modules

Ross Burton (3):
  linux-yocto: add libmpc-native to DEPENDS
  curl: fix CVE-2021-22945 through -22947
  testimage: fix unclosed testdata file

Sakib Sajal (1):
  go: upgrade 1.16.7 -> 1.16.8

Yureka (1):
  systemd: add missing include for musl

 meta/classes/buildhistory.bbclass             |  21 +-
 meta/classes/cross-canadian.bbclass           |   2 +-
 meta/classes/nativesdk.bbclass                |   2 +-
 meta/classes/patch.bbclass                    |   7 +-
 meta/classes/sstate.bbclass                   |   4 +-
 meta/classes/testimage.bbclass                |   7 +-
 meta/conf/bitbake.conf                        |   1 +
 meta/lib/oe/package_manager/__init__.py       |   2 +-
 meta/lib/oeqa/sdk/buildtools-cases/build.py   |   2 +-
 meta/lib/oeqa/selftest/cases/eSDK.py          |   2 +-
 meta/lib/oeqa/selftest/cases/sstatetests.py   |  12 +-
 meta/lib/oeqa/selftest/context.py             |   2 +-
 ...ab_1.34.0.bb => busybox-inittab_1.34.1.bb} |   0
 .../{busybox_1.34.0.bb => busybox_1.34.1.bb}  |   2 +-
 meta/recipes-core/libxml/libxml2_2.9.12.bb    |   2 +-
 meta/recipes-core/ovmf/ovmf_git.bb            |   4 +-
 ...008-add-missing-FTW_-macros-for-musl.patch |  16 +-
 .../bootchart2/bootchart2_0.14.9.bb           |   6 +-
 .../go/{go-1.16.7.inc => go-1.16.8.inc}       |   4 +-
 ...e_1.16.7.bb => go-binary-native_1.16.8.bb} |   4 +-
 ..._1.16.7.bb => go-cross-canadian_1.16.8.bb} |   0
 ...{go-cross_1.16.7.bb => go-cross_1.16.8.bb} |   0
 ...osssdk_1.16.7.bb => go-crosssdk_1.16.8.bb} |   0
 ...o-native_1.16.7.bb => go-native_1.16.8.bb} |   0
 ...runtime_1.16.7.bb => go-runtime_1.16.8.bb} |   0
 .../go/{go_1.16.7.bb => go_1.16.8.bb}         |   0
 .../{python3_3.9.6.bb => python3_3.9.7.bb}    |   2 +-
 meta/recipes-extended/newt/libnewt_0.52.21.bb |   2 +-
 meta/recipes-extended/tar/tar_1.34.bb         |   6 +-
 .../mesa/files/without-neon.patch             |  53 ---
 .../{mesa-gl_21.2.1.bb => mesa-gl_21.2.4.bb}  |   0
 meta/recipes-graphics/mesa/mesa.inc           |   7 +-
 .../mesa/{mesa_21.2.1.bb => mesa_21.2.4.bb}   |   0
 ...20210818.bb => linux-firmware_20210919.bb} |   4 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb  |   1 +
 meta/recipes-kernel/linux/linux-yocto_5.14.bb |   2 +-
 ...race-condition-in-test_event_tracker.patch | 221 +++++++++++
 ...more-before-analysing-traces-or-star.patch |  88 -----
 ...condition-in-test_ns_contexts_change.patch |  46 +++
 .../lttng/lttng-tools_2.13.0.bb               |   3 +-
 ....07.14.bb => wireless-regdb_2021.08.28.bb} |   2 +-
 .../ffmpeg/ffmpeg/fix-CVE-2021-38114.patch    |  67 ++++
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb  |   3 +-
 ...tools_1.18.4.bb => gst-devtools_1.18.5.bb} |   2 +-
 ...mples_1.18.4.bb => gst-examples_1.18.5.bb} |   2 +-
 ...1.18.4.bb => gstreamer1.0-libav_1.18.5.bb} |   2 +-
 ...x_1.18.4.bb => gstreamer1.0-omx_1.18.5.bb} |   2 +-
 ....bb => gstreamer1.0-plugins-bad_1.18.5.bb} |   2 +-
 ...c91697a141fea7317aff7f0f28e5a861db99.patch |  50 ---
 ...bb => gstreamer1.0-plugins-base_1.18.5.bb} |   3 +-
 ...Fix-parsing-of-the-mediaclk-direct-f.patch |  33 --
 ...from-static-vars-to-fix-build-with-g.patch | 100 -----
 ...bb => gstreamer1.0-plugins-good_1.18.5.bb} |   4 +-
 ...bb => gstreamer1.0-plugins-ugly_1.18.5.bb} |   2 +-
 ....18.4.bb => gstreamer1.0-python_1.18.5.bb} |   2 +-
 ....bb => gstreamer1.0-rtsp-server_1.18.5.bb} |   2 +-
 ...1.18.4.bb => gstreamer1.0-vaapi_1.18.5.bb} |   2 +-
 ...002-Remove-unused-valgrind-detection.patch |  14 +-
 ...er1.0_1.18.4.bb => gstreamer1.0_1.18.5.bb} |   2 +-
 ...ertdata2pem.py-print-a-warning-for-e.patch |  80 ++++
 .../ca-certificates/sbindir.patch             |  26 --
 ...pdate-ca-certificates-support-Toybox.patch |  33 --
 ...0210119.bb => ca-certificates_20211016.bb} |   5 +-
 .../curl/curl/cve-2021-22945.patch            |  34 ++
 .../curl/curl/cve-2021-22946.patch            | 332 ++++++++++++++++
 .../curl/curl/cve-2021-22947.patch            | 355 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.78.0.bb      |   3 +
 67 files changed, 1244 insertions(+), 457 deletions(-)
 rename meta/recipes-core/busybox/{busybox-inittab_1.34.0.bb => busybox-inittab_1.34.1.bb} (100%)
 rename meta/recipes-core/busybox/{busybox_1.34.0.bb => busybox_1.34.1.bb} (95%)
 rename meta/recipes-devtools/go/{go-1.16.7.inc => go-1.16.8.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.7.bb => go-binary-native_1.16.8.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.7.bb => go-cross-canadian_1.16.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.7.bb => go-cross_1.16.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.7.bb => go-crosssdk_1.16.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.7.bb => go-native_1.16.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.7.bb => go-runtime_1.16.8.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.7.bb => go_1.16.8.bb} (100%)
 rename meta/recipes-devtools/python/{python3_3.9.6.bb => python3_3.9.7.bb} (99%)
 delete mode 100644 meta/recipes-graphics/mesa/files/without-neon.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_21.2.1.bb => mesa-gl_21.2.4.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_21.2.1.bb => mesa_21.2.4.bb} (100%)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20210818.bb => linux-firmware_20210919.bb} (99%)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-Fix-Tests-race-condition-in-test_event_tracker.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-tests-wait-some-more-before-analysing-traces-or-star.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0002-Fix-Tests-race-condition-in-test_ns_contexts_change.patch
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2021.07.14.bb => wireless-regdb_2021.08.28.bb} (94%)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38114.patch
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.18.4.bb => gst-devtools_1.18.5.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.18.4.bb => gst-examples_1.18.5.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.18.4.bb => gstreamer1.0-libav_1.18.5.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.18.4.bb => gstreamer1.0-omx_1.18.5.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.18.4.bb => gstreamer1.0-plugins-bad_1.18.5.bb} (98%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/4ef5c91697a141fea7317aff7f0f28e5a861db99.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.18.4.bb => gstreamer1.0-plugins-base_1.18.5.bb} (96%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-rtpjitterbuffer-Fix-parsing-of-the-mediaclk-direct-f.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-Remove-volatile-from-static-vars-to-fix-build-with-g.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.18.4.bb => gstreamer1.0-plugins-good_1.18.5.bb} (93%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.18.4.bb => gstreamer1.0-plugins-ugly_1.18.5.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.18.4.bb => gstreamer1.0-python_1.18.5.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.18.4.bb => gstreamer1.0-rtsp-server_1.18.5.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.18.4.bb => gstreamer1.0-vaapi_1.18.5.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.18.4.bb => gstreamer1.0_1.18.5.bb} (97%)
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
 delete mode 100644 meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch
 delete mode 100644 meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch
 rename meta/recipes-support/ca-certificates/{ca-certificates_20210119.bb => ca-certificates_20211016.bb} (95%)
 create mode 100644 meta/recipes-support/curl/curl/cve-2021-22945.patch
 create mode 100644 meta/recipes-support/curl/curl/cve-2021-22946.patch
 create mode 100644 meta/recipes-support/curl/curl/cve-2021-22947.patch

-- 
2.31.1


