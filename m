Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8535CD4F3C
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 16:41:56 +0000 (UTC)
Received: from smtp-42af.mail.infomaniak.ch (smtp-42af.mail.infomaniak.ch [84.16.66.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1605.1779122510727522443
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 09:41:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@0leil.net header.s=20231125 header.b=et4Wcp/7;
 spf=pass (domain: 0leil.net, ip: 84.16.66.175, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gK3VN31BRzrbl;
	Mon, 18 May 2026 18:41:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1779122508;
	bh=cKqQvsU8PqoO7RjR4kajSrJuZjY3tvIyZ5CMK8G8OjU=;
	h=From:Date:Subject:To:Cc:From;
	b=et4Wcp/7/ErH7ykmpmLcXb48rQ7a/H20DBUQyqLKnuSj1UMhhP5nMDvpmbW2lPsTq
	 2TBhJpLvdkJvgsGGIplu9KbtUgWTFOEF5416aRL0b78BqsMySOPT4aqkMxkTGykXtI
	 vJ4d2ELK6DBRyL+Ym9MGPEfCVO17Oz04PupotUyuKgXWOVKp1zTHqB6rBQaQyN39Jt
	 uk+LzmaY+lzmKY84eeHNiiCA7cuK87ancI1FrTHofLYclO9/1voLtf/QCkBV1Cyq70
	 uFcLqG51aXCEWKQCTGytLFTgmjOaWrIaVpBcZwXOM/WiWnP6S4jmHzF+UqDuafQ8dl
	 pWTFkrPtjLbgw==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4gK3VM5WJwzXr1;
	Mon, 18 May 2026 18:41:47 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Mon, 18 May 2026 18:41:39 +0200
Subject: [PATCH] squashfs-tools: add another CPE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-squashfs-cpe-v1-1-01b896d5e116@cherry.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDWpJkRcRSxqTBmLqg4iEXdXL
 N/i/wuEIpNAk10Q6WDhxScUeQY4WT+S4iEZjDaVLotaybpbmZwoDKQQrTa2dORMDSkJkRyf367
 tfsvez4Tb+4D7fgAmVEmucAAAAA==
X-Change-ID: 20260518-squashfs-cpe-cca02a5fef28
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 16:41:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237251

From: Quentin Schulz <quentin.schulz@cherry.de>

The NVD has two additional CPEs for squashfs-tools pointing at the same
GitHub git repo, squashfs_project:squashfs-tools[1] and
squashfs-tools_project:squashfs-tools[2].

There are no other matches for squashfs-tools in the NVD except those
two, so don't specify the vendor for now and match both vendors with
only one entry in CVE_PRODUCT.

[1] https://nvd.nist.gov/products/cpe/detail/029FFEC5-FB40-4591-A864-90CB97E80FEA
[2] https://nvd.nist.gov/products/cpe/detail/ADE3E55D-5CBD-49B3-85B4-2035A9B380B3

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Not tested, I just was comparing which CPEs are missing in my Buildroot
SBOM (which only generates max one CPE per package) against packages
that can be found in Yocto where more CPEs are allowed and stumbled upon
more CPEs for squashfs-tools that aren't in Yocto yet, so adding them.
---
 meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb
index 7741039fcf..9a1ebd575c 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.5.bb
@@ -38,4 +38,4 @@ ARM_INSTRUCTION_SET:armv6 = "arm"
 
 BBCLASSEXTEND = "native nativesdk"
 
-CVE_PRODUCT = "squashfs"
+CVE_PRODUCT = "squashfs squashfs-tools"

---
base-commit: 3724b93538d3acbec9f48d4c524b51d166071708
change-id: 20260518-squashfs-cpe-cca02a5fef28

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>


