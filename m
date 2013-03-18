Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jukka.rissanen@linux.intel.com>) id 1UHaYW-0003cT-2s
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 14:57:04 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Mar 2013 06:38:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,865,1355126400"; d="scan'208";a="303818128"
Received: from unknown (HELO localhost.localdomain) ([10.237.72.58])
	by orsmga002.jf.intel.com with ESMTP; 18 Mar 2013 06:38:31 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Mar 2013 15:38:26 +0200
Message-Id: <1363613908-20116-1-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
Subject: [PATCH 0/2] connman-conf fixes
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
X-List-Received-Date: Mon, 18 Mar 2013 13:57:18 -0000

Hi,

noticed some issues with connman-conf that is used to setup
the ethernet in qemu image.

Cheers,
Jukka


Jukka Rissanen (2):
  connman-conf: Move the setup script into /usr/lib/connman
  connman-conf: Avoid appending IPv4 address

 meta/recipes-connectivity/connman/connman-conf.bb                 | 8 +++++---
 .../recipes-connectivity/connman/connman-conf/qemuall/wired-setup | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
1.7.11.4



