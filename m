Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 580DC7017D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 03:24:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 31 Oct 2016 20:24:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,577,1473145200"; d="scan'208";a="1053317598"
Received: from mbi370x-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.185.81])
	by orsmga001.jf.intel.com with ESMTP; 31 Oct 2016 20:24:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2016 16:24:21 +1300
Message-Id: <cover.1477970643.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/2] A couple of SDK fixes
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
X-List-Received-Date: Tue, 01 Nov 2016 03:24:53 -0000

The following changes since commit b18fa5f2f2f46afc6fdc58f4d29679dea9c36c43:

  Remove LIC_FILES_CHKSUM from recipes without SRC_URI (2016-10-28 11:27:33 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/sdk-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/sdk-fixes

Paul Eggleton (2):
  classes/populate_sdk_base: fix usage of & character in SDK_TITLE
  classes/nativesdk: set SDK_OLDEST_KERNEL appropriately

 meta/classes/nativesdk.bbclass         | 2 ++
 meta/classes/populate_sdk_base.bbclass | 7 +------
 meta/conf/bitbake.conf                 | 5 +++++
 meta/conf/machine-sdk/i586.conf        | 1 +
 meta/conf/machine-sdk/i686.conf        | 1 +
 meta/conf/machine-sdk/x86_64.conf      | 1 +
 6 files changed, 11 insertions(+), 6 deletions(-)

-- 
2.5.5


