Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RFnK5-0007Cj-Qz
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Oct 2011 15:33:46 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Oct 2011 06:27:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,359,1315206000"; d="scan'208";a="78842644"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.43])
	by fmsmga002.fm.intel.com with ESMTP; 17 Oct 2011 06:27:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Oct 2011 14:27:51 +0100
Message-Id: <cover.1318852098.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/2] gstreamer plugins update/fix
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
X-List-Received-Date: Mon, 17 Oct 2011 13:33:46 -0000

I noticed we don't have the latest stable version of gst-plugins-base,
I'm assuming there wasn't a specific reason for this (FWIW the old version
installs a header which causes some applications to fail to build, due to
the use of G_CONST_RETURN which has been deprecated).

In addition, gst-plugins-good builds a pulseaudio plugin if it is found,
and this is useful so make this dependency explicit.

The following changes since commit 629bea96ae07d9f3129a5da488682851a4e09d52:

  xserver-xorg: remove glx-use-tls again (2011-10-17 12:26:52 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/gst
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/gst

Paul Eggleton (2):
  gst-plugins-base: update to 0.10.35
  gst-plugins-good: add pulseaudio to DEPENDS

 .../gst-plugins-base-tremor.patch                  |    0
 ...base_0.10.32.bb => gst-plugins-base_0.10.35.bb} |    6 +++---
 .../gstreamer/gst-plugins-good_0.10.28.bb          |    4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-base-0.10.32 => gst-plugins-base-0.10.35}/gst-plugins-base-tremor.patch (100%)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-base_0.10.32.bb => gst-plugins-base_0.10.35.bb} (84%)

-- 
1.7.4.1



