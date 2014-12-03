Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 747D6601F5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 08:07:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sB387fY7004366
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 3 Dec 2014 00:07:42 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 3 Dec 2014 00:07:41 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 3 Dec 2014 16:07:35 +0800
Message-ID: <14a00df7bc4193c9207629a11bb1b40d936f16b2.1417593851.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1417593851.git.hongxu.jia@windriver.com>
References: <cover.1417593851.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] Revert "busybox : fix do_compile failed on qemumips when DEBUG_BUILD (ICE)"
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
X-List-Received-Date: Wed, 03 Dec 2014 08:07:46 -0000
Content-Type: text/plain

Since the gcc has resolved this, so we revert the workaround patch.

This reverts commit f026b7a211a44acdb7fadb50b1a84aa3e369450a.
---
 meta/recipes-core/busybox/busybox_1.22.1.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox_1.22.1.bb b/meta/recipes-core/busybox/busybox_1.22.1.bb
index 7a50a30..8879e52 100644
--- a/meta/recipes-core/busybox/busybox_1.22.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.22.1.bb
@@ -34,10 +34,6 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://busybox-cross-menuconfig.patch \
 "
 
-SRC_URI_append_mips = " \
-    ${@base_conditional( "DEBUG_BUILD", "1", "file://fix-ice-on-mips-while-compiling-with-g-O.patch", "", d )} \
-"
-
 SRC_URI[tarball.md5sum] = "337d1a15ab1cb1d4ed423168b1eb7d7e"
 SRC_URI[tarball.sha256sum] = "ae0b029d0a9e4dd71a077a790840e496dd838998e4571b87b60fed7462b6678b"
 
-- 
1.9.1


