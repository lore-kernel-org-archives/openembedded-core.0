Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id F19016FF04
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 May 2016 23:58:23 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 08 May 2016 16:58:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,598,1455004800"; d="scan'208";a="801873908"
Received: from hschan-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.140.99])
	by orsmga003.jf.intel.com with ESMTP; 08 May 2016 16:58:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 May 2016 11:58:09 +1200
Message-Id: <cover.1462751689.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/2] More reasonable LIC_FILES_CHKSUM enforcement
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
X-List-Received-Date: Sun, 08 May 2016 23:58:24 -0000

Requiring every image recipe to set LIC_FILES_CHKSUM is a bit extreme. Here's
a better way to handle the check as well as a patch dropping LIC_FILES_CHKSUM
where it isn't needed afterwards.


The following changes since commit ece101be5158beee709cdfbb85ecdbdc8d9fb864:

  test-empty-image: Fix LIC_FILES_CHKSUM typo (2016-05-06 10:47:59 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/lic-files-chksum
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/lic-files-chksum

Paul Eggleton (2):
  classes/insane: do not force LIC_FILES_CHKSUM unless SRC_URI is set
  Drop unneeded LIC_FILES_CHKSUM values

 meta-selftest/recipes-test/images/test-empty-image.bb  | 1 -
 meta-selftest/recipes-test/images/wic-image-minimal.bb | 2 --
 meta/classes/core-image.bbclass                        | 5 +----
 meta/classes/insane.bbclass                            | 6 +++---
 meta/classes/packagegroup.bbclass                      | 3 ---
 meta/recipes-core/meta/meta-world-pkgdata.bb           | 1 -
 meta/recipes-graphics/images/core-image-directfb.bb    | 4 ----
 7 files changed, 4 insertions(+), 18 deletions(-)

-- 
2.5.5


