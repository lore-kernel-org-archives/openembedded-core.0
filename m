Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBEF4C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:00:41 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.19878.1646056840489874149
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:00:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=ijO2pNvj;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056840; x=1677592840;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BxzzUUbjsJNPJB407/YVDY3MowPAqyzPxCb2UdxWEx4=;
  b=ijO2pNvj1uyIAvo6QCwLX7YFZpKXmZfz7qgQeB+E4EnMpzibPaV+yS75
   qWzV9Nr/+zX6o9sk2s2+x5CYhsRr7jV620O1vWfdDb936/jUbvM14i6Gj
   p7uqCr7UCAG7jntex0p2KEfBrCT2gIqn98E9/ucd7qPCaNJEM3eVN/SHv
   5z5zKdptekN0WrYEnhG/1NT+CudaPPKjZUgTv64h3Zdi0d9gNLzZLG/OL
   pCUojYR4ivASlB0ToFGCSGJf8Fz9okiZCk/YQxT+oL+b729e/80Je5XsJ
   iEwkQg1Ej9A0sVxUhXjL5eu93SN6qtCBpqOWEs60vg0vXZurHm6+pWsrR
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232856860"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232856860"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:00:39 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092110"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:00:37 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/39] Patch review
Date: Mon, 28 Feb 2022 21:59:50 +0800
Message-Id: <cover.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:00:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162456

Next set of changes for hardknott. Please review.

No problems seen while testing on autobuilder.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3289

Thanks,

Anuj

The following changes since commit 29cd1d796057ef5599fe17c39b42aa099f7b1c29:

  build-appliance-image: Update to hardknott head revision (2022-02-20 15:32:32 +0000)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/hardknott

Alexander Kanavin (1):
  libarchive: upgrade 3.5.1 -> 3.5.2

Changqing Li (1):
  e2fsprogs: backport to fix one regression

Christian Eggers (1):
  mc: fix build if ncurses have been configured without wide characters

Florian Amstutz (1):
  devtool: deploy-target: Remove stripped binaries in pseudo context

Joe Slater (1):
  virglrenderer: fix CVE-2022-0135 and -0175

Jose Quaresma (24):
  gstreamer1.0: 1.18.4 -> 1.18.5
  gstreamer1.0-plugins-base: 1.18.4 -> 1.18.5
  gstreamer1.0-plugins-bad: 1.18.4 -> 1.18.5
  gstreamer1.0-plugins-good: 1.18.4 -> 1.18.5
  gstreamer1.0-rtsp-server: 1.18.4 -> 1.18.5
  gstreamer1.0-libav: 1.18.4 -> 1.18.5
  gstreamer1.0-vaapi: 1.18.4 -> 1.18.5
  gstreamer1.0-omx: 1.18.4 -> 1.18.5
  gstreamer1.0-python: 1.18.4 -> 1.18.5
  gst-devtools: 1.18.4 -> 1.18.5
  gst-examples: 1.18.4 -> 1.18.5
  gstreamer1.0-plugins-ugly: 1.18.4 -> 1.18.5
  gstreamer1.0: 1.18.5 -> 1.18.6
  gstreamer1.0-plugins-base: 1.18.5 -> 1.18.6
  gstreamer1.0-plugins-good: 1.18.5 -> 1.18.6
  gstreamer1.0-plugins-bad: 1.18.5 -> 1.18.6
  gstreamer1.0-plugins-ugly: 1.18.5 -> 1.18.6
  gstreamer1.0-vaapi: 1.18.5 -> 1.18.6
  gstreamer1.0-libav: 1.18.5 -> 1.18.6
  gstreamer1.0-omx: 1.18.5 -> 1.18.6
  gstreamer1.0-rtsp-server: 1.18.5 -> 1.18.6
  gst-examples: 1.18.5 -> 1.18.6
  gstreamer1.0-python: 1.18.5 -> 1.18.6
  gst-devtools: 1.18.5 -> 1.18.6

Justin Bronder (1):
  initramfs-framework: unmount automounts before switch_root

Kai Kang (1):
  expat: fix CVE-2022-23990

Lee Chee Yang (1):
  libarchive : update to 3.5.3

Michael Halstead (1):
  uninative: Upgrade to 3.5

Oleksiy Obitotskyy (1):
  package_manager: ipk: Fix host manifest generation

Richard Purdie (2):
  vim: Upgrade 4269 -> 4134
  vim: Upgrade 8.2.4314 -> 8.2.4424

