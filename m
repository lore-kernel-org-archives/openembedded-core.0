Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QtFUm-00023R-MT
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 10:59:36 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Aug 2011 01:54:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="38167599"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by orsmga002.jf.intel.com with ESMTP; 16 Aug 2011 01:54:58 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 16:56:06 +0800
Message-Id: <cover.1313484812.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] multilib related fixed for opkg backend
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
X-List-Received-Date: Tue, 16 Aug 2011 08:59:36 -0000

This patch fixed the bug #1345 to allow the opkg backend installing both 
normal pacakges and multilib packages into the same rootfs.

The following changes since commit 13db5f420ca9bff98561f80d78958278734ad1f4:
  Zhai Edwin (1):
        distro-tracking: Update info for gpgme, libassuan, apr... after last upgrade.

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/bug1345
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/bug1345

Lianhao Lu (1):
  package(_ipk).bbclass: opkg using ALL_MULTILIB_PACKAGE_ARCHS

 meta/classes/package.bbclass     |   13 ++-----------
 meta/classes/package_ipk.bbclass |   30 ++++++++----------------------
 meta/classes/utils.bbclass       |   24 +++++++++++++++++++-----
 3 files changed, 29 insertions(+), 38 deletions(-)



