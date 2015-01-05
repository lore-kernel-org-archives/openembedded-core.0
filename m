Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id C563C60167
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 20:40:56 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id g10so28879249pdj.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jan 2015 12:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=/Wj29NgZ9zLacPTJSnDVr7egn4jLk/ZAheuDNEFw7Uo=;
	b=ZCaxfSUZeogE15d/ucRHbNPunvAFSMqiKENujHtMiEkb4vP6v4UopLFOUa2NWDLTCr
	HSYgqkoa40Cuytl43Zo9nX0ezr+Fz4Y6Ccc9M7bGcjhYr6botLAnG+i75irvQH5varvO
	qUCEGpxl+x4CKhMMXoHL+6J4FXOWWhU9KPbHN5+XE8/Wx4liUtHJmD755rXufCzFkK0c
	5deFheVH/yG1yGF0taKvipUPpmAny03vZW6dZfk+bDiSyjX1wI0K26uQqNZ6xjm9jxOF
	IHTPG/9wZGvFE1vlc620yS6G24sWsYeAH/Rzjoa4QwdBHz/ZkPB+ZZgimgeFYyBjo4jj
	FxTA==
X-Received: by 10.70.50.228 with SMTP id f4mr148616869pdo.27.1420490457076;
	Mon, 05 Jan 2015 12:40:57 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id rn15sm592657pab.10.2015.01.05.12.40.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Jan 2015 12:40:55 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon,  5 Jan 2015 12:40:41 -0800
Message-Id: <374fa372e3db41076592452c97623b9b7415c609.1420490240.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <4424464b88e41cee5acfde9076de68a2303f043e.1420490240.git.akuster808@gmail.com>
References: <4424464b88e41cee5acfde9076de68a2303f043e.1420490240.git.akuster808@gmail.com>
In-Reply-To: <cover.1420490240.git.akuster808@gmail.com>
References: <cover.1420490240.git.akuster808@gmail.com>
Subject: [PATCH 07/12] linux-yocto/3.10: update to v3.10.62
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
X-List-Received-Date: Mon, 05 Jan 2015 20:40:56 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Updating to the latest korg -stable update for the 3.10 series. Minor
merge conflict resolution was done with the standard/ltsi and
standard/preempt-rt branches.

(From OE-Core rev: a87bf5d3d435d333f5ee9d15b8c641b03ff4bb9c)

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 18 +++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index 91b37d3..8acbd2e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,13 +3,13 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "38885f87b7240587194597c3658ba2c0ac5960e7"
-SRCREV_machine_qemuppc ?= "535a7403beabe9c4aa394a1f9efa755eb33966c8"
-SRCREV_meta ?= "8f05306a8e6f5ee422d50c3317acce0cf9e6aada"
+SRCREV_machine ?= "94a79d98e40b51466600fb3375ad2908c38dd192"
+SRCREV_machine_qemuppc ?= "c1dcbac7751652784f180fdb91f87bc37fba8c52"
+SRCREV_meta ?= "f4ab00d96a3d8e443d7f7744ad996e184eac03b5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.10.59"
+LINUX_VERSION ?= "3.10.62"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index cc70388..9ea81b8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -5,12 +5,12 @@ require recipes-kernel/linux/linux-yocto.inc
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.10.59"
+LINUX_VERSION ?= "3.10.62"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "747e1cbd12b15db8bc2ae86e2359c1b113f120d6"
-SRCREV_meta ?= "8f05306a8e6f5ee422d50c3317acce0cf9e6aada"
+SRCREV_machine ?= "b2ac933df119a3444a32fcccf5e4ad453f5ac89d"
+SRCREV_meta ?= "f4ab00d96a3d8e443d7f7744ad996e184eac03b5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 043f2e0..978775a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -10,18 +10,18 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64  ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "896f87d1003331d7a307c9f855cdbb78c9a2a033"
-SRCREV_machine_qemumips ?= "9e616945464ab97a050da96a025d88c809d05144"
-SRCREV_machine_qemuppc ?= "692b2de590668de2e15461879cf9301a0e6fedf6"
-SRCREV_machine_qemux86 ?= "747e1cbd12b15db8bc2ae86e2359c1b113f120d6"
-SRCREV_machine_qemux86-64 ?= "747e1cbd12b15db8bc2ae86e2359c1b113f120d6"
-SRCREV_machine_qemumips64 ?= "d237cab9f483ea512ded4ea311902763c1a3ae68"
-SRCREV_machine ?= "747e1cbd12b15db8bc2ae86e2359c1b113f120d6"
-SRCREV_meta ?= "8f05306a8e6f5ee422d50c3317acce0cf9e6aada"
+SRCREV_machine_qemuarm ?= "f6b075991c91b7c2bb641b389757863e2fd34b8c"
+SRCREV_machine_qemumips ?= "48afdc632312b6cc26fe7bca151cfb66b2ebc308"
+SRCREV_machine_qemuppc ?= "cf35ea9ac92153858dadd2f4ab71cccd3a1fa26b"
+SRCREV_machine_qemux86 ?= "b2ac933df119a3444a32fcccf5e4ad453f5ac89d"
+SRCREV_machine_qemux86-64 ?= "b2ac933df119a3444a32fcccf5e4ad453f5ac89d"
+SRCREV_machine_qemumips64 ?= "ebdb374ca5130ef456d0baf75b6fe7a242932d0d"
+SRCREV_machine ?= "b2ac933df119a3444a32fcccf5e4ad453f5ac89d"
+SRCREV_meta ?= "f4ab00d96a3d8e443d7f7744ad996e184eac03b5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.10.59"
+LINUX_VERSION ?= "3.10.62"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
1.9.1


