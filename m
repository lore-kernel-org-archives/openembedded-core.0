Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RdmQX-0003fv-T6
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 18:27:34 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Dec 2011 09:20:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="89454775"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.57])
	by orsmga001.jf.intel.com with ESMTP; 22 Dec 2011 09:20:25 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2011 17:20:22 +0000
Message-Id: <cover.1324574345.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] Fix buildhistory issue with recommends and RPM
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
X-List-Received-Date: Thu, 22 Dec 2011 17:27:34 -0000

The following changes since commit db446421933d640528328e46a29f828a36d6649b:

  multilib.conf: Enable shadow-sysroot and libffi (2011-12-21 17:24:37 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/rpm-suggests
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/rpm-suggests

Paul Eggleton (1):
  classes/rootfs_rpm: handle recommends in query functions

 meta/classes/rootfs_rpm.bbclass |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

-- 
1.7.5.4



