Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id D036A70100
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 20:05:50 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 15 Nov 2016 12:05:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,496,1473145200"; d="scan'208";a="31635467"
Received: from nnasirin-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.185.211])
	by orsmga005.jf.intel.com with ESMTP; 15 Nov 2016 12:05:49 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2016 09:05:44 +1300
Message-Id: <cover.1479240326.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/1] devtool: modify: support recipes with only local files as source
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
X-List-Received-Date: Tue, 15 Nov 2016 20:05:51 -0000

The following changes since commit a675b2c89e477af088faee9b3be96eae19a85f0b:

  sanity.bbclass: fix logging of an error (2016-11-15 15:18:50 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool-localfiles
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool-localfiles

Paul Eggleton (1):
  devtool: modify: support recipes with only local files as source

 meta/lib/oeqa/selftest/devtool.py |  2 ++
 scripts/lib/devtool/standard.py   | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+)

-- 
2.5.5


