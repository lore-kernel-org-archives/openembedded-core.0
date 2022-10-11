Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D30C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 14:40:21 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.8205.1665499220523463451
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 07:40:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RASgWMrO;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id i3so13686488pfk.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 07:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dLf/f3GB13XbjJopwhbhYvxhahSIizrRLriXQ2LG2F4=;
        b=RASgWMrOrRns9GfjF+EvWKtaroJ+jSspMN+e8eMgqkCPkxih9m9Amg40Kz6I9RxbgA
         qB55tPpYTAsjYGdyFY1xC0lGQuZ/OmDilzPkx/BnwdXkO12M6XNvOAmyrPW9iOiDR7NR
         vCrk4N3ms/QFerKCA6ffwZnG0SvjI4Hr+LjmgMMlWG3U9t0PV4+lYeB+5cnDPPNZP1t0
         /2XasiI9IrEy652VcHA7qoNHPCZUu7b37qqZU/ybIDKzwOvxCa+U8W1rf5GKaWsDrmX6
         o8MWtKq/PaGKScCeO3Z0GKUWd8vVMm4h1VJ7UmpsTDh2CEHCPfSkmPQuvNt9SKHfrRxi
         QUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dLf/f3GB13XbjJopwhbhYvxhahSIizrRLriXQ2LG2F4=;
        b=BdzecUhDzprgsHmfiGpKoDWeJu2C2DTMYtnNdiEwXOn4qITzWUMrdm+iuMgUXGqHB5
         ppInvtiCBh/rjOGmvPmRtQwiwjfN0Jk8vkYKclkT0QPSwkYdY1cJgxGZb6F15sSAmHZU
         dgHDpXoi4awZulfll9XWaSBV0wRp/EDFvC9IAu96oWY0Nh+rznh+Ex0jy5kP5Rj5puRN
         F5mtlN4IWjjKLRZTu1RoJo/PbTj9DAmSccFfrOUWYL4UJl929ZYTuNjtE4cqhrcxIlhP
         uN1mapgC6j0TEdq+58yOLcdQGHUsKqonXmRObJS/NhTa1Ye6pzKwVrtTMFbzuJ+ix2ct
         HmRQ==
X-Gm-Message-State: ACrzQf3B4ocPRhQovDe1tIO9+6cvyrOR4KGlu9O8GAePb+HCG+3DabYd
	IGHodm2Dl7iWeP3O4L0E6IRtO7q8rRTEAA==
X-Google-Smtp-Source: 
 AMsMyM7T/DtCLk9R8M4kjsxy/jnFvY4LZgfkg9s+62+7xShKaAQfjHLyP/BrxuSgSeLuTEjizK9GWA==
X-Received: by 2002:a63:2cce:0:b0:434:e004:a218 with SMTP id
 s197-20020a632cce000000b00434e004a218mr20972728pgs.241.1665499219235;
        Tue, 11 Oct 2022 07:40:19 -0700 (PDT)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:ca00:cea0:5cd7:a90f:3830:fadc])
        by smtp.gmail.com with ESMTPSA id
 z8-20020a170903018800b00177c488fea5sm8870941plg.12.2022.10.11.07.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 07:40:18 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [dunfell][PATCH] python3: upgrade 3.8.13 -> 3.8.14
Date: Tue, 11 Oct 2022 07:40:08 -0700
Message-Id: <20221011144008.2808909-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 14:40:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171627

Fixes:
  * CVE-2020-10735
    https://nvd.nist.gov/vuln/detail/CVE-2020-10735
  * CVE-2021-28861
    https://nvd.nist.gov/vuln/detail/CVE-2021-28861
  * CVE-2018-25032
    https://nvd.nist.gov/vuln/detail/CVE-2018-25032

Python 3.8.14
Release Date: Sept. 6, 2022

This is a security release of Python 3.8
Note: The release you're looking at is Python 3.8.14, a security bugfix
      release for the legacy 3.8 series. Python 3.10 is now the latest
      feature release series of Python 3.

Security content in this release
CVE-2020-10735: converting between int and str in bases other than
  2 (binary), 4, 8 (octal), 16 (hexadecimal), or 32 such as base
  10 (decimal) now raises a ValueError if the number of digits in string
  form is above a limit to avoid potential denial of service attacks due
  to the algorithmic complexity.
gh-87389: http.server: Fix an open redirection vulnerability in the HTTP
  server when an URI path starts with //.
gh-93065: Fix contextvars HAMT implementation to handle iteration over
  deep trees to avoid a potential crash of the interpreter.
gh-90355: Fix ensurepip environment isolation for the subprocess running
  pip.
gh-80254: Raise ProgrammingError instead of segfaulting on recursive usage
  of cursors in sqlite3 converters.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/{python3_3.8.13.bb => python3_3.8.14.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.8.13.bb => python3_3.8.14.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.8.13.bb b/meta/recipes-devtools/python/python3_3.8.14.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.8.13.bb
rename to meta/recipes-devtools/python/python3_3.8.14.bb
index d7f6e9155de..35e9233d5d2 100644
--- a/meta/recipes-devtools/python/python3_3.8.13.bb
+++ b/meta/recipes-devtools/python/python3_3.8.14.bb
@@ -42,8 +42,8 @@ SRC_URI_append_class-native = " \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
 
-SRC_URI[md5sum] = "c4b7100dcaace9d33ab1fda9a3a038d6"
-SRC_URI[sha256sum] = "6f309077012040aa39fe8f0c61db8c0fa1c45136763299d375c9e5756f09cf57"
+SRC_URI[md5sum] = "78710eed185b71f4198d354502ff62c9"
+SRC_URI[sha256sum] = "5d77e278271ba803e9909a41a4f3baca006181c93ada682a5e5fe8dc4a24c5f3"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.30.2


