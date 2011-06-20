Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1QYb1r-0000gc-OR
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 11:44:23 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Jun 2011 02:39:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,392,1304319600"; d="scan'208";a="18328003"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jun 2011 02:39:42 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jun 2011 17:51:46 +0800
Message-Id: <cover.1308563041.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.6.3.3
Subject: [PATCH 0/1]distrodata.bbclass:Get the extend recipe's information from nonbbextended recipe
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
X-List-Received-Date: Mon, 20 Jun 2011 09:44:24 -0000

Hi Saul,
	This patch will fix the issue that "native" and "nativesdk" and some other extend recipes colud not get some information(like matainer information or laskchecktime).
	Please review it.

Thanks,
Lei

The following changes since commit 2163461ec94528ecf046a04edc5db3d2dd3a6b8b:
  Tom Zanussi (1):
        systemtap: remove non-core COMPATIBLE_MACHINES

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib lmei3/distrodata
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/distrodata

Mei Lei (1):
  distrodata.bbclass: Get the extend recipe's information from non
    bbextended recipe

 meta/classes/distrodata.bbclass |   46 ++++++++++++++++++++++++++++-----------
 1 files changed, 33 insertions(+), 13 deletions(-)



