Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S54Ml-000460-2C
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Mar 2012 01:04:27 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 06 Mar 2012 15:55:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="74454795"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.109])
	by AZSMGA002.ch.intel.com with ESMTP; 06 Mar 2012 15:55:40 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2012 23:55:36 +0000
Message-Id: <cover.1331078069.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] Formfactor fix
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
X-List-Received-Date: Wed, 07 Mar 2012 00:04:27 -0000

The following change since commit d7b8c247227f3cc82f92292407f548927e9fde78:

  base.bbclass: Fix PACKAGECONFIG handling when no flags are set (2012-03-05 13:03:41 -0800)

is available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/formfactor
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/formfactor

Paul Eggleton (1):
  formfactor: use full path to fbset

 meta/recipes-bsp/formfactor/files/config      |    6 +++---
 meta/recipes-bsp/formfactor/formfactor_0.0.bb |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
1.7.5.4



