Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefanx.stanacar@intel.com>) id 1UVLIP-0001JB-S9
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 14:29:07 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Apr 2013 05:10:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,550,1363158000"; d="scan'208";a="324979957"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 25 Apr 2013 05:10:57 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.149])
	by linux.intel.com (Postfix) with ESMTP id B245A2C8001
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2013 05:10:48 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2013 15:10:58 +0300
Message-Id: <cover.1366891465.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/3] Small changes to the build performance script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Apr 2013 12:29:08 -0000



The following changes since commit addcfcda84ed6b43b00f569a6060e3b78196ef52:

  glib-2.0: disable tests for native builds, and respect ptest for LSB (2013-04-23 13:00:43 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib stefans/perf-test2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=stefans/perf-test2

Stefan Stanacar (3):
  scripts/contrib/build-perf-test.sh: use the same identation everywhere
  scripts/contrib/build-perf-test.sh: skip network sanity tests
  scripts/contrib/build-perf-test.sh: change the global results format

 scripts/contrib/build-perf-test.sh | 96 +++++++++++++++++++++-----------------
 1 file changed, 52 insertions(+), 44 deletions(-)

-- 
1.8.1.4



