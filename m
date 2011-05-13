Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QL1wl-0002ry-L0
	for openembedded-core@lists.openembedded.org;
	Sat, 14 May 2011 01:39:03 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 May 2011 16:36:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,367,1301900400"; 
   d="scan'208";a="1488573"
Received: from unknown (HELO localhost) ([10.255.12.78])
	by fmsmga002.fm.intel.com with ESMTP; 13 May 2011 16:36:12 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2011 16:35:59 -0700
Message-Id: <cover.1305329659.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	Paul Eggleton <paul.eggleton@intel.com>
Subject: [RFC PATCH 00/10] *-pull-request: cleanup and overhaul
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
X-List-Received-Date: Fri, 13 May 2011 23:39:03 -0000

After some discussion on the oe-core list regarding the *-pull-request scripts
I provided a proposal, received some feedback, and these patches are the result
of that discussion. The Cc list varies from patch to patch a bit more wildly
than is typical as a final sanity test, although it does reflect who commented
and expressed interest in which parts of the overhaul.

Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

The following changes since commit 65e5ebc1d27b0a6cb2e33596d6d32c536b857f0d:

  tcmode-default: fix a typo (2011-05-13 11:02:20 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib.git dvhart/git-pull
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/git-pull

Darren Hart (10):
  create-pull-request: alphabetize arguments
  create-pull-request: whitespace cleanup
  create-pull-request: use git request-pull and arbitrary remotes
  create-pull-request: rewrite known private URLs to public URLs
  create-pull-request: provide an RFC mode via -c argument
  send-pull-request: whitespace cleanup
  send-pull-request: remove local mta support
  send-pull-request: fix greedy auto-cc regex
  send-pull-request: don't send all patches to everyone even with -a
  send-pull-request: verify git sendemail config

 scripts/create-pull-request |  176 +++++++++++++++++++----------
 scripts/send-pull-request   |  265 ++++++++++++++++++-------------------------
 2 files changed, 228 insertions(+), 213 deletions(-)



