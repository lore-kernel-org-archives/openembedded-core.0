Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RqC1Q-0002Dp-F3
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 00:12:56 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Jan 2012 15:05:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="102718346"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.14.130])
	by orsmga002.jf.intel.com with ESMTP; 25 Jan 2012 15:05:08 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2012 15:05:05 -0800
Message-Id: <cover.1327532550.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 0/1] Don't add binutils to images when GPLv3 in INCOMPATIBLE_LICENSE v2
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
X-List-Received-Date: Wed, 25 Jan 2012 23:12:56 -0000

This second version has slightly tidier code per Richard's suggestions.

Cheers,
Joshua

The following changes since commit 746e8ffa66850bf9050cd6baf94eb76c492eb535:

  uclibc-git: Update to latest RC (2012-01-25 14:33:52 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/stuff
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/stuff

Joshua Lock (1):
  linux-tools: don't build perf when GPLv3 in INCOMPATIBLE_LICENSE

 meta/recipes-kernel/linux/linux-tools.inc       |   27 +++++++++++++++-------
 meta/recipes-kernel/linux/linux-yocto_2.6.37.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
 3 files changed, 20 insertions(+), 11 deletions(-)

-- 
1.7.7.6



