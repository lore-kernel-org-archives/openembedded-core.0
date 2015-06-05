Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2C240734DA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 04:13:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t554DutC021273
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 4 Jun 2015 21:13:56 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 4 Jun 2015 21:13:56 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 5 Jun 2015 00:13:54 -0400
Message-ID: <c954cdeeaf11fb5bd8f4fbf63ddf0904998f2ca4.1433477519.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1433477519.git.bruce.ashfield@windriver.com>
References: <cover.1433477519.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] linux-yocto: update beaglebone, mpc8315e and edgerouter to 3.19
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
X-List-Received-Date: Fri, 05 Jun 2015 04:13:58 -0000
Content-Type: text/plain

Bumping the linux-yocto SRCREVs to integrate fixes for the h/w reference
BSPs to the 3.19 kernel.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.19.bb      | 18 +++++++++---------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
index 777aa60b14c4..6907060d3314 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "3.19.5"
 KMETA = "meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d3c0b958e68824c7037005e2a84e5661ba98d5b0"
-SRCREV_meta ?= "727cfce45077a1f73f1dbc42e8093fde0c5e36a7"
+SRCREV_machine ?= "6c21811060c03100a32d0acc493df5fb3743b7c8"
+SRCREV_meta ?= "118f27167f4626fc7c71cefbec7c55a41d3a6d62"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.19.bb b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
index 975b3afbf1d1..6218c02eca8b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/common-pc"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "e5aa4ad4249e079b8459a90b4ffa50d04b474458"
-SRCREV_machine_qemuarm64 ?= "d3c0b958e68824c7037005e2a84e5661ba98d5b0"
-SRCREV_machine_qemumips ?= "3b8cc925c5312b37cb824dfe58c2a4dcbb2b9732"
-SRCREV_machine_qemuppc ?= "4ac61cf97719f01c5cb226881956e77624fb534c"
-SRCREV_machine_qemux86 ?= "d3c0b958e68824c7037005e2a84e5661ba98d5b0"
-SRCREV_machine_qemux86-64 ?= "d3c0b958e68824c7037005e2a84e5661ba98d5b0"
-SRCREV_machine_qemumips64 ?= "f5bf944a0edde0e379af4296917d33a562e6586b"
-SRCREV_machine ?= "d3c0b958e68824c7037005e2a84e5661ba98d5b0"
-SRCREV_meta ?= "727cfce45077a1f73f1dbc42e8093fde0c5e36a7"
+SRCREV_machine_qemuarm ?= "c75bfc837fa8079278e77e8c122fe506c4ba7438"
+SRCREV_machine_qemuarm64 ?= "6c21811060c03100a32d0acc493df5fb3743b7c8"
+SRCREV_machine_qemumips ?= "b6aae264b3d4e74cc29a5db8c376840579d1f433"
+SRCREV_machine_qemuppc ?= "f6c2fa7ca86bd548cc96bd0ddf8aa89229e4c2c2"
+SRCREV_machine_qemux86 ?= "6c21811060c03100a32d0acc493df5fb3743b7c8"
+SRCREV_machine_qemux86-64 ?= "6c21811060c03100a32d0acc493df5fb3743b7c8"
+SRCREV_machine_qemumips64 ?= "d3a1f6f5501167c76fb662d518140133f5ce78c5"
+SRCREV_machine ?= "6c21811060c03100a32d0acc493df5fb3743b7c8"
+SRCREV_meta ?= "118f27167f4626fc7c71cefbec7c55a41d3a6d62"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.19.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
2.1.0


