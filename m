Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0733C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 21:09:56 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web12.105.1635455394949251164
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 14:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=brmHxig1;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.169, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f169.google.com with SMTP id n7so12967586ljp.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 14:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KU/KxDgTpjZJwDS/i4NpMF+ViRmf45Z5Xw5RXaYGnUY=;
        b=brmHxig1/qH2Q1kYKyrqWaWiOkEpyZw8RJyvqRRv3QUdcvirxRhdiXdBBhgcJI7lhD
         UCIKGreO57Jz8KZLA6isGzMcyTmg7Y3wWFps76M1rDTys8zbbqW8HGZupzjzTBVvcdBT
         brNOjAvN5a0ihfK5ssIATtkdID4tcSodyPjNy4Y2m1HeZznljOc/qxsj501Ul7Psw6lD
         NnzGQK4mqO+30C+f5pvuNdVTC7PGLVoZodasLLX2fEqENKoGS1wu8pPDx0+xpiEHTam9
         jyMH9/pzXC8v2wcvuzw8mfYd4l7czpx7X7G9bUVRdYvhvFp2UOzFRGmsMg7UqRv2uP4b
         4hFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KU/KxDgTpjZJwDS/i4NpMF+ViRmf45Z5Xw5RXaYGnUY=;
        b=nqDLH+BeWd3Lm47iojJTOI1Unnm/ElyY9sY1yABWMgFpSvnX0zXWIzTsi4b4666STl
         9P5ayu4ZFzfqv0Ge9AgKjwDkOJYqN4azZ13CSfgOgqxetXpBzVZ3gGjvAV9ULmPzsdRZ
         nRVZGGgyU6I/6MiET8e9eludBtH2GyWWdzWBH03WouQGtQpPtF9ekoMV7rqemOQqYbpQ
         WKxzjDKuHY627QU+NQjP6/H3bbX4z3/80JW4sFfx9qlNnhE/LiA22X2O3pFjGABFHNEe
         Dhhu4V/uE7Bvihp1yefeDajSThNWJ4bfI4KVKCMdz7dK5Gw79C9SP/+cQHBq8FJoaMvI
         ZLXg==
X-Gm-Message-State: AOAM533SA1lPot2oC8AXaK0Wl9LDuV/b+rA9sx1sZbn2ncAl/XIxN6TZ
	puaaOh9Nx/SFSupnTPn/f7Cg1v/lhH36dxsK
X-Google-Smtp-Source: 
 ABdhPJzEK6RQtrqqFzXVVAAEy/2DjeUsq/Cax3gz9aCVFT4WY4tSz86tDy+HFVEiFivmUo3YzwkEhw==
X-Received: by 2002:a2e:2f13:: with SMTP id v19mr6898364ljv.316.1635455392253;
        Thu, 28 Oct 2021 14:09:52 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 t2sm420371lff.165.2021.10.28.14.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 14:09:51 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH 1/2] python3-protobuf: update to 3.19.0
Date: Thu, 28 Oct 2021 23:09:48 +0200
Message-Id: <20211028210949.1273230-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 21:09:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157606

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-protobuf_3.18.1.bb => python3-protobuf_3.19.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_3.18.1.bb => python3-protobuf_3.19.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.18.1.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.19.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_3.18.1.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_3.19.0.bb
index 8ecb3ab6e..4ef51c6c2 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_3.18.1.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_3.19.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=19e8f490f9526b1de8
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "1c9bb40503751087300dd12ce2e90899d68628977905c76effc48e66d089391e"
+SRC_URI[sha256sum] = "6a1dc6584d24ef86f5b104bcad64fa0fe06ed36e5687f426e0445d363a041d18"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.25.1


