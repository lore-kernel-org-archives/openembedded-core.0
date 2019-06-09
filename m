Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9F90C7E550
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 14:54:14 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id q10so3798221pff.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2019 07:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=na2J/41s7GNxysKNyRJbA3I3YCdB6txSTzTF1nH32c8=;
	b=D65UFiEL1hjwy5/iZ8VJmRjnash5mQOFbPf6/WPZ3fxJGyn4WBi9ojGr+gX9FgAr7L
	Z6y2ILyDN7MKoLUbbLRHKmZ6p8fP9NaZNe8uK7GIFXsBnnf6VekGdeKwx+qakhvHqLGR
	hYwZy8RM9DseOSlCGqgkLGW2T+NGCd7vp0G6pb+IaNBXiISV43NJE/wrMclX8smVX6OV
	7vbInvZnVX4T++Hz6piqnMHjZMhj2v0KnxUjc4KixwRQ1VLSmM7Ohqxvh7k0a75T3F7H
	DcJjtZLP8WYlc/2F03DqWzuNPdExJezVc0heTdJPXdcXvsAgghuLijGenNMtK7FYAZoZ
	nGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=na2J/41s7GNxysKNyRJbA3I3YCdB6txSTzTF1nH32c8=;
	b=ec8pTe9WLvUtDVZnWw7BsSRqfeUprmpK3TcmieLoV9cDYtfxC9XwieVd5SiA7W3liK
	2j4JdCUE1Oim+5qW6xi4g3kZXbhHIiYkqZJxMg/IEo0EdJM7+tSIzJQ9dAdnuXURa7sZ
	0qicoGOjQK4Z3YaRFT/VQX0NTsvnmsrcsyIh+1FNOp7gS9Y57bVNoNyTtJ0v3eg7Oc9Q
	OqylJBcNBMAauF3goB+Tk9/RXh6s6H52Bp/1GcVEMTs3V122W27WYJQwnfUnZX14YvYz
	28pqm/8kfXB7N0hFLsUYl2mgTGB/5sZuRdWpqlhqLSGejax3Ed3u1NbcD2r7Mzk1dStm
	e7XQ==
X-Gm-Message-State: APjAAAV2sPalofFsmPOPO6Ze9MaNgPsQUZpNkvmONbsV4DQfb8Y1n3pW
	0ZL5RKhVTmDSvkrVwvKI929rqoUB
X-Google-Smtp-Source: APXvYqxUp/rm5/oByuNB18IiBRmQyM9mIVKxoXS5hPomu1TBSqHurr/JDVUdn7+f0ipc4V/Gu7UWUQ==
X-Received: by 2002:aa7:9197:: with SMTP id x23mr33546201pfa.161.1560092055517;
	Sun, 09 Jun 2019 07:54:15 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:50d3:300:d9ff:2f1d])
	by smtp.gmail.com with ESMTPSA id d6sm7072188pgv.4.2019.06.09.07.54.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 09 Jun 2019 07:54:15 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Jun 2019 07:53:46 -0700
Message-Id: <1000afaebc2174e2c55f177a1e0a937758a28523.1560091882.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560091882.git.akuster808@gmail.com>
References: <cover.1560091882.git.akuster808@gmail.com>
Subject: [Warrior-next 11/27] linux-yocto/5.0: fix systemtap on arm
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
X-List-Received-Date: Sun, 09 Jun 2019 14:54:14 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The following commit is part of 5.0.17+:

    ARM: fix function graph tracer and unwinder dependencies

    [ Upstream commit 503621628b32782a07b2318e4112bd4372aa3401 ]

    Naresh Kamboju recently reported that the function-graph tracer crashes
    on ARM. The function-graph tracer assumes that the kernel is built with
    frame pointers.

    We explicitly disabled the function-graph tracer when building Thumb2,
    since the Thumb2 ABI doesn't have frame pointers.

    We recently changed the way the unwinder method was selected, which
    seems to have made it more likely that we can end up with the function-
    graph tracer enabled but without the kernel built with frame pointers.

    Fix up the function graph tracer dependencies so the option is not
    available when we have no possibility of having frame pointers, and
    adjust the dependencies on the unwinder option to hide the non-frame
    pointer unwinder options if the function-graph tracer is enabled.

    Reviewed-by: Masami Hiramatsu <mhiramat@kernel.org>
    Tested-by: Masami Hiramatsu <mhiramat@kernel.org>
    Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
    Signed-off-by: Sasha Levin <sashal@kernel.org>

As such, we no longer have UNWINDER_ARM enabled in our ARM builds by
default, since we do have FUNCTION_GRAPH_TRACER enabled in the common
ftrace configuration.

We disable FUNCTION_GRAPH_TRACER for ARM, which allows UNWINDER_ARM to
remain enabled and hence systemtap work out of the box for our ARM
reference builds. Obviously, BSPs or other users of the fragments can
make a different decision, but we chose unwinder to be on by default.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index 2249feb..e1d2b2e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "9c1e84c9b81b6bf1df55f26f2e0517266c37f7eb"
-SRCREV_meta ?= "d4b67d66fd9d40e4ec149500f57b991c83362a17"
+SRCREV_meta ?= "ff7928637fcdf5a7176a2f735f8cb21cd0f4b219"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index 0c24070..7024d70 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "fabee455f397ba8054f35a3ad5f2250bbad93bef"
 SRCREV_machine ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_meta ?= "d4b67d66fd9d40e4ec149500f57b991c83362a17"
+SRCREV_meta ?= "ff7928637fcdf5a7176a2f735f8cb21cd0f4b219"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index 0510187..214e83b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
 SRCREV_machine_qemux86-64 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
 SRCREV_machine_qemumips64 ?= "5a8b27bcc0b16077ab8edfcd3fb25c80dc2c652e"
 SRCREV_machine ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_meta ?= "d4b67d66fd9d40e4ec149500f57b991c83362a17"
+SRCREV_meta ?= "ff7928637fcdf5a7176a2f735f8cb21cd0f4b219"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.7.4


