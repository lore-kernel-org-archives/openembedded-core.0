Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B13F6760AA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 08:19:02 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 06 Apr 2016 01:19:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,447,1455004800"; d="scan'208";a="681622584"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Apr 2016 01:19:02 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Apr 2016 11:18:54 +0300
Message-Id: <cover.1459929046.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] Hide textrel QA warning for ffmpeg
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
X-List-Received-Date: Wed, 06 Apr 2016 08:19:03 -0000

ffmpeg disables position independent code on several architectures even
when --enable-pic is set: this seems to be a conscious decision based
on performance (see also previous discussion*).

First patch is an unrelated packaging fix, second adds INSANE_SKIPs to
hide QA warnings about .text relocation.

*) http://lists.openembedded.org/pipermail/openembedded-core/2015-May/105501.html


Thanks,
 Jussi



The following changes since commit f4f1d206f4ebafcde18c96c88a1bfc4ab7b0c119:

  scripts/lib/bsp/help.py: Typo in help for yocto-bsp create (2016-04-05 14:33:58 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/ffmpeg-textrel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/ffmpeg-textrel

Jussi Kukkonen (2):
  ffmpeg: Make configure options explicit
  ffmpeg, gstreamer1.0-libav: add textrel INSANE_SKIPs

 meta/recipes-multimedia/ffmpeg/ffmpeg_3.0.bb       | 27 ++++++++++++++++++++--
 .../gstreamer/gstreamer1.0-libav.inc               |  3 +++
 2 files changed, 28 insertions(+), 2 deletions(-)

-- 
2.1.4


