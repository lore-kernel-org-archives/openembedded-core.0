Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF2AC001B0
	for <webhook@archiver.kernel.org>; Sun, 23 Jul 2023 15:44:35 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.28321.1690127067457481700
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jul 2023 08:44:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=MpsIrXEA;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-666edfc50deso2247221b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 08:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690127067; x=1690731867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BIGQzcEDCZaYOnIGGS3fLedLv4pwiu2q8pxnygm834Q=;
        b=MpsIrXEARPlG9iLHINElfsRfGU53JW0ag3PfKsRqX6nA9i7Pg7rCVqTCf6rxokPz0b
         fWY2M2yqL3K3wCzQxVblRwE3dlNLBIsbHgLLhmZTR2+1gaKi9J480NrPFj4+obybPC6V
         SNBbwgGgOqGodivVhHmn6T64izUNeWD8KMQffn6iwsyDFeqBmQTzaKvAwjDeNU/riMDn
         0d7kx4mr0OI5t+HO2w3HSqI366pblzHEtrl4SMq2q4tSg9eMyb2DPB2SUou5bn3Qy1Nq
         IxIoNFWcihiHcdaAoMDUO+7LLMWgkU0wf24XGOYQV02J9OAcZaJGSajIB33OmZcwo/sO
         R3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690127067; x=1690731867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BIGQzcEDCZaYOnIGGS3fLedLv4pwiu2q8pxnygm834Q=;
        b=dMuPQvMr8jHfOGxl3Oo0Jk0B4SFu+aUXdaIxBMSLV5FR3EG0+s5bDmCc38mGDrKkYh
         vyJ7OjBFDKmovmNKqsdrzvI8HZBD5Q3wNfFKtCxfpi4KNNKa1/S72iw64wUPH1CPD4ue
         LCaMa8oFA0PsqVCZDzVBZVSEDX2A5cFeZGyHVmkVqhOnNixUUM3NKo9n0ENr7/lbs56Z
         QuC58X5XiIhM5mZCPsmE9UT4exCvdX1MIPspBzo7g1DIkfwhD6YZn/WNOYthuTXw9k0L
         wvFfGo20fcUUDKGAk/szjbK4vecOBl5aMhbMP0msUX1GmL2odq8GTYUHrdEFrpP2pMCK
         IfpA==
X-Gm-Message-State: ABy/qLbH5Vn8qmfXlfM8fTf58qXGa7waEHawd4cCuvpLVjpFQGSvjv6g
	ycSmGKgiD6kzcwVGwmuH8/RHZJxonOo=
X-Google-Smtp-Source: APBJJlEXa4KBtB1r0JiQ3UGett38RMmicZUIBaD2xGHcjQ7BKkgOB85yjkNrXBPYGNX0KKW+63T2HQ==
X-Received: by 2002:a05:6a20:7493:b0:138:68b9:138e with SMTP id p19-20020a056a20749300b0013868b9138emr7530566pzd.8.1690127066426;
        Sun, 23 Jul 2023 08:44:26 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:9ac3:5615:a7a6:3dfe])
        by smtp.gmail.com with ESMTPSA id w6-20020a63b746000000b0056399ef039esm2814079pgt.77.2023.07.23.08.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 08:44:26 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-urllib3: upgrade 2.0.3 -> 2.0.4
Date: Sun, 23 Jul 2023 08:44:15 -0700
Message-Id: <20230723154415.3967219-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 15:44:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184757

https://github.com/urllib3/urllib3/blob/main/CHANGES.rst#204-2023-07-19

2.0.4 (2023-07-19)
* Added support for union operators to HTTPHeaderDict (#2254)
* Added BaseHTTPResponse to urllib3.__all__ (#3078)
* Fixed urllib3.connection.HTTPConnection to raise the http.client.connect
  audit event to have the same behavior as the standard library HTTP client
  (#2757)
* Relied on the standard library for checking hostnames in supported PyPy
  releases (#3087)

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-urllib3_2.0.3.bb => python3-urllib3_2.0.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_2.0.3.bb => python3-urllib3_2.0.4.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb b/meta/recipes-devtools/python/python3-urllib3_2.0.4.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-urllib3_2.0.3.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.0.4.bb
index 64b21db86d..0abd2adf65 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.0.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "bee28b5e56addb8226c96f7f13ac28cb4c301dd5ea8a6ca179c0b9835e032825"
+SRC_URI[sha256sum] = "8d22f86aae8ef5e410d4f539fde9ce6b2113a001bb4d189e0aed70642d602b11"
 
 inherit pypi python_hatchling
 
-- 
2.34.1


