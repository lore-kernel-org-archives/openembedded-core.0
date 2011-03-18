Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Q0dPb-00028Y-QT
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Mar 2011 18:24:32 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 Mar 2011 10:21:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,206,1299484800"; d="scan'208";a="721673265"
Received: from unknown (HELO helios) ([10.255.12.183])
	by orsmga001.jf.intel.com with SMTP; 18 Mar 2011 10:21:34 -0700
Received: by helios (sSMTP sendmail emulation); Fri, 18 Mar 2011 17:21:36 +0000
Message-Id: <cover.1300467808.git.paul.eggleton@linux.intel.com>
Old-Date: Fri, 18 Mar 2011 17:03:28 +0000
Date: Fri, 18 Mar 2011 17:21:36 +0000
To: openembedded-core@lists.openembedded.org
CC: 
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 0/3] Fix errors in startup/shutdown
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
X-List-Received-Date: Fri, 18 Mar 2011 17:24:32 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Fixes a number of minor errors in startup/shutdown. Includes one fix imported
from OE.

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: paule/init-error-fixes
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/init-error-fixes

Thanks,
    Paul Eggleton <paul.eggleton@linux.intel.com>
---


Paul Eggleton (2):
  nfs-utils: fix "sh: bad number" error on start/stop of nfsserver
  busybox: enable unmount all feature

Tom Rini (1):
  initscripts: Make umountfs a bit more robust, bump PR

 .../nfs-utils/nfs-utils/nfsserver                  |    2 +-
 meta/recipes-core/busybox/busybox-1.17.3/defconfig |    2 +-
 meta/recipes-core/busybox/busybox_1.17.3.bb        |    2 +-
 .../initscripts/initscripts-1.0/umountfs           |    6 +++---
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)



