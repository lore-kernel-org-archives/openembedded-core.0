Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 947656D147
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 17:28:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0LHR6RL005501
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 21 Jan 2019 09:27:42 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 21 Jan 2019 09:27:22 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 21 Jan 2019 12:26:52 -0500
Message-ID: <3285778593b41ff20bd58dea4f72c0cb74e48a9d.1548091536.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1548091536.git.bruce.ashfield@windriver.com>
References: <cover.1548091536.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-yocto/4.19: integrate qemuarm refresh changes
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
X-List-Received-Date: Mon, 21 Jan 2019 17:28:01 -0000
Content-Type: text/plain

Integrating the following two commits that prepare for an update of
'qemuarm' to an a15 based emulation.

[
   Author: Jon Mason <jdmason@kudzu.us>
   Date:   Fri Jan 18 16:45:28 2019 -0500

       qemuarma15: Add Real-Time and Tiny configs

       Add tiny and Real-Time configs.  Also, add kmachine name to standard
       config to allow for BSP renaming.

       Signed-off-by: Jon Mason <jdmason@kudzu.us>
       Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

   Author: Jon Mason <jdmason@kudzu.us>
   Date:   Fri Jan 18 16:45:27 2019 -0500

       qemuarm: Add qemuarmv5 kmachine name

       Add alternative kmachine name to allow for the configs to be used by
       soon-to-be-renamed BSPs.

       Signed-off-by: Jon Mason <jdmason@kudzu.us>
       Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index 4a987d52c034..cb0283d49fcb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "7a0b04e5a8d036cd9dcc6ee64a838e8d8d5cdd56"
-SRCREV_meta ?= "d9a3d567a7b5617f757d132090ca1646e139301f"
+SRCREV_meta ?= "0b9ea5596fd88277a4ecca1a8b8a1aca06a1ae37"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index d3c6f12352f7..4e13bf125e8b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "d11db6c6617f689e6b9e2afaa3d3b2036c6d3d30"
 SRCREV_machine ?= "eebb51300a07804a020ec468b5f8c5bf720198d9"
-SRCREV_meta ?= "d9a3d567a7b5617f757d132090ca1646e139301f"
+SRCREV_meta ?= "0b9ea5596fd88277a4ecca1a8b8a1aca06a1ae37"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index bd9b6a3543e5..599418d9cb21 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "eebb51300a07804a020ec468b5f8c5bf720198d9"
 SRCREV_machine_qemux86-64 ?= "eebb51300a07804a020ec468b5f8c5bf720198d9"
 SRCREV_machine_qemumips64 ?= "dff23f01307cbab688d9677ecd4b5f350ec435d9"
 SRCREV_machine ?= "eebb51300a07804a020ec468b5f8c5bf720198d9"
-SRCREV_meta ?= "d9a3d567a7b5617f757d132090ca1646e139301f"
+SRCREV_meta ?= "0b9ea5596fd88277a4ecca1a8b8a1aca06a1ae37"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
-- 
2.5.0


