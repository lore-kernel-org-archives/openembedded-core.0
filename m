Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RGf2e-0002vD-FB
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 00:55:20 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 Oct 2011 15:49:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="64819065"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.15.35])
	by orsmga001.jf.intel.com with ESMTP; 19 Oct 2011 15:49:28 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Oct 2011 15:49:22 -0700
Message-Id: <cover.1319064436.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/4] Update tzdata and gst-plugins-good v2
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
X-List-Received-Date: Wed, 19 Oct 2011 22:55:20 -0000

Upgraded tzdata, tzcode-native and gst-plugins-good per mailing list
requests.

Updated gst-plugins-good recipe to install and correctly handle its
gconf schema.

Cheers,
Joshua

The following changes since commit e31dd9b65f3b03f79cabab25eca157532de3bd9c:

  fontconfig: fix fix-pkgconfig.patch (2011-10-18 18:13:47 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/work
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/work

Joshua Lock (4):
  gst-plugins-good: update to 0.10.30
  tzdata: updated SRC_URI and update to 2011k
  tzcode-native: update SRC_URI to new IANA location
  gst-plugins-good: correctly handle gconf schema

 .../recipes-extended/tzcode/tzcode-native_2011i.bb |    4 ++--
 .../tzdata/{tzdata_2011k.bb => tzdata_2011l.bb}    |    6 +++---
 ...good_0.10.28.bb => gst-plugins-good_0.10.30.bb} |   10 ++++++----
 3 files changed, 11 insertions(+), 9 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2011k.bb => tzdata_2011l.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-good_0.10.28.bb => gst-plugins-good_0.10.30.bb} (75%)

-- 
1.7.6.4



