Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5FE57785F9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 13:47:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8EDlCxj027574
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Sep 2017 06:47:12 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 14 Sep 2017 06:47:11 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 14 Sep 2017 09:47:02 -0400
Message-ID: <6c7597ae36ed0ec28572f7bebb111be0f2f7019a.1505396619.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1505396619.git.bruce.ashfield@windriver.com>
References: <cover.1505396619.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 9/9] linux-yocto/4.4: bluetooth: CVE-2017-1000251
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
X-List-Received-Date: Thu, 14 Sep 2017 13:47:11 -0000
Content-Type: text/plain

Integrating the following commit:

[
    commit 16de0149674ed12d983b77a453852ac2e64584b4
    Author: Ben Seri <ben@armis.com>
    Date:   Sat Sep 9 23:15:59 2017 +0200

    Bluetooth: Properly check L2CAP config option output buffer length

    Validate the output buffer length for L2CAP config requests and
    responses to avoid overflowing the stack buffer used for building the
    option blocks.

    Cc: stable@vger.kernel.org
    Signed-off-by: Ben Seri <ben@armis.com>
    Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index f808f9bb9c99..25d88833a943 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7c9e95ef538ddfed606500281e20c42bc1ac1ae0"
+SRCREV_machine ?= "1e691db7af642fff0222a1f1d1e9043c172699d5"
 SRCREV_meta ?= "804d2b3164ec25ed519fd695de9aa0908460c92e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 56dd6f40e895..50b9a56a005a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.4.87"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "7078ebf077771189f5da4b676f70dddc92abba42"
+SRCREV_machine ?= "b71c7b786aed26c0a1e4eca66f1d874ec017d699"
 SRCREV_meta ?= "804d2b3164ec25ed519fd695de9aa0908460c92e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 9e8f43c3cdb9..d300e69489c5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "799a97a6f555d98479a55d92e580d91e6f621118"
-SRCREV_machine_qemuarm64 ?= "7078ebf077771189f5da4b676f70dddc92abba42"
-SRCREV_machine_qemumips ?= "18ad0e32668a585380b7f48b5dacd288b0c882d3"
-SRCREV_machine_qemuppc ?= "7078ebf077771189f5da4b676f70dddc92abba42"
-SRCREV_machine_qemux86 ?= "7078ebf077771189f5da4b676f70dddc92abba42"
-SRCREV_machine_qemux86-64 ?= "7078ebf077771189f5da4b676f70dddc92abba42"
-SRCREV_machine_qemumips64 ?= "1b88be0ada672b2b74221d9a810d3072cb92cf37"
-SRCREV_machine ?= "7078ebf077771189f5da4b676f70dddc92abba42"
+SRCREV_machine_qemuarm ?= "840e2c02dde98ee9c584cacdd5bb0812e9dcd016"
+SRCREV_machine_qemuarm64 ?= "b71c7b786aed26c0a1e4eca66f1d874ec017d699"
+SRCREV_machine_qemumips ?= "27a547fe77b05ae63c3b973a029c3933ef62c164"
+SRCREV_machine_qemuppc ?= "b71c7b786aed26c0a1e4eca66f1d874ec017d699"
+SRCREV_machine_qemux86 ?= "b71c7b786aed26c0a1e4eca66f1d874ec017d699"
+SRCREV_machine_qemux86-64 ?= "b71c7b786aed26c0a1e4eca66f1d874ec017d699"
+SRCREV_machine_qemumips64 ?= "7e333c223b568704cc3303b2e922ff85a2a8f7ef"
+SRCREV_machine ?= "b71c7b786aed26c0a1e4eca66f1d874ec017d699"
 SRCREV_meta ?= "804d2b3164ec25ed519fd695de9aa0908460c92e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


