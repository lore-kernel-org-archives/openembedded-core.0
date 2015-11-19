Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8C1F96010B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 17:01:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Nov 2015 09:02:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,318,1444719600"; d="scan'208";a="854773621"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 19 Nov 2015 09:02:01 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 376F22E055B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 09:00:53 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Nov 2015 19:02:54 +0200
Message-Id: <1447952575-26935-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/2] libtasn1: upgrade to 4.7
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
X-List-Received-Date: Thu, 19 Nov 2015 17:02:00 -0000

4.5 -> 4.7

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/gnutls/{libtasn1_4.5.bb => libtasn1_4.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{libtasn1_4.5.bb => libtasn1_4.7.bb} (81%)

diff --git a/meta/recipes-support/gnutls/libtasn1_4.5.bb b/meta/recipes-support/gnutls/libtasn1_4.7.bb
similarity index 81%
rename from meta/recipes-support/gnutls/libtasn1_4.5.bb
rename to meta/recipes-support/gnutls/libtasn1_4.7.bb
index f874574..7f08569 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.5.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.7.bb
@@ -12,8 +12,8 @@ SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
            "
 
-SRC_URI[md5sum] = "81d272697545e82d39f6bd14854b68f0"
-SRC_URI[sha256sum] = "89b3b5dce119273431544ecb305081f3530911001bb12e5d76588907edb71bda"
+SRC_URI[md5sum] = "12d10ca4ae0a3b95f7aa06a076da39ec"
+SRC_URI[sha256sum] = "a40780dc93fc6d819170240e8ece25352058a85fd1d2347ce0f143667d8f11c9"
 
 inherit autotools texinfo binconfig lib_package
 
-- 
2.4.0


