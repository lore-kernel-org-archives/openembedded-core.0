Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4ACD2776DC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 13:31:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2EDVOON003924
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 14 Mar 2017 06:31:24 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 14 Mar 2017 06:31:23 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 14 Mar 2017 09:31:15 -0400
Message-ID: <342cbc983c617301e6748a5d64d8f95fdf0ae44d.1489498044.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1489498044.git.bruce.ashfield@windriver.com>
References: <cover.1489498044.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] linux-yocto/4.9/4.10: add Intel Memory Protection Extensions
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
X-List-Received-Date: Tue, 14 Mar 2017 13:31:26 -0000
Content-Type: text/plain

This commit adds a kernel feature to have the kernel support
for Intel Memory Protection Extensions (MPX).

A quote from kernel arch/x86/Kconfig:

"MPX provides hardware features that can be used in conjuction
with compiler-instrumented code to check memory references. It
is designed to detect buffer overflow or underflow bugs."

Intel MPX is available, e.g., on Skylake and on Goldmont (e.g.,
Intel 570x).

Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb    | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb  | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.10.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.9.bb       | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
index d9d82ea7bef2..502880174341 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "705df692910849e38f734f5bff121070e35118f1"
-SRCREV_meta ?= "976e613c7010132ab306ca4e7f7f385356a42492"
+SRCREV_meta ?= "76b1344f7683a95b94895818c26657e7202a9531"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index 968e8be1b283..7e801a3aae9a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3e5e058d8df10a5495effd069098934dc0859f2e"
-SRCREV_meta ?= "38e74b65164e6857450417825ee4b517452ff57f"
+SRCREV_meta ?= "b65e9b6153237e3ee898a01bc418c12f7404a681"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
index 2a9f4a93cc85..f7e94708f824 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "705df692910849e38f734f5bff121070e35118f1"
-SRCREV_meta ?= "976e613c7010132ab306ca4e7f7f385356a42492"
+SRCREV_meta ?= "76b1344f7683a95b94895818c26657e7202a9531"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index 98bcc500d8e1..ae4d38e4ddd2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "95c0a80ee83f1cf8e59d733f36e8a9dfd50a0098"
-SRCREV_meta ?= "38e74b65164e6857450417825ee4b517452ff57f"
+SRCREV_meta ?= "b65e9b6153237e3ee898a01bc418c12f7404a681"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.10.bb b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
index 6dd86b67910f..bf470c3ec775 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "705df692910849e38f734f5bff121070e35118f1"
 SRCREV_machine_qemux86-64 ?= "705df692910849e38f734f5bff121070e35118f1"
 SRCREV_machine_qemumips64 ?= "85f89e2f7f33de72815995de6025e0b217f64c9a"
 SRCREV_machine ?= "705df692910849e38f734f5bff121070e35118f1"
-SRCREV_meta ?= "976e613c7010132ab306ca4e7f7f385356a42492"
+SRCREV_meta ?= "76b1344f7683a95b94895818c26657e7202a9531"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index 2bde377f3137..1c616e880d9e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "95c0a80ee83f1cf8e59d733f36e8a9dfd50a0098"
 SRCREV_machine_qemux86-64 ?= "95c0a80ee83f1cf8e59d733f36e8a9dfd50a0098"
 SRCREV_machine_qemumips64 ?= "ac72601920adbc163cd691fa060177137e41bf22"
 SRCREV_machine ?= "95c0a80ee83f1cf8e59d733f36e8a9dfd50a0098"
-SRCREV_meta ?= "38e74b65164e6857450417825ee4b517452ff57f"
+SRCREV_meta ?= "b65e9b6153237e3ee898a01bc418c12f7404a681"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
-- 
2.5.0


