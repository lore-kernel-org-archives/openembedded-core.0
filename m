Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3906271F47
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 21:54:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 31 Oct 2014 14:54:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,295,1413270000"; d="scan'208";a="629256858"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.109])
	by orsmga002.jf.intel.com with ESMTP; 31 Oct 2014 14:54:48 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Oct 2014 14:54:45 -0700
Message-Id: <1414792488-4932-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/3] Priorty patches for 1.6.2
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
X-List-Received-Date: Fri, 31 Oct 2014 21:54:49 -0000

The following patches address QA issues with the release, while we don't normally
update recipes, the pseudo update is needed because of the 64bit XFS inode isses
encountered on the Auto builder creating the images.

There is one pending pacth on the Poky list for updating the DISTRO_VERSION, along 
Scott's Documentation branch has 1.6.2 updates. I would also like to include the 
CVE for curl that's pending, but has not hit master yet.

Finally once curl is in also a build-appliance update will be needed on Poky Branch.

Thanks
	Sau!

Alejandro Hernandez (1):
  ltp: Added zip-native as a DEPENDS

Peter Seebach (1):
  pseudo*.bb: update to pseudo 1.6.2

Richard Purdie (1):
  yocto-bsp: Update qemu inclusion lists

 meta/recipes-devtools/pseudo/pseudo_1.5.1.bb              | 15 ---------------
 meta/recipes-devtools/pseudo/pseudo_1.6.2.bb              | 10 ++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb                |  4 ++--
 meta/recipes-extended/ltp/ltp_20140115.bb                 |  2 +-
 .../target/arch/qemu/conf/machine/{{=machine}}.conf       |  5 +++--
 5 files changed, 16 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.6.2.bb

-- 
1.8.3.1


