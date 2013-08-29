Return-Path: <tom.zanussi@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id ED0C26BC98
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 13:37:01 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 29 Aug 2013 06:37:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,983,1367996400"; d="scan'208";a="388286839"
Received: from unknown (HELO localhost) ([10.255.15.104])
	by fmsmga001.fm.intel.com with ESMTP; 29 Aug 2013 06:37:01 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 08:36:59 -0500
Message-Id: <cover.1377782855.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/2] lttng: update remaining recipes
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
X-List-Received-Date: Thu, 29 Aug 2013 13:37:02 -0000

lttng-modules was updated a couple days ago to fix a build problem
with the new kernel; this patchset adds the remaining updates for
the other recipes for the corresponding lttng "Cuda" release.

Tested on crownbay hardware using the examples described in the Yocto
Tracing and Profiling Manual:

  http://www.yoctoproject.org/docs/latest/profile-manual/profile-manual.html#lttng-linux-trace-toolkit-next-generation

The following changes since commit 5745e45b18e5099e94b4d5a73bc97dc6d4cdc91f:

  buildtools-tarball: Add python-pkgutil (2013-08-29 00:23:20 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/lttng-remainder-update
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/lttng-remainder-update

Tom Zanussi (2):
  lttng-tools: Update to version 2.2.3
  lttng-ust: Update to version 2.2.1

 .../{lttng-tools_2.2.0.bb => lttng-tools_2.2.3.bb} |  4 +--
 .../lttng-ust/build-Fix-out-of-tree-build.patch    | 28 --------------------
 .../lttng-ust/depends-liblttng-ust-tracepoin.patch | 30 ----------------------
 .../{lttng-ust_2.2.0.bb => lttng-ust_2.2.1.bb}     |  6 ++---
 4 files changed, 4 insertions(+), 64 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.2.0.bb => lttng-tools_2.2.3.bb} (93%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust/build-Fix-out-of-tree-build.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust/depends-liblttng-ust-tracepoin.patch
 rename meta/recipes-kernel/lttng/{lttng-ust_2.2.0.bb => lttng-ust_2.2.1.bb} (84%)

-- 
1.7.11.4


