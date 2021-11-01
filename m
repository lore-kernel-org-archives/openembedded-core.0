Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E4DC433EF
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 15:34:25 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.45535.1635780864510944525
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Nov 2021 08:34:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10154"; a="218228509"
X-IronPort-AV: E=Sophos;i="5.87,200,1631602800";
   d="scan'208";a="218228509"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 08:34:23 -0700
X-IronPort-AV: E=Sophos;i="5.87,200,1631602800";
   d="scan'208";a="488694175"
Received: from aaronhpe-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.232.69])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 08:34:22 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/18] Review request
Date: Mon,  1 Nov 2021 23:33:55 +0800
Message-Id: <cover.1635780638.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Nov 2021 15:34:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157707

Please review these changes for hardknott. No issues seen while testing
on autobuilder.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2858

Thanks,

Anuj

The following changes since commit 47e638ada946af7d69fb65619858a1e4564613c4:

  uninative: Upgrade to 3.4 (2021-11-01 10:36:28 +0000)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/hardknott

Alexander Kanavin (6):
  waffle: convert to git, website is down
  linux-firmware: upgrade 20210818 -> 20210919
  wireless-regdb: upgrade 2021.04.21 -> 2021.07.14
  wireless-regdb: upgrade 2021.07.14 -> 2021.08.28
  ca-certificates: update 20210119 -> 20211016
  tzdata: upgrade 2021a -> 2021d

Anuj Mittal (1):
  meta: bump HASHEQUIV_HASH_VERSION after RPM fix

Bruce Ashfield (3):
  linux-yocto/5.10: update to v5.10.73
  linux-yocto/5.10: update to v5.10.74
  linux-yocto/5.10: update to v5.10.75

Changqing Li (1):
  openssh: fix CVE-2021-41617

Jose Quaresma (1):
  sstate: fix touching files inside pseudo

Pgowda (1):
  binutils: Fix CVE-2021-3530

Richard Purdie (1):
  bootchart2: Don't compile python modules

Ross Burton (3):
  testimage: fix unclosed testdata file
  oe/utils: log exceptions in ThreadedWorker functions
  strace: show test suite log on failure

Trevor Gamblin (1):
  ghostscript: Fix CVE-2021-3781

 meta/classes/sstate.bbclass                   |   4 +-
 meta/classes/testimage.bbclass                |   7 +-
 meta/lib/oe/utils.py                          |   3 +-
 .../openssh/openssh/CVE-2021-41617.patch      |  49 ++++
 .../openssh/openssh_8.5p1.bb                  |   1 +
 .../binutils/binutils-2.36.inc                |   2 +
 .../binutils/0017-CVE-2021-3530.patch         | 102 ++++++++
 .../binutils/0018-CVE-2021-3530.patch         |  64 +++++
 .../bootchart2/bootchart2_0.14.9.bb           |   6 +-
 meta/recipes-devtools/strace/strace/run-ptest |   9 +
 ...de-device-specifier-strings-in-acces.patch | 238 ++++++++++++++++++
 .../ghostscript/ghostscript_9.53.3.bb         |   1 +
 meta/recipes-extended/timezone/timezone.inc   |   7 +-
 .../hicolor-icon-theme_0.17.bb                |   4 +
 meta/recipes-graphics/waffle/waffle_1.6.1.bb  |  10 +-
 .../wayland/wayland-protocols_1.20.bb         |   4 +
 .../xorg-font/encodings_1.0.5.bb              |   4 +
 ...20210818.bb => linux-firmware_20210919.bb} |   4 +-
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +-
 ....04.21.bb => wireless-regdb_2021.08.28.bb} |   6 +-
 .../alsa/alsa-topology-conf_1.2.4.bb          |   4 +
 .../alsa/alsa-ucm-conf_1.2.4.bb               |   4 +
 .../pulseaudio-client-conf-sato_1.bb          |   4 +
 .../shutdown-desktop/shutdown-desktop.bb      |   5 +-
 ...ertdata2pem.py-print-a-warning-for-e.patch |  80 ++++++
 .../ca-certificates/sbindir.patch             |  26 --
 ...pdate-ca-certificates-support-Toybox.patch |  33 ---
 ...0210119.bb => ca-certificates_20211016.bb} |   5 +-
 .../iso-codes/iso-codes_4.6.0.bb              |   4 +
 31 files changed, 627 insertions(+), 101 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-CVE-2021-3530.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0018-CVE-2021-3530.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-Bug-704342-Include-device-specifier-strings-in-acces.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20210818.bb => linux-firmware_20210919.bb} (99%)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2021.04.21.bb => wireless-regdb_2021.08.28.bb} (89%)
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
 delete mode 100644 meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch
 delete mode 100644 meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch
 rename meta/recipes-support/ca-certificates/{ca-certificates_20210119.bb => ca-certificates_20211016.bb} (95%)

-- 
2.31.1


