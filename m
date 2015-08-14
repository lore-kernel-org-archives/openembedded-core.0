Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 48B5465C78
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 10:42:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 14 Aug 2015 03:42:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,677,1432623600"; d="scan'208";a="748520651"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by orsmga001.jf.intel.com with ESMTP; 14 Aug 2015 03:42:02 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Aug 2015 13:43:15 +0300
Message-Id: <cover.1439548737.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/5] Package version updates
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
X-List-Received-Date: Fri, 14 Aug 2015 10:42:03 -0000

This patchset contains package version updates for puzzles, tremor,
rpm and db.

The following changes since commit 07cbc407d84f2f8f5fee430902039aa7cef65db4:

  meta-yocto-bsp: mpc8315e-rdb: Set KERNEL_DEVICETREE to mpc8315erdb.dtb (2015-08-14 08:30:35 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/package-version-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Alexander Kanavin (5):
  package_regex.inc: fix regexes for adwaita-icon-theme, cairo and dhcp
  puzzles: switch svn for git, as upstream has done the same
  tremor: update to 20150107 (svn r19427)
  db: update to 6.1.26
  rpm: update to 5.4.15

 meta/conf/distro/include/package_regex.inc         |  5 +-
 ...atch => 0001-disable-external-key-server.patch} | 26 +++++++++--
 ...atement-is-not-working-properly-inside-o.patch} | 33 ++++++++------
 ...-db5-and-db6.-db6-is-licensed-under-AGPL.patch} | 53 +++++++++++++---------
 .../rpm/rpm/rpm-payload-use-hashed-inode.patch     | 20 --------
 ...broken-logic-for-ghost-avoidance-Mark-Hat.patch | 38 ----------------
 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb           |  1 -
 .../rpm/{rpm_5.4.14.bb => rpm_5.4.15.bb}           | 13 +++---
 .../obsolete_automake_macros.patch                 |  0
 .../tremor-arm-thumb2.patch                        |  0
 .../{tremor_20120314.bb => tremor_20150107.bb}     |  2 +-
 .../puzzles/files/puzzles_x32_abi_time.patch       | 30 ------------
 .../puzzles/{puzzles_r10286.bb => puzzles_git.bb}  |  9 ++--
 .../db/{db_6.0.30.bb => db_6.1.26.bb}              | 14 +++---
 14 files changed, 94 insertions(+), 150 deletions(-)
 rename meta/recipes-devtools/rpm/rpm/{rpm-macros.in-disable-external-key-server.patch => 0001-disable-external-key-server.patch} (55%)
 rename meta/recipes-devtools/rpm/rpm/{rpm-lua-fix-print.patch => 0002-Lua-print-statement-is-not-working-properly-inside-o.patch} (81%)
 rename meta/recipes-devtools/rpm/rpm/{rpm-db5-or-db6.patch => 0003-Support-both-db5-and-db6.-db6-is-licensed-under-AGPL.patch} (83%)
 delete mode 100644 meta/recipes-devtools/rpm/rpm/verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch
 rename meta/recipes-devtools/rpm/{rpm_5.4.14.bb => rpm_5.4.15.bb} (97%)
 rename meta/recipes-multimedia/tremor/{tremor-20120314 => tremor}/obsolete_automake_macros.patch (100%)
 rename meta/recipes-multimedia/tremor/{tremor-20120314 => tremor}/tremor-arm-thumb2.patch (100%)
 rename meta/recipes-multimedia/tremor/{tremor_20120314.bb => tremor_20150107.bb} (90%)
 delete mode 100644 meta/recipes-sato/puzzles/files/puzzles_x32_abi_time.patch
 rename meta/recipes-sato/puzzles/{puzzles_r10286.bb => puzzles_git.bb} (87%)
 rename meta/recipes-support/db/{db_6.0.30.bb => db_6.1.26.bb} (89%)

-- 
2.1.4


