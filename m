Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F384C6AC1E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 13:51:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7ODpSGP010637
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Aug 2015 06:51:29 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Mon, 24 Aug 2015 06:51:28 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 24 Aug 2015 09:51:22 -0400
Message-ID: <4f29978a453fca56099fbd2828a5006ca1463245.1440424002.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1440424002.git.bruce.ashfield@windriver.com>
References: <cover.1440424002.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] linux-yocto/3.14: cleanups and gcc5 ARM build fixes
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
X-List-Received-Date: Mon, 24 Aug 2015 13:51:30 -0000
Content-Type: text/plain

Updating the 3.14 SRCREVs to match the latest kernel meta data updates
and also to merge four patches Richard Purdie located that fix the
gcc 5.x ARM build (we still have boot issues, but building is the
first step).

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 18 +++++++++---------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index 0bd94f0c600d..d59f06b81c04 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,9 +3,9 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "863ba0912f559ba9d64ab94bf04f0226fdf0cb49"
-SRCREV_machine_qemuppc ?= "9d464d6696a0fc755c65a2cf75ad7a4656ac6e1e"
-SRCREV_meta ?= "b55cfc0308bf7158843db4b8f69f866487a0919e"
+SRCREV_machine ?= "302ca233332fd364ecd028a0cf21b4cdc045e056"
+SRCREV_machine_qemuppc ?= "e4847afbb42583fa05e6a94c8d0c8f8e37ed5622"
+SRCREV_meta ?= "3a09b38a9f5015c56d99d17aa7c2f200c566249b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-3.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index f486d41efad9..f65e0e0ed74f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "3.14.36"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "7534aeb01883b48cc42eb4900d0a8c64e8160e14"
-SRCREV_meta ?= "b55cfc0308bf7158843db4b8f69f866487a0919e"
+SRCREV_machine ?= "302ca233332fd364ecd028a0cf21b4cdc045e056"
+SRCREV_meta ?= "3a09b38a9f5015c56d99d17aa7c2f200c566249b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index 9bbcecc76f33..db77e9ead037 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "bc2e4081f235174c696cc4b30dbea51555a1c3d6"
-SRCREV_machine_qemuarm64 ?= "7534aeb01883b48cc42eb4900d0a8c64e8160e14"
-SRCREV_machine_qemumips ?= "cbbe5f1b5477507aa668b4117a8dedcb407a0571"
-SRCREV_machine_qemuppc ?= "038bbef0f64321a0f9d77e9b07dff3ae1e51b51a"
-SRCREV_machine_qemux86 ?= "48833301518748d82cbc2412fea3617eeee6d01b"
-SRCREV_machine_qemux86-64 ?= "7534aeb01883b48cc42eb4900d0a8c64e8160e14"
-SRCREV_machine_qemumips64 ?= "c910c6d8338ab7291f066edc06de83de5b645d8f"
-SRCREV_machine ?= "7534aeb01883b48cc42eb4900d0a8c64e8160e14"
-SRCREV_meta ?= "b55cfc0308bf7158843db4b8f69f866487a0919e"
+SRCREV_machine_qemuarm ?= "7e763688134a64b67f35af4f5a289be0b0c95126"
+SRCREV_machine_qemuarm64 ?= "302ca233332fd364ecd028a0cf21b4cdc045e056"
+SRCREV_machine_qemumips ?= "9c6fdae47597756042a1d4ed613dff96e430e8e9"
+SRCREV_machine_qemuppc ?= "e4847afbb42583fa05e6a94c8d0c8f8e37ed5622"
+SRCREV_machine_qemux86 ?= "550f5379bc4b001f656e7c98165606e543d0858c"
+SRCREV_machine_qemux86-64 ?= "302ca233332fd364ecd028a0cf21b4cdc045e056"
+SRCREV_machine_qemumips64 ?= "9b203f1aff41f7b713ec973cdcc7d016db4ffc26"
+SRCREV_machine ?= "302ca233332fd364ecd028a0cf21b4cdc045e056"
+SRCREV_meta ?= "3a09b38a9f5015c56d99d17aa7c2f200c566249b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;branch=${KBRANCH};name=machine; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-3.14;destsuffix=${KMETA}"
-- 
2.1.0


