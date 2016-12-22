Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 9B3F17736F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 03:14:03 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 21 Dec 2016 19:14:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,386,1477983600"; d="scan'208";a="45278491"
Received: from afzalahm-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.181.112])
	by orsmga005.jf.intel.com with ESMTP; 21 Dec 2016 19:14:02 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2016 16:13:55 +1300
Message-Id: <cover.1482376395.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/3] Misc correctness fixes
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
X-List-Received-Date: Thu, 22 Dec 2016 03:14:03 -0000

The following changes since commit 5e21afc9395060b489156d3f90505a372b713f37:

  Revert "selftest/wic: extending test coverage for WIC script options" (2016-12-20 17:06:01 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/correctness-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/correctness-fixes

Paul Eggleton (3):
  meta: use require instead of include when file should exist
  oe-selftest: fix behaviour if oe-selftest.log is a dangling symlink
  classes/buildstats: don't expand variable pointing to SystemStats

 meta/classes/buildstats.bbclass                                       | 2 +-
 meta/recipes-core/glibc/glibc-locale.inc                              | 2 +-
 meta/recipes-core/glibc/glibc-mtrace.inc                              | 2 +-
 meta/recipes-core/glibc/glibc-scripts.inc                             | 2 +-
 meta/recipes-extended/cpio/cpio_2.12.bb                               | 2 +-
 meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.0.bb                     | 2 +-
 meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.0.bb                    | 2 +-
 meta/recipes-graphics/xorg-driver/xorg-driver-input.inc               | 2 +-
 meta/recipes-graphics/xorg-driver/xorg-driver-video.inc               | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.1.bb        | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb           | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb           | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb             | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb  | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb     | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.1.bb | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb    | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.1.bb | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb    | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.1.bb | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb    | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.1.bb  | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.1.bb              | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb                 | 2 +-
 meta/recipes-support/boost/bjam-native_1.62.0.bb                      | 2 +-
 meta/recipes-support/boost/boost_1.62.0.bb                            | 4 ++--
 scripts/oe-selftest                                                   | 3 ++-
 27 files changed, 29 insertions(+), 28 deletions(-)

-- 
2.5.5


