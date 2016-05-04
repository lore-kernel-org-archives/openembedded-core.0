Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C0AD0731BC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 08:20:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 04 May 2016 01:20:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,576,1455004800"; d="scan'208";a="945864648"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 04 May 2016 01:20:31 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id C84086A4007
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 02:08:04 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 May 2016 11:20:18 +0300
Message-Id: <1462350024-29932-5-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1462350024-29932-1-git-send-email-maxin.john@intel.com>
References: <1462350024-29932-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 04/10] libtasn1: upgrade to 4.8
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
X-List-Received-Date: Wed, 04 May 2016 08:20:31 -0000

4.7 -> 4.8

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/gnutls/{libtasn1_4.7.bb => libtasn1_4.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{libtasn1_4.7.bb => libtasn1_4.8.bb} (81%)

diff --git a/meta/recipes-support/gnutls/libtasn1_4.7.bb b/meta/recipes-support/gnutls/libtasn1_4.8.bb
similarity index 81%
rename from meta/recipes-support/gnutls/libtasn1_4.7.bb
rename to meta/recipes-support/gnutls/libtasn1_4.8.bb
index 7f08569..360d529 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.7.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.8.bb
@@ -12,8 +12,8 @@ SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
            "
 
-SRC_URI[md5sum] = "12d10ca4ae0a3b95f7aa06a076da39ec"
-SRC_URI[sha256sum] = "a40780dc93fc6d819170240e8ece25352058a85fd1d2347ce0f143667d8f11c9"
+SRC_URI[md5sum] = "9a6767705725544f2b86670dcfb34107"
+SRC_URI[sha256sum] = "fa802fc94d79baa00e7397cedf29eb6827d4bd8b4dd77b577373577c93a8c513"
 
 inherit autotools texinfo binconfig lib_package
 
-- 
2.4.0


