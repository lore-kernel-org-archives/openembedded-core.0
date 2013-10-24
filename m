Return-Path: <tom.zanussi@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 79DF66D348
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 13:11:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Oct 2013 06:11:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="397966247"
Received: from unknown (HELO localhost) ([10.255.14.253])
	by orsmga001.jf.intel.com with ESMTP; 24 Oct 2013 06:11:41 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2013 08:11:39 -0500
Message-Id: <cover.1382620128.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/1] wic fix to remove getenforce check
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
X-List-Received-Date: Thu, 24 Oct 2013 13:11:40 -0000

Found when testing on OpenSuse, this time.

The following changes since commit 754e8768b69acba89bd6c3ba5dbe55b9df4d8083:

  base.bbclass: fix nondeterministic PACKAGECONFIG processing order (2013-10-24 08:38:27 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/wic-fixes-4
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/wic-fixes-4

Tom Zanussi (1):
  wic: Remove selinux_check()

 scripts/lib/mic/conf.py | 4 ----
 1 file changed, 4 deletions(-)

-- 
1.8.3.1


