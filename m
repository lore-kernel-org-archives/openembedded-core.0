Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id B3518780C3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 15:10:42 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP; 12 Jun 2017 08:10:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,333,1493708400"; d="scan'208";a="113358564"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 12 Jun 2017 08:10:43 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id C10895806E6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 08:10:42 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Jun 2017 18:10:20 +0300
Message-Id: <1497280222-11549-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 0/2] [RFC] fix systemd-resolved and connman boot in read only rootfs
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
X-List-Received-Date: Mon, 12 Jun 2017 15:10:42 -0000

1. Enable systemd-resolved and systemd-networkd by default
2. Fix systemd-resolved in read only rootfs
3. Fix connman for read-only rootfs
4. Resolve the conflict with systemd-resolved and connman

Maxin B. John (2):
  systemd: enable resolved and networkd
  connman: correct the systemd boot in read only rootfs

 meta/recipes-connectivity/connman/connman.inc      | 15 ++++++++++-
 ...vice-stop-systemd-resolved-when-we-use-co.patch | 29 ++++++++++++++++++++++
 meta/recipes-connectivity/connman/connman_1.34.bb  |  1 +
 meta/recipes-core/systemd/systemd_232.bb           | 13 +++++++---
 4 files changed, 54 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-connman.service-stop-systemd-resolved-when-we-use-co.patch

-- 
2.4.0


