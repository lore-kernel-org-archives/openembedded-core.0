Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B89816E79A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 09:48:34 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 31 Mar 2014 02:43:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,764,1389772800"; d="scan'208";a="503412347"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 31 Mar 2014 02:48:02 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Mar 2014 12:51:20 +0300
Message-Id: <cover.1396259433.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/1] Fix for YB6073
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
X-List-Received-Date: Mon, 31 Mar 2014 09:48:34 -0000

The following changes since commit 8210928e847fda7dbc145a94372b0beaf653a4f9:

  yocto-bsps: remove linux-yocto 3.8 bbappend (2014-03-30 23:53:00 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/lsb-pam-enforcing
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/lsb-pam-enforcing

Cristian Iorga (1):
  core-image-lsb: enforce pam as a needed distro feature

 meta/recipes-extended/images/core-image-lsb.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
1.8.3.2


