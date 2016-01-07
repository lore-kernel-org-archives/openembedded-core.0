Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7A8E660132
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 19:24:07 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 07 Jan 2016 11:24:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,534,1444719600"; d="scan'208";a="885911172"
Received: from bitbang.jf.intel.com ([10.7.199.73])
	by orsmga002.jf.intel.com with ESMTP; 07 Jan 2016 11:24:07 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 11:23:59 -0800
Message-Id: <cover.1452194521.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1452118391.git.randy.e.witt@linux.intel.com>
References: <cover.1452118391.git.randy.e.witt@linux.intel.com>
Subject: [PATCH v2 0/3] Extensible SDK size reduction
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
X-List-Received-Date: Thu, 07 Jan 2016 19:24:07 -0000

This removes some unneeded items from the extensible sdk to reduce size by
~300MB.

Includes an additional patch

The following changes since commit 0f3ad7c77aa0f8bb7641af1886e1420cdfa8419f:

  scripts/yocto-layer: Avoids duplication of "meta-" prefix (2016-01-07 13:52:21 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib rewitt/extsdksize
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rewitt/extsdksize

Randy Witt (3):
  populate_sdk_ext: Pass excluded_targets as a list to prune_lockedsigs
  copy_buildsystem.py: Allow substring matches for excluded_targets
  populate_sdk_ext: Don't put nativesdk and crosssdk items in ext sdk

 meta/classes/populate_sdk_ext.bbclass | 8 +++++++-
 meta/lib/oe/copy_buildsystem.py       | 7 +++++--
 2 files changed, 12 insertions(+), 3 deletions(-)

-- 
2.5.0


