Return-Path: <cristiana.voicu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EBB046E7E3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 11:34:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 Feb 2014 03:30:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,534,1389772800"; d="scan'208";a="488717426"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.62])
	by orsmga002.jf.intel.com with ESMTP; 24 Feb 2014 03:34:49 -0800
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Feb 2014 13:42:40 +0200
Message-Id: <cover.1393228795.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] Package upgrades
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
X-List-Received-Date: Mon, 24 Feb 2014 11:34:57 -0000

The packages has been succesfully compiled for all major architectures.
Tested locally on a core-image-sato image.

The following changes since commit 54562006c1327c5b99daa4cc05a3ba7e38412da1:

  image_types.bbclass: Fix tar IMAGE_CMD to not change directories (2014-02-18 08:38:52 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib cvoicu/work
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=cvoicu/work

Cristiana Voicu (2):
  curl: upgrade to 7.35.0
  pango: upgrade to 1.36.2

 .../pango/{pango_1.36.1.bb => pango_1.36.2.bb}     |    4 ++--
 .../curl/{curl_7.34.0.bb => curl_7.35.0.bb}        |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/pango/{pango_1.36.1.bb => pango_1.36.2.bb} (56%)
 rename meta/recipes-support/curl/{curl_7.34.0.bb => curl_7.35.0.bb} (93%)

-- 
1.7.9.5


