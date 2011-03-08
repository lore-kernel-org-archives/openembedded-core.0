Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PwkrA-0002Nt-G1
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Mar 2011 01:32:58 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Mar 2011 16:31:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,280,1297065600"; d="scan'208";a="717410561"
Received: from unknown (HELO localhost) ([10.255.12.99])
	by orsmga001.jf.intel.com with ESMTP; 07 Mar 2011 16:29:36 -0800
Message-Id: <ae913c11529a6ba4cd84dcc866932c115dbb4968.1299544029.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299544029.git.sgw@linux.intel.com>
References: <cover.1299544029.git.sgw@linux.intel.com>
Old-Date: Mon, 7 Mar 2011 17:53:47 +0100
Date: Mon, 07 Mar 2011 16:29:36 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Tue, 08 Mar 2011 08:18:44 +0100
Cc: Koen Kooi <koen@dominion.thruhere.net>, Liping Ke <liping.ke@intel.com>,
	Dongxiao Xu <dongxiao.xu@intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>
Subject: [PATCH 7/8] libgpg-error: extend to nativesdk to catch up with metadata changes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Mar 2011 00:32:58 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

libgpg-error was introduced into the dependency tree for meta-toolchain-qte without the needed nativesdk extend

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../libgpg-error/libgpg-error_1.9.bb               |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.9.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.9.bb
index 479a11f..5e474cd 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.9.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.9.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 
 SECTION = "libs"
-DEPENDS = "gettext"
 PR = "r0"
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-${PV}.tar.bz2 \
@@ -23,4 +22,6 @@ SRC_URI[sha256sum] = "54d9326bfbd46c705963c507953f65a40576d04b374e131008dc5b732f
 FILES_${PN} = "${libdir}/lib*.so.*"
 FILES_${PN}-dev += "${bindir}/*"
 
-inherit autotools binconfig pkgconfig
+inherit gettext autotools binconfig pkgconfig
+
+BBCLASSEXTEND = "nativesdk"
-- 
1.7.1.1



