Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 945896DD70
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 17:33:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAQHXmXu029322
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Nov 2013 09:33:48 -0800 (PST)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 26 Nov 2013 09:33:47 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 26 Nov 2013 12:33:43 -0500
Message-ID: <5464ce8d7a36911a0b1be786d6069ce1955d905c.1385487115.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1385487115.git.bruce.ashfield@windriver.com>
References: <cover.1385487115.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux/yocto-3.10: merge v3.10.19
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
X-List-Received-Date: Tue, 26 Nov 2013 17:33:49 -0000
Content-Type: text/plain

Updating the linux-yocto-3.10 SRCREVs to the latest korg -stable
release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 18 +++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index c8b9888..d040e3e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,13 +3,13 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "baed5453f830d06075a4480ec0ded8ff785828bc"
-SRCREV_machine_qemuppc ?= "26a465af89793c7dc5a81661449c5a9f0ad06dee"
-SRCREV_meta ?= "6ad20f049abd52b515a8e0a4664861cfd331f684"
+SRCREV_machine ?= "a9b2df9bd27b137408d627ce1f75f1177eae647e"
+SRCREV_machine_qemuppc ?= "601746ed79b7ccc79e31166dea9b2906c915a7e3"
+SRCREV_meta ?= "41072c6288b1ab468670ebf7b3d411fbc177317c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.10.17"
+LINUX_VERSION ?= "3.10.19"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index 6bd8ae6..0939ce6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -5,12 +5,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.10.17"
+LINUX_VERSION ?= "3.10.19"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "c03195ed6e3066494e3fb4be69154a57066e845b"
-SRCREV_meta ?= "6ad20f049abd52b515a8e0a4664861cfd331f684"
+SRCREV_machine ?= "2d96adf459037aec2c0027503c3eddfc20de9ad4"
+SRCREV_meta ?= "41072c6288b1ab468670ebf7b3d411fbc177317c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 1f1a9dc..c678a8b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -3,18 +3,18 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "5714b747cf0087bb964cbb962db8d3d2041f3177"
-SRCREV_machine_qemumips  ?= "e87d2cb44bc5d10f3619871541849064bf0d79b1"
-SRCREV_machine_qemuppc ?= "3e99f981fea427696f63af7fd8e99bf05039efee"
-SRCREV_machine_qemux86 ?= "c03195ed6e3066494e3fb4be69154a57066e845b"
-SRCREV_machine_qemux86-64 ?= "c03195ed6e3066494e3fb4be69154a57066e845b"
-SRCREV_machine_qemumips64 ?= "8d21f71847640fc052bda1bf1f3792634cae5bb1"
-SRCREV_machine ?= "c03195ed6e3066494e3fb4be69154a57066e845b"
-SRCREV_meta ?= "6ad20f049abd52b515a8e0a4664861cfd331f684"
+SRCREV_machine_qemuarm ?= "9aac62bcd594648a7da61fa89e7da14eb2747e31"
+SRCREV_machine_qemumips  ?= "141675948177bed049477ea53203dd0fc3c105c4"
+SRCREV_machine_qemuppc ?= "ebcaee076da19ffe0e317089566d22c199f16fad"
+SRCREV_machine_qemux86 ?= "2d96adf459037aec2c0027503c3eddfc20de9ad4"
+SRCREV_machine_qemux86-64 ?= "2d96adf459037aec2c0027503c3eddfc20de9ad4"
+SRCREV_machine_qemumips64 ?= "7acc7b9b44fb0b97a50e75387a11a24dfd5c242a"
+SRCREV_machine ?= "2d96adf459037aec2c0027503c3eddfc20de9ad4"
+SRCREV_meta ?= "41072c6288b1ab468670ebf7b3d411fbc177317c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.10.17"
+LINUX_VERSION ?= "3.10.19"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
1.8.1.2


