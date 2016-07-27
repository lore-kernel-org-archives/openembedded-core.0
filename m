Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C015B606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 13:03:37 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 27 Jul 2016 06:03:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,429,1464678000"; d="scan'208";a="1014825247"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 27 Jul 2016 06:03:38 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 356BD6A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 06:03:26 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 16:02:49 +0300
Message-Id: <1469624577-24972-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1469624577-24972-1-git-send-email-maxin.john@intel.com>
References: <1469624577-24972-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 1/9] connman: upgrade to 1.33
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
X-List-Received-Date: Wed, 27 Jul 2016 13:03:38 -0000

1.32 -> 1.33

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../recipes-connectivity/connman/{connman_1.32.bb => connman_1.33.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.32.bb => connman_1.33.bb} (76%)

diff --git a/meta/recipes-connectivity/connman/connman_1.32.bb b/meta/recipes-connectivity/connman/connman_1.33.bb
similarity index 76%
rename from meta/recipes-connectivity/connman/connman_1.32.bb
rename to meta/recipes-connectivity/connman/connman_1.33.bb
index 532b17c..b31b146 100644
--- a/meta/recipes-connectivity/connman/connman_1.32.bb
+++ b/meta/recipes-connectivity/connman/connman_1.33.bb
@@ -8,8 +8,8 @@ SRC_URI_append_libc-musl = "file://0002-resolve-musl-does-not-implement-res_nini
                             file://0003-Fix-header-inclusions-for-musl.patch \
                            "
 
-SRC_URI[md5sum] = "d0c3071c1d8dec9cd17b760f862de2ad"
-SRC_URI[sha256sum] = "3185864c73206a6033d12e9f583689dcd03f714a40a58333709d3f74a4e0934c"
+SRC_URI[md5sum] = "c51903fd3e7a6a371d12ac5d72a1fa01"
+SRC_URI[sha256sum] = "bc8946036fa70124d663136f9f6b6238d897ca482782df907b07a428b09df5a0"
 
 RRECOMMENDS_${PN} = "connman-conf"
 
-- 
2.4.0


