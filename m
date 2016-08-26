Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 57DF477139
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 14:30:49 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP; 26 Aug 2016 07:30:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,581,1464678000"; 
   d="scan'208";a="1525621"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by orsmga004.jf.intel.com with ESMTP; 26 Aug 2016 07:30:49 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 17:28:39 +0300
Message-Id: <1e56c2151d52a8be46a0d9800223b64138380fea.1472221205.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 24/28] gnutls: enable gtk-doc
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
X-List-Received-Date: Fri, 26 Aug 2016 14:30:49 -0000

gtk-doc also requires --enable-doc, so that is no longer configurable.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/gnutls/gnutls.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 0ac7c37..51b9d2b 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -19,11 +19,10 @@ SHRT_VER = "${@d.getVar('PV', True).split('.')[0]}.${@d.getVar('PV', True).split
 
 SRC_URI = "ftp://ftp.gnutls.org/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz"
 
-inherit autotools texinfo binconfig pkgconfig gettext lib_package
+inherit autotools texinfo binconfig pkgconfig gettext lib_package gtk-doc
 
 PACKAGECONFIG ??= "libidn zlib"
 
-PACKAGECONFIG[docs] = "--enable-doc,--disable-doc"
 PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn"
 PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
 PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
@@ -31,6 +30,7 @@ PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
 PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
 
 EXTRA_OECONF = " \
+    --enable-doc \
     --disable-libdane \
     --disable-guile \
     --disable-rpath \
-- 
2.9.3


