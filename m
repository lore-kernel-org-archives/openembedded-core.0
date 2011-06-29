Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Qc2mm-00081e-7X
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 23:59:04 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Jun 2011 14:55:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,446,1304319600"; d="scan'208";a="22073363"
Received: from unknown (HELO scimitar.amr.corp.intel.com) ([10.255.13.240])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jun 2011 14:55:10 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2011 14:55:01 -0700
Message-Id: <cover.1309383978.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [RFC 0/2] Sanity check network connectivity
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
X-List-Received-Date: Wed, 29 Jun 2011 21:59:04 -0000

v3 of this change set based on extra feedback from Khem Raj.
Changes since v2:
* Remove references to Yocto, don't offer default uri's to check
* Make the error message configurable through a variable, CONNECTIVITY_CHECK_MSG,
whilst providing a reasonable default.

"In response to a Yocto Bugzilla request[1] I've written a sanity test to
check whether BitBake is able to fecth from http, https and git sources. The
idea being that if the user is behing a proxy and this test fails we can more
easily help them diagnose and fix their problem.

I've built on the existing infrastructure for less frequent sanity tests so
whilst this test is reasonably heavy it will only run when TMPDIR changes
(usually first run?). Further I added a variable to disable just this sanity
check. People shipping offline installs to customers should just be able to
set the variable in their shipped configuration and not worry about this
sanity check irritating people."

The following changes since commit ff014d9634638457622f6019b163e75bafcefada:

  task-base: add 3G into DISTRO_FEATURE (2011-06-29 14:46:46 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/connection-test
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/connection-test

Joshua Lock (2):
  sanity.bbclass: pass the data object to the less frequent test
    harnesses
  sanity: implement network connectivity test

 meta/classes/sanity.bbclass |   53 ++++++++++++++++++++++++++++++++++++------
 1 files changed, 45 insertions(+), 8 deletions(-)

-- 
1.7.5.4



