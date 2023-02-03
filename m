Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E8AC636D6
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 17:51:01 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.17897.1675446653927311914
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 09:50:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p9uzV5n0;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id v3so4141268pgh.4
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 09:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b22RYdV1zzNT1ujQJgX0QtdrDLFHT7SuPjc6nxgYdCs=;
        b=p9uzV5n0RdjKLJhFKo1PqijbE7zjFvPpNSnwlMTcVD7M0XLkNaFBPx6MtWRdh+L60i
         Lpuq6ZcvZ+GD7vK50usDoGDfK0dwfzANS4pa4tHV9b4QUvIVbARVeJOeOO38EMzO3uJo
         B+R/vu3nNl7xWwbYpi1BhD2TH5qiJbMaekaewRPmTYSTHHRx0n5zGW0gzD+iO3H6iS5U
         oETKYsgedX/HdRAWNKuuXPf9xdAvpXdLhPZDuCDEAQZOMjDqYimM+0yvVUMuZaGCPftM
         dtvAvatNEnuOuP3ZyiMo7CoQIRWmGhQ/9WKTklt2qAIqGgYJ7cEX6MTT5u3jmMQp7Sr8
         RIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b22RYdV1zzNT1ujQJgX0QtdrDLFHT7SuPjc6nxgYdCs=;
        b=AXSBXl8UvktLSHsuAY4pxsHAXzTyFdgN1dZ12mfQRPI0TCEMhV7WrZFJAL63X7bjDQ
         RnxwvLNzAW7e7cpO3mwdJX5yZgF1XEIH3dp35lS6pscLbBwmfE2GL6IzCuPqq7pdqHp5
         7K7hUT3p9HRl5gZYvoD+77DupKnjTvBPn5fXK6sOY3NqSlIRprIYS23/KlHz+UDXlAKG
         px8M5Yr9GJqbX8K8jp569j9UyXvSgCPfm/MF7FGPwvgylCKJczFsflOfiOGRhlKD/h+T
         e0q6iLYK58XoKHnc/YSTdR9pDGoit0gvDnfR2e//eAtOFQyMt0/Y0jC8bUcMdcOyQlmJ
         Xerw==
X-Gm-Message-State: AO0yUKXwYO/11xct8499U2F83inuef0GawNq+rwzw7UP+TasV60R14yg
	qszLZy1Ov4BWEpnPZu+/SF2ozDyBh9w=
X-Google-Smtp-Source: AK7set9XSMXiYwGwPVIuWUWmHeYhan22JSCRBfYaM3xSPPBLu57YwwWuowJYFUbz5Jh2huFUSZ2GEg==
X-Received: by 2002:a05:6a00:2790:b0:593:f191:966 with SMTP id bd16-20020a056a00279000b00593f1910966mr10513613pfb.1.1675446652877;
        Fri, 03 Feb 2023 09:50:52 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:46a4:f9f7:31dc:7e2c])
        by smtp.gmail.com with ESMTPSA id o11-20020a637e4b000000b0046ff3634a78sm1712880pgn.71.2023.02.03.09.50.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 09:50:52 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/14] python3-pytest: upgrade 7.2.0 -> 7.2.1
Date: Fri,  3 Feb 2023 09:50:23 -0800
Message-Id: <9e21e15e80b8b967fde71c370c9f20fee18559b2.1675446372.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1675446372.git.tim.orling@konsulko.com>
References: <cover.1675446372.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 17:51:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176736

https://docs.pytest.org/en/stable/changelog.html#pytest-7-2-1-2023-01-13

pytest 7.2.1 (2023-01-13)

Bug Fixes
    #10452: Fix ‘importlib.abc.TraversableResources’ deprecation warning in
            Python 3.12.
    #10457: If a test is skipped from inside a fixture, the test summary now
            shows the test location instead of the fixture location.
    #10506: Fix bug where sometimes pytest would use the file system root
            directory as rootdir on Windows.
    #10607: Fix a race condition when creating junitxml reports, which could
            occur when multiple instances of pytest execute in parallel.
    #10641: Fix a race condition when creating or updating the stepwise
            plugin’s cache, which could occur when multiple xdist worker
            nodes try to simultaneously update the stepwise plugin’s cache.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/{python3-pytest_7.2.0.bb => python3-pytest_7.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_7.2.0.bb => python3-pytest_7.2.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pytest_7.2.0.bb b/meta/recipes-devtools/python/python3-pytest_7.2.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pytest_7.2.0.bb
rename to meta/recipes-devtools/python/python3-pytest_7.2.1.bb
index 02fc55fdb0b..85fc507dde9 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.2.0.bb
+++ b/meta/recipes-devtools/python/python3-pytest_7.2.1.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "c4014eb40e10f11f355ad4e3c2fb2c6c6d1919c73f3b5a433de4708202cade59"
+SRC_URI[sha256sum] = "d45e0952f3727241918b8fd0f376f5ff6b301cc0777c6f9a556935c92d8a7d42"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.30.2


