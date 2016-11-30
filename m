Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1365F607A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 04:46:26 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 29 Nov 2016 20:46:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,720,1473145200"; d="scan'208";a="907029223"
Received: from pequod.jf.intel.com ([10.7.201.50])
	by orsmga003.jf.intel.com with ESMTP; 29 Nov 2016 20:46:27 -0800
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2016 20:45:32 -0800
Message-Id: <20161130044533.128338-1-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH V5] subprocess cleanup
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
X-List-Received-Date: Wed, 30 Nov 2016 04:46:27 -0000

changed since V4:
Removed single quotes from the --show-format option on smart query.
The quote was causing the arch search to fail in the following for
loop.

Stephano Cetola (1):
  package_manager: remove strings and migrate to direct arrays

 meta/lib/oe/package.py         |  13 +--
 meta/lib/oe/package_manager.py | 229 ++++++++++++++++++++---------------------
 2 files changed, 118 insertions(+), 124 deletions(-)

-- 
2.10.2


