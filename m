Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id B6E076014F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 23:00:31 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 16 Nov 2016 15:00:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,650,1473145200"; d="scan'208";a="902265450"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.5.38])
	by orsmga003.jf.intel.com with ESMTP; 16 Nov 2016 15:00:32 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2016 17:05:34 -0600
Message-Id: <cover.1479244148.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/3] bb-perf: scripting to plot buildstats data
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
X-List-Received-Date: Wed, 16 Nov 2016 23:00:33 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

buildstats data has been mostly unexplored mainly due to the lack of tools
to digest this data. The script buildstats.sh has been re-designed to
be much more flexible and the new script buildstats-plot.sh uses the latter
to produce data to be consumed by gnuplot. The tools used are datamash (package
at least not available in opensuse, so source code needs to be compiled and
installed) and gnuplot, so both must be present before running them.

Some plots created by buildstats-plot.sh can be found at [1]

[1] https://wiki.yoctoproject.org/wiki/MortyBuildstats


The following changes since commit dc8508f609974cc99606b9042bfa7f870ce80228:

  build-applance-image: Fix to use the release branch for morty (2016-10-26 11:11:10 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lsandov1/buildstats-plot
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lsandov1/buildstats-plot

Leonardo Sandoval (3):
  buildstats: Place 'Elapsed Time' stat into a single line
  scripts: Specify the stats to take into account
  bb-perf: plot histograms base on buildstats data

 meta/classes/buildstats.bbclass            |   4 +-
 scripts/contrib/bb-perf/buildstats-plot.sh | 157 +++++++++++++++++++++++++++++
 scripts/contrib/bb-perf/buildstats.sh      |  99 ++++++++++++++----
 3 files changed, 241 insertions(+), 19 deletions(-)
 create mode 100755 scripts/contrib/bb-perf/buildstats-plot.sh

-- 
2.1.4


