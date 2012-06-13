Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SeewS-0001jV-EV
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jun 2012 06:12:24 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Jun 2012 21:01:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="152296941"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga001.jf.intel.com with ESMTP; 12 Jun 2012 21:01:46 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jun 2012 07:01:42 +0300
Message-Id: <1339560104-10189-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2 0/2] Bug fixes
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
X-List-Received-Date: Wed, 13 Jun 2012 04:12:24 -0000

Version 2 adds comments in connman.inc and xserver-nodm-init.bb to inform
that xuser's USERADD_PARAMs must be in sync, as suggested by Ross.

This patchset contains two bug fixes for:
	- Yocto #2467
	- Yocto #1465

Laurentiu Palcu (2):
  sanity.bbclass: warn the user if BBPATH contains wrong entries
  connman: make useradd parameters consistent with rootless X

 meta/classes/sanity.bbclass                        |   11 +++++++++++
 meta/recipes-connectivity/connman/connman.inc      |    6 ++++--
 .../x11-common/xserver-nodm-init.bb                |    2 ++
 3 files changed, 17 insertions(+), 2 deletions(-)

-- 
1.7.9.5



