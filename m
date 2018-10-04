Return-Path: <angelo@sysam.it>
Received: from sysam.it (ec2-18-194-220-216.eu-central-1.compute.amazonaws.com
	[18.194.220.216])
	by mail.openembedded.org (Postfix) with ESMTP id 844BA79357
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 13:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by sysam.it (Postfix) with ESMTP id 5F44D205CA;
	Thu,  4 Oct 2018 13:29:59 +0000 (UTC)
Received: from sysam.it ([127.0.0.1])
	by localhost (sysam.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1XMoGVLshFv6; Thu,  4 Oct 2018 13:29:59 +0000 (UTC)
Received: from localhost.localdomain
	(host70-5-dynamic.16-79-r.retail.telecomitalia.it [79.16.5.70])
	by sysam.it (Postfix) with ESMTPSA id CAD2D205C3;
	Thu,  4 Oct 2018 13:29:58 +0000 (UTC)
From: Angelo Dureghello <angelo@sysam.it>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Oct 2018 15:29:51 +0200
Message-Id: <20181004132953.3568-3-angelo@sysam.it>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181004132953.3568-1-angelo@sysam.it>
References: <20181004132953.3568-1-angelo@sysam.it>
Cc: Angelo Dureghello <angelo@sysam.it>
Subject: [PATCH 2/4] kernel-arch.bbclass: add m68k to kernel arch map
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
X-List-Received-Date: Thu, 04 Oct 2018 13:29:58 -0000

Signed-off-by: Angelo Dureghello <angelo@sysam.it>
---
 meta/classes/kernel-arch.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index 2b52a63c64..07ec242e63 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -29,6 +29,7 @@ def map_kernel_arch(a, d):
     elif re.match('aarch64_ilp32$', a):         return 'arm64'
     elif re.match('aarch64_be_ilp32$', a):      return 'arm64'
     elif re.match('mips(isa|)(32|64|)(r6|)(el|)$', a):      return 'mips'
+    elif re.match('mcf', a):                    return 'm68k'
     elif re.match('riscv(32|64|)(eb|)$', a):    return 'riscv'
     elif re.match('p(pc|owerpc)(|64)', a):      return 'powerpc'
     elif re.match('sh(3|4)$', a):               return 'sh'
-- 
2.11.0


