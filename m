Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 1188571DB8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 13:23:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 31 Jan 2017 05:23:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,315,1477983600"; d="scan'208";a="37757802"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 31 Jan 2017 05:23:31 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 15:23:27 +0200
Message-Id: <20170131132330.4422-1-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH 0/3] Build dependency fixes
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
X-List-Received-Date: Tue, 31 Jan 2017 13:23:33 -0000

Bunch of one-liners fixing build dependency issues uncovered after recipe
specific sysroots were enabled. I bumped into these when trying to build
core-image-sato in a rather minimal host environment.

Markus Lehtonen (3):
  rpm: inherit pkgconfig
  wpa-supplicant: inherit pkgconfig
  at-spi2-atk: depend on glib-2.0-native

 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.6.bb | 2 +-
 meta/recipes-devtools/rpm/rpm_5.4.16.bb                        | 2 +-
 meta/recipes-support/atk/at-spi2-atk_2.22.0.bb                 | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.10.2


