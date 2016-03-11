Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 09AE973232
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 14:07:41 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 Mar 2016 06:07:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,320,1455004800"; d="scan'208";a="921777229"
Received: from jlock-mobl1.gar.corp.intel.com (HELO
	jlock-mobl.gar.corp.intel.com) ([10.252.4.28])
	by fmsmga001.fm.intel.com with ESMTP; 11 Mar 2016 06:07:41 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2016 14:07:28 +0000
Message-Id: <cover.1457705106.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [RFC PATCH 0/3] Remove RPM 4
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
X-List-Received-Date: Fri, 11 Mar 2016 14:07:44 -0000

This series removes RPM 4 and code to support it from OE Core. There are
several known issues with using RPM 4 and it seems better to acknowledge it's
unsupported by removing it from OE-Core than to leave  it in a non-functional
state.

Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

Regards,

Joshua

The following changes since commit 00d3fd571a8d261d065b43f5cf3076a381843984:

  siteinfo: Add ppc64le support. (2016-03-10 23:06:46 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/rmrpm
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/rmrpm

Joshua Lock (3):
  rpm: remove RPM 4
  smartpm: remove rpm4 patch
  lib/package_manager: remove RPM4 support code

 meta/lib/oe/package_manager.py                     |  94 ++---
 .../smart-add-for-rpm-ignoresize-check.patch       |  20 +-
 .../python/python-smartpm/smart-rpm4-fixes.patch   |  49 ---
 meta/recipes-devtools/python/python-smartpm_git.bb |   1 -
 .../add_RPMSENSE_MISSINGOK_to_rpmmodule.patch      |  20 --
 .../rpm/rpm-4.11.2/disable_shortcircuited.patch    |  23 --
 .../rpm/rpm-4.11.2/fix_libdir.patch                |  19 -
 meta/recipes-devtools/rpm/rpm-4.11.2/pythondeps.sh |  16 -
 .../rpm/rpm-4.11.2/remove-db3-from-configure.patch |  26 --
 .../rpm/rpm-4.11.2/remove-dir-check.patch          |  23 --
 .../rpm/rpm-4.11.2/rpm-scriptetexechelp.patch      | 194 -----------
 .../rpm/rpm-4.11.2/support-suggests-tag.patch      | 384 ---------------------
 .../rpm/rpm-4.11.2/use-pkgconfig-for-python.patch  |  38 --
 meta/recipes-devtools/rpm/rpm_4.11.2.bb            | 132 -------
 14 files changed, 47 insertions(+), 992 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-rpm4-fixes.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm-4.11.2/add_RPMSENSE_MISSINGOK_to_rpmmodule.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm-4.11.2/disable_shortcircuited.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm-4.11.2/fix_libdir.patch
 delete mode 100755 meta/recipes-devtools/rpm/rpm-4.11.2/pythondeps.sh
 delete mode 100644 meta/recipes-devtools/rpm/rpm-4.11.2/remove-db3-from-configure.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm-4.11.2/remove-dir-check.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm-4.11.2/rpm-scriptetexechelp.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm-4.11.2/support-suggests-tag.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm-4.11.2/use-pkgconfig-for-python.patch
 delete mode 100644 meta/recipes-devtools/rpm/rpm_4.11.2.bb

-- 
2.5.0


