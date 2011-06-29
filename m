Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Qc1iB-0002rX-2o
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 22:50:15 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Jun 2011 13:46:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,445,1304319600"; d="scan'208";a="21642947"
Received: from doubt.jf.intel.com (HELO localhost) ([10.7.199.165])
	by orsmga001.jf.intel.com with ESMTP; 29 Jun 2011 13:46:31 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: jiajun.xu@intel.com,
	openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2011 13:46:19 -0700
Message-Id: <cover.1309380310.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 0/1] kernel: move menuconfig task after configure
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
X-List-Received-Date: Wed, 29 Jun 2011 20:50:15 -0000

The following changes since commit e0fc42b51a8209dac1163ae8126f8c687b6bfddf:

  distro_tracking_fields.inc: update RECIPE_MANUAL_CHECK_DATE for screen and tcf-agent (2011-06-29 15:04:59 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dvhart/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/kernel

Darren Hart (1):
  kernel: move menuconfig task after configure

 meta/classes/kernel.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)



