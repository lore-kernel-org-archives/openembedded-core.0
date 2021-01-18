Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web12.4317.1611013186187212884
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 15:39:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: +iyReeYsHMulU6+09lm6o7tJB7NPqayzyrCzxwNqbxd/9ROj8k1KXEgjzDKDbNI8KW5IQokXm5
 N4UHxFU9WDPQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="176286940"
X-IronPort-AV: E=Sophos;i="5.79,357,1602572400"; 
   d="scan'208";a="176286940"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 15:39:45 -0800
IronPort-SDR: SeHR94Y15PCq5+xEm3TpsASdQioeaNAtAZd6fWOnEgy+RxIBw9cp76QOO6Udu+i69clRzIxnGC
 x4mmUHuufRtw==
X-IronPort-AV: E=Sophos;i="5.79,357,1602572400"; 
   d="scan'208";a="355337713"
Received: from yonshuta-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.144.190])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 15:39:44 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 00/14] pull request (cover letter only)
Date: Tue, 19 Jan 2021 07:39:38 +0800
Message-Id: <cover.1610944455.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please merge these changes in gatesgarth.

Thanks,

Anuj

The following changes since commit 7aa1ae139b9131faff04c0ed156fd8efcde114f6:

  bitbake.conf: Prevent pyc file generation in pseudo context (2021-01-07 16:06:52 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/gatesgarth-next

Anuj Mittal (1):
  systemd: upgrade 246.6 -> 246.9

Bruce Ashfield (1):
  linux-yocto/5.4: update to v5.4.87

Khairul Rohaizzat Jamaluddin (2):
  curl: Fix CVE-2020-8284, CVE-2020-8285, CVE-2020-8286
  ffmpeg: Fix CVE-2020-35964, CVE-2020-35965

Martin Jansa (1):
  license.bbclass: Add COMMON_LICENSE_DIR and LICENSE_PATH dirs to
    PSEUDO_IGNORE_PATHS

Paul Barker (1):
  selftest: Add argument to keep build dir

Richard Purdie (4):
  bitbake.conf: Add /run/ to PSEUDO_IGNORE_PATHS
  pseudo: Drop patches merged into upstream branch
  pseudo: Add lchmod wrapper
  pseudo: Update for arm host and memleak fixes/cleanup

Scott Murray (1):
  glibc: CVE-2019-25013

Tomasz Dziendzielski (1):
  pseudo: Update to print PSEUDO_LOGFILE in abort message on path
    mismatches

Wang Mingyu (2):
  mobile-broadband-provider-info: upgrade 20190618 ->20201225
  binutils: upgrade 2.35 -> 2.35.1

 meta/classes/license.bbclass                  |    1 +
 meta/conf/bitbake.conf                        |    2 +-
 meta/lib/oeqa/selftest/context.py             |   17 +-
 .../mobile-broadband-provider-info_git.bb     |    4 +-
 .../glibc/glibc/CVE-2019-25013.patch          |  137 ++
 meta/recipes-core/glibc/glibc_2.32.bb         |    1 +
 ...md-boot_246.2.bb => systemd-boot_246.9.bb} |    0
 ...md-conf_246.1.bb => systemd-conf_246.9.bb} |    0
 meta/recipes-core/systemd/systemd.inc         |    2 +-
 ...tall-dependency-links-at-install-tim.patch |   36 +-
 ...002-don-t-use-glibc-specific-qsort_r.patch |   55 +-
 .../{systemd_246.6.bb => systemd_246.9.bb}    |    0
 ...{binutils-2.35.inc => binutils-2.35.1.inc} |    6 +-
 ...5.bb => binutils-cross-canadian_2.35.1.bb} |    0
 ....bb => binutils-cross-testsuite_2.35.1.bb} |    0
 ...cross_2.35.bb => binutils-cross_2.35.1.bb} |    0
 ...dk_2.35.bb => binutils-crosssdk_2.35.1.bb} |    0
 .../{binutils_2.35.bb => binutils_2.35.1.bb}  |    0
 meta/recipes-devtools/pseudo/pseudo_git.bb    |    2 +-
 .../linux/linux-yocto-rt_5.4.bb               |    6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |    8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |   22 +-
 .../ffmpeg/ffmpeg/CVE-2020-35964.patch        |   75 +
 .../ffmpeg/ffmpeg/CVE-2020-35965.patch        |   35 +
 .../recipes-multimedia/ffmpeg/ffmpeg_4.3.1.bb |    2 +
 ...02-remove-void-protop-create-union-p.patch | 1609 +++++++++++++++++
 .../curl/curl/CVE-2020-8284.patch             |  210 +++
 .../curl/curl/CVE-2020-8285.patch             |  257 +++
 .../curl/curl/CVE-2020-8286.patch             |  131 ++
 meta/recipes-support/curl/curl_7.72.0.bb      |    4 +
 30 files changed, 2547 insertions(+), 75 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2019-25013.patch
 rename meta/recipes-core/systemd/{systemd-boot_246.2.bb => systemd-boot_246.9.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-conf_246.1.bb => systemd-conf_246.9.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_246.6.bb => systemd_246.9.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.35.inc => binutils-2.35.1.inc} (96%)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.35.bb => binutils-cross-canadian_2.35.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross-testsuite_2.35.bb => binutils-cross-testsuite_2.35.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.35.bb => binutils-cross_2.35.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.35.bb => binutils-crosssdk_2.35.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils_2.35.bb => binutils_2.35.1.bb} (100%)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35964.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-35965.patch
 create mode 100644 meta/recipes-support/curl/curl/0002-remove-void-protop-create-union-p.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8284.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8285.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8286.patch

-- 
2.29.2

