Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2E9E97E428
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 12:44:56 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id g24so9576658iti.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 05:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=yHvJVTUpAzxvrDWfKfLBenxgqMNKmjg8L1d8uOmR8tM=;
	b=DudZgf1J6h+mPLKOkPO7v9iP+VALMz8Sw5j6fh5uHtMjsDoRsf2jK8NpD9ZDRlL4AZ
	3gd5m4xtCV0gv8lfy+Y/tvz1o03YZP6HOdLCdDgwS0J+M31zvxkg+eGbJ3209Y6JfEcE
	ZuaFh8W7B8uoDxe73b02lTeO5MEzaPj+U3blVzliQlzGAWHYPbd6nvgu4YcmpeNgBG0L
	XlW1YAd1VY4BcmlS9+0G5ZcHnM3sm8gv460lhla2GwU3hSlIAnY+QwJlWUWpcGG1JgcO
	Wo9YzoX87BMbyqFxUI4+kUdykXgkMW0hOFkJjI9icEnljzmj1UNduKg0DSKP5U2ltsjr
	yqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=yHvJVTUpAzxvrDWfKfLBenxgqMNKmjg8L1d8uOmR8tM=;
	b=QVh1U+dMVsX2Gsr8fecOgCCf6ggiLIdilRrK53gLPD2hk6awu8V9gHqBJAV0Krxafc
	yejY/e2Q1Mk2rRlw6PxQbib1EdLLC8/XI2XBL3xurtuRwKQbavrmsRliD87nr3krWvQG
	XFcSbBVFp1ccad5LO+Ugi5L4OXnIaL7RIS3KUmbNFGDNmI8Xeu5odKmPbSj+ZLc4WGPV
	KpkGeo30kBCYNvPCOqqJm1J5Z+Vccqqy0hwhtPPm7pPjt8YzE72RAveEDQKLHdIKl/PR
	/0gE6GBHtmwzZr7TLtn+GX1Fex7nD83+BOuZ4T9wfR2gYaZPpmFb4/5IIqgp+UvNaEhT
	dLeA==
X-Gm-Message-State: APjAAAXMw4G97PABwHr0xfT25FQb5E9gPt3wmhhHDfaZ51CXwGPbNjoN
	DnZlPYRguaNZ2ZvfSFBEDh8=
X-Google-Smtp-Source: APXvYqylv42aXX9a+GyUn/IOvdDBHfM4br9AHrbsXcMvnmrm+Az6m2+sLrOvox6LGGeRzYz0boO2Bg==
X-Received: by 2002:a05:660c:917:: with SMTP id
	s23mr2632479itj.166.1559220297180; 
	Thu, 30 May 2019 05:44:57 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	s70sm1034266itb.16.2019.05.30.05.44.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 May 2019 05:44:56 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Thu, 30 May 2019 08:44:43 -0400
Message-Id: <20edc110d973d65d8c56810e32bae475a869226a.1559220004.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1559220004.git.bruce.ashfield@gmail.com>
References: <cover.1559220004.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 9/9] linux-yocto-rt/5.0: update to -rt11
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
X-List-Received-Date: Thu, 30 May 2019 12:44:56 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating the 5.0 -rt to -rt11, which comprises the following commits:

   9c1e84c9b81b v5.0.19-rt11
   c4258b70deda workqueue: rework
   2a0f03c9daff softirq: rework
   cb38c9a00313 Revert "drm/i915/fence: Do not use TIMER_IRQSAFE"
   0ffa8402bf10 clocksource: TCLIB: Add proper depend
   6a2ecc186d9a arm: imx6: cpuidle: Use raw_spinlock_t
   c302271409c2 locking/lockdep: Don't complain about incorrect name for no validate class
   4042bcac2c90 v5.0.19-rt10
   d6ad4a85a911 genirq: Handle missing work_struct in irq_set_affinity_notifier()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb   | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index b8ca4a2721..2249feb9fe 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9376c193ebe7db89847195a749c2a200a1273c33"
-SRCREV_meta ?= "9262e21627a82956fb85eef0024135ce5179c73b"
+SRCREV_machine ?= "9c1e84c9b81b6bf1df55f26f2e0517266c37f7eb"
+SRCREV_meta ?= "d4b67d66fd9d40e4ec149500f57b991c83362a17"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index b3bb1f4c52..0c240708df 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "fabee455f397ba8054f35a3ad5f2250bbad93bef"
 SRCREV_machine ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_meta ?= "9262e21627a82956fb85eef0024135ce5179c73b"
+SRCREV_meta ?= "d4b67d66fd9d40e4ec149500f57b991c83362a17"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index 1b2224d0c1..0510187197 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
 SRCREV_machine_qemux86-64 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
 SRCREV_machine_qemumips64 ?= "5a8b27bcc0b16077ab8edfcd3fb25c80dc2c652e"
 SRCREV_machine ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_meta ?= "9262e21627a82956fb85eef0024135ce5179c73b"
+SRCREV_meta ?= "d4b67d66fd9d40e4ec149500f57b991c83362a17"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1


