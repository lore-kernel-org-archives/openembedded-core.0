Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6D31E705DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 21:16:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Jul 2014 14:10:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,673,1400050800"; d="scan'208";a="544425844"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga001.jf.intel.com with ESMTP; 16 Jul 2014 14:16:13 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 14:15:56 +0000
Message-Id: <cover.1405520111.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 2.0.0
Subject: [PATCH 0/8] mkefidisk updates and gummiboot support
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
X-List-Received-Date: Wed, 16 Jul 2014 21:16:17 -0000

mkefidisk was in need of some improvements. This adds gummiboot support, but
also adds improved logging, output formatting, robustness, error trapping,
cleanup, and verbosity control.

The following changes since commit 03c6fd0caab0ea8dcc2e0c3ab827a287a4f36910:

  ltp: use "foreign" automake strictness (2014-07-16 10:31:17 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib dvhart/mkefidisk
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=dvhart/mkefidisk

Darren Hart (8):
  mkefidisk.sh: Use all caps for volume names
  mkefidisk.sh: Add mount error checking
  mkefidisk.sh: Add gummiboot support
  mkefidisk.sh: Copy the EFI dir recursively
  mkefidisk.sh: Improve logging
  mkefidisk.sh: Add die() and cleanup() routines
  mkefidisk.sh: Make the rootfs copy the last step
  mkefidisk.sh: Reduce output and add verbose flag

 scripts/contrib/mkefidisk.sh | 306 ++++++++++++++++++++++++++++---------------
 1 file changed, 204 insertions(+), 102 deletions(-)

-- 
2.0.0


