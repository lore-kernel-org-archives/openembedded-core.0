Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id BCA747E511
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 14:54:13 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q10so3798210pff.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2019 07:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=iF9QAEmO8LSJPhkxUA4fDj7+FHtKB71tvN+eS0OlKOI=;
	b=gJsSip15WIDV1N8gdxNWZmu/C+7S35pIbbL643KJogrG3VUjXdNnpYo2hZdWGpaR+/
	UFzhEnBC4SWfQHQ6dPLFfWxjXxgPqNYRMneos9i3CwAls9KM3jvNRknHnsc/DmSmhS8i
	6VAKuld1A0IuRV6s+R4gkxzS/YiV1d5+5XRd6XVYjB3vF81r1gZlw9hgfq+m4gok721K
	RzHdyWam4PQgQA0zmNI5sJzOD1kzQwhL7uoYIXCKgcMU2SHvA3V8xpNBqX2P/XXHoXMh
	RdXX9K+QenuvYoyCyQkt+ypbcj7xB1J5SOUx0GGrHbiQuMfYtYiFH0SlHIlb0SFyqW2w
	mIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=iF9QAEmO8LSJPhkxUA4fDj7+FHtKB71tvN+eS0OlKOI=;
	b=q74cybsUh1Mfv17xLQXGj9DHTVBO4cxDOtE+/8UrrbFv/TFpiQiYgiut50AYftfN7L
	WV04cWAZEfabp8+19MNFGCL53j1ds/Wfe6uC5AqIBEp8BV8hqN5t0o8tb8iY8GOp5ET/
	6oloNoRKivKpRtkSM4ZA4uwjxWr/ALom9WSTJsnWjVRT07+VR/m7PI7pS9O/rH3z9qPg
	vD7jJttEqzOYcEgkcUfq1cq2yzu4BP4eIWQLMC/LZWMKQOtR1c2/1cu886hucqsZ1w9s
	Mgc2Z/cdBLqskfgu/ctxEGnw0cvOQTyqJCD25kIMmVhe44PxNmDO+vGclHw8Tcz45nhq
	E0jw==
X-Gm-Message-State: APjAAAVP3NkcRPRhysmUBqtZ6bwNeGxJfnxTd89JdL1UYh1QlUM2VwkV
	K3+m5FQczLDBg8R55uatCdcQU89H
X-Google-Smtp-Source: APXvYqw3uXjwQgYd1JXB/jOi7/TFLLps2VEIXPQ+zSn4F84eYGCscyG0/Xp+0cXLyNMqUA4SbnclRw==
X-Received: by 2002:a62:1456:: with SMTP id 83mr18190345pfu.228.1560092054679; 
	Sun, 09 Jun 2019 07:54:14 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:50d3:300:d9ff:2f1d])
	by smtp.gmail.com with ESMTPSA id d6sm7072188pgv.4.2019.06.09.07.54.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 09 Jun 2019 07:54:14 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Jun 2019 07:53:45 -0700
Message-Id: <a43291c3dc735c03b6fe77e946ec1a56d728d25f.1560091882.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560091882.git.akuster808@gmail.com>
References: <cover.1560091882.git.akuster808@gmail.com>
Subject: [Warrior-next 10/27] linux-yocto-rt/5.0: update to -rt11
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
X-List-Received-Date: Sun, 09 Jun 2019 14:54:13 -0000

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb   | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index b8ca4a2..2249feb 100644
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
index b3bb1f4..0c24070 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "fabee455f397ba8054f35a3ad5f2250bbad93bef"
 SRCREV_machine ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_meta ?= "9262e21627a82956fb85eef0024135ce5179c73b"
+SRCREV_meta ?= "d4b67d66fd9d40e4ec149500f57b991c83362a17"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index 1b2224d..0510187 100644
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
2.7.4


