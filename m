Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QPNBU-0006kY-Bs
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 01:08:12 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 May 2011 16:05:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,269,1304319600"; 
   d="scan'208";a="7701772"
Received: from unknown (HELO localhost) ([10.255.12.181])
	by fmsmga002.fm.intel.com with ESMTP; 25 May 2011 16:05:08 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2011 16:05:11 -0700
Message-Id: <cover.1306364294.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 0/1] utils.bbclass: make FILESEXTRAPATHS colon delimited
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
X-List-Received-Date: Wed, 25 May 2011 23:08:12 -0000

In trying to fix the broken FILESEXTRAPATHS breakage in meta-intel, Phil
Blundell noted that the space delimiting of FILESEXTRAPATHS was sub-optimal. I
didn't want to fix meta-intel twice, so this patch converts FILESEXTRAPATHS to
being colon delimited.

This patch applies cleanly to oe-core and poky.

The following changes since commit 1607d7b6809eb3f0aa8d09713a4e467a1f4585a2:

  IMAGE_ROOTFS_SIZE: Cleanup machine conf files (2011-05-25 14:07:37 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dvhart/filesextrapaths
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/filesextrapaths

Darren Hart (1):
  utils.bbclass: make FILESEXTRAPATHS colon delimited

 meta/classes/utils.bbclass |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)



