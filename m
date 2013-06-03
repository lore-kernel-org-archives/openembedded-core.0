Return-Path: <bogdan.a.marinescu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 567FC6A5B9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 12:57:04 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Jun 2013 05:57:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,792,1363158000"; d="scan'208";a="249990823"
Received: from bogdanm.rb.intel.com ([10.237.105.166])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Jun 2013 05:57:04 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2013 15:56:51 +0300
Message-Id: <cover.1370264032.git.bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/3] multiple package upgrades
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
X-List-Received-Date: Mon, 03 Jun 2013 12:57:04 -0000

Upgrades for diffstat, libpcre and subversion.

The following changes since commit 73dae11852c656adbf5a2b0e44ac4c7e0078cd8d:

  rpm: remove .real hacks in argument parsing (2013-05-31 14:02:45 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib bogdanm/work2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=bogdanm/work2

Bogdan Marinescu (3):
  diffstat: upgraded to 1.57
  libpcre: upgraded to 8.33
  subversion: upgraded to 1.7.10

 .../diffstat/diffstat/aclocal.patch                |   37 ++++++++++++++++++++
 .../{diffstat_1.55.bb => diffstat_1.57.bb}         |    8 ++---
 .../fix-install-depends.patch                      |    0
 .../libtool2.patch                                 |    0
 .../{subversion_1.7.9.bb => subversion_1.7.10.bb}  |    4 +--
 .../libpcre/{libpcre_8.32.bb => libpcre_8.33.bb}   |    7 ++--
 6 files changed, 46 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-devtools/diffstat/diffstat/aclocal.patch
 rename meta/recipes-devtools/diffstat/{diffstat_1.55.bb => diffstat_1.57.bb} (76%)
 rename meta/recipes-devtools/subversion/{subversion-1.7.9 => subversion-1.7.10}/fix-install-depends.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion-1.7.9 => subversion-1.7.10}/libtool2.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion_1.7.9.bb => subversion_1.7.10.bb} (88%)
 rename meta/recipes-support/libpcre/{libpcre_8.32.bb => libpcre_8.33.bb} (90%)

-- 
1.7.10.4


