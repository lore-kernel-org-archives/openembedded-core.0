Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A95436AC36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 00:28:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Mar 2015 17:28:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,455,1422950400"; d="scan'208";a="669540456"
Received: from bitbang.jf.intel.com ([10.7.201.37])
	by orsmga001.jf.intel.com with ESMTP; 23 Mar 2015 17:28:17 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Mar 2015 17:28:12 -0700
Message-Id: <1427156894-24614-1-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/2] Less intrusive journal fix
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
X-List-Received-Date: Tue, 24 Mar 2015 00:28:16 -0000

The following changes since commit 4bd886fb0081954879aaa2f574f3c7f6ced745d5:

  systemd: fix firmware path to match linux-firmware (2015-03-23 11:27:21 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib rewitt/empty-var-volatile

for you to fetch changes up to 34642f136f3830f8de88f816b9818ce855f9f129:

  image.bbclass: Empty /var/volatile if it is a mount point (2015-03-23 16:53:45 -0700)

----------------------------------------------------------------
Randy Witt (2):
      Revert "systemd: Fix the problem of an empty journal on boot"
      image.bbclass: Empty /var/volatile if it is a mount point

 meta/classes/image.bbclass                               | 16 ++++++++++++++++
 meta/recipes-core/systemd/systemd/journald-volatile.conf |  6 ------
 meta/recipes-core/systemd/systemd_219.bb                 |  2 --
 3 files changed, 16 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/journald-volatile.conf

