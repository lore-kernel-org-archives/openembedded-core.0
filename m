Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QtXdF-0004lL-8V
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 06:21:33 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 16 Aug 2011 21:16:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,237,1312182000"; d="scan'208";a="39267160"
Received: from unknown (HELO localhost) ([10.255.13.238])
	by azsmga001.ch.intel.com with ESMTP; 16 Aug 2011 21:16:53 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 21:16:51 -0700
Message-Id: <cover.1313554368.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 0/1] fix yocto bug 1276: qemuppc hello-mod fails to build
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
X-List-Received-Date: Wed, 17 Aug 2011 04:21:33 -0000

The following changes since commit a21ff559e7c93e9da61104f4a33e42e6004189fd:

  Fixup remaining bb.msg.domain users (2011-08-15 17:31:52 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dvhart/powerpc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/powerpc

Darren Hart (1):
  kernel: restore crtsavres.o to enable building external modules on
    powerpc

 meta/classes/kernel.bbclass |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

-- 
1.7.6



