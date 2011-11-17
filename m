Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RR6n5-0008M2-TO
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 19:34:28 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Nov 2011 10:28:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,528,1315206000"; d="scan'208";a="76282013"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 17 Nov 2011 10:28:01 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Nov 2011 10:27:56 -0800
Message-Id: <cover.1321554390.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/1] reworked gmp commit
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
X-List-Received-Date: Thu, 17 Nov 2011 18:34:28 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Now the generated package names do not get changed.

The following changes since commit 01b645fca1f4816fccf057c6ac95e3ba0877421d:

  insane.bbclass: avoid errors for x32 kernel (2011-11-16 11:21:40 -0800)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/work
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/work

Nitin A Kamble (1):
  gmp: also generate the libgmpcxx library

 meta/recipes-support/gmp/gmp.inc      |    4 ++++
 meta/recipes-support/gmp/gmp_4.2.1.bb |    2 +-
 meta/recipes-support/gmp/gmp_5.0.2.bb |    2 +-
 3 files changed, 6 insertions(+), 2 deletions(-)

-- 
1.7.6.4



