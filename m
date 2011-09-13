Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R3cgz-0001FN-Jb
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 01:47:05 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 Sep 2011 16:41:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,376,1312182000"; d="scan'208";a="48466140"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.252])
	by azsmga001.ch.intel.com with ESMTP; 13 Sep 2011 16:41:46 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2011 16:41:38 -0700
Message-Id: <cover.1315956050.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] libzypp: remove the desktop icon
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
X-List-Received-Date: Tue, 13 Sep 2011 23:47:05 -0000

Richard

This removes the add/remove icon by packaging stuff in an
uninstalled rpm

Sau!

The following changes since commit c7af358ec427487ccc053316d2f68f6121b97181:

  dpkg: fix pkg_postinst_dpkg, don't supply {bindir}/update-alternatives (2011-09-13 17:11:01 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib sgw/oe-fix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgw/oe-fix

Saul Wold (1):
  libzypp: move package-manger to it own package

 meta/recipes-extended/libzypp/libzypp_git.bb |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

-- 
1.7.6



