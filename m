Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RSsLd-0004QS-Kn
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 16:33:33 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Nov 2011 06:52:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,553,1315206000"; d="scan'208";a="94073405"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.177])
	by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2011 06:52:53 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Nov 2011 14:52:35 +0000
Message-Id: <cover.1321972798.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [RFC PATCH 0/1] packagehistory improvement
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
X-List-Received-Date: Tue, 22 Nov 2011 15:34:30 -0000

This is the initial implementation of the improvement for
packagehistory.bbclass. This bbclass is intended to be used to help
track changes to package output over time and hopefully catch unusual
situations such as a package doubling in size. You can try it out by
adding INHERIT += "packagehistory" to your local.conf, building
something that performs do_package and then looking in TMPDIR/pkghistory
to view the output.

I've tried to keep it fairly simple - i.e. no new storage backend, just
plain files, although I anticipate most people using it will want to
store the output in a git repository. There's potential for recording
more per-recipe / per-package information, if there are suggestions I'd
be keen to hear them.


Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

The following changes since commit 5f1dc1991f97037692193572298eb7f7a5640760:

  staging.bbclass: Add BB_SETSCENE_VERIFY_FUNCTION function (2011-11-22 13:04:31 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/packagehistory
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/packagehistory

Paul Eggleton (1):
  classes/packagehistory: fix and extend

 meta/classes/packagehistory.bbclass |  226 +++++++++++++++++++++++++++++------
 1 files changed, 189 insertions(+), 37 deletions(-)

-- 
1.7.5.4



