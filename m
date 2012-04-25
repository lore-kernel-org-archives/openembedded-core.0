Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1SMy83-0003Dg-TP
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Apr 2012 11:03:16 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 25 Apr 2012 01:53:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="145681515"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by fmsmga001.fm.intel.com with ESMTP; 25 Apr 2012 01:53:37 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Apr 2012 17:26:14 +0800
Message-Id: <cover.1335345819.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] Manual check for later package upgrade
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
X-List-Received-Date: Wed, 25 Apr 2012 09:03:16 -0000

Update the distro tracking info after manually checking.

The following changes since commit 492a58cabdc053b2312712681dbcffa8270d4ea4:

  self-hosted-image: Update poky revision to point at the 1.2 release branch (2012-04-24 10:21:11 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib shane/manual-check
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=shane/manual-check

Shane Wang (1):
  distro_tracking_fields: manual checks for some recipes

 .../conf/distro/include/distro_tracking_fields.inc |   83 ++++++++++----------
 1 files changed, 43 insertions(+), 40 deletions(-)

-- 
1.7.6



