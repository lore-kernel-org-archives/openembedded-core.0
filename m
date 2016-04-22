Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 003AD65CB5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 13:26:33 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 22 Apr 2016 06:26:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,517,1455004800"; d="scan'208";a="89994665"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga004.fm.intel.com with ESMTP; 22 Apr 2016 06:26:33 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Apr 2016 16:26:28 +0300
Message-Id: <cover.1461329608.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] Fix more potential build failures
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
X-List-Received-Date: Fri, 22 Apr 2016 13:26:35 -0000

Decided to run a build/cleansstate/wipe-sysroot/re-build cycle for
all recipes in world: Only found the intltool failures Ross already
sent patches for and these two.

 Jussi

The following changes since commit 6c1c01392d91f512e2949ad1d57a75a8077478ba:

  build-appliance-image: Update to krogoth head revision (2016-04-19 21:26:33 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/more-build-fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/more-build-fixes

Jussi Kukkonen (2):
  babeltrace: Let autotools.bbclass run autoreconf
  gcc-sanitizers: Depend on target gcc

 meta/recipes-devtools/gcc/gcc-sanitizers.inc  | 2 +-
 meta/recipes-kernel/lttng/babeltrace_1.3.1.bb | 4 ----
 2 files changed, 1 insertion(+), 5 deletions(-)

-- 
2.1.4


