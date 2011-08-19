Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QuHaS-0005qG-3p
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 07:25:44 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 18 Aug 2011 22:21:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,249,1312182000"; 
   d="scan'208";a="8815963"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Aug 2011 22:21:02 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Aug 2011 13:21:55 +0800
Message-Id: <cover.1313731222.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] Remove the hard coded url in adt-installer
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
X-List-Received-Date: Fri, 19 Aug 2011 05:25:44 -0000

This patch fixed the bug #1380. It removed the hard coded url in the opkg configuration files included in the adt-installer.

The following changes since commit 2e83e6755441cb14bd907d306974338c15173189:
  Darren Hart (1):
        kernel: restore crtsavres.o to enable building external modules on powerpc

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/bug1380
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/bug1380

Lianhao Lu (1):
  adt-installer: Removed the hard coded repo url.

 .../adt-installer/opkg/conf/opkg-sdk-i686.conf     |    2 +-
 .../adt-installer/opkg/conf/opkg-sdk-x86_64.conf   |    2 +-
 .../installer/adt-installer_1.0.bb                 |    5 ++++-
 3 files changed, 6 insertions(+), 3 deletions(-)



