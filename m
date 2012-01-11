Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RlTdP-0007VJ-1V
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 00:00:39 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Jan 2012 15:59:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="94931932"
Received: from unknown (HELO localhost) ([10.255.13.207])
	by azsmga001.ch.intel.com with ESMTP; 11 Jan 2012 15:59:10 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jan 2012 15:58:38 -0800
Message-Id: <cover.1326326259.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 0/1] bootimg: Account for FAT filesystem overhead in image size
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
X-List-Received-Date: Thu, 12 Jan 2012 23:00:39 -0000

The following changes since commit 18c88fcec85f96d2495457928be913807971aea7:

  package.bbclass: per recipe PRSERV_HOST support (2012-01-11 10:37:43 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dvhart/bug/1852
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/bug/1852

Darren Hart (1):
  bootimg: Account for FAT filesystem overhead in image size

 meta/classes/bootimg.bbclass |   45 +++++++++++++++++++++++++++++++++--------
 1 files changed, 36 insertions(+), 9 deletions(-)

-- 
1.7.6.5



