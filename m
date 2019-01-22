Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4CDD16C129
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2019 14:32:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0MEWhRd003789
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Jan 2019 06:32:43 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 22 Jan 2019 06:32:42 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 22 Jan 2019 09:32:42 -0500
Message-ID: <1548167562-22297-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/4.19: qemuarma15: drop 'qemuarm' match
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
X-List-Received-Date: Tue, 22 Jan 2019 14:32:43 -0000
Content-Type: text/plain

Until qemuarma15 is a drop in replacement for the existing versatile
qemuarm emulation, it shouldn't match on qemuarm as a machine
definition. Since the difference in capabilities will cause unexpected
issues at runtime.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index cb0283d49fcb..bfce9aa76935 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "7a0b04e5a8d036cd9dcc6ee64a838e8d8d5cdd56"
-SRCREV_meta ?= "0b9ea5596fd88277a4ecca1a8b8a1aca06a1ae37"
+SRCREV_meta ?= "7223248023d3d822c8c0227fb65d995ba6b7a351"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index 4e13bf125e8b..c734ad840708 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "d11db6c6617f689e6b9e2afaa3d3b2036c6d3d30"
 SRCREV_machine ?= "eebb51300a07804a020ec468b5f8c5bf720198d9"
-SRCREV_meta ?= "0b9ea5596fd88277a4ecca1a8b8a1aca06a1ae37"
+SRCREV_meta ?= "7223248023d3d822c8c0227fb65d995ba6b7a351"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index 599418d9cb21..187437016f23 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "eebb51300a07804a020ec468b5f8c5bf720198d9"
 SRCREV_machine_qemux86-64 ?= "eebb51300a07804a020ec468b5f8c5bf720198d9"
 SRCREV_machine_qemumips64 ?= "dff23f01307cbab688d9677ecd4b5f350ec435d9"
 SRCREV_machine ?= "eebb51300a07804a020ec468b5f8c5bf720198d9"
-SRCREV_meta ?= "0b9ea5596fd88277a4ecca1a8b8a1aca06a1ae37"
+SRCREV_meta ?= "7223248023d3d822c8c0227fb65d995ba6b7a351"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
-- 
2.5.0


