Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R6574-0006wT-Nv
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Sep 2011 20:32:10 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 20 Sep 2011 11:26:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,412,1312182000"; d="scan'208";a="53689544"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.170])
	by fmsmga001.fm.intel.com with ESMTP; 20 Sep 2011 11:26:52 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Sep 2011 11:26:49 -0700
Message-Id: <cover.1316542962.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1 v2] Fix avahi x11 dependency with non-GPLv3 Build
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
X-List-Received-Date: Tue, 20 Sep 2011 18:32:11 -0000

This version removes the DISTRO_FEATURE check for x11 and simply
removes the DEPENDS on gtk and sets --disable-gtk to EXTRA_OECONF.

If someone uses/needs the avahi-ui bits, they are available in the
OE repo, we would consider taking them into oe-core if there is a clear
need for it.

Sau!


The following changes since commit 81274f4488fbc4d68d150870735ec0181b60b451:

  freetype: disable bzip2 compressed font support (2011-09-19 13:14:03 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib sgw/oe-fix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgw/oe-fix

Saul Wold (1):
  avahi: remove avahi-ui related packages

 meta/recipes-connectivity/avahi/avahi.inc |   19 +++++++------------
 1 files changed, 7 insertions(+), 12 deletions(-)

-- 
1.7.6



