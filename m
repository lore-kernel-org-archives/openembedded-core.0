Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id C671E6B368
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 23:14:41 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 21 Aug 2013 16:14:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,930,1367996400"; d="scan'208";a="285060160"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.105])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Aug 2013 16:14:41 -0700
From: Saul Wold <sgw@linux.intel.com>
To: kai.kang@windriver.com,
	openembedded-core@lists.openembedded.org
Date: Wed, 21 Aug 2013 16:14:31 -0700
Message-Id: <1377126875-9856-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/4] libX11 Update & Valgrind patch
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
X-List-Received-Date: Wed, 21 Aug 2013 23:14:43 -0000

This is a set of updates for libX11 and a couple of
backport patches to address issues with libX11 and 
the eglibc update

The x11 update fixes issues with Fedora 19 and SDL.

Sau!


Kai Kang (2):
  libx11: upgrade to 1.6.1
  libx11-diet: upgrade to 1.6.1

Saul Wold (2):
  libsdl: Backport xData32 patch for x11 update
  valgrind: Backport patch for eglibc 2.18

 .../valgrind/valgrind-3.8.1/eglibc-2.18.patch      | 27 ++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.8.1.bb   |  1 +
 .../libsdl-1.2.15/libsdl-1.2.15-xdata32.patch      | 19 ++++++++++
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |  3 +-
 .../{libx11-diet_1.5.0.bb => libx11-diet_1.6.1.bb} |  7 ++--
 meta/recipes-graphics/xorg-lib/libx11.inc          |  3 +-
 .../xorg-lib/libx11/disable_tests.patch            |  9 +++--
 .../xorg-lib/libx11/keysymdef_include.patch        | 42 ----------------------
 meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb     | 13 -------
 meta/recipes-graphics/xorg-lib/libx11_1.6.1.bb     | 10 ++++++
 10 files changed, 69 insertions(+), 65 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind-3.8.1/eglibc-2.18.patch
 create mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.15/libsdl-1.2.15-xdata32.patch
 rename meta/recipes-graphics/xorg-lib/{libx11-diet_1.5.0.bb => libx11-diet_1.6.1.bb} (65%)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/keysymdef_include.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.6.1.bb

-- 
1.8.3.1


