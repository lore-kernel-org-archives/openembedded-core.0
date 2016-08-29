Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 94260600B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 14:32:05 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 29 Aug 2016 07:31:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,596,1464678000"; d="scan'208";a="1048688638"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2016 07:31:56 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 17:30:07 +0300
Message-Id: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH 00/15] Version updates and webkitgtk build race fix
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
X-List-Received-Date: Mon, 29 Aug 2016 14:32:06 -0000

A bunch of version updates patches; I've also added a fix for the build
race in webkit that was occasionally seen on autobuilders.

The following changes since commit 2fedd226c3385f1ac160b3aa0bfadbded85e288c:

  ref-manual: Fixed small wording in PKGR in the glossary (2016-08-25 23:09:29 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/package-version-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Alexander Kanavin (15):
  libwebp: upgrade to 0.5.1
  btrfs-tools: update to 4.7.1
  iso-codes: upgrade to 3.69
  bash-completion: update to 2.4
  bdwgc: update to 7.6.0
  ffmpeg: update to 3.1.2
  gobject-introspection: odd versions are development snapshots
  gnutls: update to 3.5.3
  kexec-tools: update to 2.0.13
  lighttpd: update to 1.4.41
  mpg123: update to 1.23.6
  nss: update to 3.25
  asciidoc: fix upstream version check
  webkitgtk: upgrade to 2.12.4
  webkitgtk: fix racy double build of WebKit2-4.0.gir

 .../{btrfs-tools_4.6.1.bb => btrfs-tools_4.7.1.bb} |  2 +-
 meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb   |  1 +
 ...fig-for-pcre-dependency-instead-of-config.patch | 37 +++++++++++
 .../lighttpd/lighttpd/pkgconfig.patch              | 33 ----------
 .../{lighttpd_1.4.39.bb => lighttpd_1.4.41.bb}     |  6 +-
 .../gobject-introspection_1.48.0.bb                |  2 +-
 ...kexec-tools_2.0.12.bb => kexec-tools_2.0.13.bb} |  4 +-
 .../ffmpeg/{ffmpeg_3.1.1.bb => ffmpeg_3.1.2.bb}    |  4 +-
 .../mpg123/{mpg123_1.23.5.bb => mpg123_1.23.6.bb}  |  4 +-
 .../webp/{libwebp_0.5.0.bb => libwebp_0.5.1.bb}    |  4 +-
 ...ix-racy-parallel-build-of-WebKit2-4.0.gir.patch | 48 +++++++++++++++
 .../{webkitgtk_2.12.3.bb => webkitgtk_2.12.4.bb}   |  5 +-
 ...sh-completion_2.3.bb => bash-completion_2.4.bb} |  4 +-
 .../bdwgc/bdwgc/0002-Altera-NIOS2-support.patch    | 71 ----------------------
 .../bdwgc/{bdwgc_7.4.4.bb => bdwgc_7.6.0.bb}       |  7 +--
 .../gnutls/{gnutls_3.5.1.bb => gnutls_3.5.3.bb}    |  4 +-
 .../{iso-codes_3.68.bb => iso-codes_3.69.bb}       |  4 +-
 .../nss/{nss_3.24.bb => nss_3.25.bb}               |  6 +-
 18 files changed, 114 insertions(+), 132 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.6.1.bb => btrfs-tools_4.7.1.bb} (94%)
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch
 delete mode 100644 meta/recipes-extended/lighttpd/lighttpd/pkgconfig.patch
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.39.bb => lighttpd_1.4.41.bb} (91%)
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.12.bb => kexec-tools_2.0.13.bb} (88%)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.1.1.bb => ffmpeg_3.1.2.bb} (97%)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.23.5.bb => mpg123_1.23.6.bb} (95%)
 rename meta/recipes-multimedia/webp/{libwebp_0.5.0.bb => libwebp_0.5.1.bb} (92%)
 create mode 100644 meta/recipes-sato/webkit/files/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.12.3.bb => webkitgtk_2.12.4.bb} (96%)
 rename meta/recipes-support/bash-completion/{bash-completion_2.3.bb => bash-completion_2.4.bb} (88%)
 delete mode 100644 meta/recipes-support/bdwgc/bdwgc/0002-Altera-NIOS2-support.patch
 rename meta/recipes-support/bdwgc/{bdwgc_7.4.4.bb => bdwgc_7.6.0.bb} (85%)
 rename meta/recipes-support/gnutls/{gnutls_3.5.1.bb => gnutls_3.5.3.bb} (60%)
 rename meta/recipes-support/iso-codes/{iso-codes_3.68.bb => iso-codes_3.69.bb} (76%)
 rename meta/recipes-support/nss/{nss_3.24.bb => nss_3.25.bb} (97%)

-- 
2.9.3


