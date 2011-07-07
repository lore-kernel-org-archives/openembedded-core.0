Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QeyPx-0002vn-4l
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 01:55:37 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Jul 2011 16:51:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,496,1304319600"; d="scan'208";a="24685233"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.188])
	by orsmga001.jf.intel.com with ESMTP; 07 Jul 2011 16:51:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jul 2011 00:51:39 +0100
Message-Id: <cover.1310082575.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/2] Update OLDEST_KERNEL v2
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
X-List-Received-Date: Thu, 07 Jul 2011 23:55:37 -0000

Since v1, this now updates the value to 2.6.16 instead of 2.6.0.

The following changes since commit f1fc6d084b079dea21ff1a30b815496452042490:

  pulseaudio: add 0.9.23 (2011-07-07 13:44:36 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/oldest-kernel-26
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/oldest-kernel-26

Paul Eggleton (2):
  bitbake.conf: update OLDEST_KERNEL to 2.6.16
  eglibc: bump PR for OLDEST_KERNEL change

 meta/conf/bitbake.conf                  |    2 +-
 meta/recipes-core/eglibc/eglibc_2.12.bb |    2 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.7.4.1



