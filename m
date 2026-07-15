Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0AD4C44514
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 16:47:49 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12671.1784134067765506389
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 09:47:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nGJPhdHj;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-448b0ff4a57so1422908fac.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 09:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784134067; x=1784738867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bGWqjJs+fNKlzz1kmLZjlt65hC9sfRL9qu7+CMsnGFs=;
        b=nGJPhdHjN9g9yMNsQTuUjP8yL5CCWrzaCYTc5RCU2Taw2wooyRRuJb2YQYKi5a9yJe
         j0WUcL3p94wAqPJFO22yOzwvuCZuffN62or4FpywXmIp7+EtXL8faw08v/NXdeP6B3tn
         HNZqi93Rnf67HVtYClFv9g0Br5vWwr0QQh4bTIWfVlFCXHrmLTMvS09uzfdZeoUayinl
         /FVyGpZZ1QacJ9OaqsG51y5D1U9Zfrn9wQco5qsSkV5ovj3f+hMwFIil3Hln7orf27pe
         qiXkAgthDuekjeG13kwruHJck4ln/WiybXEjOrjxpqxmTZmrkKr/q+ytzG02wf1bMmdS
         0Nsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134067; x=1784738867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bGWqjJs+fNKlzz1kmLZjlt65hC9sfRL9qu7+CMsnGFs=;
        b=g3EQjSE/z7tTVKYy4pyiilMQNlUyX41m+WApHlbZpNmbnkkILkHweJSQkSbS/yb1Lx
         hbS0MbaKQZzaKufeZs/0Mf1Ko8IgU5l981jEfElx7sHrcDr85ManjyjsIFjNJEAwEuyy
         ug/cNAftCxhVaTafm4YG9NgvCTdiF9R4qj8GYnL+Bxfib5JPgNw2Avhb7/U+lDXOy2/0
         xPEDKH4FdMxwpHb2IkX3JXSjzgdwsVm0G3B2DXFPRwfZk5ud2iv4FcT5duT1zmusenz3
         menq9S3gYRUe06BtbpB8inNIodVGqFBAdFOCl3TamlIaX2GVZRya/ikNWA55LUgR7CLO
         1RBg==
X-Gm-Message-State: AOJu0Yyq3BvgTuGCz5LIpKyy2tr5B60BLqu7eRPPIPuvp6OWiKQ/s+Ke
	rKTrBz8YJYLmhotErfcFRNLrCP1WP7ZmDMCkQE2SdwlVVI9OYAPX9gpHxZVJTQ==
X-Gm-Gg: AfdE7cnm5ABp3fbv1dxFRFPAmksk6XBDaIFEJX0Nbt4d4aFy25Sp3oZ9CUS78XVXat+
	rdRYjorGD5i5Dca/wyXknAewduvWWRNtgMMfCYRi1l+QRIRMZPL3lNwfvKWV4pN3dBf5JR8PTR9
	ZjJz33zlAAxIl2y7ZYLacr5mRNoACuSHv8LW2Du0tHMWVhlNzXYi2Bq9fXXu21szxbk1J8hKanx
	l0cbaZAnCk52FTDzJ/riSdW0Ih2n/DDPRgzopxkO7+pUpaSfrJQtcZKrF/4E6qW73OAlLZaPMCA
	5EBeSPFYTSpnsh/wWP46TiqTLVTUNkWViP5KkrD0DlSmP/imLwFQEGf1bhU1H9W/aeqG3IfyAZh
	bX7G+cUX1SqJlXyTLl8XZ1iVbvNoDfx2RCaPQwmCPftwI5CkiNH5gaRuKRBo/eQ/D7bTBdR0Fn+
	EVQAREldKHtRiO0QqX6o8=
X-Received: by 2002:a05:6870:a11a:b0:448:558c:d8c5 with SMTP id 586e51a60fabf-451f147dc8dmr10134436fac.35.1784134066900;
        Wed, 15 Jul 2026 09:47:46 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::eb5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451b64192adsm17354179fac.18.2026.07.15.09.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:47:46 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 06/25] meta-selftest: Add NO_GENERIC_LICENSE
Date: Wed, 15 Jul 2026 10:45:02 -0600
Message-ID: <20260715164739.364323-7-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715164739.364323-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
 <20260715164739.364323-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 16:47:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240997

Adds NO_GENERIC_LICENSE for a non-SPDX license identifier, since it is
now enforced that licenses are either SPDX license identifiers, have a
matching generic license, or use NO_GENERIC_LICENSE

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../recipes-test/license/incompatible-nonspdx-license.bb         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-selftest/recipes-test/license/incompatible-nonspdx-license.bb b/meta-selftest/recipes-test/license/incompatible-nonspdx-license.bb
index 142d73158e..128f313e1f 100644
--- a/meta-selftest/recipes-test/license/incompatible-nonspdx-license.bb
+++ b/meta-selftest/recipes-test/license/incompatible-nonspdx-license.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Recipe with a non-SPDX license"
 DESCRIPTION = "Is licensed with a non-SPDX license to be used for testing"
 LICENSE = "FooLicense"
+NO_GENERIC_LICENSE[FooLicense] = "LICENSE"
 
 EXCLUDE_FROM_WORLD = "1"
-- 
2.54.0


