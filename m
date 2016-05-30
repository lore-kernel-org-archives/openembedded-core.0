Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 62FCC77221
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 15:20:32 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 30 May 2016 08:20:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,390,1459839600"; d="scan'208";a="711112999"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 30 May 2016 08:20:32 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 0A18B6A4007
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 09:08:00 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 May 2016 18:20:23 +0300
Message-Id: <1464621623-16991-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1464621623-16991-1-git-send-email-maxin.john@intel.com>
References: <1464621623-16991-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] bluez5: update to 5.40
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
X-List-Received-Date: Mon, 30 May 2016 15:20:32 -0000

5.39 -> 5.40

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-connectivity/bluez5/{bluez5_5.39.bb => bluez5_5.40.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.39.bb => bluez5_5.40.bb} (89%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.39.bb b/meta/recipes-connectivity/bluez5/bluez5_5.40.bb
similarity index 89%
rename from meta/recipes-connectivity/bluez5/bluez5_5.39.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.40.bb
index b38d983..1350095 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.39.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.40.bb
@@ -2,8 +2,8 @@ require bluez5.inc
 
 REQUIRED_DISTRO_FEATURES = "bluez5"
 
-SRC_URI[md5sum] = "c0c2b8d1151c7538bf3ae7bfc78aa912"
-SRC_URI[sha256sum] = "21d1bc9150d3576296595217efb98a746b592389d25d5637e8bee5da7272593b"
+SRC_URI[md5sum] = "eb24c0d9eaeb1fb69833f322ec669e8b"
+SRC_URI[sha256sum] = "dada8b812055afcad4546d9966f9a763e4723169e89706e2b240c7b7e998dc27"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
-- 
2.4.0


