Return-Path: <maxin.john@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 39A0771B8E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2016 11:29:20 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP; 23 Oct 2016 04:29:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,388,1473145200"; d="scan'208";a="22731945"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 23 Oct 2016 04:29:22 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id CD3576A4080
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2016 04:28:48 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Oct 2016 14:29:52 +0300
Message-Id: <1477222197-3698-5-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1477222197-3698-1-git-send-email-maxin.john@intel.com>
References: <1477222197-3698-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 05/10] acpid: Upgrade 2.0.27 -> 2.0.28
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
X-List-Received-Date: Sun, 23 Oct 2016 11:29:23 -0000

Bug fix release

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-bsp/acpid/{acpid_2.0.27.bb => acpid_2.0.28.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/acpid/{acpid_2.0.27.bb => acpid_2.0.28.bb} (55%)

diff --git a/meta/recipes-bsp/acpid/acpid_2.0.27.bb b/meta/recipes-bsp/acpid/acpid_2.0.28.bb
similarity index 55%
rename from meta/recipes-bsp/acpid/acpid_2.0.27.bb
rename to meta/recipes-bsp/acpid/acpid_2.0.28.bb
index 509fcfe..686526f 100644
--- a/meta/recipes-bsp/acpid/acpid_2.0.27.bb
+++ b/meta/recipes-bsp/acpid/acpid_2.0.28.bb
@@ -3,5 +3,5 @@ require acpid.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://acpid.h;endline=24;md5=324a9cf225ae69ddaad1bf9d942115b5"
 
-SRC_URI[md5sum] = "e41bdf628e122edb4342fca432ea7db9"
-SRC_URI[sha256sum] = "820c223e53cc11d9d7229fb1ffc2c2205f1054082c80f83f5a4ec4df16d3a616"
+SRC_URI[md5sum] = "0432407b5ff75ae8e08afb43052fde2b"
+SRC_URI[sha256sum] = "980c3a54b0d3f2fd49fd845a0584c5c2abeaab9e9ac09fcbb68686bbb57a7110"
-- 
2.4.0


