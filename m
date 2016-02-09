Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E595F700F3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 09:08:30 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 09 Feb 2016 01:08:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,420,1449561600"; d="scan'208";a="908386097"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 09 Feb 2016 01:08:30 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org,
	nicolas.dechesne@linaro.org
Date: Tue,  9 Feb 2016 11:13:33 +0200
Message-Id: <cover.1455008560.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/4] Crypto dependency fixes
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
X-List-Received-Date: Tue, 09 Feb 2016 09:08:31 -0000

This is a followup to (but does not strictly depend on) Nicholas'
"[PATCH v2] mesa: upgrade 10.6.3 -> 11.1.1" patch.

It adds packageconfig for xorg-xserver SHA1 implementation, and removes
some unnecessary crypto dependencies.

 - Jussi


The following changes since commit 7d5d8d0cd985edf507c8d00e2e162d1b9fff3589:

  scripts/lib/bsp/engine: trailing whitespace cleanup (2016-02-08 10:54:56 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/crypto
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/crypto

Jussi Kukkonen (4):
  systemd: Don't depend on gcrypt unnecessarily
  wpa-supplicant: Only depend on libgcrypt when needed
  libsoup-2.4: Remove unnecessary gnutls dependency
  xserver-xorg: Add PACKAGECONFIG for crypto libraries

 .../wpa-supplicant/wpa-supplicant_2.5.bb                     |  4 ++--
 meta/recipes-core/systemd/systemd_228.bb                     |  3 ---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc          | 12 +++++++++---
 meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb           |  2 +-
 4 files changed, 12 insertions(+), 9 deletions(-)

-- 
2.1.4


