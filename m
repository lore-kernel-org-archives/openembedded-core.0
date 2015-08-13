Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5EA2D73905
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 17:05:04 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Aug 2015 10:04:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,671,1432623600"; d="scan'208";a="768232444"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by fmsmga001.fm.intel.com with ESMTP; 13 Aug 2015 10:04:00 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Aug 2015 08:58:00 +0000
Message-Id: <cover.1439456090.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH 0/2] Check non-ASCII characters on recipe metadata
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
X-List-Received-Date: Thu, 13 Aug 2015 17:05:13 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

* First patch creates a QA check on insane.bbclass
* Second patch handles a string encode exception, reported on [1]

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=6693

The following changes since commit 0f7df92e3d2dbbb4c94299171d5d0287887e0d28:

  clutter-gst: update to 3.0.8 (2015-08-11 09:28:52 -0700)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lsandov1/package_deb-handle-non-ascii-6693
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lsandov1/package_deb-handle-non-ascii-6693

Leonardo Sandoval (2):
  insane.bbclass: Check non-ASCII characters on metadata
  package_deb.bbclass: Handle exception when encoding non-ASCII
    characters

 meta/classes/insane.bbclass      | 24 +++++++++++++++++++++++-
 meta/classes/package_deb.bbclass |  4 ++++
 2 files changed, 27 insertions(+), 1 deletion(-)

-- 
1.8.4.5


