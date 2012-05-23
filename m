Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <valentin.popa@intel.com>) id 1SX9Uv-000566-Ag
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 13:12:57 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 23 May 2012 04:01:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="103275292"
Received: from valentin-linux (HELO localhost.localdomain) ([10.237.104.217])
	by AZSMGA002.ch.intel.com with ESMTP; 23 May 2012 04:01:39 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 14:08:58 +0300
Message-Id: <1337771338-12407-1-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] xz: updated to version 5.1.1alpha
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
X-List-Received-Date: Wed, 23 May 2012 11:12:57 -0000

From: valentin <valentin@valentin-linux.(none)>

The licenses are the same, only some white
spaces added/removed.

Signed-off-by: valentin <valentin.popa@intel.com>
---
 .../xz/{xz_5.0.3.bb => xz_5.1.1alpha.bb}           |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/xz/{xz_5.0.3.bb => xz_5.1.1alpha.bb} (72%)

diff --git a/meta/recipes-extended/xz/xz_5.0.3.bb b/meta/recipes-extended/xz/xz_5.1.1alpha.bb
similarity index 72%
rename from meta/recipes-extended/xz/xz_5.0.3.bb
rename to meta/recipes-extended/xz/xz_5.1.1alpha.bb
index e8f96b6..7fa7177 100644
--- a/meta/recipes-extended/xz/xz_5.0.3.bb
+++ b/meta/recipes-extended/xz/xz_5.1.1alpha.bb
@@ -4,17 +4,17 @@ SECTION = "base"
 
 LICENSE = "GPLv2+ & GPLv3+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c475b6c7dca236740ace4bba553e8e1c \
-                    file://COPYING.GPLv2;md5=751419260aa954499f7abaabaa882bbe \
+                    file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://COPYING.LGPLv2.1;md5=fbc093901857fcd118f065f900982c24 \
+                    file://COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c \
                     file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 "
 
 SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "fefe52f9ecd521de2a8ce38c21a27574"
-SRC_URI[sha256sum] = "10eb4df72dffb2fb14c3d2d82b450e72282ffcb9ee3908a8e5b392b8f09681bf"
+SRC_URI[md5sum] = "bb24436fa12780808e1c142980484104"
+SRC_URI[sha256sum] = "54e59a83690a4a0ec88a7d7c3bdef90c6b196c892a93463863c71c24fe87951a"
 
-PR = "r1"
+PR = "r0"
 
 inherit autotools gettext
 
-- 
1.7.9.5



