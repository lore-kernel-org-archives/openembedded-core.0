Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 5597171C80
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 12:48:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 15 Dec 2016 04:48:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,351,1477983600"; d="scan'208";a="18480766"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 15 Dec 2016 04:48:28 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2016 14:47:53 +0200
Message-Id: <cover.1481805889.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH 00/16] Recipe version updates
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
X-List-Received-Date: Thu, 15 Dec 2016 12:48:28 -0000

Mostly minor version updates; for the first time these were done
in a quick and efficient fashion by using devtool.

For that experience I'd like to give major props to Paul Eggleton.

The following changes since commit a92d27acd8f42b61a2fc575311838b45d171f0af:

  oeqa/utils/commands.py: Fix get_bb_vars() when called without arguments (2016-12-14 16:15:04 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/package-version-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Alexander Kanavin (16):
  pigz: fix upstream version check
  libfm: update to 1.2.5
  liburcu: update to 0.9.3
  babeltrace: update to 1.5.0
  btrfs-tools: update to 4.8.5
  ca-certificates: update to 20161130
  cmake: update to 3.7.1
  ffmpeg: update to 3.2.2
  gnutls: update to 3.5.7
  icu: update to 58.2
  iso-codes: update to 3.72
  sysprof: update to 3.22.3
  vala: update to 0.34.4
  ghostscript: fix upstream version check
  upstream-version-is-even.bbclass: exclude various alphas, betas,
    pre-releases etc.
  xf86-video-intel: fix upstream version check

 meta/classes/upstream-version-is-even.bbclass      |  2 +-
 .../{btrfs-tools_4.8.4.bb => btrfs-tools_4.8.5.bb} |  2 +-
 ...cmake-native_3.7.0.bb => cmake-native_3.7.1.bb} |  0
 meta/recipes-devtools/cmake/cmake.inc              |  4 ++--
 .../cmake/{cmake_3.7.0.bb => cmake_3.7.1.bb}       |  0
 .../vala/{vala_0.34.3.bb => vala_0.34.4.bb}        |  4 ++--
 .../ghostscript/ghostscript_9.19.bb                |  1 +
 meta/recipes-extended/pigz/pigz_2.3.4.bb           |  1 +
 .../xorg-driver/xf86-video-intel_git.bb            |  1 +
 .../{babeltrace_1.4.0.bb => babeltrace_1.5.0.bb}   |  4 ++--
 .../{sysprof_3.22.2.bb => sysprof_3.22.3.bb}       |  4 ++--
 .../ffmpeg/{ffmpeg_3.2.1.bb => ffmpeg_3.2.2.bb}    |  4 ++--
 ...tes_20161102.bb => ca-certificates_20161130.bb} |  2 +-
 meta/recipes-support/gnutls/gnutls.inc             |  2 +-
 ...cli-args.h-to-cli-args.stamp-Makefile-tar.patch | 27 ++++++++++++++++++++++
 .../correct_rpl_gettimeofday_signature.patch       | 11 +++++----
 .../gnutls/{gnutls_3.5.6.bb => gnutls_3.5.7.bb}    |  5 ++--
 .../icu/{icu_58.1.bb => icu_58.2.bb}               |  4 ++--
 .../{iso-codes_3.71.bb => iso-codes_3.72.bb}       |  4 ++--
 .../{libfm-extra_1.2.4.bb => libfm-extra_1.2.5.bb} |  4 ++--
 .../libfm/{libfm_1.2.4.bb => libfm_1.2.5.bb}       |  4 ++--
 .../0001-Support-for-NIOS2-architecture.patch      | 13 ++++++-----
 .../liburcu/0002-Support-for-aarch64_be.patch      | 19 ---------------
 .../liburcu/{liburcu_0.9.2.bb => liburcu_0.9.3.bb} | 12 ++++------
 24 files changed, 73 insertions(+), 61 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.8.4.bb => btrfs-tools_4.8.5.bb} (95%)
 rename meta/recipes-devtools/cmake/{cmake-native_3.7.0.bb => cmake-native_3.7.1.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.7.0.bb => cmake_3.7.1.bb} (100%)
 rename meta/recipes-devtools/vala/{vala_0.34.3.bb => vala_0.34.4.bb} (56%)
 rename meta/recipes-kernel/lttng/{babeltrace_1.4.0.bb => babeltrace_1.5.0.bb} (82%)
 rename meta/recipes-kernel/sysprof/{sysprof_3.22.2.bb => sysprof_3.22.3.bb} (87%)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.2.1.bb => ffmpeg_3.2.2.bb} (97%)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20161102.bb => ca-certificates_20161130.bb} (98%)
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-Do-not-add-cli-args.h-to-cli-args.stamp-Makefile-tar.patch
 rename meta/recipes-support/gnutls/{gnutls_3.5.6.bb => gnutls_3.5.7.bb} (48%)
 rename meta/recipes-support/icu/{icu_58.1.bb => icu_58.2.bb} (85%)
 rename meta/recipes-support/iso-codes/{iso-codes_3.71.bb => iso-codes_3.72.bb} (76%)
 rename meta/recipes-support/libfm/{libfm-extra_1.2.4.bb => libfm-extra_1.2.5.bb} (80%)
 rename meta/recipes-support/libfm/{libfm_1.2.4.bb => libfm_1.2.5.bb} (90%)
 delete mode 100644 meta/recipes-support/liburcu/liburcu/0002-Support-for-aarch64_be.patch
 rename meta/recipes-support/liburcu/{liburcu_0.9.2.bb => liburcu_0.9.3.bb} (63%)

-- 
2.10.2


