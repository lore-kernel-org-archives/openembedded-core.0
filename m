Return-Path: <anujx.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3189065CBB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Mar 2016 09:55:39 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 02 Mar 2016 01:55:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,528,1449561600"; d="scan'208";a="662401911"
Received: from amitta2x-ilbpg1.png.intel.com ([10.88.227.34])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Mar 2016 01:55:39 -0800
From: Anuj Mittal <anujx.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Mar 2016 17:55:40 +0800
Message-Id: <1456912541-16297-1-git-send-email-anujx.mittal@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-intel][master][jethro][PATCH 0/1] Fix tune name in tune-corei7.inc
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
X-List-Received-Date: Wed, 02 Mar 2016 09:55:40 -0000

There's no AVAILTUNES with the name "core2" while tune-corei7.inc seems to
have a reference to it.

$ grep -r core2 tune-corei7.inc
require conf/machine/include/tune-core2.inc
PACKAGE_EXTRA_ARCHS_tune-corei7-32 = "${PACKAGE_EXTRA_ARCHS_tune-core2} corei7-32"

$ grep -r AVAILTUNES tune-core2.inc
AVAILTUNES += "core2-32"
AVAILTUNES += "core2-64"
AVAILTUNES += "core2-64-x32"

This patch changes the name of tune in tune-corei7.inc so PACKAGE_EXTRA_ARCHS
is expanded correctly.

Please consider backporting it to Jethro too.

Thank you,

Chang Rebecca Swee Fun (1):
  tune-corei7.inc: Fix PACKAGE_EXTRA_ARCHS for corei7-32

 meta/conf/machine/include/tune-corei7.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.1


