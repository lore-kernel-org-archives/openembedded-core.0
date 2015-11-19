Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C799A601B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 17:02:01 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Nov 2015 09:02:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,318,1444719600"; d="scan'208";a="854773732"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 19 Nov 2015 09:02:03 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 20CDC2E055B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 09:00:55 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Nov 2015 19:02:55 +0200
Message-Id: <1447952575-26935-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1447952575-26935-1-git-send-email-maxin.john@intel.com>
References: <1447952575-26935-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] libunistring: upgrade to version 0.9.6
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
X-List-Received-Date: Thu, 19 Nov 2015 17:02:02 -0000

0.9.5 -> 0.9.6

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libunistring/{libunistring_0.9.5.bb => libunistring_0.9.6.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libunistring/{libunistring_0.9.5.bb => libunistring_0.9.6.bb} (90%)

diff --git a/meta/recipes-support/libunistring/libunistring_0.9.5.bb b/meta/recipes-support/libunistring/libunistring_0.9.6.bb
similarity index 90%
rename from meta/recipes-support/libunistring/libunistring_0.9.5.bb
rename to meta/recipes-support/libunistring/libunistring_0.9.6.bb
index 45cf633..bb70122 100644
--- a/meta/recipes-support/libunistring/libunistring_0.9.5.bb
+++ b/meta/recipes-support/libunistring/libunistring_0.9.6.bb
@@ -21,8 +21,8 @@ SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz \
            file://iconv-m4-remove-the-test-to-convert-euc-jp.patch \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
 "
-SRC_URI[md5sum] = "1a705bcdcb83799d544137617b377cfd"
-SRC_URI[sha256sum] = "1a8c0772467850bef7197318a95f44abbb678ea83cbf119a3500cc7848276a17"
+SRC_URI[md5sum] = "dfae4ff5583649ed24d8f368f1d0543b"
+SRC_URI[sha256sum] = "9625eec2507f4789ebb6fc48ebda98be0e0168979a2f68aa8b680bf8eeabbd47"
 
 inherit autotools texinfo
 BBCLASSEXTEND = "native nativesdk"
-- 
2.4.0


