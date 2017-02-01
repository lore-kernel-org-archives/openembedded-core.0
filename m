Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F0B427733D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 15:30:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v11FUkET000032
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Feb 2017 07:30:46 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 1 Feb 2017 07:30:45 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 1 Feb 2017 10:30:34 -0500
Message-ID: <a78761e159bcf47ca8b59fd03acf53d8309549cd.1485962567.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1485962567.git.bruce.ashfield@windriver.com>
References: <cover.1485962567.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/10] linux-yocto/4.9: update to -rt3
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
X-List-Received-Date: Wed, 01 Feb 2017 15:30:46 -0000
Content-Type: text/plain

Paul Gortmaker has refreshed the 4.9 -rt support to -rt3.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index 155815e5df09..b2986e32afd8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1d5e0d6f25c65f2404c47de11bef86f3dbc7f29d"
-SRCREV_meta ?= "20b8e96e097b796673bea982918868d47d51081b"
+SRCREV_machine ?= "35cfaa68bf6ceaf59cf2bcd020d4e66155e19c46"
+SRCREV_meta ?= "3715fc90f7b69de59ca0870f6c7cda27cdc0f895"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index beb2d4de30e4..a9d17549d6dd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "0b52a52fb892c0dd20823268830ab22a9e3a92b8"
-SRCREV_meta ?= "20b8e96e097b796673bea982918868d47d51081b"
+SRCREV_meta ?= "3715fc90f7b69de59ca0870f6c7cda27cdc0f895"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index 241eb94f6ab0..e5f6064fc939 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "0b52a52fb892c0dd20823268830ab22a9e3a92b8"
 SRCREV_machine_qemux86-64 ?= "0b52a52fb892c0dd20823268830ab22a9e3a92b8"
 SRCREV_machine_qemumips64 ?= "06fff8284bbec52a36fb3d054354db2f593376ac"
 SRCREV_machine ?= "0b52a52fb892c0dd20823268830ab22a9e3a92b8"
-SRCREV_meta ?= "20b8e96e097b796673bea982918868d47d51081b"
+SRCREV_meta ?= "3715fc90f7b69de59ca0870f6c7cda27cdc0f895"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
-- 
2.5.0


