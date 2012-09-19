Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TEEZl-0007vM-2z
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 09:20:01 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 19 Sep 2012 00:07:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,447,1344236400"; d="scan'208";a="194412091"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.37])
	by azsmga001.ch.intel.com with ESMTP; 19 Sep 2012 00:07:17 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2012 10:06:52 +0300
Message-Id: <1348038415-18757-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH V2 0/2] qemux86 and qemux86-64 with KVM, paravirt and virtio
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Sep 2012 07:20:01 -0000

qemux86 and qemux86-64 have been updated with
support for KVM, paravirt and virtio drivers.
linux-yocto_3.4.bb recipe have been bumped to 3,
as two changes went in (was previously at 1).

Cristian Iorga (2):
  qemux86: Support for KVM, paravirt and virtio added
  qemux86-64: Support for KVM, paravirt and virtio added

 meta/recipes-kernel/linux/linux-yocto_3.4.bb |    4 +++-
 scripts/runqemu                              |   16 +++++++++++++++-
 scripts/runqemu-internal                     |   18 +++++++++++++-----
 3 files changed, 31 insertions(+), 7 deletions(-)

-- 
1.7.9.5



