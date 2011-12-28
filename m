Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1Rfnf1-00005v-P0
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 08:10:51 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Dec 2011 23:02:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="106590794"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by fmsmga002.fm.intel.com with ESMTP; 27 Dec 2011 23:02:29 -0800
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2011 14:56:50 +0800
Message-Id: <cover.1325055284.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] rpm:fix bug 1769
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
X-List-Received-Date: Wed, 28 Dec 2011 07:10:52 -0000

Hi all,
	This patch will fix bug 1769. The discussion from community can be found here:
	http://rpm5.org/community/rpm-devel/5087.html
	Please review and merge it.	
Thanks,
Lei



The following changes since commit 8f348ccad083d6c02c200652ff6295e701e88f0d:
  Saul Wold (1):
        coreutils: ensure --color works so DEPEND on libcap

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib lmei3/bug1769
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/bug1769

Mei Lei (1):
  rpm: Fix rpm database files capacity issue.

 meta/classes/rootfs_rpm.bbclass                   |    3 +++
 meta/recipes-devtools/rpm/rpm/rpm-db-reduce.patch |   19 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.0.bb            |    3 ++-
 3 files changed, 24 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-db-reduce.patch



