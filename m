Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SeT1D-0002Le-Om
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 17:28:32 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 12 Jun 2012 08:17:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="111200972"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Jun 2012 08:17:55 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2012 18:17:50 +0300
Message-Id: <1339514272-7427-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] Bug fixes
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
X-List-Received-Date: Tue, 12 Jun 2012 15:28:32 -0000

This patchset contains two bug fixes for:
	- Yocto #2467
	- Yocto #1465

Laurentiu Palcu (2):
  sanity.bbclass: warn the user if BBPATH contains wrong entries
  connman: make useradd parameters consistent with rootless X

 meta/classes/sanity.bbclass                   |   11 +++++++++++
 meta/recipes-connectivity/connman/connman.inc |    4 ++--
 2 files changed, 13 insertions(+), 2 deletions(-)

-- 
1.7.9.5



