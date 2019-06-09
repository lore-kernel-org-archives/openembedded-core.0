Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id BDE007E53F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 14:54:11 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id s24so2624470plr.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2019 07:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=auiMrzFWOR3KsIIAxNG+N9k4k9JDaZ8x5bNRai/wfOU=;
	b=S2RxcONb0baCSgG17+ZNFDzQquHzzbch+lpJr2i2BYqEG0hxzQsI/Cgv7xu/kubkch
	qACKRSHzu+ntUHPtfzTPUaRnF8KMxi3Q7evPK46nvKTOW9eEvyzKB3sG75NuA3W0wKgX
	WBllv9FVWTgj5VAmDL7aQIBcpiMWPeCPswEXwORQ+e7NAEK5BrJ4OYOY8PxZsQBQA9C+
	2FDZR7w1GV/0nZy3arbUmpPcNPga+cS/gS6+MhIErKe1ovEHRgFkgqe/6NeZ6ijjUvGq
	SLirgBP4PPE0IThGC9QUEq3/5xz7TnnuiqUswVzzd3jfFo/Q1F8CLyEBRy2PMrKIr6ag
	rxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=auiMrzFWOR3KsIIAxNG+N9k4k9JDaZ8x5bNRai/wfOU=;
	b=G28b4+A/1yQ9IknEevJmmJ7E2tL+SK1/R86pAP3OQHGAfzToGY2tM6xWqmeuSRK+CL
	LJxn1szxPCInMu/3rJ3gWEq52p5QuK4htSUGmEyKJd/HW6azHEKSSQbd2OJRvTa4DFqF
	WQMtYA4+uxM8TFeYVT9DIvr+MEqCQEni7gpVk2vb8AX2ss111m/Wj3scGI4LfKtUmcCR
	+qL3b47BCMjIP1PWwX0IO5Fdvw/nWa1lTyO22H1BsNn+TzNmc1g3THr9ExZDx1AliD1G
	KB1G3mOVODYOxY6AqSk7m8pqEbZfnJ+k4n8Xt6Ca+nDSlZPsYcq82WhwaF50HpzwN01h
	R44w==
X-Gm-Message-State: APjAAAUfay2V5aJxC6/3AfXWthcXWS+UfCLtbuOZALswxR8QLfFWEAhb
	Yyv7U65h62pAIFJjqLxoMxP0Z3oh
X-Google-Smtp-Source: APXvYqwWS75n1HwtFtBJox7MnTTDRVX7lr1+JcnEWtNvVVB+daeRQG+2KFnep11eRriW5/tIc6693Q==
X-Received: by 2002:a17:902:724a:: with SMTP id
	c10mr11973190pll.298.1560092053035; 
	Sun, 09 Jun 2019 07:54:13 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:50d3:300:d9ff:2f1d])
	by smtp.gmail.com with ESMTPSA id d6sm7072188pgv.4.2019.06.09.07.54.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 09 Jun 2019 07:54:12 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Jun 2019 07:53:43 -0700
Message-Id: <e359d2eb4e0e92074a6180768c22ae7016002374.1560091882.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560091882.git.akuster808@gmail.com>
References: <cover.1560091882.git.akuster808@gmail.com>
Subject: [Warrior-next 08/27] linux-yocto-rt/5.0: update to -rt9
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
X-List-Received-Date: Sun, 09 Jun 2019 14:54:12 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto-rt to -rt9, which comprises the following commits:

   cc66f1b95af7 (HEAD -> v5.0/standard/preempt-rt/base) v5.0.14-rt9
   96957f0ca4a4 sched/completion: Fix a lockup in wait_for_completion()
   7108dfc6c002 iommu/dma-iommu: Remove iommu_dma_map_msi_msg()
   50e9a302a12e irqchip/gic-v3-mbi: Don't map the MSI page in mbi_compose_m{b, s}i_msg()
   4a4c41f25d90 irqchip/ls-scfg-msi: Don't map the MSI page in ls_scfg_msi_compose_msg()
   e6549dc52874 irqchip/gic-v3-its: Don't map the MSI page in its_irq_compose_msi_msg()
   21ab1a505f71 irqchip/gicv2m: Don't map the MSI page in gicv2m_compose_msi_msg()
   5c7e7ee1155f iommu/dma-iommu: Split iommu_dma_map_msi_msg() in two parts
   ed562a120218 genirq/msi: Add a new field in msi_desc to store an IOMMU cookie
   8269017c7c71 x86/fpu: Fault-in user stack if copy_fpstate_to_sigframe() fails
   834de13e9df3 v5.0.14-rt8
   60a1f2741b0b v5.0.10-rt7
   5cbcfdaf619f clocksource: improve Atmel TCB timer driver
   dde28bc12270 x86/ima: Check EFI_RUNTIME_SERVICES before using
   c02d0b49cf87 printk: kmsg_dump: remove mutex usage
   b4ccebf15704 locking/rwsem: Rename rwsem_rt.h to rwsem-rt.h
   d5758ba7a93e x86/fpu: Remove unnecessary saving of FPU registers in copy_fpstate_to_sigframe()
   e16351073c50 x86/fpu: Fault-in user stack if copy_fpstate_to_sigframe() fails
   14ff99cb7d48 v5.0.10-rt6
   843445383127 v5.0.7-rt5
   e886711e0449 drm/i915: Don't disable interrupts independently of the lock
   69e41e29c6ad clocksource: improve Atmel TCB timer driver
   c2e266f415d0 x86: load FPU registers on return to userland (Update to v9)
   4be2fd56d44f v5.0.7-rt4
   6fb29acc8efe (origin/v5.0/standard/preempt-rt/base) genirq: Prevent use-after-free and work list corruption on rt

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index 69c5909..36db6b6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7365aab1a7b980f7d81b37f96841cbe88a306b7e"
+SRCREV_machine ?= "cc66f1b95af7b75d25b0155203df9db801273fd2"
 SRCREV_meta ?= "2bc19ce252b1ce753056b32c55f55f515698b42a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.7.4


