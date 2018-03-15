Return-Path: <amanda.r.brindle@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id D0996788E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 21:06:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Mar 2018 14:06:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,312,1517904000"; d="scan'208";a="25051946"
Received: from aurora.jf.intel.com ([10.7.198.68])
	by orsmga007.jf.intel.com with ESMTP; 15 Mar 2018 14:06:44 -0700
From: Amanda Brindle <amanda.r.brindle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2018 14:04:07 -0700
Message-Id: <cover.1521142023.git.amanda.r.brindle@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: Amanda Brindle <amanda.r.brindle@intel.com>, stephano.cetola@intel.com
Subject: [PATCH 0/1] buildhistory_analysis.py: Check if RPROVIDES changed order
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
X-List-Received-Date: Thu, 15 Mar 2018 21:06:49 -0000

The following changes since commit 0fd6d0dd0041929d60111868ca3575d9d9bf9ac3:

  linux-yocto/4.12: backport bugfixes for x86 (2018-03-15 06:27:20 -0700)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib abrindle/buildhistory-diff4
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=abrindle/buildhistory-diff4

Amanda Brindle (1):
  buildhistory_analysis.py: Check if RPROVIDES changed order

 meta/lib/oe/buildhistory_analysis.py | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

-- 
2.7.4


