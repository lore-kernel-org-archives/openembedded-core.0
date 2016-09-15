Return-Path: <sgw@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 758CB731B1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 20:29:34 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 15 Sep 2016 13:29:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,340,1470726000"; d="scan'208";a="879512888"
Received: from swold-mobl2.amr.corp.intel.com ([10.252.140.244])
	by orsmga003.jf.intel.com with ESMTP; 15 Sep 2016 13:29:35 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Thu, 15 Sep 2016 13:29:32 -0700
Message-Id: <1473971373-31647-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] add uvesa timeout to kernel
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
X-List-Received-Date: Thu, 15 Sep 2016 20:29:35 -0000

This depends on the SRCREV update from Bruce to add Jianxun's patch that 
adds the task_timeout code to the uvesafb code.

Please merge this after the kernel SRCREV udpates have been merged.

Sau!


Saul Wold (1):
  qemuboot-x86: Add task_timeout = -1 to uvesafb

 meta/conf/machine/include/qemuboot-x86.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.7.4


