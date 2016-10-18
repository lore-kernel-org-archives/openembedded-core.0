Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 70442719BD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 02:51:41 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 17 Oct 2016 19:51:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,359,1473145200"; d="scan'208";a="20627589"
Received: from ssethurx-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.157.103])
	by fmsmga005.fm.intel.com with ESMTP; 17 Oct 2016 19:51:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Oct 2016 15:51:15 +1300
Message-Id: <cover.1476759034.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/1] devtool: runqemu: work around runqemu script path assumption
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
X-List-Received-Date: Tue, 18 Oct 2016 02:51:41 -0000

The following changes since commit 327e4bf5a84d5b49ccc65927df622c9ef6302d55:

  build-appliance-image: Update to master head revision (2016-10-15 13:22:16 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/esdk-runqemu-path
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/esdk-runqemu-path

Paul Eggleton (1):
  devtool: runqemu: work around runqemu script path assumption

 scripts/lib/devtool/runqemu.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
2.5.5


