Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T2Pon-0002UW-HM
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 18:54:41 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Aug 2012 09:41:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,785,1336374000"; d="scan'208";a="182053200"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.33])
	by orsmga001.jf.intel.com with ESMTP; 17 Aug 2012 09:41:21 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 18:46:09 +0300
Message-Id: <1345218371-15230-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH 0/2] Package upgrades
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
X-List-Received-Date: Fri, 17 Aug 2012 16:54:41 -0000

This is another set of package upgrades compiled on all architectures
and tested using core-image-sato-sdk. Nothing significant changed
in the gst-fluendo-mp3 license file.

Constantin Musca (2):
  gst-fluendo-mp3: upgrade to 0.10.19
  gst-fluendo-mpegdemux: upgrade to 0.10.71

 ...o-mp3_0.10.16.bb => gst-fluendo-mp3_0.10.19.bb} |    6 +++---
 ...0.10.70.bb => gst-fluendo-mpegdemux_0.10.71.bb} |    4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-fluendo-mp3_0.10.16.bb => gst-fluendo-mp3_0.10.19.bb} (46%)
 rename meta/recipes-multimedia/gstreamer/{gst-fluendo-mpegdemux_0.10.70.bb => gst-fluendo-mpegdemux_0.10.71.bb} (71%)

-- 
1.7.9.5



