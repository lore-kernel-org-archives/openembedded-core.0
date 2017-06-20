Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id D68986FFED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 16:17:20 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 20 Jun 2017 09:17:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,364,1493708400"; d="scan'208";a="115391992"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 20 Jun 2017 09:17:21 -0700
Received: from localhost.zpn.intel.com (unknown [10.219.4.140])
	by linux.intel.com (Postfix) with ESMTP id 52F48580333;
	Tue, 20 Jun 2017 09:17:21 -0700 (PDT)
From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Jun 2017 11:21:50 -0500
Message-Id: <cover.1497975577.git.humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 2.7.5
Subject: [PATCH v2 0/1] imagefeatures.py: Added testcase to track IMAGE_GEN_DEBUGFS
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
X-List-Received-Date: Tue, 20 Jun 2017 16:17:21 -0000

Patch to add a testcase for IMAGE_GEN_DEBUGFS variable. Checks if debug filesystem
was created.

The following changes since commit 9ea5a31776440abd6468f003c5e1905f079446d3:

  ovmf: fix secureboot PACKAGECONFIG + OpenSSL update (2017-06-16 10:58:23 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib humberto/ImageGenDebugfs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=humberto/ImageGenDebugfs

Humberto Ibarra (1):
  imagefeatures.py: Added testcase to track IMAGE_GEN_DEBUGFS

 meta/lib/oeqa/selftest/cases/imagefeatures.py | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

-- 
2.7.5


