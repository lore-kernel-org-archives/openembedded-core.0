Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1AF1765CF4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 11:27:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 05 Jan 2015 03:23:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,698,1413270000"; d="scan'208";a="646388893"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2015 03:27:49 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Jan 2015 11:27:42 +0000
Message-Id: <cover.1420457243.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/3] Recipe upgrades
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
X-List-Received-Date: Mon, 05 Jan 2015 11:27:50 -0000

The following changes since commit 24f19fedb40d0af84beb8e9a6595ea06f09d4615:

  gstreamer1.0-omx: use mulitple SCMs to fetch submodules (2014-12-31 08:22:53 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/upgrades
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/upgrades

Paul Eggleton (3):
  libevdev: upgrade to 1.3
  openssh: upgrade to 6.7p1
  dropbear: upgrade to 2014.66

 .../openssh/openssh/nostrip.patch                  |  20 ----
 .../openssh/openssh/openssh-CVE-2011-4327.patch    |  29 ------
 .../openssh/openssh/openssh-CVE-2014-2653.patch    | 114 ---------------------
 .../openssh/{openssh_6.6p1.bb => openssh_6.7p1.bb} |  14 +--
 meta/recipes-core/dropbear/dropbear.inc            |   2 +-
 .../0001-urandom-xauth-changes-to-options.h.patch  |   2 +-
 meta/recipes-core/dropbear/dropbear_2014.63.bb     |   4 -
 meta/recipes-core/dropbear/dropbear_2014.66.bb     |   4 +
 .../{libevdev_1.2.2.bb => libevdev_1.3.bb}         |   4 +-
 9 files changed, 13 insertions(+), 180 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/nostrip.patch
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/openssh-CVE-2011-4327.patch
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/openssh-CVE-2014-2653.patch
 rename meta/recipes-connectivity/openssh/{openssh_6.6p1.bb => openssh_6.7p1.bb} (93%)
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2014.63.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2014.66.bb
 rename meta/recipes-support/libevdev/{libevdev_1.2.2.bb => libevdev_1.3.bb} (74%)

-- 
1.9.3


