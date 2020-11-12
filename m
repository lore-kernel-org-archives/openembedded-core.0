Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web11.18077.1605153606613485322
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2020 20:00:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: hEgDZciB+aoYtewXX9oNBQ3JFi9dR2W2C+e5JsMcmt2T6tn6e0xArs5euYIin88DEkCFepfUdg
 qKWAck5YUaaQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="254963362"
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; 
   d="scan'208";a="254963362"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 20:00:05 -0800
IronPort-SDR: r8x+oVk5HXOtLnvre+czYSJreJIhtw2viiAn9ea33prHqGITShAFoHnaMNrP2uqVkIK/yODuVB
 P2InB9LGewGQ==
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; 
   d="scan'208";a="308700247"
Received: from mazlanmu-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.134.59])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 20:00:04 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 00/21] pull request (cover letter only)
Date: Thu, 12 Nov 2020 11:59:54 +0800
Message-Id: <cover.1605153374.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please merge these changes in gatesgarth.

Thanks,

Anuj

The following changes since commit b1eb390bbcb995c0da70478e17f9170721c75341:

  scripts/buildhistory_analysis: Avoid tracebacks from file comparision code (2020-10-30 12:37:53 +0000)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/gatesgarth-next

Alexander Kanavin (1):
  apt: remove host contamination with gtest

Chee Yang Lee (1):
  ruby: fix CVE-2020-25613

Jose Quaresma (12):
  gstreamer1.0: Fix reproducibility issue around libcap
  gstreamer1.0: Update 1.16.2 -> Update 1.16.3
  gstreamer1.0-plugins-base: Update 1.16.2 -> Update 1.16.3
  gstreamer1.0-plugins-good: Update 1.16.2 -> Update 1.16.3
  gstreamer1.0-plugins-bad: Update 1.16.2 -> Update 1.16.3
  gstreamer1.0-plugins-ugly: Update 1.16.2 -> Update 1.16.3
  gstreamer1.0-libav: Update 1.16.2 -> Update 1.16.3
  gstreamer1.0-vaapi: Update 1.16.2 -> Update 1.16.3
  gstreamer1.0-rtsp-server: Update 1.16.2 -> Update 1.16.3
  gstreamer1.0-omx: Update 1.16.2 -> Update 1.16.3
  gstreamer1.0-python: Update 1.16.2 -> Update 1.16.3
  gst-validate: Update 1.16.2 -> Update 1.16.3

Khem Raj (1):
  qemuboot.bbclass: Fix a typo

Mark Jonas (2):
  libsdl2: Fix directfb syntax error
  libsdl2: Fix directfb SDL_RenderFillRect

Mingli Yu (1):
  update_udev_hwdb: clean hwdb.bin

Yann E. MORIN (2):
  common-licenses: add bzip2-1.0.4
  recipes-core/busybox: fixup licensing information

