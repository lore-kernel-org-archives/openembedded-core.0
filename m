Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1UHosz-0007CE-Fd
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 06:14:59 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 Mar 2013 21:56:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,870,1355126400"; d="scan'208";a="281384044"
Received: from unknown (HELO localhost) ([10.255.13.116])
	by orsmga001.jf.intel.com with ESMTP; 18 Mar 2013 21:58:06 -0700
From: tom.zanussi@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Mar 2013 23:58:04 -0500
Message-Id: <cover.1363668929.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/1] perf: set PKGV to matching kernel version
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
X-List-Received-Date: Tue, 19 Mar 2013 05:15:14 -0000
X-List-Received-Date: Tue, 19 Mar 2013 05:15:14 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

This makes the perf packages use the kernel version they were built with
for their package version instead of the perf recipe version, which is
now 1.0 with the rename.

The following changes since commit 87cfde2559daec564731c5c25df04eec27eaf7d5:

  syslinux.bbclass: Add a default serial console option and real boot menu support (2013-03-18 21:42:24 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/perf-make-pkgv-match-kernel
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/perf-make-pkgv-match-kernel

Tom Zanussi (1):
  perf: make PKGV match kernel version

 meta/recipes-kernel/perf/perf.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
1.7.11.4



