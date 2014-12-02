Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9B16860601
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 16:10:54 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id bs8so30518937wib.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Dec 2014 08:10:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=dRshgBfG3xi2/LWr0xefbQmWD/K2Lb3ezE3H9+QrQbs=;
	b=fhrYv6azW9iF1utMXbSlBZLL2NroUidazBaL1BCpuaKKcp+r87IpMyVPBf3ZPn2pMy
	yrj6t/VsvFBc6KDK06ZPRE23D89ySOMQnwctQjJHtRBCM43078+M3buXN5PSrw/d6XsS
	r0OLl/aPj/MMXu5uIkk7JKkbrKmRxAjSQKw2VkTu7lxqqO9BMYdTSxBljRvBdfflgtrw
	9GaSL42nI5vOAULio7hDIfUl4NVMBBgwGb0mleLG5GN2Y10I1lWXZo3WkIBwYtpqQXkt
	kK14iDRdHt7+kSThwScCacKL8PS/WQdORQCuolq8K2d/GlfblzGOvrWPiGDRP0CloOT2
	vclw==
X-Gm-Message-State: ALoCoQlKc2TJhd0aY723HjCH1+fuPfXFicmAOUA7LgCvKDAv5KCzCjQLPui9Xyb3xT3hExWO18CJ
X-Received: by 10.180.90.133 with SMTP id bw5mr6619195wib.50.1417536548455;
	Tue, 02 Dec 2014 08:09:08 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	bc1sm46972714wib.16.2014.12.02.08.09.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Dec 2014 08:09:07 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Dec 2014 16:08:40 +0000
Message-Id: <cover.1417536374.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 00/26] C-Pull
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Dec 2014 16:11:01 -0000

Hi,

