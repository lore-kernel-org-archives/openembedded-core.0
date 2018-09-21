Return-Path: <Alexey.Brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (us01smtprelay-2.synopsys.com
	[198.182.47.9])
	by mail.openembedded.org (Postfix) with ESMTP id 55C05798DF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 14:26:15 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 926FB24E201C;
	Fri, 21 Sep 2018 07:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1537539976; bh=L0bMyrTKPpC9b4OnIysJ+2upBV+sq6JHdSyehtH2TCA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TedFgLS0q/BTe7GT9cBusBVqNBSLf9ezKRaEgeNqu6W0BXwM2hO7Iy6ZapwZNW/Fm
	MssXXPC8qy6T5B01vcB1gDRoIGbSis1Jr11Wq0yHT9xqBvRDG9O+DmIftSfWRiuHe4
	C/9t5vjLbPDVjBNfNTedkaHUQ+4TOiPTuyuKI2iHCtHJc3lsNv0Wr2HBIrtckS2WV5
	ExvmA5PsKGYAgBfDw78rJ5oDuRcE7TeJF2FsFQdb+KpP8CJaiFg2VZJn4Knso3X4eG
	SYxy+pnMonno08XJZlczLBh1DMlAgmsuuT0udMxeEROtz9YZBFHc0S+4ByBec4Joc2
	Dxp+G5Mj4XhpQ==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id 186DD5CF6;
	Fri, 21 Sep 2018 07:26:14 -0700 (PDT)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Sep 2018 17:26:01 +0300
Message-Id: <20180921142608.36203-3-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180921142608.36203-1-abrodkin@synopsys.com>
References: <20180921142608.36203-1-abrodkin@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH v3 2/9] kernel-arch.bbclass: Add ARC to kernel arch map
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
X-List-Received-Date: Fri, 21 Sep 2018 14:26:15 -0000

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---

No changes in v3.

No changes in v2.

 meta/classes/kernel-arch.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index 09793fc9c2..2b52a63c64 100644
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
2.16.2


