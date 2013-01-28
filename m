Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1Tzvua-0004oZ-Qc
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 22:06:41 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jan 2013 12:50:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,554,1355126400"; d="scan'208";a="283225573"
Received: from unknown (HELO localhost) ([10.255.12.52])
	by fmsmga002.fm.intel.com with ESMTP; 28 Jan 2013 12:50:56 -0800
From: tom.zanussi@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 14:50:54 -0600
Message-Id: <cover.1359405784.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/2] oprofile: enable 'operf' perf_events mode
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
X-List-Received-Date: Mon, 28 Jan 2013 21:06:42 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

This patchset fixes oprofile-0.9.8 so that it finds perf_events and
configures accordingly to enable 'operf' and not just 'legacy oprofile'

I've added a new section on operf to the Yocto Tracing and Profiling Guide'
(just the wiki version for now, until I can submit a patch for the official
Guide):

https://wiki.yoctoproject.org/wiki/Tracing_and_Profiling#operf

I've tested this on real hardware (x86 crownbay), and build-tested on the
other arches (powerpc didn't build due to YOCTO bug #3717, but that's not
a regression).

The following changes since commit cfb082961a6c9ac3d65738031c4071210529cd07:

  bitbake: build.py: Dump out performance data of individual tasks (2013-01-28 14:49:05 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/oprofile-operf-enable-v1
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/oprofile-operf-enable-v1

Tom Zanussi (2):
  oprofile: add kernel dependency
  oprofile: remove AX_KERNEL_VERSION from acinclude.m4

 meta/recipes-kernel/oprofile/oprofile.inc          |  2 +-
 meta/recipes-kernel/oprofile/oprofile/acinclude.m4 | 19 -------------------
 meta/recipes-kernel/oprofile/oprofile_0.9.8.bb     |  2 ++
 3 files changed, 3 insertions(+), 20 deletions(-)

-- 
1.7.11.4



