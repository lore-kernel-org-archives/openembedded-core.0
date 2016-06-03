Return-Path: <tom.zanussi@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CD99777599
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 21:18:26 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jun 2016 14:18:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,414,1459839600"; d="scan'208";a="115733786"
Received: from tzanussi-mobl.amr.corp.intel.com (HELO localhost)
	([10.254.121.190])
	by fmsmga004.fm.intel.com with ESMTP; 03 Jun 2016 14:18:26 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 16:18:24 -0500
Message-Id: <cover.1464988267.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/1][krogoth] Update KBRANCH for linux-yocto-rt_4.4
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
X-List-Received-Date: Fri, 03 Jun 2016 21:18:29 -0000

In order to enable branch creation based off of standard/preempt-rt in
the 4.4 kernel, standard/preeempt-rt/base was created, which meant
standard/preempt-rt had to be removed.

This patch updates the 4.4 linux-yocto-rt recipe to point to the new
branch (4.1 and previous versions already had standard/preempt-rt/base
and therefore don't need updates - only 4.4 is affected).

The following changes since commit 8f51f6153a09f8048fb4c4ce9cf4a19655240de4:

  toasterconf.json: exclude releases Toaster can't build (2016-06-03 15:02:19 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib tzanussi/preempt-rt-kbranch-update-krogoth
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/preempt-rt-kbranch-update-krogoth

Tom Zanussi (1):
  linux-yocto-rt/4.4: Update KBRANCH

 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.3


