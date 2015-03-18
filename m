Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9FCAC60034
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 15:38:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 Mar 2015 08:36:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,423,1422950400"; d="scan'208";a="667010203"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga001.jf.intel.com with ESMTP; 18 Mar 2015 08:38:43 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Mar 2015 17:38:38 +0200
Message-Id: <cover.1426693079.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/1] Fix for YOCTO #7390 bug
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
X-List-Received-Date: Wed, 18 Mar 2015 15:38:42 -0000

The following changes since commit df0672b038e6942c97d266af9ca175a06f2b0423:

  bitbake: toaster: Fix the orderkey to match the column (2015-03-16 17:44:13 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/YB7390
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/YB7390

Cristian Iorga (1):
  neard: fix the install path in init scripts

 meta/recipes-connectivity/neard/neard.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.1.0


