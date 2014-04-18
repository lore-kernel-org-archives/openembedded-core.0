Return-Path: <cristiana.voicu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0E103606D5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Apr 2014 06:39:33 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Apr 2014 23:39:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,883,1389772800"; d="scan'208";a="523099598"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.143])
	by orsmga002.jf.intel.com with ESMTP; 17 Apr 2014 23:39:32 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Apr 2014 09:40:29 +0300
Message-Id: <cover.1397803089.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/7] PUs
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
X-List-Received-Date: Fri, 18 Apr 2014 06:39:35 -0000

The packages has been succesfully compiled for all major architectures.
Tested locally on a core-image-sato image.

The following changes since commit 863cc7483f5ee43189537940de8ee5c0964d24cc:

  poky.conf: Post release version bump (2014-04-10 18:03:07 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib cvoicu/work
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=cvoicu/work

Cristiana Voicu (7):
  pango: upgrade to 1.36.3
  curl: upgrade to 7.36.0
  atk: upgrade to 2.12.0
  at-spi2-atk: upgrade to 2.12.0
  at-spi2-core: upgrade to 2.12.0
  mtd-utils: upgrade to 1.5.1+gitAUTOINC+12158de
  kmod: upgrade to v17 via git

 meta/recipes-devtools/mtd/mtd-utils_git.bb         |    4 ++--
 .../pango/{pango_1.36.2.bb => pango_1.36.3.bb}     |    4 ++--
 meta/recipes-kernel/kmod/kmod.inc                  |    4 ++--
 ...alling-bswap_-instead-of-htobe-and-be-toh.patch |    4 ++--
 ...at-spi2-atk_2.10.0.bb => at-spi2-atk_2.12.0.bb} |    4 ++--
 ...-spi2-core_2.10.2.bb => at-spi2-core_2.12.0.bb} |    4 ++--
 .../atk/{atk_2.10.0.bb => atk_2.12.0.bb}           |    4 ++--
 .../curl/{curl_7.35.0.bb => curl_7.36.0.bb}        |    4 ++--
 8 files changed, 16 insertions(+), 16 deletions(-)
 rename meta/recipes-graphics/pango/{pango_1.36.2.bb => pango_1.36.3.bb} (56%)
 rename meta/recipes-support/atk/{at-spi2-atk_2.10.0.bb => at-spi2-atk_2.12.0.bb} (79%)
 rename meta/recipes-support/atk/{at-spi2-core_2.10.2.bb => at-spi2-core_2.12.0.bb} (77%)
 rename meta/recipes-support/atk/{atk_2.10.0.bb => atk_2.12.0.bb} (79%)
 rename meta/recipes-support/curl/{curl_7.35.0.bb => curl_7.36.0.bb} (93%)

-- 
1.7.9.5


