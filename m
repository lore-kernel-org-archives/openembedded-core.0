Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by mx.groups.io with SMTP id smtpd.web10.770.1622676088720920058
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jun 2021 16:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wdc.com header.s=dkim.wdc.com header.b=UTgyFwqP;
 spf=pass (domain: wdc.com, ip: 68.232.143.124, mailfrom: prvs=780e1cc66=alistair.francis@wdc.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1622676090; x=1654212090;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gur3xtliGXRAFK050m4DQBb7riXelXj/e3HgSRiFOiM=;
  b=UTgyFwqPd4ic+loSfkPeeQoDy9RHNs9E3MASMhwTLR+8VKZzjHz53ZU/
   98b+KXJ5jHgcNg2VcIWacOmHHnICd5nbHIg4ZcnOXPiRJ7vBAsJWbu86B
   HHrcu/W7u3wiZnOyK9cjrFAObRbPO7tdUKnbHh7y5PUDn72exTSNX7tot
   6sZIoXHyDcXh46bqk248J3Il3hOoUzhLnTAd3Toh8Dakg0wd6kxORatjr
   Vx5thlTSaoje1/5oiCN4hc5Uaz9jBZFNQ98vF6ITU+5D9+WzhQPRz7Bm6
   aceJcbwEAJCCmlLXEVfr4gYneKkga3ITL7NfaOsT/EdlJzQkkQe1wp2op
   w==;
IronPort-SDR: ClgfK3UlFSlsDOl8XbAOtNxI8rC+EJ4snYgvzoXHh4iYQ8kguCHs/EZcyLSrHW723wbZ0U5Vv5
 Dbv3dV8qNd94UZxjz6LgQ9HKFkRT3u7jVaQA3mW7iomA19cTYuSe5uoi2vufDvnmfmKZJqzl52
 Ln83x1mZCkPlbTeTIthlBpqipn7mk21WSvaQUDMupNBf6XyLXMwQUZHKLrihR9yPnyqHR31Pjt
 Ozpwl2SQgOinDtc1l+C/CKMF+G0de/+WdNvicjVLMTdCk/lUfO+XPBrMjuzoHcmWQdmI1+BP+J
 KmY=
X-IronPort-AV: E=Sophos;i="5.83,244,1616428800"; 
   d="scan'208";a="274370286"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 03 Jun 2021 07:21:29 +0800
IronPort-SDR: W101bx2HYDjezHM8nokxW9dR5d9ubt1Xkt5a+7luhTqad66g2cMdLEJ+pKjsR/wiLxTqGtEsFO
 kwuGVQ/oMMSyvmb5mjHw75+DQFyx9OHA8r15jOSYrih4c4YhRLofC4tkqYLQe+C8FfgGH8xe2m
 +zdjsN/r1u4nmyHIta/EA6AtaeysWMovePtXgvAXJtGlC7KbzNGMb1FFnBJ4VYQGRkC+Jc0/Bd
 b1vIrl++0R92TPuv2PF65Dmo8Nk3yNLNRRFQsNs+HTjdU+Dj8n+E9N4p4OXpJTiY2xRVZwPCnZ
 P4459wakrFIKCHjAs/kYLxTM
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2021 16:00:41 -0700
IronPort-SDR: ABQ/E80oLQEF+Bb/L5/atYWcnMNYZsrnib34HvjrMMCT55t0BVK4xGOkh2csQhIGuKDtQMcrLM
 10FJj7RIbcH+p4pynDEx12TpKXEkQXxyEfYJ0Ei831EZmfJfto9la127X98XdUFz7NrX3FcSM3
 W02SKxRG2vtDC3H9DCh9s6xb2v1yzgjW9+1yyenuWdta9uMXVBdSn1VuLahG55gV1S5jRfQRVO
 HpD+tpA79MkZFtCgVwyXftMYu8DesJEXj/GevoaUmiRl4jEoQcxNqg3NmAiQjHepjTkijep9I5
 xm8=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.72])
  by uls-op-cesaip01.wdc.com with ESMTP; 02 Jun 2021 16:21:25 -0700
From: "Alistair Francis" <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 1/3] recipes-bsp/opensbi: Disable FW_PIC
Date: Thu,  3 Jun 2021 09:21:02 +1000
Message-Id: <20210602232104.3490139-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disable FW_PIC to fix the error message:

opensbi-0.9-r0 do_package_qa: QA Issue: File /share/opensbi/lp64/generic/firmware/fw_jump.elf in package opensbi doesn't have GNU_HASH (didn't pass LDFLAGS?)

This is seen in newer versions of OpenSBI that enable FW_PIC by default.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-bsp/opensbi/opensbi_0.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/opensbi/opensbi_0.9.bb b/meta/recipes-bsp/opensbi/opensbi_0.9.bb
index cb1c3f2ebf..52965abda5 100644
--- a/meta/recipes-bsp/opensbi/opensbi_0.9.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_0.9.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/riscv/opensbi.git;branch=master \
 
 S = "${WORKDIR}/git"
 
-EXTRA_OEMAKE += "PLATFORM=${RISCV_SBI_PLAT} I=${D}"
+EXTRA_OEMAKE += "PLATFORM=${RISCV_SBI_PLAT} I=${D} FW_PIC=n"
 # If RISCV_SBI_PAYLOAD is set then include it as a payload
 EXTRA_OEMAKE_append = " ${@riscv_get_extra_oemake_image(d)}"
 
-- 
2.31.1

