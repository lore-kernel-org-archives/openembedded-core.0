Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1SKUV1-0001UP-U1
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 15:00:44 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 Apr 2012 05:51:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="143157478"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.11])
	by fmsmga001.fm.intel.com with ESMTP; 18 Apr 2012 05:51:15 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Apr 2012 20:48:15 +0800
Message-Id: <cover.1334751924.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1][PULL] Hob: Workaround for RPM architecture renaming issue
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
X-List-Received-Date: Wed, 18 Apr 2012 13:00:44 -0000

Hi Richard,

This pull request contains a workaround for RPM architecture renaming issue.

Please help to review and pull.

Thanks,
Dongxiao

The following changes since commit 48ef8dbb0d1bdbc7e0e62665b5112282637f3266:

  lsb: Fix PR bump, fix bashisms, correct dependency issue, tweak package description (2012-04-18 12:06:48 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/hob-bugfix-oecore
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/hob-bugfix-oecore

Dongxiao Xu (1):
  packageinfo.bbclass: A workaround for RPM architecture renaming

 meta/classes/packageinfo.bbclass |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

-- 
1.7.4.1



