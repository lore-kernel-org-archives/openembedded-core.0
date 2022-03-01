Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF5FC433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 23:34:10 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web10.1773.1646177648634087064
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 15:34:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=iIg2+/Up;
 spf=pass (domain: intel.com, ip: 192.55.52.151,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646177648; x=1677713648;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N+cLmI8kSzhuxZ+r54QNOF2aa9ulclaPk/YczBMnLBc=;
  b=iIg2+/UpOorGFMsh0yyBSUeiDEZVauWdjBBb/Fy1oXxlgBTTyJY8SUCN
   R6CQXXwk2mFLjxqbnPV7zMYevy0WesDnVutTCrNPLkrQmL+0HSG7XvE6K
   i4QIrmU/5GkIGSPfl+afBV9dBzmVAkVMs7RZSeBcT2GHxfarOQumRSm+G
   rnEb1CxPKDr5tTxdkiFq9Zmz8xFQEdlKBsM8QFkNcV42w5++KuLm99PeY
   WMSRfggmXgmUgRIru1T2aZB/+1l4tiaFYDVFIvV8xsY6CNGdiDTYiJ1MA
   Wu0zSYaDCsdSVdX2DBsqzSulvSSB0BeP52cQq7zgSXr3gWKTItZq4DABM
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="233882641"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400";
   d="scan'208";a="233882641"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 15:34:05 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400";
   d="scan'208";a="510736138"
Received: from kloo1-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.236.206])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 15:34:03 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/39] Pull request (cover letter only)
Date: Wed,  2 Mar 2022 07:33:58 +0800
Message-Id: <cover.1646177572.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 23:34:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162576

The following changes since commit 29cd1d796057ef5599fe17c39b42aa099f7b1c29:

  build-appliance-image: Update to hardknott head revision (2022-02-20 15:32:32 +0000)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/hardknott-next

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


