Return-Path: <irina.patru@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 447D86CD8E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 13:04:45 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Jan 2014 05:04:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,624,1384329600"; d="scan'208";a="435691436"
Received: from irina-vostro-460.rb.intel.com ([10.237.105.140])
	by orsmga001.jf.intel.com with ESMTP; 08 Jan 2014 05:04:44 -0800
From: Irina Patru <irina.patru@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2014 15:08:03 +0200
Message-Id: <cover.1389186276.git.irina.patru@intel.com>
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
X-List-Received-Date: Wed, 08 Jan 2014 13:04:45 -0000

The packages have been succesfully compiled for all major architectures.
Both packages were tested on a core-image-sato with midori browser on a nuc.

The following changes since commit e93a345fae7c21652547bec501fcb1f3b6c6427d:

  sstate: add do_package to the noexec list in setscene_depvalid (2014-01-07 13:58:32 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ipatru/upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ipatru/upgrades

Irina Patru (2):
  libtasn1: upgrade to 3.4
  libsoup-2.4: upgrade to 2.45.3

 .../gnutls/{libtasn1_3.3.bb => libtasn1_3.4.bb}    |    4 ++--
 ...libsoup-2.4_2.44.2.bb => libsoup-2.4_2.45.3.bb} |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/gnutls/{libtasn1_3.3.bb => libtasn1_3.4.bb} (82%)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.44.2.bb => libsoup-2.4_2.45.3.bb} (85%)

-- 
1.7.9.5


