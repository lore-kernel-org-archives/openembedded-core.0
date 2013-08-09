Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 738B76B551
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 08:59:39 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 09 Aug 2013 01:59:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,844,1367996400"; d="scan'208";a="279808024"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.201])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Aug 2013 01:59:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Aug 2013 09:59:29 +0100
Message-Id: <cover.1376038140.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/6] Import libav from meta-oe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Aug 2013 08:59:39 -0000

Bring in the libav (ffmpeg replacement) recipe from meta-oe. Motivations
behind this:

* Enhances the performance/capability of gst-ffmpeg (which we already
  have in OE-Core) by switching it to use an up-to-date version of libav
  instead of the old internal copy of ffmpeg
* Allows dropping the gst-ffmpeg bbappend from meta-oe which does the above
* Provides a standard libav recipe to prevent ffmpeg/libav needing to be
  added by other layers

A number of improvements to the recipes themselves have been made in the
process, see individual changes for details. Note that these recipes are
protected by LICENSE_FLAGS = "commercial".


The following changes since commit 291ab168fac15eae0e4c9234e16f394b0e1547a0:

  subversion: Add patch to use neon 0.30 (2013-08-07 07:43:31 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/libav
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/libav

Paul Eggleton (6):
  yasm: add from meta-oe and tweak
  x264: add from meta-oe, update and tweak
  libav: add from meta-oe, update and tweak
  gst-ffmpeg: merge in bbappend from meta-oe
  gst-ffmpeg: enable using yasm during build
  gst-ffmpeg: set SUMMARY instead of DESCRIPTION

 meta/recipes-devtools/yasm/yasm_1.2.0.bb           |  13 +++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |  12 +-
 .../0001-configure-enable-pic-for-AArch64.patch    |  23 ++++
 meta/recipes-multimedia/libav/libav.inc            | 129 +++++++++++++++++++++
 meta/recipes-multimedia/libav/libav_0.8.8.bb       |  18 +++
 meta/recipes-multimedia/libav/libav_git.bb         |  16 +++
 .../don-t-default-to-cortex-a9-with-neon.patch     |  20 ++++
 meta/recipes-multimedia/x264/x264_git.bb           |  52 +++++++++
 8 files changed, 277 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/yasm/yasm_1.2.0.bb
 create mode 100644 meta/recipes-multimedia/libav/libav-0.8.8/0001-configure-enable-pic-for-AArch64.patch
 create mode 100644 meta/recipes-multimedia/libav/libav.inc
 create mode 100644 meta/recipes-multimedia/libav/libav_0.8.8.bb
 create mode 100644 meta/recipes-multimedia/libav/libav_git.bb
 create mode 100644 meta/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch
 create mode 100644 meta/recipes-multimedia/x264/x264_git.bb

-- 
1.8.1.2


