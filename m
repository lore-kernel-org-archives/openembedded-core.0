Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id F300B605B3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 03:22:59 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 03 Mar 2016 19:23:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,534,1449561600"; d="scan'208";a="757852544"
Received: from nikhilbh-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.139.241])
	by orsmga003.jf.intel.com with ESMTP; 03 Mar 2016 19:22:58 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Mar 2016 16:22:49 +1300
Message-Id: <cover.1457061745.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/4] Hob collateral removal for OE-Core
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
X-List-Received-Date: Fri, 04 Mar 2016 03:23:00 -0000

Drop a few things relating to Hob from OE-Core.

There's still a remaining reference in the build appliance; I've filed a
bug to track that:

   https://bugzilla.yoctoproject.org/show_bug.cgi?id=9210


The following changes since commit 092984669d8590627cfb188a0aa00244e22c4671:

  e2fsprogs: do not enable non-stable features by default (2016-03-03 10:48:46 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/hob-remove-oecore
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/hob-remove-oecore

Paul Eggleton (4):
  bblayers.conf.sample: remove BBLAYERS_NON_REMOVABLE
  conf/documentation.conf: remove BBLAYERS_NON_REMOVABLE
  classes/packageinfo: remove
  scripts/hob: drop

 meta/classes/packageinfo.bbclass | 22 ----------------------
 meta/conf/bblayers.conf.sample   |  5 -----
 meta/conf/documentation.conf     |  1 -
 scripts/hob                      |  6 ------
 4 files changed, 34 deletions(-)
 delete mode 100644 meta/classes/packageinfo.bbclass
 delete mode 100755 scripts/hob

-- 
2.5.0


