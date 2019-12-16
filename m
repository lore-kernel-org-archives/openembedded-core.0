Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id 39A927FDD8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 16:00:28 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id r67so3176414pjb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 08:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=gs2x43ZN/3/pEokSOjJF6Zfk7bS45aCH4Zn2m2lps0I=;
	b=I2ITacFyTe82DcfnsbJxBiwN1Kb5yUVnn03sjnl/vEsybSS65TWtSEERAf0TGME4SP
	JkkJsdJ7i/Mkdkg9xK1Tv6c3Qtb/6HK2IDY8H8DYkegor49JnRhMRHE9JD8tn+OuhAjh
	jaizN+S+91r4VzSd00am1NjIifcQEl222+fUofWSXoQSDzuvCjlMLoBkmN67oAe133qn
	bh1fYP7nNn5g9yq63QN4aX9jctPEOoRDvQx4q4+4gP8sRDdkXxmOfvIayQO+gAjTYNqr
	jvltpPWfMpOC99CClCiLr9O5/7+MGTJbOiM8SZoKY81PcMBiDj+d5WrxfzjY+KIzRV47
	/MNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=gs2x43ZN/3/pEokSOjJF6Zfk7bS45aCH4Zn2m2lps0I=;
	b=F8rZ4W2buaWSezH9oxFTKZ21NC8u+marPCh5VOsE0ijXObslyN/06AerXJzifHyzzr
	604l86WVv5AaZWe/fxQ6u9V09fxSKjiYe/8rDltUwsDqvFQXJFLPk9R6nRJAHnkUWiBu
	fHVUOb/5OULG6q7epXFWu+J21jycon4x/0okIe+5S1YqOTx9i/sq7iRJjIK4fgOCvRdq
	0FCC6pikPH487pHwQgaJfmkXb06CDU5vfERYuDo5vKfrXPIXrvsguK6BZi7ceNnbSwlu
	ncivMvpRAzNQCnR+7fFp1fdsLZEpQQA7+j107Yv9NZrJis/xaLMbWwf8flmT/xdsLdAT
	Jpvg==
X-Gm-Message-State: APjAAAVas0V6F8Uk5o7CpCqmnKcILmMEA/Q5KzZtIM4LQxuPahxOSOxf
	8fb2JEbT8ZyfjV32PacA/swzvk4+Uxo=
X-Google-Smtp-Source: APXvYqz6mjmdLSiwvgalcw2SwDPoYyJuOkAazf/u9N4nkz3PDQAIu95/haETx0PbUt5j0vxpixnhQw==
X-Received: by 2002:a17:902:9f92:: with SMTP id
	g18mr16398487plq.161.1576512029190; 
	Mon, 16 Dec 2019 08:00:29 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e5c5:31c9:a010:f145])
	by smtp.gmail.com with ESMTPSA id
	g6sm19568697pjl.25.2019.12.16.08.00.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Dec 2019 08:00:28 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Dec 2019 08:00:08 -0800
Message-Id: <e68991ceb5933f7d03b96697e8a0ba0829feb320.1576511913.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1576511913.git.akuster808@gmail.com>
References: <cover.1576511913.git.akuster808@gmail.com>
Subject: [thud 18/18] linux-yocto/4.14: update to 4.14.154
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
X-List-Received-Date: Mon, 16 Dec 2019 16:00:29 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index 0ed2900..de6f5c9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "72075349c6af55a7a6d024f0aa241711653fcb97"
-SRCREV_meta ?= "1bd749b7ce4240e83024b10fa4a4a6b9de5a5e5f"
+SRCREV_machine ?= "3aa9671ae072f45665e72591be5636522c8a6215"
+SRCREV_meta ?= "a889c43359ca8bee705601817c50edf3c209bc09"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.14.143"
+LINUX_VERSION ?= "4.14.154"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index cb46307..52c02ca 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -4,7 +4,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.14.143"
+LINUX_VERSION ?= "4.14.154"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
@@ -12,8 +12,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "3d884bc92763f474cc0728d1feb0becad8ed37d5"
-SRCREV_meta ?= "1bd749b7ce4240e83024b10fa4a4a6b9de5a5e5f"
+SRCREV_machine ?= "38c3a6549d60a3b4a5ab0cb6a440929ba8502f7f"
+SRCREV_meta ?= "a889c43359ca8bee705601817c50edf3c209bc09"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index 4a92d27..0048735 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "v4.14/standard/base"
 KBRANCH_qemux86-64 ?= "v4.14/standard/base"
 KBRANCH_qemumips64 ?= "v4.14/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "bd85f4880bb890bf9c45ee6c2fd95f077d2bf67e"
-SRCREV_machine_qemuarm64 ?= "445a4787bd489eb6b3d5c172b9842dbe5a34d734"
-SRCREV_machine_qemumips ?= "3d07ac9aa6ca729674dfb763563202f18f9eedde"
-SRCREV_machine_qemuppc ?= "81ba8dbab3b1bfc371e539956be905809db0e41a"
-SRCREV_machine_qemux86 ?= "bc9d4b045fa0254d14ef3a667a200f02cb9af755"
-SRCREV_machine_qemux86-64 ?= "bc9d4b045fa0254d14ef3a667a200f02cb9af755"
-SRCREV_machine_qemumips64 ?= "3c4acadcbe2ee11043f7d0fce43a5181511d0935"
-SRCREV_machine ?= "bc9d4b045fa0254d14ef3a667a200f02cb9af755"
-SRCREV_meta ?= "1bd749b7ce4240e83024b10fa4a4a6b9de5a5e5f"
+SRCREV_machine_qemuarm ?= "e4e2990af921c2d1544d18efa5f7183f95289cd0"
+SRCREV_machine_qemuarm64 ?= "51c9e69ebef5d2d15dfbcdf098269d86e0e38317"
+SRCREV_machine_qemumips ?= "e70c76a3fe9cc785619d9e4c8e28cb4d4d76ecaf"
+SRCREV_machine_qemuppc ?= "6b6eab44d3a04294c233e0b47d6b7c6cbb6e9ffb"
+SRCREV_machine_qemux86 ?= "57278e88a6b0f7c6230f7429cab7e74229f2b7ce"
+SRCREV_machine_qemux86-64 ?= "57278e88a6b0f7c6230f7429cab7e74229f2b7ce"
+SRCREV_machine_qemumips64 ?= "4e099e87d223bfc1526543a5e4c5383cb2edda70"
+SRCREV_machine ?= "57278e88a6b0f7c6230f7429cab7e74229f2b7ce"
+SRCREV_meta ?= "a889c43359ca8bee705601817c50edf3c209bc09"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.14.143"
+LINUX_VERSION ?= "4.14.154"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.7.4


