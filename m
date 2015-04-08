Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 640F073D2F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 10:24:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t38AO526021358
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Apr 2015 03:24:05 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 8 Apr 2015 03:24:05 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Apr 2015 18:24:10 +0800
Message-ID: <a8b6e39f2cfc6761a1c26a4516acc99120e025ea.1428488582.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1428488582.git.Qi.Chen@windriver.com>
References: <cover.1428488582.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] busybox: upgrade to 1.23.2
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
X-List-Received-Date: Wed, 08 Apr 2015 10:24:04 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/busybox/{busybox_1.23.1.bb => busybox_1.23.2.bb} | 4 ++--
 meta/recipes-core/busybox/busybox_git.bb                           | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-core/busybox/{busybox_1.23.1.bb => busybox_1.23.2.bb} (90%)

diff --git a/meta/recipes-core/busybox/busybox_1.23.1.bb b/meta/recipes-core/busybox/busybox_1.23.2.bb
similarity index 90%
rename from meta/recipes-core/busybox/busybox_1.23.1.bb
rename to meta/recipes-core/busybox/busybox_1.23.2.bb
index 1742390..0af292d 100644
--- a/meta/recipes-core/busybox/busybox_1.23.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.23.2.bb
@@ -33,8 +33,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2014-9645_busybox_reject_module_names_with_slashes.patch \
 "
 
-SRC_URI[tarball.md5sum] = "5c94d6301a964cd91619bd4d74605245"
-SRC_URI[tarball.sha256sum] = "300f1db0a7ca4ecee8f8d8027aba250b903372e8339b7d9123d37c1e900473bf"
+SRC_URI[tarball.md5sum] = "7925683d7dd105aabe9b6b618d48cc73"
+SRC_URI[tarball.sha256sum] = "05a6f9e21aad8c098e388ae77de7b2361941afa7157ef74216703395b14e319a"
 
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
 
diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index 529ed5b..7b868a2 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -1,8 +1,8 @@
 require busybox.inc
 
-SRCREV = "1ecfe811fe2f70380170ef7d820e8150054e88ca"
+SRCREV = "be947c4d97c0dacb703a6f24dd813ff6dd3a33b6"
 # Lookout for PV bump too when SRCREV is changed
-PV = "1.23.1+git${SRCPV}"
+PV = "1.23.2+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1


