Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 28541610D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 06:41:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Dec 2013 22:41:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,518,1384329600"; d="scan'208";a="455317861"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.132])
	by orsmga002.jf.intel.com with ESMTP; 19 Dec 2013 22:41:09 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2013 22:41:06 -0800
Message-Id: <1387521668-26329-3-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1387521668-26329-1-git-send-email-sgw@linux.intel.com>
References: <1387521668-26329-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/4] beecrypt: Allow PACKAGECONFIG to be overridden
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
X-List-Received-Date: Fri, 20 Dec 2013 06:41:10 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
index a917201..5874f9e 100644
--- a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
+++ b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
@@ -27,7 +27,7 @@ do_install_append() {
 
 EXTRA_OECONF="--without-python --enable-shared --enable-static --disable-openmp --with-java=no"
 
-PACKAGECONFIG = ""
+PACKAGECONFIG ??= ""
 PACKAGECONFIG[cplusplus] = "--with-cplusplus,--without-cplusplus,icu"
 
 FILES_${PN} = "${sysconfdir} ${libdir}/*.so.* ${libdir}/${BPN}/*.so.*"
-- 
1.8.3.1


