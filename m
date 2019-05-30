Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id EC58A7E414
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 12:44:53 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id s16so9108567ita.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 05:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=1+MSl1VLswh8p1WSY8RehUbpLcLgrUQihu5N6Z5O8NU=;
	b=Mf25JBIRFt6iZni0Q6e348PhV7U+1dPvGjiPwCdUL4sMb7zO2dCHFfBbJCjipLEwlv
	rVM6Kvbdrmdsdhu84qCy5zsYTKqiMzcRZAmOCj4LL0bobKYJMO7fC8u2wUG/7N0Y/Oip
	fIW/1CSLw/9/MkYUq/2dIw26YYdriE5N+Bl07Uum+pkhjp53Z2IVVG9YhCfDgwqRGDIj
	FFrL+4IC8PSQUTDTjvWcu62nSNtDxvke9tsbnXEOdcG8KqY+YGWeAtN9vzw7QcNO7e6r
	AeeAdKSiguWjk/UVJRlMVqf/IVv/FOo8wYNgynUyJjjga67muBpyltBpuIxoIGF0CVyU
	1DwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1+MSl1VLswh8p1WSY8RehUbpLcLgrUQihu5N6Z5O8NU=;
	b=i4nnFoIDKUHdhf1J/LvP5je12dHHJoL/11ttVv+B+BKJ/6OvmaxCm2U5vaU//l13Yw
	A65ORcKko8KCLO2n2gFqQUJD3dWfWZNVXYDRAMblMIhqXmY/S9V+BibxtiPFaZrkU12/
	eDa848Sz7hjZXiLR433SP0qClQitY+f1pGOLaxXRFkDCb1x0BhyDikNYkumw9gbDAw7Q
	P0Cq8fWprj5TbMAeGAt3I+TAFIU3wYqBXsC/objcUbyyE9olrkUA/S2gvupRPJkoHNsN
	To/ICJV9lsviQ1WquzaEWA8KOVOd1rV0AuADg60arki+vXga8utXkl9q4De8wrMzcK3n
	Gz5g==
X-Gm-Message-State: APjAAAUL5f+aSsSqFXNjKgL8EIrt4i2egBw0eLZDorDI5cEPPrEHdWS0
	SEa1mGtwFt9VqS9BTnbPGbjQjHnaF2c=
X-Google-Smtp-Source: APXvYqzwhwX76mTG5mcSYDJnUzRxGiXeLdJTtacQsoG9iUAOSP0E8g92UtXAnjQNMyurTrRiFnDRFQ==
X-Received: by 2002:a02:5502:: with SMTP id e2mr2147224jab.87.1559220294969;
	Thu, 30 May 2019 05:44:54 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	s70sm1034266itb.16.2019.05.30.05.44.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 May 2019 05:44:54 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Thu, 30 May 2019 08:44:41 -0400
Message-Id: <ea6bc50fdf729d688ab660f9acd870bcba8b37bf.1559220004.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1559220004.git.bruce.ashfield@gmail.com>
References: <cover.1559220004.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/9] linux-yocto-rt/5.0: update to -rt9
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
X-List-Received-Date: Thu, 30 May 2019 12:44:54 -0000
Content-Transfer-Encoding: 8bit

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
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index 69c59096b9..36db6b63ee 100644
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
2.19.1


