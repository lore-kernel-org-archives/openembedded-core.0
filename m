Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RiDRV-0000GM-94
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 00:06:53 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Jan 2012 14:59:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="92638319"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by orsmga001.jf.intel.com with ESMTP; 03 Jan 2012 14:59:31 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jan 2012 14:59:28 -0800
Message-Id: <cover.1325631444.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
Subject: [PATCH 0/2] prelink & vte fixes
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
X-List-Received-Date: Tue, 03 Jan 2012 23:06:53 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The vte commit is redone to avoid adding introspection package in DEPENDS.

Thanks,
Nitin

The following changes since commit 0ff1d667dc23b0cc903c18f1b5e032c2b6630aae:

  distro: Add poky-tiny distro definition (2012-01-03 21:33:15 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/work
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/work

Nitin A Kamble (2):
  prelink: also look at nonstandard lib paths
  vte: upgrade from 0.24.3 to 0.28.2

 meta/recipes-devtools/prelink/prelink/prelink.conf |    8 +-
 meta/recipes-devtools/prelink/prelink_git.bb       |    2 +-
 meta/recipes-support/vte/vte.inc                   |    6 +-
 meta/recipes-support/vte/vte/introspection.patch   |   99 ++++++++++++++++++++
 meta/recipes-support/vte/vte_0.24.3.bb             |    8 --
 meta/recipes-support/vte/vte_0.28.2.bb             |    8 ++
 6 files changed, 116 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-support/vte/vte/introspection.patch
 delete mode 100644 meta/recipes-support/vte/vte_0.24.3.bb
 create mode 100644 meta/recipes-support/vte/vte_0.28.2.bb

-- 
1.7.4.4



