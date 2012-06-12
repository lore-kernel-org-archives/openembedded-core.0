Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SeRw9-0000Dj-D2
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 16:19:13 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 12 Jun 2012 07:08:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="155287582"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.133])
	by azsmga001.ch.intel.com with ESMTP; 12 Jun 2012 07:08:37 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2012 07:08:14 -0700
Message-Id: <cover.1339509937.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 0/1] Remove distro_tracking_fields from oe-core
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
X-List-Received-Date: Tue, 12 Jun 2012 14:19:13 -0000

Much of this data will be moved into meta-yocto as it is
really Yocto Project tracking info, this info will also be 
broken into multiple files, see associated commit to meta-yocto.

Sau!

The following changes since commit cb945328fe019c246c520904c02ca29d3798df07:

  qt4: Drop 4.7.4 (2012-06-12 12:58:53 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/distro_tracking
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/distro_tracking

Saul Wold (1):
  distro_tracking_fields: move to meta-yocto as seperate files

 .../conf/distro/include/distro_tracking_fields.inc | 6485 --------------------
 1 files changed, 0 insertions(+), 6485 deletions(-)
 delete mode 100644 meta/conf/distro/include/distro_tracking_fields.inc

-- 
1.7.7.6