This branch has done a fully green run on the AB, apart from the repeating
random systemd failure (which I can't replicate locally).

Ross

The following changes since commit b8631416f12b8a904ce3deb036f9d5ce632937b0:

  package_regex.inc: Update REGEX'es in order to find upstream versions correctly (2014-11-28 14:03:02 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/mut

for you to fetch changes up to 1c5f38c91116d856b3f8801e535dbb73cc8fe212:

  gdb: disable Guile (2014-12-01 20:36:59 +0000)

----------------------------------------------------------------
Chong Lu (5):
      dbus: Upgrade to 1.8.10
      dbus-test: Upgrade to 1.8.10
      dbus-glib: Upgrade to 0.102
      connman-gnome: fix dbus interface name
      upstream_tracking.inc: update entries for dbus

Enrico Scholz (1):
      serf: fix 'ccache' builds

Hongxu Jia (5):
      cracklib: upgrade to 2.9.2
      libnewt/libnewt-python: upgrade to 0.52.18
      compress_doc.bbclass: improve manual file detection
      compress_doc.bbclass: support update-alternatives
      package_manager.py: check the result of create_index

Jian Liu (3):
      base-files: avoid overwritting editable files during package updating
      initscripts: avoid overwritting editable files during package updating
      libpam: avoid overwritting editable files during package updating

Khem Raj (1):
      package.bbclass: Create empty key/value if not there for shlib_provider

Laszlo Papp (1):
      toolchain-script: Add support for ccache builds with the SDK

Merten Sach (1):
      metadata_scm: Fix crash due to uncaught python exception

Ross Burton (3):
      bash: use EXTRA_AUTORECONF to disable autoheader
      attr: use EXTRA_AUTORECONF to disable autoheader
      gdb: disable Guile

Saul Wold (6):
      curl: Ugrade to 7.38
      babeltrace: Upgrade to 1.2.3
      npth: Upgrade to 1.1
      boost: Upgrade to 1.57
      pseudo: remove older version and patches
      resolvconf: add fixes for busybox and make it work

 .../conf/distro/include/upstream_tracking.inc      |    2 +-
 meta/classes/compress_doc.bbclass                  |   57 ++-
 meta/classes/metadata_scm.bbclass                  |    2 +-
 meta/classes/package.bbclass                       |    2 +
 meta/classes/toolchain-scripts.bbclass             |    2 +
 meta/lib/oe/package_manager.py                     |   20 +-
 .../connman-gnome-fix-dbus-interface-name.patch    |  187 +++++++++
 .../connman/connman-gnome_0.7.bb                   |    7 +-
 .../resolvconf/resolvconf/99_resolvconf            |    4 +
 .../resolvconf/fix-path-for-busybox.patch          |   20 +
 .../resolvconf/resolvconf_1.76.bb                  |   17 +-
 meta/recipes-core/base-files/base-files_3.0.14.bb  |    1 +
 .../obsolete_automake_macros.patch                 |   15 -
 meta/recipes-core/dbus/dbus-glib.inc               |    1 -
 .../no-examples.patch                              |    0
 .../test-install-makefile.patch                    |   57 +--
 meta/recipes-core/dbus/dbus-glib_0.100.2.bb        |    5 -
 meta/recipes-core/dbus/dbus-glib_0.102.bb          |    5 +
 .../{dbus-test_1.8.2.bb => dbus-test_1.8.10.bb}    |    0
 meta/recipes-core/dbus/dbus_1.8.10.bb              |    4 +
 meta/recipes-core/dbus/dbus_1.8.2.bb               |    4 -
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +
 meta/recipes-devtools/gdb/gdb-common.inc           |    2 +-
 .../0001-pseudo_has_unload-add-function.patch      |  190 ---------
 .../pseudo-1.5.1-install-directory-mode.patch      |   18 -
 .../pseudo/files/pseudo-fchmodat-permissions.patch |  264 -------------
 .../pseudo/files/shutdownping.patch                |   53 ---
 meta/recipes-devtools/pseudo/files/symver.patch    |   26 --
 meta/recipes-devtools/pseudo/pseudo_1.5.1.bb       |   20 -
 meta/recipes-extended/bash/bash.inc                |    3 +-
 .../{cracklib_2.9.1.bb => cracklib_2.9.2.bb}       |    4 +-
 ...python_0.52.17.bb => libnewt-python_0.52.18.bb} |    0
 .../{libnewt_0.52.17.bb => libnewt_0.52.18.bb}     |    6 +-
 meta/recipes-extended/pam/libpam_1.1.6.bb          |    6 +
 ...-Support-out-of-tree-builds-in-babeltrace.patch |   17 -
 ...uffers-from-objstack_alloc-on-sizeof-void.patch |   54 ---
 .../{babeltrace_1.2.1.bb => babeltrace_1.2.3.bb}   |    9 +-
 meta/recipes-support/attr/ea-acl.inc               |    2 +-
 ...bjam-native_1.56.0.bb => bjam-native_1.57.0.bb} |    0
 .../boost/{boost-1.56.0.inc => boost-1.57.0.inc}   |    4 +-
 ...rt-for-extending-operations-to-GCC-atomic.patch |  412 --------------------
 .../boost/{boost_1.56.0.bb => boost_1.57.0.bb}     |    1 -
 meta/recipes-support/curl/curl/CVE-2014-3613.patch |  269 -------------
 meta/recipes-support/curl/curl/CVE-2014-3620.patch |   69 ----
 .../curl/{curl_7.37.1.bb => curl_7.38.0.bb}        |    8 +-
 meta/recipes-support/npth/npth/pkgconfig.patch     |   48 +++
 .../npth/{npth_1.0.bb => npth_1.1.bb}              |    5 +-
 meta/recipes-support/serf/serf/env.patch           |   28 ++
 meta/recipes-support/serf/serf_1.3.8.bb            |    9 +-
 49 files changed, 451 insertions(+), 1490 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome/connman-gnome-fix-dbus-interface-name.patch
 create mode 100644 meta/recipes-connectivity/resolvconf/resolvconf/99_resolvconf
 create mode 100644 meta/recipes-connectivity/resolvconf/resolvconf/fix-path-for-busybox.patch
 delete mode 100644 meta/recipes-core/dbus/dbus-glib-0.100.2/obsolete_automake_macros.patch
 rename meta/recipes-core/dbus/{dbus-glib-0.100.2 => dbus-glib}/no-examples.patch (100%)
 rename meta/recipes-core/dbus/{dbus-glib-0.100.2 => dbus-glib}/test-install-makefile.patch (66%)
 delete mode 100644 meta/recipes-core/dbus/dbus-glib_0.100.2.bb
 create mode 100644 meta/recipes-core/dbus/dbus-glib_0.102.bb
 rename meta/recipes-core/dbus/{dbus-test_1.8.2.bb => dbus-test_1.8.10.bb} (100%)
 create mode 100644 meta/recipes-core/dbus/dbus_1.8.10.bb
 delete mode 100644 meta/recipes-core/dbus/dbus_1.8.2.bb
 delete mode 100644 meta/recipes-devtools/pseudo/files/0001-pseudo_has_unload-add-function.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/pseudo-1.5.1-install-directory-mode.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/pseudo-fchmodat-permissions.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/shutdownping.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/symver.patch
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
 rename meta/recipes-extended/cracklib/{cracklib_2.9.1.bb => cracklib_2.9.2.bb} (84%)
 rename meta/recipes-extended/newt/{libnewt-python_0.52.17.bb => libnewt-python_0.52.18.bb} (100%)
 rename meta/recipes-extended/newt/{libnewt_0.52.17.bb => libnewt_0.52.18.bb} (89%)
 delete mode 100644 meta/recipes-kernel/lttng/babeltrace/0001-Fix-Support-out-of-tree-builds-in-babeltrace.patch
 delete mode 100644 meta/recipes-kernel/lttng/babeltrace/Fix-Align-buffers-from-objstack_alloc-on-sizeof-void.patch
 rename meta/recipes-kernel/lttng/{babeltrace_1.2.1.bb => babeltrace_1.2.3.bb} (73%)
 rename meta/recipes-support/boost/{bjam-native_1.56.0.bb => bjam-native_1.57.0.bb} (100%)
 rename meta/recipes-support/boost/{boost-1.56.0.inc => boost-1.57.0.inc} (83%)
 delete mode 100644 meta/recipes-support/boost/boost/0001-Added-support-for-extending-operations-to-GCC-atomic.patch
 rename meta/recipes-support/boost/{boost_1.56.0.bb => boost_1.57.0.bb} (50%)
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2014-3613.patch
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2014-3620.patch
 rename meta/recipes-support/curl/{curl_7.37.1.bb => curl_7.38.0.bb} (90%)
 create mode 100644 meta/recipes-support/npth/npth/pkgconfig.patch
 rename meta/recipes-support/npth/{npth_1.0.bb => npth_1.1.bb} (74%)
 create mode 100644 meta/recipes-support/serf/serf/env.patch

