Return-Path: <tom.zanussi@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 08F616BA1B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 05:24:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2013 22:24:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,965,1367996400"; d="scan'208";a="392495838"
Received: from unknown (HELO localhost) ([10.255.15.83])
	by fmsmga002.fm.intel.com with ESMTP; 26 Aug 2013 22:24:28 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2013 00:24:26 -0500
Message-Id: <cover.1377580874.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/1] lttng-modules: 3.10 compile fix
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
X-List-Received-Date: Tue, 27 Aug 2013 05:24:41 -0000

This updates lttng-modules to v2.2.1, which has a fix for a printk instrumentation
compile error seen on master-under-test.

This gets rid of the compile error, but no testing has been done - that will have
to come after the other rest of lttng has also been updated.

The following changes since commit 4ccb62aafe6f32ce224b71484767302d4d84a891:

  documentation: Replace atom-pc with genericx86 in the manuals (2013-08-26 15:13:47 -0700)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/lttng-modules-3.10-compile-fix
  http://git.yoctoproject.org/cgit.cgi//log/?h=tzanussi/lttng-modules-3.10-compile-fix

Tom Zanussi (1):
  lttng-modules: Update to 2.2.1 based release

 meta/recipes-kernel/lttng/lttng-modules_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.11.4


