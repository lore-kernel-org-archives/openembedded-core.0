Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 40E526F4EB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 17:09:29 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Mar 2014 09:09:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,601,1389772800"; d="scan'208";a="493589984"
Received: from unknown (HELO localhost) ([10.255.13.79])
	by fmsmga002.fm.intel.com with ESMTP; 06 Mar 2014 09:09:30 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Mar 2014 11:09:27 -0600
Message-Id: <cover.1394124934.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/6] lttng update (add 2.4.0)
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
X-List-Received-Date: Thu, 06 Mar 2014 17:09:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This adds lttng 2.4.0, which addresses build failures with
linux-yocto-dev, but still works with 3.10.

Tested with qemux86 and both linux-yocto and linux-yocto-dev.

Note that this disables lttng for arm, due to a problem with
lttng-modules and gcc-4.8.x (this is also a problem for lttng 2.3.x).

The following changes since commit f03955041d0e44d377ca1c4def630982f24f1e8b:

  Revert "ncurses: use ln -r to generate relative symlink" (2014-03-03 15:55:27 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/lttng-2.4.0-update
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/lttng-2.4.0-update

Tom Zanussi (6):
  lttng-modules: Add version 2.4.0
  lttng-tools: Add version 2.4.0
  lttng-ust: Add version 2.4.0
  lttng-modules: Exclude arm
  lttng-modules: Fix 3.14 bio tracepoints
  lttng-ust: Disable doc/examples in the build

 .../packagegroup-core-tools-profile.bb             |   4 +
 .../lttng/lttng-modules/bio-bvec-iter.patch        | 156 +++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb   |  39 ++++++
 .../lttng/lttng-tools/runtest-2.4.0.patch          |  27 ++++
 meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb     |  59 ++++++++
 .../lttng-ust/lttng-ust-doc-examples-disable.patch |  18 +++
 meta/recipes-kernel/lttng/lttng-ust_2.4.0.bb       |  32 +++++
 7 files changed, 335 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/bio-bvec-iter.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules_2.4.0.bb
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/runtest-2.4.0.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools_2.4.0.bb
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust/lttng-ust-doc-examples-disable.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust_2.4.0.bb

-- 
1.8.3.1


