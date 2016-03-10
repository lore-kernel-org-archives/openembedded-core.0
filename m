Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D7CD873195
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 16:46:24 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Mar 2016 08:46:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,316,1455004800"; d="scan'208";a="907123729"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 10 Mar 2016 08:46:12 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 7C7CF2C8001
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 09:33:58 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Mar 2016 13:56:12 +0200
Message-Id: <1457610972-10872-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1457610972-10872-1-git-send-email-maxin.john@intel.com>
References: <1457610972-10872-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] eudev: provide UPSTREAM_CHECK_URI
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
X-List-Received-Date: Thu, 10 Mar 2016 16:46:25 -0000

Provide UPSTREAM_CHECK_URI to perform checkpkg task.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-core/udev/eudev_3.1.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/udev/eudev_3.1.5.bb b/meta/recipes-core/udev/eudev_3.1.5.bb
index ffcebcd..e94e0dc 100644
--- a/meta/recipes-core/udev/eudev_3.1.5.bb
+++ b/meta/recipes-core/udev/eudev_3.1.5.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://github.com/gentoo/${BPN}/archive/v${PV}.tar.gz \
            file://udev-cache.default \
            file://udev.rules \
 "
+UPSTREAM_CHECK_URI = "https://github.com/gentoo/eudev/releases"
 
 SRC_URI[md5sum] = "e130f892d8744e292cb855db79935f68"
 SRC_URI[sha256sum] = "ce9d5fa91e3a42c7eb95512ca0fa2a631e89833053066bb6cdf42046b2a88553"
-- 
2.4.0


