Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4D7797E54C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 14:54:16 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id s24so2624508plr.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2019 07:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=pqSfXKzsCRRvWI+altNuUGGqkkSdkYaf8qLGShYwfEk=;
	b=utE45RCZu7304YBa1nxP3sp6upDjHxRQ1uC+tmmLrnThoDjmrYmKHYV55NDwWeIf7b
	vF7Tfw+c9lNOWenGaW0fJjq1OKAfOKOR0Yf5R5OlUHnIfkZMbwOmIFdwoinI3VjHKHn9
	88d8OInO6LqVK90j6iTbgrDpLEUvnImX5kJELcVyDyTYd9skGjaxlTi1BYJEy1xgc4nv
	+XjCq5Kon1iLRhWWNeudWcaUKg2FY31PX9r4DlGkQpCvy3dZRgj6PfP6ft7iI4AWsTaR
	1+yHRqXt7y+sSKaIlfVkc1V+D+EilCjN/7ZW9NLxccZSBc1VWX/XiJvNz5Htw0BDpg7q
	FnZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=pqSfXKzsCRRvWI+altNuUGGqkkSdkYaf8qLGShYwfEk=;
	b=FwaWGlxTNyiqPaiYykOsxrXnytyi3FZqi+05OCS4w1wu10uMCIbM2MK2gWFohzjcqA
	P+kKLsL7NDm6jVZZCF7hCjsCiTdudi3UkZ4s9LLp6C3pcF0/mnYp1OU+dE57m/UvMkLs
	mfdDwSx8hWvNbOJ0tT7OIzQ3ntEseM5tU2AaB/E4d4kZ0FNuSjqRTDAKntlTK+aUUlV7
	BD9Htl435UnuAhnjhMOccEFABBvAjQf3LElZfRdgECpFB7MUOvGLT8cV+hg45d8x5evM
	JBEo19aU/4Uy9xnLpJl2ExD7xb+7F1p9At3MXFS4+WZ5p7+k+rMBCNABOk46RAu2DGe5
	gmZA==
X-Gm-Message-State: APjAAAVYEIzlG0A41R7VPOkvl0ylTvqWTSlUstUfItFs8LIgJDU09jKD
	DtGLosIIZ/9gPtIIYf2ZbPKSzVOD
X-Google-Smtp-Source: APXvYqwDcb6HjzZRfm2UO0tOvV9SuUOkkkdy6taXrRm8opBWkarORp+oZVwaHANLKEM1pSEfydiv1g==
X-Received: by 2002:a17:902:3103:: with SMTP id
	w3mr62795529plb.187.1560092057192; 
	Sun, 09 Jun 2019 07:54:17 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:50d3:300:d9ff:2f1d])
	by smtp.gmail.com with ESMTPSA id d6sm7072188pgv.4.2019.06.09.07.54.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 09 Jun 2019 07:54:16 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Jun 2019 07:53:48 -0700
Message-Id: <90be50fe6af4357b9249c7ef1ea8a49617f47232.1560091882.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560091882.git.akuster808@gmail.com>
References: <cover.1560091882.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [Warrior-next 13/27] linux-yocto: ptest: Add SCSI debug configuration for util-linux
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
X-List-Received-Date: Sun, 09 Jun 2019 14:54:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping the SRCREVs to pickup the following configuration tweak for
ptest usage:

  Author: Mariano López <just.another.mariano@gmail.com>
  Date:   Sat Jun 1 17:30:46 2019 -0500

      Add SCSI debug configuration for util-linux ptest

      The ptests from util-linux require the scsi debug module to be installed
      for a subset of tests. This patch would allow to build the kernel module
      for the linux-yocto kernel.

      Signed-off-by: Mariano López <just.another.mariano@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb    | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb  | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb       | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index ef1d2a5..6604bdf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "4dbcaca4c9ff89e866d2b5d01df005f317c618a4"
-SRCREV_meta ?= "6e8033d26894b07e17c48abb5951cc3d4dd9b2a9"
+SRCREV_meta ?= "ad235db461bf4595c668700ca8a909c322009cc1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index e1d2b2e..1fe28b1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "9c1e84c9b81b6bf1df55f26f2e0517266c37f7eb"
-SRCREV_meta ?= "ff7928637fcdf5a7176a2f735f8cb21cd0f4b219"
+SRCREV_meta ?= "31de88e51d100f2c3eefb7acb7390b0144bcfc69"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index 22aac72..4ca11d7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "a3cd9d732b27e78f94634924b7232b6280dae002"
 SRCREV_machine ?= "f0c6c85e155632580bd44a5db01cbb19dcc1559c"
-SRCREV_meta ?= "6e8033d26894b07e17c48abb5951cc3d4dd9b2a9"
+SRCREV_meta ?= "ad235db461bf4595c668700ca8a909c322009cc1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index 7024d70..a9c463c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "fabee455f397ba8054f35a3ad5f2250bbad93bef"
 SRCREV_machine ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_meta ?= "ff7928637fcdf5a7176a2f735f8cb21cd0f4b219"
+SRCREV_meta ?= "31de88e51d100f2c3eefb7acb7390b0144bcfc69"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index c6f5f0f..a5fdafe 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "f0c6c85e155632580bd44a5db01cbb19dcc1559c"
 SRCREV_machine_qemux86-64 ?= "f0c6c85e155632580bd44a5db01cbb19dcc1559c"
 SRCREV_machine_qemumips64 ?= "d9c77fe2a6038848fbadd660882b78e590c3252e"
 SRCREV_machine ?= "f0c6c85e155632580bd44a5db01cbb19dcc1559c"
-SRCREV_meta ?= "6e8033d26894b07e17c48abb5951cc3d4dd9b2a9"
+SRCREV_meta ?= "ad235db461bf4595c668700ca8a909c322009cc1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA} \
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index 214e83b..da795d9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
 SRCREV_machine_qemux86-64 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
 SRCREV_machine_qemumips64 ?= "5a8b27bcc0b16077ab8edfcd3fb25c80dc2c652e"
 SRCREV_machine ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_meta ?= "ff7928637fcdf5a7176a2f735f8cb21cd0f4b219"
+SRCREV_meta ?= "31de88e51d100f2c3eefb7acb7390b0144bcfc69"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.7.4


