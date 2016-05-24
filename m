Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C681E6E6B1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 15:54:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4OFs4cJ019315
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 24 May 2016 08:54:04 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 24 May 2016 08:54:03 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 24 May 2016 11:53:59 -0400
Message-ID: <409d35d6ae5d587de338c0edb9cdff617022b5f4.1464105119.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1464105119.git.bruce.ashfield@windriver.com>
References: <cover.1464105119.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] linux-yocto/4.4: beaglebone: build in the usb controller drivers
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
X-List-Received-Date: Tue, 24 May 2016 15:54:06 -0000
Content-Type: text/plain

Merging the following meta data change:

[
    In the current codes, we build the drivers for usb controller as
    modules. But for some image types, such as minimal or
    full-cmdline, these driver modules are not installed to the rootfs by
    default. This makes the using of the usb pretty inconvenience. So
    make them all builtin.

    Reported-and-suggested-by: hiims <h@101.org.il>
    Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 005c08893e33..edf68c21db7c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "7ef3fe56827bd9c20021e3a52bc36ebd4c6b2ce3"
-SRCREV_meta ?= "d6ee402d461048cf1afd10375fee5769c06d21d6"
+SRCREV_meta ?= "fca9cc2483de4e7b981dc01122521c74e06fcc6a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 93ffe189cea7..e66dd40931c3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "578ff2a88676d20439dbf3877768370d06a22d8f"
-SRCREV_meta ?= "d6ee402d461048cf1afd10375fee5769c06d21d6"
+SRCREV_meta ?= "fca9cc2483de4e7b981dc01122521c74e06fcc6a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index a98f9fa9a9c3..31e5caaaa92b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "578ff2a88676d20439dbf3877768370d06a22d8f"
 SRCREV_machine_qemux86-64 ?= "578ff2a88676d20439dbf3877768370d06a22d8f"
 SRCREV_machine_qemumips64 ?= "5faa3c8de491435842024b24b6a95fccdbe3f72a"
 SRCREV_machine ?= "578ff2a88676d20439dbf3877768370d06a22d8f"
-SRCREV_meta ?= "d6ee402d461048cf1afd10375fee5769c06d21d6"
+SRCREV_meta ?= "fca9cc2483de4e7b981dc01122521c74e06fcc6a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-- 
2.5.0


