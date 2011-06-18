Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QXltm-0002hX-1m
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Jun 2011 05:08:38 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Jun 2011 20:05:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,384,1304319600"; d="scan'208";a="17699030"
Received: from unknown (HELO scimitar.amr.corp.intel.com) ([10.255.13.73])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jun 2011 20:05:07 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2011 20:04:20 -0700
Message-Id: <cover.1308365562.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [RFC PATCH 0/2] Sanity testing network connectivity
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
X-List-Received-Date: Sat, 18 Jun 2011 03:08:38 -0000

In response to a Yocto Bugzilla request[1] I've written a sanity test to check
whether BitBake is able to fecth from http, https and git sources. The idea
being that if the user is behing a proxy and this test fails we can more easily
help them diagnose and fix their problem.

I've built on the existing infrastructure for less frequent sanity tests so
whilst this test is reasonably heavy it will only run when TMPDIR changes
(usually first run?). Further I added a variable to disable just this sanity
check. People shipping offline installs to customers should just be able to
set the variable in their shipped configuration and not worry about this
sanity check irritating people.

The error message points to a wiki page[2] which is pretty vanilla right now
but the intention would be to flesh it out with guidance on common proxy/nat/etc
issues.

Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

The following changes since commit 835d817f1ba7b99167743fdb86ba80f3a07bd82d:

  systemtap: remove non-core COMPATIBLE_MACHINES (2011-06-16 22:12:40 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/connection-test
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/connection-test

Joshua Lock (2):
  sanity.bbclass: pass the data object to the less frequent test
    harnesses
  sanity: implement network connectivity test

 meta/classes/sanity.bbclass |   45 +++++++++++++++++++++++++++++++++++-------
 1 files changed, 37 insertions(+), 8 deletions(-)

-- 
1.7.5.4



