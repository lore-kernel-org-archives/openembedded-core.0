Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CAA396FF76
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 22:15:03 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 06 Jan 2016 14:15:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,530,1444719600"; d="scan'208";a="721607259"
Received: from bitbang.jf.intel.com ([10.7.199.73])
	by orsmga003.jf.intel.com with ESMTP; 06 Jan 2016 14:15:04 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jan 2016 14:15:00 -0800
Message-Id: <cover.1452118391.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/2] Extensible SDK size reduction
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
X-List-Received-Date: Wed, 06 Jan 2016 22:15:06 -0000

This removes some unneeded items from the extensible sdk to reduce size by
~300MB.

The following changes since commit f8185ff9f8ac697733b41f023cb3a4b98b2f823f:

  bitbake: ast: Add filename/lineno to mapped functions (2016-01-06 15:27:35 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib rewitt/extsdksize
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rewitt/extsdksize

Randy Witt (2):
  copy_buildsystem.py: Allow substring matches for excluded_targets
  populate_sdk_ext: Don't put nativesdk and crosssdk items in ext sdk

 meta/classes/populate_sdk_ext.bbclass | 6 ++++++
 meta/lib/oe/copy_buildsystem.py       | 7 +++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.5.0


