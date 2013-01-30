Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1U0SUW-0003cK-2z
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 08:53:57 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 29 Jan 2013 23:38:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,566,1355126400"; d="scan'208";a="250170082"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.59])
	by azsmga001.ch.intel.com with ESMTP; 29 Jan 2013 23:38:12 -0800
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2013 09:38:06 +0200
Message-Id: <1359531488-3198-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2 v2] Remove -systemd postfix
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
X-List-Received-Date: Wed, 30 Jan 2013 07:54:08 -0000

rebased so that the patch applies on systemd 197
removed RDEPENDS for avahi as Ross suggested 

Radu Moisan (2):
  systemd: Remove -systemd postfix
  avahi: Remove -systemd postfix

 meta/recipes-connectivity/avahi/avahi.inc |    8 +++-----
 meta/recipes-core/systemd/systemd_197.bb  |    9 ++++-----
 2 files changed, 7 insertions(+), 10 deletions(-)

-- 
1.7.9.5



