Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 459BB60F4A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 18:21:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Dec 2013 10:21:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,879,1378882800"; d="scan'208";a="449090520"
Received: from mmckenna-mobl1.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.252])
	by fmsmga002.fm.intel.com with ESMTP; 12 Dec 2013 10:21:09 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2013 18:21:02 +0000
Message-Id: <cover.1386870869.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [dylan][PATCH 0/4] CVE backports from the dora branch (cover letter only)
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
X-List-Received-Date: Thu, 12 Dec 2013 18:21:12 -0000

All four of the CVE fixes in Robert's just-merged dora series apply to
dylan, so here they are on top of dylan.


The following changes since commit 4e31587ef3be95abe28d38609da16f47d1261c07:

  build-appliance-image: Update to dylan head revision (2013-12-12 17:05:02 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/dylan-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/dylan-next

Baogen Shang (2):
  libtiff: CVE-2013-4232
  libtiff: CVE-2013-4243

Ming Liu (2):
  gst-ffmpeg: fix CVE-2013-3674
  libtiff: fix CVE-2013-1960

 .../gst-ffmpeg-CVE-2013-3674.patch                 |  26 ++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |   1 +
 .../libtiff/files/libtiff-CVE-2013-1960.patch      | 151 +++++++++++++++++++++
 .../libtiff/files/libtiff-CVE-2013-4232.patch      |  15 ++
 .../libtiff/files/libtiff-CVE-2013-4243.patch      |  40 ++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.3.bb      |   5 +-
 6 files changed, 237 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/gst-ffmpeg-CVE-2013-3674.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-1960.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-4232.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-4243.patch

-- 
1.8.1.2


