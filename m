Return-Path: <tom.zanussi@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5CA006013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 17:10:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 07 Jul 2016 10:10:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,324,1464678000"; d="scan'208";a="1012639377"
Received: from tzanussi-mobl.amr.corp.intel.com (HELO localhost)
	([10.254.182.227])
	by orsmga002.jf.intel.com with ESMTP; 07 Jul 2016 10:10:42 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2016 12:10:39 -0500
Message-Id: <cover.1467911314.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/1][krogoth] Fix systemtap
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
X-List-Received-Date: Thu, 07 Jul 2016 17:10:42 -0000

This patch is required for systemtap to work with krogoth and the 4.4 kernel.

The following changes since commit 98c57bb512ea6790db8604fcf0b88c81651d2ab4:

  build-appliance-image: Update to krogoth head revision (2016-07-06 17:28:04 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib tzanussi/systemtap-memory-flags-krogoth
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/systemtap-memory-flags-krogoth

Tom Zanussi (1):
  systemtap: Add missing memory flag to fix stap module compilation

 ...48-by-updating-systemtap-s-memory-flag-us.patch | 73 ++++++++++++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.inc    |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-Fix-BZ1285348-by-updating-systemtap-s-memory-flag-us.patch

-- 
1.9.3


