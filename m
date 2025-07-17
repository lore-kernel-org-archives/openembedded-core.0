Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 416BBC83F34
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 18:33:06 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.2923.1752777180312573679
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 11:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CJ5+5TrL;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-607ec30df2bso2572120a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 11:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752777179; x=1753381979; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lv7FOLYnuwF5RlaV+6eDqFLmc7mm5c5hnLClGlC3okM=;
        b=CJ5+5TrL7D8Pc+40vQ+OrM0zvDlJai59+WjbsqH8tmE3hGKzA3uKmfEZJZHVRcDTjc
         pt113tuOZBr5/vvxIeS0DuIqhlVMKD9X5T24xg8j02lYQiVwrwzgiUMEKrtF5VH/R3B+
         RWkCVCsPBPFLLFPqf6XVkRnPouCU/dIeoEEa53sfOiVZZBUTOfQ9ZxWQ8VXwA93fMS/B
         wnls69UmPqJHjT1BAWrej4WqKmtQWtvsFoViieodq828Oa8JD2OQgq4jshbFQGFYRNQx
         Li1ZtwyL/047S3gMzdfCUfOYCHGBszmhJDnv+D1OjMeb4qBdxDx8J/ZoJD4jkYC/RP1g
         efcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752777179; x=1753381979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lv7FOLYnuwF5RlaV+6eDqFLmc7mm5c5hnLClGlC3okM=;
        b=ek4jkINxk2X71tjB6u44SFmBKTOC3oEi/e043PkL2RZy4EHXWxtBwGGgWeo1cyr0kw
         ZQdvOot0VB98FroJiEE0CM+LM3tHcWlsfu1Pe98EsXZAmsLWONuBguIAEkKxdYYvA4+t
         QjoI5h/NJ/W925ICsskYBDguoMLoJZEFNLK0n/yuYY7wMCpUUPc5PaC81vtS72ykTdD0
         kTS1StNHSfP2sMadyuuqZ2rjV+a/igfAAj7ruemEhLMhYVm3ETm7fwTojMg17sx/HhqA
         TSGRdbqMFiyTaPQcWpwtWt2RCcxz+8UbTWsBycL7/CcR1K+eBndqFlzYkIRCwzBURN30
         V5uQ==
X-Gm-Message-State: AOJu0YwvYk8/VhQp/KaAVqUfXfVAIiAsFKtxW2ugnzyBPyaqPTfHU1+Q
	1kXC7cIyK2h17fL4TNOqxHCL85QsSMKoTuWuODH9hyOToJFCnYkLR2/XYmLeYg==
X-Gm-Gg: ASbGncseJH1mRHuPEB/87oqOMlWJwNInXXm97TFrb08IyevuGqEoY+2Ihm6Bcy02fli
	d+9wBUrdC9sj4yHDA8//6tJ82Rp/UvCj0icp+khRa+Hocy84EM5jcLvwAhf+KlQRb5dFLcWwFKC
	LvxMPrdzS8tY43lLpqmyvwBbonQ2oxj7ob0w1x53RePjFdYqWEhdMolt/Ub6NBDRshYClwPNMaX
	JQJM/0m2SiE+HDqIptrkCsf2aLf51UTb8KVFK3US8ANbQn0Uj69zxCo68kKZa86xIFv64kByePN
	iJ+pMjAi0hRbVt4EAwk7vD57Q4xtvlbTf17jMT622hwVvASWYLOJkxfzbmorwnE1PFvvtcLUA+/
	KfSgNYQNaAmPfySminv4=
X-Google-Smtp-Source: AGHT+IFTmL5YCtLniY7TFlv7EbDli8ddg61KTwB7oNph8g752Bg8bXUFkTCiwQxFBbIfxhbau6iAlA==
X-Received: by 2002:a17:907:1c13:b0:aec:64bf:a393 with SMTP id a640c23a62f3a-aec64bfa4a9mr125984566b.38.1752777178297;
        Thu, 17 Jul 2025 11:32:58 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec506cff34sm174688666b.74.2025.07.17.11.32.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 11:32:57 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] diffoscope: upgrade 298 -> 301
Date: Thu, 17 Jul 2025 20:32:57 +0200
Message-ID: <20250717183257.113915-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 18:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220560

Changelog 301:
- Avoid spurious differences in h5dump output caused by exposure of absolute
  internal extraction paths.
- Use our_check_output in the ODT comparator.
- Memoize a number of calls to --version.

Changelog 300:
- Fix a regression and add a test so that diffoscope picks up differences
  in metadata for identical files again.

Changelog 299:
- Add python3-defusedxml to the Build-Depends in order to include it in the
  Docker image.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../diffoscope/{diffoscope_298.bb => diffoscope_301.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_298.bb => diffoscope_301.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_298.bb b/meta/recipes-support/diffoscope/diffoscope_301.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_298.bb
rename to meta/recipes-support/diffoscope/diffoscope_301.bb
index 4a50059c99..c93ff4f588 100644
--- a/meta/recipes-support/diffoscope/diffoscope_298.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_301.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "9644b7e711df71f13c5f50f3d1353c1e6d09f462d342d9771576e75f3dd8c3e1"
+SRC_URI[sha256sum] = "2b46b60afe3fbb9ba79946e5196157b272ddad27692ccf5e4839def1ef3019c6"
 
 RDEPENDS:${PN} += "\
         binutils \

