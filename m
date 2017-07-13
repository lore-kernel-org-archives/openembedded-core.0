Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D227C71AD8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 03:33:10 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jul 2017 20:33:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,352,1496127600"; d="scan'208";a="125959597"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by fmsmga005.fm.intel.com with ESMTP; 12 Jul 2017 20:33:08 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Jul 2017 11:33:53 +0800
Message-Id: <1499916836-188258-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/3] devtool: add: automatically set branch for git URLs if not master
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
X-List-Received-Date: Thu, 13 Jul 2017 03:33:12 -0000

Hi everyone,

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

 scripts/lib/devtool/standard.py  |  3 +++
 scripts/lib/recipetool/create.py | 45 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

-- 
2.7.4


