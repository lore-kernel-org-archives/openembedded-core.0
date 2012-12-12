Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1TivAf-0002JH-DK
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 23:52:57 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Dec 2012 14:37:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,269,1355126400"; d="scan'208";a="233049596"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.201.160])
	by orsmga001.jf.intel.com with ESMTP; 12 Dec 2012 14:38:16 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Dec 2012 14:39:12 -0800
Message-Id: <cover.1355351817.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Cc: Przemek Czesnowicz <przemyslawx.czesnowicz@intel.com>,
	Darren Hart <dvhart@linux.intel.com>, Joshua Immanuel <josh@hipro.co.in>,
	Steve Sakoman <steve@sakoman.com>
Subject: [PATCH 0/1] bootimg: Use FAT 32 for images larger than 512MB
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Dec 2012 22:52:58 -0000

The following changes since commit b8b1b39961332c99d62ee466f7859bd62a0f806f:

  bitbake.conf/utils: Drop some OVERRIDES from FILESPATH (2012-12-11 15:58:27 +0000)

are available in the git repository at:
  git://git.infradead.org/users/dvhart/oe-core.git dvhart/bug/2138-bootimg-fatsize
  http://git.infradead.org/users/dvhart/oe-core.git/shortlog/refs/heads/dvhart/bug/2138-bootimg-fatsize

Darren Hart (1):
  bootimg: Use FAT 32 for images larger than 512MB

 meta/classes/bootimg.bbclass |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

-- 
1.7.5.4



