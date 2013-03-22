Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jukka.rissanen@linux.intel.com>) id 1UIxM8-0004tu-4Y
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 09:29:44 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Mar 2013 01:11:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,891,1355126400"; d="scan'208";a="217668578"
Received: from sorvi.fi.intel.com ([10.237.72.58])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Mar 2013 01:11:43 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 10:11:40 +0200
Message-Id: <1363939902-23537-1-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
Subject: [PATCH v2 0/2] connman-conf fixes
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
X-List-Received-Date: Fri, 22 Mar 2013 08:29:45 -0000

Hi,

noticed some issues with connman-conf that is used to setup
the ethernet in qemu image.

v2:
- change the location of wired-setup in connman init.d script

Cheers,
Jukka


Jukka Rissanen (2):
  connman-conf: Move the setup script into /usr/lib/connman
  connman-conf: Avoid appending IPv4 address

 meta/recipes-connectivity/connman/connman-conf.bb                 | 8 +++++---
 .../recipes-connectivity/connman/connman-conf/qemuall/wired-setup | 2 +-
 meta/recipes-connectivity/connman/connman/connman                 | 4 ++--
 3 files changed, 8 insertions(+), 6 deletions(-)

-- 
1.7.11.4



