Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53252C369C2
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 12:47:04 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.14187.1745498815975036513
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 05:46:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SqsA7gvK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 806AF41C3E;
	Thu, 24 Apr 2025 12:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745498813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wLKVyrLsavTlkGCC/QqemK+rZwlu/4c+9byaOqNOOHs=;
	b=SqsA7gvK1DRFEPnhFvYKxEttDXgV7wTyDAo5++l2xrlB53a0DmiepYy8uaq/3mzy38TLEA
	xC98WHQeiJsxNxLd9ZMqPmOb0ryfsRd4Ai8GlQWezyl6akYApj3urndSnFl7iB4zvFb/Yy
	7RJGff4mXN5kZrvNJgCjrCQBxJUBN5/R2FI4/bj+tnOva25HiBB6we/gvD53ELhXR/zHXi
	CsuHIiwtJZ4NWoGNT2CfL0cVHC7cuF2csyDvp6qYPpPOrg/reXJ1F5CX1MwUb89pHuCTP2
	0Q4+/ekXBjjhpeluic4e1ITY5gGiDp4x0ekIo/VneTWH/nu4+dJLt7D/x+XaTQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 24 Apr 2025 14:45:59 +0200
Subject: [PATCH] linux-firmware: fix zst install suffix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-linux-firmare-fix-szt-v1-1-feb963088f78@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAIYyCmgC/x2M0QpAQBBFf0XzbGptKH5FHrY1mGJpFon2302eT
 qfTvS9EEqYIbfaC0MWRt6BS5Bn42YWJkAd1sMZWprQlLhzOG0eW1Qkpb4zPgcZVvrE0Gl/UoNt
 dSNP/2/UpfUO2hmhnAAAA
X-Change-ID: 20250424-linux-firmare-fix-szt-0a5c92ef0c16
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1196;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=IhQyzB0jXAgAVIGg6XEK3eaB7pGwl73ecYpwobMVrTc=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBoCjK9EE1o3ja8Xt/iqNvggHAbIt30k3Wu6VCdZ
 TMwnilZi+qJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaAoyvQAKCRDRgEFAKaOo
 NtQeD/4iEpswcE0h8Nad873yOz1FflaJUtTR3HqL2oUa+MNn0fB+zQb16OMOy29PBE1PWbl2nPe
 gmaauUpEY8KzRSm1I7y8fBpBVsbtd4LEpZqvOoK0HpJnyeIk+ybaML9tcw9jVavVtzBGrrPwmMu
 ax0UAt2nl5+56rR6+M3DH/sAbZQKvH0u2Serguz40tCUpwYJn3kxps3fTSh/QaNr2NO1pq4OsY5
 NF7KvWnJcXSRwxhv+e7FqP0fGs7SQRUIyR47of88822vnyvd9GnMJssafEPSgpCIYLdafZgWfT3
 i4nuB3D8XVDThD0n0eyUyGx7oi3jvhXm54muUC7FsdVEdpF1QfBKkGEGr+nRGPNR9CaUw1+x19l
 fKjfYjePULCwmqQlZgHXWBF6ruouiKQ+zKyXLRVGCAM4S0+kPCD8KbT7k/p3NoALuXvLTlfgOa4
 hnjLPtn0iN0BiimtQmbHC90Ouy5f5CUDOhEH9h38fivsKn/BoION8nn8MB0rDNR6aPpvGhHXT+/
 iySr0EglL6Qs4aDWK+Lj6kG1h+QgX8+8DGwXvterCmKTwiE3UvZoKi2NXozWcGtV6ug3WZf3q0T
 +gX+tpxZSYuKHCpRycG2MNBUEGIJq1WCVTS9y27Lkl/1oTJY48nf1oz7ezTl3Gb+H7O5jvA44P2
 X6H525QN96HCK3w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeelheduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduieejledtieeuteffveetleeuffeivdffjefgteehgfehleeiteehieeuieekueenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmedujegtvdemfeekjegrmehfieehmeehvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudejtgdvmeefkeejrgemfheiheemhedvfeehpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvt
 hgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 12:47:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215371

The linux-firmware Makefile defines an 'install-zst' rule, but currently
fw_compr_suffix() return the '-zstd' suffix when FIRMWARE_COMPRESSION is
set to 'zstd' which produces:

  make: *** No rule to make target 'install-zstd'.

Return '-zst' instead to properly run 'make install-zst'.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
index f12bb2c6d3..5dd178c03e 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
@@ -269,6 +269,8 @@ def fw_compr_suffix(d):
     compr = d.getVar('FIRMWARE_COMPRESSION')
     if compr == '':
         return ''
+    if compr == 'zstd':
+        compr = 'zst'
     return '-' + compr
 
 do_compile() {

---
base-commit: e68ad590f9c0b4bcba94ad571553d81e2a7c6f50
change-id: 20250424-linux-firmare-fix-szt-0a5c92ef0c16

Best regards,
--
Antonin Godard <antonin.godard@bootlin.com>


