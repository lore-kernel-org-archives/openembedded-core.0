Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web11.3489.1591071258568087518
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 21:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 9Tm4VcJLwdtlI7oRB8HzhVmX9vlCdLJlwgCVEDsiLsVGY7pttjQpe5tuiupowrjWogTrcjqyAU
 PHIcmpXR3JEQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2020 21:14:17 -0700
IronPort-SDR: mAH3gtDMDe5LyHIz/dp+equMO+bveWp6RcwBIB6xmQO418VJeg2JCn/LvIu3wcaQx7F5mhAoTE
 blt3Xa6L4VJA==
X-IronPort-AV: E=Sophos;i="5.73,462,1583222400"; 
   d="scan'208";a="416037322"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA; 01 Jun 2020 21:14:15 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Subject: [zeus][PATCH 00/25] zeus merge request - cover letter only
Date: Tue,  2 Jun 2020 12:14:01 +0800
Message-Id: <cover.1591069557.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4

Please consider merging these changes in zeus. Clean a-full on autobuilder.

Thanks,

Anuj

The following changes since commit b63955977ebbf9fba291faa1b30c8dba9bd52869:

  resulttool/resultutils: Fix unicode error handling (2020-05-15 11:55:34 +0100)

are available in the git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/zeus-next

Adrian Bunk (1):
  wireless-regdb: Upgrade 2019.06.03 -> 2020.04.29

Alexander Kanavin (4):
  gstreamer1.0-python: add a patch to fix python 3.8 builds
  gst-validate: upgrade 1.16.1 -> 1.16.2
  icu: update SRC_URI
  strace: fix failing ptests

Anuj Mittal (10):
  gstreamer1.0: upgrade 1.16.1 -> 1.16.2
  gstreamer1.0-plugins-base: upgrade 1.16.1 -> 1.16.2
  gstreamer1.0-plugins-good: upgrade 1.16.1 -> 1.16.2
  gstreamer1.0-plugins-bad: upgrade 1.16.1 -> 1.16.2
  gstreamer1.0-plugins-ugly: upgrade 1.16.1 -> 1.16.2
  gstreamer1.0-libav: upgrade 1.16.1 -> 1.16.2
  gstreamer1.0-omx: upgrade 1.16.1 -> 1.16.2
  gstreamer1.0-python: upgrade 1.16.1 -> 1.16.2
  gstreamer1.0-rtsp-server: upgrade 1.16.1 -> 1.16.2
  gstreamer1.0-vaapi: upgrade 1.16.1 -> 1.16.2

Lee Chee Yang (3):
  qemu: fix CVE-2020-11869
  ghostscript : fix CVE-2019-10216
  bind: fix CVE-2020-8616/7

Paul Barker (1):
  avahi: Don't advertise example services by default

Richard Purdie (3):
  oeqa/qemurunner: Clean up failure handling
  targetcontrol: Fix leaking log handler
  sstatesig: Optimise get_taskhash for hashequiv

Trevor Gamblin (1):
  python3: fix CVE-2020-8492

Yann Dirson (1):
  mesa: fix meson configure fix when 'dri' is excluded from
    PACKAGECONFIG

Zhixiong Chi (1):
  glibc: CVE-2020-1752

 meta/lib/oe/sstatesig.py                           |  13 +-
 meta/lib/oeqa/targetcontrol.py                     |   7 +-
 meta/lib/oeqa/utils/qemurunner.py                  |  11 +-
 meta/recipes-connectivity/avahi/avahi.inc          |   5 +
 .../bind/bind/CVE-2020-8616.patch                  | 206 +++++++++++++++++
 .../bind/bind/CVE-2020-8617.patch                  |  29 +++
 meta/recipes-connectivity/bind/bind_9.11.5-P4.bb   |   2 +
 meta/recipes-core/glibc/glibc/CVE-2020-1752.patch  |  66 ++++++
 meta/recipes-core/glibc/glibc_2.30.bb              |   1 +
 ...VE-2020-8492-Fix-AbstractBasicAuthHandler.patch | 248 +++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.7.bb      |   1 +
 meta/recipes-devtools/qemu/qemu.inc                |   1 +
 .../qemu/qemu/CVE-2020-11869.patch                 |  97 ++++++++
 .../strace/strace/Makefile-ptest.patch             |   2 +-
 meta/recipes-devtools/strace/strace/run-ptest      |   7 +-
 .../ghostscript/ghostscript/CVE-2019-10216.patch   |  53 +++++
 .../ghostscript/ghostscript_9.27.bb                |   1 +
 ...0003-Allow-enable-DRI-without-DRI-drivers.patch |   2 +-
 ..._2019.06.03.bb => wireless-regdb_2020.04.29.bb} |   3 +-
 ...t-validate_1.16.1.bb => gst-validate_1.16.2.bb} |   4 +-
 ...ibav_1.16.1.bb => gstreamer1.0-libav_1.16.2.bb} |   4 +-
 ....0-omx_1.16.1.bb => gstreamer1.0-omx_1.16.2.bb} |   4 +-
 ....16.1.bb => gstreamer1.0-plugins-bad_1.16.2.bb} |   4 +-
 ...16.1.bb => gstreamer1.0-plugins-base_1.16.2.bb} |   4 +-
 ...16.1.bb => gstreamer1.0-plugins-good_1.16.2.bb} |   4 +-
 ...16.1.bb => gstreamer1.0-plugins-ugly_1.16.2.bb} |   4 +-
 ...01-meson.build-fix-builds-with-python-3.8.patch |  24 ++
 ...hon_1.16.1.bb => gstreamer1.0-python_1.16.2.bb} |   8 +-
 ....16.1.bb => gstreamer1.0-rtsp-server_1.16.2.bb} |   4 +-
 ...aapi_1.16.1.bb => gstreamer1.0-vaapi_1.16.2.bb} |   4 +-
 ...treamer1.0_1.16.1.bb => gstreamer1.0_1.16.2.bb} |   4 +-
 meta/recipes-support/icu/icu_64.2.bb               |  11 +-
 32 files changed, 798 insertions(+), 40 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2020-8616.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2020-8617.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-1752.patch
 create mode 100644 meta/recipes-devtools/python/files/0001-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-11869.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-10216.patch
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2019.06.03.bb => wireless-regdb_2020.04.29.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gst-validate_1.16.1.bb => gst-validate_1.16.2.bb} (87%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.16.1.bb => gstreamer1.0-libav_1.16.2.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.16.1.bb => gstreamer1.0-omx_1.16.2.bb} (93%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.16.1.bb => gstreamer1.0-plugins-bad_1.16.2.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.16.1.bb => gstreamer1.0-plugins-base_1.16.2.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.16.1.bb => gstreamer1.0-plugins-good_1.16.2.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.16.1.bb => gstreamer1.0-plugins-ugly_1.16.2.bb} (90%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.16.1.bb => gstreamer1.0-python_1.16.2.bb} (81%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.16.1.bb => gstreamer1.0-rtsp-server_1.16.2.bb} (88%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.16.1.bb => gstreamer1.0-vaapi_1.16.2.bb} (93%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.16.1.bb => gstreamer1.0_1.16.2.bb} (96%)

-- 
2.7.4

