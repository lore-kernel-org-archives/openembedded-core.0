Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 5919879132
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 10:25:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Aug 2018 03:25:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,273,1531810800"; d="scan'208";a="67209835"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga008.jf.intel.com with ESMTP; 22 Aug 2018 03:25:34 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 2D5575802C8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 03:25:33 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 13:27:24 +0300
Message-Id: <1534933645-30369-6-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1534933645-30369-1-git-send-email-maxin.john@intel.com>
References: <1534933645-30369-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 5/6] acpid: upgrade 2.0.29 -> 2.0.30
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
X-List-Received-Date: Wed, 22 Aug 2018 10:25:33 -0000

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-bsp/acpid/{acpid_2.0.29.bb => acpid_2.0.30.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/acpid/{acpid_2.0.29.bb => acpid_2.0.30.bb} (55%)

diff --git a/meta/recipes-bsp/acpid/acpid_2.0.29.bb b/meta/recipes-bsp/acpid/acpid_2.0.30.bb
similarity index 55%
rename from meta/recipes-bsp/acpid/acpid_2.0.29.bb
rename to meta/recipes-bsp/acpid/acpid_2.0.30.bb
index 9258486..aa19d28 100644
--- a/meta/recipes-bsp/acpid/acpid_2.0.29.bb
+++ b/meta/recipes-bsp/acpid/acpid_2.0.30.bb
@@ -3,5 +3,5 @@ require acpid.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://acpid.h;endline=24;md5=324a9cf225ae69ddaad1bf9d942115b5"
 
-SRC_URI[md5sum] = "6dd58a35cac51bd9503d769f5d13d74d"
-SRC_URI[sha256sum] = "58503b27975c466e627eb741c5453dd662f97edef1a3d0aac822fd03a84203ff"
+SRC_URI[md5sum] = "1528040b5d34f8c24ebabd97befbf913"
+SRC_URI[sha256sum] = "28b77b62d3f64ebd1c2a3d16bccc6d4333b4e24a86aeacebec255fad223cf4cb"
-- 
2.4.0


