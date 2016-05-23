Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D563F60290
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 21:57:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 23 May 2016 14:57:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,357,1459839600"; d="scan'208";a="960769644"
Received: from bitbang.jf.intel.com ([10.7.199.60])
	by orsmga001.jf.intel.com with ESMTP; 23 May 2016 14:57:02 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2016 14:56:59 -0700
Message-Id: <cover.1464040555.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/1] sstate fetch symlink removal
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 May 2016 21:57:08 -0000

This change removes the clutter of symlinks when sstate comes from a mirror
rather than being created on the host.

The following changes since commit c7e614c438706fb3ed7520b4990ebb3973366942:

  useradd: Fix infinite build loop (2016-05-23 10:33:45 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib rewitt/sstate-symlink
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rewitt/sstate-symlink

Randy Witt (1):
  sstate.bbclass: Don't create symlinks, download to the correct
    location

 meta/classes/sstate.bbclass | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

-- 
2.5.5


