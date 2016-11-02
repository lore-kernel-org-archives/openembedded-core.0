Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0DA876069C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 02:31:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 01 Nov 2016 19:31:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,582,1473145200"; d="scan'208";a="1079289677"
Received: from kgonza2-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.158.24])
	by fmsmga002.fm.intel.com with ESMTP; 01 Nov 2016 19:31:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Nov 2016 15:31:03 +1300
Message-Id: <cover.1478053841.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/2] A couple of fixes relating to TEMPLATECONF
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
X-List-Received-Date: Wed, 02 Nov 2016 02:31:54 -0000

The following changes since commit 98c6ebf1e05158c689e01b785d32757847cdb10c:

  oeqa/selftest/kernel.py: Add new file destined for kernel related tests (2016-11-01 10:05:40 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/templateconf
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/templateconf

Paul Eggleton (2):
  oe-setup-builddir: fix TEMPLATECONF error message
  classes/populate_sdk_ext: prevent invalid TEMPLATECONF entering eSDK

 meta/classes/populate_sdk_ext.bbclass | 6 +++++-
 scripts/oe-setup-builddir             | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.5.5


