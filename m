Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.1887.1593112078650740892
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 12:07:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=SoVb/9LR;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 59EAF601D7;
	Thu, 25 Jun 2020 21:07:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1593112075;
	bh=m3h2Z8aeAJruImYvP/1ua5OzflAGWksPv7VkH7v8cgQ=;
	h=From:To:Cc:Subject:Date:From;
	b=SoVb/9LRIfWklJuDjfMqNLvzK4BmS+pUOU/f5D90I2CnNciMhxKI48t+C/iyA7bNy
	 Mw/PxsgyW1RRedtfgyrPtm/Om202L9R5Og28fVy7PN6pDjOdJr8DsXzWAWvcX7A2VI
	 f6iuY24t0c0k+8/t2KJwJi87rkOLZZd1x0rl2v023CNnLDX9TPGTDsLsM59Fp2mvk5
	 zENDjzFQs1z8EY6KanZI6OF+cpDI4nvOBFIdl25LVqkqekE6q5QKPSqq9pOyITD1QG
	 2QEVqWpl2fKXfjdlxixEPsySEjcagCYppCgV45sU+2vQSFh+coFyPyBWCwyFNk/z3p
	 bdiXAn9YLXG5w==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Cc: sbabic@denx.de,
	Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [PATCH] libubootenv: bump to revision 86bd30a
Date: Thu, 25 Jun 2020 21:07:36 +0200
Message-Id: <1593112056-11738-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

This includes the following changes:

86bd30a Restore ability to feed script file via stdin, using `-s -`.
c91dcca ubi, write: fix invalid envsize ptr to UBI_IOCVOLUP

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta/recipes-bsp/u-boot/libubootenv_0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
index ea29b66..3820ba2 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
@@ -12,7 +12,7 @@ SECTION = "libs"
 
 PV = "0.2+git${SRCPV}"
 SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https"
-SRCREV = "f4b9cde3815abe84a98079cedd515283ea08c16b"
+SRCREV = "86bd30a14e153a18f670b25708795253d8736f0f"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4

