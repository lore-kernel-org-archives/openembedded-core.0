Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RGxdT-0007VX-6f
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 20:46:35 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Oct 2011 11:40:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="65230710"
Received: from jbkonno-mobl.jf.intel.com (HELO shamshir.jf.intel.com)
	([10.7.199.153])
	by orsmga001.jf.intel.com with ESMTP; 20 Oct 2011 11:40:41 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Oct 2011 11:40:36 -0700
Message-Id: <cover.1319135920.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/1] Handle gconf schema in gst-plugins-good
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
X-List-Received-Date: Thu, 20 Oct 2011 18:46:35 -0000

Thanks to Koen's feedback this updated patch correctly ships the gconf schema with
the gconfelements package.

Cheers,
Joshua

The following changes since commit 99da9a4e65f9dffb04efc3ad60125194c476d6b3:

  distro-tracking-fields: update fields for tzdata and gst-plugins-good (2011-10-20 13:07:16 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/work
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/work

Joshua Lock (1):
  gst-plugins-good: correctly handle gconf schema

 .../gstreamer/gst-plugins-good_0.10.30.bb          |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

-- 
1.7.6.4



