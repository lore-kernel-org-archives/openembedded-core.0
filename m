Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RO9to-0003SU-3K
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 16:17:12 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 Nov 2011 07:10:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,484,1315206000"; d="scan'208";a="72333021"
Received: from unknown (HELO localhost) ([10.255.15.253])
	by azsmga001.ch.intel.com with ESMTP; 09 Nov 2011 07:10:54 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 09:11:58 -0600
Message-Id: <cover.1320851307.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] python: fix missing PR bump
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
X-List-Received-Date: Wed, 09 Nov 2011 15:17:12 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

Simple one-liner adding the missing PR bump for my previous python commit.

Thanks to Koen Kooi for pointing it out...

The following changes since commit 23d2eaf9d283cae47e52d1151f0d4ad53bbbe8a0:
  Tom Zanussi (1):
        python: skip setup.py 'import check' when cross-compiling

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/python-pr-bump
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/python-pr-bump

Tom Zanussi (1):
  python: bump PR

 meta/recipes-devtools/python/python_2.7.2.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)



