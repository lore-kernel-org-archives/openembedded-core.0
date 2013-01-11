Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ttnsr-0007xW-DV
	for openembedded-core@lists.openembedded.org;
	Sat, 12 Jan 2013 00:20:24 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jan 2013 15:03:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,455,1355126400"; d="scan'208";a="245446300"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.194])
	by orsmga001.jf.intel.com with ESMTP; 11 Jan 2013 15:04:16 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Jan 2013 15:04:16 -0800
Message-Id: <1357945456-6132-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH] xz: LICENSE field is wrong
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jan 2013 23:20:26 -0000

xz contains a GPLv3 m4 macro which is used at build time, this does not make
the installed or runtime items GPLv3, which is what the LICESNE field pertains
to, therefor remove it from the LICENSE field.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/xz/xz_5.1.2alpha.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/xz/xz_5.1.2alpha.bb b/meta/recipes-extended/xz/xz_5.1.2alpha.bb
index 9d68720..93099b0 100644
--- a/meta/recipes-extended/xz/xz_5.1.2alpha.bb
+++ b/meta/recipes-extended/xz/xz_5.1.2alpha.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "utils for managing LZMA compressed files"
 HOMEPAGE = "http://tukaani.org/xz/"
 SECTION = "base"
 
-LICENSE = "GPLv2+ & GPLv3+ & LGPLv2.1+"
+LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c475b6c7dca236740ace4bba553e8e1c \
                     file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
-- 
1.8.0.2



