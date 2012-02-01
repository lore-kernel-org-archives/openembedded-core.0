Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RsjvD-0003eh-KO
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 00:49:03 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 01 Feb 2012 15:41:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="62271871"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Feb 2012 15:41:03 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2012 15:41:00 -0800
Message-Id: <7383f1cedaec32d269ccdd3777b7501497f7baef.1328139407.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <6e7973add09749de3b14543fde53791076063657.1328139407.git.nitin.a.kamble@intel.com>
References: <6e7973add09749de3b14543fde53791076063657.1328139407.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1328139407.git.nitin.a.kamble@intel.com>
References: <cover.1328139407.git.nitin.a.kamble@intel.com>
Subject: [patch-v2 6/7] bdwgc: change the PV
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
X-List-Received-Date: Wed, 01 Feb 2012 23:49:03 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This is done so that out internal verion tracking system would
not complain that upstream version has changed.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../{bdwgc_20110107.bb => bdwgc_7.2alpha5.bb}      |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-support/bdwgc/{bdwgc_20110107.bb => bdwgc_7.2alpha5.bb} (100%)

diff --git a/meta/recipes-support/bdwgc/bdwgc_20110107.bb b/meta/recipes-support/bdwgc/bdwgc_7.2alpha5.bb
similarity index 100%
rename from meta/recipes-support/bdwgc/bdwgc_20110107.bb
rename to meta/recipes-support/bdwgc/bdwgc_7.2alpha5.bb
-- 
1.7.6.4



