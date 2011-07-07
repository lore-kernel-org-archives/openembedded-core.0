Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QemXB-0000Oc-SU
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 13:14:18 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 07 Jul 2011 04:10:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,493,1304319600"; d="scan'208";a="23783554"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.202])
	by azsmga001.ch.intel.com with ESMTP; 07 Jul 2011 04:10:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2011 12:10:20 +0100
Message-Id: <cover.1310036935.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/2] Re-enable ipv4 features in busybox
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
X-List-Received-Date: Thu, 07 Jul 2011 11:14:18 -0000

The following changes since commit 465692552eae360e9053df1fd26a2e24f21785c1:

  tinylogin: use angstrom mirror for SRC_URI (2011-07-07 11:27:28 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/busybox-ipv4
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/busybox-ipv4

Paul Eggleton (2):
  default-distrovars.inc: add ipv4 to DISTRO_FEATURES
  busybox: bump PR to ensure ipv4 is enabled

 meta/conf/distro/include/default-distrovars.inc |    2 +-
 meta/recipes-core/busybox/busybox_1.18.4.bb     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.4.1



