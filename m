Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TYKTC-0007EM-3X
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 18:40:18 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 13 Nov 2012 09:26:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,768,1344236400"; d="scan'208";a="167856032"
Received: from unknown (HELO localhost) ([10.255.12.144])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Nov 2012 09:26:21 -0800
From: tom.zanussi@intel.com
To: ross.burton@intel.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2012 11:26:16 -0600
Message-Id: <cover.1352826909.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.11.4
Subject: [PATCH 0/3] lttng updates for danny-next
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
X-List-Received-Date: Tue, 13 Nov 2012 17:40:18 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

These are the lttng fixes that didn't get pulled into danny (but
are now in master), so I'm resubmitting them for danny-next.

Tested on crownbay.

Please pull into danny-next.

The following changes since commit 27af23e65f63b41962a7cfddba9e9372d5212396:

  documentation: yocto-project-qs - Final changes before the 1.3 lockdown (2012-10-23 00:03:17 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/danny-next-lttng-fixes
  http://git.yoctoproject.org/cgit.cgi//log/?h=tzanussi/danny-next-lttng-fixes

Christopher Larson (1):
  lttng-2.0: fix srcrev/pv to match the recipe filenames

Tom Zanussi (2):
  packagegroup-core-tools-profile: replace 'legacy' lttng with lttng
    2.0
  lttng-modules: remove unused lttng-syscalls patch

 .../packagegroup-core-tools-profile.bb             | 25 ++++++++++---
 ...ls-protect-is_compat_task-from-redefiniti.patch | 41 ----------------------
 .../lttng-2.0/lttng-modules_2.0.5.bb               |  7 ++--
 meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb |  4 +--
 meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb  |  4 +--
 5 files changed, 28 insertions(+), 53 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch

-- 
1.7.11.4



