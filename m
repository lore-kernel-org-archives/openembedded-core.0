Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E87E379603
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 15:00:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7OF0DYd003245
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 Aug 2018 08:00:13 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Fri, 24 Aug 2018 08:00:13 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 24 Aug 2018 10:59:55 -0400
Message-ID: <5a8d2810a4611f5d7a087a93fa3fd3693adebd58.1535118570.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1535118570.git.bruce.ashfield@windriver.com>
References: <cover.1535118570.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/12] linux-yocto: add selftest and security configuration blocks
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
X-List-Received-Date: Fri, 24 Aug 2018 15:00:13 -0000
Content-Type: text/plain

Adding two new configuration blocks/features to the 4.14+ kernel
variants.

One is for enabling selftest options, and the other is a collection
of kernel security/hardening configs.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.15.bb      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index 9e4d353cfb81..24e3f0703682 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "517929399b9fd48c9e86fe6724097532ff779f9b"
-SRCREV_meta ?= "f97272690ca7e1143b9db3c1f1a01d9c37b6f478"
+SRCREV_meta ?= "8a3be7d783a39b56796e1d5197cb9f757e38f22f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
index 26d8382b38e0..75aa21055f86 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3373c0cf71f2812eeb9694839456df6f67fd32ac"
-SRCREV_meta ?= "3b43c318d9dca8858e0ec402db8a99ab2b79f16f"
+SRCREV_meta ?= "4f95b5be8ca7af984b4abee7f6f9eeccd136a5cb"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index ecb7b43726d9..05ce90c2e86e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -13,7 +13,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "2b98ddc7546b7c880361c9e13e1c11393fb8b0e1"
-SRCREV_meta ?= "f97272690ca7e1143b9db3c1f1a01d9c37b6f478"
+SRCREV_meta ?= "8a3be7d783a39b56796e1d5197cb9f757e38f22f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
index d3759b0582f0..392fc1c38a42 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
@@ -11,7 +11,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "3373c0cf71f2812eeb9694839456df6f67fd32ac"
-SRCREV_meta ?= "3b43c318d9dca8858e0ec402db8a99ab2b79f16f"
+SRCREV_meta ?= "4f95b5be8ca7af984b4abee7f6f9eeccd136a5cb"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index 22c7b1e696d0..02c42c400869 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "1839f1b10cf9895ac0e31631eaa9a5ed5c63ede0"
 SRCREV_machine_qemux86-64 ?= "1839f1b10cf9895ac0e31631eaa9a5ed5c63ede0"
 SRCREV_machine_qemumips64 ?= "db539ae62da0b5fe7d065830c2709abc01a5591d"
 SRCREV_machine ?= "1839f1b10cf9895ac0e31631eaa9a5ed5c63ede0"
-SRCREV_meta ?= "f97272690ca7e1143b9db3c1f1a01d9c37b6f478"
+SRCREV_meta ?= "8a3be7d783a39b56796e1d5197cb9f757e38f22f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.15.bb b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
index 238d35a3c8f5..14afc41c2081 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "3373c0cf71f2812eeb9694839456df6f67fd32ac"
 SRCREV_machine_qemux86-64 ?= "3373c0cf71f2812eeb9694839456df6f67fd32ac"
 SRCREV_machine_qemumips64 ?= "b98c113571c72a0d34832dd6fe5585529b32988b"
 SRCREV_machine ?= "3373c0cf71f2812eeb9694839456df6f67fd32ac"
-SRCREV_meta ?= "3b43c318d9dca8858e0ec402db8a99ab2b79f16f"
+SRCREV_meta ?= "4f95b5be8ca7af984b4abee7f6f9eeccd136a5cb"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
-- 
2.5.0


