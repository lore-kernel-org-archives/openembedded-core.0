Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 396A7719DB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 02:31:06 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 14 Nov 2016 18:31:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,640,1473145200"; d="scan'208";a="901427329"
Received: from pequod.jf.intel.com ([10.7.201.50])
	by orsmga003.jf.intel.com with ESMTP; 14 Nov 2016 18:31:08 -0800
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Nov 2016 18:30:10 -0800
Message-Id: <20161115023011.85782-1-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH V3] devshell: list commands when throwing NoSupportedTerminals
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
X-List-Received-Date: Tue, 15 Nov 2016 02:31:07 -0000

Changes since V2:
add yocto bug number

Stephano Cetola (1):
  devshell: list commands when throwing NoSupportedTerminals

 meta/classes/terminal.bbclass |  8 ++++++--
 meta/lib/oe/terminal.py       | 13 +++++++++++--
 2 files changed, 17 insertions(+), 4 deletions(-)

-- 
2.10.2


