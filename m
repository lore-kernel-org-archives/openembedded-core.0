Return-Path: <tom.zanussi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 43BF56F604
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 04:26:21 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Mar 2014 20:21:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,605,1389772800"; d="scan'208";a="495612663"
Received: from unknown (HELO localhost) ([10.255.13.79])
	by orsmga002.jf.intel.com with ESMTP; 06 Mar 2014 20:26:21 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Mar 2014 22:26:17 -0600
Message-Id: <cover.1394165774.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH v2 0/7] lttng update (add 2.4.0)
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
X-List-Received-Date: Fri, 07 Mar 2014 04:26:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This adds lttng 2.4.0, which addresses build failures with
linux-yocto-dev, but still works with 3.10.

Tested with qemux86 and both linux-yocto and linux-yocto-dev.

Note that this disables lttng for arm, due to a problem with
lttng-modules and gcc-4.8.x (this is also a problem for lttng 2.3.x).

v2 changes:

  Modified to reflect comments from Phil Blundell.  Though
  lttng-modules may be broken for arm, it doesn't mean lttng-ust isn't
  still useful on its own.  So lttng-ust was added back for arm, as
  was lttng-tools, needed at least to view the lttng-ust traces.

  Apparently gcc doesn't like lttng-tools on arm either, for
  completely different reasons; fixing the lttng-tools-prompted
  internal compiler error is fixable with a patch for gcc, which is
  added to the patchset.

The following changes since commit f03955041d0e44d377ca1c4def630982f24f1e8b:

  Revert "ncurses: use ln -r to generate relative symlink" (2014-03-03 15:55:27 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/lttng-2.4.0-update-v2
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/lttng-2.4.0-update-v2

Tom Zanussi (7):
  lttng-modules: Add version 2.4.0
  lttng-tools: Add version 2.4.0
  lttng-ust: Add version 2.4.0
  lttng-modules: Exclude arm
  lttng-modules: Fix 3.14 bio tracepoints
  lttng-ust: Disable doc/examples in the build
  gcc: Add upstream fix for gcc bug 58595

 .../packagegroup-core-tools-profile.bb             |   1 +
 meta/recipes-devtools/gcc/gcc-4.8.inc              |   3 +-
 .../gcc/gcc-4.8/0050-PR-target-58595.patch         | 132 +++++++++++++++++
 .../lttng/lttng-modules/bio-bvec-iter.patch        | 156 +++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb   |  38 +++++
 .../lttng/lttng-tools/runtest-2.4.0.patch          |  27 ++++
 meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb     |  59 ++++++++
 .../lttng-ust/lttng-ust-doc-examples-disable.patch |  18 +++
 meta/recipes-kernel/lttng/lttng-ust_2.4.0.bb       |  32 +++++
 9 files changed, 465 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0050-PR-target-58595.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/bio-bvec-iter.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/runtest-2.4.0.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust/lttng-ust-doc-examples-disable.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust_2.4.0.bb

-- 
1.8.3.1


