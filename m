Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E64376DD3A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 14:42:04 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Nov 2013 06:42:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,775,1378882800"; d="scan'208";a="440218454"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.39])
	by fmsmga002.fm.intel.com with ESMTP; 26 Nov 2013 06:42:03 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2013 14:41:50 +0000
Message-Id: <cover.1385476873.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/7] Recipe cleanups
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
X-List-Received-Date: Tue, 26 Nov 2013 14:42:06 -0000

The following changes since commit 4482af07df26644885bae49b98f5d765a5caa68c:

  qemu: add PACKAGECONFIG for vnc, libcurl, nss, uuid, curses, gtk+, libcap-ng (2013-11-26 12:09:51 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/cleanup
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/cleanup

Paul Eggleton (7):
  squashfs-tools: drop FILESPATHPKG
  squashfs-tools: set SUMMARY instead of DESCRIPTION
  alsa-utils-alsaconf: tidy up path setting
  eee-acpi-scripts: tidy up recipe
  dropbear: set SUMMARY instead of DESCRIPTION
  libpng: set reasonable SUMMARY
  Don't set DESCRIPTION to the same value as SUMMARY

 meta/recipes-bsp/eee-acpi-scripts/eee-acpi-scripts_git.bb | 15 ++++++++-------
 meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb   |  1 -
 meta/recipes-core/dropbear/dropbear.inc                   |  2 +-
 meta/recipes-devtools/cdrtools/cdrtools-native_3.01a17.bb |  1 -
 .../docbook-dsssl-stylesheets-native_1.79.bb              |  1 -
 meta/recipes-devtools/dosfstools/dosfstools_2.11.bb       |  1 -
 .../linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb        |  1 -
 meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb   |  1 -
 meta/recipes-devtools/sgmlspl/sgmlspl-native_1.03ii.bb    |  1 -
 .../recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb |  5 +----
 meta/recipes-extended/cups/cups.inc                       |  1 -
 meta/recipes-extended/grep/grep_2.15.bb                   |  1 -
 meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb  |  1 -
 meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb    |  1 -
 meta/recipes-extended/shadow/shadow.inc                   |  1 -
 meta/recipes-lsb4/libpng/libpng12_1.2.50.bb               |  3 +--
 meta/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb          |  1 -
 .../alsa/alsa-utils-alsaconf_1.0.27.2.bb                  |  3 +--
 meta/recipes-multimedia/libpng/libpng_1.6.6.bb            |  3 +--
 meta/recipes-support/libevent/libevent_2.0.21.bb          |  1 -
 20 files changed, 13 insertions(+), 32 deletions(-)

-- 
1.8.1.2


