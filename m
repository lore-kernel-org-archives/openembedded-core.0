Return-Path: <Alexey.Brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (us01smtprelay-2.synopsys.com
	[198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id A8B1F71974
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 21:29:57 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 1A70F10C0763;
	Mon, 17 Sep 2018 14:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1537219799; bh=bWfcRPgaCTECWYJIVVp0tDR4tzRP2KB2Nff36IsVWp0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bw7xYC9QwBefGNErfu+wRaXj2BoY5wLJ87vrC7/dcrbBvcaF8tGnBnolDpIQ7nApX
	mTp/2hY7yCbiHj0fIIGPM63V9zWNpnU0yqowycOvpLEPXlDiBGs5e4SlYbI0a06HzN
	U0Z50LTXDxL5fOFpeysRfUb0AOVQwRYmwFvdz42NpJAjfTaM/Kw/JrPDF0X2P8bzht
	ktWnRDKAsLc+M9CYQOuh5ZL3pnLAnrEihH2/w/enfKeSR6cksl5YYV52SfdV5Rkg2a
	pqtjqX1Lfc19eD4mFAVzHRLcVFkcaxO6Ft0FiPVMK9j9irkUKiMWtiXj+BsAEjTPj8
	QLdrVpDgnK/gg==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id D360054F1;
	Mon, 17 Sep 2018 14:29:57 -0700 (PDT)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2018 00:29:36 +0300
Message-Id: <20180917212943.27237-4-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180917212943.27237-1-abrodkin@synopsys.com>
References: <20180917212943.27237-1-abrodkin@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH 03/10] kernel-arch.bbclass: Add ARC to kernel arch map
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
X-List-Received-Date: Mon, 17 Sep 2018 21:29:57 -0000

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 meta/classes/kernel-arch.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index 09793fc..2b52a63 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -22,6 +22,7 @@ def map_kernel_arch(a, d):
     valid_archs = d.getVar('valid_archs').split()
 
     if   re.match('(i.86|athlon|x86.64)$', a):  return 'x86'
+    elif re.match('arceb$', a):                 return 'arc'
     elif re.match('armeb$', a):                 return 'arm'
     elif re.match('aarch64$', a):               return 'arm64'
     elif re.match('aarch64_be$', a):            return 'arm64'
-- 
1.8.3.1


