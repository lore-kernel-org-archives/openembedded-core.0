Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RR5LD-0003gL-5S
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 18:01:35 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Nov 2011 08:55:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="76944582"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by orsmga001.jf.intel.com with ESMTP; 17 Nov 2011 08:55:09 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Nov 2011 08:55:07 -0800
Message-Id: <cover.1321548812.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
Subject: [PATCH 0/1] gmp recipe enhancement
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
X-List-Received-Date: Thu, 17 Nov 2011 17:01:35 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The following changes since commit e7486c3dc7114ef73ff36ce0cbd23eb87f370aa7:

  insane.bbclass: avoid errors for x32 kernel (2011-11-17 08:50:20 -0800)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/work
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/work

Nitin A Kamble (1):
  gmp: also generate the libgmpcxx library

 meta/recipes-support/gmp/gmp.inc      |    2 ++
 meta/recipes-support/gmp/gmp_4.2.1.bb |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

-- 
1.7.4.4



