Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RzsCo-0002KP-Ni
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 17:04:42 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 21 Feb 2012 07:56:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="68680078"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.60])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Feb 2012 07:56:21 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2012 15:56:19 +0000
Message-Id: <cover.1329839666.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [RFC PATCH 0/1] DISTRO_FEATURES_BACKFILL implementation
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
X-List-Received-Date: Tue, 21 Feb 2012 16:04:43 -0000

Implements DISTRO_FEATURES_BACKFILL to allow introducing new
DISTRO_FEATURES that control existing functionality without breaking
existing distro configuration, as discussed in the following thread:

http://article.gmane.org/gmane.comp.handhelds.openembedded.core/13033


Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

The following changes since commit 1da6a2dbd5e7aeea6cd45ca05590bdd50b67bf89:

  recipes: bump PR to rebuild .la files without libz.la (2012-02-21 15:00:24 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/distro-features-backfill
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/distro-features-backfill

Paul Eggleton (1):
  conf/bitbake.conf: add DISTRO_FEATURES_BACKFILL

 meta/conf/bitbake.conf |    3 +++
 meta/lib/oe/utils.py   |   20 ++++++++++++++++++++
 2 files changed, 23 insertions(+), 0 deletions(-)

-- 
1.7.5.4



