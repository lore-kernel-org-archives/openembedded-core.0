Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id E96AD74D18
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 13:40:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 06:40:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,406,1517904000"; d="scan'208";a="30962001"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga008.jf.intel.com with ESMTP; 04 Apr 2018 06:40:23 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 825085801FC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 06:40:22 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 16:40:36 +0300
Message-Id: <1522849238-7472-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1522849238-7472-1-git-send-email-maxin.john@intel.com>
References: <1522849238-7472-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/5] libcroco: remove duplication in inherit
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
X-List-Received-Date: Wed, 04 Apr 2018 13:40:22 -0000

Since gnomebase class already inherits autotools and pkgconfig,
there is no need to repeat it here.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/libcroco/libcroco_0.6.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libcroco/libcroco_0.6.12.bb b/meta/recipes-support/libcroco/libcroco_0.6.12.bb
index 465ed15..d86ddd6 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.12.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.12.bb
@@ -14,7 +14,7 @@ EXTRA_OECONF += "--enable-Bsymbolic=auto"
 
 BINCONFIG = "${bindir}/croco-0.6-config"
 
-inherit autotools pkgconfig gnomebase gtk-doc binconfig-disabled
+inherit gnomebase gtk-doc binconfig-disabled
 
 SRC_URI[archive.md5sum] = "bc0984fce078ba2ce29f9500c6b9ddce"
 SRC_URI[archive.sha256sum] = "ddc4b5546c9fb4280a5017e2707fbd4839034ed1aba5b7d4372212f34f84f860"
-- 
2.4.0


