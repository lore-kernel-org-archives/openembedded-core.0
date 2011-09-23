Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R6vAk-0005KY-LJ
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Sep 2011 04:07:26 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Sep 2011 19:02:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="54690239"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.16])
	by orsmga002.jf.intel.com with ESMTP; 22 Sep 2011 19:02:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Sep 2011 19:02:03 -0700
Message-Id: <cover.1316743143.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] Another populate-sdk fix
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
X-List-Received-Date: Fri, 23 Sep 2011 02:07:26 -0000

I am not sure how this got mixed, but I found it when I did
a build on an 64bit system.

Sau!

The following changes since commit 51b1df89828e677232e125181209b26d3c5ec928:

  intltool: add libxml-parser-perl-native dependency to -native version (2011-09-22 22:21:54 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib sgw/oe-fix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgw/oe-fix

Saul Wold (1):
  populate_sdk_rpm: add items to the INSTALL_PROVIDESNAME_RPM list

 meta/classes/populate_sdk_rpm.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.6



