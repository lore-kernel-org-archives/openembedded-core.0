Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F1ED57381B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 21:36:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t22Laik8005503
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 2 Mar 2015 13:36:44 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 2 Mar 2015 13:36:44 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 2 Mar 2015 16:36:40 -0500
Message-ID: <c52de149df8e7ab73a9cf823960dbfc45b018941.1425331960.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1425331960.git.bruce.ashfield@windriver.com>
References: <cover.1425331960.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-yocto/3.14: OcteonIII support
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
X-List-Received-Date: Mon, 02 Mar 2015 21:36:46 -0000
Content-Type: text/plain

With these SRCREV updates, we add the following support to the kernel:

The following has been verified with the branch sources:

 On 68xx:

   * SGMII, XAUI Packet IO interfaces.
   * PCIe devices
   * EHCI/OHCI USB driver

 On 78XX:

   * Ran LTP testsuite
   * SGMII, XAUI Packet IO interfaces
   * MMC driver (which covers GPIO interrupts in the driver)
   * PCIe devices
   * XHCI USB driver

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 16 ++++++++--------
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index bd61c4a927c8..4080aca495db 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,8 +3,8 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "fbe20225d041672b110e93c3ad171737b69e2126"
-SRCREV_machine_qemuppc ?= "11f38e2b2a63c5b1138617c197b3f5b96cd74a65"
+SRCREV_machine ?= "eb2c9c93de9b806f2a52c26bba229089a7a71385"
+SRCREV_machine_qemuppc ?= "bd470d1c8337323b0f7d1529df70a1c68108df0b"
 SRCREV_meta ?= "6eddbf47875ef48ddc5864957a7b63363100782b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index d110297246c1..f6b95a218ad7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "3.14.29"
 KMETA = "meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "f65678ef48c5d41af914d2769e4dd01411c1df96"
+SRCREV_machine ?= "3bab81113682d3a5ffc8ea60cf770beed4831492"
 SRCREV_meta ?= "6eddbf47875ef48ddc5864957a7b63363100782b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index 9cdd3eea0d5c..0d0d8b2ee22a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "1a9f9edade8d8c0120d2f47dfd15edd41c7a3439"
-SRCREV_machine_qemuarm64 ?= "f65678ef48c5d41af914d2769e4dd01411c1df96"
-SRCREV_machine_qemumips ?= "68e9a20079f3cc333c3b7d945bb65fa74772aa37"
-SRCREV_machine_qemuppc ?= "a992646d267f012f87967f1c8b88608c950c7e58"
-SRCREV_machine_qemux86 ?= "2f37d969c5d3b28d936ac3533862e2ab034d4f37"
-SRCREV_machine_qemux86-64 ?= "f65678ef48c5d41af914d2769e4dd01411c1df96"
-SRCREV_machine_qemumips64 ?= "e93012684a290e9b60d61f58c2dbd36ab3f2e549"
-SRCREV_machine ?= "f65678ef48c5d41af914d2769e4dd01411c1df96"
+SRCREV_machine_qemuarm ?= "38d0249598bef8263f1f1e280badf6b92a0bc668"
+SRCREV_machine_qemuarm64 ?= "3bab81113682d3a5ffc8ea60cf770beed4831492"
+SRCREV_machine_qemumips ?= "d2138247c6f1ba8f082f7c2b0d4a6a4efb0cf908"
+SRCREV_machine_qemuppc ?= "2ec2927314d58a012403cbaccdf0a8a1f5c5d666"
+SRCREV_machine_qemux86 ?= "9ed9a63eeafbcbee0e378e304a1029bb14d45697"
+SRCREV_machine_qemux86-64 ?= "3bab81113682d3a5ffc8ea60cf770beed4831492"
+SRCREV_machine_qemumips64 ?= "afdaa94d540bf671f4d4d198ec6b891df22fb323"
+SRCREV_machine ?= "3bab81113682d3a5ffc8ea60cf770beed4831492"
 SRCREV_meta ?= "6eddbf47875ef48ddc5864957a7b63363100782b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-- 
2.1.0


