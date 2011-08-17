Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qtl4J-0001c0-2P
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 20:42:23 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Aug 2011 11:37:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,240,1312182000"; d="scan'208";a="39516513"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.18.37])
	by azsmga001.ch.intel.com with ESMTP; 17 Aug 2011 11:37:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Aug 2011 19:37:36 +0100
Message-Id: <cover.1313606178.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [RFC PATCH 0/2] Couple of fixes to help new users
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
X-List-Received-Date: Wed, 17 Aug 2011 18:42:23 -0000

Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

The following changes since commit 2e83e6755441cb14bd907d306974338c15173189:

  kernel: restore crtsavres.o to enable building external modules on powerpc (2011-08-17 15:46:16 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/sanity3
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/sanity3

Paul Eggleton (2):
  image.bbclass, kernel.bbclass: create warning file about deleting
    deploydir files
  sanity.bbclass: add optional untested host distro warning

 meta/classes/image.bbclass      |    2 +
 meta/classes/kernel.bbclass     |    2 +
 meta/classes/sanity.bbclass     |   48 +++++++++++++++++++++++++++++++++++++++
 meta/files/deploydir_readme.txt |    8 ++++++
 4 files changed, 60 insertions(+), 0 deletions(-)
 create mode 100644 meta/files/deploydir_readme.txt

-- 
1.7.4.1



