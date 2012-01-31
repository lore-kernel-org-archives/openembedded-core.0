Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RsI5k-0002s0-Fs
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 19:06:04 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 31 Jan 2012 09:36:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="101610252"
Received: from unknown (HELO localhost) ([10.255.14.180])
	by azsmga001.ch.intel.com with ESMTP; 31 Jan 2012 09:36:18 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org, Saul Wold <sgw@linux.intel.com>
Date: Tue, 31 Jan 2012 09:35:42 -0800
Message-Id: <cover.1328030784.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
Subject: [PATCH 0/1] bootimg: Do not force FAT32 on all images
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
X-List-Received-Date: Tue, 31 Jan 2012 18:06:04 -0000

The following changes since commit d7b13cd42ab8d5f44f97e119b73ec2e363677d26:

  useradd.bbclass: Fix missing quote (2012-01-27 23:57:33 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/user-contrib/dvhart/oe-core dvhart/bug/1940
  http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=dvhart/bug/1940

Darren Hart (1):
  bootimg: Do not force FAT32 on all images, it violates the FAT specification

 meta/classes/bootimg.bbclass |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

-- 
1.7.6.5



