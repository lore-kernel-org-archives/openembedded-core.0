Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SrvXA-0005Yh-Jy
	for Openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 20:33:08 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 Jul 2012 11:21:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="168597909"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by orsmga001.jf.intel.com with ESMTP; 19 Jul 2012 11:21:45 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org,
	poky@yoctoproject.org
Date: Wed, 18 Jul 2012 11:21:17 -0700
Message-Id: <cover.1342635547.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 0/1] V2 add downloadfilename to wget fetcher
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
X-List-Received-Date: Thu, 19 Jul 2012 18:33:08 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

In this V2 commit, not required changes from __init__.py are removed.
Thanks,
Nitin

The following changes since commit 5b014eae151a1584df4e3d3b96d18f9df3e55665:

  fix my typos in patch headers (2012-07-16 21:45:01 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (1):
  bitbake wget fetcher: add parameter: downloadfilename

 bitbake/lib/bb/fetch2/wget.py |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

-- 
1.7.3.4



