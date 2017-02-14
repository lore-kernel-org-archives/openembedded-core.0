Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2384160745
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 21:14:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1ELEddF018525
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 Feb 2017 13:14:39 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 14 Feb 2017 13:14:38 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 14 Feb 2017 16:14:25 -0500
Message-ID: <071704e9a0ca86f704e55cbe10cc4e06f96269f9.1487106757.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1487106757.git.bruce.ashfield@windriver.com>
References: <cover.1487106757.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/11] linux-yocto-rt/4.9: update to 4.9-rt6
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
X-List-Received-Date: Tue, 14 Feb 2017 21:14:39 -0000
Content-Type: text/plain

Updating the SRCREVs to make Paul Gortmaker's port of 4.9-rt6 active.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index 5d7a20ed3ee0..4c6f6c36665a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7c90101498e6974f25e3bfd4823710e42c054e06"
-SRCREV_meta ?= "b6e2f3d63bd3e8fc2663c7e10356db916e496207"
+SRCREV_machine ?= "4b45c66b706a2bf859e7672d03ab525ea6bd3d75"
+SRCREV_meta ?= "7e8ec462b6bc68cb0f3cb0064909e035db1c4038"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index 6a110502074d..93230e079036 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "d0c402280c0fb424f02b7d152c8a008d9ac267df"
-SRCREV_meta ?= "b6e2f3d63bd3e8fc2663c7e10356db916e496207"
+SRCREV_meta ?= "7e8ec462b6bc68cb0f3cb0064909e035db1c4038"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index 7c367d886508..92870f3b90de 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "d0c402280c0fb424f02b7d152c8a008d9ac267df"
 SRCREV_machine_qemux86-64 ?= "d0c402280c0fb424f02b7d152c8a008d9ac267df"
 SRCREV_machine_qemumips64 ?= "2ee2ed6d782e36fd705cc8f6ad9de98606ca227e"
 SRCREV_machine ?= "d0c402280c0fb424f02b7d152c8a008d9ac267df"
-SRCREV_meta ?= "b6e2f3d63bd3e8fc2663c7e10356db916e496207"
+SRCREV_meta ?= "7e8ec462b6bc68cb0f3cb0064909e035db1c4038"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
-- 
2.5.0


