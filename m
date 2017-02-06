Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 7B9F460721
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 10:04:44 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 06 Feb 2017 02:04:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,341,1477983600"; d="scan'208";a="1103590790"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 06 Feb 2017 02:04:45 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 2868B6A4080;
	Mon,  6 Feb 2017 02:03:43 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2017 12:04:39 +0200
Message-Id: <cover.1486375248.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/3] Add some missing pkgconfig inherits
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
X-List-Received-Date: Mon, 06 Feb 2017 10:04:45 -0000

Found based on Martins 'State of bitbake world'. These don't always
come up because host pkg-config may give reasonable looking results.


Thanks,
  Jussi


The following changes since commit c62908e6a3ecd4d3cde2576f226d669a8299298d:

  gcc-6: Sync gcc stddef.h with musl stddef.h (2017-02-05 09:22:18 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/missing-pkgconfigs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/missing-pkgconfigs

Jussi Kukkonen (3):
  pong-clock: Add missing 'inherit pkgconfig'
  latencytop: Add missing 'inherit pkgconfig'
  qemu: Add missing 'inherit pkgconfig'

 meta/recipes-devtools/qemu/qemu.inc                | 2 +-
 meta/recipes-graphics/pong-clock/pong-clock_1.0.bb | 2 +-
 meta/recipes-kernel/latencytop/latencytop_0.5.bb   | 2 ++
 3 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.1.4