Chong Lu (5):
  dbus: Upgrade to 1.8.10
  dbus-test: Upgrade to 1.8.10
  dbus-glib: Upgrade to 0.102
  connman-gnome: fix dbus interface name
  upstream_tracking.inc: update entries for dbus

Enrico Scholz (1):
  serf: fix 'ccache' builds

Hongxu Jia (5):
  cracklib: upgrade to 2.9.2
  libnewt/libnewt-python: upgrade to 0.52.18
  compress_doc.bbclass: improve manual file detection
  compress_doc.bbclass: support update-alternatives
  package_manager.py: check the result of create_index

Jian Liu (3):
  base-files: avoid overwritting editable files during package updating
  initscripts: avoid overwritting editable files during package
    updating
  libpam: avoid overwritting editable files during package updating

Khem Raj (1):
  package.bbclass: Create empty key/value if not there for
    shlib_provider

Laszlo Papp (1):
  toolchain-script: Add support for ccache builds with the SDK

Merten Sach (1):
  metadata_scm: Fix crash due to uncaught python exception

Ross Burton (3):
  bash: use EXTRA_AUTORECONF to disable autoheader
  attr: use EXTRA_AUTORECONF to disable autoheader
  gdb: disable Guile

Saul Wold (6):
  curl: Ugrade to 7.38
  babeltrace: Upgrade to 1.2.3
  npth: Upgrade to 1.1
  boost: Upgrade to 1.57
  pseudo: remove older version and patches
  resolvconf: add fixes for busybox and make it work

 .../conf/distro/include/upstream_tracking.inc      |    2 +-
 meta/classes/compress_doc.bbclass                  |   57 ++-
 meta/classes/metadata_scm.bbclass                  |    2 +-
 meta/classes/package.bbclass                       |    2 +
 meta/classes/toolchain-scripts.bbclass             |    2 +
 meta/lib/oe/package_manager.py                     |   20 +-
 .../connman-gnome-fix-dbus-interface-name.patch    |  187 +++++++++
 .../connman/connman-gnome_0.7.bb                   |    7 +-
 .../resolvconf/resolvconf/99_resolvconf            |    4 +
 .../resolvconf/fix-path-for-busybox.patch          |   20 +
 .../resolvconf/resolvconf_1.76.bb                  |   17 +-
 meta/recipes-core/base-files/base-files_3.0.14.bb  |    1 +
 .../obsolete_automake_macros.patch                 |   15 -
 meta/recipes-core/dbus/dbus-glib.inc               |    1 -
 .../no-examples.patch                              |    0
 .../test-install-makefile.patch                    |   57 +--
 meta/recipes-core/dbus/dbus-glib_0.100.2.bb        |    5 -
 meta/recipes-core/dbus/dbus-glib_0.102.bb          |    5 +
 .../{dbus-test_1.8.2.bb => dbus-test_1.8.10.bb}    |    0
 meta/recipes-core/dbus/dbus_1.8.10.bb              |    4 +
 meta/recipes-core/dbus/dbus_1.8.2.bb               |    4 -
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +
 meta/recipes-devtools/gdb/gdb-common.inc           |    2 +-
 .../0001-pseudo_has_unload-add-function.patch      |  190 ---------
 .../pseudo-1.5.1-install-directory-mode.patch      |   18 -
 .../pseudo/files/pseudo-fchmodat-permissions.patch |  264 -------------
 .../pseudo/files/shutdownping.patch                |   53 ---
 meta/recipes-devtools/pseudo/files/symver.patch    |   26 --
 meta/recipes-devtools/pseudo/pseudo_1.5.1.bb       |   20 -
 meta/recipes-extended/bash/bash.inc                |    3 +-
 .../{cracklib_2.9.1.bb => cracklib_2.9.2.bb}       |    4 +-
 ...python_0.52.17.bb => libnewt-python_0.52.18.bb} |    0
 .../{libnewt_0.52.17.bb => libnewt_0.52.18.bb}     |    6 +-
 meta/recipes-extended/pam/libpam_1.1.6.bb          |    6 +
 ...-Support-out-of-tree-builds-in-babeltrace.patch |   17 -
 ...uffers-from-objstack_alloc-on-sizeof-void.patch |   54 ---
 .../{babeltrace_1.2.1.bb => babeltrace_1.2.3.bb}   |    9 +-
 meta/recipes-support/attr/ea-acl.inc               |    2 +-
 ...bjam-native_1.56.0.bb => bjam-native_1.57.0.bb} |    0
 .../boost/{boost-1.56.0.inc => boost-1.57.0.inc}   |    4 +-
 ...rt-for-extending-operations-to-GCC-atomic.patch |  412 --------------------
 .../boost/{boost_1.56.0.bb => boost_1.57.0.bb}     |    1 -
 meta/recipes-support/curl/curl/CVE-2014-3613.patch |  269 -------------
 meta/recipes-support/curl/curl/CVE-2014-3620.patch |   69 ----
 .../curl/{curl_7.37.1.bb => curl_7.38.0.bb}        |    8 +-
 meta/recipes-support/npth/npth/pkgconfig.patch     |   48 +++
 .../npth/{npth_1.0.bb => npth_1.1.bb}              |    5 +-
 meta/recipes-support/serf/serf/env.patch           |   28 ++
 meta/recipes-support/serf/serf_1.3.8.bb            |    9 +-
 49 files changed, 451 insertions(+), 1490 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome/connman-gnome-fix-dbus-interface-name.patch
 create mode 100644 meta/recipes-connectivity/resolvconf/resolvconf/99_resolvconf
 create mode 100644 meta/recipes-connectivity/resolvconf/resolvconf/fix-path-for-busybox.patch
 delete mode 100644 meta/recipes-core/dbus/dbus-glib-0.100.2/obsolete_automake_macros.patch
 rename meta/recipes-core/dbus/{dbus-glib-0.100.2 => dbus-glib}/no-examples.patch (100%)
 rename meta/recipes-core/dbus/{dbus-glib-0.100.2 => dbus-glib}/test-install-makefile.patch (66%)
 delete mode 100644 meta/recipes-core/dbus/dbus-glib_0.100.2.bb
 create mode 100644 meta/recipes-core/dbus/dbus-glib_0.102.bb
 rename meta/recipes-core/dbus/{dbus-test_1.8.2.bb => dbus-test_1.8.10.bb} (100%)
 create mode 100644 meta/recipes-core/dbus/dbus_1.8.10.bb
 delete mode 100644 meta/recipes-core/dbus/dbus_1.8.2.bb
 delete mode 100644 meta/recipes-devtools/pseudo/files/0001-pseudo_has_unload-add-function.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/pseudo-1.5.1-install-directory-mode.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/pseudo-fchmodat-permissions.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/shutdownping.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/symver.patch
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
 rename meta/recipes-extended/cracklib/{cracklib_2.9.1.bb => cracklib_2.9.2.bb} (84%)
 rename meta/recipes-extended/newt/{libnewt-python_0.52.17.bb => libnewt-python_0.52.18.bb} (100%)
 rename meta/recipes-extended/newt/{libnewt_0.52.17.bb => libnewt_0.52.18.bb} (89%)
 delete mode 100644 meta/recipes-kernel/lttng/babeltrace/0001-Fix-Support-out-of-tree-builds-in-babeltrace.patch
 delete mode 100644 meta/recipes-kernel/lttng/babeltrace/Fix-Align-buffers-from-objstack_alloc-on-sizeof-void.patch
 rename meta/recipes-kernel/lttng/{babeltrace_1.2.1.bb => babeltrace_1.2.3.bb} (73%)
 rename meta/recipes-support/boost/{bjam-native_1.56.0.bb => bjam-native_1.57.0.bb} (100%)
 rename meta/recipes-support/boost/{boost-1.56.0.inc => boost-1.57.0.inc} (83%)
 delete mode 100644 meta/recipes-support/boost/boost/0001-Added-support-for-extending-operations-to-GCC-atomic.patch
 rename meta/recipes-support/boost/{boost_1.56.0.bb => boost_1.57.0.bb} (50%)
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2014-3613.patch
 delete mode 100644 meta/recipes-support/curl/curl/CVE-2014-3620.patch
 rename meta/recipes-support/curl/{curl_7.37.1.bb => curl_7.38.0.bb} (90%)
 create mode 100644 meta/recipes-support/npth/npth/pkgconfig.patch
 rename meta/recipes-support/npth/{npth_1.0.bb => npth_1.1.bb} (74%)
 create mode 100644 meta/recipes-support/serf/serf/env.patch

-- 
1.7.10.4


