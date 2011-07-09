Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QfMvn-000579-HV
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Jul 2011 04:06:07 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Jul 2011 19:02:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,501,1304319600"; d="scan'208";a="23446320"
Received: from unknown (HELO localhost) ([10.255.13.187])
	by orsmga002.jf.intel.com with ESMTP; 08 Jul 2011 19:02:13 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Date: Fri,  8 Jul 2011 19:02:11 -0700
Message-Id: <cover.1310175992.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 0/1] bb-matrix performance metrics gathering and visualization scripts
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
X-List-Received-Date: Sat, 09 Jul 2011 02:06:07 -0000

Add bb-matrix.sh and bb-matrix-plot.sh. Example output of these scripts is
viewable here:

https://wiki.yoctoproject.org/wiki/Build_Performance#bb-matrix

The following changes since commit 9f4eaeef33da5595748253d59d95c7ca548e28fa:

  libx11: enable xcb support (2011-07-08 23:02:08 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dvhart/bb-perf
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/bb-perf

Darren Hart (1):
  bb-matrix: initial scripts to record TIME(1) metrics for BB and PM
    combinations

 scripts/contrib/bb-perf/bb-matrix-plot.sh |  137 +++++++++++++++++++++++++++++
 scripts/contrib/bb-perf/bb-matrix.sh      |   78 ++++++++++++++++
 2 files changed, 215 insertions(+), 0 deletions(-)
 create mode 100755 scripts/contrib/bb-perf/bb-matrix-plot.sh
 create mode 100755 scripts/contrib/bb-perf/bb-matrix.sh



