Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jukka.rissanen@linux.intel.com>) id 1UXvDJ-0002DC-BE
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 17:14:30 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 May 2013 07:56:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,597,1363158000"; d="scan'208";a="296567891"
Received: from sorvi.fi.intel.com ([10.237.72.154])
	by azsmga001.ch.intel.com with ESMTP; 02 May 2013 07:56:33 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 May 2013 17:56:30 +0300
Message-Id: <1367506593-11381-1-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH v2 0/3] neard fixes
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
X-List-Received-Date: Thu, 02 May 2013 15:14:35 -0000

Hi,

there was too many unrelated changes in my earlier patch so this one splits
it more.


Cheers,
Jukka


Jukka Rissanen (3):
  neard: Rename the recipe as we are already in 0.10
  neard: Use SRCREV instead of SRCPV
  neard: Split recipe to two parts

 meta/recipes-connectivity/neard/neard.inc     | 59 +++++++++++++++++++++++
 meta/recipes-connectivity/neard/neard_0.10.bb | 11 +++++
 meta/recipes-connectivity/neard/neard_0.9.bb  | 69 ---------------------------
 3 files changed, 70 insertions(+), 69 deletions(-)
 create mode 100644 meta/recipes-connectivity/neard/neard.inc
 create mode 100644 meta/recipes-connectivity/neard/neard_0.10.bb
 delete mode 100644 meta/recipes-connectivity/neard/neard_0.9.bb

-- 
1.7.11.7