Yongxin Liu (1):
  grub: clean up CVE patches

 meta/classes/qemuboot.bbclass                 |  2 +-
 meta/files/common-licenses/bzip2-1.0.4        | 43 ++++++++++++++++
 ...08-calloc-Use-calloc-at-most-places.patch} | 10 ++--
 ...ow-checking-primitives-where-we-do-.patch} | 10 ++--
 ...e-after-free-when-redefining-a-func.patch} | 10 ++--
 ...r-overflows-in-initrd-size-handling.patch} | 10 ++--
 ...we-always-have-an-overflow-checking.patch} |  0
 ...d-LVM-cache-logical-volume-handling.patch} |  0
 ...-arithmetic-primitives-that-check-f.patch} |  0
 ...sed-fields-from-grub_script_functio.patch} |  0
 meta/recipes-bsp/grub/grub2.inc               | 16 +++---
 meta/recipes-core/busybox/busybox.inc         |  7 +--
 ...t-configure-packages-on-installation.patch |  2 +-
 ...-init-tables-from-dpkg-configuration.patch |  2 +-
 ...n-dpkg-configure-a-at-the-end-of-our.patch |  2 +-
 ...ibapt-do-not-use-gtest-from-the-host.patch | 40 +++++++++++++++
 meta/recipes-devtools/apt/apt_1.8.2.1.bb      |  1 +
 .../ruby/ruby/CVE-2020-25613.patch            | 40 +++++++++++++++
 meta/recipes-devtools/ruby/ruby_2.7.1.bb      |  1 +
 .../libsdl2/directfb-renderfillrect-fix.patch | 33 +++++++++++++
 ...ectfb-spurious-curly-brace-missing-e.patch | 49 +++++++++++++++++++
 .../libsdl2/libsdl2_2.0.12.bb                 |  2 +
 ...idate_1.16.2.bb => gst-validate_1.16.3.bb} |  4 +-
 ...1.16.2.bb => gstreamer1.0-libav_1.16.3.bb} |  4 +-
 ...x_1.16.2.bb => gstreamer1.0-omx_1.16.3.bb} |  4 +-
 ....bb => gstreamer1.0-plugins-bad_1.16.3.bb} |  4 +-
 ...bb => gstreamer1.0-plugins-base_1.16.3.bb} |  4 +-
 ...bb => gstreamer1.0-plugins-good_1.16.3.bb} |  4 +-
 ...bb => gstreamer1.0-plugins-ugly_1.16.3.bb} |  4 +-
 ...son.build-fix-builds-with-python-3.8.patch | 24 ---------
 ....16.2.bb => gstreamer1.0-python_1.16.3.bb} |  8 ++-
 ....bb => gstreamer1.0-rtsp-server_1.16.3.bb} |  4 +-
 ...1.16.2.bb => gstreamer1.0-vaapi_1.16.3.bb} |  4 +-
 .../gstreamer/gstreamer1.0/capfix.patch       | 37 --------------
 ...er1.0_1.16.2.bb => gstreamer1.0_1.16.3.bb} |  9 ++--
 scripts/postinst-intercepts/update_udev_hwdb  |  1 +
 36 files changed, 279 insertions(+), 116 deletions(-)
 create mode 100644 meta/files/common-licenses/bzip2-1.0.4
 rename meta/recipes-bsp/grub/files/{0003-calloc-Use-calloc-at-most-places.patch => CVE-2020-14308-calloc-Use-calloc-at-most-places.patch} (99%)
 rename meta/recipes-bsp/grub/files/{0005-malloc-Use-overflow-checking-primitives-where-we-do-.patch => CVE-2020-14309-CVE-2020-14310-CVE-2020-14311-malloc-Use-overflow-checking-primitives-where-we-do-.patch} (99%)
 rename meta/recipes-bsp/grub/files/{0007-script-Avoid-a-use-after-free-when-redefining-a-func.patch => CVE-2020-15706-script-Avoid-a-use-after-free-when-redefining-a-func.patch} (95%)
 rename meta/recipes-bsp/grub/files/{0008-linux-Fix-integer-overflows-in-initrd-size-handling.patch => CVE-2020-15707-linux-Fix-integer-overflows-in-initrd-size-handling.patch} (96%)
 rename meta/recipes-bsp/grub/files/{0001-calloc-Make-sure-we-always-have-an-overflow-checking.patch => calloc-Make-sure-we-always-have-an-overflow-checking.patch} (100%)
 rename meta/recipes-bsp/grub/files/{0002-lvm-Add-LVM-cache-logical-volume-handling.patch => lvm-Add-LVM-cache-logical-volume-handling.patch} (100%)
 rename meta/recipes-bsp/grub/files/{0004-safemath-Add-some-arithmetic-primitives-that-check-f.patch => safemath-Add-some-arithmetic-primitives-that-check-f.patch} (100%)
 rename meta/recipes-bsp/grub/files/{0006-script-Remove-unused-fields-from-grub_script_functio.patch => script-Remove-unused-fields-from-grub_script_functio.patch} (100%)
 create mode 100644 meta/recipes-devtools/apt/apt/0001-test-libapt-do-not-use-gtest-from-the-host.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2020-25613.patch
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.patch
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-curly-brace-missing-e.patch
 rename meta/recipes-multimedia/gstreamer/{gst-validate_1.16.2.bb => gst-validate_1.16.3.bb} (87%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.16.2.bb => gstreamer1.0-libav_1.16.3.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.16.2.bb => gstreamer1.0-omx_1.16.3.bb} (92%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.16.2.bb => gstreamer1.0-plugins-bad_1.16.3.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.16.2.bb => gstreamer1.0-plugins-base_1.16.3.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.16.2.bb => gstreamer1.0-plugins-good_1.16.3.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.16.2.bb => gstreamer1.0-plugins-ugly_1.16.3.bb} (90%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.16.2.bb => gstreamer1.0-python_1.16.3.bb} (80%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.16.2.bb => gstreamer1.0-rtsp-server_1.16.3.bb} (86%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.16.2.bb => gstreamer1.0-vaapi_1.16.3.bb} (93%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.16.2.bb => gstreamer1.0_1.16.3.bb} (90%)

-- 
2.28.0

