Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SHdHp-0006vk-2z
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 17:47:17 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 10 Apr 2012 08:37:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129208625"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by azsmga001.ch.intel.com with ESMTP; 10 Apr 2012 08:37:56 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2012 23:32:04 +0800
Message-Id: <cover.1334071773.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH V4 0/1] connman: added dependency to ofono.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Apr 2012 15:47:17 -0000

Per community discussion result, we temporarily added the denpendency to ofono 
for connman in 1.2 release, and we'll change it to using PACKAGECONFIG to 
optionally build ofono. 

Also bump the PR.

The following changes since commit 1a82989345fb98becb487d270fd93a5e6dffeb47:
  Saul Wold (1):
        runqemu-internal: Add console=tty for qemuppc and NFS

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/multilib
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/multilib

Lianhao Lu (1):
  connman: add ofono dependency.

 meta/recipes-connectivity/connman/connman.inc     |    1 +
 meta/recipes-connectivity/connman/connman_0.79.bb |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)



