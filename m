Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R67Ov-0001Mx-5c
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Sep 2011 22:58:45 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Sep 2011 13:53:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="50443808"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.170])
	by orsmga001.jf.intel.com with ESMTP; 20 Sep 2011 13:53:26 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Sep 2011 13:53:23 -0700
Message-Id: <cover.1316551810.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1 v3] Fix avahi x11 dependency with non-GPLv3 Build
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
X-List-Received-Date: Tue, 20 Sep 2011 20:58:45 -0000

Richard,

Koen was right, it was a little half baked, I forgot to commit
the avahi_0.6.30.bb file with the PR set up correctly.

Otherwise, at this point, read my last comment, if someone has a
need for the avahi-ui bits, then they can request that the be add
back into OE-core, at this point we don't beleive anyone is using 
them.

As this is targeted for the RC3 build, I do not want to take in more
change than necessary.

Thanks
	Sau!

The following changes since commit 81274f4488fbc4d68d150870735ec0181b60b451:

  freetype: disable bzip2 compressed font support (2011-09-19 13:14:03 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib sgw/oe-fix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgw/oe-fix

Saul Wold (1):
  avahi: remove avahi-ui related packages

 meta/recipes-connectivity/avahi/avahi.inc       |   19 +++++++------------
 meta/recipes-connectivity/avahi/avahi_0.6.30.bb |    2 +-
 2 files changed, 8 insertions(+), 13 deletions(-)

-- 
1.7.6



