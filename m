Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D86046F90D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 07:15:22 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 Mar 2014 00:15:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,739,1389772800"; d="scan'208";a="508717192"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 27 Mar 2014 00:14:59 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Mar 2014 09:18:16 +0200
Message-Id: <cover.1395904656.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/1] Fix for YB5795
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
X-List-Received-Date: Thu, 27 Mar 2014 07:15:24 -0000

The following changes since commit ae938eba92b2c89a9fd91161e57c5dbc594ad4ad:

  local.conf.sample.extended: update it for the archiver (2014-03-26 12:15:44 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/YB5795
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/YB5795

Cristian Iorga (1):
  lsb: fix lsb_log_msg() implementation

 meta/recipes-extended/lsb/lsb/init-functions  | 7 ++++++-
 meta/recipes-extended/lsb/lsb/lsb_log_message | 5 -----
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
1.8.3.2


