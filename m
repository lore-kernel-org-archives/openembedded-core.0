Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AAECC74197
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 20:07:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 01 Sep 2016 13:07:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,268,1470726000"; d="scan'208";a="1023868811"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga001.jf.intel.com with ESMTP; 01 Sep 2016 13:07:29 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Sep 2016 13:07:37 -0700
Message-Id: <1472760457-8822-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1472760457-8822-1-git-send-email-juro.bystricky@intel.com>
References: <1472760457-8822-1-git-send-email-juro.bystricky@intel.com>
Subject: [PATCH 1/1] glib: disable gtk-doc on mips64
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
X-List-Received-Date: Thu, 01 Sep 2016 20:07:29 -0000

Avoid build error
 .libs/./gobject-scan: Invalid ELF image for this architecture

when building for mips64

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 906e0d4..3a7e890 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -42,6 +42,7 @@ PRINTF_mingw32 = "--enable-included-printf=yes"
 EXTRA_OECONF = "${PRINTF} ${CORECONF}"
 EXTRA_OECONF_class-native = "${CORECONF} --disable-selinux"
 EXTRA_OECONF_append_libc-uclibc = " --with-libiconv=gnu"
+EXTRA_OECONF_append_mips64 = " --enable-gtk-doc=no"
 
 do_configure_prepend() {
 	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python3,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
-- 
2.7.4


