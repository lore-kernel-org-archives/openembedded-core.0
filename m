Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 7009365DDE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Apr 2014 16:40:37 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Apr 2014 09:40:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,842,1389772800"; d="scan'208";a="417873037"
Received: from pmeel-ivm.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.171])
	by azsmga001.ch.intel.com with ESMTP; 11 Apr 2014 09:40:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Apr 2014 17:40:31 +0100
Message-Id: <cover.1397234393.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH 0/1] Fix for failed builds when using Toaster
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
X-List-Received-Date: Fri, 11 Apr 2014 16:40:38 -0000

The following changes since commit 20625df0f88b1948bfc05be0d2cbdaa201c3b2f0:

  linux-yocto/3.10: intel BSP configuration updates (2014-04-10 17:33:54 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/toaster-pkgdata
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/toaster-pkgdata

Alexandru DAMIAN (1):
  toaster.bbclass: do not fail on non-existent files

 meta/classes/toaster.bbclass | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

-- 
1.9.0


