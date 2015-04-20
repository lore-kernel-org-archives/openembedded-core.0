Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 40E7273D87
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 16:48:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 Apr 2015 09:47:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,610,1422950400"; d="scan'208";a="716384563"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.5.75])
	by orsmga002.jf.intel.com with ESMTP; 20 Apr 2015 09:47:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Apr 2015 17:47:04 +0100
Message-Id: <cover.1429548323.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/5] SDK-related fixes
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
X-List-Received-Date: Mon, 20 Apr 2015 16:48:02 -0000

A bugfix and some minor improvements for the extensible SDK (the last
two apply also to the standard SDK).


The following changes since commit 2e3c8fd70694dcf9553b5e4c50a57b617a9130b6:

  image.bbclass: Allow to remove do_rootfs -> virtual/kernel:do_packagedata dependency (2015-04-20 15:29:06 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/extsdkfixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/extsdkfixes

Paul Eggleton (5):
  devtool: force use of bash when running build within extensible SDK
  classes/populate_sdk_ext: disable network connectivity check
  classes/populate_sdk_ext: add warning against editing configuration
  classes/populate_sdk_base: Show title in SDK installer
  toolchain-shar-extract.sh: mention how to set up the SDK environment

 meta/classes/populate_sdk_base.bbclass       |  4 ++++
 meta/classes/populate_sdk_ext.bbclass        | 15 +++++++++++++++
 meta/files/toolchain-shar-extract.sh         |  5 +++++
 meta/recipes-core/meta/buildtools-tarball.bb |  2 ++
 scripts/lib/devtool/__init__.py              |  5 +++++
 5 files changed, 31 insertions(+)

-- 
2.1.0


