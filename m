Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id A582274C83
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 13:40:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 06:40:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,406,1517904000"; d="scan'208";a="30962000"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga008.jf.intel.com with ESMTP; 04 Apr 2018 06:40:22 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 8144D5801FC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 06:40:21 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 16:40:35 +0300
Message-Id: <1522849238-7472-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1522849238-7472-1-git-send-email-maxin.john@intel.com>
References: <1522849238-7472-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/5] python3-pygobject: remove duplication in inherit
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
X-List-Received-Date: Wed, 04 Apr 2018 13:40:21 -0000

Since gnomebase class already inherits autotools and pkgconfig,
there is no need to repeat it here.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-devtools/python/python3-pygobject_3.28.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.28.1.bb b/meta/recipes-devtools/python/python3-pygobject_3.28.1.bb
index ad0117a..97286f4 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.28.1.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.28.1.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
-inherit autotools pkgconfig gnomebase distutils3-base gobject-introspection upstream-version-is-even
+inherit gnomebase distutils3-base gobject-introspection upstream-version-is-even
 
 DEPENDS += "python3 glib-2.0"
 
-- 
2.4.0


