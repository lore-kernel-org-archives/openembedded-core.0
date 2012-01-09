Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RkO6Z-0006oC-AO
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 23:54:16 +0100
Received: from mizar.localdomain (87.9.229.96) by smtp209.alice.it (8.6.023.02)
	id 4EF08A6301DA75FE; Mon, 9 Jan 2012 23:46:49 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon,  9 Jan 2012 23:46:14 +0100
Message-Id: <8edc411aa5d42b62e7a7659cbf8b9befb87a3e12.1326148887.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1326148886.git.andrea.adami@gmail.com>
References: <cover.1326148886.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1326148886.git.andrea.adami@gmail.com>
References: <cover.1326148886.git.andrea.adami@gmail.com>
Subject: [PATCH 2/2 v3] task-core-tools: adapt to kexec-tools package split
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jan 2012 22:54:17 -0000

* The recipe packages now kexec and kdump separately.
* For standard purposes only kexec is needed.
* Bump PR.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/recipes-core/tasks/task-core-tools.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/tasks/task-core-tools.bb b/meta/recipes-core/tasks/task-core-tools.bb
index 6632b4f..1a42f15 100644
--- a/meta/recipes-core/tasks/task-core-tools.bb
+++ b/meta/recipes-core/tasks/task-core-tools.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "Tools tasks for OE-Core"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r14"
+PR = "r15"
 
 PACKAGES = "\
     task-core-tools-debug \
@@ -25,7 +25,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 ALLOW_EMPTY = "1"
 
 # kexec-tools doesn't work on Mips
-KEXECTOOLS ?= "kexec-tools"
+KEXECTOOLS ?= "kexec"
 KEXECTOOLS_mips ?= ""
 KEXECTOOLS_mipsel ?= ""
 KEXECTOOLS_powerpc ?= ""
-- 
1.7.3.4



