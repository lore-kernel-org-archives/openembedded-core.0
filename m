Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7C1BB72157
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Nov 2014 02:41:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAJ2fPA1027866
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Nov 2014 18:41:25 -0800 (PST)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 18 Nov 2014 18:41:24 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Nov 2014 20:41:23 -0600
Message-ID: <1416364883-213938-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH][dizzy] qemu: disable the build for mips
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
X-List-Received-Date: Wed, 19 Nov 2014 02:41:24 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

Disable it since ICE on mips with wr toolchain only:
  translate.c:7838:1: internal compiler error: Segmentation fault

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/qemu/qemu_2.1.0.bb | 1 +
 meta/recipes-devtools/qemu/qemu_git.bb   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu_2.1.0.bb b/meta/recipes-devtools/qemu/qemu_2.1.0.bb
index a82d052..e58829e 100644
--- a/meta/recipes-devtools/qemu/qemu_2.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.1.0.bb
@@ -13,6 +13,7 @@ SRC_URI[md5sum] = "6726977292b448cbc7f89998fac6983b"
 SRC_URI[sha256sum] = "397e23184f4bf613589a8fe0c6542461dc2afdf17ed337e97e6fd2f31e8f8802"
 
 COMPATIBLE_HOST_class-target_mips64 = "null"
+COMPATIBLE_HOST_class-target_mips = "null"
 
 do_sanitize_sources() {
     # These .git files point to a nonexistent path "../.git/modules" and will confuse git
diff --git a/meta/recipes-devtools/qemu/qemu_git.bb b/meta/recipes-devtools/qemu/qemu_git.bb
index a30932a..cefed90 100644
--- a/meta/recipes-devtools/qemu/qemu_git.bb
+++ b/meta/recipes-devtools/qemu/qemu_git.bb
@@ -13,3 +13,4 @@ S = "${WORKDIR}/git"
 DEFAULT_PREFERENCE = "-1"
 
 COMPATIBLE_HOST_class-target_mips64 = "null"
+COMPATIBLE_HOST_class-target_mips = "null"
-- 
1.9.3


