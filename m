Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B8C879485
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2018 17:20:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8MHJcp6023445
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 22 Sep 2018 10:20:09 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sat, 22 Sep 2018 10:20:04 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 22 Sep 2018 13:18:51 -0400
Message-ID: <7174d0c3c590ca12f7a5c356bd8776c32e1c0598.1537636541.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1537636541.git.bruce.ashfield@windriver.com>
References: <cover.1537636541.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] linux-yocto/4.14: fix kernel configuration audit warnings
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
X-List-Received-Date: Sat, 22 Sep 2018 17:20:29 -0000
Content-Type: text/plain

Some of the reference BSPs for 4.14 need fixes that have been done
on 4.18 and master to silence warnings, so we cherry-pick the
following changes:

  f991b21d7858 config: flash: drop obselete config values
  da7524cf2980 edgerouter: Drop the obsolete kernel options
  675c5b0cde65 cfg: drop MACH_VERSATILE_PB and MACH_VERSTAILE_AB
  0936b18ed8d5 cfg/timer/rtc: toggle RTC_CLASS instead of GEN_RTC
  634d8f2230d1 mpc8315e-rdb: Drop the obsolete kernel options
  9beb3a28736e rt: drop obselete configuration options

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index dc53d6a140f8..0e34f53e6ee1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "af1b926c9160b0dbf2bbe41b166a8a7b07191fd2"
-SRCREV_meta ?= "0936b18ed8d58257f8f1d79c085adbf6d4362530"
+SRCREV_meta ?= "f991b21d78588fa88d527e3607cc2dab35089ee8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index 009b9262f6d5..061620031c71 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -13,7 +13,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "74ecbeb03ebfc2b9a73a6554924b043b903295f5"
-SRCREV_meta ?= "0936b18ed8d58257f8f1d79c085adbf6d4362530"
+SRCREV_meta ?= "f991b21d78588fa88d527e3607cc2dab35089ee8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index 1abd69c0513c..caf7d66a72d3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "084af9624d268ddf4fd65b2f9e8e50ca2f22e62b"
 SRCREV_machine_qemux86-64 ?= "084af9624d268ddf4fd65b2f9e8e50ca2f22e62b"
 SRCREV_machine_qemumips64 ?= "44e1719a8f4fe10e88c13b9ec6c1fa1d041efaed"
 SRCREV_machine ?= "084af9624d268ddf4fd65b2f9e8e50ca2f22e62b"
-SRCREV_meta ?= "0936b18ed8d58257f8f1d79c085adbf6d4362530"
+SRCREV_meta ?= "f991b21d78588fa88d527e3607cc2dab35089ee8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
-- 
2.5.0


