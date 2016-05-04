Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 512626FEF5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 08:20:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 04 May 2016 01:20:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,576,1455004800"; d="scan'208";a="968335374"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 04 May 2016 01:20:32 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 71D8F6A4007
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 02:08:06 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 May 2016 11:20:19 +0300
Message-Id: <1462350024-29932-6-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1462350024-29932-1-git-send-email-maxin.john@intel.com>
References: <1462350024-29932-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 05/10] bluez5: upgrade to 5.39
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

5.37 -> 5.39

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-connectivity/bluez5/{bluez5_5.37.bb => bluez5_5.39.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.37.bb => bluez5_5.39.bb} (89%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.37.bb b/meta/recipes-connectivity/bluez5/bluez5_5.39.bb
similarity index 89%
rename from meta/recipes-connectivity/bluez5/bluez5_5.37.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.39.bb
index db20f79..57ebbf9 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.37.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.39.bb
@@ -2,8 +2,8 @@ require bluez5.inc
 
 REQUIRED_DISTRO_FEATURES = "bluez5"
 
-SRC_URI[md5sum] = "33177e5743e24b2b3738f72be64e3ffb"
-SRC_URI[sha256sum] = "c14ba9ddcb0055522073477b8fd8bf1ddf5d219e75fdfd4699b7e0ce5350d6b0"
+SRC_URI[md5sum] = "c0c2b8d1151c7538bf3ae7bfc78aa912"
+SRC_URI[sha256sum] = "21d1bc9150d3576296595217efb98a746b592389d25d5637e8bee5da7272593b"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
-- 
2.4.0


