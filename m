Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1UBU6j-00050U-3U
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 18:51:21 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 01 Mar 2013 09:34:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,762,1355126400"; d="scan'208";a="293649864"
Received: from unknown (HELO localhost) ([10.255.12.240])
	by fmsmga001.fm.intel.com with ESMTP; 01 Mar 2013 09:34:30 -0800
From: tom.zanussi@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Mar 2013 11:34:53 -0600
Message-Id: <cover.1362158882.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/3]
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
X-List-Received-Date: Fri, 01 Mar 2013 17:51:35 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

This patchset contains a couple of things:

  - a sysprof upgrade (YOCTO #3448)
  - a fix for YOCTO #3951, which is for perf, but I found and fixed a
    similar problem for systemtap while doing the fix for perf.  In
    any case, I'm now able to build a minimal image with tools-profile.

The following changes since commit 8264863ea0674f6cb105f5f7301861408fdc409b:

  Add KERNEL_EXTRA_ARGS parameter (2013-03-01 14:57:52 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/minimal-and-sysprof-update-v0
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/minimal-and-sysprof-update-v0

Tom Zanussi (3):
  sysprof: upgrade to 1.2.0
  perf: add bash dependency
  systemtap: add python and bash dependencies

 meta/recipes-kernel/perf/perf_3.4.bb               |  2 +-
 ...PowerPC-checks-for-__NR_perf_counter_open.patch | 35 ----------------------
 meta/recipes-kernel/sysprof/sysprof_git.bb         |  6 ++--
 meta/recipes-kernel/systemtap/systemtap_git.bb     |  4 +++
 4 files changed, 7 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-kernel/sysprof/files/0001-Fix-PowerPC-checks-for-__NR_perf_counter_open.patch

-- 
1.7.11.4



