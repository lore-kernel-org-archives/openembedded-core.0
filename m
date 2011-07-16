Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QhxiR-0000QT-MH
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jul 2011 07:47:03 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Jul 2011 22:43:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,212,1309762800"; d="scan'208";a="27902728"
Received: from unknown (HELO localhost) ([10.255.14.16])
	by azsmga001.ch.intel.com with ESMTP; 15 Jul 2011 22:43:00 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org, sgw@linux.intel.com,
	scott.a.garman@intel.com, richard.purdie@linuxfoundation.org
Date: Fri, 15 Jul 2011 22:42:47 -0700
Message-Id: <cover.1310794521.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 0/1] [YOCTO 1211]: revert sudo upgrade to fix rootless X
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
X-List-Received-Date: Sat, 16 Jul 2011 05:47:03 -0000

I found the recent sudo upgrade to be the cause of Yocto Bug 1211. I have
reviewed the sudo changelogs and didn't notice any changes to indicate that the
xserver-nodm init script was misusing sudo. Reverting the upgrade resolves the
issue. As the commit message doesn't indicate it was anything other than a
routine upgrade (and not a bug fix) I suggest we revert it until it can be shown
to work properly with xserver-nodm for rootless X.


The following changes since commit fa4bcfdb73167f8159b88e5a4d711c0d37627a70:

  bb-matrix: correct BB and PM number canonicalization (2011-07-14 22:23:09 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dvhart/sudo
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/sudo

Darren Hart (1):
  Revert "sudo: upgrade to v1.8.1p2"

 meta/recipes-extended/sudo/sudo.inc                |   27 +++++++++++--------
 .../sudo/{sudo_1.8.1p2.bb => sudo_1.7.4p6.bb}      |    4 +-
 2 files changed, 18 insertions(+), 13 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.1p2.bb => sudo_1.7.4p6.bb} (52%)



