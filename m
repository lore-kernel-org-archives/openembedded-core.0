Return-Path: <laurentiu.palcu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 3CD2C6E93C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 14:58:06 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 11 Feb 2014 06:58:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,826,1384329600"; d="scan'208";a="473420836"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2014 06:58:04 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Feb 2014 16:58:01 +0200
Message-Id: <cover.1392130382.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] gmp: add configure.ac patch to append user provided compilation flags
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
X-List-Received-Date: Tue, 11 Feb 2014 14:58:06 -0000

The following changes since commit 9c61b6392c991363b0399ed36d6dec3f0d0d6bcf:

  bitbake: user-manual-metadata.xml: Edits to the "Sharing Functionality" section. (2014-02-11 12:17:06 +0000)

are available in the git repository at:

  git://mirror.rb.intel.com/git.yoctoproject.org/poky-contrib lpalcu/b5783_gmp_build_issue

for you to fetch changes up to 185f9a3161f4dfe3cf1643b1e11d4780c304c424:

  gmp: add configure.ac patch to append user provided compilation flags (2014-02-11 15:57:50 +0200)

----------------------------------------------------------------
Laurentiu Palcu (1):
      gmp: add configure.ac patch to append user provided compilation flags

 .../gmp/gmp-5.1.1/append_user_provided_flags.patch |   52 ++++++++++++++++++++
 meta/recipes-support/gmp/gmp_5.1.1.bb              |    1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/gmp/gmp-5.1.1/append_user_provided_flags.patch

Laurentiu Palcu (1):
  gmp: add configure.ac patch to append user provided compilation flags

 .../gmp/gmp-5.1.1/append_user_provided_flags.patch |   52 ++++++++++++++++++++
 meta/recipes-support/gmp/gmp_5.1.1.bb              |    1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/gmp/gmp-5.1.1/append_user_provided_flags.patch

-- 
1.7.9.5


