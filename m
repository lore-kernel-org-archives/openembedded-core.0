Return-Path: <tom.zanussi@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B0D536D15E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 04:45:36 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Oct 2013 21:45:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,519,1378882800"; d="scan'208";a="418765547"
Received: from unknown (HELO localhost) ([10.255.15.248])
	by fmsmga002.fm.intel.com with ESMTP; 17 Oct 2013 21:45:37 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 23:45:35 -0500
Message-Id: <cover.1382071241.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/2] wic usability fixes
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
X-List-Received-Date: Fri, 18 Oct 2013 04:45:36 -0000

These fixes point out problems or avoid ugly backtraces when users
supply invalid input values.

The following changes since commit fd09f894b40dadb8bc8b267a26dbf52e22a53d66:

  wic: add pseudo to the populate-extfs step (2013-10-16 14:11:53 -0500)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/wic-fixes-2
  http://git.yoctoproject.org/cgit.cgi//log/?h=tzanussi/wic-fixes-2

Tom Zanussi (2):
  wic: Check for the existence/correctness of build artifacts
  wic: Initialize return values in find_artifacts()

 scripts/lib/image/engine.py |  2 ++
 scripts/wic                 | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+)

-- 
1.7.11.4


