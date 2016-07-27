Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id BF76E606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 13:03:48 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 27 Jul 2016 06:03:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,429,1464678000"; d="scan'208";a="1014825327"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 27 Jul 2016 06:03:50 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 370B46A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 06:03:38 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 16:02:56 +0300
Message-Id: <1469624577-24972-9-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1469624577-24972-1-git-send-email-maxin.john@intel.com>
References: <1469624577-24972-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 8/9] libassuan: upgrade to 2.4.3
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
X-List-Received-Date: Wed, 27 Jul 2016 13:03:48 -0000

2.4.2 -> 2.4.3

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libassuan/{libassuan_2.4.2.bb => libassuan_2.4.3.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libassuan/{libassuan_2.4.2.bb => libassuan_2.4.3.bb} (87%)

diff --git a/meta/recipes-support/libassuan/libassuan_2.4.2.bb b/meta/recipes-support/libassuan/libassuan_2.4.3.bb
similarity index 87%
rename from meta/recipes-support/libassuan/libassuan_2.4.2.bb
rename to meta/recipes-support/libassuan/libassuan_2.4.3.bb
index 92ec5c0..1b3916d 100644
--- a/meta/recipes-support/libassuan/libassuan_2.4.2.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.4.3.bb
@@ -16,8 +16,8 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libassuan/libassuan-${PV}.tar.bz2 \
 	   file://libassuan-add-pkgconfig-support.patch"
 
-SRC_URI[md5sum] = "70151995c2330ae1261c0a7ca34cf478"
-SRC_URI[sha256sum] = "bb06dc81380b74bf1b64d5849be5c0409a336f3b4c45f20ac688e86d1b5bcb20"
+SRC_URI[md5sum] = "8e01a7c72d3e5d154481230668e6eb5a"
+SRC_URI[sha256sum] = "22843a3bdb256f59be49842abf24da76700354293a066d82ade8134bb5aa2b71"
 
 BINCONFIG = "${bindir}/libassuan-config"
 
-- 
2.4.0


