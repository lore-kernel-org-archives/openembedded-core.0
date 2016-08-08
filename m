Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8C2217718C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 11:12:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 08 Aug 2016 04:12:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,489,1464678000"; d="scan'208";a="1021578870"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 08 Aug 2016 04:12:14 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 8AB4E6A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 04:11:59 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 14:13:08 +0300
Message-Id: <1470654788-8717-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1470654788-8717-1-git-send-email-maxin.john@intel.com>
References: <1470654788-8717-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/3] nettle: update LICENSE info for version 2.7.1
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
X-List-Received-Date: Mon, 08 Aug 2016 11:12:13 -0000

LICENSE_${PN} shouldn't contain anything that is not specified in LICENSE.

[YOCTO #10075]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/nettle/nettle_2.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb b/meta/recipes-support/nettle/nettle_2.7.1.bb
index d4df0a3..ae8e311 100644
--- a/meta/recipes-support/nettle/nettle_2.7.1.bb
+++ b/meta/recipes-support/nettle/nettle_2.7.1.bb
@@ -1,6 +1,6 @@
 require nettle.inc
 
-LICENSE = "LGPLv2.1 & GPLv2"
+LICENSE = "LGPLv2.1+ & GPLv2"
 LICENSE_${PN} = "LGPLv2.1+"
 
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-- 
2.4.0


