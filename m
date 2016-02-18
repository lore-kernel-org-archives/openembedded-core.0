Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1F2E5731C8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 17:18:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Feb 2016 09:18:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,466,1449561600"; d="scan'208";a="915924490"
Received: from bitbang.jf.intel.com ([10.7.199.151])
	by orsmga002.jf.intel.com with ESMTP; 18 Feb 2016 09:18:01 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Feb 2016 09:17:52 -0800
Message-Id: <cover.1455815778.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/3] extsdk bug fixes
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
X-List-Received-Date: Thu, 18 Feb 2016 17:18:27 -0000

These are bug fixes for bugs found during installation of the ext sdk.
The following changes since commit bc72f64eb4041ef44198e3e0caeb2be9f43eb44e:

  linux-yocto: Update SRCREV for genericx86* for 4.4 (2016-02-11 22:58:38 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib 941d876fe835bc1aa26039d0edec9573d482bca3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=941d876fe835bc1aa26039d0edec9573d482bca3

Randy Witt (3):
  populate_sdk_ext: Don't ignore SDK_TARGETS value
  devtool: Don't recursively look for .devtoolbase in --basepath
  populate_sdk_ext.bbclass: Add SDK_RECRDEP_TASKS variable

 meta/classes/populate_sdk_ext.bbclass | 15 +++++++++++++--
 scripts/devtool                       | 28 ++++++++++++++++------------
 2 files changed, 29 insertions(+), 14 deletions(-)

-- 
2.5.0


