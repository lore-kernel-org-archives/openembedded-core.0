Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1UAikq-0005O0-ND
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 16:18:14 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Feb 2013 07:00:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,747,1355126400"; d="scan'208";a="268543202"
Received: from unknown (HELO localhost) ([10.255.12.236])
	by orsmga001.jf.intel.com with ESMTP; 27 Feb 2013 07:00:50 -0800
From: tom.zanussi@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2013 09:00:48 -0600
Message-Id: <cover.1361976853.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/3] add libaudit and enable 'perf trace'
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
X-List-Received-Date: Wed, 27 Feb 2013 15:18:17 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

'perf-trace' is a new perf subcommand available in the 3.8 kernel -
this patchset enables it.  'perf trace' requires libaudit, which
is added as a new recipe.

Build-tested on all arches and run-tested on all that would boot
at the time, including real hardware such as crownbay.  Build-tested
with 3.4 kernel as well.
  
The following changes since commit d7b248e715d99766bf8602ff9f038f8b0afa5e78:

  augeas: change SRC_URI (2013-02-26 08:02:29 -0800)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/perf-trace-v1
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/perf-trace-v1

Tom Zanussi (3):
  libaudit: new package
  perf: add perf-trace feature
  perf: enable perf-trace feature

 meta/recipes-kernel/perf/perf.inc                  |   3 +-
 meta/recipes-kernel/perf/perf_3.4.bb               |   7 +-
 .../libaudit/libaudit/build-lib-only.patch         |  33 ++
 .../libaudit/libaudit/fix-host-gen.patch           | 461 +++++++++++++++++++++
 meta/recipes-support/libaudit/libaudit_2.2.2.bb    |  25 ++
 5 files changed, 526 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/libaudit/libaudit/build-lib-only.patch
 create mode 100644 meta/recipes-support/libaudit/libaudit/fix-host-gen.patch
 create mode 100644 meta/recipes-support/libaudit/libaudit_2.2.2.bb

-- 
1.7.11.4



