Return-Path: <Alexey.Brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay.synopsys.com [198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id 67568795FF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 20:42:46 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost3.synopsys.com [10.12.238.238])
	by smtprelay.synopsys.com (Postfix) with ESMTP id CDFF810C07F1;
	Thu, 20 Sep 2018 13:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1537476167; bh=fK7yUZI219eEKiZw54PSHhUAwFbOek4f68yTc4pblBY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TcfrAnc7wqPyX3pLVBD7n0X/W73R/rtACBWcommeteyW4xMW/IWThYfCVJBIZg6Ng
	p5JxBd8Cq0bfCBbR0jk+Js4EhkmiNuGVR/cJ8tobLle0KLrqXb7eMKtWaq7up4wpi0
	G/ca7s1kJctE1M7wgAJhHmq8bfKHenM0Xq+tLSfBV9EE6yt5KIRt6hyAOxHSIIzGeJ
	gwnPvKoLx1hrwcuGROqoCT8zRAe/nF80mJuB1c3GZLSYdnqomkXrS4NjYChGyOFq9d
	eMvdlo9IsDaMlKKOwOe2g3kiK0zOkbhyrOA39iSjqI5j2SEaCc/Ixg0cHbiJt55JBl
	rXLcOksJvcLcA==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id 926863A6C;
	Thu, 20 Sep 2018 13:42:46 -0700 (PDT)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Sep 2018 23:42:25 +0300
Message-Id: <20180920204232.10583-3-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180920204232.10583-1-abrodkin@synopsys.com>
References: <20180920204232.10583-1-abrodkin@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH v2 2/9] kernel-arch.bbclass: Add ARC to kernel arch map
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
X-List-Received-Date: Thu, 20 Sep 2018 20:42:46 -0000

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---

No changes in v2

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


