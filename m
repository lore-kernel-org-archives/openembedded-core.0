Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E8BAC4706C
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 07:59:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.7926.1705391977627956449
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 23:59:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=eSXjrR7o;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705391977; x=1736927977;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DXqwMlqGD/UbwBGPTXSpht3fCFtMYhSNIgKU1dI541I=;
  b=eSXjrR7o72lokUnz/pSkFUbfhKdyCWaKL1e0k2odp2/aqEJUkdLdr53v
   N9AvJ20TmX7Qcxo6tE3wVgc2LizMNWS97pV7wfqfsh5nrF6nWRjb65LO9
   y8/lSvN7Ex47mvfQ0eR7433k6rJ23mykIzLN8MjZB2uo62ITgZAGrQK9W
   6kjtJ5ioqoo/+a71pXsz+YHoLq530L3UIh9ZfaCY64g5dY4c5OoHLPOan
   R+rd5KRDDAC5Uw6WR2bqWzvkudVb6mswPh4AZ+67WyGtmelInemFnXJEZ
   /Pf0e91wT9bfbQGHLDC/F5KQlbwhV/wKItAEX2q7Hp+tWEvztArH3PCel
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="396943060"
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; 
   d="scan'208";a="396943060"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 23:59:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="927368046"
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; 
   d="scan'208";a="927368046"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga001.fm.intel.com with ESMTP; 15 Jan 2024 23:59:36 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [nanbield][patch 1/2] xwayland: upgrade 23.2.2 -> 23.2.3
Date: Tue, 16 Jan 2024 15:30:55 +0800
Message-Id: <20240116073056.2506109-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 07:59:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193822

From: Wang Mingyu <wangmy@fujitsu.com>

upgrade include fix for CVE-2023-6377 CVE-2023-6478

(Cherry-pick from OE-Core rev: bf0bb7b94ed4930145af5f1fb3836157daceb6bb)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../xwayland/{xwayland_23.2.2.bb => xwayland_23.2.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_23.2.2.bb => xwayland_23.2.3.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.2.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.3.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_23.2.2.bb
rename to meta/recipes-graphics/xwayland/xwayland_23.2.3.bb
index 9feac147db..9aa7b4dfcd 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.2.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.3.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "9f7c0938d2a41e941ffa04f99c35e5db2bcd3eec034afe8d35d5c810a22eb0a8"
+SRC_URI[sha256sum] = "eb9d9aa7232c47412c8835ec15a97c575f03563726c787754ff0c019bd07e302"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.37.3


