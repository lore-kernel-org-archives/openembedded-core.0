Return-Path: <max.eliaser@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7349D6FE24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 22:09:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Jun 2014 15:09:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,473,1400050800"; d="scan'208";a="528328030"
Received: from maxtothemax-studio-xps-8000.jf.intel.com ([10.7.196.155])
	by orsmga001.jf.intel.com with ESMTP; 13 Jun 2014 15:09:09 -0700
From: Max Eliaser <max.eliaser@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jun 2014 15:07:40 -0700
Message-Id: <cover.1402697205.git.max.eliaser@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/1] Fix texinfo-dummy-native bug causing false-positive assertion errors
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
X-List-Received-Date: Fri, 13 Jun 2014 22:09:10 -0000

Hello list,

This is a simple one-line fix for Denys Dmytriyenko's bug. 

Regards,
-Max Eliaser
The following changes since commit 5452824960e8e77005a25ac11fd069d927523d3e:

  default-distrovars.inc: Remove unused variable 'LIMIT_BUILT_LOCALES' (2014-06-13 13:08:44 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib meliaser/fix-texinfo-dummy-capital-E
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=meliaser/fix-texinfo-dummy-capital-E

Max Eliaser (1):
  texinfo-dummy-native: Fix dummy scripts failing when paths contain
    capital Es

 meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.8.3.2


