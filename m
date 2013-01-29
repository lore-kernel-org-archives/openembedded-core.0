Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1U0DIV-0001Pq-SN
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 16:40:32 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Jan 2013 07:23:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,561,1355126400"; d="scan'208";a="278046850"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.59])
	by orsmga002.jf.intel.com with ESMTP; 29 Jan 2013 07:24:49 -0800
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2013 17:24:42 +0200
Message-Id: <1359473084-592-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] Remove -systemd postfix
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
X-List-Received-Date: Tue, 29 Jan 2013 15:40:33 -0000


Radu Moisan (2):
  systemd: Remove -systemd postfix
  avahi: Remove -systemd postfix

 meta/recipes-connectivity/avahi/avahi.inc |    8 ++++----
 meta/recipes-core/systemd/systemd_196.bb  |    9 ++++-----
 2 files changed, 8 insertions(+), 9 deletions(-)

-- 
1.7.9.5



