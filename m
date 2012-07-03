Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1Sm7jG-0003as-Si
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 20:21:39 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jul 2012 11:10:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="188062959"
Received: from unknown (HELO localhost) ([10.255.12.166])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jul 2012 11:10:35 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 13:10:33 -0500
Message-Id: <cover.1341338051.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/9] perf: enable Perl and Python bindings, and perf TUI
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
X-List-Received-Date: Tue, 03 Jul 2012 18:21:39 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

This patchset enables the Perl and Python bindings for perf, as well as
the perf TUI (text-based UI).

These can be separately enabled on a machine basis by adding
'perf-scripting' and/or 'perf-tui' to the machine's MACHINE_FEATURES.
The default is to completely disable all scripting and TUI features.

There are also a couple patches that fix other problems noticed along
the way.

These changes need corresponding changes made to linux-yocto and posted
separately on the yocto and linux-yocto mailing lists.

This patchset has been build- and run-tested on the following machines:

qemux86
qemux86-64
qemuarm
sugarbay
crownbay

The following changes since commit 644ad4bf1e30fcee4b9d5abb819046d1f2193d27:
  Scott Rifenbark (1):
        documentation/bsp-guide/bsp.xml: Yocto term paring

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/perf-scripting
  http://git.yoctoproject.org/cgit.cgi//log/?h=tzanussi/perf-scripting

Tom Zanussi (9):
  perl: keep original libperl location
  perl: add @STAGINGDIR@ for config.sh substitions
  perl: use @STAGINGDIR@ in config.sh
  perf: enable Python bindings
  perf: enable Perl binding
  perf: add libexec/perf-core and contents
  perf: add perf-scripting MACHINE_FEATURE
  qemumachines: make MACHINE_FEATURES append follow qemu.inc include
  perf: add perf-tui MACHINE_FEATURE

 meta/conf/machine/qemux86-64.conf                |    4 +-
 meta/conf/machine/qemux86.conf                   |    4 +-
 meta/recipes-devtools/perl/perl-5.14.2/config.sh |    2 +-
 meta/recipes-devtools/perl/perl_5.14.2.bb        |    4 ++-
 meta/recipes-kernel/perf/perf_3.4.bb             |   36 ++++++++++++++++++++--
 5 files changed, 41 insertions(+), 9 deletions(-)



