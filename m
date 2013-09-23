Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DE62860FE1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 20:49:45 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Sep 2013 13:46:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,965,1371106800"; d="scan'208";a="382444026"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.196.147])
	by orsmga001.jf.intel.com with ESMTP; 23 Sep 2013 13:49:42 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2013 13:54:02 -0700
Message-Id: <cover.1379969542.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 0/2] EFI Installer Fixes
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
X-List-Received-Date: Mon, 23 Sep 2013 20:49:46 -0000

Fix two bugs reported against the efi installer script when testing on the
MinnowBoard.

Patches have been tested together, successfully installing from USB to SD on the
MinnowBoard and booting without any manual manipulation of the installation
media after the fact.

The following changes since commit bf6b0d95db3863a2cfbccb154c0c7ad5b3bbf0b0:

  glib-2.0: fix broken python script header on machines using buildtools (2013-09-22 12:23:35 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib dvhart/efi-installer
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=dvhart/efi-installer

Darren Hart (2):
  init-install-efi.sh: Fix root= specification
  init-install-efi.sh: Remove unnecessary udev rules file to avoid
    errors

 .../initrdscripts/files/init-install-efi.sh        |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
1.7.9.5


