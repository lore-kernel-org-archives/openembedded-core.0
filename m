Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6F7A560765
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 22:51:24 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP; 29 Sep 2016 15:51:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,417,1473145200"; d="scan'208";a="14796092"
Received: from pequod.jf.intel.com ([10.7.201.50])
	by orsmga005.jf.intel.com with ESMTP; 29 Sep 2016 15:51:25 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2016 15:50:22 -0700
Message-Id: <20160929225024.27698-1-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.10.0
Subject: [PATCH v2 0/2] subprocess: cleanup subprocess calls
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
X-List-Received-Date: Thu, 29 Sep 2016 22:51:25 -0000

This is the beginning of an effort to move toward a unified way of
using the subprocess module. The end goal is somday create a fork
of the subprocess.run command intro'd in python 3.5.

The biggest hurdle in these efforts is in testing some of the more
obscure code paths that are touched when changing these subprocess
calls. With more time, many of the Popen calls that still exist
could be moved to either check_output or sub.run.

Stephano Cetola (2):
  subprocess: remove strings and migrate to direct arrays
  subprocess: remove Popen in favor of check_output

 meta/classes/buildstats.bbclass |  6 ++++-
 meta/classes/spdx.bbclass       | 11 ++++----
 meta/lib/oe/distro_check.py     |  2 +-
 meta/lib/oe/package.py          | 13 ++++-----
 meta/lib/oe/package_manager.py  | 59 ++++++++++++++++++++---------------------
 5 files changed, 47 insertions(+), 44 deletions(-)

-- 
2.10.0


