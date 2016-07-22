Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7DB896080F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 11:03:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 22 Jul 2016 04:03:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,404,1464678000"; d="scan'208";a="1000447444"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 22 Jul 2016 04:03:41 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id DBEBB6A4006
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 04:03:30 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2016 09:09:27 +0300
Message-Id: <1469167768-9827-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1469167768-9827-1-git-send-email-maxin.john@intel.com>
References: <1469167768-9827-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/3] bluez5: upgrade to 5.41
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
X-List-Received-Date: Fri, 22 Jul 2016 11:03:41 -0000

5.40 -> 5.41

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-connectivity/bluez5/{bluez5_5.40.bb => bluez5_5.41.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.40.bb => bluez5_5.41.bb} (89%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.40.bb b/meta/recipes-connectivity/bluez5/bluez5_5.41.bb
similarity index 89%
rename from meta/recipes-connectivity/bluez5/bluez5_5.40.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.41.bb
index 1350095..522aab7 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.40.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.41.bb
@@ -2,8 +2,8 @@ require bluez5.inc
 
 REQUIRED_DISTRO_FEATURES = "bluez5"
 
-SRC_URI[md5sum] = "eb24c0d9eaeb1fb69833f322ec669e8b"
-SRC_URI[sha256sum] = "dada8b812055afcad4546d9966f9a763e4723169e89706e2b240c7b7e998dc27"
+SRC_URI[md5sum] = "318341b2188698130adb73236ee69244"
+SRC_URI[sha256sum] = "df7dc4462494dad4e60a2943240d584f6e760235dca64f5f10eba46dbab7f5f0"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
-- 
2.4.0


