Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QM6HW-0005c8-OI
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 00:28:54 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 16 May 2011 15:26:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,221,1304319600"; d="scan'208";a="437124099"
Received: from unknown (HELO localhost) ([10.255.12.172])
	by azsmga001.ch.intel.com with ESMTP; 16 May 2011 15:26:00 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 May 2011 15:25:55 -0700
Message-Id: <cover.1305584418.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Paul Eggleton <paul.eggleton@intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: [RFC PATCH v2 00/15] *-pull-request: cleanup and overhaul
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
X-List-Received-Date: Mon, 16 May 2011 22:28:55 -0000

After some discussion on the oe-core list regarding the *-pull-request scripts
I provided a proposal, received some feedback, and these patches are the result
of that discussion. The Cc list varies from patch to patch a bit more wildly
than is typical as a final sanity test, although it does reflect who commented
and expressed interest in which parts of the overhaul.

V2: do REMOTE_REPO regex per remote
    fix various regex issues
    fix wget ssl issues
    add github and oe (untested) REMOTE support
    simplify git-send-email usage logic, avoid duplicating git confirmation
    add -c, auto-cc per patch option

Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

The following changes since commit c12126ebf07604f998cb35546aa51d806d97af22:

  create-pull-request: switch URL from git.pokylinux.org/poky-contrib to git.openembedded.org/openembedded-core-contrib (2011-05-13 20:38:20 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dvhart/git-pull-v2-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/git-pull-v2-oe

Darren Hart (13):
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
  create-pull-request: add untested oe repository support
  send-pull-request: streamline git-send-email usage
  *pull-request: add copyright, license, and descriptions

Otavio Salvador (2):
  create-pull-request: do not check certificate
  create-pull-request: add GitHub remote support

 scripts/create-pull-request |  222 ++++++++++++++++++++++---------
 scripts/send-pull-request   |  307 ++++++++++++++++++++-----------------------
 2 files changed, 302 insertions(+), 227 deletions(-)



