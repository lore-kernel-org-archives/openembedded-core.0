Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SHCG7-0002SG-GO
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Apr 2012 12:55:43 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 09 Apr 2012 03:46:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="139422771"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by fmsmga001.fm.intel.com with ESMTP; 09 Apr 2012 03:46:25 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Apr 2012 18:40:48 +0800
Message-Id: <cover.1333967983.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] adt-installer fixing
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
X-List-Received-Date: Mon, 09 Apr 2012 10:55:43 -0000

Fixing the adt-installer for ppc kernel naming and some other issues.

The following changes since commit 1a82989345fb98becb487d270fd93a5e6dffeb47:
  Saul Wold (1):
        runqemu-internal: Add console=tty for qemuppc and NFS

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/adt-installer
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/adt-installer

Lianhao Lu (1):
  adt-installer: Fixed ppc kernel naming.

 .../installer/adt-installer/adt_installer          |    4 ++--
 .../installer/adt-installer/adt_installer.conf     |   20 ++++++++++----------
 .../installer/adt-installer_1.0.bb                 |    2 +-
 3 files changed, 13 insertions(+), 13 deletions(-)