Tim Orling (1):
  scripts/buildhistory-diff: drop use of distutils

wangmy (2):
  linux-firmware: upgrade 20211216 -> 20220209
  ccache: upgrade 4.2 -> 4.2.1

 meta/conf/distro/include/yocto-uninative.inc  |  10 +-
 meta/lib/oe/sdk.py                            |   4 +
 .../expat/expat/CVE-2022-23990.patch          |  49 ++++++++
 meta/recipes-core/expat/expat_2.2.10.bb       |   7 +-
 .../initrdscripts/initramfs-framework/finish  |  12 ++
 .../ccache/{ccache_4.2.bb => ccache_4.2.1.bb} |   4 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc |   3 +-
 ...mount-write-time-when-e2fsck-is-forc.patch |  66 ++++++++++
 ...ibarchive_3.5.1.bb => libarchive_3.5.3.bb} |   2 +-
 ...FTBFS-with-ncurses-build-with-disabl.patch |  87 +++++++++++++
 meta/recipes-extended/mc/mc_4.8.26.bb         |   5 +-
 .../virglrenderer/cve-2022-0135.patch         | 117 ++++++++++++++++++
 .../virglrenderer/cve-2022-0175.patch         | 112 +++++++++++++++++
 .../virglrenderer/virglrenderer_0.8.2.bb      |   2 +
 ...20211216.bb => linux-firmware_20220209.bb} |   4 +-
 ...tools_1.18.4.bb => gst-devtools_1.18.6.bb} |   2 +-
 ...mples_1.18.4.bb => gst-examples_1.18.6.bb} |   2 +-
 ...1.18.4.bb => gstreamer1.0-libav_1.18.6.bb} |   2 +-
 ...x_1.18.4.bb => gstreamer1.0-omx_1.18.6.bb} |   2 +-
 ....bb => gstreamer1.0-plugins-bad_1.18.6.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-base_1.18.6.bb} |   2 +-
 ...Fix-parsing-of-the-mediaclk-direct-f.patch |  33 -----
 ...bb => gstreamer1.0-plugins-good_1.18.6.bb} |   3 +-
 ...bb => gstreamer1.0-plugins-ugly_1.18.6.bb} |   2 +-
 ....18.4.bb => gstreamer1.0-python_1.18.6.bb} |   2 +-
 ....bb => gstreamer1.0-rtsp-server_1.18.6.bb} |   2 +-
 ...1.18.4.bb => gstreamer1.0-vaapi_1.18.6.bb} |   2 +-
 ...002-Remove-unused-valgrind-detection.patch |  14 +--
 ...er1.0_1.18.4.bb => gstreamer1.0_1.18.6.bb} |   2 +-
 meta/recipes-support/vim/vim.inc              |   7 +-
 scripts/buildhistory-diff                     |   5 -
 scripts/lib/devtool/deploy.py                 |   2 +-
 32 files changed, 493 insertions(+), 77 deletions(-)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-23990.patch
 rename meta/recipes-devtools/ccache/{ccache_4.2.bb => ccache_4.2.1.bb} (82%)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-fix-last-mount-write-time-when-e2fsck-is-forc.patch
 rename meta/recipes-extended/libarchive/{libarchive_3.5.1.bb => libarchive_3.5.3.bb} (96%)
 create mode 100644 meta/recipes-extended/mc/files/0001-Ticket-4200-fix-FTBFS-with-ncurses-build-with-disabl.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0135.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0175.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20211216.bb => linux-firmware_20220209.bb} (99%)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.18.4.bb => gst-devtools_1.18.6.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.18.4.bb => gst-examples_1.18.6.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.18.4.bb => gstreamer1.0-libav_1.18.6.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.18.4.bb => gstreamer1.0-omx_1.18.6.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.18.4.bb => gstreamer1.0-plugins-bad_1.18.6.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.18.4.bb => gstreamer1.0-plugins-base_1.18.6.bb} (98%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-rtpjitterbuffer-Fix-parsing-of-the-mediaclk-direct-f.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.18.4.bb => gstreamer1.0-plugins-good_1.18.6.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.18.4.bb => gstreamer1.0-plugins-ugly_1.18.6.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.18.4.bb => gstreamer1.0-python_1.18.6.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.18.4.bb => gstreamer1.0-rtsp-server_1.18.6.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.18.4.bb => gstreamer1.0-vaapi_1.18.6.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.18.4.bb => gstreamer1.0_1.18.6.bb} (97%)

-- 
2.35.1


