Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E1F5778291
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 10:31:17 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jul 2017 03:31:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,383,1496127600"; d="scan'208";a="128964707"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by fmsmga005.fm.intel.com with ESMTP; 20 Jul 2017 03:31:17 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Jul 2017 18:31:56 +0800
Message-Id: <1500546720-145364-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCHv2 0/4] devtool: add: automatically set branch for git URLs if not master
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
X-List-Received-Date: Thu, 20 Jul 2017 10:31:18 -0000

Hi Ross,

Change log on v2:
Fixed the tracebacks on local variable being referenced before assignment.

Along with this series, I have take in Stanley's patch on YOCTO #11393
which has a dependency on my series.

Thank you.

Rebecca

... ...

Cover letter on first submission:

Quoted from Bugzilla #11389, if devtool add is run on a git URL and
a revision is specified that is not on master, and branch= isn't
already in the URL, then devtool should get the correct branch and
add it to the URL while creating recipe.

Another side track on this bug fix, I have disable PREMIRRORS and
MIRRORS by default. When creating new recipes, we are almost
certainly fetching a new source rather that something that has
already been fetched. I have disable PREMIRRORS and MIRRORS
settings from datastore for both devtool and recipetool while
leaving an option for users to enable them manually on needed basis.

Thanks.

Regards,
Rebecca


Chang Rebecca Swee Fun (3):
  recipetool: create: disable PREMIRRORS and MIRRORS by default
  devtool: standard: enable options for PREMIRRORS and MIRRORS
  recipetool: create: being able to set branch when revision is provided

Stanley Phoong (1):
  recipetool: create: handle git URLs specifying only a tag

 scripts/lib/devtool/standard.py  |  3 ++
 scripts/lib/recipetool/create.py | 73 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 75 insertions(+), 1 deletion(-)

-- 
2.7.4


