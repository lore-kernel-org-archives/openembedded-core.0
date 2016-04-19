Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A0D3E60667
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 11:09:48 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 19 Apr 2016 04:09:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,506,1455004800"; d="scan'208";a="87888889"
Received: from sadnan1-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.175.36])
	by fmsmga004.fm.intel.com with ESMTP; 19 Apr 2016 04:09:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Apr 2016 23:09:10 +1200
Message-Id: <cover.1461063424.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/1] Fix for eSDK update interaction with uninative checksum changes
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
X-List-Received-Date: Tue, 19 Apr 2016 11:09:48 -0000

The following changes since commit e003ef038819c10f351bb8268b377626c95bb077:

  toasterconf.json: Update for krogoth release (2016-04-18 16:48:58 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/extsdk-uninative-update
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/extsdk-uninative-update

Paul Eggleton (1):
  devtool: sdk-update: fix handling of UNINATIVE_CHECKSUM changes

 scripts/lib/devtool/sdk.py | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

-- 
2.5.5


