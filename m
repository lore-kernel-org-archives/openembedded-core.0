Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0708D72952
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 15:42:38 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 06 Jan 2015 07:42:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="508183847"
Received: from unknown (HELO localhost.intel.com) ([10.252.252.96])
	by orsmga003.jf.intel.com with ESMTP; 06 Jan 2015 07:36:59 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Jan 2015 07:42:20 -0800
Message-Id: <5caba30858e6771336cd575f160822584a53601f.1420558836.git.sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1420558836.git.sgw@linux.intel.com>
References: <cover.1420558836.git.sgw@linux.intel.com>
In-Reply-To: <cover.1420558836.git.sgw@linux.intel.com>
References: <cover.1420558836.git.sgw@linux.intel.com>
Subject: [PATCH 10/12] libksba: Upgrade to 1.3.2
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
X-List-Received-Date: Tue, 06 Jan 2015 15:42:38 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/libksba/{libksba_1.3.1.bb => libksba_1.3.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libksba/{libksba_1.3.1.bb => libksba_1.3.2.bb} (86%)

diff --git a/meta/recipes-support/libksba/libksba_1.3.1.bb b/meta/recipes-support/libksba/libksba_1.3.2.bb
similarity index 86%
rename from meta/recipes-support/libksba/libksba_1.3.1.bb
rename to meta/recipes-support/libksba/libksba_1.3.2.bb
index 6950dbb..cce08c3 100644
--- a/meta/recipes-support/libksba/libksba_1.3.1.bb
+++ b/meta/recipes-support/libksba/libksba_1.3.2.bb
@@ -16,8 +16,8 @@ inherit autotools binconfig-disabled pkgconfig texinfo
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://ksba-add-pkgconfig-support.patch"
 
-SRC_URI[md5sum] = "9be95245fcfa9d56f56853078ef2650b"
-SRC_URI[sha256sum] = "bc96b95516bd2b67f413bc8b5cc5a75a2583c6e666d24dfd0d5bcc6b1aab46f9"
+SRC_URI[md5sum] = "c3c9a66e22d87fe3ae59865250b8a09c"
+SRC_URI[sha256sum] = "eb95537955dfc2845690a4cc3836074fa6d0a2c2ca2cbf1759364d3bd9868406"
 
 do_configure_prepend () {
 	# Else these could be used in preference to those in aclocal-copy
-- 
2.1.0


