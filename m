Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHmaR-0002rH-D9
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 03:43:07 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 10 Apr 2012 18:33:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129434388"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.159])
	by azsmga001.ch.intel.com with ESMTP; 10 Apr 2012 18:33:47 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2012 18:33:41 -0700
Message-Id: <cover.1334107957.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED PULL (for RC3) 0/5] Please review and pull this morning
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
X-List-Received-Date: Wed, 11 Apr 2012 01:43:08 -0000

Richard,

This is a set of fixes for RC3, there is a pending set for
meta-yocto to review.

Sau!

The following changes since commit bde1744018afd4616e114b20ffdc21b9abddcedc:

  hello-mod: Move hello-mod from meta to meta-skeleton (2012-04-10 13:16:00 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Lianhao Lu (1):
  connman: add ofono dependency.

Nitin A Kamble (1):
  tclibc-eglibc.inc: make locale packages dependency conditional

Saul Wold (2):
  boot-directdisk: remove the default setting of SYSLINUXCFG and
    SYSLINUXMENU
  task-self-hosted: Add vte and eglibc-gconv-ibm850

Yang Shi (1):
  initrdscripts: fix init-live.sh and use unionfs

 meta/classes/boot-directdisk.bbclass               |    3 --
 meta/conf/distro/include/tclibc-eglibc.inc         |   23 +++++++++++++------
 meta/recipes-connectivity/connman/connman.inc      |    1 +
 meta/recipes-core/initrdscripts/files/init-live.sh |   23 ++++++++++++++++---
 .../initrdscripts/initramfs-live-boot_1.0.bb       |    9 +++++++-
 meta/recipes-core/tasks/task-self-hosted.bb        |    4 ++-
 6 files changed, 47 insertions(+), 16 deletions(-)

-- 
1.7.7.6



