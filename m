Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5C66265C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 16:53:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 13 Oct 2015 09:53:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,678,1437462000"; d="scan'208";a="810083381"
Received: from porlows1-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.4.182])
	by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2015 09:53:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Oct 2015 17:53:02 +0100
Message-Id: <cover.1444755142.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/4] Extensible SDK fixes
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
X-List-Received-Date: Tue, 13 Oct 2015 16:53:20 -0000

The following changes since commit e42d8eff9eed7d1454b4f331d96dcee6dea232df:

  bash: Disable custom memory allocator (2015-10-12 14:35:42 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/extsdkfixes2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/extsdkfixes2

Paul Eggleton (4):
  classes/populate_sdk_ext: consistent indentation
  classes/populate_sdk_ext: prevent do_rootfs from executing
  classes/populate_sdk_ext: add note to env setup script
  toolchain-shar-extract.sh: print full-length title underline

 meta/classes/populate_sdk_ext.bbclass | 15 ++++++++++-----
 meta/files/ext-sdk-prepare.sh         | 20 ++++++++++++++++++++
 meta/files/toolchain-shar-extract.sh  |  5 +++--
 3 files changed, 33 insertions(+), 7 deletions(-)
 create mode 100644 meta/files/ext-sdk-prepare.sh

-- 
2.1.0


