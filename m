Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D50346DF51
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2013 14:57:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 Dec 2013 06:54:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,841,1378882800"; d="scan'208";a="420490294"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 06 Dec 2013 06:57:52 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2013 17:00:13 +0200
Message-Id: <cover.1386341976.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/2] Various comms PUs
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
X-List-Received-Date: Fri, 06 Dec 2013 14:57:54 -0000

The following changes since commit 184038bedb20f74ba4dcad6ef2d92e87a9ba5f9a:

  bitbake: fetch2/git: Ensure check is made in the correct directory (2013-12-06 14:10:15 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PUs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PUs

Cristian Iorga (2):
  iptables: upgrade to 1.4.21
  iproute2: upgrade to 3.12.0

 .../iproute2/{iproute2_3.11.0.bb => iproute2_3.12.0.bb}               | 4 ++--
 .../iptables/{iptables_1.4.19.1.bb => iptables_1.4.21.bb}             | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_3.11.0.bb => iproute2_3.12.0.bb} (68%)
 rename meta/recipes-extended/iptables/{iptables_1.4.19.1.bb => iptables_1.4.21.bb} (92%)

-- 
1.8.3.2


