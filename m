Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD83C61DA4
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 21:24:17 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.19489.1676150649404678466
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 13:24:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=6wc9xF5s;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id s20so5708916pfe.2
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 13:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9RpWFPm6niaEz1M7ryBhmRVOapAtFqfzHswvuTGGG8=;
        b=6wc9xF5sAXARU9iQldIY8UBNx/SbDekA3PNzvnj8HHrjpZ4i2KQKeqCEJovU2VIA5X
         0Aq3QIerwYeP335L4PZLi4x4nFEinrpp6MEUkEFQmqsnMuGEIK1vmalwebaqWOwzkTRV
         HIXI1BYeZZFQIA872Vrp34jk7LgZ7sfRMwCpKX8i3PJY502Nd989xSR7SMEMz5yIgWec
         OTCCZjlO9IDhtY+lx90B+rKX6Kzjpb3w3aGmbcJRcGKZmWb4GSlPW2dDTX4Oq6p+ySIv
         mk7iFVxWDfWwIZhzraVYPMONk2a9lyPLIIoUCI6zBgySUn22GT2XZleUFYkjbNICFDTC
         sfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9RpWFPm6niaEz1M7ryBhmRVOapAtFqfzHswvuTGGG8=;
        b=h5rCJB/0atVwBnf71OhCX/QLDmPUP1VQITPZshvjdsUdzZ1flSZkeWumWTrxtOKAms
         d88SPiP4U2A7yhsUBam+LK/1IfSI6AQnTAwQkT/aWfmZF37TRTN5OwJY9SNUZ9J1Q3Yq
         yf0oT0BoNpi7Uqso0LjVjNquqRgcLphVg5DN6H3MLOdy9PBBfTIUTHOJua/oczCMTVOh
         I2g9KGE0fMyAuFJiAKp6O88nD1hjAbtPlCYwa8lNT94RqSOpvoVWieXn4gRI+cRr1hfj
         yzVVTHwArM0aMwRimsTYDEeiVdofRNrRmFkCGWDfhNlWxHqvLHn2riEJJFqdE4o5v2Cn
         6rhg==
X-Gm-Message-State: AO0yUKV9KwFEffrXGs81ywVw4hJG/yJu+uVQmmLOc5azNt0Qj28eEu/s
	tBOY8FI5Wl1bRtQ5dcL7TFFA8UHvGQryQ3smwQs=
X-Google-Smtp-Source: AK7set/mC17Qtxy+SiiAS404nVMqo3gPSzEO/RDhFoMoh+gzc3qfp6oJZtzb22YY3JQVoSzhPSeuCg==
X-Received: by 2002:a62:79d6:0:b0:5a8:ab3d:3fe with SMTP id u205-20020a6279d6000000b005a8ab3d03femr476149pfc.16.1676150648394;
        Sat, 11 Feb 2023 13:24:08 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id v23-20020aa78097000000b0059393d46228sm5398595pff.144.2023.02.11.13.24.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 13:24:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 06/28] python3-pytest: depend on python3-tomli instead of python3-toml
Date: Sat, 11 Feb 2023 11:23:29 -1000
Message-Id: <04e31f0035ad29afc3cdcf9730cd76cd725b8a20.1676150527.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676150527.git.steve@sakoman.com>
References: <cover.1676150527.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 21:24:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177016

From: Arnout Vandecappelle <arnout@mind.be>

Since version 7.0.0 [1], pytest switched from the toml package to the
tomli package for parsing pyproject.toml configuration files [2].

This change is not immediately noticable during tests, because the
toml/tomli module is only important if a pyproject.toml is actually
present in a project.

[1] https://docs.pytest.org/en/latest/changelog.html#pytest-7-0-0rc1-2021-12-06
[2] https://github.com/pytest-dev/pytest/issues/8789

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3-pytest_7.1.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pytest_7.1.3.bb b/meta/recipes-devtools/python/python3-pytest_7.1.3.bb
index 373f7f35fa..9710242655 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.1.3.bb
+++ b/meta/recipes-devtools/python/python3-pytest_7.1.3.bb
@@ -26,7 +26,7 @@ RDEPENDS:${PN}:class-target += " \
     ${PYTHON_PN}-py \
     ${PYTHON_PN}-setuptools \
     ${PYTHON_PN}-six \
-    ${PYTHON_PN}-toml \
+    ${PYTHON_PN}-tomli \
     ${PYTHON_PN}-wcwidth \
 "
 
-- 
2.34.1


