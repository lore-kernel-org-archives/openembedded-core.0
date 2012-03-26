Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SC4FO-0004wj-Rq
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 09:21:47 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Mar 2012 00:12:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="123214276"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by azsmga001.ch.intel.com with ESMTP; 26 Mar 2012 00:12:45 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2012 15:10:00 +0800
Message-Id: <cover.1332745722.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] Fixed gcc-cross-canadian packaging warnings.
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
X-List-Received-Date: Mon, 26 Mar 2012 07:21:47 -0000

Fixed gcc-cross-canadian packaging warnings:
WARNING: For recipe gcc-cross-canadian-i586, the following files/directories were installed but not shipped in any package:
WARNING:   /opt/poky/1.1+snapshot/sysroots/x86_64-pokysdk-linux/usr/i586-poky-linux
WARNING:   /opt/poky/1.1+snapshot/sysroots/x86_64-pokysdk-linux/usr/i586-poky-linux/lib
WARNING:   /opt/poky/1.1+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/lib

The following changes since commit 647595821870693186c9ecad1bdfa12fe4ea334d:
  Robert P. J. Day (1):
        core-image-minimal-mtdutils.bb: Simple DESCRIPTION grammar fix.

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/warningfix2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/warningfix2

Lianhao Lu (1):
  gcc-cross-canadian: Fixed packaging warnings.

 meta/recipes-devtools/gcc/gcc-package-sdk.inc |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)



