Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4E5A1763CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 09:05:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6S95C7l000652
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 02:05:12 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 28 Jul 2015 02:04:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jul 2015 02:05:10 -0700
Message-ID: <d2fde8961c75893e53e9cacdbadcfedf69bcca3b.1438074266.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1438074266.git.liezhi.yang@windriver.com>
References: <cover.1438074266.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] qemu_git.bb: remove it
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
X-List-Received-Date: Tue, 28 Jul 2015 09:05:12 -0000
Content-Type: text/plain

Remove it since we have 2.4.0, the git version is 1.3 can't be built by
deafult:
ERROR: Fetcher failure: Unable to find revision 04024dea2674861fcf13582a77b58130c67fccd8 in branch master even from upstream

We can fix it, but seems that no one uses it any more.

And move patches from "files" dir to "qemu" dir.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...-Arm-versatilepb-Add-memory-size-checking.patch |    0
 .../exclude-some-arm-EABI-obsolete-syscalls.patch  |    0
 .../qemu-enlarge-env-entry-size.patch              |    0
 meta/recipes-devtools/qemu/qemu_git.bb             |   15 ---------------
 4 files changed, 15 deletions(-)
 rename meta/recipes-devtools/qemu/{files => qemu}/Qemu-Arm-versatilepb-Add-memory-size-checking.patch (100%)
 rename meta/recipes-devtools/qemu/{files => qemu}/exclude-some-arm-EABI-obsolete-syscalls.patch (100%)
 rename meta/recipes-devtools/qemu/{files => qemu}/qemu-enlarge-env-entry-size.patch (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu_git.bb

diff --git a/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch b/meta/recipes-devtools/qemu/qemu/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
rename to meta/recipes-devtools/qemu/qemu/Qemu-Arm-versatilepb-Add-memory-size-checking.patch
diff --git a/meta/recipes-devtools/qemu/files/exclude-some-arm-EABI-obsolete-syscalls.patch b/meta/recipes-devtools/qemu/qemu/exclude-some-arm-EABI-obsolete-syscalls.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/files/exclude-some-arm-EABI-obsolete-syscalls.patch
rename to meta/recipes-devtools/qemu/qemu/exclude-some-arm-EABI-obsolete-syscalls.patch
diff --git a/meta/recipes-devtools/qemu/files/qemu-enlarge-env-entry-size.patch b/meta/recipes-devtools/qemu/qemu/qemu-enlarge-env-entry-size.patch
similarity index 100%
rename from meta/recipes-devtools/qemu/files/qemu-enlarge-env-entry-size.patch
rename to meta/recipes-devtools/qemu/qemu/qemu-enlarge-env-entry-size.patch
diff --git a/meta/recipes-devtools/qemu/qemu_git.bb b/meta/recipes-devtools/qemu/qemu_git.bb
deleted file mode 100644
index a30932a..0000000
--- a/meta/recipes-devtools/qemu/qemu_git.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require qemu.inc
-
-SRCREV = "04024dea2674861fcf13582a77b58130c67fccd8"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
-                    file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
-
-PV = "1.3.0+git${SRCPV}"
-
-SRC_URI_prepend = "git://git.qemu.org/qemu.git"
-S = "${WORKDIR}/git"
-
-DEFAULT_PREFERENCE = "-1"
-
-COMPATIBLE_HOST_class-target_mips64 = "null"
-- 
1.7.9.5


