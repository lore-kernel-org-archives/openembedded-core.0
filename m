Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web09.1193.1616631475259266827
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 17:17:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ECmNKnmPJy3ZyNhLHIZGWbINrX8Zyf4lHLa0JuaF3xHZY3zom6Y87k2Qjh8xaG1F+bAJRLO27h
 E+poiNh+YyyA==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="170796170"
X-IronPort-AV: E=Sophos;i="5.81,276,1610438400"; 
   d="scan'208";a="170796170"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2021 17:17:54 -0700
IronPort-SDR: FJIG2jMLfh59rxv0T61Rb5nCP+yl7TZtjp08Uj3NpkxY/exh9yuIS279cLBSruzhLUVipXXZpA
 /JNcWaqwu/GA==
X-IronPort-AV: E=Sophos;i="5.81,276,1610438400"; 
   d="scan'208";a="608288070"
Received: from mohdkuza-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.138.61])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2021 17:17:53 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 00/25] pull request (cover letter only)
Date: Thu, 25 Mar 2021 08:17:48 +0800
Message-Id: <cover.1616631357.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please merge these changes in gatesgarth.

Thanks,

Anuj

The following changes since commit 6311cb4930bd0add7aec61e5e0df6bb7ae0c4481:

  libsdl2: fix CVE-2020-14409 CVE-2020-14410 (2021-03-10 00:24:18 +0000)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/gatesgarth-next

Alejandro Hernandez Samaniego (1):
  devtool: Fix do_kernel_configme task

Anatol Belski (1):
  glib-2.0: Fix CVE-2021-27219

Anuj Mittal (1):
  Revert "sstatesig.py: show an error instead of warning when sstate
    manifest isn't found"

Bruce Ashfield (3):
  linux-yocto/5.4: update to v5.4.99
  linux-yocto/5.4: update to v5.4.101
  linux-yocto/5.4: update to v5.4.103

Chen Qi (2):
  python3-jinja2: set CVE_PRODUCT
  populate_sdk_ext: record METADATA_REVISION

Jon Mason (1):
  runqemu: use "raw" instead of "bin" for ovmf

Martin Jansa (1):
  iso-codes: fix protocol in SRC_URI

Mike Crowe (1):
  gcc-sanitizers: Move content from gcclibdir into libdir

Minjae Kim (1):
  qemu: fix CVE-2021-20203

Purushottam Choudhary (1):
  shadow: whitelist CVE-2013-4235

Richard Leitner (1):
  xcb-proto: update to 1.14.1

Richard Purdie (6):
  libsecret: Improve determimism
  igt-gpu-tools: Fix reproducibility issue
  apr-util: Fix CFLAGS used in build
  selftest/reproducible: Don't call sync between each file compare
  gstreamer1.0-python: Set internal python library path correcty
  build-appliance-image: Drop kernel module handling

Ross Burton (2):
  libinput: less parallism to increase chances the test suite works
  ptest-packagelists: remove libinput-ptest

Stefan Ghinea (1):
  wpa-supplicant: fix CVE-2021-27803

Stefan Schmidt (1):
  systemd-conf: do not ask for DHCP if configured on kernel command line

Ulrich Ölmann (1):
  local.conf.sample: fix typo

 meta/classes/populate_sdk_ext.bbclass         |    3 +
 .../distro/include/ptest-packagelists.inc     |    2 +-
 meta/conf/local.conf.sample                   |    2 +-
 meta/lib/oe/sstatesig.py                      |    2 +-
 meta/lib/oeqa/selftest/cases/reproducible.py  |    2 +-
 .../wpa-supplicant/CVE-2021-27803.patch       |   58 +
 .../wpa-supplicant/wpa-supplicant_2.9.bb      |    1 +
 .../glib-2.0/glib-2.0/CVE-2021-27219.patch    | 1444 +++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb |    1 +
 .../images/build-appliance-image_15.0.0.bb    |    8 +-
 .../systemd/systemd-conf/wired.network        |    1 +
 .../systemd/systemd-conf_246.9.bb             |    3 -
 meta/recipes-devtools/gcc/gcc-sanitizers.inc  |    7 +-
 .../python/python3-jinja2_2.11.2.bb           |    2 +
 meta/recipes-devtools/qemu/qemu.inc           |    1 +
 .../qemu/qemu/CVE-2021-20203.patch            |   74 +
 meta/recipes-extended/shadow/shadow_4.8.1.bb  |    5 +-
 .../libsecret/libsecret/determinism.patch     |   37 +
 .../libsecret/libsecret_0.20.3.bb             |    3 +-
 .../igt-gpu-tools/reproducibility.patch       |   38 +
 .../igt-gpu-tools/igt-gpu-tools_git.bb        |    5 +-
 .../wayland/libinput/run-ptest                |    2 +-
 ...{xcb-proto_1.14.bb => xcb-proto_1.14.1.bb} |    4 +-
 .../linux/linux-yocto-rt_5.4.bb               |    6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |    8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |   22 +-
 .../gstreamer/gstreamer1.0-python_1.16.3.bb   |    2 +
 meta/recipes-support/apr/apr-util_1.6.1.bb    |    2 +
 .../iso-codes/iso-codes_4.5.0.bb              |    2 +-
 scripts/lib/devtool/standard.py               |    7 +-
 scripts/runqemu                               |    2 +
 31 files changed, 1713 insertions(+), 43 deletions(-)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-27803.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20203.patch
 create mode 100644 meta/recipes-gnome/libsecret/libsecret/determinism.patch
 create mode 100644 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/reproducibility.patch
 rename meta/recipes-graphics/xorg-proto/{xcb-proto_1.14.bb => xcb-proto_1.14.1.bb} (84%)

-- 
2.30.2

