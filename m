Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UAvg4-0003dr-13
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 06:05:24 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Feb 2013 20:48:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,753,1355126400"; d="scan'208";a="262444290"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.143])
	by azsmga001.ch.intel.com with ESMTP; 27 Feb 2013 20:48:44 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2013 20:48:42 -0800
Message-Id: <1362026924-10574-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH 0/2] Fix packages for new kernel Headers
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
X-List-Received-Date: Thu, 28 Feb 2013 05:05:26 -0000

These patches actually remove the use of the kernel headers
and target the userspace headers

Saul

Saul Wold (2):
  connman: add header to define in6_addr
  iproute2: don't use the kernel header tree

 .../connman/connman/add-in.h-for-ipv6.patch           | 19 +++++++++++++++++++
 meta/recipes-connectivity/connman/connman_1.10.bb     |  3 ++-
 meta/recipes-connectivity/iproute2/iproute2.inc       |  2 +-
 3 files changed, 22 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/add-in.h-for-ipv6.patch

-- 
1.8.0.2



