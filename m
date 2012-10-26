Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TRn30-0002sR-TX
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 18:46:15 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Oct 2012 09:32:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,654,1344236400"; d="scan'208";a="238835226"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.47])
	by fmsmga001.fm.intel.com with ESMTP; 26 Oct 2012 09:22:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Oct 2012 09:22:42 -0700
Message-Id: <cover.1351268391.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [Consolidated Pull 00/13] SDK and misc
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
X-List-Received-Date: Fri, 26 Oct 2012 16:46:15 -0000

Richard,

Built and reviewed.

Sau!


The following changes since commit 88b4ec0b8c7c75b8570fc201c705937b459bb43e:

  zeroconf: remove (2012-10-26 14:11:55 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Mark Hatle (4):
  multilib: Add support for cross-canadian multilib packages
  multilib - crosssdk: Stop building multilib for crosssdk packages
  populate_sdk_base: Update extraction script for multilibs
  populate_sdk_base: Ensure that the multilib cross-canadian tools are
    used

Peter Seebach (1):
  insane.bbclass and friends: Fix sanity checks and multlib headers for
    n32

Ross Burton (4):
  pulseaudio: add GConf dependency
  pulseaudio: move helper binaries into the relevant module packages
  pulseaudio: fix library packaging
  pulseaudio: remove libpulse-browse, removed upstream in 2011

Saul Wold (3):
  gst-meta-base: include ximagesink plugin when x11 is a feature
  sstate: add manifest info for shared file matches
  ltp: add perl to RDEPENDS

Thomas Kristensen (1):
  populate_sdk_base.bbclass: Make it possible to overrise the
    create_shar method of populate_sdk_base.

 meta/classes/base.bbclass                          |   43 ++++++++++++++++++--
 meta/classes/insane.bbclass                        |    4 ++
 meta/classes/multilib.bbclass                      |   20 +++++++--
 meta/classes/multilib_header.bbclass               |   32 ++++++++++-----
 meta/classes/populate_sdk_base.bbclass             |   10 +++--
 meta/classes/siteinfo.bbclass                      |    5 ++
 meta/classes/sstate.bbclass                        |    8 +++-
 meta/conf/machine/include/mips/arch-mips.inc       |    1 +
 meta/lib/oe/classextend.py                         |    4 +-
 meta/recipes-extended/ltp/ltp_20120903.bb          |    4 +-
 .../gstreamer/gst-meta-base_0.10.bb                |    5 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |   21 +++++-----
 .../pulseaudio/pulseaudio_2.1.bb                   |    2 +-
 13 files changed, 119 insertions(+), 40 deletions(-)

-- 
1.7.7.6



