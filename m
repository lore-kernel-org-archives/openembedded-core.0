Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RGIAi-0002QY-74
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 00:30:08 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Oct 2011 15:24:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,366,1315206000"; d="scan'208";a="63915354"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.15.46])
	by azsmga001.ch.intel.com with ESMTP; 18 Oct 2011 15:24:16 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Oct 2011 15:24:10 -0700
Message-Id: <cover.1318976197.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/2] Update tzdata and gst-plugins-good
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
X-List-Received-Date: Tue, 18 Oct 2011 22:30:08 -0000

Per mailing requests, here are updates to the tzdata and gst-plugins-good recipes.

Joshua

The following changes since commit 95d0ff5e070c690314ab87665200099a52d37ebf:

  tzdata: updated SRC_URI and update to 2011k (2011-10-18 11:16:58 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/work
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/work

Joshua Lock (2):
  gst-plugins-good: update to 0.10.30
  tzdata: updated SRC_URI and update to 2011k

 .../tzdata/{tzdata_2011k.bb => tzdata_2011l.bb}    |    6 +++---
 ...good_0.10.28.bb => gst-plugins-good_0.10.30.bb} |    4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2011k.bb => tzdata_2011l.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-good_0.10.28.bb => gst-plugins-good_0.10.30.bb} (84%)

-- 
1.7.6.4



