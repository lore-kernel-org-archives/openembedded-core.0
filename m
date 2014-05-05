Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AC8DD65F11
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 15:07:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s45EAHQX004273
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 5 May 2014 07:10:17 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 5 May 2014 07:10:17 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 5 May 2014 10:10:11 -0400
Message-ID: <8db8c4ae3206c22d221f65281ff2e699de7b161b.1399297986.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1399297986.git.bruce.ashfield@windriver.com>
References: <cover.1399297986.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] linux-yocto/3.14: update to v3.14.2
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
X-List-Received-Date: Mon, 05 May 2014 15:07:35 -0000
Content-Type: text/plain

Updating to the korg 3.14.2 -stable release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 18 +++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index 330eda4f1fd1..c7b74d661d33 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,13 +3,13 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "b5ed38affb23ff64a0382ee0dd116ffe74c4a379"
-SRCREV_machine_qemuppc ?= "79cb133d2d1b0b816cc1cd888f4ed4ef81570793"
-SRCREV_meta ?= "09424cee646626c04105f08455a58fabb27eff31"
+SRCREV_machine ?= "c88f5ec9b328da501be970b814fbc9cc4a09fa4f"
+SRCREV_machine_qemuppc ?= "05629993752031b9de3f4792cfbd98caf60593da"
+SRCREV_meta ?= "4df1e2ed992adeac4da60ad5118d0237e8cb88df"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.14"
+LINUX_VERSION ?= "3.14.2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index c4cd331ab789..2110e8a45ec0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -4,12 +4,12 @@ KBRANCH = "standard/tiny/base"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.14"
+LINUX_VERSION ?= "3.14.2"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "144595ef6215a0febfb8ee7d0c9e4eb2eaf93d61"
-SRCREV_meta ?= "09424cee646626c04105f08455a58fabb27eff31"
+SRCREV_machine ?= "b0b9c962ea01f9356fc1542b9696ebe4a38e196a"
+SRCREV_meta ?= "4df1e2ed992adeac4da60ad5118d0237e8cb88df"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index 2c2cace0dd41..5271bb016356 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -10,18 +10,18 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "d7a5330e50f78f63789b91cb9880b38633d33450"
-SRCREV_machine_qemumips ?= "38f344fcab8c0ee29f40edb92dd6612eff4579bf"
-SRCREV_machine_qemuppc ?= "b28241db34ab66f9e86718d8c94276d65d2457bb"
-SRCREV_machine_qemux86 ?= "f9048769cc178f2f64ed492a9a649827167d9a34"
-SRCREV_machine_qemux86-64 ?= "144595ef6215a0febfb8ee7d0c9e4eb2eaf93d61"
-SRCREV_machine_qemumips64 ?= "c4e08d47c5eb36ae056f2eab82a74c3638e72e06"
-SRCREV_machine ?= "144595ef6215a0febfb8ee7d0c9e4eb2eaf93d61"
-SRCREV_meta ?= "09424cee646626c04105f08455a58fabb27eff31"
+SRCREV_machine_qemuarm ?= "54ecc26cb84e939753eee811395435f8a4377c86"
+SRCREV_machine_qemumips ?= "cc7b8670680fcd794dba0b21a1db1dbbda432924"
+SRCREV_machine_qemuppc ?= "5ac4b714c656323b6099e8ab435fc05903d69874"
+SRCREV_machine_qemux86 ?= "3904476fb890e014a244e1fc48342683d7ff7e0e"
+SRCREV_machine_qemux86-64 ?= "b0b9c962ea01f9356fc1542b9696ebe4a38e196a"
+SRCREV_machine_qemumips64 ?= "a9c251d64f5df58c41473ccb1d52143cc5247911"
+SRCREV_machine ?= "b0b9c962ea01f9356fc1542b9696ebe4a38e196a"
+SRCREV_meta ?= "4df1e2ed992adeac4da60ad5118d0237e8cb88df"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.14"
+LINUX_VERSION ?= "3.14.2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
1.8.1.2


