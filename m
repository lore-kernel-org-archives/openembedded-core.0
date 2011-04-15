Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QAmPs-0005hh-7u
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Apr 2011 19:02:44 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Apr 2011 10:00:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,220,1301900400"; d="scan'208";a="420005173"
Received: from unknown (HELO helios) ([10.255.12.218])
	by azsmga001.ch.intel.com with SMTP; 15 Apr 2011 10:00:19 -0700
Received: by helios (sSMTP sendmail emulation); Fri, 15 Apr 2011 18:00:12 +0100
Message-Id: <cover.1302886579.git.paul.eggleton@linux.intel.com>
Old-Date: Fri, 15 Apr 2011 17:56:19 +0100
Date: Fri, 15 Apr 2011 18:00:12 +0100
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 0/3] /etc/network/interfaces updates
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
X-List-Received-Date: Fri, 15 Apr 2011 17:02:44 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Some fixes for /etc/network/interfaces.

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: paule/netbase-fixes
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/netbase-fixes

Thanks,
    Paul Eggleton <paul.eggleton@linux.intel.com>
---


Paul Eggleton (3):
  netbase: automatically bring up eth0
  netbase: automatically bring up usb0 on beagleboard
  netbase: add /etc/network/interfaces file for qemumips & qemuppc

 .../netbase/netbase-4.45/beagleboard/interfaces    |   27 ++++++++++++++++++++
 meta/recipes-core/netbase/netbase-4.45/interfaces  |    1 +
 .../netbase/netbase-4.45/qemumips/interfaces       |    8 ++++++
 .../netbase/netbase-4.45/qemuppc/interfaces        |    8 ++++++
 4 files changed, 44 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/netbase/netbase-4.45/beagleboard/interfaces
 create mode 100644 meta/recipes-core/netbase/netbase-4.45/qemumips/interfaces
 create mode 100644 meta/recipes-core/netbase/netbase-4.45/qemuppc/interfaces



