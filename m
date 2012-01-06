Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RjD2W-00031q-KA
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 17:53:12 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 06 Jan 2012 08:45:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="53952770"
Received: from unknown (HELO localhost) ([10.255.13.145])
	by AZSMGA002.ch.intel.com with ESMTP; 06 Jan 2012 08:45:46 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jan 2012 10:45:22 -0600
Message-Id: <cover.1325867350.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/5] LICENSE_FLAGS, a replacement for COMMERCIAL_LICENSE
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
X-List-Received-Date: Fri, 06 Jan 2012 16:53:12 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

This patchset implements a replacement for COMMERCIAL_LICENSE called
LICENSE_FLAGS.  Please see '[PATCH 1/5] base.bbclass: add support for
LICENSE_FLAGS' for background and details.

This patchset was posted earlier in the week and received no comments.
The only changes since then have been to save the cover letter text
describing the patchset as commentary for PATCH 1, and changing instead
of removing the warning in documentation-audit.sh.

In addition to the "Commercial" license replacement for the existing
recipes in COMMERCIAL_LICENSE, this version has also been tested with a
recipe that uses a "License_${PN}_${PV}" string, and multiple flags.

The following changes since commit 468998cddbe1a803096c9b357e1b5daa3b7e8c2e:
  Dongxiao Xu (1):
        command.py: add parseConfigurationFiles API

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/license-flags.v1
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=tzanussi/license-flags.v1

Tom Zanussi (5):
  base.bbclass: add support for LICENSE_FLAGS
  Add LICENSE_FLAGS to packages mentioned in COMMERCIAL_LICENSE
  base.bbclass: remove COMMERCIAL_LICENSE code
  default-distrovars.inc: remove COMMERCIAL_LICENSE et al
  documentation-audit.sh: remove COMMERCIAL_LICENSE warning

 meta/classes/base.bbclass                          |   24 +++++++++++++++-----
 meta/conf/distro/include/default-distrovars.inc    |    5 ----
 .../gstreamer/gst-fluendo-mp3_0.10.16.bb           |    1 +
 .../gstreamer/gst-openmax_0.10.1.bb                |    1 +
 .../gstreamer/gst-plugins-ugly_0.10.18.bb          |    1 +
 meta/recipes-multimedia/lame/lame_3.99.3.bb        |    1 +
 meta/recipes-multimedia/libmad/libmad_0.15.1b.bb   |    1 +
 meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb |    1 +
 meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb |    1 +
 meta/recipes-qt/qt-apps/qmmp_0.5.2.bb              |    1 +
 scripts/contrib/documentation-audit.sh             |    3 +-
 11 files changed, 28 insertions(+), 12 deletions(-)



