Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1QMYFD-0001DU-RU
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 06:20:24 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 May 2011 21:17:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,229,1304319600"; 
   d="scan'208";a="148064"
Received: from jzhang-desktop.jf.intel.com (HELO localhost) ([10.7.201.78])
	by orsmga001.jf.intel.com with ESMTP; 17 May 2011 21:17:24 -0700
Message-Id: <cover.1305693096.git.jessica.zhang@intel.com>
Old-Date: Tue, 17 May 2011 21:31:36 -0700
Date: Tue, 17 May 2011 21:36:25 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Jessica Zhang <jessica.zhang@intel.com>
Subject: [PATCH 0/2] adt-installer cleanup for latest oecore changes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2011 04:20:24 -0000

From: Jessica Zhang <jessica.zhang@intel.com>

The change set includes extract bitbake config setting into data_define,
use config setting variables replace hardcode values, and add adt repo checking

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: jzhang/oe-rename
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jzhang/oe-rename

Thanks,
    Jessica Zhang <jessica.zhang@intel.com>
---


Jessica Zhang (2):
  extract bitbake config setting into data_define, use more variables
    replacing hardcoded values
  Add adt repo checking

 .../installer/adt-installer/adt_installer          |   15 +++++++++++++--
 .../installer/adt-installer/adt_installer.conf     |    2 +-
 .../adt-installer/scripts/adt_installer_internal   |    4 ++--
 .../installer/adt-installer/scripts/data_define    |    1 -
 .../installer/adt-installer_1.0.bb                 |    4 +++-
 5 files changed, 19 insertions(+), 7 deletions(-)



