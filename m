Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EFCEB76FF2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 20:20:36 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Sep 2015 13:20:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,463,1437462000"; d="scan'208";a="797304142"
Received: from rjrao-mobl5.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.254.87.125])
	by orsmga002.jf.intel.com with ESMTP; 03 Sep 2015 13:20:36 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, gabrbedd@gmail.com
Date: Thu,  3 Sep 2015 13:20:35 -0700
Message-Id: <1441311635-6303-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH][master/fido/dizzy] oprofileui: Use inherit gettext
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
X-List-Received-Date: Thu, 03 Sep 2015 20:20:39 -0000

oprofileui uses gettext during the configuration task so should be inherit
gettext. This issue appears when an older version of gettext is used do to
pinning to the older non-gplv3 version.

[YOCTO #7795]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-kernel/oprofile/oprofileui.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/oprofile/oprofileui.inc b/meta/recipes-kernel/oprofile/oprofileui.inc
index 1dfd0c6..8fcf014 100644
--- a/meta/recipes-kernel/oprofile/oprofileui.inc
+++ b/meta/recipes-kernel/oprofile/oprofileui.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "glib-2.0 avahi intltool-native"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig gettext
 
 EXTRA_OECONF = "--with-avahi"
 
-- 
2.1.0


