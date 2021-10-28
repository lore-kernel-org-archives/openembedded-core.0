Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC70C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 21:10:58 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.111.1635455456998329153
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 14:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=i3UJIxAc;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.45, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f45.google.com with SMTP id bi35so16304596lfb.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 14:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z/bif4ZE33rtDdsixQHm/2dHp9p1y8SfREBzdNt2N8k=;
        b=i3UJIxAcSy+j1xVSO522YzEPAk57eQfLIP1EaxwIiuJ0hkAf7PW2/U90J/+bNMW4l1
         V1/cQr92WHjVjLL2JbTpiqeydX8rcH6Nh1N+D6+CeqWsDEUIGOjQzgk0xMUouRqKw+VD
         b9ib36GDSArttk8D24RYvlmD0nd3fP74a0cFfeqy+j5DQ2Gv+/8xWq7o45P5hxZpmzI6
         2Xawhg+TecWzTBohg2cbD6J90khGO5emg7VywY9dmrtfra17UPHEy/NaUMec6ba/YE54
         dDzSqrjCcRo3ub2UuywC5188quGDi1eu6iGH9wYoszzHySG25OSw+Se0fXp58FwnBHQa
         we6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z/bif4ZE33rtDdsixQHm/2dHp9p1y8SfREBzdNt2N8k=;
        b=73MYrb5VxONmK9QuBV4jAjiVi19U/FoWI1oie5ZKFbJGAnj/fa/a2NXB0bzjR55XmJ
         deiHYm4ywUzpj/A7ID6eBRmaaH3Zy3fyG5OTQ1TGPytjxHklRe7E9Vee+J7sKwIT085V
         Qx1EhSBDODtvkUtio+uEqJFa5QoTL/v+cC+w1LCL8AxSd0AaTy/euPkbKxW12MJXX4TO
         WJm0uw8Fm74+5CqXlcoVFsYiJtM6Mazb2kzRxHIMojxvWatAck6DhkYjxe6WUffp63lF
         qybuxGywgvspKnBD0/rQHJARvVjB345Thexw6UjUu+iz2Kbb+NZUSzxZ1dyeFnYjTmik
         5zOQ==
X-Gm-Message-State: AOAM533zqV0V+b0h8Ng8ZmBvMOi+aTSTVSjx+Dlc89Zo9p3cJS0zL1Gk
	IdgA1AvEnZ4SXoqxBqE5iKsYYUbGsJQS7wBz
X-Google-Smtp-Source: 
 ABdhPJzzys/Dj5VJXi6enY5ircY1XjYpF4cKXPghm4ztnZsZmEjlqzSw7oW78u8GroephZF8K6tDAQ==
X-Received: by 2002:ac2:47e4:: with SMTP id b4mr6537333lfp.276.1635455454932;
        Thu, 28 Oct 2021 14:10:54 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 c19sm383009ljj.130.2021.10.28.14.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 14:10:54 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-imageio: update to 2.10.1
Date: Thu, 28 Oct 2021 23:10:52 +0200
Message-Id: <20211028211052.1273629-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 21:10:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157608

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-imageio_2.9.0.bb => python3-imageio_2.10.1.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.9.0.bb => python3-imageio_2.10.1.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.9.0.bb b/meta-python/recipes-devtools/python/python3-imageio_2.10.1.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-imageio_2.9.0.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.10.1.bb
index 2783669b4..ea9ed1869 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.10.1.bb
@@ -6,8 +6,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7b9bbbb543b6af3e6b53f9b7fb68f71d"
 
 
-SRC_URI[md5sum] = "d22757338542e3742a335cea6210e419"
-SRC_URI[sha256sum] = "52ddbaeca2dccf53ba2d6dec5676ca7bc3b2403ef8b37f7da78b7654bb3e10f0"
+SRC_URI[sha256sum] = "1fbf909bac3f07faabd05a3f71b3c49428709c3c55f43770a3f76e0eb1b525d1"
 
 inherit pypi setuptools3
 
-- 
2.25.1


