Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA67CEB64DC
	for <webhook@archiver.kernel.org>; Mon,  3 Jul 2023 08:52:50 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.23055.1688374362925801021
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jul 2023 01:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=BcUpatFV;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: ticotimo@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3a3a8d21208so559720b6e.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Jul 2023 01:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688374362; x=1690966362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LG1yJIOfhNpsnKW0RPUqcJX+rZTwimkIco5C+xoNK7s=;
        b=BcUpatFVpCpjdT0PmCXC8KMkfd5iDz5rO1FVuyTGmUo/TDNmW7J05yV2RjGyFVROTY
         RwwOI1CpAW9zDzItkEpfygaccvNl63kAzLokdM1Dmcks/iuD2wEL94DbslwisQtx8d1W
         pW3YlM5QIRBZtnhcJKrM/utZ3vYXn14uJsSREsVDCVSN6zqsTzDJH8RI4vkLwokO218Q
         /Sk6Q/FWS0iECQsyTMkU+4TkDajVRWUBNrQYBNTS/ENrvP7P+iwQiEAQ101KCzwEuI3U
         8ZZUCzv1BPY5UYETaKZtoFXMjtAeyD31JRm0mKu1YWDXxpHyQ2uu7XVuEicDFADdES/N
         3Cpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688374362; x=1690966362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LG1yJIOfhNpsnKW0RPUqcJX+rZTwimkIco5C+xoNK7s=;
        b=hIsL0qRh8icD7YCzSXmTUD31+8eMiINGt+MMAAPlZQrZWs8TS85WQM+L36/3XAOy5W
         snR0ruaufaoTmqorGIuDmKq7yTDwf/tmq+rJvNySeZEqMrR14RpfduKYCi89755wYnZh
         M2nipHJVsTTRzWY2DbcxgIWlwpz46r0v/DPsnQyY9px8vGS3C2Xk/ZQyLlZePuql6x/1
         P+WGwVn5aybpIq6Gv82Hi/JHXgEsbdjhBtdP1Q0/7jUsArTXkZlwKmm/QV3uwnj64Pxs
         qAVEp71rNwRpCLqC1h4JF3jXpon1Z+mxeMA3X3V3pytdY+PAdYG9yNX6WMWpKFf5ZCnF
         ndig==
X-Gm-Message-State: AC+VfDzqmBdpfWjuqRvVCvFOm3yfzcK3UObvrWgUxLPrYfmsr+Bt/ivX
	vRulq5nvVJbRIPXzZNRahOteT9ZSKxbI19fT
X-Google-Smtp-Source: ACHHUZ5acwW1pga64EsVCtZrGOhoSvSC4TLXscNhMM8Jw8j4illUZaxI1fW68dSKw7jKsQpxffw2LQ==
X-Received: by 2002:a05:6808:9a8:b0:3a3:61df:da with SMTP id e8-20020a05680809a800b003a361df00damr9542823oig.53.1688374361632;
        Mon, 03 Jul 2023 01:52:41 -0700 (PDT)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:48e3:fac:52d:29ab])
        by smtp.gmail.com with ESMTPSA id o68-20020a17090a0a4a00b0025be7b69d73sm16458147pjo.12.2023.07.03.01.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 01:52:41 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-pytest-subtests: upgrade 0.10.0 -> 0.11.0
Date: Mon,  3 Jul 2023 01:52:38 -0700
Message-Id: <20230703085238.3130065-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jul 2023 08:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183799

* inherit python_setuptools_build_meta since setup.py was dropped

https://github.com/pytest-dev/pytest-subtests/blob/main/CHANGELOG.rst#0110-2023-05-15

* Logging is displayed for failing subtests (#92)
* Passing subtests no longer turn the pytest output to yellow (as if
  warnings have been issued) (#86). Thanks to Andrew-Brock for providing
  the solution.
* Now the msg contents of a subtest is displayed when running pytest with
  -v (#6).

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...t-subtests_0.10.0.bb => python3-pytest-subtests_0.11.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pytest-subtests_0.10.0.bb => python3-pytest-subtests_0.11.0.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb b/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb
rename to meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb
index e1f2a49d31b..ddba0318800 100644
--- a/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb
+++ b/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb
@@ -7,9 +7,9 @@ BUGTRACKER = "https://github.com/pytest-dev/pytest-subtests/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=242b4e17fa287dcf7aef372f6bc3dcb1"
 
-SRC_URI[sha256sum] = "d9961a67c1791e8c1e32dce7a70ed1e54f3b1e641087f2094f2d37087ab7fb17"
+SRC_URI[sha256sum] = "51865c88457545f51fb72011942f0a3c6901ee9e24cbfb6d1b9dc1348bafbe37"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.30.2


