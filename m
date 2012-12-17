Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TkXVr-0005BF-EG
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 11:01:32 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 17 Dec 2012 01:46:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,300,1355126400"; d="scan'208";a="181811021"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Dec 2012 01:46:48 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2012 11:46:45 +0200
Message-Id: <1355737607-8007-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] distcc,avahi - add users offline
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
X-List-Received-Date: Mon, 17 Dec 2012 10:01:32 -0000

Hi,

This is part of "run all postinstalls at do_rootfs time" effort.

Thanks,
Laurentiu

Laurentiu Palcu (2):
  avahi: use useradd.bbclass to add avahi-autoipd user
  distcc: use useradd.bbclass to add the distcc user

 meta/recipes-connectivity/avahi/avahi.inc     |   19 ++++++++-----------
 meta/recipes-devtools/distcc/distcc_2.18.3.bb |   19 +++++++++++--------
 2 files changed, 19 insertions(+), 19 deletions(-)

-- 
1.7.9.5



