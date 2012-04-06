Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SG2kQ-0005Qo-8F
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 08:34:14 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Apr 2012 23:25:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="129331676"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by orsmga002.jf.intel.com with ESMTP; 05 Apr 2012 23:25:00 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Apr 2012 14:19:53 +0800
Message-Id: <cover.1333693070.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] Ensure package dependency between connman and ofono
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
X-List-Received-Date: Fri, 06 Apr 2012 06:34:14 -0000

Make sure ofono package is generated when building connman.

The following changes since commit 1a82989345fb98becb487d270fd93a5e6dffeb47:
  Saul Wold (1):
        runqemu-internal: Add console=tty for qemuppc and NFS

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/multilib
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/multilib

Lianhao Lu (1):
  connman: ensure ofono package is generated.

 meta/recipes-connectivity/connman/connman.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)



