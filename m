Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1Qp9WE-0002Hy-CQ
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 03:48:10 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 Aug 2011 18:43:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,320,1309762800"; d="scan'208";a="36026820"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by fmsmga002.fm.intel.com with ESMTP; 04 Aug 2011 18:43:44 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 09:52:14 +0800
Message-Id: <cover.1312508225.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1]apr-util: disable pqsql support to avoid configure error
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
X-List-Received-Date: Fri, 05 Aug 2011 01:48:10 -0000

The pqsql config script will check host path and add host paths to compiler and linker options:
    adding "-I/usr/include/postgresql" to CPPFLAGS
    adding "-L/usr/lib" to LDFLAGS
    
Disable pqsql support since we didn't use this feature in other recipes.

Thanks,
Lei

The following changes since commit 8a731122e7811275f20065ba27645b97fadf362d:
  Richard Purdie (1):
        eglibc: Fix patch merge breakage

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib lmei3/apr-util
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/apr-util

Mei Lei (1):
  apr-util: disable pqsql support to avoid configure error

 meta/recipes-support/apr/apr-util_1.3.12.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)



