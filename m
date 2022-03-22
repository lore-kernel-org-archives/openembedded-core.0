Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DFC3C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 15:28:01 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.11333.1647962880939646165
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 08:28:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W0ctJpO/;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id w4so15724207ply.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 08:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=otBEY2LcglByurvbeaeFqDuTo5BAUAEVFSrTgkYf0bo=;
        b=W0ctJpO/E2qx6/JvMpGIFqhho5f5Q0nLxJT50EwHnXKX+0DXmp3ieplj74SCkDX3eQ
         aFhZVAl9nr8ArBzaLJoJ2ecNbGqX3kQA2cl3nzrOJfreqjpAqdY8LUoKut+E1D5JFCUw
         FwKnWWES1uC5h37B2bPN63dkq2xkOdfSM0a7RlSRUR4lmRfqk2r41C7B1YDkgxQ5ar4U
         18SwNC+BOKiYI1BNX17kvoyXI381Bs241arvNUGHzRWXVkNxxstFMw1o8dh8Uv2h7IOv
         CHl3H9ycnDTbVsrQWtQPbCjqCvlegpxXOpg5/kY6a3xWzjAxXizq+I2kObKytfcROJIw
         fjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=otBEY2LcglByurvbeaeFqDuTo5BAUAEVFSrTgkYf0bo=;
        b=XVELkpjXxKMjAucjLeXXx3D4PshOcXcz4v1TgQfaG5sMIRSE8t/FKomUjCIihgrw2N
         0AoHoIPWgJtenb4l/oShuwDeQgK/2DCGpXVCoiF68uFR9x6z6zirWqQp2rdRUpyYNPEy
         TH3cz5cr3AFpADQ1httomJielzgyeV/PEy8cp6uLljKZrYMpEh9J6B/XbSj9lHV6XEVS
         V3+YYF6fZ3Jo+v7WtvVV8qF6ulIGlGYwgUxhNd4xnzKxses2e1ta9wm0XdJrbHQsSWt4
         aVXVqfHLjvqx84TUv9vUU57hO+b2uMeSEUWlNjEFDijs0Va0haBiKFQagIQuZkp/s9ml
         ESIw==
X-Gm-Message-State: AOAM533w5bPgd9tj1+u5ffxf/cuHRHcuiwcv6nUQT62spGhTXbDoY/Dy
	HZ6Rs9tVctFpXD+FzIJE2A+pYeSRIng=
X-Google-Smtp-Source: 
 ABdhPJx5mwLBfmtkf1Yr7QE36eeXqti2i2KcqX6x0yg8YI7nkOaSokMMtJGGq01IAST6Rg0OtBvtnw==
X-Received: by 2002:a17:90b:3909:b0:1c7:9bc:a735 with SMTP id
 ob9-20020a17090b390900b001c709bca735mr5792996pjb.151.1647962879392;
        Tue, 22 Mar 2022 08:27:59 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:1b90:16da:f285:205c])
        by smtp.gmail.com with ESMTPSA id
 y34-20020a056a00182200b004f71c56a7e8sm23601224pfa.213.2022.03.22.08.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 08:27:58 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-pytest: upgrade 7.0.1 -> 7.1.1
Date: Tue, 22 Mar 2022 08:27:52 -0700
Message-Id: <20220322152752.287729-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 15:28:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163554

Changes in 7.1.1:
https://docs.pytest.org/en/stable/changelog.html#pytest-7-1-1-2022-03-17

Changes in 7.1.0:
https://docs.pytest.org/en/stable/changelog.html#pytest-7-1-0-2022-03-13

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/{python3-pytest_7.0.1.bb => python3-pytest_7.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_7.0.1.bb => python3-pytest_7.1.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pytest_7.0.1.bb b/meta/recipes-devtools/python/python3-pytest_7.1.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pytest_7.0.1.bb
rename to meta/recipes-devtools/python/python3-pytest_7.1.1.bb
index 19eb9b15e8..1cb2fb01c0 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest_7.1.1.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "e30905a0c131d3d94b89624a1cc5afec3e0ba2fbdb151867d8e0ebd49850f171"
+SRC_URI[sha256sum] = "841132caef6b1ad17a9afde46dc4f6cfa59a05f9555aae5151f73bdf2820ca63"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.32.0


