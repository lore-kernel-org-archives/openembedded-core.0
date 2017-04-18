Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A6E886E650
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 11:09:40 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Apr 2017 04:09:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,219,1488873600"; d="scan'208";a="88814499"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 18 Apr 2017 04:09:41 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 47A156A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 04:09:30 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Apr 2017 14:09:51 +0300
Message-Id: <1492513791-18089-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] pixbufcache.bbclass: update postinst script name
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
X-List-Received-Date: Tue, 18 Apr 2017 11:09:40 -0000

The name of postinst scripts created by pixbufcache class
contains "useradd" in it. Remove it to avoid confusion.

As suggested by RP.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/classes/pixbufcache.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index aa9815c..b3e507f 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -57,7 +57,7 @@ SYSROOT_PREPROCESS_FUNCS_append_class-native = " pixbufcache_sstate_postinst"
 # See base.bbclass for the other half of this
 pixbufcache_sstate_postinst() {
 	mkdir -p ${SYSROOT_DESTDIR}${bindir}
-	dest=${SYSROOT_DESTDIR}${bindir}/postinst-useradd-${PN}
+	dest=${SYSROOT_DESTDIR}${bindir}/postinst-${PN}
         echo '#!/bin/sh' > $dest
 	echo "${gdkpixbuf_complete}" >> $dest
 	chmod 0755 $dest
-- 
2.4.0


