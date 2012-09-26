Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TGmXC-0007Ub-T5
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 09:59:55 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 26 Sep 2012 00:47:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,489,1344236400"; d="scan'208";a="226882906"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.66])
	by fmsmga002.fm.intel.com with ESMTP; 26 Sep 2012 00:46:44 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Sep 2012 09:52:13 +0300
Message-Id: <1348642334-27490-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH] *** bblayers.conf should be updated automatically
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
X-List-Received-Date: Wed, 26 Sep 2012 07:59:55 -0000

To keep things simple for this release, Paul proposed to put the bblayers.conf
merging code in sanity.bbclass. After upgrading bblayers.conf we tell the
user to re-run. It would be better if we could re-read the configuration but that
is something we can address in 1.4. Every layer should make its specific bblayers.conf
updates by appending to the check_bblayers_conf bitbake function. We decided that this
is the right thing to do because we don't want to be invasive. This represents the meta
merging functionality and does only the bblayers.conf v4 -> v5 update. The v5 -> v6
bblayers.conf update is done in another patch sent to poky@yoctoproject.org.

Constantin Musca (1):
  sanity.bbclass: bblayers.conf should be updated automatically

 meta/classes/sanity.bbclass |   56 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

-- 
1.7.9.5



