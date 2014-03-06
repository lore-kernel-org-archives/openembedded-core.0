Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B451A6F465
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 12:15:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Mar 2014 04:15:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,599,1389772800"; d="scan'208";a="467688600"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 06 Mar 2014 04:15:47 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Mar 2014 14:15:40 +0200
Message-Id: <cover.1394099850.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] Unique run-postinsts
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
X-List-Received-Date: Thu, 06 Mar 2014 12:15:48 -0000

This patchset removes the opkg/dpkg postinstalls that were creating their own
run-postinsts script which, sometimes, confused people... Instead, use the
already available run-postinsts recipe in order to create the run-postinsts
init script. It will be used for both 'package-management'/no
'package-management' in DISTRO_FEATURES.

In my tests I tried to cover as much usecases as possible, in various
combinations:
 * rpm/ipk/deb;
 * package-management/no package-management;
 * delayed/no delayed postinstalls;
 * sysvinit/systemd;

I hope I covered most of them. If there are any other 'dirty' usecases I should
be aware of, don't be shy.

laurentiu

The following changes since commit a01af0202558e6ed9d16590b3a8d1dd1b95c0374:

  recipes: bump PRs (2014-03-05 17:36:37 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/b5666_unique_run_postinsts
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b5666_unique_run_postinsts

Laurentiu Palcu (2):
  run-postinsts: use it for opkg/dpkg too
  opkg/dpkg: remove the postinstalls

 meta/recipes-devtools/dpkg/dpkg.inc                |   24 +-------
 meta/recipes-devtools/opkg/opkg.inc                |   28 +--------
 .../run-postinsts/run-postinsts/run-postinsts      |   63 +++++++++++++-------
 .../run-postinsts/run-postinsts_1.0.bb             |    2 +
 4 files changed, 44 insertions(+), 73 deletions(-)

-- 
1.7.9.5


