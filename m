Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1AA976F4EE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 16:46:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Mar 2014 08:46:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,601,1389772800"; d="scan'208";a="487311036"
Received: from lbhoopat-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.174])
	by fmsmga001.fm.intel.com with ESMTP; 06 Mar 2014 08:46:23 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Mar 2014 16:46:07 +0000
Message-Id: <cover.1394124256.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH 0/5] Misc feature additions
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
X-List-Received-Date: Thu, 06 Mar 2014 16:46:25 -0000

The following changes since commit c6825ec6e92e20bb64a051d1576f363c16e98d68:

  recipes: bump PRs (2014-03-05 17:26:24 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/features
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/features

Belen Barros Pena (1):
  documentation.conf: sync with the Yocto Project reference manual

Paul Eggleton (4):
  core-image-basic / packagegroup-core-basic: rename to *-full-cmdline
  classes/image: support package-management in IMAGE_FEATURES
  Rename PACKAGE_GROUP variable to FEATURE_PACKAGES
  documentation.conf: drop obsolete variables

 meta/classes/core-image.bbclass                    |  27 ++--
 meta/classes/image.bbclass                         |   8 +-
 meta/conf/documentation.conf                       | 140 ++++++++++++++++--
 meta/lib/oe/packagegroup.py                        |  25 ++--
 meta/lib/oeqa/selftest/bbtests.py                  |   2 +-
 ...e-image-basic.bb => core-image-full-cmdline.bb} |   2 +-
 meta/recipes-extended/images/core-image-lsb.bb     |   2 +-
 .../packagegroups/packagegroup-core-basic.bb       | 138 -----------------
 .../packagegroup-core-full-cmdline.bb              | 163 +++++++++++++++++++++
 .../recipes-graphics/images/core-image-directfb.bb |   2 +-
 10 files changed, 326 insertions(+), 183 deletions(-)
 rename meta/recipes-extended/images/{core-image-basic.bb => core-image-full-cmdline.bb} (87%)
 delete mode 100644 meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
 create mode 100644 meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb

-- 
1.8.5.3


