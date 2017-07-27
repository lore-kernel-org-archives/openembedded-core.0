Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 98F24780B4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 08:40:06 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jul 2017 01:40:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,419,1496127600"; d="scan'208";a="112512136"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by orsmga004.jf.intel.com with ESMTP; 27 Jul 2017 01:40:06 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Jul 2017 16:40:52 +0800
Message-Id: <1501144856-17637-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCHv4 0/4] devtool: add: automatically set branch for git URLs if not master
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
X-List-Received-Date: Thu, 27 Jul 2017 08:40:06 -0000

Hi Ross,

Change log on v4:
Rebased to latest master HEAD.
Broke up Stanley's commit into 2 separate commits as they fix different issues.
And updated my patch on disabling PREMIRRORS and MIRRORS by setting them in
dummy recipe instead to not affecting fetcher process of other dependencies recipes.

Change log on v3:
Rebased to latest master HEAD

Thanks.

Regards,
Rebecca

Chang Rebecca Swee Fun (2):
  recipetool: create: disable PREMIRRORS and MIRRORS by default
  recipetool: create: being able to set branch when revision is provided

Stanley Phoong (2):
  recipetool: create: handle git URLs specifying only a tag
  recipetool: create: replacing PV in SRCURI

 scripts/lib/recipetool/create.py | 75 ++++++++++++++++++++++++++++++++++++++--
 scripts/lib/scriptutils.py       |  9 ++++-
 2 files changed, 81 insertions(+), 3 deletions(-)

-- 
2.7.4


