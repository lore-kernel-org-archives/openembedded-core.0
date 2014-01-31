Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 49D9B6E8EC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 17:05:36 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 31 Jan 2014 09:05:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,758,1384329600"; d="scan'208";a="467886822"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 31 Jan 2014 09:04:47 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jan 2014 19:07:36 +0200
Message-Id: <cover.1391188004.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/1] Fix for YB5781
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
X-List-Received-Date: Fri, 31 Jan 2014 17:05:36 -0000

The following changes since commit d93620baea489c9b20f740c0d06dcb39cf364ecb:

  bitbake: runqueue: Fix race against tasks sharing stamp files (2014-01-31 15:52:17 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/YB5781
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/YB5781

Cristian Iorga (1):
  minicom: fix for multilib and x32 build crash

 meta/recipes-extended/minicom/minicom_2.7.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.8.3.2


