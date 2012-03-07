Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1S5C3N-0002Yl-2s
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Mar 2012 09:16:57 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Mar 2012 00:07:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="118539420"
Received: from unknown (HELO localhost) ([10.255.15.187])
	by orsmga002.jf.intel.com with ESMTP; 07 Mar 2012 00:07:26 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Mar 2012 00:06:27 -0800
Message-Id: <cover.1331107546.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 0/1] kernel.bbclass: Remove warnings for modutils and modprobe.d
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
X-List-Received-Date: Wed, 07 Mar 2012 08:16:57 -0000

The following changes since commit d7b8c247227f3cc82f92292407f548927e9fde78:

  base.bbclass: Fix PACKAGECONFIG handling when no flags are set (2012-03-05 13:03:41 -0800)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dvhart/bug/2036
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/bug/2036

Darren Hart (1):
  kernel.bbclass: Remove warnings for modutils and modprobe.d

 meta/classes/kernel.bbclass |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

-- 
1.7.6.5



