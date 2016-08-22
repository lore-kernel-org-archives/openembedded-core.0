Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B013F76E3F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 07:52:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7M7qvKJ023631
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 00:52:58 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 22 Aug 2016 00:52:57 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Aug 2016 00:52:47 -0700
Message-ID: <baacff2d7912689ccc25b76e0529b9e3417c7d1f.1471850849.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1471850849.git.liezhi.yang@windriver.com>
References: <cover.1471850849.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V4 10/11] nativesdk-qemu-helper: fix for new runqemu
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
X-List-Received-Date: Mon, 22 Aug 2016 07:52:57 -0000
Content-Type: text/plain

There is no runqemu-internal anymore, and it is a python script now
which requires several python modules.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
index 51d1c59..63e5fd5 100644
--- a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
+++ b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
@@ -1,15 +1,16 @@
 SUMMARY = "Qemu helper scripts"
 LICENSE = "GPLv2"
-RDEPENDS_${PN} = "nativesdk-qemu"
-PR = "r9"
+RDEPENDS_${PN} = "nativesdk-qemu nativesdk-python3-subprocess \
+                  nativesdk-python3-shell nativesdk-python3-fcntl \
+                "
 
+PR = "r9"
 
 LIC_FILES_CHKSUM = "file://${WORKDIR}/tunctl.c;endline=4;md5=ff3a09996bc5fff6bc5d4e0b4c28f999 \
-                    file://${COREBASE}/scripts/runqemu;endline=18;md5=77fbe442a88b1bcdc29c3ba67733b21b"
+                    file://${COREBASE}/scripts/runqemu;endline=19;md5=a8ad1905c709a2deaa057608ebaf705a"
 
 
 SRC_URI = "file://${COREBASE}/scripts/runqemu \
-           file://${COREBASE}/scripts/runqemu-internal \
            file://${COREBASE}/scripts/runqemu-addptable2image \
            file://${COREBASE}/scripts/runqemu-gen-tapdevs \
            file://${COREBASE}/scripts/runqemu-ifup \
-- 
2.9.0


