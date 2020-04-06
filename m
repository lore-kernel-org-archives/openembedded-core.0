Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.12871.1586185918252682432
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 08:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: VABFnQWv2D1TlPaVtNdc/hB+axhaCPY//8M2VeEBelI8ChzPAUeu+h8xzJG8xbyakcqcdQMtE/
 uLAVX+/Ihgjw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2020 08:11:57 -0700
IronPort-SDR: blfRcd5mHhihXKHT/aZU/DeIMYiQSkMITiHRN+K0lrba9jxU+WzRZ5DO8JB0hwJm2D1j3rCTpU
 5EweVxyyaZ8w==
X-IronPort-AV: E=Sophos;i="5.72,351,1580803200"; 
   d="scan'208";a="424391112"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.70.63])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2020 08:11:55 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 00/13] zeus -next review
Date: Mon,  6 Apr 2020 23:11:28 +0800
Message-Id: <cover.1586185832.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Next set of changes for zeus. Please review.

Thanks,

Anuj

The following changes since commit 0743dcd0cd70dee87a49d3bcd017168352e60982:

  wic/direct: reserve 2 sector for extended partition (2020-03-26 07:33:07 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/zeus

Jan Luebbe (5):
  lib/oe/package_manager: make sure to not remove packages in apt
    install
  lib/oe/package_manager: fix handling of last package
  lib/oe/package_manager: collect provided package names when using debs
  lib/oe/package_manager: avoid installing provided packages via apt
  lib/oe/package_manager: don't try to rm /var/lib/opkg

Jeremy Puhlman (1):
  busybox: on upgrade save busybox if it is the last shell

Joshua Watt (1):
  u-boot-tools: Split out inc file

Marek Vasut (2):
  waffle: no need to depend on target python3
  lttng-modules: update to 2.10.14

Paul Barker (3):
  kernel-yocto.bbclass: Support config fragments with externalsrc
  perf: Fix externalsrc support
  kernelsrc.bbclass: Fix externalsrc support

haiqing (1):
  glib-2.0: fix CVE-2020-6750

 meta/classes/kernel-yocto.bbclass             |   3 +-
 meta/classes/kernelsrc.bbclass                |   2 +-
 meta/lib/oe/package_manager.py                |  37 +-
 meta/recipes-bsp/u-boot/u-boot-tools.inc      |  65 ++
 .../u-boot/u-boot-tools_2019.07.bb            |  67 +-
 meta/recipes-core/busybox/busybox.inc         |  43 +
 .../glib-2.0/glib-2.0/CVE-2020-6750.patch     | 741 ++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.60.7.bb |   1 +
 meta/recipes-graphics/waffle/waffle_1.6.0.bb  |   5 +
 ...ops-when-trace-sunrpc_task-events-in.patch |  94 ---
 ...rpc_clnt-dereference-in-rpc_task_que.patch |  44 --
 ...rpc-use-signed-integer-for-client-id.patch | 105 ---
 ...nrpc-introduce-lttng_get_clid-helper.patch | 130 ---
 ...es_2.10.11.bb => lttng-modules_2.10.14.bb} |  12 +-
 meta/recipes-kernel/perf/perf.bb              |   2 +-
 15 files changed, 887 insertions(+), 464 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-tools.inc
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2020-6750.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-SUNRPC-Fix-oops-when-trace-sunrpc_task-events-in.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-sunrpc-null-rpc_clnt-dereference-in-rpc_task_que.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-Fix-sunrpc-use-signed-integer-for-client-id.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-sunrpc-introduce-lttng_get_clid-helper.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.10.11.bb => lttng-modules_2.10.14.bb} (75%)

-- 
2.25.1

