Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C60BDEB64DD
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 21:33:12 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.19243.1690493586859149051
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 14:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HBncr2jG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-307d58b3efbso1417444f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 14:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690493585; x=1691098385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=K9bquk4CiW0F7gLtkXb85S5P/GvPoAMGuRL1yMsevpc=;
        b=HBncr2jG1/mlgOPHZMW6nH+k4l36XSb5nRdCDoa99zcLN5292D1Vtb8qUlHFsew1Cx
         E/Pcg9sTKtCUdpqXtOT9v3pcUMz6kzB72z6EYhy8OWaFpsVSxE2EixzOiIgiaMaihQ69
         IzWim/7wW/7o3sYM76BaHeZj/+fLL293qtvWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690493585; x=1691098385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K9bquk4CiW0F7gLtkXb85S5P/GvPoAMGuRL1yMsevpc=;
        b=bd4nTVrvXGMf/VYktxYvXACqRBohHVppDbI0LJ2K3Cq6LpSklS4A5raJKFRLY92GVr
         /LdB8mDp7r6fXpD+hc5BbLcXXdNx5WhihVQ+/sAMSZDSn+oIU6rXKopRdp7k28G/L1lF
         ifILBjngoGPYWb0s5czzn4Uy7b320OC/ev7p4rFmD4yb9fGLnqixouwC4Ku0b1NSN0af
         zKy0y090ykxDdxO1ELa7euGzYNM4RTbv4HPzWLZpt5Z3MsAGrU+WchKoJvzpOnr9S0+/
         RVB2RoXkv5lCJLGu0ueYia4BBbBpBJbZcHbblPFH+1h8wrz6Xd+QBxdxz7jr/iHD4/m+
         WluQ==
X-Gm-Message-State: ABy/qLZBtOYSRdLvSgUdq2L00cY8ymoNgLADVmWnTx1/iVna28eOuwA1
	ooG+600+rY5C46KSm1qDmjjKFWjQpiJOxMcB2yA=
X-Google-Smtp-Source: APBJJlEa5QuICYFuVDW+K0rLa1QAQDKMntYXzNxDgqOG2zkF+0p+vCG00hdvJ/0kJf1g8G4+PdyfeQ==
X-Received: by 2002:a5d:4f05:0:b0:317:66c0:9d82 with SMTP id c5-20020a5d4f05000000b0031766c09d82mr212015wru.64.1690493584809;
        Thu, 27 Jul 2023 14:33:04 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4e39:f3a8:af2d:87a2])
        by smtp.gmail.com with ESMTPSA id r8-20020adfe688000000b0031434c08bb7sm2973792wrm.105.2023.07.27.14.33.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 14:33:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] createrepo-c: Update patch status
Date: Thu, 27 Jul 2023 22:33:03 +0100
Message-Id: <20230727213303.1603982-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 21:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185004

The patch was submitted upstream, thanks Khem.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/createrepo-c/createrepo-c/time64fix.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/time64fix.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/time64fix.patch
index d022d95b703..a63801ce26e 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/time64fix.patch
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/time64fix.patch
@@ -8,7 +8,7 @@ Fixes format specifier mismatch warnings as well while here
 e.g.
 warning: format '%ld' expects argument of type 'long int', but argument 2 has type 'time_t'
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/rpm-software-management/createrepo_c/pull/376]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-- 
2.39.2


