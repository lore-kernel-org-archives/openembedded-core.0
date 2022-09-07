Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117F1C6FA89
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 14:20:55 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web09.8323.1662560451147765112
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:20:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=vebw1Vcx;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id p18so14701883plr.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=2WUmndzMAz70tLK20NP6krGxqJYhxlzWekVncW9vDng=;
        b=vebw1Vcxnj0x/a89JtSDWNuLnfNMASEIsUvqZny2fVM8fDjcY8RQzruOkNEh7AnLC/
         JfRZB448hk6JMVbExnYlY2XGFKdnYChAgs5guU9gs2Bv6yzdDx0fExSp1mMwazu8hzew
         zZIEBD3/6iAnU9UXNp4vNLdApddRIxTsbWD94tCejrBun6dXG1udU6yAesH3ZjUWoBmh
         is+2C1UvUTiA2+cadMSbmVbdRwY4sVUwo36dRAveBXW8YcRTMIGEyos1SOK4nEC3DvUC
         UwAfGBCJ2hkXzojPgI9SaO7vC2zbFvkzJBvrlNEbCw0PTKAvrprbNMNf+LNIFIzC8wBT
         SZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=2WUmndzMAz70tLK20NP6krGxqJYhxlzWekVncW9vDng=;
        b=LTQPYWQcIHmZyUg7Tmcg4b8GD6SdaJ1oK+YWPBMOx7DSr4FhJpMno8GcL3adedzEKl
         K7Jze/YlpapniYhASQsNINnO0NLNWd7gIpsgpGEpHZEHKWrIigP+yaVinvdGTWtVvMmE
         T6Xt17TBwOv0EvFFMMX5h3Yu7jGUlVdjMqPnu8lYbQJtN9X8U7jcGnc4VcCj4DNFzpzZ
         fZfmBbUrV0h8DAjSawRQH61wsISQoCYyaGk0TCbxDMasGAOzZ6gJf5KrFWlGnsHHATah
         tzjIexBUP02P3d9TdPZMlLK0MOOFt2VYpsOiNTxzdwM0mGz8xjlnrJ5Yl9QuXhqyzMU3
         REWQ==
X-Gm-Message-State: ACgBeo1H6Tw73KZbraWq13XUvk/6s3dt+kzsQViQ9W70mvKS6Azy7mMp
	8kPFVwvC8m1eXk+gDYswYTtodEgDJfVz4NSC
X-Google-Smtp-Source: 
 AA6agR6aXcG9CzqcR0SKLYjpXjrycdsQAguerXiP0k+pWTivW357swpuqlEYIv2e5+G+mOBFABUTwA==
X-Received: by 2002:a17:90b:4b49:b0:200:a103:12a5 with SMTP id
 mi9-20020a17090b4b4900b00200a10312a5mr9135185pjb.131.1662560450130;
        Wed, 07 Sep 2022 07:20:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x13-20020a17090a1f8d00b001f510175984sm14776198pja.41.2022.09.07.07.20.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 07:20:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/24] vim: Upgrade 9.0.0242 -> 9.0.0341
Date: Wed,  7 Sep 2022 04:20:07 -1000
Message-Id: 
 <b6eb009351d2bb04ae7ea828800e0e1b6934213e.1662559557.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662559557.git.steve@sakoman.com>
References: <cover.1662559557.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 14:20:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170401

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Addresses CVE-2022-2980, CVE-2022-2946 and CVE-2022-2982.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 01c08d47ecfcc7aefacc8280e0055c75b13795b2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 5b95ab2625..33a8299243 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0242"
-SRCREV = "171c683237149262665135c7d5841a89bb156f53"
+PV .= ".0341"
+SRCREV = "92a3d20682d46359bb50a452b4f831659e799155"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


