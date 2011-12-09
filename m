Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RZ4S3-0002gL-H5
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 18:41:41 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Dec 2011 09:34:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="94433735"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.20])
	by fmsmga001.fm.intel.com with ESMTP; 09 Dec 2011 09:34:43 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Dec 2011 17:34:41 +0000
Message-Id: <cover.1323451977.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] Enable buildhistory for deb-based images
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
X-List-Received-Date: Fri, 09 Dec 2011 17:41:41 -0000

The following change since commit 4a13766c7b223d82e8cf682db999a135d2b8412c:

  gtk.inc: ship gtk-demo to independent package (2011-12-08 16:58:41 +0000)

is available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-deb
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-deb

Paul Eggleton (1):
  classes/rootfs_deb: implement query functions for buildhistory

 meta/classes/rootfs_deb.bbclass |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

-- 
1.7.5.4



