Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9076CC4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 16:18:58 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.18150.1708013929001992615
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 08:18:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GLwljo9S;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1db559a5e1fso9384895ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 08:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708013928; x=1708618728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JmP6PVrBOFoS8CemFXDl5Zq+L3jA2Qa3du93Kg19CuI=;
        b=GLwljo9S4Rhaqo+huKPIUEx0de/ThgZd7e5mCW1udU0ZuCGnBbkc2naV76CkMkj2DF
         nEfyBNYJfcNTdgsIk1dZFP2cnIZjUvtx2DFwUfex2tQ3DtonmOGPReIAsVkvRUFc/pDh
         oTQpg9nmeA7MFER3KZyZpLQaNLNIUOpJkNZvRs754y+BsibtD5S7bzsGPnL+TDE+Lwa2
         yP1/iKaYZ3p4+Qi0C38EybW5CoDCHVlmyzJD0mIvPG8mr5p2tBLGDb9BDcTrjLxXUrL3
         CUNbXXrQ3vlEvBWCbsQ3aDrs/6zVW2q1OTi61eX+AgRwDDSdhjsXuCEiLr4LHT6L1wdd
         ARGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708013928; x=1708618728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JmP6PVrBOFoS8CemFXDl5Zq+L3jA2Qa3du93Kg19CuI=;
        b=xA9ftzYCcyNDQvd6YyOgLTsw4EMJ0RECLtJyR4tV3T2mXph3BIHAcSG5ryCZ4DbNNX
         DYhAsQ4PmP86TrUl4TYS+31aV7OVwjjiRG5OrtB312DATI4v8Tg9fdxsvOATLq0nqvPi
         rMhSyItggsyWHqeZw5sjaGZJEPBEoYfzQjsfhiI2iwcstJ8fIBZyJonpNDbblRXHM92g
         74LrZGCRT1AJvRXbgzyRHxXSKVlm4H+qIv5PprUwSqdc9392XT6Kq8tNx5EGsWpI4QVV
         Hr2R+fb2vhef8TWDkv5Ff0+RkHflNg4kQxSCuZN5VXig6cfJHctfKSHv8RWNFsiPVhhk
         uawA==
X-Gm-Message-State: AOJu0YyR1aLjIN3cbwiRPL8bKovwLuftRK/x9WvD2tbDPYVfwfUw8Rjd
	inBdj5K/Js52z3euknEz69/g0izknKUlkbFb/wDrAOxJTGZoSCmSj1MxjcxoTDfFRg8F1VuH7R5
	bOGs=
X-Google-Smtp-Source: AGHT+IGlRuqbvm87JZr373yUEdwjR8IEjnxWAuIZULnLCCgd8Bty8YGvvOoaaMVqqV2fJlkJ03d7NQ==
X-Received: by 2002:a17:903:183:b0:1d9:d300:a670 with SMTP id z3-20020a170903018300b001d9d300a670mr2586053plg.15.1708013928387;
        Thu, 15 Feb 2024 08:18:48 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l17-20020a170902d05100b001db66f3748bsm1445683pll.121.2024.02.15.08.18.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 08:18:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 20/21] overlayfs: add missing closing parenthesis in selftest
Date: Thu, 15 Feb 2024 06:18:03 -1000
Message-Id: <8635e17bd81e50ca587bb15716687fd78b81ec46.1708012696.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708012696.git.steve@sakoman.com>
References: <cover.1708012696.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 16:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195540

From: "baruch@tkos.co.il" <baruch@tkos.co.il>

Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit aebd526cdfea738745e57183b1015fd327bd94df)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb b/meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb
index 50cba9514b..20f4213a62 100644
--- a/meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb
+++ b/meta-selftest/recipes-test/overlayfs-user/overlayfs-user.bb
@@ -18,5 +18,5 @@ do_install() {
 
 FILES:${PN} += "\
     ${exec_prefix} \
-    ${sysconfdir \
+    ${sysconfdir} \
 "
-- 
2.34.1


