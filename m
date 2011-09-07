Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R1KiA-0008Se-7q
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 18:10:50 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Sep 2011 09:05:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,346,1312182000"; d="scan'208";a="50058126"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.53])
	by fmsmga002.fm.intel.com with ESMTP; 07 Sep 2011 09:05:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2011 17:05:38 +0100
Message-Id: <cover.1315411459.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/4] Some miscellaneous bugfixes
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
X-List-Received-Date: Wed, 07 Sep 2011 16:10:50 -0000

The following changes since commit cb8efc0e1ec00892b46325aabfb1b4020a46c078:

  linux-yocto: re-enable utrace (2011-09-07 14:53:38 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/fixes5
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes5

Paul Eggleton (4):
  core-image.bbclass: zap root password if debug-tweaks not enabled
  sanity.bbclass: re-enable DISTRO check
  meta/recipes.txt: correct Qt capitalisation
  base.bbclass: fix substring matching in COMMERCIAL_LICENSE

 meta/classes/base.bbclass       |    4 ++--
 meta/classes/core-image.bbclass |    5 +++++
 meta/classes/sanity.bbclass     |    8 +++++---
 meta/recipes.txt                |    2 +-
 4 files changed, 13 insertions(+), 6 deletions(-)

-- 
1.7.4.1



