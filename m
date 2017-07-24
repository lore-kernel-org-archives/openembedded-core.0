Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 7596E783B5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 08:24:21 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP; 24 Jul 2017 01:24:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,406,1496127600"; d="scan'208";a="996343394"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by orsmga003.jf.intel.com with ESMTP; 24 Jul 2017 01:24:22 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Jul 2017 16:25:00 +0800
Message-Id: <1500884703-154582-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCHv3 0/3] devtool: add: automatically set branch for git URLs if not master
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
X-List-Received-Date: Mon, 24 Jul 2017 08:24:22 -0000

Hi Ross,

Change log on v3:
Rebased to latest master HEAD

Thanks.

Regards,
Rebecca

Chang Rebecca Swee Fun (2):
  recipetool: create: disable PREMIRRORS and MIRRORS by default
  recipetool: create: being able to set branch when revision is provided

Stanley Phoong (1):
  recipetool: create: handle git URLs specifying only a tag

 scripts/lib/recipetool/create.py | 82 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 81 insertions(+), 1 deletion(-)

-- 
2.7.4


