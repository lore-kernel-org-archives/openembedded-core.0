Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1836A71A18
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 06:46:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v196k2K3022514
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 8 Feb 2017 22:46:02 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 8 Feb 2017 22:46:01 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Thu, 9 Feb 2017 01:45:40 -0500
Message-ID: <e74b085913c910215350efdf7865ada7055e46ed.1486622007.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1486622006.git.hongxu.jia@windriver.com>
References: <cover.1486622006.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/13] gnupg: 2.1.14 -> 2.1.18
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
X-List-Received-Date: Thu, 09 Feb 2017 06:46:04 -0000
Content-Type: text/plain

Update LIC_FILES_CHKSUM md5 checksum, because "http" has been
changed to "https".

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/gnupg/{gnupg_2.1.14.bb => gnupg_2.1.18.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.1.14.bb => gnupg_2.1.18.bb} (80%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.1.14.bb b/meta/recipes-support/gnupg/gnupg_2.1.18.bb
similarity index 80%
rename from meta/recipes-support/gnupg/gnupg_2.1.14.bb
rename to meta/recipes-support/gnupg/gnupg_2.1.18.bb
index 5ea9b96..a0611aa 100644
--- a/meta/recipes-support/gnupg/gnupg_2.1.14.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.1.18.bb
@@ -1,8 +1,8 @@
 SUMMARY = "GNU Privacy Guard - encryption and signing tools (2.x)"
 HOMEPAGE = "http://www.gnupg.org/"
 LICENSE = "GPLv3 & LGPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
-                    file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6"
+LIC_FILES_CHKSUM = "file://COPYING;md5=189af8afca6d6075ba6c9e0aa8077626 \
+                    file://COPYING.LIB;md5=a2b6bf2cb38ee52619e60f30a1fc7257"
 
 DEPENDS = "npth libassuan libksba zlib bzip2 readline libgcrypt"
 
@@ -16,8 +16,8 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://autogen.sh-fix-find-version-for-beta-checking.patch \
           "
 
-SRC_URI[md5sum] = "46cf0a42ffad6c2615cafd633580b2de"
-SRC_URI[sha256sum] = "9450dee9693b6a12bf0c374dae77b66c30f69ff8f35fc9266ab8dd76998eba42"
+SRC_URI[md5sum] = "c67f908b0b35c7ebc62144f362757e1e"
+SRC_URI[sha256sum] = "d04c6fab7e5562ce4b915b22020e34d4c1a256847690cf149842264fc7cef994"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.8.1


