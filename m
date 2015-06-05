Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E0A9C75662
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 08:06:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 05 Jun 2015 01:06:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,557,1427785200"; d="scan'208";a="705772502"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 05 Jun 2015 01:06:51 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 138A36A4083;
	Fri,  5 Jun 2015 01:06:16 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jun 2015 09:13:05 +0300
Message-Id: <1433484789-304-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH 0/4] Code cleanup and refactoring
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
X-List-Received-Date: Fri, 05 Jun 2015 08:06:51 -0000

Hi,

This patchset includes cleanup and refactoring patches made
during implementation of partition UUID support. Without this
work I'd end up in duplicating a lot of code, so I decided to
clean it up a bit.

Please, review.

Ed Bartosh (4):
  wic: removed exec_cmd_quiet and exec_native_cmd_quiet
  wic: move checks to exec_native_cmd
  wic: replaced __run_parted with exec_native_cmd
  wic: pylinted partitionedfs.py

 .../lib/wic/kickstart/custom_commands/partition.py |  21 +----
 scripts/lib/wic/utils/oe/misc.py                   |  27 ++----
 scripts/lib/wic/utils/partitionedfs.py             | 105 +++++++++------------
 3 files changed, 54 insertions(+), 99 deletions(-)

--
EPlease, review.d

