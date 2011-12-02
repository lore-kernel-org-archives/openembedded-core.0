Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RWJmF-0006xk-GV
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 04:27:07 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 Dec 2011 19:20:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="82017042"
Received: from unknown (HELO localhost) ([10.255.12.185])
	by orsmga001.jf.intel.com with ESMTP; 01 Dec 2011 19:20:13 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Thu,  1 Dec 2011 19:20:14 -0800
Message-Id: <cover.1322795646.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/1] Use ${S} explicitly for generated config files
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
X-List-Received-Date: Fri, 02 Dec 2011 03:27:07 -0000

The following changes since commit e57935dc18d576feb1003b48e7cdc72a444131b8:

  Revert "classes/buildhistory: add new output history collection class" (2011-12-01 23:00:52 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/user-contrib/dvhart/oe-core efi/cfgpath
  http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=efi/cfgpath

Darren Hart (1):
  bootimage: Use ${S} explicitly for generated config files 

 meta/classes/grub-efi.bbclass |    8 +++-----
 meta/classes/syslinux.bbclass |    4 ++--
 2 files changed, 5 insertions(+), 7 deletions(-)

-- 
1.7.6.4



