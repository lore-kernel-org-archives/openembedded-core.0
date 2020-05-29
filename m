Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web12.29384.1590731592716727128
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 22:53:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: tvdHddpybPcaXx6PZUqG8M6sC9mdMKHKrQ5rkzPNyQJHNlJc3K/6+KMFzMvpghkc3zLIw7zmq0
 mMxdIQ8b6oZQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:53:12 -0700
IronPort-SDR: 9VqIGL8qAh9jqGgjkaxYYVlNNLQDQNwDl2eW/wrua3eY6V4SKQN9944dphB0evxdjijfP4ks08
 dtJ2MSrKMe3g==
X-IronPort-AV: E=Sophos;i="5.73,447,1583222400"; 
   d="scan'208";a="414866114"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.136.157])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:53:10 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 00/25] zeus review request
Date: Fri, 29 May 2020 13:52:36 +0800
Message-Id: <cover.1590731377.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review these next set of changes for zeus.

Thanks,

Anuj

The following changes since commit b63955977ebbf9fba291faa1b30c8dba9bd52869:

  resulttool/resultutils: Fix unicode error handling (2020-05-15 11:55:34 +0100)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/zeus

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

 meta/lib/oe/sstatesig.py                      |  13 +-
 meta/lib/oeqa/targetcontrol.py                |   7 +-
 meta/lib/oeqa/utils/qemurunner.py             |  11 +-
 meta/recipes-connectivity/avahi/avahi.inc     |   5 +
 .../bind/bind/CVE-2020-8616.patch             | 206 +++++++++++++++
 .../bind/bind/CVE-2020-8617.patch             |  29 ++
 .../bind/bind_9.11.5-P4.bb                    |   2 +
 .../glibc/glibc/CVE-2020-1752.patch           |  66 +++++
 meta/recipes-core/glibc/glibc_2.30.bb         |   1 +
 ...20-8492-Fix-AbstractBasicAuthHandler.patch | 248 ++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.7.bb |   1 +
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2020-11869.patch            |  97 +++++++
 .../strace/strace/Makefile-ptest.patch        |   2 +-
 meta/recipes-devtools/strace/strace/run-ptest |   7 +-
 .../ghostscript/CVE-2019-10216.patch          |  53 ++++
 .../ghostscript/ghostscript_9.27.bb           |   1 +
 ...Allow-enable-DRI-without-DRI-drivers.patch |   2 +-
 ....06.03.bb => wireless-regdb_2020.04.29.bb} |   3 +-
 ...idate_1.16.1.bb => gst-validate_1.16.2.bb} |   4 +-
 ...1.16.1.bb => gstreamer1.0-libav_1.16.2.bb} |   4 +-
 ...x_1.16.1.bb => gstreamer1.0-omx_1.16.2.bb} |   4 +-
 ....bb => gstreamer1.0-plugins-bad_1.16.2.bb} |   4 +-
 ...bb => gstreamer1.0-plugins-base_1.16.2.bb} |   4 +-
 ...bb => gstreamer1.0-plugins-good_1.16.2.bb} |   4 +-
 ...bb => gstreamer1.0-plugins-ugly_1.16.2.bb} |   4 +-
 ...son.build-fix-builds-with-python-3.8.patch |  24 ++
 ....16.1.bb => gstreamer1.0-python_1.16.2.bb} |   8 +-
 ....bb => gstreamer1.0-rtsp-server_1.16.2.bb} |   4 +-
 ...1.16.1.bb => gstreamer1.0-vaapi_1.16.2.bb} |   4 +-
 ...er1.0_1.16.1.bb => gstreamer1.0_1.16.2.bb} |   4 +-
 meta/recipes-support/icu/icu_64.2.bb          |  11 +-
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
2.25.4

