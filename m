Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1UXFSt-00029H-3J
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2013 20:39:47 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Apr 2013 11:18:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,582,1363158000"; d="scan'208";a="305755264"
Received: from jzhang-desktop.jf.intel.com (HELO localhost) ([10.7.201.69])
	by orsmga001.jf.intel.com with ESMTP; 30 Apr 2013 11:20:50 -0700
From: Jessica Zhang <jessica.zhang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Apr 2013 11:32:01 -0700
Message-Id: <cover.1367346500.git.jessica.zhang@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] Make toolchain output name using SDK_VERSION [yocto #2342]
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
X-List-Received-Date: Tue, 30 Apr 2013 18:39:49 -0000

The following changes since commit c42cc8fb38aee46f4778b9c68412a47ae5919923:

  neard: add systemd unit file (2013-04-29 15:31:41 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jzhang/2342
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jzhang/2342

Jessica Zhang (1):
  Make toolchain output name using SDK_VERSION instead of
    DISTRO_VERSION to be consistent [yocto #2342]

 meta/classes/populate_sdk_base.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.9.5



