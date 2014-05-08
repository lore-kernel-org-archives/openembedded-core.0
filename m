Return-Path: <valentin.popa@intel.com>
Received: from mga02.intel.com (unknown [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5DB1C609A7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 15:07:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 May 2014 08:06:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1010,1389772800"; d="scan'208";a="537126410"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.76])
	by orsmga002.jf.intel.com with ESMTP; 08 May 2014 08:06:14 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 May 2014 18:05:55 +0300
Message-Id: <cover.1399561398.git.valentin.popa@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/4] Package upgrades
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
X-List-Received-Date: Thu, 08 May 2014 15:07:05 -0000


The following changes since commit 3189e74559b7e5c304d7b5f73192b0fa722d8d01:

  attr: Fix uclibc builds (2014-05-08 13:11:51 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib vpopa/upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=vpopa/upgrades

Valentin Popa (4):
  libpng12: upgrade to 1.2.51
  libsoup: upgrade to 2.46.0
  libtasn1: upgrade to 3.5
  icu: upgrade to 53.1

 .../{libpng12_1.2.50.bb => libpng12_1.2.51.bb}     |  8 +-
 .../gnutls/{libtasn1_3.4.bb => libtasn1_3.5.bb}    |  4 +-
 ...fer_length_check_to_UTF_16_or_32_detector.patch | 33 --------
 .../0001-Disable-LDFLAGSICUDT-for-Linux.patch      |  0
 .../{icu-51.2 => icu}/icu-pkgdata-large-cmd.patch  |  0
 .../icu/{icu_51.2.bb => icu_53.1.bb}               | 15 ++--
 ...ailed-while-mips-gcc-optimization-enabled.patch | 95 ----------------------
 ...libsoup-2.4_2.45.3.bb => libsoup-2.4_2.46.0.bb} |  9 +-
 8 files changed, 20 insertions(+), 144 deletions(-)
 rename meta/recipes-lsb4/libpng/{libpng12_1.2.50.bb => libpng12_1.2.51.bb} (70%)
 rename meta/recipes-support/gnutls/{libtasn1_3.4.bb => libtasn1_3.5.bb} (82%)
 delete mode 100644 meta/recipes-support/icu/icu-51.2/add_buffer_length_check_to_UTF_16_or_32_detector.patch
 rename meta/recipes-support/icu/{icu-51.2 => icu}/0001-Disable-LDFLAGSICUDT-for-Linux.patch (100%)
 rename meta/recipes-support/icu/{icu-51.2 => icu}/icu-pkgdata-large-cmd.patch (100%)
 rename meta/recipes-support/icu/{icu_51.2.bb => icu_53.1.bb} (40%)
 delete mode 100644 meta/recipes-support/libsoup/files/fix-compiling-failed-while-mips-gcc-optimization-enabled.patch
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.45.3.bb => libsoup-2.4_2.46.0.bb} (78%)

-- 
1.9.1


