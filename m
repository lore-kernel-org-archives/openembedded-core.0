Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SIYVQ-0005JZ-7Y
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 06:53:08 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 12 Apr 2012 21:43:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="130406276"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 12 Apr 2012 21:43:45 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Apr 2012 21:43:43 -0700
Message-Id: <cover.1334292091.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
Subject: [PATCH 0/2] Misc Fixes
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
X-List-Received-Date: Fri, 13 Apr 2012 04:53:08 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Misc Fixes. These are tested on 64bit fedora 17 alpha system for qemux86 machine

Nitin

The following changes since commit b8f45af0c477b23b85ea8eb02f3c9e46a666a422:

  mklibs-native: fix for gcc-4.7 (2012-04-12 15:25:04 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/bugfixes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/bugfixes

Nitin A Kamble (2):
  eglibc: fix perl path in target scripts on fedora 17 alpha
  eglibc: clean up the common code from 2.1[35] versions

 meta/recipes-core/eglibc/eglibc.inc     |    2 ++
 meta/recipes-core/eglibc/eglibc_2.13.bb |    5 +----
 meta/recipes-core/eglibc/eglibc_2.15.bb |    4 +---
 3 files changed, 4 insertions(+), 7 deletions(-)

-- 
1.7.7



