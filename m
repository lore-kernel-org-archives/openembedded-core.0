Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9D47E7170D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 17:17:05 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Sep 2014 10:17:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,628,1406617200"; d="scan'208";a="607677673"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO
	swold-linux.amr.corp.intel.com) ([10.255.13.44])
	by fmsmga002.fm.intel.com with ESMTP; 30 Sep 2014 10:16:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Sep 2014 10:16:50 -0700
Message-Id: <cover.1412095567.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/5] Add rpm4 recipe and enable smartpm for rpm4
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
X-List-Received-Date: Tue, 30 Sep 2014 17:17:09 -0000

This patch series is the last bit to enable rpm4 base code.  To use
this version you must set Preferred Version as such:

EFERRED_VERSION_rpm = "4.11.2"
PREFERRED_VERSION_rpm-native = "4.11.2"

The rootfs_rpm is a Work In Progress and I expect will not be accepted. 

Sau!



The following changes since commit bff185f6252751a97dcdf7ddfe86b808a714fdc5:

  dev-manual: Added a note to the EXTERNALSRC example about the class (2014-09-22 13:04:44 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib sgw/rpm4
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgw/rpm4

Saul Wold (5):
  nss: nss.pc is not target specific
  rpm5: add python-rpm PROVIDES
  python-smartpm: Add patches for rpm4
  rpm: add version 4.11.2
  rootfs_rpm: remove hard depends on rpmresolve - WIP

 meta/classes/rootfs_rpm.bbclass                    |   1 -
 .../python/python-smartpm/smart-dflags.patch       |  53 +--
 .../python/python-smartpm/smart-rpm4-fixes.patch   |  49 +++
 .../python/python-smartpm_1.4.1.bb                 |   5 +-
 .../add_RPMSENSE_MISSINGOK_to_rpmmodule.patch      |  20 ++
 .../rpm/rpm-4.11.2/disable_shortcircuited.patch    |  23 ++
 .../rpm/rpm-4.11.2/fix_libdir.patch                |  19 +
 meta/recipes-devtools/rpm/rpm-4.11.2/pythondeps.sh |  16 +
 .../rpm/rpm-4.11.2/remove-db3-from-configure.patch |  26 ++
 .../rpm/rpm-4.11.2/remove-dir-check.patch          |  23 ++
 .../rpm/rpm-4.11.2/rpm-scriptetexechelp.patch      | 194 +++++++++++
 .../rpm/rpm-4.11.2/support-suggests-tag.patch      | 384 +++++++++++++++++++++
 .../rpm/rpm-4.11.2/use-pkgconfig-for-python.patch  |  38 ++
 meta/recipes-devtools/rpm/rpm_4.11.2.bb            | 133 +++++++
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |   1 +
 meta/recipes-support/nss/nss.inc                   |   6 +-
 16 files changed, 962 insertions(+), 29 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-rpm4-fixes.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm-4.11.2/add_RPMSENSE_MISSINGOK_to_rpmmodule.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm-4.11.2/disable_shortcircuited.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm-4.11.2/fix_libdir.patch
 create mode 100755 meta/recipes-devtools/rpm/rpm-4.11.2/pythondeps.sh
 create mode 100644 meta/recipes-devtools/rpm/rpm-4.11.2/remove-db3-from-configure.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm-4.11.2/remove-dir-check.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm-4.11.2/rpm-scriptetexechelp.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm-4.11.2/support-suggests-tag.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm-4.11.2/use-pkgconfig-for-python.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm_4.11.2.bb

-- 
1.8.3.1


