Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 1A18677203
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 20:31:56 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 04 Feb 2016 12:31:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,397,1449561600"; d="scan'208";a="740710354"
Received: from bitbang.jf.intel.com ([10.7.199.151])
	by orsmga003.jf.intel.com with ESMTP; 04 Feb 2016 12:31:58 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 12:31:40 -0800
Message-Id: <cover.1454614198.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/5] extsdk bug fixes and minimal type addition
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
X-List-Received-Date: Thu, 04 Feb 2016 20:31:58 -0000

The following changes since commit b33e440cc6fbd703e8045d94b806790343e72eb6:

  libical: Work around hardcoded paths in pkgconfig file (2016-02-04 13:09:56 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib fcef7183f0ac9ab38715bb0c0a80109696d79b2d
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=fcef7183f0ac9ab38715bb0c0a80109696d79b2d

Randy Witt (5):
  copy_buildsystem.py: Pass the nativelsb argument to
    gen-lockedsig-cache
  toolchain-scripts.bbclass: Use PYTHONPATH instead of PYTHONHOME
  populate_sdk_ext: Don't set sdk_update_targets in the config
  populate_sdk_ext: Add support for a "minimal" type
  populate_sdk_ext: Make populate_sdk_ext depend on sdk_extra_conf

 meta/classes/populate_sdk_ext.bbclass  | 21 +++++++++++----------
 meta/classes/toolchain-scripts.bbclass |  2 +-
 meta/lib/oe/copy_buildsystem.py        |  9 ++++++++-
 3 files changed, 20 insertions(+), 12 deletions(-)

-- 
2.5.0


