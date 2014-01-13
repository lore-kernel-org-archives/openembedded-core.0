Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 896D56DC3D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 15:22:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Jan 2014 07:22:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,653,1384329600"; d="scan'208";a="465875291"
Received: from smoffitt-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.149])
	by orsmga002.jf.intel.com with ESMTP; 13 Jan 2014 07:22:12 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jan 2014 15:22:05 +0000
Message-Id: <cover.1389626446.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/4] Recipe upgrades
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
X-List-Received-Date: Mon, 13 Jan 2014 15:22:39 -0000


The following changes since commit a5e6926cd409140d16391c72316da00ffbfe5429:

  terminal.bbclass: do not export PS1 (2014-01-10 15:15:47 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/upgrades
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/upgrades

Paul Eggleton (4):
  dropbear: upgrade to 2013.62
  chrpath: upgrade to 0.15
  cdrtools-native: upgrade to 3.01a20
  libsdl2: upgrade to 2.0.1

 meta/recipes-core/dropbear/dropbear.inc                             | 4 ++--
 .../0001-urandom-xauth-changes-to-options.h.patch                   | 0
 .../{dropbear-2013.60 => dropbear}/0002-static_build_fix.patch      | 0
 .../dropbear/{dropbear-2013.60 => dropbear}/0003-configure.patch    | 0
 .../dropbear/{dropbear-2013.60 => dropbear}/0004-fix-2kb-keys.patch | 0
 .../{dropbear-2013.60 => dropbear}/0005-dropbear-enable-pam.patch   | 0
 .../0006-dropbear-configuration-file.patch                          | 0
 .../0007-dropbear-fix-for-x32-abi.patch                             | 0
 meta/recipes-core/dropbear/dropbear_2013.60.bb                      | 4 ----
 meta/recipes-core/dropbear/dropbear_2013.62.bb                      | 4 ++++
 .../{cdrtools-native_3.01a17.bb => cdrtools-native_3.01a20.bb}      | 4 ++--
 meta/recipes-devtools/chrpath/{chrpath_0.14.bb => chrpath_0.15.bb}  | 6 +++---
 .../recipes-graphics/libsdl2/{libsdl2_2.0.0.bb => libsdl2_2.0.1.bb} | 4 ++--
 13 files changed, 13 insertions(+), 13 deletions(-)
 rename meta/recipes-core/dropbear/{dropbear-2013.60 => dropbear}/0001-urandom-xauth-changes-to-options.h.patch (100%)
 rename meta/recipes-core/dropbear/{dropbear-2013.60 => dropbear}/0002-static_build_fix.patch (100%)
 rename meta/recipes-core/dropbear/{dropbear-2013.60 => dropbear}/0003-configure.patch (100%)
 rename meta/recipes-core/dropbear/{dropbear-2013.60 => dropbear}/0004-fix-2kb-keys.patch (100%)
 rename meta/recipes-core/dropbear/{dropbear-2013.60 => dropbear}/0005-dropbear-enable-pam.patch (100%)
 rename meta/recipes-core/dropbear/{dropbear-2013.60 => dropbear}/0006-dropbear-configuration-file.patch (100%)
 rename meta/recipes-core/dropbear/{dropbear-2013.60 => dropbear}/0007-dropbear-fix-for-x32-abi.patch (100%)
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2013.60.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2013.62.bb
 rename meta/recipes-devtools/cdrtools/{cdrtools-native_3.01a17.bb => cdrtools-native_3.01a20.bb} (81%)
 rename meta/recipes-devtools/chrpath/{chrpath_0.14.bb => chrpath_0.15.bb} (80%)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.0.0.bb => libsdl2_2.0.1.bb} (94%)

-- 
1.8.1.2


