Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0113C27C53
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 02:05:46 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.5633.1718244343078494443
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jun 2024 19:05:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=iXYsajDr;
 spf=pass (domain: mvista.com, ip: 209.85.214.171, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f717b3f2d8so11767385ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 19:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1718244342; x=1718849142; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jrZi4HO28Wjtyp2TrF6FgDZewCPO14Hn7zD7TkcxDjc=;
        b=iXYsajDr3r5/plWT35d9x3pO+sgSKMd/UkLxLDrkmvNR69at56tbi2vqDMemWHbIwM
         KRZ8GqlJEeKss+om0upg/4jkYtd7NFkzpKa1IJ1WOxXkG7jcb6Tct6x80hN1bOF3XS2G
         KyN1sCenRwDf9cXI3lPHpV9zolt8vrzsCMa3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718244342; x=1718849142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jrZi4HO28Wjtyp2TrF6FgDZewCPO14Hn7zD7TkcxDjc=;
        b=pW1DWHMvxRFrt3fb/PrxtDSppFi6SIohrXiv/4Sl8svd6C83t9m8nbheLGQbbzJ0r9
         QuR9GLzMPGva7Dce3ujUTlgIyEFV/vpDQKhUqNeoT9STucF8QuW66Wb5pg356x0MZ10W
         e1U0U0qWr3PPZ8oO4bSKNiZkBwmJ5joc/MZIx90KYSyDiGYnDkpoLp3ZRR6khdDN1qWu
         b2q8SctHG6oy3RVESO/QHg3ub2a/E5J2fE8JuHYKL7tVjJxrJewiEUFS3tkiCJCfCCtG
         wS7CoDwZlG2EzR84E9HanrTlevtwLRhKSjPdmOXoDd0CLWjuAecNsldHnDQBjjqPAb5s
         YYDg==
X-Gm-Message-State: AOJu0YyYr6SjZccsEMxTBxdTz/Ps1vhi6yhWPgYV6UUzyVb3n9oK+YGM
	PrHIbvBCCAYPIGG3lYwvnQ3QHIzwfRQovctZP+Y72HpeCpgEG4DZ8wfkyDGKdn1Azj1OSNaXiYE
	1
X-Google-Smtp-Source: AGHT+IFsJTqmP058DLLU4YuRnTK257u2ICbZDQbCDsPF91DbYGcsKHlSda+R4ADru1Rs2/iIAM0dNQ==
X-Received: by 2002:a17:902:f643:b0:1eb:e40:3f74 with SMTP id d9443c01a7336-1f84e42dd85mr20215045ad.32.1718244341752;
        Wed, 12 Jun 2024 19:05:41 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([157.32.45.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f17f92sm1518045ad.221.2024.06.12.19.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 19:05:41 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][master][PATCH] cups: Upgrade 2.4.8 -> 2.4.9
Date: Thu, 13 Jun 2024 07:35:33 +0530
Message-Id: <20240613020533.83823-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 02:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200584

From: Siddharth Doshi <sdoshi@mvista.com>

CVE's Fixed by upgrade:
CVE-2024-35235 cups: Cupsd Listen arbitrary chmod 0140777

Other Changes between 2.4.8 -> 2.4.9
====================================
https://github.com/OpenPrinting/cups/blob/2.4.x/CHANGES.md

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 meta/recipes-extended/cups/{cups_2.4.8.bb => cups_2.4.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/cups/{cups_2.4.8.bb => cups_2.4.9.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups_2.4.8.bb b/meta/recipes-extended/cups/cups_2.4.9.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.8.bb
rename to meta/recipes-extended/cups/cups_2.4.9.bb
index c0cddf7e99..e0a3522004 100644
--- a/meta/recipes-extended/cups/cups_2.4.8.bb
+++ b/meta/recipes-extended/cups/cups_2.4.9.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "75c326b4ba73975efcc9a25078c4b04cdb4ee333caaad0d0823dbd522c6479a0"
+SRC_URI[sha256sum] = "38fbf4535a10554113e013d54fedda03ee88007ea6a9761d626a04e1e4489e8c"
-- 
2.34.1


