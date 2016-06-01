Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 70EB67320F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 18:51:40 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 01 Jun 2016 11:51:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,402,1459839600"; d="scan'208";a="989084300"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga002.jf.intel.com with ESMTP; 01 Jun 2016 11:51:41 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2016 10:46:39 +0000
Message-Id: <cover.1464768925.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH 0/5] Enable installation of packages in DUT
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
X-List-Received-Date: Wed, 01 Jun 2016 18:51:42 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This series enable the functionality to install packages in the DUT
during runtime testing. Such packages must had been build previously
by bitbake and the packages are specified using a JSON file. This
functionality works with testimage and with testexport.

This address the concer of adding a task to extract the packages,
instead the extraction was added to the testimage and testexport
tasks. 

This also includes the use of an SDK package for systems with
missing dependencies in the testing system.

This address several bugs:
  - 7850
  - 8694
  - 8481


The following changes since commit 3c42280b8a5cac184311a59589849fec4e215a14:

  sanity: Drop setting C locale (2016-06-01 15:05:47 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug7850v3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug7850v3

Mariano Lopez (5):
  oetest.py: Add install/uninstall functionality for DUTs
  testimage.bbclass: Make dependency of cpio when using RPMs
  testexport-tarball.bb: Add recipe
  testexport.bbclass: Add support for testexport-tarball
  testexport.bbclass: Create tarballs for easy release

 meta/classes/testexport.bbclass              | 77 ++++++++++++++++++++++++++--
 meta/classes/testimage.bbclass               | 20 ++++++++
 meta/lib/oeqa/oetest.py                      | 74 ++++++++++++++++++++++++++
 meta/lib/oeqa/runexported.py                 | 35 ++++++++++++-
 meta/recipes-core/meta/testexport-tarball.bb | 56 ++++++++++++++++++++
 5 files changed, 256 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-core/meta/testexport-tarball.bb

-- 
2.6.6


