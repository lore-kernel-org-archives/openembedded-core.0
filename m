Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 344EE73CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 23:27:05 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 21 Sep 2015 16:27:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,570,1437462000"; d="scan'208";a="649637760"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga003.jf.intel.com with ESMTP; 21 Sep 2015 16:27:05 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Sep 2015 16:21:19 -0700
Message-Id: <1442877680-8798-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1442260397.2948.87.camel@pbcl.net>
References: <1442260397.2948.87.camel@pbcl.net>
Cc: richard.purdie@intel.com
Subject: [PATCH v2 0/1] libgcc: package multiple libraries
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
X-List-Received-Date: Mon, 21 Sep 2015 23:27:08 -0000

Second attempt. This patch is a bit more invasive than the previous one, 
but based on my understanding it should not break the existing code.

Juro Bystricky (1):
  libgcc.inc: package baremetal multilib libraries

 meta/recipes-devtools/gcc/libgcc.inc | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

-- 
1.9.1


