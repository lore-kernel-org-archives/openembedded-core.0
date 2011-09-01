Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qz5dv-0005zd-CR
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Sep 2011 13:41:11 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 01 Sep 2011 04:36:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,313,1312182000"; d="scan'208";a="47509937"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.18.57])
	by fmsmga002.fm.intel.com with ESMTP; 01 Sep 2011 04:36:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Sep 2011 12:36:11 +0100
Message-Id: <cover.1314876902.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1] Minor fix for SANITY_TESTED_DISTROS feature
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
X-List-Received-Date: Thu, 01 Sep 2011 11:41:11 -0000

The following changes since commit bf9e9961ec4e7b2d10f25b550b902df62b3939b1:

  Fix powerpc term and provide more template for different arches (2011-08-31 20:10:14 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/tested-distro-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/tested-distro-fix

Paul Eggleton (1):
  sanity.bbclass: fix splitting on newlines of SANITY_TESTED_DISTROS

 meta/classes/sanity.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.4.1



