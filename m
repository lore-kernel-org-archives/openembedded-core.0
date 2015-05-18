Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 18AA765D6E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 23:28:41 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 18 May 2015 16:28:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,455,1427785200"; d="scan'208";a="712140368"
Received: from ihoshino-mobl.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.255.86.199])
	by fmsmga001.fm.intel.com with ESMTP; 18 May 2015 16:28:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 18 May 2015 16:28:37 -0700
Message-Id: <1431991720-19892-3-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1431991720-19892-1-git-send-email-sgw@linux.intel.com>
References: <1431991720-19892-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/5] libksba: Upgrade to 1.3.3
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
X-List-Received-Date: Mon, 18 May 2015 23:28:42 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/libksba/{libksba_1.3.2.bb => libksba_1.3.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libksba/{libksba_1.3.2.bb => libksba_1.3.3.bb} (86%)

diff --git a/meta/recipes-support/libksba/libksba_1.3.2.bb b/meta/recipes-support/libksba/libksba_1.3.3.bb
similarity index 86%
rename from meta/recipes-support/libksba/libksba_1.3.2.bb
rename to meta/recipes-support/libksba/libksba_1.3.3.bb
index cce08c3..bc21164 100644
--- a/meta/recipes-support/libksba/libksba_1.3.2.bb
+++ b/meta/recipes-support/libksba/libksba_1.3.3.bb
@@ -16,8 +16,8 @@ inherit autotools binconfig-disabled pkgconfig texinfo
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://ksba-add-pkgconfig-support.patch"
 
-SRC_URI[md5sum] = "c3c9a66e22d87fe3ae59865250b8a09c"
-SRC_URI[sha256sum] = "eb95537955dfc2845690a4cc3836074fa6d0a2c2ca2cbf1759364d3bd9868406"
+SRC_URI[md5sum] = "a5dd3c57fca254935f5cf8db26e39065"
+SRC_URI[sha256sum] = "0c7f5ffe34d0414f6951d9880a46fcc2985c487f7c36369b9f11ad41131c7786"
 
 do_configure_prepend () {
 	# Else these could be used in preference to those in aclocal-copy
-- 
2.1.0


