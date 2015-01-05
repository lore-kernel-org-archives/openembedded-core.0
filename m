Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 55DA972828
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jan 2015 20:40:54 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id y13so28870778pdi.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jan 2015 12:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Kxv0HCl9zhTT97BpWtUXx6/hLL9qWjnBBE1HrGobddE=;
	b=hRSggzhvHn+S8Cm/xDAtHWi8j+LZlWP58f6knHQOyS9wi9ddXo3lHRw9vLLz8Avgi7
	CkW5vP0JFdVZgMuSVMXPXzrBXVERjosJHKtTrDzYUzLEetihccsnncFsELnCR/uvxwFp
	a9+fijI7rHzH3DP2BmVRO2LwFLgO1fZVelQ64Y0iKvZrAmcxiw6ATOTEnDlrWGmf7Ni8
	Ck8XnIqWNjz17Bo5bE4AHzpL+J7QtByE0NnycKIUJJRIlCsn/hNa/EvwVv/TOSfjz4JR
	4uRfXHSMymhNsIaPYEFtlbTFxUxwlu9ck11sUuZSCeY1nBIpz0R9eNY3roHRBqcdC+Hc
	7P7A==
X-Received: by 10.66.121.230 with SMTP id ln6mr149483439pab.82.1420490454940; 
	Mon, 05 Jan 2015 12:40:54 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id rn15sm592657pab.10.2015.01.05.12.40.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Jan 2015 12:40:53 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon,  5 Jan 2015 12:40:40 -0800
Message-Id: <175a2dea59070527d5d370abaffefbe71b9df703.1420490240.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <4424464b88e41cee5acfde9076de68a2303f043e.1420490240.git.akuster808@gmail.com>
References: <4424464b88e41cee5acfde9076de68a2303f043e.1420490240.git.akuster808@gmail.com>
In-Reply-To: <cover.1420490240.git.akuster808@gmail.com>
References: <cover.1420490240.git.akuster808@gmail.com>
Subject: [PATCH 06/12] linux-yocto/3.10: update to v3.10.59
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
X-List-Received-Date: Mon, 05 Jan 2015 20:40:54 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Updating to the latest 3.10 -korg stable update. We also bring in a meta
change for the valley island IO configuration.

(From OE-Core rev: 22d5ac7e1fc096dc11c766eda91c9e131398c6c5)

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 18 +++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index ad55a2e..91b37d3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,13 +3,13 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "cbaa8c8b83a7da70b94cc6cc1a25090071af4c3f"
-SRCREV_machine_qemuppc ?= "41338ab2a1c19435e24bbd162ff6b3f8b90d7afa"
-SRCREV_meta ?= "f79a00265eefbe2fffc2cdb03f67235497a9a87e"
+SRCREV_machine ?= "38885f87b7240587194597c3658ba2c0ac5960e7"
+SRCREV_machine_qemuppc ?= "535a7403beabe9c4aa394a1f9efa755eb33966c8"
+SRCREV_meta ?= "8f05306a8e6f5ee422d50c3317acce0cf9e6aada"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.10.55"
+LINUX_VERSION ?= "3.10.59"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index 9e33aa6..cc70388 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -5,12 +5,12 @@ require recipes-kernel/linux/linux-yocto.inc
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.10.55"
+LINUX_VERSION ?= "3.10.59"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "3677ea7f9476458aa6dec440243de3a6fb1343a9"
-SRCREV_meta ?= "f79a00265eefbe2fffc2cdb03f67235497a9a87e"
+SRCREV_machine ?= "747e1cbd12b15db8bc2ae86e2359c1b113f120d6"
+SRCREV_meta ?= "8f05306a8e6f5ee422d50c3317acce0cf9e6aada"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index e612d36..043f2e0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -10,18 +10,18 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64  ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "9c8da40f662806406940decf972841c1b86895a5"
-SRCREV_machine_qemumips ?= "96adff9ce54c009ba90c3ddcaa6d16beb7a9c2b3"
-SRCREV_machine_qemuppc ?= "cf3a9a021e2abb3b19807b2ba3c29c1d0918730b"
-SRCREV_machine_qemux86 ?= "3677ea7f9476458aa6dec440243de3a6fb1343a9"
-SRCREV_machine_qemux86-64 ?= "3677ea7f9476458aa6dec440243de3a6fb1343a9"
-SRCREV_machine_qemumips64 ?= "89ab3082e01c4d98f9d14630aa904dba641c5373"
-SRCREV_machine ?= "3677ea7f9476458aa6dec440243de3a6fb1343a9"
-SRCREV_meta ?= "f79a00265eefbe2fffc2cdb03f67235497a9a87e"
+SRCREV_machine_qemuarm ?= "896f87d1003331d7a307c9f855cdbb78c9a2a033"
+SRCREV_machine_qemumips ?= "9e616945464ab97a050da96a025d88c809d05144"
+SRCREV_machine_qemuppc ?= "692b2de590668de2e15461879cf9301a0e6fedf6"
+SRCREV_machine_qemux86 ?= "747e1cbd12b15db8bc2ae86e2359c1b113f120d6"
+SRCREV_machine_qemux86-64 ?= "747e1cbd12b15db8bc2ae86e2359c1b113f120d6"
+SRCREV_machine_qemumips64 ?= "d237cab9f483ea512ded4ea311902763c1a3ae68"
+SRCREV_machine ?= "747e1cbd12b15db8bc2ae86e2359c1b113f120d6"
+SRCREV_meta ?= "8f05306a8e6f5ee422d50c3317acce0cf9e6aada"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.10.55"
+LINUX_VERSION ?= "3.10.59"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
1.9.1


