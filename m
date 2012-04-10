Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SHbyQ-0004yI-Ih
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 16:23:10 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 10 Apr 2012 07:13:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="87360105"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Apr 2012 07:13:51 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2012 22:07:58 +0800
Message-Id: <cover.1334066651.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH V3 0/1] connman: added dependency to ofono.
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
X-List-Received-Date: Tue, 10 Apr 2012 14:23:10 -0000

Per community discussion result, we temporarily added the denpendency to ofono 
for connman in 1.2 release, and we'll change it to using PACKAGECONFIG to 
optionally build ofono.

The following changes since commit 1a82989345fb98becb487d270fd93a5e6dffeb47:
  Saul Wold (1):
        runqemu-internal: Add console=tty for qemuppc and NFS

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/multilib
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/multilib

Lianhao Lu (1):
  connman: add ofono dependency.

 meta/recipes-connectivity/connman/connman.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)



